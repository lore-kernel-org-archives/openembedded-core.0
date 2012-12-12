Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TijLr-0002ZI-Np
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 11:15:45 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBCA193S002449
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 02:01:10 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 12 Dec 2012 02:01:09 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Dec 2012 18:01:02 +0800
Message-ID: <a7c8311e2e00370fc0a5a3484f37401340a48d92.1354862051.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1354862051.git.hongxu.jia@windriver.com>
References: <cover.1354862051.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] native tools set packagegroup
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
X-List-Received-Date: Wed, 12 Dec 2012 10:15:45 -0000
Content-Type: text/plain

This packagegroup is a toolset that contains most
of the native packages.

[YOCTO #3298]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../packagegroups/packagegroup-toolset-native.bb   |  236 ++++++++++++++++++++
 1 file changed, 236 insertions(+)
 create mode 100644 meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb

diff --git a/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb b/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
new file mode 100644
index 0000000..584271d
--- /dev/null
+++ b/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
@@ -0,0 +1,236 @@
+#
+# Copyright (C) 2012 Wind River Ltd
+#
+
+SUMMARY = "A toolset that contains most of the native packages."
+DESCRIPTION = "The packagegroup is required to build most native \
+tools, it is useful for testing and collecting the native tools."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit native packagegroup
+
+DEPENDS = "\
+    acl-native \
+    alsa-lib-native \
+    apr-native \
+    apr-util-native \
+    apt-native \
+    atk-native \
+    attr-native \
+    autoconf-native \
+    autogen-native \
+    automake-native \
+    bdwgc-native \
+    beecrypt-native \
+    bigreqsproto-native \
+    binutils-native \
+    bison-native \
+    boost-native \
+    btrfs-tools-native \
+    byacc-native \
+    bzip2-native \
+    cairo-native \
+    ccache-native \
+    cdrtools-native \
+    chrpath-native \
+    cmake-native \
+    compositeproto-native \
+    coreutils-native \
+    createrepo-native \
+    cross-localedef-native \
+    curl-native \
+    cwautomacros-native \
+    damageproto-native \
+    db-native \
+    dbus-glib-native \
+    dbus-native \
+    desktop-file-utils-native \
+    docbook-dsssl-stylesheets-native \
+    docbook-sgml-dtd-3.1-native \
+    docbook-sgml-dtd-4.1-native \
+    docbook-sgml-dtd-4.5-native \
+    docbook-utils-native \
+    dosfstools-native \
+    dpkg-native \
+    dtc-native \
+    e2fsprogs-native \
+    elfutils-native \
+    expat-native \
+    file-native \
+    findutils-native \
+    fixesproto-native \
+    flex-native \
+    fontconfig-native \
+    fontsproto-native \
+    font-util-native \
+    freetype-native \
+    gconf-native \
+    gdbm-native \
+    gdk-pixbuf-native \
+    genext2fs-native \
+    gettext-minimal-native \
+    gettext-native \
+    ghostscript-native \
+    git-native \
+    glib-2.0-native \
+    gmp-native \
+    gnome-common-native \
+    gnome-doc-utils-native \
+    gnu-config-native \
+    gnutls-native \
+    gperf-native \
+    groff-native \
+    gtk-doc-stub-native \
+    gtk+-native \
+    guile-native \
+    guilt-native \
+    gzip-native \
+    help2man-native \
+    icecc-create-env-native \
+    icon-naming-utils-native \
+    icu-native \
+    imake-native \
+    inputproto-native \
+    insserv-native \
+    intltool-native \
+    jpeg-native \
+    kbd-native \
+    kbproto-native \
+    kconfig-frontends-native \
+    kern-tools-native \
+    kmod-native \
+    ldconfig-native \
+    libcap-native \
+    libclass-isa-perl-native \
+    libconvert-asn1-perl-native \
+    libffi-native \
+    libfontenc-native \
+    libgcrypt-native \
+    libgpg-error-native \
+    libice-native \
+    libmpc-native \
+    libpcre-native \
+    libpng-native \
+    libpod-plainer-perl-native \
+    libpthread-stubs-native \
+    librsvg-native \
+    libsm-native \
+    libtasn1-native \
+    libtimedate-perl-native \
+    libtool-native \
+    libunistring-native \
+    libusb1-native \
+    libusb-compat-native \
+    libx11-native \
+    libxau-native \
+    libxcb-native \
+    libxcomposite-native \
+    libxcursor-native \
+    libxdamage-native \
+    libxdmcp-native \
+    libxext-native \
+    libxfixes-native \
+    libxfont-native \
+    libxft-native \
+    libxkbfile-native \
+    libxml2-native \
+    libxml-namespacesupport-perl-native \
+    libxml-parser-perl-native \
+    libxml-sax-perl-native \
+    libxml-simple-perl-native \
+    libxmu-native \
+    libxpm-native \
+    libxrandr-native \
+    libxrender-native \
+    libxslt-native \
+    libxt-native \
+    linuxdoc-tools-native \
+    lzo-native \
+    lzop-native \
+    m4-native \
+    makedepend-native \
+    makedevs-native \
+    make-native \
+    mesa-dri-glsl-native \
+    mkelfimage-native \
+    mkfontdir-native \
+    mkfontscale-native \
+    mklibs-native \
+    mpfr-native \
+    mtd-utils-native \
+    mtools-native \
+    nasm-native \
+    ncurses-native \
+    neon-native \
+    ocf-linux-native \
+    openjade-native \
+    opensp-native \
+    openssl-native \
+    opkg-native \
+    opkg-utils-native \
+    ossp-uuid-native \
+    pango-native \
+    parted-native \
+    pax-utils-native \
+    perl-native \
+    pigz-native \
+    pixman-native \
+    pkgconfig-native \
+    popt-native \
+    prelink-native \
+    pseudo-native \
+    python-argparse-native \
+    python-native \
+    python-pycurl-native \
+    python-pygobject-native \
+    python-pyrex-native \
+    python-scons-native \
+    python-setuptools-native \
+    python-smartpm-native \
+    qemu-helper-native \
+    qemu-native \
+    qt4-native \
+    quilt-native \
+    randrproto-native \
+    readline-native \
+    renderproto-native \
+    rpm-native \
+    rpmresolve-native \
+    sed-native \
+    sgml-common-native \
+    sgmlspl-native \
+    shared-mime-info-native \
+    sqlite3-native \
+    squashfs-tools-native \
+    strace-native \
+    subversion-native \
+    swabber-native \
+    syslinux-native \
+    systemtap-native \
+    tar-replacement-native \
+    tcl-native \
+    texinfo-native \
+    tiff-native \
+    transfig-native \
+    tzcode-native \
+    u-boot-mkimage-native \
+    unfs-server-native \
+    unifdef-native \
+    unzip-native \
+    update-rc.d-native \
+    util-linux-native \
+    util-macros-native \
+    xcb-proto-native \
+    xcmiscproto-native \
+    xextproto-native \
+    xkbcomp-native \
+    xorg-cf-files-native \
+    xproto-native \
+    xtrans-native \
+    xz-native \
+    zip-native \
+    zlib-native \
+"
-- 
1.7.10.4



