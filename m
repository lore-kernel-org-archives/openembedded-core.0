Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 37ED27705C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 16:01:11 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id 4so17118317pfd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 08:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=AUw+a643emLYuGgB5qifqtu8btS3FSqh36gOG4CAu2M=;
	b=P1HViS0vnybvnh4QN1HU7Rd3j7+5y5DcLp1rdDupRmnOwZRlBZ24s1IBtjBxXH5qv1
	5QqX0glpyp96ikDOLfT7Z6vWFgu7efNWmdJ/R1Q0Ht7nhN5P1cL+PC5C0AyNv9vZ0MCP
	goaVFnzbnQm0tJC1LhYOlvZ8EkkRp3fghAQY9KyZBbTVFiELK4LjiEXK2G0m1WZU8s1e
	+/4L5o72HXlvRuMIcbuPtSeeJYpr57+Xau8GJEKxDuc0LVw92yuDsYacdtH16/qkyqOS
	MCwAfuTXeUSsIip+qjucKy/fwbaSbR1jAqwoLjFnsy2RfXI72ilYxPwT2jwfhLws6RPQ
	DjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AUw+a643emLYuGgB5qifqtu8btS3FSqh36gOG4CAu2M=;
	b=ekNuy0jmZkorxou1Xxz62FN1z9OUx3DIU1/1N5N8vF/6ad92VHDYdj90KxQKDoX0+o
	SFNc2Xanh32vGeEN04JGNpx+dW6EkuUixgadHynU1pCC9J6p7sBbTZxDalHIoIwIr9Ce
	dqS402cajvpNCS7zQqOp1di/XCqydNdl69I7AM7BolWML5WVE0qx19myE1iDWXSagRdH
	dbmMmdD1IJXuH6ZKQN2mrSHOvzl6DBcjOJwZ7pb2vmLI/fP1olRH/jGSK+farjsT7Rj1
	DAKB6DoWdBHypclt0ArEDtMnl3Fk1AmPls/hQ0sXg5kniAEwGXKTOKA3QpIJbKiJ+P/3
	dFAw==
X-Gm-Message-State: AD7BkJKO2FUgXrxZzinyESMF8OZZoHa44Ejz+z5Y1Un/PC3M5gy7GElz6/XB4d2OUXmINA==
X-Received: by 10.98.65.203 with SMTP id g72mr4726163pfd.138.1457020872181;
	Thu, 03 Mar 2016 08:01:12 -0800 (PST)
Received: from nathanbox.home.gateway
	(CPE-123-211-78-35.lnse4.cha.bigpond.net.au. [123.211.78.35])
	by smtp.gmail.com with ESMTPSA id
	y21sm1494993pfa.85.2016.03.03.08.01.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Mar 2016 08:01:10 -0800 (PST)
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Mar 2016 02:01:00 +1000
Message-Id: <1457020860-15422-1-git-send-email-nathan@nathanrossi.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] feature-arm-thumb.inc: Fix thumb tune override warning
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Mar 2016 16:01:12 -0000

Fix the quotes in the bb.utils.contains feature check so that the call
results in a boolean value instead of a string, which allows the warning
check to occur.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/conf/machine/include/arm/feature-arm-thumb.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index dfb9d7e..1faebf7 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -13,7 +13,7 @@ ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 't2', '',
 # some recipe explicitly sets ARM_INSTRUCTION_SET to "arm"
 ARM_M_OPT = "${@bb.utils.contains('TUNE_FEATURES', 'arm', '${ARM_THUMB_OPT}', 'thumb', d)}"
 python () {
-    if bb.utils.contains('TUNE_FEATURES', 'thumb', 'False', 'True', d):
+    if bb.utils.contains('TUNE_FEATURES', 'thumb', False, True, d):
         return
     selected = d.getVar('ARM_INSTRUCTION_SET', True)
     if selected == None:
-- 
2.7.0


