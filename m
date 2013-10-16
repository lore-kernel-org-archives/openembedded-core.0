Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1DFAF6CC4B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 12:18:55 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id y10so601311wgg.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 05:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VZCBI+czfQ8UeWU63vy5AW/7Fek6oOHm+cHL0lQfTMk=;
	b=aIlB6xeo4KhE3wKEGvXbWm9HUNO02Zwe2lRDpGZp4wATfNov7ODVwOHC/okDwwjXgh
	F60JiEzRCEH4ded/CZifm5mzrAwHqqohGuliZ/A6ToGzVnFuES4XWC+awb4J2rlWEq36
	Xc0nVZvvIhuVJoSa0YPyM+FeAYcDzuZ2dQgdEaJ5VMKQ2rtEooT9XVKadWGeR36ySgbZ
	yPIPWDcRjDujkCFOtGATeuB1qEkcGPOLwpQY2DvFTMwiv09Vdsj6JaLtvGIXqvfnEdcn
	C4uyEVrWMZDEbUinFZQPbMdf1LqgX1jtb7mhaxxWicvZaLiqPZFGXs3Cc9pKy0hBHhOP
	S04Q==
X-Gm-Message-State: ALoCoQnHmhuCTKslEzepG898vYrXND+kjlafgyUTVa1gh/r48BM2XbOsUiHBohWQxylmC70VLZV7
X-Received: by 10.194.60.73 with SMTP id f9mr1087527wjr.65.1381925936759;
	Wed, 16 Oct 2013 05:18:56 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id gg20sm4269257wic.1.2013.10.16.05.18.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Oct 2013 05:18:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2013 13:18:53 +0100
Message-Id: <1381925933-17332-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] bitbake.conf: add WARN_QA and ERROR_QA to the hash whitelist
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
X-List-Received-Date: Wed, 16 Oct 2013 12:18:57 -0000

I discovered bitbake rebuilding packages because WARN_QA had changed. These
variables don't influence the output, so add them to the whitelist.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5146808..d7b7a4b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -783,7 +783,8 @@ BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR \
     SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM \
     USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST \
     PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
-    CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_DISABLE LICENSE_PATH SDKPKGSUFFIX"
+    CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_DISABLE LICENSE_PATH SDKPKGSUFFIX \
+    WARN_QA ERROR_QA"
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV"
-- 
1.7.10.4


