Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id BCB967680A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 14:45:01 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id g62so160069268wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 06:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=nxvV0c+AJClIEPoA/zdCxp3fLLNOmXR4moLfa1erd7U=;
	b=M6+kFYZr/NF5voMNAgl5uStuZS3HB8Z9csGiHQsdxdzw9PuBUXb234IdZs3BfvMCpG
	+MgupwvYG/ebOl36K0nteUnJfBbYnDLCbgZu73s5uRNBN5YIWnIrU4YgQJUZLudxBb2p
	HhurQnSOeouB0bnfSn3sHNjbPGjO1ucILojqWGecYzzGmeEGfdHmt1BEJbSBIXf6YB9b
	B5M6D+LnRzu5ZlrnUlPjsaKgOS5D6PyQorQulvxTpwlElR141QevPT2x/PRJTcPNTZUz
	AgdZ+mNfRS8Z+7vAE4/R5VXL3vgoi0Fj6MUvbIqn1Ixz/x2r1orkkFEisVErOcFFHq6O
	v+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=nxvV0c+AJClIEPoA/zdCxp3fLLNOmXR4moLfa1erd7U=;
	b=GZwr18YKSzBmPrrAtVKVI5NB9fRBEaEDcD11Oob3sa2nXHtpVADQgUQ6ieKWwgIrto
	vY2Kjlth1QNDI0X1b+G2PUJIiUbe6YP9VQdc1VaxjmLctaEopTJzkwt41iw1RDjEP3Y1
	5Nv7YtHiFz3hxab1hKrTmuD4qvw3v25jWt66tu99ippysdRtzc/ypCnisP/p3Hza1DrU
	vbgcN8UCCkwa/CYdAF1I7YASy2GX5WbblZIDDQ1mdAucS7ECqhKv79bWfh0WtCgB8nMk
	eF2o6YwvfFDCyqHOPdrG+rP7XWbkK7z0c6GE0iWxPkeirjnwUoxyELlY4YL7iQrYE4G6
	WDcQ==
X-Gm-Message-State: AG10YORXHig8wz0CYP7XYETkF4vYbduR6OpA/mTu+D1d8z+Ebb7ggaibJyqZM0GgUyQKWA==
X-Received: by 10.194.48.111 with SMTP id k15mr32190163wjn.103.1456152301880; 
	Mon, 22 Feb 2016 06:45:01 -0800 (PST)
Received: from localhost.localdomain
	(ip-95-222-156-232.hsi15.unitymediagroup.de. [95.222.156.232])
	by smtp.googlemail.com with ESMTPSA id
	e19sm21461574wmd.1.2016.02.22.06.45.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 06:45:01 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2016 15:44:26 +0100
Message-Id: <1456152266-31155-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH] mesa: add missing space to RRECOMMENDS append
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
X-List-Received-Date: Mon, 22 Feb 2016 14:45:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes errors as:

| Missing or unbuildable dependency chain was: ['mesa-megadrivermesa-megadriver']

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 5ce96dd..442479a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -121,7 +121,7 @@ python __anonymous() {
         d.appendVar("RPROVIDES_" + fullp, pkgs)
         d.appendVar("RCONFLICTS_" + fullp, pkgs)
 
-        d.appendVar("RRECOMMENDS_" + fullp, "mesa-megadriver")
+        d.appendVar("RRECOMMENDS_" + fullp, " mesa-megadriver")
 
         # For -dev, the first element is both the Debian and original name
         fullp += "-dev"
-- 
2.5.0


