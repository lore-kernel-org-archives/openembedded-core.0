Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0bC3-0004t7-C9
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 17:06:55 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 07:58:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128652353"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.72])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2012 07:58:31 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 07:58:11 -0800
Message-Id: <19cf751204eb4cfc29f24ea89bc60a4cb1589e8f.1330012543.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/25] nspr: Compile nspr with tests
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
X-List-Received-Date: Thu, 23 Feb 2012 16:06:56 -0000

From: Andrei Gherzan <andrei@gherzan.ro>

1. Compile package tests suite
2. Add tests to -dev rpm as it needs dev libraries

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-support/nspr/nspr_4.8.9.bb |  135 ++++++++++++++++++++++++++++++-
 1 files changed, 131 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/nspr/nspr_4.8.9.bb b/meta/recipes-support/nspr/nspr_4.8.9.bb
index da324fc..74bfe6b 100644
--- a/meta/recipes-support/nspr/nspr_4.8.9.bb
+++ b/meta/recipes-support/nspr/nspr_4.8.9.bb
@@ -5,17 +5,135 @@ LIC_FILES_CHKSUM = "file://configure.in;beginline=3;endline=40;md5=99d4d7d68bbc4
                     file://Makefile.in;beginline=4;endline=38;md5=c2b512182a334e1bfa1edc4d1c84a298 "
 SECTION = "libs/network"
 
-PR = "r0"
+PR = "r1"
 
-SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz"
+SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz \
+          "
 
-SRC_URI += "file://nspr.pc.in "
+SRC_URI += "file://nspr.pc.in"
 
 SRC_URI[md5sum] = "60770d45dc08c0f181b22cdfce5be3e8"
 SRC_URI[sha256sum] = "ff43c7c819e72f03bb908e7652c5d5f59a5d31ee86c333e692650207103d1cce"
 
 S = "${WORKDIR}/nspr-${PV}/mozilla/nsprpub"
 
+TESTS = "runtests.pl \
+    runtests.sh \
+    accept \
+    acceptread \
+    acceptreademu \
+    affinity \
+    alarm \
+    anonfm \
+    atomic \
+    attach \
+    bigfile \
+    cleanup \
+    cltsrv  \
+    concur \
+    cvar \
+    cvar2 \
+    dlltest \
+    dtoa \
+    errcodes \
+    exit \
+    fdcach \
+    fileio \
+    foreign \
+    formattm \
+    fsync \
+    gethost \
+    getproto \
+    i2l \
+    initclk \
+    inrval \
+    instrumt \
+    intrio \
+    intrupt \
+    io_timeout \
+    ioconthr \
+    join \
+    joinkk \
+    joinku \
+    joinuk \
+    joinuu \
+    layer \
+    lazyinit \
+    libfilename \
+    lltest \
+    lock \
+    lockfile \
+    logfile \
+    logger \
+    many_cv \
+    multiwait \
+    nameshm1 \
+    nblayer \
+    nonblock \
+    ntioto \
+    ntoh \
+    op_2long \
+    op_excl \
+    op_filnf \
+    op_filok \
+    op_nofil \
+    parent \
+    parsetm \
+    peek \
+    perf \
+    pipeping \
+    pipeping2 \
+    pipeself \
+    poll_nm \
+    poll_to \
+    pollable \
+    prftest \
+    primblok \
+    provider \
+    prpollml \
+    ranfile \
+    randseed \
+    reinit \
+    rwlocktest \
+    sel_spd \
+    selct_er \
+    selct_nm \
+    selct_to \
+    selintr \
+    sema \
+    semaerr \
+    semaping \
+    sendzlf \
+    server_test \
+    servr_kk \
+    servr_uk \
+    servr_ku \
+    servr_uu \
+    short_thread \
+    sigpipe \
+    socket \
+    sockopt \
+    sockping \
+    sprintf \
+    stack \
+    stdio \
+    str2addr \
+    strod \
+    switch \
+    system \
+    testbit \
+    testfile \
+    threads \
+    timemac \
+    timetest \
+    tpd \
+    udpsrv \
+    vercheck \
+    version \
+    writev \
+    xnotify \
+    zerolen"
+
 inherit autotools
 
 do_configure() {
@@ -26,12 +144,21 @@ do_compile_prepend() {
 	oe_runmake CROSS_COMPILE=1 CFLAGS="-DXP_UNIX" LDFLAGS="" CC=gcc -C config export
 }
 
+do_compile_append() {
+	oe_runmake -C pr/tests
+}
+
 do_install_append() {
     install -D ${WORKDIR}/nspr.pc.in ${D}${libdir}/pkgconfig/nspr.pc
     sed -i s:OEPREFIX:${prefix}:g ${D}${libdir}/pkgconfig/nspr.pc
     sed -i s:OELIBDIR:${libdir}:g ${D}${libdir}/pkgconfig/nspr.pc
     sed -i s:OEINCDIR:${includedir}:g ${D}${libdir}/pkgconfig/nspr.pc
     sed -i s:OEEXECPREFIX:${exec_prefix}:g ${D}${libdir}/pkgconfig/nspr.pc
+    cd ${S}/pr/tests
+    mkdir -p ${D}${libdir}/nspr/tests
+    install -m 0755 ${TESTS} ${D}${libdir}/nspr/tests
 }
 
-
+FILES_${PN} = ${bindir}/*
+FILES_${PN}-dev += "${libdir}/nspr/tests/*"
+FILES_${PN}-dbg += "${libdir}/nspr/tests/.debug/*"
-- 
1.7.6.5



