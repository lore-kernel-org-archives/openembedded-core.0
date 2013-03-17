Received: from mail-qc0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UH8qS-0006JV-4d
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Mar 2013 09:21:32 +0100
Received: by mail-qc0-f179.google.com with SMTP id b40so2244589qcq.38
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Mar 2013 01:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=cICoIjAZpmiYF0oWvHVGFCsFnQiRBbVjydzw2hSrD0g=;
	b=09aQupVQGhBXaD6wmfRQW+Kp7XWRycwHoNjQYAhHJAuFzq/REUv7/i5LaEfoLwuz5/
	f7FuMhNTTl65cveO5PVBpsGNrJ8a8YSDwMnvc+hIE7zRqER6lhc7cU1qj2nE1cAnwxKr
	6JtCuEBpAQ3GVYY7mk0yb1WcnLh8niRYixhhROHNVUwQ9RDxxzs4/wczyQojOKxtp4tT
	2Qa6JlvIO3q6khjHMaeNsJ0m2nQyvPsmZHFZX7blMj6jAURXrQbQ8lXl7eDgHejjIdbj
	y2mLEpLLHgHCmoFYQGzNcbxmXwJiH+lV++fKRw2Waoex+WgiSr+Dfisej1ZwJMwR8DIx
	0j/Q==
X-Received: by 10.229.76.89 with SMTP id b25mr3250882qck.31.1363507485401;
	Sun, 17 Mar 2013 01:04:45 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id e3sm20264697qeo.0.2013.03.17.01.04.44
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 17 Mar 2013 01:04:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Mar 2013 01:04:28 -0700
Message-Id: <1363507468-8945-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] bitbake.conf: Add LICENSE_PATH to sstate whitelist
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Mar 2013 08:21:34 -0000

some layers e.g. meta-intel are defining LICENSE_PATH in layer.conf like
LICENSE_PATH += "${LAYERDIR}/common/custom-licenses"
This causes the target packages to invalidate the siginfo and casues
rebuild for all packages.

Thanks bitbake-diffsigs, it shows

basehash changed from c27b55ea6980262fab370e539ba8bcd7 to
37962b22ebd6194e9537bc4f85819323
Variable LICENSE_PATH value changed from '
/builds2/poky/meta-intel/common/custom-licenses' to '
/b/kraj/jlinux-next/poky/meta-intel/common/custom-licenses'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index beba7d1..01ebad4 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -771,7 +771,7 @@ BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR \
     SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM \
     USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST \
     PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
-    CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_DISABLE"
+    CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_DISABLE LICENSE_PATH"
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV"
-- 
1.7.9.5



