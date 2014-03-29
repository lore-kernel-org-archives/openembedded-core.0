Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8DDC36121F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 04:13:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2T4DOi1018211
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 21:13:25 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 21:13:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Mar 2014 00:13:21 -0400
Message-ID: <2a33669ee0bd8a5d79489cafbff7309320de8d36.1396066374.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1396066374.git.liezhi.yang@windriver.com>
References: <cover.1396066374.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] packagegroup-toolset-native: remove it
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
X-List-Received-Date: Sat, 29 Mar 2014 04:13:26 -0000
Content-Type: text/plain

Remove it since it seems that it is not widely used by oe.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../packagegroups/packagegroup-toolset-native.bb   |  230 --------------------
 1 file changed, 230 deletions(-)
 delete mode 100644 meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb

diff --git a/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb b/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
deleted file mode 100644
index 1253800..0000000
--- a/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
+++ /dev/null
@@ -1,230 +0,0 @@
-#
-# Copyright (C) 2012 Wind River Ltd
-#
-
-SUMMARY = "A toolset that contains most of the native packages"
-DESCRIPTION = "The packagegroup is required to build most native \
-tools, it is useful for testing and collecting the native tools."
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-inherit native packagegroup
-
-DEPENDS = "\
-    acl-native \
-    alsa-lib-native \
-    apr-native \
-    apr-util-native \
-    apt-native \
-    atk-native \
-    attr-native \
-    autoconf-native \
-    autogen-native \
-    automake-native \
-    bdwgc-native \
-    beecrypt-native \
-    bigreqsproto-native \
-    binutils-native \
-    bison-native \
-    boost-native \
-    btrfs-tools-native \
-    byacc-native \
-    bzip2-native \
-    cairo-native \
-    ccache-native \
-    cdrtools-native \
-    chrpath-native \
-    cmake-native \
-    compositeproto-native \
-    coreutils-native \
-    createrepo-native \
-    cross-localedef-native \
-    curl-native \
-    cwautomacros-native \
-    damageproto-native \
-    db-native \
-    dbus-glib-native \
-    dbus-native \
-    desktop-file-utils-native \
-    docbook-dsssl-stylesheets-native \
-    docbook-sgml-dtd-3.1-native \
-    docbook-sgml-dtd-4.1-native \
-    docbook-sgml-dtd-4.5-native \
-    docbook-utils-native \
-    dosfstools-native \
-    dpkg-native \
-    dtc-native \
-    e2fsprogs-native \
-    elfutils-native \
-    expat-native \
-    file-native \
-    findutils-native \
-    fixesproto-native \
-    flex-native \
-    fontconfig-native \
-    fontsproto-native \
-    font-util-native \
-    freetype-native \
-    gconf-native \
-    gdbm-native \
-    gdk-pixbuf-native \
-    gettext-minimal-native \
-    gettext-native \
-    ghostscript-native \
-    git-native \
-    glib-2.0-native \
-    gmp-native \
-    gnome-common-native \
-    gnome-doc-utils-native \
-    gnu-config-native \
-    gnutls-native \
-    gperf-native \
-    groff-native \
-    gtk-doc-stub-native \
-    gtk-update-icon-cache-native \
-    guile-native \
-    guilt-native \
-    gzip-native \
-    help2man-native \
-    icecc-create-env-native \
-    icon-naming-utils-native \
-    icu-native \
-    inputproto-native \
-    insserv-native \
-    intltool-native \
-    jpeg-native \
-    kbd-native \
-    kbproto-native \
-    kconfig-frontends-native \
-    kern-tools-native \
-    kmod-native \
-    ldconfig-native \
-    libcap-native \
-    libclass-isa-perl-native \
-    libconvert-asn1-perl-native \
-    libffi-native \
-    libfontenc-native \
-    libgcrypt-native \
-    libgpg-error-native \
-    libice-native \
-    libmpc-native \
-    libpcre-native \
-    libpng-native \
-    libpod-plainer-perl-native \
-    libpthread-stubs-native \
-    librsvg-native \
-    libsm-native \
-    libtasn1-native \
-    libtimedate-perl-native \
-    libtool-native \
-    libunistring-native \
-    libusb1-native \
-    libusb-compat-native \
-    libx11-native \
-    libxau-native \
-    libxcb-native \
-    libxcomposite-native \
-    libxcursor-native \
-    libxdamage-native \
-    libxdmcp-native \
-    libxext-native \
-    libxfixes-native \
-    libxfont-native \
-    libxft-native \
-    libxkbfile-native \
-    libxml2-native \
-    libxml-namespacesupport-perl-native \
-    libxml-parser-perl-native \
-    libxml-sax-perl-native \
-    libxml-simple-perl-native \
-    libxmu-native \
-    libxpm-native \
-    libxrandr-native \
-    libxrender-native \
-    libxslt-native \
-    libxt-native \
-    linuxdoc-tools-native \
-    lzo-native \
-    lzop-native \
-    m4-native \
-    makedepend-native \
-    makedevs-native \
-    make-native \
-    mkelfimage-native \
-    mkfontdir-native \
-    mkfontscale-native \
-    mklibs-native \
-    mpfr-native \
-    mtd-utils-native \
-    mtools-native \
-    nasm-native \
-    ncurses-native \
-    neon-native \
-    cryptodev-linux-native \
-    openjade-native \
-    opensp-native \
-    openssl-native \
-    opkg-native \
-    opkg-utils-native \
-    ossp-uuid-native \
-    pango-native \
-    parted-native \
-    pax-utils-native \
-    perl-native \
-    pigz-native \
-    pixman-native \
-    pkgconfig-native \
-    popt-native \
-    prelink-native \
-    pseudo-native \
-    python-argparse-native \
-    python-native \
-    python-pycurl-native \
-    python-pygobject-native \
-    python-pyrex-native \
-    python-scons-native \
-    python-distribute-native \
-    python-smartpm-native \
-    qemu-helper-native \
-    qemu-native \
-    qt4-native \
-    quilt-native \
-    randrproto-native \
-    readline-native \
-    renderproto-native \
-    rpm-native \
-    rpmresolve-native \
-    sed-native \
-    sgml-common-native \
-    sgmlspl-native \
-    shared-mime-info-native \
-    sqlite3-native \
-    squashfs-tools-native \
-    strace-native \
-    subversion-native \
-    swabber-native \
-    syslinux-native \
-    systemtap-native \
-    tar-replacement-native \
-    tcl-native \
-    texinfo-native \
-    tiff-native \
-    tzcode-native \
-    u-boot-mkimage-native \
-    unfs3-native \
-    unifdef-native \
-    unzip-native \
-    update-rc.d-native \
-    util-linux-native \
-    util-macros-native \
-    xcb-proto-native \
-    xcmiscproto-native \
-    xextproto-native \
-    xkbcomp-native \
-    xproto-native \
-    xtrans-native \
-    xz-native \
-    zip-native \
-    zlib-native \
-"
-- 
1.7.10.4


