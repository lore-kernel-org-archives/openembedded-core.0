Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 664A478299
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 10:07:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Oct 2017 03:08:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,304,1505804400"; d="scan'208";a="1236012579"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2017 03:07:59 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Oct 2017 13:07:48 +0300
Message-Id: <8d1c4aacc60173f9db4809d23303d4825cc0090d.1509094533.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v5 05/10] bitbake.conf: add ip and scp to HOSTTOOLS unconditionally
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
X-List-Received-Date: Fri, 27 Oct 2017 10:07:58 -0000

Needed to be able to run images using the runtime test facilities.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/conf/bitbake.conf | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9696273acc..9075d03998 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -476,15 +476,15 @@ HOSTTOOLS += " \
     [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp cp cpio \
     cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
-    head hostname id install ld ldd ln ls make makeinfo md5sum mkdir mknod \
+    head hostname id install ip ld ldd ln ls make makeinfo md5sum mkdir mknod \
     mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python python2 \
-    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sha256sum \
+    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen scp sed sh sha256sum \
     sleep sort split stat strings strip tail tar tee test touch tr true uname \
     uniq wc wget which xargs \
 "
 
 # Tools needed to run testimage runtime image testing
-HOSTTOOLS += "${@['', 'ip ping ps scp ssh stty'][bb.data.inherits_class('testimage', d)]}"
+HOSTTOOLS += "${@['', 'ping ps ssh stty'][bb.data.inherits_class('testimage', d)]}"
 
 # Link to these if present
 HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat ssh sudo"
-- 
2.13.6


