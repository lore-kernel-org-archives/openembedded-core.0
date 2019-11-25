Return-Path: <s.mueller-klieser@phytec.de>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 25 Nov 2019 22:09:32 UTC
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
	by mail.openembedded.org (Postfix) with ESMTP id 5F42A7FCFD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 22:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1574718871; x=1577310871;
	h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sAaboODqelUlKLZ5cK7YiWkCqGAW2SBCUp/36awQ18Q=;
	b=Y/lPdRA1KOVmxBeRqwKf1UbucB1e3qTZQY7o17yGGCY1KcblHyDgFzb/gvv6fa+z
	F9FSMgF7QjPOsbIT4+wra1s7yBvffi/F1OfTeueYGB1eVCazve31oZpmPES0cUNE
	LajitOBYQUJAklladpPGAUDmZ4HWdUULYuW7uv+3odI=;
X-AuditID: c39127d2-e0fff7000000408f-c6-5ddc4d967583
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id
	EA.AB.16527.69D4CDD5; Mon, 25 Nov 2019 22:54:30 +0100 (CET)
Received: from lws-mklieser.phytec.de ([172.16.21.74])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2019112522543009-5111 ;
	Mon, 25 Nov 2019 22:54:30 +0100 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2019 22:54:19 +0100
Message-Id: <20191125215419.29616-1-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 25.11.2019 22:54:30,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 25.11.2019 22:54:30
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHJMWRmVeSWpSXmKPExsWyRoCBS3ea751Yg88f9C3u/HzH7sDocW7j
	CsYAxigum5TUnMyy1CJ9uwSujEs397MU3JvCWHGt7ztrA+Oj+i5GDg4JAROJv/ecuhg5OYQE
	tjJKzNzm0cXIBWRfYJQ4sf8KG0gNm4CPxNKZliCmiICOxJuPXiDlwgKmEq29+9lBbBYBVYmD
	p2aB2bwCDhLXe2eD2RIC8hLne9dBxQUlTs58wgIyXkLgCqPEsdYHTBBFQhKnF59lBpnPLKAu
	sX6eEEiYWUBbYtnC18wTGPlmIWmfhVA1C0nVAkbmVYxCuZnJ2alFmdl6BRmVJanJeimpmxiB
	YXR4ovqlHYx9czwOMTJxMB5ilOBgVhLhdTt7I1aINyWxsiq1KD++qDQntfgQozQHi5I47wbe
	kjAhgfTEktTs1NSC1CKYLBMHp1QD46ZYx+xZ07WOLDY6mZb+UDlR2+Wntn7Vzc8NNVGcrl9U
	HgkeEbLt1vXZ2xXs/Pyv+AIp6RaJqa2+IhJL2rwZDkvrtSYYVrXO3mthFaWsqB/peeba8+BD
	dbMFzLKPPZ6v8ow97fwCvw3Xn174dt3gYHXs7+W2344nHF1Xl35vzv2HKZGiJ5ccV2Ipzkg0
	1GIuKk4EAEAhWXsRAgAA
Subject: [PATCH] recipes: change SRC_URI to use https
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
X-List-Received-Date: Mon, 25 Nov 2019 22:09:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Change all recipes to https where we get an http 301 permanent redirect.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 meta/recipes-core/busybox/busybox.inc                       | 2 +-
 meta/recipes-core/busybox/busybox=5F1.31.0.bb                 | 2 +-
 meta/recipes-core/dbus/dbus-glib=5F0.110.bb                   | 4 ++--
 meta/recipes-core/dbus/dbus=5F1.12.16.bb                      | 4 ++--
 meta/recipes-core/udev/eudev=5F3.2.8.bb                       | 2 +-
 meta/recipes-devtools/patchelf/patchelf=5F0.10.bb             | 2 +-
 meta/recipes-extended/iptables/iptables=5F1.8.3.bb            | 6 +++---
 meta/recipes-extended/libmnl/libmnl=5F1.0.4.bb                | 4 ++--
 meta/recipes-extended/xdg-utils/xdg-utils=5F1.1.3.bb          | 2 +-
 meta/recipes-extended/xz/xz=5F5.2.4.bb                        | 4 ++--
 .../hicolor-icon-theme/hicolor-icon-theme=5F0.17.bb           | 2 +-
 meta/recipes-kernel/powertop/powertop=5F2.10.bb               | 6 +++---
 meta/recipes-sato/webkit/webkitgtk=5F2.26.2.bb                | 6 +++---
 meta/recipes-support/db/db=5F5.3.28.bb                        | 4 ++--
 meta/recipes-support/libbsd/libbsd=5F0.10.0.bb                | 4 ++--
 meta/recipes-support/libyaml/libyaml=5F0.2.2.bb               | 4 ++--
 meta/recipes-support/mpfr/mpfr=5F4.0.2.bb                     | 4 ++--
 17 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busy=
box/busybox.inc
index d08fa8d3d96b..bf6ddae7d197 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -1,6 +1,6 @@
 SUMMARY =3D "Tiny versions of many common UNIX utilities in a single small=
 executable"
 DESCRIPTION =3D "BusyBox combines tiny versions of many common UNIX utilit=
ies into a single small executable. It provides minimalist replacements for=
 most of the utilities you usually find in GNU fileutils, shellutils, etc. =
The utilities in BusyBox generally have fewer options than their full-featu=
red GNU cousins; however, the options that are included provide the expecte=
d functionality and behave very much like their GNU counterparts. BusyBox p=
rovides a fairly complete POSIX environment for any small or embedded syste=
m."
-HOMEPAGE =3D "http://www.busybox.net"
+HOMEPAGE =3D "https://www.busybox.net"
 BUGTRACKER =3D "https://bugs.busybox.net/"
=20
 DEPENDS +=3D "kern-tools-native virtual/crypt"
diff --git a/meta/recipes-core/busybox/busybox=5F1.31.0.bb b/meta/recipes-c=
ore/busybox/busybox=5F1.31.0.bb
index 34b1f2cc9166..5dd8d448daf6 100644
--- a/meta/recipes-core/busybox/busybox=5F1.31.0.bb
+++ b/meta/recipes-core/busybox/busybox=5F1.31.0.bb
@@ -1,6 +1,6 @@
 require busybox.inc
=20
-SRC=5FURI =3D "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=
=3Dtarball \
+SRC=5FURI =3D "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=3D=
tarball \
            file://busybox-udhcpc-no=5Fdeconfig.patch \
            file://find-touchscreen.sh \
            file://busybox-cron \
diff --git a/meta/recipes-core/dbus/dbus-glib=5F0.110.bb b/meta/recipes-cor=
e/dbus/dbus-glib=5F0.110.bb
index 9afbc2b6a11a..0b45805cf469 100644
--- a/meta/recipes-core/dbus/dbus-glib=5F0.110.bb
+++ b/meta/recipes-core/dbus/dbus-glib=5F0.110.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "High level language (GLib) binding for D-Bus"
 DESCRIPTION =3D "GLib bindings for the D-Bus message bus that integrate \
 the D-Bus library with the GLib thread abstraction and main loop."
-HOMEPAGE =3D "http://www.freedesktop.org/Software/dbus"
+HOMEPAGE =3D "https://www.freedesktop.org/Software/dbus"
 LICENSE =3D "AFL-2.1 | GPLv2+"
 LIC=5FFILES=5FCHKSUM =3D "file://COPYING;md5=3Dcf5b3a2f7083750d504333114e7=
38656 \
                     file://dbus/dbus-glib.h;beginline=3D7;endline=3D21;md5=
=3D7755c9d7abccd5dbd25a6a974538bb3c"
@@ -10,7 +10,7 @@ SECTION =3D "base"
 DEPENDS =3D "expat glib-2.0 virtual/libintl dbus-glib-native dbus"
 DEPENDS=5Fclass-native =3D "glib-2.0-native dbus-native"
=20
-SRC=5FURI =3D "http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${=
PV}.tar.gz \
+SRC=5FURI =3D "https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-$=
{PV}.tar.gz \
            file://no-examples.patch \
            file://test-install-makefile.patch \
 "
diff --git a/meta/recipes-core/dbus/dbus=5F1.12.16.bb b/meta/recipes-core/d=
bus/dbus=5F1.12.16.bb
index 96b503687067..82bb753731d8 100644
--- a/meta/recipes-core/dbus/dbus=5F1.12.16.bb
+++ b/meta/recipes-core/dbus/dbus=5F1.12.16.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "D-Bus message bus"
 DESCRIPTION =3D "D-Bus is a message bus system, a simple way for applicati=
ons to talk to one another. In addition to interprocess communication, D-Bu=
s helps coordinate process lifecycle; it makes it simple and reliable to co=
de a \"single instance\" application or daemon, and to launch applications =
and daemons on demand when their services are needed."
-HOMEPAGE =3D "http://dbus.freedesktop.org"
+HOMEPAGE =3D "https://dbus.freedesktop.org"
 SECTION =3D "base"
 LICENSE =3D "AFL-2.1 | GPLv2+"
 LIC=5FFILES=5FCHKSUM =3D "file://COPYING;md5=3D10dded3b58148f3f1fd804b2635=
4af3e \
@@ -12,7 +12,7 @@ PACKAGES +=3D "${@bb.utils.contains('DISTRO=5FFEATURES', =
'ptest', '${PN}-ptest', '',
 ALLOW=5FEMPTY=5Fdbus-ptest =3D "1"
 RDEPENDS=5Fdbus-ptest=5Fclass-target =3D "dbus-test-ptest"
=20
-SRC=5FURI =3D "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz=
 \
+SRC=5FURI =3D "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.g=
z \
            file://tmpdir.patch \
            file://dbus-1.init \
            file://clear-guid=5Ffrom=5Fserver-if-send=5Fnegotiate=5Funix=5F=
f.patch \
diff --git a/meta/recipes-core/udev/eudev=5F3.2.8.bb b/meta/recipes-core/ud=
ev/eudev=5F3.2.8.bb
index 08729e14c3b0..6619cdde3745 100644
--- a/meta/recipes-core/udev/eudev=5F3.2.8.bb
+++ b/meta/recipes-core/udev/eudev=5F3.2.8.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native gperf-native kmod lib=
xslt-native util-linux"
=20
 PROVIDES =3D "udev"
=20
-SRC=5FURI =3D "http://dev.gentoo.org/~blueness/${BPN}/${BP}.tar.gz \
+SRC=5FURI =3D "https://dev.gentoo.org/~blueness/${BPN}/${BP}.tar.gz \
            file://0014-Revert-rules-remove-firmware-loading-rules.patch \
            file://Revert-udev-remove-userspace-firmware-loading-suppor.pat=
ch \
            file://devfs-udev.rules \
diff --git a/meta/recipes-devtools/patchelf/patchelf=5F0.10.bb b/meta/recip=
es-devtools/patchelf/patchelf=5F0.10.bb
index 580108e8b8ad..cc983e033aa5 100644
--- a/meta/recipes-devtools/patchelf/patchelf=5F0.10.bb
+++ b/meta/recipes-devtools/patchelf/patchelf=5F0.10.bb
@@ -1,4 +1,4 @@
-SRC=5FURI =3D "http://nixos.org/releases/${BPN}/${BPN}-${PV}/${BPN}-${PV}.=
tar.bz2 \
+SRC=5FURI =3D "https://nixos.org/releases/${BPN}/${BPN}-${PV}/${BPN}-${PV}=
.tar.bz2 \
            file://handle-read-only-files.patch \
            file://fix-adjusting-startPage.patch \
            "
diff --git a/meta/recipes-extended/iptables/iptables=5F1.8.3.bb b/meta/reci=
pes-extended/iptables/iptables=5F1.8.3.bb
index ff9fcb1b53b6..e33c7b80b726 100644
--- a/meta/recipes-extended/iptables/iptables=5F1.8.3.bb
+++ b/meta/recipes-extended/iptables/iptables=5F1.8.3.bb
@@ -1,13 +1,13 @@
 SUMMARY =3D "Tools for managing kernel packet filtering capabilities"
 DESCRIPTION =3D "iptables is the userspace command line program used to co=
nfigure and control network packet \
 filtering code in Linux."
-HOMEPAGE =3D "http://www.netfilter.org/"
-BUGTRACKER =3D "http://bugzilla.netfilter.org/"
+HOMEPAGE =3D "https://www.netfilter.org/"
+BUGTRACKER =3D "https://bugzilla.netfilter.org/"
 LICENSE =3D "GPLv2+"
 LIC=5FFILES=5FCHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263\
                     file://iptables/iptables.c;beginline=3D13;endline=3D25=
;md5=3Dc5cffd09974558cf27d0f763df2a12dc"
=20
-SRC=5FURI =3D "http://netfilter.org/projects/iptables/files/iptables-${PV}=
.tar.bz2 \
+SRC=5FURI =3D "https://netfilter.org/projects/iptables/files/iptables-${PV=
}.tar.bz2 \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink=
.patch \
            file://0002-configure.ac-only-check-conntrack-when-libnfnetlink=
-enabled.patch \
            file://iptables.service \
diff --git a/meta/recipes-extended/libmnl/libmnl=5F1.0.4.bb b/meta/recipes-=
extended/libmnl/libmnl=5F1.0.4.bb
index 23262e8c6f45..b55bb311f6ed 100644
--- a/meta/recipes-extended/libmnl/libmnl=5F1.0.4.bb
+++ b/meta/recipes-extended/libmnl/libmnl=5F1.0.4.bb
@@ -1,12 +1,12 @@
 SUMMARY =3D "Minimalistic user-space Netlink utility library"
 DESCRIPTION =3D "Minimalistic user-space library oriented to Netlink devel=
opers, providing \
     functions for common tasks in parsing, validating, and constructing bo=
th the Netlink header and TLVs."
-HOMEPAGE =3D "http://www.netfilter.org/projects/libmnl/index.html"
+HOMEPAGE =3D "https://www.netfilter.org/projects/libmnl/index.html"
 SECTION =3D "libs"
 LICENSE =3D "LGPLv2.1+"
 LIC=5FFILES=5FCHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b36=
4516c"
=20
-SRC=5FURI =3D "http://www.netfilter.org/projects/libmnl/files/libmnl-${PV}=
.tar.bz2;name=3Dtar"
+SRC=5FURI =3D "https://netfilter.org/projects/libmnl/files/libmnl-${PV}.ta=
r.bz2;name=3Dtar"
 SRC=5FURI[tar.md5sum] =3D "be9b4b5328c6da1bda565ac5dffadb2d"
 SRC=5FURI[tar.sha256sum] =3D "171f89699f286a5854b72b91d06e8f8e3683064c5901=
fb09d954a9ab6f551f81"
=20
diff --git a/meta/recipes-extended/xdg-utils/xdg-utils=5F1.1.3.bb b/meta/re=
cipes-extended/xdg-utils/xdg-utils=5F1.1.3.bb
index 7788b5f3c337..d371c5c28ce4 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils=5F1.1.3.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils=5F1.1.3.bb
@@ -17,7 +17,7 @@ xdg-terminal \
 LICENSE =3D "MIT"
 LIC=5FFILES=5FCHKSUM =3D "file://LICENSE;md5=3Da5367a90934098d6b05af3b7464=
05014"
=20
-SRC=5FURI =3D "http://portland.freedesktop.org/download/${BPN}-${PV}.tar.g=
z \
+SRC=5FURI =3D "https://portland.freedesktop.org/download/${BPN}-${PV}.tar.=
gz \
            file://0001-Reinstate-xdg-terminal.patch \
            file://0001-Don-t-build-the-in-script-manual.patch \
           "
diff --git a/meta/recipes-extended/xz/xz=5F5.2.4.bb b/meta/recipes-extended=
/xz/xz=5F5.2.4.bb
index 791746e1cf24..83e8fe0cd195 100644
--- a/meta/recipes-extended/xz/xz=5F5.2.4.bb
+++ b/meta/recipes-extended/xz/xz=5F5.2.4.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "Utilities for managing LZMA compressed files"
-HOMEPAGE =3D "http://tukaani.org/xz/"
+HOMEPAGE =3D "https://tukaani.org/xz/"
 SECTION =3D "base"
=20
 # The source includes bits of PD, GPLv2, GPLv3, LGPLv2.1+, but the only fi=
le
@@ -22,7 +22,7 @@ LIC=5FFILES=5FCHKSUM =3D "file://COPYING;md5=3D97d554a328=
81fee0aa283d96e47cb24a \
                     file://lib/getopt.c;endline=3D23;md5=3D2069b0ee710572c=
03bb3114e4532cd84 \
                     "
=20
-SRC=5FURI =3D "http://tukaani.org/xz/xz-${PV}.tar.gz"
+SRC=5FURI =3D "https://tukaani.org/xz/xz-${PV}.tar.gz"
 SRC=5FURI[md5sum] =3D "5ace3264bdd00c65eeec2891346f65e6"
 SRC=5FURI[sha256sum] =3D "b512f3b726d3b37b6dc4c8570e137b9311e7552e8ccbab4d=
39d47ce5f4177145"
 UPSTREAM=5FCHECK=5FREGEX =3D "xz-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme=5F0.1=
7.bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme=5F0.17.bb
index aad7eff25f11..74e343052846 100644
--- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme=5F0.17.bb
+++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme=5F0.17.bb
@@ -7,7 +7,7 @@ BUGTRACKER =3D "https://bugs.freedesktop.org/"
 LICENSE =3D "GPLv2"
 LIC=5FFILES=5FCHKSUM =3D "file://COPYING;md5=3Df08a446809913fc9b3c718f0eae=
a0426"
=20
-SRC=5FURI =3D "http://icon-theme.freedesktop.org/releases/${BPN}-${PV}.tar=
.xz"
+SRC=5FURI =3D "https://icon-theme.freedesktop.org/releases/${BPN}-${PV}.ta=
r.xz"
 SRC=5FURI[md5sum] =3D "84eec8d6f810240a069c731f1870b474"
 SRC=5FURI[sha256sum] =3D "317484352271d18cbbcfac3868eab798d67fff1b8402e740=
baa6ff41d588a9d8"
=20
diff --git a/meta/recipes-kernel/powertop/powertop=5F2.10.bb b/meta/recipes=
-kernel/powertop/powertop=5F2.10.bb
index 5be8d2311100..7b7b3929b38a 100644
--- a/meta/recipes-kernel/powertop/powertop=5F2.10.bb
+++ b/meta/recipes-kernel/powertop/powertop=5F2.10.bb
@@ -1,12 +1,12 @@
 SUMMARY =3D "Power usage tool"
 DESCRIPTION =3D "Linux tool to diagnose issues with power consumption and =
power management."
-HOMEPAGE =3D "http://01.org/powertop/"
-BUGTRACKER =3D "http://bugzilla.lesswatts.org/"
+HOMEPAGE =3D "https://01.org/powertop/"
+BUGTRACKER =3D "https://app.devzing.com/powertopbugs/bugzilla"
 DEPENDS =3D "ncurses libnl pciutils"
 LICENSE =3D "GPLv2"
 LIC=5FFILES=5FCHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c=
4ca7e"
=20
-SRC=5FURI =3D "http://01.org/sites/default/files/downloads/powertop-v${PV}=
.tar.gz \
+SRC=5FURI =3D "https://01.org/sites/default/files/downloads/powertop-v${PV=
}.tar.gz \
     file://0001-wakeup=5Fxxx.h-include-limits.h.patch \
 "
=20
diff --git a/meta/recipes-sato/webkit/webkitgtk=5F2.26.2.bb b/meta/recipes-=
sato/webkit/webkitgtk=5F2.26.2.bb
index 0139f010170e..fa424f606fcb 100644
--- a/meta/recipes-sato/webkit/webkitgtk=5F2.26.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk=5F2.26.2.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "WebKit web rendering engine for the GTK+ platform"
-HOMEPAGE =3D "http://www.webkitgtk.org/"
-BUGTRACKER =3D "http://bugs.webkit.org/"
+HOMEPAGE =3D "https://www.webkitgtk.org/"
+BUGTRACKER =3D "https://bugs.webkit.org/"
=20
 LICENSE =3D "BSD & LGPLv2+"
 LIC=5FFILES=5FCHKSUM =3D "file://Source/JavaScriptCore/COPYING.LIB;md5=3Dd=
0c6d6397a5d84286dda758da57bd691 \
@@ -9,7 +9,7 @@ LIC=5FFILES=5FCHKSUM =3D "file://Source/JavaScriptCore/COPY=
ING.LIB;md5=3Dd0c6d6397a5d842
 		    file://Source/WebCore/LICENSE-LGPL-2.1;md5=3Da778a33ef338abbaf8b8a7c=
36b6eec80 \
 		   "
=20
-SRC=5FURI =3D "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
+SRC=5FURI =3D "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obt=
a.patch \
            file://0001-When-building-introspection-files-add-CMAKE=5FC=5FF=
LAGS-.patch \
            file://0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-g=
t.patch \
diff --git a/meta/recipes-support/db/db=5F5.3.28.bb b/meta/recipes-support/=
db/db=5F5.3.28.bb
index 761d80c2fd4a..a2969055a670 100644
--- a/meta/recipes-support/db/db=5F5.3.28.bb
+++ b/meta/recipes-support/db/db=5F5.3.28.bb
@@ -10,7 +10,7 @@
 # same system at the same time if really necessary.
 SECTION =3D "libs"
 SUMMARY =3D "Berkeley Database v5"
-HOMEPAGE =3D "http://www.oracle.com/technetwork/database/database-technolo=
gies/berkeleydb/overview/index.html"
+HOMEPAGE =3D "https://www.oracle.com/database/technologies/related/berkele=
ydb.html"
 LICENSE =3D "Sleepycat"
 RCONFLICTS=5F${PN} =3D "db3"
=20
@@ -20,7 +20,7 @@ CVE=5FVERSION =3D "11.2.${PV}"
 PR =3D "r1"
 PE =3D "1"
=20
-SRC=5FURI =3D "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
+SRC=5FURI =3D "https://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
 SRC=5FURI +=3D "file://fix-parallel-build.patch \
             file://0001-atomic-Rename-local-=5F=5Fatomic=5Fcompare=5Fexcha=
nge-to-avo.patch \
             file://0001-configure-Add-explicit-tag-options-to-libtool-invo=
ca.patch \
diff --git a/meta/recipes-support/libbsd/libbsd=5F0.10.0.bb b/meta/recipes-=
support/libbsd/libbsd=5F0.10.0.bb
index eaf244a3b725..3b9ac5a01f44 100644
--- a/meta/recipes-support/libbsd/libbsd=5F0.10.0.bb
+++ b/meta/recipes-support/libbsd/libbsd=5F0.10.0.bb
@@ -7,7 +7,7 @@ DESCRIPTION =3D "This library provides useful functions com=
monly found on BSD syst
                projects with strong BSD origins, without needing to embed =
the same \
                code over and over again on each project."
=20
-HOMEPAGE =3D "http://libbsd.freedesktop.org/wiki/"
+HOMEPAGE =3D "https://libbsd.freedesktop.org/wiki/"
 # There seems to be more licenses used in the code, I don't think we want =
to list them all here, complete list:
 # OE @ ~/projects/libbsd $ grep ^License: COPYING  | sort -u
 # License: BSD-2-clause
@@ -31,7 +31,7 @@ LICENSE =3D "BSD-4-Clause & ISC & PD"
 LIC=5FFILES=5FCHKSUM =3D "file://COPYING;md5=3D2120be0173469a06ed185b688e0=
e1ae0"
 SECTION =3D "libs"
=20
-SRC=5FURI =3D "http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
+SRC=5FURI =3D "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
=20
 SRC=5FURI[md5sum] =3D "ead96d240d02faa5b921c0aa50c812b5"
 SRC=5FURI[sha256sum] =3D "34b8adc726883d0e85b3118fa13605e179a62b31ba51f676=
136ecb2d0bc1a887"
diff --git a/meta/recipes-support/libyaml/libyaml=5F0.2.2.bb b/meta/recipes=
-support/libyaml/libyaml=5F0.2.2.bb
index fbd199205ff4..5105ce69dbb9 100644
--- a/meta/recipes-support/libyaml/libyaml=5F0.2.2.bb
+++ b/meta/recipes-support/libyaml/libyaml=5F0.2.2.bb
@@ -1,13 +1,13 @@
 SUMMARY =3D "LibYAML is a YAML 1.1 parser and emitter written in C."
 DESCRIPTION =3D "LibYAML is a C library for parsing and emitting data in Y=
AML 1.1, \
 a human-readable data serialization format. "
-HOMEPAGE =3D "http://pyyaml.org/wiki/LibYAML"
+HOMEPAGE =3D "https://pyyaml.org/wiki/LibYAML"
 SECTION =3D "libs/devel"
=20
 LICENSE =3D "MIT"
 LIC=5FFILES=5FCHKSUM =3D "file://LICENSE;md5=3Da76b4c69bfcf82313bbdc0393b0=
4438a"
=20
-SRC=5FURI =3D "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
+SRC=5FURI =3D "https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
 SRC=5FURI[md5sum] =3D "54bf11ccb8bc488b5b3bec931f5b70dc"
 SRC=5FURI[sha256sum] =3D "4a9100ab61047fd9bd395bcef3ce5403365cafd55c1e0d02=
99cde14958e47be9"
=20
diff --git a/meta/recipes-support/mpfr/mpfr=5F4.0.2.bb b/meta/recipes-suppo=
rt/mpfr/mpfr=5F4.0.2.bb
index 03059174eed0..00c2dc2fe99e 100644
--- a/meta/recipes-support/mpfr/mpfr=5F4.0.2.bb
+++ b/meta/recipes-support/mpfr/mpfr=5F4.0.2.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "C library for multiple-precision floating-point computations =
with exact rounding"
-HOMEPAGE =3D "http://www.mpfr.org/"
+HOMEPAGE =3D "https://www.mpfr.org/"
 LICENSE =3D "LGPLv3+"
 SECTION =3D "devel"
=20
@@ -10,7 +10,7 @@ LIC=5FFILES=5FCHKSUM =3D "file://COPYING;md5=3D1ebbd3e342=
37af26da5dc08a4e440464 \
                     "
 DEPENDS =3D "gmp autoconf-archive"
=20
-SRC=5FURI =3D "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
+SRC=5FURI =3D "https://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
 SRC=5FURI[md5sum] =3D "320fbc4463d4c8cb1e566929d8adc4f8"
 SRC=5FURI[sha256sum] =3D "1d3be708604eae0e42d578ba93b390c2a145f17743a744d8=
f3f8c2ad5855a38a"
=20
--=20
2.20.1


