Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0WHp-0006HI-Fa
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 11:52:33 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so459774eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 02:44:14 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.199.193 as permitted sender) client-ip=10.14.199.193; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.199.193 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.199.193])
	by 10.14.199.193 with SMTP id x41mr556839een.29.1329993854595 (num_hops
	= 1); Thu, 23 Feb 2012 02:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=0bj4nIHy6eJjlUZACJ2GdRxh73MgcdgCjdNEIuE/qH4=;
	b=lgRLT+XRuUkmc0AZV5SLhZWs6GsG0e3PXbYRVAas4UQG7wQUzk1vkb/oJYQmBWMgCY
	AqiSEThgsY2nPB1CaGkkyvcu7L/7kGsGrAnyC0k8qDcxmEjZWT8NWT58944hif/5dHWb
	efZsjyNRfQX2dV1LpQXqJvQzgqu1dtpunv9vU=
Received: by 10.14.199.193 with SMTP id x41mr439688een.29.1329993854520;
	Thu, 23 Feb 2012 02:44:14 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q49sm3755538eeh.1.2012.02.23.02.44.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 02:44:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 11:43:40 +0100
Message-Id: <f509b3dd0cb60a5e5a38ab2f60df18f49f033454.1329993620.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <d04b7081c135f61e831e1b6cdc6fc6f4bb2340a8.1329993620.git.Martin.Jansa@gmail.com>
References: <d04b7081c135f61e831e1b6cdc6fc6f4bb2340a8.1329993620.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1329993620.git.Martin.Jansa@gmail.com>
References: <cover.1329993620.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/7] python: add Makefile to SSTATE_SCAN_FILES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Feb 2012 10:52:33 -0000

* it contains sysroot specific paths, this is from om-gta04 sysroot and
  notice nokia900
  ./usr/lib/python2.7/config/Makefile:CC=         arm-oe-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 -D__SOFTFP__ --sysroot=/OE/shr-core/tmp-eglibc/sysroots/nokia900
  ./usr/lib/python2.7/config/Makefile:CXX=                arm-oe-linux-gnueabi-g++  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 -D__SOFTFP__ --sysroot=/OE/shr-core/tmp-eglibc/sysroots/nokia900
  ./usr/lib/python2.7/config/Makefile:LDFLAGS=-L. -L/OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib     -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
  ./usr/lib/python2.7/config/Makefile:LIBDIR=             /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib
  ./usr/lib/python2.7/config/Makefile:INCLUDEDIR= /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/include
  ./usr/lib/python2.7/config/Makefile:CONFIG_ARGS=         '--build=x86_64-linux' '--host=arm-oe-linux-gnueabi' '--target=arm-oe-linux-gnueabi' '--prefix=/usr' '--exec_prefix=/usr' '--bindir=/usr/bin' '--sbindir=/usr/sbin' '--libexecdir=/OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/libexec' '--datadir=/usr/share' '--sysconfdir=/etc' '--sharedstatedir=/com' '--localstatedir=/var' '--libdir=/usr/lib' '--includedir=/OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/include' '--oldincludedir=/usr/include' '--infodir=/usr/share/info' '--mandir=/usr/share/man' '--disable-silent-rules' '--disable-dependency-tracking' \
  '--with-libtool-sysroot=/OE/shr-core/tmp-eglibc/sysroots/nokia900' '--with-threads' '--with-pymalloc' '--with-cyclic-gc' '--without-cxx' '--with-signal-module' '--with-wctype-functions' '--enable-shared' 'build_alias=x86_64-linux' 'host_alias=arm-oe-linux-gnueabi' 'target_alias=arm-oe-linux-gnueabi' 'CC=arm-oe-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 -D__SOFTFP__ --sysroot=/OE/shr-core/tmp-eglibc/sysroots/nokia900' 'CFLAGS=-O2 -pipe -g -feliminate-unused-debug-types' 'LDFLAGS=-L. -L/OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed' 'CPPFLAGS=' 'CPP=arm-oe-linux-gnueabi-gcc -E --sysroot=/OE/shr-core/tmp-eglibc/sysroots/nokia900  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 -D__SOFTFP__'
  ./usr/lib/python2.7/config/Makefile:            $(RUNSHARED) /OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/libexec/oah/translate ./$(BUILDPYTHON) -E -tt $(TESTPROG) -uall $(TESTOPTS)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/python/python_2.7.2.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index fb5e860..2b18c53 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -100,6 +100,7 @@ do_install() {
 	fi
 }
 
+SSTATE_SCAN_FILES += "Makefile"
 PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
 
 py_package_preprocess () {
-- 
1.7.8.4



