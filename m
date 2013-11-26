Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2A2626D838
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 19:49:32 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id a1so3554641wgh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 11:49:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FsV5oN1ePturTT5gBiKUkAojwvHkqQSYIMWbw4ZBPPM=;
	b=YN+t04eDn4gxM6ID/pPOGEsO6u535B3sZJOn0kSwmNEZ+WuoyiyeBhfYfMRxGyJHkj
	3kkrPrAiGsrIKkDdJ4sOp5wmIZlyNxIwxzHhdk6+m8w+S9WNH43+5hAaTHyb4uNhs6wX
	2MPKPvim+1Jx+z7FluCqekVhGHJQtbj2fNvSL+8V3woIqUWWwVChtmxhc11kH69PdsKE
	uSuQMWlHNS0wgAy5PwhRKaW2x3hGpb35uj7FA7jxN263B9Yhg+JBxlU3nf3QkBZdyJlb
	wLFPR+vL17KFh6loHOK45G7ajmBSTOEUOoMeRlKyngH1JJrex0rL5K2CYsZig03xHt7E
	HP+g==
X-Gm-Message-State: ALoCoQksOkrLKO48UOaazKRumiGKHxMy57eQ4ZBR0xuWqJzc6Pt8uagLWQf8PMQxSi6Z2D+oy/lx
X-Received: by 10.180.79.227 with SMTP id m3mr19915195wix.2.1385495372256;
	Tue, 26 Nov 2013 11:49:32 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id f11sm46512647wic.4.2013.11.26.11.49.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Nov 2013 11:49:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2013 19:49:22 +0000
Message-Id: <1385495362-20784-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1385495362-20784-1-git-send-email-ross.burton@intel.com>
References: <1385495362-20784-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/4] clutter-1.0: upgrade to 1.16.2
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
X-List-Received-Date: Tue, 26 Nov 2013 19:49:33 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/clutter/clutter-1.0_1.16.0.bb |    8 --------
 meta/recipes-graphics/clutter/clutter-1.0_1.16.2.bb |    8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.0_1.16.0.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-1.0_1.16.2.bb

diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.16.0.bb b/meta/recipes-graphics/clutter/clutter-1.0_1.16.0.bb
deleted file mode 100644
index d9dfa59..0000000
--- a/meta/recipes-graphics/clutter/clutter-1.0_1.16.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require clutter-1.0.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-SRC_URI[archive.md5sum] = "873c97b825c366e13e1f281e8e1f549b"
-SRC_URI[archive.sha256sum] = "a213c7859051d6d19b5550c7e433757a35aa8e2b61a43d2eae83dd87912ea8ae"
-
-SRC_URI += "file://install-examples.patch"
diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.16.2.bb b/meta/recipes-graphics/clutter/clutter-1.0_1.16.2.bb
new file mode 100644
index 0000000..584f9d0
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-1.0_1.16.2.bb
@@ -0,0 +1,8 @@
+require clutter-1.0.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI[archive.md5sum] = "976614a2f7e60af088a0a460fe9d267e"
+SRC_URI[archive.sha256sum] = "0cb7e88c80f43fc7fb869fc6d34c42e98aa1a0ef7aa02e6aeef1b099ad33df42"
+
+SRC_URI += "file://install-examples.patch"
-- 
1.7.10.4


