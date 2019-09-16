Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53])
	by mail.openembedded.org (Postfix) with ESMTP id 688157ED96
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 17:49:52 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id h144so1056807iof.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 10:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=eAjfH9UCyWSMQLGIBKbFb4iqxqBgGJytMZQmK/iHC/0=;
	b=VQZHcMOjtf10WX0Jg2cLfFWkMO3w7n+V+cWfWmHvZjic/HO0aPc8kQ39sNrMM28QO4
	ZLVaaCMqshOHre9eNCBfTghuatwoSQJMEFOA5Hiy+0WJpNkiCPuJe52Iqfrj7xXhVM0N
	c+payKR1o5sZYQw5mb0sX/qPfuJLKd0C6UcKgRzcykMkGUXKNA6TE1ivpGvg9xzuHBS2
	8qjxDpulLgiXWbBg7Zmpgn5ViXUcOO02I5nMPMpnPsDijfO7zaKHyDUb1JlEJ4Tver4h
	upBfXpjupk/qgN5Xi+DdmXfPJBstDC1a1kFi+qsbS/Gnadl+Y3/T2DiwJnhVpbnmjcvk
	6yxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eAjfH9UCyWSMQLGIBKbFb4iqxqBgGJytMZQmK/iHC/0=;
	b=bM/pHWUiwRfNopclvwsEmhmY5Yh3aoXKQpb0mpf04iRKevXP5bmgb63UVWCLIN7TVp
	5RhYmwxRa2fbNdDhqR/XjagIPNjY9fGYlgOA/9mQMxAVJ9n3X4bRWC5Qx6p6k7StDevr
	kf/hpktMi81T9BJoBJOgcRSSb8oGTxJwir5JrsUbTll0CeTT89EHEJVgWmZ2IiMQytV3
	pLpI+B1K+Dlka9ClbvhJI/OYzZ2s1PO/NRPB19BEaJ0TyAbzYFYrNF9fXxa7WkZbY6y7
	NpqvuCuMJFIxOU4fEYOpnq9WxtiTVLEbxjd7iwr6AvyxfWrhYw5JoedkXEQeDd3uSUSt
	PVag==
X-Gm-Message-State: APjAAAXidn1qbb2gLv+jAqcOSaxklSL9U6udse+93FDZqa5+p98QMdbD
	PAgJrto5XNrCR7x8Qu9NIKigF5yX
X-Google-Smtp-Source: APXvYqxAdO+lgP3vfF3gs6cuGkWx3ANu4Mlwq5TsDiqIMMKux4/ZISIUNFp+4R6A1WWvwVTBDW5J/w==
X-Received: by 2002:a6b:e618:: with SMTP id g24mr1066981ioh.277.1568656193182; 
	Mon, 16 Sep 2019 10:49:53 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	e139sm48739471iof.60.2019.09.16.10.49.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Sep 2019 10:49:52 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2019 12:49:45 -0500
Message-Id: <20190916174945.14562-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190916174945.14562-1-JPEWhacker@gmail.com>
References: <20190916174945.14562-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] Remove SSTATE_HASHEQUIV_SERVER
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
X-List-Received-Date: Mon, 16 Sep 2019 17:49:52 -0000
Content-Transfer-Encoding: 8bit

Removes all references to the SSTATE_HASHEQUIV_SERVER variable. This
variable is redundant now that BB_HASHSERVE is present.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/sstate.bbclass | 5 -----
 meta/conf/bitbake.conf      | 2 +-
 meta/lib/oe/sstatesig.py    | 8 ++------
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 11222223a9b..b47b9c23bf2 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -89,11 +89,6 @@ SSTATE_HASHEQUIV_METHOD[doc] = "The fully-qualified function used to calculate \
     the output hash for a task, which in turn is used to determine equivalency. \
     "
 
-SSTATE_HASHEQUIV_SERVER ?= ""
-SSTATE_HASHEQUIV_SERVER[doc] = "The hash equivalence sever. For example, \
-    'http://192.168.0.1:5000'. Do not include a trailing slash \
-    "
-
 SSTATE_HASHEQUIV_REPORT_TASKDATA ?= "0"
 SSTATE_HASHEQUIV_REPORT_TASKDATA[doc] = "Report additional useful data to the \
     hash equivalency server, such as PN, PV, taskname, etc. This information \
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a0a7f4911e0..263d8aea4fb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -872,7 +872,7 @@ BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_NOHASHDIR LICENSE_PATH SDKPKGSUFFIX \
     WARN_QA ERROR_QA WORKDIR STAMPCLEAN PKGDATA_DIR BUILD_ARCH SSTATE_PKGARCH \
     BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot DEPLOY_DIR \
-    SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_SERVER SSTATE_HASHEQUIV_REPORT_TASKDATA \
+    SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
     SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE"
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index b1ef5c039b3..50d80bf51a1 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -262,13 +262,9 @@ class SignatureGeneratorOEEquivHash(bb.siggen.SignatureGeneratorUniHashMixIn, Si
 
     def init_rundepcheck(self, data):
         super().init_rundepcheck(data)
-        autostart = data.getVar('BB_HASHSERVE')
-        if autostart:
-            self.server = autostart
-        else:
-            self.server = data.getVar('SSTATE_HASHEQUIV_SERVER')
+        self.server = data.getVar('BB_HASHSERVE')
         if not self.server:
-            bb.fatal("OEEquivHash requires SSTATE_HASHEQUIV_SERVER or BB_HASHSERVE to be set")
+            bb.fatal("OEEquivHash requires BB_HASHSERVE to be set")
         self.method = data.getVar('SSTATE_HASHEQUIV_METHOD')
         if not self.method:
             bb.fatal("OEEquivHash requires SSTATE_HASHEQUIV_METHOD to be set")
-- 
2.21.0


