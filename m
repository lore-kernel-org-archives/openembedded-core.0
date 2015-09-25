Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0A4D577035
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 13:42:53 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so21170542wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 06:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+SLklCQfw+/4WhcBkdtUeVu+I7uwpAN9rhZQpczAGjI=;
	b=gy9qHp5AWUZIeaaF9LVynnM4q7w9Xa4p1D63cjibbdU9J0lYanDo2ayQK/DKNWL9gF
	iJQywv5dWSfu5ecfdHNRjY6aLaabbsndAXmjmg0GQgWb8wKfE1xc9C6UgLOFjejJwEal
	txDNA4UDPc48g/c6h30hRKgmCjlhvoER6y5K5Ob7Ye7qXlpMoB/1h/IuHpFVZd8xKWTu
	3gGUs5QUiGTU2H+IYgJQUBQChqnfQyELfevU+tTkvHvE92OkrkRoe0TEsN8JFBfxqt6M
	gf7vs7wlugKs+a2QQbmFHUaP/7Dlz1ngJk13OkvGl6Km0uFbR788eQTlA4OLsvgccRQv
	9GjQ==
X-Gm-Message-State: ALoCoQlg4d2eM/+QFghVc5CBud3s7jr4dc2RJV9xo+dxq1WqDDqc+VUzcZsp6gA8H1bhH8LXyxsk
X-Received: by 10.194.71.206 with SMTP id x14mr7069147wju.147.1443188573402;
	Fri, 25 Sep 2015 06:42:53 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id r4sm3313802wia.19.2015.09.25.06.42.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Sep 2015 06:42:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Sep 2015 14:35:49 +0100
Message-Id: <1443188149-23518-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] byacc: add missing patch header
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
X-List-Received-Date: Fri, 25 Sep 2015 13:42:55 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/byacc/byacc/byacc-open.patch | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-extended/byacc/byacc/byacc-open.patch b/meta/recipes-extended/byacc/byacc/byacc-open.patch
index 9160543..0058311 100644
--- a/meta/recipes-extended/byacc/byacc/byacc-open.patch
+++ b/meta/recipes-extended/byacc/byacc/byacc-open.patch
@@ -1,3 +1,15 @@
+Ubuntu defaults to passing _FORTIFY_SOURCE=2 which breaks byacc as it doesn't
+pass enough arguments to open():
+
+ inlined from 'open_tmpfile' at byacc-20150711/main.c:588:5:
+ /usr/include/x86_64-linux-gnu/bits/fcntl2.h:50:24: error: call to '__open_missing_mode' declared with attribute error:
+ open with O_CREAT in second argument needs 3 arguments
+
+Add a mode of 0666 to fix this.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
 diff --git a/main.c b/main.c
 index 620ce3f..82071a4 100644
 --- a/main.c
-- 
2.1.4


