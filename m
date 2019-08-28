Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 570E87F27C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 19:28:54 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id e20so1841005iob.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 12:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4TiAzigskVct2cwWMU1/R6wFZK2/u6LholY42CHlJOA=;
	b=PSnNl69okdMc8rigphG7ca3CryJQX0HogOK8NyUDMNoxw5bbvaxSWIHVne/zxqenmz
	lWAQNQCRvUYUmR/Tqj+H0rwLw54nDGealaAX6uZzQn92ts6fiwiOAZEVNG79Zwr6IcUE
	M3SG4ib/D6S4QB15UolopLZIjOVSBOwZ+mtVY4sxArDJ8zPkWs9Hyors6Bdp7KGZm9O1
	/GSIoxHJcqJVYqFDpYGWUjzt0iNBUWoyWZW1Kdvo3kD3lyvCYn2C5sQIAplHbykPsMVI
	x8N8cn3SHjpsKTuxElHkQwa/6U2LmaNA1H+HA+fgjmRprhhFCuADQBHxSOUTPGx3HFMQ
	44Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4TiAzigskVct2cwWMU1/R6wFZK2/u6LholY42CHlJOA=;
	b=sWyyBcjGgobn8fUNlzeLnqc7kuRc3hYHjik3gy6dGghbDHubPyDgNDkN1vH5xzQIry
	nGtA40PII+8kSTW0eOSLqH7IUpoZBhIFZEf7mUldIJqk65Zu29Qa80K4QulKVcNGGLTg
	QNY2+9qWMiEQ1Bdzh922ouMvf/dSR6tS3bNYoRlp8yTPg/E+HIwJavMOY1wx76VrEzse
	HMIbxSdiNDI9oV8qhtjgoXIeR/3yyyjGymjOWsTfawqAd2EQd9HMQhLwAFCY+Z6MCh3/
	dSlyqgGRD2eJ7KEZRQzt1lRtb/CoI2biMqMYX2l5UlVejAEcej4kCr4b2821Q+/xmvj9
	taDg==
X-Gm-Message-State: APjAAAXupL23+bFuiZHNxRmSqjyylqS6Iu8Ll6QWvqBfwovxGGwsBK2N
	IWJYdQlHFSX+AnjLl5KoQqo=
X-Google-Smtp-Source: APXvYqweX3E9IEtn04eJZlMHKhfpeDE6+7SljkVCWHSfD80hFWH+1hudfsP4/2lsPqCN4Gt2UFGjaw==
X-Received: by 2002:a5d:8f9a:: with SMTP id l26mr2877923iol.26.1567020535129; 
	Wed, 28 Aug 2019 12:28:55 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id d6sm4454375iod.17.2019.08.28.12.28.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 12:28:53 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 28 Aug 2019 15:28:39 -0400
Message-Id: <c1bffa0ef4621c96d200e8ed14fd818d97b41677.1567019771.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1567019771.git.bruce.ashfield@gmail.com>
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] perf: change dependencies on python to python3
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
X-List-Received-Date: Wed, 28 Aug 2019 19:28:54 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The upstream kernel can now handle python3 for the perf scripts, coupled
with the impending EOL of python2, we switch the dependencies in perf
(scripting) to python3.

Outside of dependency changes, we also pass the following two variables
to the perf build: PYTHON=python3 PYTHON_CONFIG=python3-config. To
ensure that our python3 components are used.

For configurations that disable perf scripting, there is no change in
behaviour.

[YOCTO #13358]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 4e603f1a32..8ac8e7c308 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -13,7 +13,7 @@ PR = "r9"
 
 PACKAGECONFIG ??= "scripting tui libunwind"
 PACKAGECONFIG[dwarf] = ",NO_DWARF=1"
-PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python"
+PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python3"
 # gui support was added with kernel 3.6.35
 # since 3.10 libnewt was replaced by slang
 # to cover a wide range of kernel we add both dependencies
@@ -44,8 +44,8 @@ PROVIDES = "virtual/perf"
 inherit linux-kernel-base kernel-arch manpages
 
 # needed for building the tools/perf Python bindings
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'pythonnative', '', d)}
-inherit python-dir
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3native', '', d)}
+inherit python3-dir
 export PYTHON_SITEPACKAGES_DIR
 
 #kernel 3.1+ supports WERROR to disable warnings as errors
@@ -94,6 +94,7 @@ EXTRA_OEMAKE += "\
     'sharedir=${@os.path.relpath(datadir, prefix)}' \
     'mandir=${@os.path.relpath(mandir, prefix)}' \
     'infodir=${@os.path.relpath(infodir, prefix)}' \
+    ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'PYTHON=python3 PYTHON_CONFIG=python3-config', '', d)} \
 "
 
 # During do_configure, we might run a 'make clean'. That often breaks
@@ -132,7 +133,7 @@ do_install() {
 	oe_runmake install
 	# we are checking for this make target to be compatible with older perf versions
 	if ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'true', 'false', d)} && grep -q install-python_ext ${S}/tools/perf/Makefile*; then
-		oe_runmake DESTDIR=${D} install-python_ext
+	    oe_runmake DESTDIR=${D} install-python_ext
 	fi
 }
 
@@ -233,7 +234,8 @@ do_configure_prepend () {
 
     # use /usr/bin/env instead of version specific python
     for s in `find ${S}/tools/perf/scripts/python/ -name '*.py'`; do
-        sed -i 's,/usr/bin/python2,/usr/bin/env python,' "${s}"
+        sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
+        sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
     done
 
     # unistd.h can be out of sync between libc-headers and the captured version in the perf source
@@ -252,9 +254,9 @@ PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
 
 RDEPENDS_${PN} += "elfutils bash"
 RDEPENDS_${PN}-archive =+ "bash"
-RDEPENDS_${PN}-python =+ "bash python python-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python', '', d)}"
+RDEPENDS_${PN}-python =+ "bash python3 python3-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python3', '', d)}"
 RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
-RDEPENDS_${PN}-tests =+ "python"
+RDEPENDS_${PN}-tests =+ "python3"
 
 RSUGGESTS_SCRIPTING = "${@bb.utils.contains('PACKAGECONFIG', 'scripting', '${PN}-perl ${PN}-python', '',d)}"
 RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
-- 
2.19.1


