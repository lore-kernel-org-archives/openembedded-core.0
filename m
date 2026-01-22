Return-Path: <geissonator@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F0ED6CFA2
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 18:00:51 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43796.1769104849984604770
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 10:00:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: geissonator@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-45c838069e5so721833b6e.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 10:00:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769104849; x=1769709649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DeFXK+pNXBVHxIYV7QKLeOA1LdAiXiYzKVkhFZY1Qss=;
        b=T6aurkdqJ0Iz3SyVDJgVANk4ReaoX2vsy5rmom7HOYl3kBuLjyRSmY3YLuhEyu4K1X
         EKy1w8xHLhzHAdxDevboQwjRmgokMU/aWLPrUXNLwhrviumjmkCPuzkYNDdKqWK2oqBy
         8JhqKV1DTWoAGx3ksR0ue9pG0PvhDD5jxhh+NRpJarPCPXlpClEoV7QW5nfuGIZQmU0y
         e0nKJJr/ziGMqpLhS7RkBbGbSyLG6O2iFVYsRVbpcqlJyqgbcit365meLIgs25Nu4Do4
         kAzvQ1QjPzmAyK9aOxky+dCx6bEsVwfRaZMRsWuPfsLuHQjCNFKcK6Okpfw5xlh3NfoT
         T4iA==
X-Gm-Message-State: AOJu0YyaPiBhqsU6YKg/MFjxK12KRnmdsK/eeTT08kHwFXYOCY6Kq3QX
	IOoen/hWpQT9iXcKfeIQ/zAIWAON3QxwhYWu9RTy1SQwk+FyE98Yh7w3BexswnT8
X-Gm-Gg: AZuq6aL3FPKI8PEL6IeNP1AtIetKbR8HNts/5JrlpGUlBiK4cJevAfBELwDgtP40RHA
	n+Y/L2Hosii/zqYJVf+d5rNs79Jx2wAmYqmhOA+6qDpTdKetUggQMJ7x+2Dg4Yk028D9HTjQfhj
	PG4KywYWOP5cy5lq83DcSKHwJcJ7/dPMYoiDJXzaGx2fwr3vm3RChZ2k+xZQgH7pJSelEwAf0dX
	41Ro6eHJe4vuMQiFLYPMbn4KurV4HoKgLVJUTIbJcc6HLsz8nFVXk5xak+MOj6eGtPVaPOwyRhb
	NmODt7kXDNTeCWO944Ni9O736rCH0Q/Z1oIp0G58TtVXE+oZl9Z0W7td/Nx2Vm4D5mDozpo72+9
	tk4bPZkPryduN9fdB/G0v1wFmXINxte6Ue1LxM6XOgROpFR3THhSSwD/5QCQjl+vXVW9eGjegwo
	LrQICkArHF9DHiGJbtEmEX2VjJEIwjjCj8+6Xi43SCI0tmQe5V6S+QNWBikW1UQM3AMpnLx34Ww
	FF2AQLt7gWyMxWQCn8A6Do=
X-Received: by 2002:a05:6808:f91:b0:44d:c08a:e039 with SMTP id 5614622812f47-45eb1a8dde1mr282577b6e.10.1769104848015;
        Thu, 22 Jan 2026 10:00:48 -0800 (PST)
Received: from IBM-PW05FM02.ibm.com ([136.49.149.46])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cfdf0e92d3sm13034890a34.9.2026.01.22.10.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 10:00:47 -0800 (PST)
From: Andrew Geissler <geissonator@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrew Geissler <geissonator@yahoo.com>
Subject: [PATCH] global: convert all SRC_URI http to https
Date: Thu, 22 Jan 2026 12:00:04 -0600
Message-ID: <20260122180005.1320974-1-geissonator@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CALLMt=r5JcF1i1RL2brgfaoZyD3=Ry+xzsFHC7my+b-51kN3yw@mail.gmail.com>
References: <CALLMt=r5JcF1i1RL2brgfaoZyD3=Ry+xzsFHC7my+b-51kN3yw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 18:00:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229856

Recently an internal lab network turned off all outgoing http access.
This means we are unable to build oe-core without manually setting up a
local cache or mirror. Given the security vulnerabilities around http and
that moving to https appears to have no impact on building, this commit
just moves everything over to https.

Per earlier review comments, this commit only updates the SRC_URI links.
This makes the review easier to digest and does the minimum required.
There are still some links like HOMEPAGE, BUGTRACKER, and general
comments within the recipes that have been left as-is (as they have no
impact on the main issue which is a download and build of the software).

For testing I wrote a script which verifies a wget on all of the updated
links. It found 4 recipes with issues so I left them as-is with http.
They were:
- meta/recipes-bsp/libacpi/libacpi_0.2.bb
- meta/recipes-connectivity/socat/socat_1.8.1.0.bb
- meta/recipes-extended/mc/mc_4.8.33.bb
- meta/recipes-support/popt/popt_1.19.bb

The first one has no https available and the other ones had untrusted
certificates.

Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
---
 meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb | 2 +-
 meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb   | 2 +-
 .../recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb       | 2 +-
 .../recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb       | 2 +-
 .../recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb       | 2 +-
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb                   | 2 +-
 meta/recipes-bsp/v86d/v86d_0.1.10.bb                          | 2 +-
 meta/recipes-connectivity/iw/iw_6.17.bb                       | 2 +-
 meta/recipes-connectivity/kea/kea_3.0.2.bb                    | 2 +-
 meta/recipes-connectivity/openssl/openssl_3.5.4.bb            | 2 +-
 .../wpa-supplicant/wpa-supplicant_2.11.bb                     | 2 +-
 meta/recipes-core/dropbear/dropbear_2025.89.bb                | 2 +-
 meta/recipes-core/libxml/libxml2_2.15.1.bb                    | 2 +-
 .../desktop-file-utils/desktop-file-utils_0.28.bb             | 2 +-
 meta/recipes-devtools/diffstat/diffstat_1.68.bb               | 2 +-
 meta/recipes-devtools/intltool/intltool_0.51.0.bb             | 2 +-
 meta/recipes-devtools/libedit/libedit_20251016-3.1.bb         | 2 +-
 meta/recipes-devtools/lua/lua_5.4.8.bb                        | 4 ++--
 meta/recipes-devtools/nasm/nasm_3.01.bb                       | 2 +-
 meta/recipes-devtools/opkg/opkg_0.9.0.bb                      | 2 +-
 meta/recipes-devtools/orc/orc_0.4.42.bb                       | 2 +-
 meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb         | 2 +-
 meta/recipes-devtools/perl/libxml-perl_0.08.bb                | 2 +-
 meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb         | 2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb                    | 4 ++--
 meta/recipes-devtools/python/python3-dbus_1.4.0.bb            | 2 +-
 meta/recipes-devtools/python/python3_3.14.2.bb                | 2 +-
 meta/recipes-devtools/ruby/ruby_3.4.7.bb                      | 2 +-
 meta/recipes-devtools/unifdef/unifdef_2.12.bb                 | 2 +-
 meta/recipes-extended/iptables/iptables_1.8.11.bb             | 2 +-
 meta/recipes-extended/less/less_685.bb                        | 2 +-
 meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb             | 2 +-
 meta/recipes-extended/pigz/pigz_2.8.bb                        | 2 +-
 meta/recipes-extended/slang/slang_2.3.3.bb                    | 2 +-
 meta/recipes-graphics/cairo/cairo_1.18.4.bb                   | 2 +-
 meta/recipes-graphics/drm/libdrm_2.4.131.bb                   | 2 +-
 .../startup-notification/startup-notification_0.12.bb         | 2 +-
 meta/recipes-graphics/wayland/mtdev_1.1.7.bb                  | 2 +-
 meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb        | 2 +-
 meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb               | 2 +-
 meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb              | 2 +-
 meta/recipes-graphics/xrestop/xrestop_0.4.bb                  | 2 +-
 meta/recipes-multimedia/flac/flac_1.5.0.bb                    | 2 +-
 meta/recipes-multimedia/libogg/libogg_1.3.6.bb                | 2 +-
 meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb          | 2 +-
 meta/recipes-multimedia/libtiff/tiff_4.7.1.bb                 | 2 +-
 meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb          | 2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb         | 2 +-
 meta/recipes-multimedia/speex/speex_1.2.1.bb                  | 2 +-
 meta/recipes-multimedia/speex/speexdsp_1.2.1.bb               | 2 +-
 meta/recipes-sato/libptytty/libptytty_2.0.bb                  | 2 +-
 meta/recipes-support/consolekit/consolekit_0.4.6.bb           | 2 +-
 meta/recipes-support/itstool/itstool_2.0.7.bb                 | 2 +-
 meta/recipes-support/libdaemon/libdaemon_0.14.bb              | 2 +-
 meta/recipes-support/libevdev/libevdev_1.13.6.bb              | 2 +-
 meta/recipes-support/libssh2/libssh2_1.11.1.bb                | 2 +-
 meta/recipes-support/liburcu/liburcu_0.15.5.bb                | 2 +-
 meta/recipes-support/lzo/lzo_2.10.bb                          | 2 +-
 meta/recipes-support/lzop/lzop_1.04.bb                        | 2 +-
 meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb     | 2 +-
 meta/recipes-support/sqlite/sqlite3_3.51.2.bb                 | 2 +-
 meta/recipes-support/taglib/taglib_2.1.1.bb                   | 2 +-
 62 files changed, 64 insertions(+), 64 deletions(-)

diff --git a/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb b/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb
index 03e082e83f..6fdd2a4c78 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb
@@ -3,7 +3,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/syslinux-${PV}.tar.xz \
+SRC_URI = "https://downloads.yoctoproject.org/mirror/sources/syslinux-${PV}.tar.xz \
            file://file1 \
            file://file2"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb b/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb
index f6960320db..27af67e509 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb
@@ -3,7 +3,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "libxres libxext virtual/libx11 ncurses"
 
-SRC_URI = "http://downloads.yoctoproject.org/releases/xrestop/xrestop-0.4.tar.gz \
+SRC_URI = "https://downloads.yoctoproject.org/releases/xrestop/xrestop-0.4.tar.gz \
            file://readme.patch.gz \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
index 254ea45708..3cef4d4143 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Pipe viewer test recipe for devtool upgrade test"
 LICENSE = "Artistic-2.0"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
 
-SRC_URI = "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz \
+SRC_URI = "https://www.ivarch.com/programs/sources/pv-${PV}.tar.gz \
            file://0001-Add-a-note-line-to-the-quick-reference.patch \
            file://backported.patch \
           "
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb
index 0501e2025f..33fa7b89b3 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Pipe viewer test recipe for devtool upgrade test"
 LICENSE = "Artistic-2.0"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
 
-SRC_URI = "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz"
+SRC_URI = "https://www.ivarch.com/programs/sources/pv-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb
index 71c03653f7..9e90f1f87e 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Pipe viewer test recipe for devtool upgrade test"
 LICENSE = "Artistic-2.0"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
 
-SRC_URI = "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz"
+SRC_URI = "https://www.ivarch.com/programs/sources/pv-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
index 8756511c17..3efe814162 100644
--- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
+++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/pm-pmu.c;beginline=1;endline=22;md5=3c1ddbc54e735fb4a0386e14c78a3147"
 
-SRC_URI = "http://pm-utils.freedesktop.org/releases/pm-utils-${PV}.tar.gz"
+SRC_URI = "https://pm-utils.freedesktop.org/releases/pm-utils-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "8ed899032866d88b2933a1d34cc75e8ae42dcde20e1cc21836baaae3d4370c0b"
 
diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index 3bc9b24487..77b6702034 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://README;md5=94ac1971e4f2309dc322d598e7b1f7dd"
 
 RRECOMMENDS:${PN} = "kernel-module-uvesafb"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/v/${BPN}/${BPN}_${PV}.orig.tar.gz \
+SRC_URI = "https://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/v/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://Update-x86emu-from-X.org.patch \
            file://ar-from-env.patch \
            file://Support-for-cross-compilation.patch \
diff --git a/meta/recipes-connectivity/iw/iw_6.17.bb b/meta/recipes-connectivity/iw/iw_6.17.bb
index a9a4695d39..01ab2838a3 100644
--- a/meta/recipes-connectivity/iw/iw_6.17.bb
+++ b/meta/recipes-connectivity/iw/iw_6.17.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=878618a5c4af25e9b93ef0be1a93f774"
 
 DEPENDS = "libnl"
 
-SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
+SRC_URI = "https://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch \
            file://separate-objdir.patch \
 "
diff --git a/meta/recipes-connectivity/kea/kea_3.0.2.bb b/meta/recipes-connectivity/kea/kea_3.0.2.bb
index f46cb1bf80..9641a00893 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.2.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb634ed1d923b8b8fd1ed7ffc9b70ae4"
 
 DEPENDS = "boost log4cplus openssl"
 
-SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
+SRC_URI = "https://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
            file://kea-dhcp4.service \
            file://kea-dhcp6.service \
            file://kea-dhcp-ddns.service \
diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.4.bb b/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
index e760baf3a0..d6c61a2e28 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
@@ -7,7 +7,7 @@ SECTION = "libs/network"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c75985e733726beaba57bc5253e96d04"
 
-SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
+SRC_URI = "https://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index 7c7a8bd9c1..9bdde52b77 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5ebcb90236d1ad640558c3d3cd3035df \
 
 DEPENDS = "dbus libnl"
 
-SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
+SRC_URI = "https://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://wpa-supplicant.sh \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
diff --git a/meta/recipes-core/dropbear/dropbear_2025.89.bb b/meta/recipes-core/dropbear/dropbear_2025.89.bb
index 957a0901fb..5f2b546c12 100644
--- a/meta/recipes-core/dropbear/dropbear_2025.89.bb
+++ b/meta/recipes-core/dropbear/dropbear_2025.89.bb
@@ -12,7 +12,7 @@ DEPENDS = "zlib virtual/crypt"
 RPROVIDES:${PN} = "ssh sshd"
 RCONFLICTS:${PN} = "openssh-sshd openssh"
 
-SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
+SRC_URI = "https://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://0001-urandom-xauth-changes-to-options.h.patch \
            file://init \
            file://dropbearkey.service \
diff --git a/meta/recipes-core/libxml/libxml2_2.15.1.bb b/meta/recipes-core/libxml/libxml2_2.15.1.bb
index 736aaea00e..05586e360b 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.1.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.1.bb
@@ -14,7 +14,7 @@ DEPENDS = "zlib virtual/libiconv"
 GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase
 
-SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testtar \
+SRC_URI += "https://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testtar \
            file://run-ptest \
            file://install-tests.patch \
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb
index 35537572fe..0d3ddbc621 100644
--- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb
+++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/validator.c;beginline=4;endline=27;md5=281e1114ee6c486a1a0a4295986b9416"
 
-SRC_URI = "http://www.freedesktop.org/software/${BPN}/releases/${BP}.tar.xz"
+SRC_URI = "https://www.freedesktop.org/software/${BPN}/releases/${BP}.tar.xz"
 SRC_URI[sha256sum] = "4401d4e231d842c2de8242395a74a395ca468cd96f5f610d822df33594898a70"
 
 DEPENDS = "glib-2.0"
diff --git a/meta/recipes-devtools/diffstat/diffstat_1.68.bb b/meta/recipes-devtools/diffstat/diffstat_1.68.bb
index 488f0834d6..27ef19d703 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.68.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.68.bb
@@ -7,7 +7,7 @@ SECTION = "devel"
 LICENSE = "X11"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c432d3aeb935855b2ca1ad2a0542ce4"
 
-SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
+SRC_URI = "https://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://run-ptest \
            file://avoid-check-user-break-cc.patch \
            "
diff --git a/meta/recipes-devtools/intltool/intltool_0.51.0.bb b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
index d582c87fdc..a8af6c8b1f 100644
--- a/meta/recipes-devtools/intltool/intltool_0.51.0.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "http://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz \
+SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz \
            file://intltool-nowarn.patch \
            file://perl-522-deprecations.patch \
            file://remove-perl-check.patch \
diff --git a/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb b/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
index 2ea75bba87..fc1b0c28cf 100644
--- a/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
@@ -10,7 +10,7 @@ DEPENDS = "ncurses"
 
 inherit autotools
 
-SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
+SRC_URI = "https://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
           "
 SRC_URI[sha256sum] = "21362b00653bbfc1c71f71a7578da66b5b5203559d43134d2dd7719e313ce041"
diff --git a/meta/recipes-devtools/lua/lua_5.4.8.bb b/meta/recipes-devtools/lua/lua_5.4.8.bb
index 1d37cddeb8..e143298632 100644
--- a/meta/recipes-devtools/lua/lua_5.4.8.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.8.bb
@@ -4,9 +4,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=305;endline=326;md5=0e573c143cb6491b41cf02cfbcb8c267"
 HOMEPAGE = "http://www.lua.org/"
 
-SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
+SRC_URI = "https://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
            file://lua.pc.in \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'http://www.lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=tarballtest file://run-ptest ', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'https://www.lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=tarballtest file://run-ptest ', '', d)} \
            "
 
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
diff --git a/meta/recipes-devtools/nasm/nasm_3.01.bb b/meta/recipes-devtools/nasm/nasm_3.01.bb
index 1e4719000f..21567e71c2 100644
--- a/meta/recipes-devtools/nasm/nasm_3.01.bb
+++ b/meta/recipes-devtools/nasm/nasm_3.01.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The Netwide Assembler (NASM) is an assembler and disassembler for
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6178dc4f5355e40552448080e67a214b"
 
-SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
+SRC_URI = "https://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
            file://0001-compiler.h-Backport-C23-support.patch \
diff --git a/meta/recipes-devtools/opkg/opkg_0.9.0.bb b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
index 7551f1bc49..50a892676e 100644
--- a/meta/recipes-devtools/opkg/opkg_0.9.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
@@ -12,7 +12,7 @@ DEPENDS = "libarchive zstd"
 
 PE = "1"
 
-SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
            file://0002-config.h.in-fix-typo.patch \
diff --git a/meta/recipes-devtools/orc/orc_0.4.42.bb b/meta/recipes-devtools/orc/orc_0.4.42.bb
index f56b9058c2..d8ce44474b 100644
--- a/meta/recipes-devtools/orc/orc_0.4.42.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.42.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Optimised Inner Loop Runtime Compiler is a Library and set of too
 LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
-SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
+SRC_URI = "https://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
 SRC_URI[sha256sum] = "7ec912ab59af3cc97874c456a56a8ae1eec520c385ec447e8a102b2bd122c90c"
 
 inherit meson pkgconfig
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
index b6d28c4bb3..b747a90cc0 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4342f85bf14a1fdd6a751573f1e61c03"
 
 DEPENDS += "expat"
 
-SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz \
+SRC_URI = "https://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz \
            file://0001-Makefile.PL-make-check_lib-cross-friendly.patch \
            "
 
diff --git a/meta/recipes-devtools/perl/libxml-perl_0.08.bb b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
index 728b606ed2..df06bbc3f3 100644
--- a/meta/recipes-devtools/perl/libxml-perl_0.08.bb
+++ b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=33;endline=35;md5=1705549eef7577a3d6
 
 DEPENDS += "libxml-parser-perl"
 
-SRC_URI = "http://www.cpan.org/modules/by-module/XML/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://www.cpan.org/modules/by-module/XML/${BPN}-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "4571059b7b5d48b7ce52b01389e95d798bf5cf2020523c153ff27b498153c9cb"
 
diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb b/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
index f5fd2d3f0e..f3a6fd1ca6 100644
--- a/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
+++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
@@ -10,7 +10,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf206df8c9fe775f1d4c484386491eac"
 DEPENDS += "libxml-parser-perl"
 
-SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Simple-${PV}.tar.gz"
+SRC_URI = "https://www.cpan.org/modules/by-module/XML/XML-Simple-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "531fddaebea2416743eb5c4fdfab028f502123d9a220405a4100e68fc480dbf8"
 
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index ed1e8fb3e0..222900b536 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -5,10 +5,10 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
            file://fallback-group \
            "
 SRC_URI:append:class-native = " \
-    http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=prebuilt \
+    https://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=prebuilt \
     file://older-glibc-symbols.patch"
 SRC_URI:append:class-nativesdk = " \
-    http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=prebuilt \
+    https://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=prebuilt \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
diff --git a/meta/recipes-devtools/python/python3-dbus_1.4.0.bb b/meta/recipes-devtools/python/python3-dbus_1.4.0.bb
index 2854eda30a..efc2e67ed9 100644
--- a/meta/recipes-devtools/python/python3-dbus_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-dbus_1.4.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=97f58951300aa52a9f9e3a62bd5c846c"
 DEPENDS = "expat dbus glib-2.0 virtual/libintl"
 
-SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.xz"
+SRC_URI = "https://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.xz"
 
 SRC_URI[sha256sum] = "c36b28f10ffcc8f1f798aca973bcc132f91f33eb9b6b8904381b4077766043d5"
 
diff --git a/meta/recipes-devtools/python/python3_3.14.2.bb b/meta/recipes-devtools/python/python3_3.14.2.bb
index 7481e70e13..99418386f4 100644
--- a/meta/recipes-devtools/python/python3_3.14.2.bb
+++ b/meta/recipes-devtools/python/python3_3.14.2.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=224f30639105a6ab845e068c2d0903ff"
 
-SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
+SRC_URI = "https://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://run-ptest \
            file://create_manifest3.py \
            file://get_module_deps3.py \
diff --git a/meta/recipes-devtools/ruby/ruby_3.4.7.bb b/meta/recipes-devtools/ruby/ruby_3.4.7.bb
index 2fbcfd1f1b..a191b96ac0 100644
--- a/meta/recipes-devtools/ruby/ruby_3.4.7.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.4.7.bb
@@ -18,7 +18,7 @@ DEPENDS:append:class-target = " ruby-native"
 DEPENDS:append:class-nativesdk = " ruby-native"
 
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
-SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
+SRC_URI = "https://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0001-extmk-fix-cross-compilation-of-external-gems.patch \
            file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch \
            file://run-ptest \
diff --git a/meta/recipes-devtools/unifdef/unifdef_2.12.bb b/meta/recipes-devtools/unifdef/unifdef_2.12.bb
index e3bd4eb0f9..6ef4bb4d68 100644
--- a/meta/recipes-devtools/unifdef/unifdef_2.12.bb
+++ b/meta/recipes-devtools/unifdef/unifdef_2.12.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3498caf346f6b77934882101749ada23 \
                     file://unifdef.c;endline=32;md5=6f4ee8085d6e6ab0f7cb4390e1a9c497 \
                     "
 
-SRC_URI = "http://dotat.at/prog/${BPN}/${BP}.tar.xz \
+SRC_URI = "https://dotat.at/prog/${BPN}/${BP}.tar.xz \
            file://0001-Don-t-use-C23-constexpr-keyword.patch"
 SRC_URI[sha256sum] = "43ce0f02ecdcdc723b2475575563ddb192e988c886d368260bc0a63aee3ac400"
 
diff --git a/meta/recipes-extended/iptables/iptables_1.8.11.bb b/meta/recipes-extended/iptables/iptables_1.8.11.bb
index 686dc5afe5..71a057d2e4 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.11.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.11.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://iptables/iptables.c;beginline=13;endline=25;md5=c5cffd09974558cf27d0f763df2a12dc \
 "
 
-SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.xz \
+SRC_URI = "https://netfilter.org/projects/iptables/files/iptables-${PV}.tar.xz \
            file://iptables.service \
            file://iptables.rules \
            file://ip6tables.service \
diff --git a/meta/recipes-extended/less/less_685.bb b/meta/recipes-extended/less/less_685.bb
index 904980a72f..c72d45eaf7 100644
--- a/meta/recipes-extended/less/less_685.bb
+++ b/meta/recipes-extended/less/less_685.bb
@@ -25,7 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     "
 DEPENDS = "ncurses"
 
-SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
index 8221d30283..e7eab40979 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
@@ -10,7 +10,7 @@ SECTION = "net"
 RDEPENDS:${PN} = "lighttpd-module-dirlisting"
 RRECOMMENDS:${PN} = "lighttpd-module-accesslog"
 
-SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.xz \
+SRC_URI = "https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.xz \
            file://index.html.lighttpd \
            file://lighttpd.conf \
            file://lighttpd \
diff --git a/meta/recipes-extended/pigz/pigz_2.8.bb b/meta/recipes-extended/pigz/pigz_2.8.bb
index fcf0c93e41..621ac93a40 100644
--- a/meta/recipes-extended/pigz/pigz_2.8.bb
+++ b/meta/recipes-extended/pigz/pigz_2.8.bb
@@ -8,7 +8,7 @@ SECTION = "console/utils"
 LICENSE = "Zlib & Apache-2.0"
 LIC_FILES_CHKSUM = "file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline=7;endline=21"
 
-SRC_URI = "http://zlib.net/${BPN}/fossils/${BP}.tar.gz"
+SRC_URI = "https://zlib.net/${BPN}/fossils/${BP}.tar.gz"
 SRC_URI[sha256sum] = "eb872b4f0e1f0ebe59c9f7bd8c506c4204893ba6a8492de31df416f0d5170fd0"
 PROVIDES:class-native += "gzip-native"
 
diff --git a/meta/recipes-extended/slang/slang_2.3.3.bb b/meta/recipes-extended/slang/slang_2.3.3.bb
index 05b8aff0f2..2938aa7cb6 100644
--- a/meta/recipes-extended/slang/slang_2.3.3.bb
+++ b/meta/recipes-extended/slang/slang_2.3.3.bb
@@ -14,7 +14,7 @@ DEPENDS = "ncurses virtual/libiconv"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a52a18a472d4f7e45479b06563717c02"
 
-SRC_URI = "http://www.jedsoft.org/releases/${BPN}/${BP}.tar.bz2 \
+SRC_URI = "https://www.jedsoft.org/releases/${BPN}/${BP}.tar.bz2 \
            file://no-x.patch \
            file://dont-link-to-host.patch \
            file://test-add-output-in-the-format-result-testname.patch \
diff --git a/meta/recipes-graphics/cairo/cairo_1.18.4.bb b/meta/recipes-graphics/cairo/cairo_1.18.4.bb
index 3f6d02f8d4..13f5b9dc9f 100644
--- a/meta/recipes-graphics/cairo/cairo_1.18.4.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.18.4.bb
@@ -27,7 +27,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77 \
 
 DEPENDS = "fontconfig freetype glib-2.0 libpng pixman zlib"
 
-SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
+SRC_URI = "https://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \
           "
 
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.131.bb b/meta/recipes-graphics/drm/libdrm_2.4.131.bb
index 1c55dd5550..e0a99c3c58 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.131.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.131.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c5
 PROVIDES = "drm"
 DEPENDS = "libpthread-stubs"
 
-SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
+SRC_URI = "https://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
 SRC_URI[sha256sum] = "45ba9983b51c896406a3d654de81d313b953b76e6391e2797073d543c5f617d5"
diff --git a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
index bdc91d7455..5ce60435a2 100644
--- a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
+++ b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
@@ -21,7 +21,7 @@ inherit autotools pkgconfig features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "http://www.freedesktop.org/software/startup-notification/releases/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://www.freedesktop.org/software/startup-notification/releases/${BPN}-${PV}.tar.gz \
            file://obsolete_automake_macros.patch \
            file://time_t.patch \
 "
diff --git a/meta/recipes-graphics/wayland/mtdev_1.1.7.bb b/meta/recipes-graphics/wayland/mtdev_1.1.7.bb
index 24803c4238..f81084dcea 100644
--- a/meta/recipes-graphics/wayland/mtdev_1.1.7.bb
+++ b/meta/recipes-graphics/wayland/mtdev_1.1.7.bb
@@ -11,7 +11,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea6bd0268bb0fcd6b27698616ceee5d6"
 
-SRC_URI = "http://bitmath.org/code/${BPN}/${BP}.tar.bz2"
+SRC_URI = "https://bitmath.org/code/${BPN}/${BP}.tar.bz2"
 SRC_URI[sha256sum] = "a107adad2101fecac54ac7f9f0e0a0dd155d954193da55c2340c97f2ff1d814e"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb
index 62384e6d2e..5ecc6d59da 100644
--- a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb
@@ -7,7 +7,7 @@ SECTION = "x11/libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6edc1fea03d959f0c2d743fe5ca746ad"
 
-SRC_URI = "http://xcb.freedesktop.org/dist/${BP}.tar.xz"
+SRC_URI = "https://xcb.freedesktop.org/dist/${BP}.tar.xz"
 SRC_URI[sha256sum] = "59da566decceba7c2a7970a4a03b48d9905f1262ff94410a649224e33d2442bc"
 
 inherit autotools
diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb
index fcd8aad303..9f12f3c9b0 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb
@@ -9,7 +9,7 @@ SECTION = "x11/libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 
-SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.xz \
+SRC_URI = "https://xcb.freedesktop.org/dist/libxcb-${PV}.tar.xz \
            file://0001-use-_Alignof-to-avoid-UB-in-ALIGNOF.patch"
 
 SRC_URI[sha256sum] = "599ebf9996710fea71622e6e184f3a8ad5b43d0e5fa8c4e407123c88a59a6d55"
diff --git a/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb b/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb
index 0da004f907..41fe8c1b2f 100644
--- a/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb
+++ b/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb
@@ -1,6 +1,6 @@
 require xcb-util.inc
 
-SRC_URI = "http://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.xz"
+SRC_URI = "https://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.xz"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://src/xcb_aux.c;endline=30;md5=ae305b9c2a38f9ba27060191046a6460 \
diff --git a/meta/recipes-graphics/xrestop/xrestop_0.4.bb b/meta/recipes-graphics/xrestop/xrestop_0.4.bb
index 0c237fcf56..e6758fd85b 100644
--- a/meta/recipes-graphics/xrestop/xrestop_0.4.bb
+++ b/meta/recipes-graphics/xrestop/xrestop_0.4.bb
@@ -13,7 +13,7 @@ SECTION = "x11/utils"
 
 DEPENDS = "libxres libxext virtual/libx11 ncurses"
 
-SRC_URI = "http://downloads.yoctoproject.org/releases/xrestop/xrestop-${PV}.tar.gz"
+SRC_URI = "https://downloads.yoctoproject.org/releases/xrestop/xrestop-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "67c2fc94a7ecedbaae0d1837e82e93d1d98f4a6d759828860e552119af3ce257"
 
diff --git a/meta/recipes-multimedia/flac/flac_1.5.0.bb b/meta/recipes-multimedia/flac/flac_1.5.0.bb
index e227133ad7..0fa22c4391 100644
--- a/meta/recipes-multimedia/flac/flac_1.5.0.bb
+++ b/meta/recipes-multimedia/flac/flac_1.5.0.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=802e79e394e372d01e863e3f4058cf40 \
                     file://include/FLAC/all.h;beginline=65;endline=70;md5=39aaf5e03c7364363884c8b8ddda8eea \
                     "
 
-SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
+SRC_URI = "https://downloads.xiph.org/releases/flac/${BP}.tar.xz \
            file://0001-API-documentation-replace-modules.html-by-topics.htm.patch"
 
 SRC_URI[sha256sum] = "f2c1c76592a82ffff8413ba3c4a1299b6c7ab06c734dee03fd88630485c2b920"
diff --git a/meta/recipes-multimedia/libogg/libogg_1.3.6.bb b/meta/recipes-multimedia/libogg/libogg_1.3.6.bb
index 4810f156f2..eb5d5eb620 100644
--- a/meta/recipes-multimedia/libogg/libogg_1.3.6.bb
+++ b/meta/recipes-multimedia/libogg/libogg_1.3.6.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
                     file://include/ogg/ogg.h;beginline=1;endline=11;md5=eda812856f13a3b1326eb8f020cc3b0b"
 
-SRC_URI = "http://downloads.xiph.org/releases/ogg/${BP}.tar.xz"
+SRC_URI = "https://downloads.xiph.org/releases/ogg/${BP}.tar.xz"
 
 SRC_URI[sha256sum] = "5c8253428e181840cd20d41f3ca16557a9cc04bad4a3d04cce84808677fa1061"
 
diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
index bacaf3aee6..04778192a4 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cf91718f59eb6a83d06dc7bcaf411132"
 DEPENDS = "libogg"
 
-SRC_URI = "http://downloads.xiph.org/releases/theora/libtheora-${PV}.tar.xz \
+SRC_URI = "https://downloads.xiph.org/releases/theora/libtheora-${PV}.tar.xz \
            file://0001-add-missing-files.patch"
 
 SRC_URI[sha256sum] = "ebdf77a8f5c0a8f7a9e42323844fa09502b34eb1d1fece7b5f54da41fe2122ec"
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
index 0d4b3a4abd..7ab625b272 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ab490c3088a0acff254eb2f8c577547"
 
 CVE_PRODUCT = "libtiff"
 
-SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
+SRC_URI = "https://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
 	   "
 
 SRC_URI[sha256sum] = "f698d94f3103da8ca7438d84e0344e453fe0ba3b7486e04c5bf7a9a3fabe9b69"
diff --git a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb
index d5bf5ff0fa..d53639971e 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb
+++ b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73d9c8942c60b846c3bad13cc6c2e520 \
                     file://include/vorbis/vorbisenc.h;beginline=1;endline=11;md5=c95a4ac2b4125f00a9acf61449ebb843"
 DEPENDS = "libogg"
 
-SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.xz \
+SRC_URI = "https://downloads.xiph.org/releases/vorbis/${BP}.tar.xz \
            file://0001-configure-Check-for-clang.patch \
           "
 SRC_URI[sha256sum] = "b33cc4934322bcbf6efcbacf49e3ca01aadbea4114ec9589d1b1e9d20f72954b"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
index 6c172b4ec7..ef9fa36e65 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-SRC_URI = "http://www.freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
+SRC_URI = "https://www.freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
            file://0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch \
            file://volatiles.04_pulse \
diff --git a/meta/recipes-multimedia/speex/speex_1.2.1.bb b/meta/recipes-multimedia/speex/speex_1.2.1.bb
index c40198fa8f..6806664dac 100644
--- a/meta/recipes-multimedia/speex/speex_1.2.1.bb
+++ b/meta/recipes-multimedia/speex/speex_1.2.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eff3f76350f52a99a3df5eec6b79c02a \
                     "
 DEPENDS = "libogg speexdsp"
 
-SRC_URI = "http://downloads.xiph.org/releases/speex/speex-${PV}.tar.gz"
+SRC_URI = "https://downloads.xiph.org/releases/speex/speex-${PV}.tar.gz"
 UPSTREAM_CHECK_REGEX = "speex-(?P<pver>\d+(\.\d+)+)\.tar"
 
 SRC_URI[sha256sum] = "4b44d4f2b38a370a2d98a78329fefc56a0cf93d1c1be70029217baae6628feea"
diff --git a/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb b/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb
index 435b56bbb8..469a0b9a82 100644
--- a/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb
+++ b/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eff3f76350f52a99a3df5eec6b79c02a"
 
-SRC_URI = "http://downloads.xiph.org/releases/speex/speexdsp-${PV}.tar.gz"
+SRC_URI = "https://downloads.xiph.org/releases/speex/speexdsp-${PV}.tar.gz"
 
 UPSTREAM_CHECK_REGEX = "speexdsp-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-sato/libptytty/libptytty_2.0.bb b/meta/recipes-sato/libptytty/libptytty_2.0.bb
index 1199f0f44b..85223a522b 100644
--- a/meta/recipes-sato/libptytty/libptytty_2.0.bb
+++ b/meta/recipes-sato/libptytty/libptytty_2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://software.schmorp.de/pkg/libptytty.html"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-SRC_URI = "http://dist.schmorp.de/libptytty/libptytty-${PV}.tar.gz \
+SRC_URI = "https://dist.schmorp.de/libptytty/libptytty-${PV}.tar.gz \
            file://0001-CMakeLists.txt-do-not-run-cross-binary.patch \
            "
 SRC_URI[sha256sum] = "8033ed3aadf28759660d4f11f2d7b030acf2a6890cb0f7926fb0cfa6739d31f7"
diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index acef3483bb..6cc7e6b135 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -15,7 +15,7 @@ inherit autotools pkgconfig features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "http://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-${PV}.tar.xz \
+SRC_URI = "https://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-${PV}.tar.xz \
            file://sepbuildfix.patch \
            file://add-polkit-configure-argument.patch \
 "
diff --git a/meta/recipes-support/itstool/itstool_2.0.7.bb b/meta/recipes-support/itstool/itstool_2.0.7.bb
index 3f0e9aaa52..fade3878bc 100644
--- a/meta/recipes-support/itstool/itstool_2.0.7.bb
+++ b/meta/recipes-support/itstool/itstool_2.0.7.bb
@@ -14,7 +14,7 @@ inherit autotools python3native
 
 DEPENDS = "python3-lxml-native"
 
-SRC_URI = "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "https://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-Fix-insufficiently-quoted-regular-expressions.patch \
            file://0002-Switch-from-libxml2-to-lxml.patch \
            file://0003-Fix-element-check.patch \
diff --git a/meta/recipes-support/libdaemon/libdaemon_0.14.bb b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
index a0378802c9..2be317cbff 100644
--- a/meta/recipes-support/libdaemon/libdaemon_0.14.bb
+++ b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://libdaemon/daemon.h;beginline=9;endline=21;md5=bd9fbe57cd96d1a5848a8ba12d9a6bf4"
 
-SRC_URI = "http://0pointer.de/lennart/projects/libdaemon/libdaemon-${PV}.tar.gz \
+SRC_URI = "https://0pointer.de/lennart/projects/libdaemon/libdaemon-${PV}.tar.gz \
            file://fix-includes.patch \
           "
 
diff --git a/meta/recipes-support/libevdev/libevdev_1.13.6.bb b/meta/recipes-support/libevdev/libevdev_1.13.6.bb
index 4a2cfee4c1..99f878df59 100644
--- a/meta/recipes-support/libevdev/libevdev_1.13.6.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.13.6.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=80c550b3197bcb8da7d7557ebcc3fc46 \
                     "
 
-SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
+SRC_URI = "https://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
 SRC_URI[sha256sum] = "73f215eccbd8233f414737ac06bca2687e67c44b97d2d7576091aa9718551110"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 11d7448687..39986fd533 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -7,7 +7,7 @@ DEPENDS = "zlib"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2fbf8f834408079bf1fcbadb9814b1bc"
 
-SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
+SRC_URI = "https://www.libssh2.org/download/${BP}.tar.gz \
            file://run-ptest \
            file://0001-Return-error-if-user-KEX-methods-are-invalid.patch \
            "
diff --git a/meta/recipes-support/liburcu/liburcu_0.15.5.bb b/meta/recipes-support/liburcu/liburcu_0.15.5.bb
index 94124c6391..3aced42e45 100644
--- a/meta/recipes-support/liburcu/liburcu_0.15.5.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.15.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c2a92498b6e88e276f986877995425b8 \
                     file://include/urcu/uatomic/x86.h;beginline=1;endline=6;md5=358d69272ba7b5f85e29e342430d440c \
                     "
 
-SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
+SRC_URI = "https://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
 SRC_URI[sha256sum] = "b2f787a8a83512c32599e71cdabcc5131464947b82014896bd11413b2d782de1"
 
diff --git a/meta/recipes-support/lzo/lzo_2.10.bb b/meta/recipes-support/lzo/lzo_2.10.bb
index fbf9f2dbac..6d020c4b0d 100644
--- a/meta/recipes-support/lzo/lzo_2.10.bb
+++ b/meta/recipes-support/lzo/lzo_2.10.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/lzo_init.c;beginline=5;endline=25;md5=9ae697ca01829b0a383c5d2d163e0108"
 
-SRC_URI = "http://www.oberhumer.com/opensource/lzo/download/lzo-${PV}.tar.gz \
+SRC_URI = "https://www.oberhumer.com/opensource/lzo/download/lzo-${PV}.tar.gz \
            file://0001-Use-memcpy-instead-of-reinventing-it.patch \
 	   file://0001-Add-pkgconfigdir-to-solve-the-undefine-error.patch \
            file://run-ptest \
diff --git a/meta/recipes-support/lzop/lzop_1.04.bb b/meta/recipes-support/lzop/lzop_1.04.bb
index c32aa53422..67d208fa3f 100644
--- a/meta/recipes-support/lzop/lzop_1.04.bb
+++ b/meta/recipes-support/lzop/lzop_1.04.bb
@@ -12,7 +12,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/lzop.c;beginline=5;endline=21;md5=23d767de7754eb24b9e900b025cf7fc8"
 
-SRC_URI = "http://www.lzop.org/download/${BP}.tar.gz \
+SRC_URI = "https://www.lzop.org/download/${BP}.tar.gz \
            file://acinclude.m4 \
           "
 SRC_URI[sha256sum] = "7e72b62a8a60aff5200a047eea0773a8fb205caf7acbe1774d95147f305a2f41"
diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
index 9e41c5b9ed..db89fe3dff 100644
--- a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
+++ b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://0pointer.de/lennart/projects/nss-myhostname/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-SRC_URI = "http://0pointer.de/lennart/projects/nss-myhostname/nss-myhostname-${PV}.tar.gz \
+SRC_URI = "https://0pointer.de/lennart/projects/nss-myhostname/nss-myhostname-${PV}.tar.gz \
            "
 
 SRC_URI[sha256sum] = "2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67e7caf2"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.2.bb b/meta/recipes-support/sqlite/sqlite3_3.51.2.bb
index 6837293f6a..a9cdd18d26 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.2.bb
@@ -3,7 +3,7 @@ require sqlite3.inc
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
-SRC_URI = "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI = "https://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 SRC_URI[sha256sum] = "fbd89f866b1403bb66a143065440089dd76100f2238314d92274a082d4f2b7bb"
 
 SRC_URI += "file://0001-Add-option-to-disable-zlib.patch"
diff --git a/meta/recipes-support/taglib/taglib_2.1.1.bb b/meta/recipes-support/taglib/taglib_2.1.1.bb
index 6b700578b8..dd790db1d4 100644
--- a/meta/recipes-support/taglib/taglib_2.1.1.bb
+++ b/meta/recipes-support/taglib/taglib_2.1.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "zlib utfcpp"
 
-SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
+SRC_URI = "https://taglib.github.io/releases/${BP}.tar.gz"
 
 SRC_URI[sha256sum] = "3716d31f7c83cbf17b67c8cf44dd82b2a2f17e6780472287a16823e70305ddba"
 
-- 
2.43.0


