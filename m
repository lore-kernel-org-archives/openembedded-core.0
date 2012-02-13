Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Rx5OX-0006tA-Ri
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 00:33:18 +0100
Received: by eekd41 with SMTP id d41so1695116eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2012 15:25:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.213.29.145 with SMTP id q17mr2186548ebc.114.1329175508042;
	Mon, 13 Feb 2012 15:25:08 -0800 (PST)
Received: from localhost.localdomain ([79.117.107.69])
	by mx.google.com with ESMTPS id a58sm66210352eeb.8.2012.02.13.15.25.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 15:25:07 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2012 01:24:57 +0200
Message-Id: <2931689234504ffe0f2afafb860377e3f036089b.1329175337.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1329175337.git.andrei@gherzan.ro>
References: <cover.1329175337.git.andrei@gherzan.ro>
In-Reply-To: <cover.1329175337.git.andrei@gherzan.ro>
References: <cover.1329175337.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQkCXXv0fsWIA01VO2rEzJzqazD+eq2kjl3eMFYYO+Zxs0h9q6BxJwx7KEsyRW7fSjzwbrJz
Subject: [PATCH v2 1/2] nspr: Compile nspr with tests
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
X-List-Received-Date: Mon, 13 Feb 2012 23:33:18 -0000

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
1.7.5.4



