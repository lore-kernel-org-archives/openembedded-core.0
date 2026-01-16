Return-Path: <geissonator@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E91C982FA
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 19:13:47 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5040.1768590824348666316
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 11:13:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: geissonator@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-45c715116dbso1620240b6e.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 11:13:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768590823; x=1769195623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98HR7JAJoLs0YQih/jryCHRKKmciNc1NFO5BcOIbpJY=;
        b=EJ2CXGrvEU7BjpZpUahSw3UXNRNkktGl2Olm6irfRJmZb3MfqgRVX8BJOWBzotjfuE
         kPQi/fa54Wig9PtHnMephy5J4Fh/OECu1vFvA+0t+8caD+d3qUhCdQ3XuwiIJXPWtRF3
         T5mIwvZcpCJvUIdjfvL0r+iVeJ6f0H6OfM7O1uDbvnqpGDZnkrxBGye2eXqN8Hi85Ai4
         9voLvb+pPxedCDd84F0NwezJYnIvyMDWQcJ7ue0MKPj/27FCEEpN3c8zOsvmNNTs9qga
         Knh0v8JVzlIteQ960plL9V8+4MvzdXDJReKwGpUgxSggZacxarDmt6kIJBxkC8CkZSMU
         H5ng==
X-Gm-Message-State: AOJu0YzcNhXtRhuIZZahdOeEKFQpS12NB5LY5ZqhgF3v5WJ6ae/m3hfG
	A2Fi7j7jWcqizSxNDwIWKcZrcrr2+8mBSk22yVFXypTMTUByXbpM8WxS1TUEvQ==
X-Gm-Gg: AY/fxX5ckpnzc1B28WdGhj5rXc2dCNxonUcghiqvUk5OFq12QDjWbakRThJ/9KzOmFA
	P2ddO7HWwFY9fxIocQ4K4sUuoECrzUaVCeXupFSEgTD5AwsAR97ZwwLDD9s1md8Y5tNe4InubQ7
	N+T93b914OEvkcL3q6k242OTcgI8KQFNg219XiCPSiTgPi3zdhFmPS1H4DxrpgwjH1PrQk/DKj4
	qHtyelEczBEGOmhZhOFrACF5i5cFsIrLanhasW5VD2V8Ifo8FlEveWXHerxkUqVOWHe5IrkfORP
	wcppapitxypRKZoeqmIN110YTCVVGwrY08f2MDo7yB+dO719JYLk/V+WuH+MbHkDCLhPl11Pe6c
	kOyIQGWcyVJNKKCluwqyBTdqdSxV7308Vdb7Po5T5dTHTXWAmOJOQhyhyXgSrwKxEh90FfQ29N4
	VSB8+vu4DGaL7deJUPHG24Sa0Violh2W1PhMsuUynxpBHG3IxClXKQTa2mZKwdnMlc7sRfAUCDq
	BqDVCpme5Ji
X-Received: by 2002:a05:6808:1909:b0:450:31cb:5ad7 with SMTP id 5614622812f47-45c9be84c67mr2165065b6e.12.1768590820867;
        Fri, 16 Jan 2026 11:13:40 -0800 (PST)
Received: from IBM-PW05FM02.ibm.com ([136.49.149.46])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45c9decace9sm1691226b6e.4.2026.01.16.11.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 11:13:39 -0800 (PST)
From: Andrew Geissler <geissonator@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrew Geissler <geissonator@yahoo.com>
Subject: [PATCH] global: convert all http to https
Date: Fri, 16 Jan 2026 13:12:56 -0600
Message-ID: <20260116191256.3265364-1-geissonator@yahoo.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 19:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229563

Recently an internal lab network turned off all outgoing http access.
This means we are unable to build oe-core without manually setting up a
local cache or mirror. Given the security vulnerabilities around http and
that moving to https appears to have no impact on building, this commit
just moves everything over to https.

I wrote a python script and had it leave the following http links as-is:
- http://localhost, http://127.0.0.1
- http://example.com
- http://errors.yoctoproject.org

For testing I confirmed core-image-minimal still builds and did some
random validation of the links changed (but not every one of them).

Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
---
 meta/conf/distro/include/maintainers.inc                  | 4 ++--
 meta/conf/distro/include/yocto-uninative.inc              | 2 +-
 meta/recipes-bsp/acpid/acpid.inc                          | 4 ++--
 meta/recipes-bsp/alsa-state/alsa-state.bb                 | 4 ++--
 meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb                 | 2 +-
 meta/recipes-bsp/grub/grub2.inc                           | 2 +-
 meta/recipes-bsp/libacpi/libacpi_0.2.bb                   | 6 +++---
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb                   | 4 ++--
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb               | 4 ++--
 meta/recipes-bsp/setserial/setserial_2.17.bb              | 2 +-
 meta/recipes-bsp/u-boot/u-boot-common.inc                 | 2 +-
 meta/recipes-bsp/usbutils/usbutils_019.bb                 | 2 +-
 meta/recipes-bsp/v86d/v86d_0.1.10.bb                      | 2 +-
 meta/recipes-connectivity/avahi/avahi_0.8.bb              | 2 +-
 meta/recipes-connectivity/bluez5/bluez5.inc               | 2 +-
 meta/recipes-connectivity/connman/connman-gnome_0.7.bb    | 2 +-
 meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb         | 2 +-
 meta/recipes-connectivity/inetutils/inetutils_2.7.bb      | 2 +-
 meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb     | 2 +-
 meta/recipes-connectivity/iw/iw_6.17.bb                   | 2 +-
 meta/recipes-connectivity/kea/kea_3.0.2.bb                | 4 ++--
 meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb       | 4 ++--
 .../mobile-broadband-provider-info_20251101.bb            | 2 +-
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb    | 2 +-
 meta/recipes-connectivity/ofono/ofono_2.19.bb             | 2 +-
 meta/recipes-connectivity/openssh/openssh_10.2p1.bb       | 2 +-
 meta/recipes-connectivity/openssl/openssl_3.5.4.bb        | 6 +++---
 meta/recipes-connectivity/ppp/ppp_2.5.2.bb                | 4 ++--
 meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb   | 2 +-
 meta/recipes-connectivity/socat/socat_1.8.1.0.bb          | 4 ++--
 .../wpa-supplicant/wpa-supplicant_2.11.bb                 | 6 +++---
 meta/recipes-core/coreutils/coreutils_9.9.bb              | 6 +++---
 meta/recipes-core/dbus-wait/dbus-wait_git.bb              | 2 +-
 meta/recipes-core/dropbear/dropbear_2025.89.bb            | 6 +++---
 meta/recipes-core/gettext/gettext-sources.inc             | 2 +-
 meta/recipes-core/glib-2.0/glib.inc                       | 2 +-
 .../glib-networking/glib-networking_2.80.1.bb             | 2 +-
 meta/recipes-core/glibc/cross-localedef-native_2.42.bb    | 2 +-
 meta/recipes-core/glibc/glibc-common.inc                  | 2 +-
 meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb      | 2 +-
 meta/recipes-core/kbd/kbd_2.9.0.bb                        | 2 +-
 meta/recipes-core/libcgroup/libcgroup_3.2.0.bb            | 2 +-
 meta/recipes-core/libxml/libxml2_2.15.1.bb                | 4 ++--
 meta/recipes-core/musl/musl.inc                           | 2 +-
 meta/recipes-core/ncurses/ncurses.inc                     | 2 +-
 meta/recipes-core/netbase/netbase_6.5.bb                  | 2 +-
 meta/recipes-core/psplash/psplash_git.bb                  | 2 +-
 meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb          | 2 +-
 meta/recipes-core/systemd/systemd-compat-units.bb         | 2 +-
 meta/recipes-core/systemd/systemd.inc                     | 2 +-
 meta/recipes-core/sysvinit/sysvinit_3.14.bb               | 2 +-
 meta/recipes-core/update-rc.d/update-rc.d_0.8.bb          | 2 +-
 meta/recipes-core/zlib/zlib_1.3.1.bb                      | 4 ++--
 .../autoconf-archive/autoconf-archive_2024.10.16.bb       | 2 +-
 meta/recipes-devtools/autoconf/autoconf_2.72.bb           | 2 +-
 meta/recipes-devtools/automake/automake.inc               | 2 +-
 meta/recipes-devtools/binutils/binutils.inc               | 4 ++--
 meta/recipes-devtools/bison/bison_3.8.2.bb                | 2 +-
 meta/recipes-devtools/ccache/ccache_4.12.2.bb             | 2 +-
 meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb    | 2 +-
 meta/recipes-devtools/clang/clang-cross-canadian_git.bb   | 2 +-
 meta/recipes-devtools/clang/clang-cross_git.bb            | 2 +-
 meta/recipes-devtools/clang/clang-crosssdk_git.bb         | 2 +-
 meta/recipes-devtools/clang/clang_git.bb                  | 2 +-
 meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb | 2 +-
 meta/recipes-devtools/clang/compiler-rt_git.bb            | 2 +-
 meta/recipes-devtools/clang/libcxx_git.bb                 | 2 +-
 meta/recipes-devtools/clang/llvm_git.bb                   | 2 +-
 meta/recipes-devtools/clang/nativesdk-clang-glue.bb       | 2 +-
 meta/recipes-devtools/cmake/cmake.inc                     | 4 ++--
 .../desktop-file-utils/desktop-file-utils_0.28.bb         | 4 ++--
 meta/recipes-devtools/diffstat/diffstat_1.68.bb           | 4 ++--
 meta/recipes-devtools/dmidecode/dmidecode_3.7.bb          | 2 +-
 meta/recipes-devtools/dnf/dnf_4.24.0.bb                   | 2 +-
 .../docbook-xml/docbook-xsl-stylesheets_1.79.1.bb         | 4 ++--
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc             | 2 +-
 meta/recipes-devtools/elfutils/elfutils_0.194.bb          | 2 +-
 meta/recipes-devtools/expect/expect_5.45.4.bb             | 4 ++--
 meta/recipes-devtools/fdisk/gptfdisk_1.0.10.bb            | 2 +-
 meta/recipes-devtools/file/file_5.46.bb                   | 2 +-
 meta/recipes-devtools/flex/flex_2.6.4.bb                  | 2 +-
 meta/recipes-devtools/gcc/gcc-common.inc                  | 2 +-
 meta/recipes-devtools/gdb/gdb-common.inc                  | 2 +-
 meta/recipes-devtools/git/git_2.52.0.bb                   | 2 +-
 meta/recipes-devtools/go/go-binary-native_1.25.5.bb       | 2 +-
 meta/recipes-devtools/go/go-common.inc                    | 2 +-
 meta/recipes-devtools/intltool/intltool_0.51.0.bb         | 2 +-
 meta/recipes-devtools/libedit/libedit_20251016-3.1.bb     | 4 ++--
 meta/recipes-devtools/libtool/libtool-2.5.4.inc           | 2 +-
 meta/recipes-devtools/log4cplus/log4cplus_2.1.2.bb        | 4 ++--
 meta/recipes-devtools/lua/lua_5.4.8.bb                    | 6 +++---
 meta/recipes-devtools/make/make.inc                       | 2 +-
 meta/recipes-devtools/meson/meson_1.10.0.bb               | 2 +-
 meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb              | 2 +-
 meta/recipes-devtools/mtools/mtools_4.0.49.bb             | 2 +-
 meta/recipes-devtools/nasm/nasm_3.01.bb                   | 4 ++--
 meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb      | 2 +-
 meta/recipes-devtools/opkg/opkg_0.9.0.bb                  | 2 +-
 meta/recipes-devtools/orc/orc_0.4.41.bb                   | 4 ++--
 meta/recipes-devtools/patch/patch.inc                     | 2 +-
 meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb     | 2 +-
 meta/recipes-devtools/perl/libxml-perl_0.08.bb            | 2 +-
 meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb     | 2 +-
 meta/recipes-devtools/perl/perl_5.40.2.bb                 | 2 +-
 meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb            | 2 +-
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb          | 4 ++--
 meta/recipes-devtools/pseudo/pseudo.inc                   | 2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb                | 4 ++--
 meta/recipes-devtools/python/python-pycryptodome.inc      | 2 +-
 meta/recipes-devtools/python/python3-attrs_25.4.0.bb      | 2 +-
 meta/recipes-devtools/python/python3-babel_2.17.0.bb      | 2 +-
 meta/recipes-devtools/python/python3-certifi_2026.1.4.bb  | 2 +-
 meta/recipes-devtools/python/python3-cffi_2.0.0.bb        | 2 +-
 meta/recipes-devtools/python/python3-click_8.3.1.bb       | 2 +-
 meta/recipes-devtools/python/python3-dbus_1.4.0.bb        | 4 ++--
 meta/recipes-devtools/python/python3-docutils_0.22.4.bb   | 2 +-
 meta/recipes-devtools/python/python3-git_3.1.43.bb        | 2 +-
 meta/recipes-devtools/python/python3-gitdb_4.0.12.bb      | 2 +-
 meta/recipes-devtools/python/python3-iso8601_2.1.0.bb     | 2 +-
 meta/recipes-devtools/python/python3-magic_0.4.27.bb      | 2 +-
 meta/recipes-devtools/python/python3-mako_1.3.10.bb       | 2 +-
 meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb  | 2 +-
 meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb      | 2 +-
 meta/recipes-devtools/python/python3-pycairo_1.29.0.bb    | 4 ++--
 meta/recipes-devtools/python/python3-pygments_2.19.2.bb   | 2 +-
 meta/recipes-devtools/python/python3-pysocks_1.7.1.bb     | 2 +-
 meta/recipes-devtools/python/python3-pytz_2025.2.bb       | 2 +-
 .../python/python3-semantic-version_2.10.0.bb             | 2 +-
 meta/recipes-devtools/python/python3-smmap_6.0.0.bb       | 2 +-
 .../python/python3-sortedcontainers_2.4.0.bb              | 2 +-
 meta/recipes-devtools/python/python3-sphinx_9.1.0.bb      | 2 +-
 .../python/python3-sphinxcontrib-qthelp_2.0.0.bb          | 2 +-
 meta/recipes-devtools/python/python3_3.13.11.bb           | 4 ++--
 meta/recipes-devtools/qemu/qemu.inc                       | 2 +-
 meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb       | 2 +-
 meta/recipes-devtools/quilt/quilt.inc                     | 2 +-
 meta/recipes-devtools/rpm/rpm_4.20.1.bb                   | 2 +-
 meta/recipes-devtools/rsync/rsync_3.4.1.bb                | 4 ++--
 meta/recipes-devtools/ruby/ruby_3.4.7.bb                  | 4 ++--
 meta/recipes-devtools/rust/libstd-rs_1.92.0.bb            | 2 +-
 meta/recipes-devtools/rust/rust_1.92.0.bb                 | 2 +-
 meta/recipes-devtools/strace/strace_6.18.bb               | 2 +-
 meta/recipes-devtools/subversion/subversion_1.14.5.bb     | 2 +-
 meta/recipes-devtools/swig/swig_4.4.1.bb                  | 2 +-
 meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb      | 2 +-
 meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb        | 2 +-
 meta/recipes-devtools/tcltk/tcl_9.0.3.bb                  | 4 ++--
 meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb               | 4 ++--
 meta/recipes-devtools/unifdef/unifdef_2.12.bb             | 4 ++--
 meta/recipes-devtools/vala/vala_0.56.18.bb                | 2 +-
 meta/recipes-devtools/valgrind/valgrind_3.26.0.bb         | 4 ++--
 meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb         | 2 +-
 meta/recipes-extended/at/at_3.2.5.bb                      | 2 +-
 meta/recipes-extended/bash/bash.inc                       | 2 +-
 meta/recipes-extended/bc/bc_1.08.2.bb                     | 2 +-
 meta/recipes-extended/cpio/cpio_2.15.bb                   | 2 +-
 meta/recipes-extended/ed/ed_1.22.4.bb                     | 2 +-
 meta/recipes-extended/ethtool/ethtool_6.15.bb             | 2 +-
 meta/recipes-extended/findutils/findutils.inc             | 4 ++--
 meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb  | 2 +-
 meta/recipes-extended/gperf/gperf_3.3.bb                  | 2 +-
 meta/recipes-extended/grep/grep_3.12.bb                   | 4 ++--
 meta/recipes-extended/groff/groff_1.23.0.bb               | 2 +-
 meta/recipes-extended/gzip/gzip.inc                       | 2 +-
 meta/recipes-extended/hdparm/hdparm_9.65.bb               | 2 +-
 meta/recipes-extended/iptables/iptables_1.8.11.bb         | 6 +++---
 meta/recipes-extended/less/less_685.bb                    | 6 +++---
 meta/recipes-extended/libaio/libaio_0.3.113.bb            | 2 +-
 meta/recipes-extended/libarchive/libarchive_3.8.5.bb      | 2 +-
 meta/recipes-extended/libidn/libidn2_2.3.8.bb             | 2 +-
 meta/recipes-extended/libpipeline/libpipeline_1.5.8.bb    | 2 +-
 meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb          | 4 ++--
 meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb         | 6 +++---
 meta/recipes-extended/lsof/lsof_4.99.5.bb                 | 2 +-
 meta/recipes-extended/ltp/ltp_20250930.bb                 | 4 ++--
 meta/recipes-extended/lzip/lzip_1.25.bb                   | 2 +-
 meta/recipes-extended/man-db/man-db_2.13.1.bb             | 2 +-
 meta/recipes-extended/man-pages/man-pages_6.16.bb         | 2 +-
 meta/recipes-extended/mc/mc_4.8.33.bb                     | 4 ++--
 meta/recipes-extended/mdadm/mdadm_4.4.bb                  | 2 +-
 meta/recipes-extended/mingetty/mingetty_1.08.bb           | 2 +-
 meta/recipes-extended/net-tools/net-tools_2.10.bb         | 4 ++--
 meta/recipes-extended/parted/parted_3.6.bb                | 2 +-
 .../perl/libxml-namespacesupport-perl_1.12.bb             | 2 +-
 meta/recipes-extended/pigz/pigz_2.8.bb                    | 6 +++---
 meta/recipes-extended/psmisc/psmisc_23.7.bb               | 2 +-
 meta/recipes-extended/quota/quota_4.11.bb                 | 6 +++---
 meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb            | 4 ++--
 meta/recipes-extended/screen/screen_5.0.1.bb              | 2 +-
 meta/recipes-extended/sed/sed_4.9.bb                      | 2 +-
 meta/recipes-extended/shadow/shadow-sysroot_4.6.bb        | 4 ++--
 meta/recipes-extended/shadow/shadow_4.18.0.bb             | 4 ++--
 meta/recipes-extended/slang/slang_2.3.3.bb                | 8 ++++----
 meta/recipes-extended/sudo/sudo.inc                       | 4 ++--
 meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb          | 2 +-
 meta/recipes-extended/tar/tar_1.35.bb                     | 2 +-
 meta/recipes-extended/texinfo/texinfo_7.2.bb              | 2 +-
 meta/recipes-extended/time/time_1.9.bb                    | 2 +-
 meta/recipes-extended/timezone/timezone.inc               | 8 ++++----
 meta/recipes-extended/unzip/unzip_6.0.bb                  | 2 +-
 meta/recipes-extended/watchdog/watchdog-config.bb         | 4 ++--
 meta/recipes-extended/watchdog/watchdog_5.16.bb           | 6 +++---
 meta/recipes-extended/zip/zip_3.0.bb                      | 2 +-
 meta/recipes-extended/zstd/zstd_1.5.7.bb                  | 2 +-
 meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb                  | 2 +-
 meta/recipes-gnome/gtk+/gtk4_4.20.2.bb                    | 2 +-
 meta/recipes-graphics/cairo/cairo_1.18.4.bb               | 4 ++--
 meta/recipes-graphics/drm/libdrm_2.4.131.bb               | 4 ++--
 meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb     | 2 +-
 meta/recipes-graphics/glew/glew_2.2.0.bb                  | 6 +++---
 meta/recipes-graphics/graphene/graphene_1.10.8.bb         | 2 +-
 meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb         | 2 +-
 meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb         | 2 +-
 meta/recipes-graphics/libfakekey/libfakekey_git.bb        | 4 ++--
 meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb     | 4 ++--
 meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb          | 4 ++--
 .../matchbox-session/matchbox-session_0.1.bb              | 4 ++--
 meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb    | 4 ++--
 meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb      | 4 ++--
 meta/recipes-graphics/mesa/libglu_9.0.3.bb                | 2 +-
 meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb            | 2 +-
 meta/recipes-graphics/mesa/mesa.inc                       | 2 +-
 .../recipes-graphics/mini-x-session/mini-x-session_0.1.bb | 4 ++--
 meta/recipes-graphics/pango/pango_1.57.0.bb               | 4 ++--
 .../startup-notification/startup-notification_0.12.bb     | 4 ++--
 meta/recipes-graphics/wayland/libinput_1.30.1.bb          | 2 +-
 meta/recipes-graphics/wayland/mtdev_1.1.7.bb              | 4 ++--
 meta/recipes-graphics/wayland/wayland-protocols_1.47.bb   | 2 +-
 meta/recipes-graphics/wayland/wayland-utils_1.3.0.bb      | 2 +-
 meta/recipes-graphics/wayland/wayland_1.24.0.bb           | 2 +-
 meta/recipes-graphics/wayland/weston_14.0.2.bb            | 2 +-
 .../xcursor-transparent-theme_git.bb                      | 4 ++--
 .../xinput-calibrator/xinput-calibrator_0.8.0.bb          | 2 +-
 meta/recipes-graphics/xorg-app/xorg-app-common.inc        | 2 +-
 meta/recipes-graphics/xorg-driver/xorg-driver-common.inc  | 2 +-
 meta/recipes-graphics/xorg-font/xorg-font-common.inc      | 2 +-
 meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb     | 2 +-
 meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb     | 2 +-
 meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb    | 6 +++---
 meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb           | 4 ++--
 meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb     | 2 +-
 meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb           | 4 ++--
 meta/recipes-graphics/xorg-lib/xcb-util.inc               | 4 ++--
 meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb          | 2 +-
 meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb   | 2 +-
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc        | 2 +-
 meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb      | 2 +-
 meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb      | 2 +-
 meta/recipes-graphics/xorg-util/xorg-util-common.inc      | 2 +-
 .../xorg-xserver/xserver-xf86-config_0.1.bb               | 2 +-
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc       | 2 +-
 meta/recipes-graphics/xrestop/xrestop_0.4.bb              | 4 ++--
 meta/recipes-kernel/blktrace/blktrace_1.3.0.bb            | 2 +-
 meta/recipes-kernel/cryptodev/cryptodev.inc               | 2 +-
 meta/recipes-kernel/kexec/kexec-tools_2.0.32.bb           | 2 +-
 meta/recipes-kernel/kmod/kmod_34.2.bb                     | 2 +-
 meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb            | 2 +-
 meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb             | 2 +-
 meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb         | 4 ++--
 meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb       | 4 ++--
 meta/recipes-multimedia/alsa/alsa-tools_1.2.15.bb         | 4 ++--
 meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb       | 4 ++--
 meta/recipes-multimedia/flac/flac_1.5.0.bb                | 2 +-
 .../gstreamer/gstreamer1.0-libav_1.26.9.bb                | 2 +-
 .../gstreamer/gstreamer1.0-python_1.26.9.bb               | 2 +-
 .../gstreamer/gstreamer1.0-rtsp-server_1.26.9.bb          | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb  | 2 +-
 meta/recipes-multimedia/lame/lame_3.100.bb                | 2 +-
 meta/recipes-multimedia/libogg/libogg_1.3.6.bb            | 4 ++--
 meta/recipes-multimedia/libpng/libpng_1.6.53.bb           | 4 ++--
 meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb      | 4 ++--
 meta/recipes-multimedia/libtiff/tiff_4.7.1.bb             | 4 ++--
 meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb      | 2 +-
 meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb           | 4 ++--
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc         | 2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb     | 2 +-
 meta/recipes-multimedia/speex/speex_1.2.1.bb              | 4 ++--
 meta/recipes-multimedia/speex/speexdsp_1.2.1.bb           | 4 ++--
 meta/recipes-multimedia/webp/libwebp_1.6.0.bb             | 2 +-
 meta/recipes-multimedia/x264/x264_git.bb                  | 2 +-
 meta/recipes-sato/libptytty/libptytty_2.0.bb              | 4 ++--
 .../matchbox-config-gtk/matchbox-config-gtk_0.2.bb        | 4 ++--
 .../recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb | 4 ++--
 .../matchbox-keyboard/matchbox-keyboard_0.1.1.bb          | 4 ++--
 .../matchbox-panel-2/matchbox-panel-2_2.12.bb             | 4 ++--
 .../matchbox-sato/matchbox-session-sato_0.1.bb            | 4 ++--
 .../matchbox-terminal/matchbox-terminal_0.2.bb            | 4 ++--
 .../matchbox-theme-sato/matchbox-theme-sato.inc           | 4 ++--
 meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb                | 4 ++--
 meta/recipes-sato/puzzles/puzzles_git.bb                  | 2 +-
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc           | 2 +-
 .../sato-icon-theme/icon-naming-utils_0.8.90.bb           | 2 +-
 meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb  | 2 +-
 meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb  | 4 ++--
 .../recipes-sato/settings-daemon/settings-daemon_0.0.2.bb | 2 +-
 meta/recipes-support/apr/apr-util_1.6.3.bb                | 2 +-
 meta/recipes-support/apr/apr_1.7.6.bb                     | 2 +-
 meta/recipes-support/aspell/aspell_0.60.8.1.bb            | 2 +-
 meta/recipes-support/atk/at-spi2-core_2.58.3.bb           | 2 +-
 meta/recipes-support/attr/acl_2.3.2.bb                    | 4 ++--
 meta/recipes-support/attr/attr_2.5.2.bb                   | 2 +-
 meta/recipes-support/boost/boost-1.90.0.inc               | 4 ++--
 .../ca-certificates/ca-certificates_20250419.bb           | 2 +-
 meta/recipes-support/consolekit/consolekit_0.4.6.bb       | 4 ++--
 meta/recipes-support/dos2unix/dos2unix_7.5.3.bb           | 2 +-
 meta/recipes-support/fribidi/fribidi_1.0.16.bb            | 2 +-
 meta/recipes-support/gdbm/gdbm_1.26.bb                    | 2 +-
 meta/recipes-support/gmp/gmp.inc                          | 2 +-
 meta/recipes-support/gnupg/gnupg_2.5.14.bb                | 2 +-
 meta/recipes-support/gnutls/libtasn1_4.20.0.bb            | 2 +-
 meta/recipes-support/gpgme/gpgme_2.0.1.bb                 | 2 +-
 meta/recipes-support/itstool/itstool_2.0.7.bb             | 4 ++--
 meta/recipes-support/libassuan/libassuan_3.0.2.bb         | 2 +-
 meta/recipes-support/libcap/libcap_2.77.bb                | 2 +-
 meta/recipes-support/libdaemon/libdaemon_0.14.bb          | 4 ++--
 meta/recipes-support/libevdev/libevdev_1.13.6.bb          | 4 ++--
 meta/recipes-support/libevent/libevent_2.1.12.bb          | 2 +-
 meta/recipes-support/libffi/libffi_3.5.2.bb               | 2 +-
 meta/recipes-support/libfm/libfm-extra_1.3.2.bb           | 2 +-
 meta/recipes-support/libfm/libfm_1.3.2.bb                 | 2 +-
 meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb        | 2 +-
 meta/recipes-support/libgit2/libgit2_1.9.2.bb             | 2 +-
 meta/recipes-support/libgpg-error/libgpg-error_1.58.bb    | 2 +-
 .../libjitterentropy/libjitterentropy_3.6.3.bb            | 2 +-
 meta/recipes-support/libksba/libksba_1.6.7.bb             | 2 +-
 meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb | 2 +-
 meta/recipes-support/libmpc/libmpc.inc                    | 2 +-
 meta/recipes-support/libpcre/libpcre2_10.47.bb            | 2 +-
 meta/recipes-support/libpcre/libpcre_8.45.bb              | 2 +-
 meta/recipes-support/libssh2/libssh2_1.11.1.bb            | 4 ++--
 meta/recipes-support/libunistring/libunistring_1.4.1.bb   | 2 +-
 meta/recipes-support/libunwind/libunwind_1.8.3.bb         | 2 +-
 meta/recipes-support/liburcu/liburcu_0.15.5.bb            | 6 +++---
 meta/recipes-support/libusb/libusb1_1.0.29.bb             | 2 +-
 meta/recipes-support/libxslt/libxslt_1.1.45.bb            | 2 +-
 meta/recipes-support/lzo/lzo_2.10.bb                      | 4 ++--
 meta/recipes-support/lzop/lzop_1.04.bb                    | 4 ++--
 meta/recipes-support/mpfr/mpfr_4.2.2.bb                   | 2 +-
 meta/recipes-support/nettle/nettle_3.10.2.bb              | 2 +-
 meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb | 4 ++--
 meta/recipes-support/numactl/numactl_2.0.19.bb            | 2 +-
 meta/recipes-support/pinentry/pinentry_1.3.2.bb           | 4 ++--
 meta/recipes-support/popt/popt_1.19.bb                    | 2 +-
 meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb | 2 +-
 meta/recipes-support/re2c/re2c_4.3.1.bb                   | 2 +-
 meta/recipes-support/sass/libsass_3.6.6.bb                | 2 +-
 meta/recipes-support/serf/serf_1.3.10.bb                  | 2 +-
 .../shared-mime-info/shared-mime-info_2.4.bb              | 2 +-
 meta/recipes-support/sqlite/sqlite3.inc                   | 4 ++--
 meta/recipes-support/sqlite/sqlite3_3.51.2.bb             | 2 +-
 meta/recipes-support/taglib/taglib_2.1.1.bb               | 4 ++--
 meta/recipes-support/xxhash/xxhash_0.8.3.bb               | 2 +-
 352 files changed, 482 insertions(+), 482 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e830648945..45cc238422 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -12,11 +12,11 @@
 # questions in the future), but please try to do the following first:
 #
 #  - look in the Yocto Project Bugzilla
-#    (http://bugzilla.yoctoproject.org/) to see if a problem has
+#    (https://bugzilla.yoctoproject.org/) to see if a problem has
 #    already been reported
 #
 # - look through recent entries of the appropriate mailing list archives
-#   (http://lists.linuxtogo.org/pipermail/openembedded-core or
+#   (https://lists.linuxtogo.org/pipermail/openembedded-core or
 #    https://lists.yoctoproject.org/pipermail/poky/) to see if other
 #   people have run into similar problems or had similar questions
 #   answered.
diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index e9dc6c8640..cc8f2e9f5f 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -9,7 +9,7 @@
 UNINATIVE_MAXGLIBCVERSION = "2.42"
 UNINATIVE_VERSION = "5.0"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
+UNINATIVE_URL ?= "https://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
 UNINATIVE_CHECKSUM[aarch64] ?= "a25f2174d0cefcb22af005e9bc72ac01ae83b011c5b6d6d5bf00dac979877f76"
 UNINATIVE_CHECKSUM[i686] ?= "959cc2539b692f9b9862825c7324a0fe4d061fca742f6c259f67f581c59af956"
 UNINATIVE_CHECKSUM[x86_64] ?= "96045e8b1e242c8a849426a8506c7043f354b39f2bc0035192780e8205e23e9d"
diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/acpid.inc
index ba954563b6..c2d27ca81a 100644
--- a/meta/recipes-bsp/acpid/acpid.inc
+++ b/meta/recipes-bsp/acpid/acpid.inc
@@ -5,8 +5,8 @@ deprecated file /proc/acpi/event), and when an event occurs, executes programs \
 to handle the event. The programs it executes are configured through a set of \
 configuration files, which can be dropped into place by packages or by the \
 admin."
-HOMEPAGE = "http://sourceforge.net/projects/acpid2"
-BUGTRACKER = "http://sourceforge.net/p/acpid2/tickets/?source=navbar"
+HOMEPAGE = "https://sourceforge.net/projects/acpid2"
+BUGTRACKER = "https://sourceforge.net/p/acpid2/tickets/?source=navbar"
 SECTION = "base"
 LICENSE = "GPL-2.0-or-later"
 
diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index 9452a1a4ce..bf6ed8e102 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -1,11 +1,11 @@
 # Copyright Matthias Hentges <devel@hentges.net> (c) 2007
-# License: MIT (see http://www.opensource.org/licenses/mit-license.php
+# License: MIT (see https://www.opensource.org/licenses/mit-license.php
 #               for a copy of the license)
 #
 # Filename: alsa-state.bb
 
 SUMMARY = "Alsa scenario files to enable alsa state restoration"
-HOMEPAGE = "http://www.alsa-project.org/"
+HOMEPAGE = "https://www.alsa-project.org/"
 DESCRIPTION = "Alsa Scenario Files - an init script and state files to restore \
 sound state at system boot and save it at system shut down."
 LICENSE = "MIT & GPL-2.0-or-later"
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb
index 0f493b8414..843315c650 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Libraries for producing EFI binaries"
-HOMEPAGE = "http://sourceforge.net/projects/gnu-efi/"
+HOMEPAGE = "https://sourceforge.net/projects/gnu-efi/"
 DESCRIPTION = "GNU-EFI aims to Develop EFI applications for ARM-64, ARM-32, x86_64, IA-64 (IPF), IA-32 (x86), and MIPS platforms using the GNU toolchain and the EFI development environment."
 SECTION = "devel"
 LICENSE = "GPL-2.0-or-later & BSD-2-Clause"
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 125490183b..7d22ff8b4c 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -5,7 +5,7 @@ intended to unify bootloading across x86 operating systems. In \
 addition to loading the Linux kernel, it implements the Multiboot \
 standard, which allows for flexible loading of multiple boot images."
 
-HOMEPAGE = "http://www.gnu.org/software/grub/"
+HOMEPAGE = "https://www.gnu.org/software/grub/"
 SECTION = "bootloaders"
 
 LICENSE = "GPL-3.0-only"
diff --git a/meta/recipes-bsp/libacpi/libacpi_0.2.bb b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
index f939d11f4c..0c965aa6b2 100644
--- a/meta/recipes-bsp/libacpi/libacpi_0.2.bb
+++ b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
@@ -2,11 +2,11 @@ SUMMARY = "ACPI data gathering library"
 DESCRIPTION = "General purpose shared library for programs gathering ACPI data on Linux. \
 Thermal zones, battery infomration, fan information and AC states are implemented."
 SECTION = "base"
-HOMEPAGE = "http://www.ngolde.de/libacpi.html"
+HOMEPAGE = "https://www.ngolde.de/libacpi.html"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fec17f82f16630adf2dfb7d2a46f21c5"
 
-SRC_URI = "http://www.ngolde.de/download/libacpi-${PV}.tar.gz \
+SRC_URI = "https://www.ngolde.de/download/libacpi-${PV}.tar.gz \
 	   file://makefile-fix.patch \
 	   file://libacpi_fix_for_x32.patch \
 	   file://use_correct_strip_in_cross_environment.patch \
@@ -16,7 +16,7 @@ SRC_URI = "http://www.ngolde.de/download/libacpi-${PV}.tar.gz \
 
 SRC_URI[sha256sum] = "13086e31d428b9c125954d48ac497b754bbbce2ef34ea29ecd903e82e25bad29"
 
-UPSTREAM_CHECK_URI = "http://www.ngolde.de/libacpi.html"
+UPSTREAM_CHECK_URI = "https://www.ngolde.de/libacpi.html"
 
 inherit lib_package
 
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 777560bd22..cac8f85979 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -4,7 +4,7 @@ the public-domain version of Chuck Forsberg's rzsz package. \
 These programs use error correcting protocols ({z,x,y}modem) to send (sz, sx, sb) and \
 receive (rz, rx, rb) files over a dial-in serial port from a variety of programs \
 running under various operating systems. "
-HOMEPAGE = "http://www.ohse.de/uwe/software/lrzsz.html"
+HOMEPAGE = "https://www.ohse.de/uwe/software/lrzsz.html"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 			file://src/lrz.c;beginline=1;endline=10;md5=5276956373ff7d8758837f6399a1045f"
@@ -23,7 +23,7 @@ SRC_URI = "https://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
            "
 SRC_URI[sha256sum] = "c28b36b14bddb014d9e9c97c52459852f97bd405f89113f30bee45ed92728ff1"
 
-UPSTREAM_CHECK_URI = "http://ohse.de/uwe/software/lrzsz.html"
+UPSTREAM_CHECK_URI = "https://ohse.de/uwe/software/lrzsz.html"
 
 inherit autotools gettext
 
diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
index 8756511c17..8e4851ddb1 100644
--- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
+++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
@@ -1,12 +1,12 @@
 SECTION = "base"
 SUMMARY = "Utilities and scripts for power management"
 DESCRIPTION = "Simple shell command line tools to suspend and hibernate."
-HOMEPAGE = "http://pm-utils.freedesktop.org/wiki/"
+HOMEPAGE = "https://pm-utils.freedesktop.org/wiki/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/pm-pmu.c;beginline=1;endline=22;md5=3c1ddbc54e735fb4a0386e14c78a3147"
 
-SRC_URI = "http://pm-utils.freedesktop.org/releases/pm-utils-${PV}.tar.gz"
+SRC_URI = "https://pm-utils.freedesktop.org/releases/pm-utils-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "8ed899032866d88b2933a1d34cc75e8ae42dcde20e1cc21836baaae3d4370c0b"
 
diff --git a/meta/recipes-bsp/setserial/setserial_2.17.bb b/meta/recipes-bsp/setserial/setserial_2.17.bb
index e1e80e31ae..20f90b52e7 100644
--- a/meta/recipes-bsp/setserial/setserial_2.17.bb
+++ b/meta/recipes-bsp/setserial/setserial_2.17.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Controls the configuration of serial ports"
 DESCRIPTION = "setserial is a program designed to set and/or report the configuration information associated with a serial port"
-HOMEPAGE = "http://setserial.sourceforge.net"
+HOMEPAGE = "https://setserial.sourceforge.net"
 SECTION = "console/utils"
 
 LICENSE = "GPL-2.0-only"
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 79ddde3f5c..572397c1f3 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -1,4 +1,4 @@
-HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
+HOMEPAGE = "https://www.denx.de/wiki/U-Boot/WebHome"
 DESCRIPTION = "U-Boot, a boot loader for Embedded boards based on PowerPC, \
 ARM, MIPS and several other processors, which can be installed in a boot \
 ROM and used to initialize and test the hardware or to download and run \
diff --git a/meta/recipes-bsp/usbutils/usbutils_019.bb b/meta/recipes-bsp/usbutils/usbutils_019.bb
index 6aa5c5f5c2..e8621123be 100644
--- a/meta/recipes-bsp/usbutils/usbutils_019.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_019.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Host side USB console utilities"
 DESCRIPTION = "Contains the lsusb utility for inspecting the devices connected to the USB bus."
-HOMEPAGE = "http://www.linux-usb.org"
+HOMEPAGE = "https://www.linux-usb.org"
 SECTION = "base"
 
 LICENSE = "GPL-2.0-or-later & (GPL-2.0-only | GPL-3.0-only) & CC0-1.0 & LGPL-2.1-or-later & MIT"
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
diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 4fe8ba4d28..4bebb573a0 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -5,7 +5,7 @@ with no specific configuration. This tool implements IPv4LL, "Dynamic Configurat
 IPv4 Link-Local Addresses" (IETF RFC3927), a protocol for automatic IP address \
 configuration from the link-local 169.254.0.0/16 range without the need for a central \
 server.'
-HOMEPAGE = "http://avahi.org"
+HOMEPAGE = "https://avahi.org"
 BUGTRACKER = "https://github.com/avahi/avahi/issues"
 SECTION = "network"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 24a41f92df..1d581e0ff2 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -1,6 +1,6 @@
 SUMMARY = "Linux Bluetooth Stack Userland V5"
 DESCRIPTION = "Linux Bluetooth stack V5 userland components.  These include a system configurations, daemons, tools and system libraries."
-HOMEPAGE = "http://www.bluez.org"
+HOMEPAGE = "https://www.bluez.org"
 SECTION = "libs"
 LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index 8bfc1540b3..57f1be9ecb 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GTK+ frontend for the ConnMan network connection manager"
-HOMEPAGE = "http://connman.net/"
+HOMEPAGE = "https://connman.net/"
 SECTION = "libs/network"
 LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb
index fca7d8b11d..b63a5a2174 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "dhcpcd runs on your machine and silently configures your \
                computer to work on the attached networks without trouble \
                and mostly without configuration."
 
-HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
+HOMEPAGE = "https://roy.marples.name/projects/dhcpcd/"
 
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4dda5beb433a809f2e0aeffbf9da3d91"
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.7.bb b/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
index 6cffade97f..3f2d320a94 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "The GNU inetutils are a collection of common \
 networking utilities and servers including ftp, ftpd, rcp, \
 rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
 talkd, telnet, telnetd, tftp, tftpd, and uucpd."
-HOMEPAGE = "http://www.gnu.org/software/inetutils"
+HOMEPAGE = "https://www.gnu.org/software/inetutils"
 SECTION = "net"
 DEPENDS = "ncurses netbase readline virtual/crypt"
 
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb
index e078bcf3a9..1232cc0b6d 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Iproute2 is a collection of utilities for controlling \
 TCP / IP networking and traffic control in Linux.  Of the utilities ip \
 and tc are the most important.  ip controls IPv4 and IPv6 \
 configuration and tc stands for traffic control."
-HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2"
+HOMEPAGE = "https://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2"
 SECTION = "base"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
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
index f46cb1bf80..cabd29b020 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.2.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.2.bb
@@ -1,13 +1,13 @@
 SUMMARY = "ISC Kea DHCP Server"
 DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It supports both DHCPv4 and DHCPv6 protocols along with their extensions, e.g. prefix delegation and dynamic updates to DNS."
-HOMEPAGE = "http://kea.isc.org"
+HOMEPAGE = "https://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb634ed1d923b8b8fd1ed7ffc9b70ae4"
 
 DEPENDS = "boost log4cplus openssl"
 
-SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
+SRC_URI = "https://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
            file://kea-dhcp4.service \
            file://kea-dhcp6.service \
            file://kea-dhcp-ddns.service \
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
index 1b10001035..de94991a8d 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -2,8 +2,8 @@ SUMMARY = "Interface for user-level network packet capture"
 DESCRIPTION = "Libpcap provides a portable framework for low-level network \
 monitoring.  Libpcap can provide network statistics collection, \
 security monitoring and network debugging."
-HOMEPAGE = "http://www.tcpdump.org/"
-BUGTRACKER = "http://sourceforge.net/tracker/?group_id=53067&atid=469577"
+HOMEPAGE = "https://www.tcpdump.org/"
+BUGTRACKER = "https://sourceforge.net/tracker/?group_id=53067&atid=469577"
 SECTION = "libs/network"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb289217c160e2920d2e35bddc36453 \
diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
index 441732afe7..f54ad6f3a5 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Mobile Broadband Service Provider Database"
-HOMEPAGE = "http://live.gnome.org/NetworkManager/MobileBroadband/ServiceProviders"
+HOMEPAGE = "https://live.gnome.org/NetworkManager/MobileBroadband/ServiceProviders"
 DESCRIPTION = "Mobile Broadband Service Provider Database stores service provider specific information. When this Database is available the information can be fetched there"
 SECTION = "network"
 LICENSE = "PD"
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
index 65970f58e8..adf11df70f 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
@@ -1,7 +1,7 @@
 SUMMARY = "userspace utilities for kernel nfs"
 DESCRIPTION = "The nfs-utils package provides a daemon for the kernel \
 NFS server and related tools."
-HOMEPAGE = "http://nfs.sourceforge.net/"
+HOMEPAGE = "https://nfs.sourceforge.net/"
 SECTION = "console/network"
 
 LICENSE = "MIT & GPL-2.0-or-later & BSD-3-Clause"
diff --git a/meta/recipes-connectivity/ofono/ofono_2.19.bb b/meta/recipes-connectivity/ofono/ofono_2.19.bb
index 74fa70f609..76dd755758 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.19.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.19.bb
@@ -1,6 +1,6 @@
 SUMMARY = "open source telephony"
 DESCRIPTION = "oFono is a stack for mobile telephony devices on Linux. oFono supports speaking to telephony devices through specific drivers, or with generic AT commands."
-HOMEPAGE = "http://www.ofono.org"
+HOMEPAGE = "https://www.ofono.org"
 BUGTRACKER = "https://01.org/jira/browse/OF"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
diff --git a/meta/recipes-connectivity/openssh/openssh_10.2p1.bb b/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
index 866129573f..9ac923ea05 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
@@ -3,7 +3,7 @@ the SSH protocol including the ssh client and sshd server"
 DESCRIPTION = "Secure rlogin/rsh/rcp/telnet replacement (OpenSSH) \
 Ssh (Secure Shell) is a program for logging into a remote machine \
 and for executing commands on a remote machine."
-HOMEPAGE = "http://www.openssh.com/"
+HOMEPAGE = "https://www.openssh.com/"
 SECTION = "console/network"
 LICENSE = "BSD-2-Clause & BSD-3-Clause & ISC & MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=78ffb36e5a48c0d8c5648603a3b6c8eb"
diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.4.bb b/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
index e760baf3a0..61b145bc1c 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.4.bb
@@ -1,13 +1,13 @@
 SUMMARY = "Secure Socket Layer"
 DESCRIPTION = "Secure Socket Layer (SSL) binary and related cryptographic tools."
-HOMEPAGE = "http://www.openssl.org/"
-BUGTRACKER = "http://www.openssl.org/news/vulnerabilities.html"
+HOMEPAGE = "https://www.openssl.org/"
+BUGTRACKER = "https://www.openssl.org/news/vulnerabilities.html"
 SECTION = "libs/network"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c75985e733726beaba57bc5253e96d04"
 
-SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
+SRC_URI = "https://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
index 607678db8b..397e336329 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
@@ -2,8 +2,8 @@ SUMMARY = "Point-to-Point Protocol (PPP) support"
 DESCRIPTION = "ppp (Paul's PPP Package) is an open source package which implements \
 the Point-to-Point Protocol (PPP) on Linux and Solaris systems."
 SECTION = "console/network"
-HOMEPAGE = "http://samba.org/ppp/"
-BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
+HOMEPAGE = "https://samba.org/ppp/"
+BUGTRACKER = "https://ppp.samba.org/cgi-bin/ppp-bugs"
 DEPENDS = "libpcap virtual/crypt"
 LICENSE = "BSD-2-Clause & GPL-2.0-or-later & LGPL-2.0-or-later & PD & RSA-MD & MIT"
 LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=25;md5=f0463bd67ae70535c709fca554089bd8 \
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb
index b2c85f9593..23d69e7bbc 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb
@@ -7,7 +7,7 @@ information."
 SECTION = "console/network"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
-HOMEPAGE = "http://packages.debian.org/resolvconf"
+HOMEPAGE = "https://packages.debian.org/resolvconf"
 RDEPENDS:${PN} = "bash sed util-linux-flock"
 
 SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
diff --git a/meta/recipes-connectivity/socat/socat_1.8.1.0.bb b/meta/recipes-connectivity/socat/socat_1.8.1.0.bb
index 331133d6f9..d61a2048a6 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.1.0.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.1.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Multipurpose relay for bidirectional data transfer"
 DESCRIPTION = "Socat is a relay for bidirectional data \
 transfer between two independent data channels."
-HOMEPAGE = "http://www.dest-unreach.org/socat/"
+HOMEPAGE = "https://www.dest-unreach.org/socat/"
 
 SECTION = "console/network"
 
@@ -9,7 +9,7 @@ LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://README;beginline=252;endline=282;md5=338c05eadd013872abb1d6e198e10a3f"
 
-SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
+SRC_URI = "https://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://0001-fix-compile-procan.c-failed.patch \
            file://0001-fix-compile-failed-with-musl.patch \
 "
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index 7c7a8bd9c1..9c31390158 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Client for Wi-Fi Protected Access (WPA)"
 DESCRIPTION = "wpa_supplicant is a WPA Supplicant for Linux, BSD, Mac OS X, and Windows with support for WPA and WPA2 (IEEE 802.11i / RSN). Supplicant is the IEEE 802.1X/WPA component that is used in the client stations. It implements key negotiation with a WPA Authenticator and it controls the roaming and IEEE 802.11 authentication/association of the wlan driver."
-HOMEPAGE = "http://w1.fi/wpa_supplicant/"
-BUGTRACKER = "http://w1.fi/security/"
+HOMEPAGE = "https://w1.fi/wpa_supplicant/"
+BUGTRACKER = "https://w1.fi/security/"
 SECTION = "network"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5ebcb90236d1ad640558c3d3cd3035df \
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5ebcb90236d1ad640558c3d3cd3035df \
 
 DEPENDS = "dbus libnl"
 
-SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
+SRC_URI = "https://w1.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://wpa-supplicant.sh \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
diff --git a/meta/recipes-core/coreutils/coreutils_9.9.bb b/meta/recipes-core/coreutils/coreutils_9.9.bb
index cded545efb..747fc2c6f7 100644
--- a/meta/recipes-core/coreutils/coreutils_9.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.9.bb
@@ -2,8 +2,8 @@ SUMMARY = "The basic file, shell and text manipulation utilities"
 DESCRIPTION = "The GNU Core Utilities provide the basic file, shell and text \
 manipulation utilities. These are the core utilities which are expected to exist on \
 every system."
-HOMEPAGE = "http://www.gnu.org/software/coreutils/"
-BUGTRACKER = "http://debbugs.gnu.org/coreutils"
+HOMEPAGE = "https://www.gnu.org/software/coreutils/"
+BUGTRACKER = "https://debbugs.gnu.org/coreutils"
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://src/ls.c;beginline=1;endline=15;md5=824c1997414aea9f344747bd81cf5a31 \
@@ -19,7 +19,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            "
 SRC_URI[sha256sum] = "19bcb6ca867183c57d77155eae946c5eced88183143b45ca51ad7d26c628ca75"
 
-# http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842
+# https://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842
 #
 CVE_STATUS[CVE-2016-2781] = "disputed: runcon is not really a sandbox command, use `runcon ... setsid ...` to avoid this particular issue."
 
diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index c6a9abde63..43ae48a83b 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A simple tool to wait for a specific signal over DBus"
-HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/dbus-wait"
+HOMEPAGE = "https://git.yoctoproject.org/cgit/cgit.cgi/dbus-wait"
 DESCRIPTION = "${SUMMARY}"
 SECTION = "base"
 LICENSE = "GPL-2.0-only"
diff --git a/meta/recipes-core/dropbear/dropbear_2025.89.bb b/meta/recipes-core/dropbear/dropbear_2025.89.bb
index 957a0901fb..d7f0fec4ce 100644
--- a/meta/recipes-core/dropbear/dropbear_2025.89.bb
+++ b/meta/recipes-core/dropbear/dropbear_2025.89.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A lightweight SSH and SCP implementation"
-HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
+HOMEPAGE = "https://matt.ucc.asn.au/dropbear/dropbear.html"
 DESCRIPTION = "Dropbear is a relatively small SSH server and client. It runs on a variety of POSIX-based platforms. Dropbear is open source software, distributed under a MIT-style license. Dropbear is particularly useful for "embedded"-type Linux (or other Unix) systems, such as wireless routers."
 SECTION = "console/network"
 
@@ -12,7 +12,7 @@ DEPENDS = "zlib virtual/crypt"
 RPROVIDES:${PN} = "ssh sshd"
 RCONFLICTS:${PN} = "openssh-sshd openssh"
 
-SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
+SRC_URI = "https://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://0001-urandom-xauth-changes-to-options.h.patch \
            file://init \
            file://dropbearkey.service \
@@ -23,7 +23,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            "
 
 SRC_URI[sha256sum] = "0d1f7ca711cfc336dc8a85e672cab9cfd8223a02fe2da0a4a7aeb58c9e113634"
-MIRRORS += "http://matt.ucc.asn.au/dropbear/releases/ https://dropbear.nl/mirror/releases/"
+MIRRORS += "https://matt.ucc.asn.au/dropbear/releases/ https://dropbear.nl/mirror/releases/"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
                file://0006-dropbear-configuration-file.patch \
diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes-core/gettext/gettext-sources.inc
index 2ddf47334d..6d3b8b90cd 100644
--- a/meta/recipes-core/gettext/gettext-sources.inc
+++ b/meta/recipes-core/gettext/gettext-sources.inc
@@ -1,3 +1,3 @@
-HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
+HOMEPAGE = "https://www.gnu.org/software/gettext/gettext.html"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz"
 SRC_URI[sha256sum] = "39acf4b0371e9b110b60005562aace5b3631fed9b1bb9ecccfc7f56e58bb1d7f"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index bd87d9c601..57f4379e2a 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=41890f71f740302b785c27661123bff5 \
                     file://LICENSES/LGPL-2.1-or-later.txt;md5=41890f71f740302b785c27661123bff5 \
                     file://gmodule/gmodule.h;beginline=4;endline=17;md5=72f7cc2847407f65d8981ef112e4e630 \
                     file://docs/reference/COPYING;md5=f51a5100c17af6bae00735cd791e1fcc"
-BUGTRACKER = "http://bugzilla.gnome.org"
+BUGTRACKER = "https://bugzilla.gnome.org"
 SECTION = "libs"
 
 CVE_PRODUCT = "glib"
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
index 8bdbab03a6..8892ffda99 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "GLib networking extensions"
 DESCRIPTION = "glib-networking contains the implementations of certain GLib networking features that cannot be implemented directly in GLib itself because of their dependencies."
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/glib-networking/"
-BUGTRACKER = "http://bugzilla.gnome.org"
+BUGTRACKER = "https://bugzilla.gnome.org"
 
 LICENSE = "LGPL-2.1-or-later"
 LICENSE:append = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', ' & Glib-Networking-OpenSSL-Exception', '', d)}"
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.42.bb b/meta/recipes-core/glibc/cross-localedef-native_2.42.bb
index 95acb3fc56..c9dc3273db 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.42.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.42.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Cross locale generation tool for glibc"
-HOMEPAGE = "http://www.gnu.org/software/libc/libc.html"
+HOMEPAGE = "https://www.gnu.org/software/libc/libc.html"
 SECTION = "libs"
 LICENSE = "LGPL-2.1-only"
 
diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index 7422ede04d..26552f402a 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -1,6 +1,6 @@
 SUMMARY = "GLIBC (GNU C Library)"
 DESCRIPTION = "The GNU C Library is used as the system C library in most systems with the Linux kernel."
-HOMEPAGE = "http://www.gnu.org/software/libc/libc.html"
+HOMEPAGE = "https://www.gnu.org/software/libc/libc.html"
 SECTION = "libs"
 LICENSE = "GPL-2.0-only & LGPL-2.1-or-later"
 
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
index da594d00b7..99bd106562 100644
--- a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Basic TCP/IP networking init scripts and configuration files"
 DESCRIPTION = "This package provides high level tools to configure network interfaces"
-HOMEPAGE = "http://packages.debian.org/ifupdown"
+HOMEPAGE = "https://packages.debian.org/ifupdown"
 SECTION = "base"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${S}/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
diff --git a/meta/recipes-core/kbd/kbd_2.9.0.bb b/meta/recipes-core/kbd/kbd_2.9.0.bb
index 79b011e529..067e9f9487 100644
--- a/meta/recipes-core/kbd/kbd_2.9.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.9.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Keytable files and keyboard utilities"
-HOMEPAGE = "http://www.kbd-project.org/"
+HOMEPAGE = "https://www.kbd-project.org/"
 DESCRIPTION = "The kbd project contains tools for managing Linux console (Linux console, virtual terminals, keyboard, etc.) - mainly, what they do is loading console fonts and keyboard maps."
 
 # consolefonts and keymaps contain also some public domain and author notice licenses
diff --git a/meta/recipes-core/libcgroup/libcgroup_3.2.0.bb b/meta/recipes-core/libcgroup/libcgroup_3.2.0.bb
index 28562a5b37..e4224a23c2 100644
--- a/meta/recipes-core/libcgroup/libcgroup_3.2.0.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_3.2.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Linux control group abstraction library"
-HOMEPAGE = "http://libcg.sourceforge.net/"
+HOMEPAGE = "https://libcg.sourceforge.net/"
 DESCRIPTION = "libcgroup is a library that abstracts the control group file system \
 in Linux. Control groups allow you to limit, account and isolate resource usage \
 (CPU, memory, disk I/O, etc.) of groups of processes."
diff --git a/meta/recipes-core/libxml/libxml2_2.15.1.bb b/meta/recipes-core/libxml/libxml2_2.15.1.bb
index 736aaea00e..0510ed2afd 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.1.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "XML C Parser Library and Toolkit"
 DESCRIPTION = "The XML Parser Library allows for manipulation of XML files.  Libxml2 exports Push and Pull type parser interfaces for both XML and HTML.  It can do DTD validation at parse time, on a parsed document instance or with an arbitrary DTD.  Libxml2 includes complete XPath, XPointer and Xinclude implementations.  It also has a SAX like interface, which is designed to be compatible with Expat."
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/libxml2"
-BUGTRACKER = "http://bugzilla.gnome.org/buglist.cgi?product=libxml2"
+BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=libxml2"
 SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://Copyright;md5=5873615e8a9ecbf5c8857c4312ee05d6 \
@@ -14,7 +14,7 @@ DEPENDS = "zlib virtual/libiconv"
 GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase
 
-SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testtar \
+SRC_URI += "https://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testtar \
            file://run-ptest \
            file://install-tests.patch \
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index ce45de2d23..8c4b2a0dcd 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -6,7 +6,7 @@ DESCRIPTION = "A new standard library to power a new generation of Linux-based d
 musl is lightweight, fast, simple, free, and strives to be correct in the sense of \
 standards-conformance and safety."
 
-HOMEPAGE = "http://www.musl-libc.org/"
+HOMEPAGE = "https://www.musl-libc.org/"
 LICENSE = "MIT"
 SECTION = "libs"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=0c2904cdc34777fb4067732bae145506"
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 8482db7f6e..af15f35591 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -1,6 +1,6 @@
 SUMMARY = "The New Curses library"
 DESCRIPTION = "SVr4 and XSI-Curses compatible curses library and terminfo tools including tic, infocmp, captoinfo. Supports color, multiple highlights, forms-drawing characters, and automatic recognition of keypad and function-key sequences. Extensions include resizable windows and mouse support on both xterm and Linux console using the gpm library."
-HOMEPAGE = "http://www.gnu.org/software/ncurses/ncurses.html"
+HOMEPAGE = "https://www.gnu.org/software/ncurses/ncurses.html"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6f291ee54551d9d8d992ecd623fe4bc7;endline=27"
 SECTION = "libs"
diff --git a/meta/recipes-core/netbase/netbase_6.5.bb b/meta/recipes-core/netbase/netbase_6.5.bb
index c6cf798421..74c7e9d38f 100644
--- a/meta/recipes-core/netbase/netbase_6.5.bb
+++ b/meta/recipes-core/netbase/netbase_6.5.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Basic TCP/IP networking support"
 DESCRIPTION = "This package provides the necessary infrastructure for basic TCP/IP based networking"
-HOMEPAGE = "http://packages.debian.org/netbase"
+HOMEPAGE = "https://packages.debian.org/netbase"
 SECTION = "base"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=78dd2c7c6f487348e4a0092c17a19d42"
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 3be0e26a0c..6f49a57d2c 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Userspace framebuffer boot logo based on usplash"
 DESCRIPTION = "PSplash is a userspace graphical boot splash screen for mainly embedded Linux devices supporting a 16bpp or 32bpp framebuffer. It has few dependencies (just libc), supports basic images and text and handles rotation. Its visual look is configurable by basic source changes. Also included is a 'client' command utility for sending information to psplash such as boot progress information."
-HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/psplash"
+HOMEPAGE = "https://git.yoctoproject.org/cgit/cgit.cgi/psplash"
 SECTION = "base"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=8;md5=8f232c1e95929eacab37f00900580224"
diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb b/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
index 5040d8864e..4fc64ba35d 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
+++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Tools for working with sysfs"
 DESCRIPTION = "Tools for working with the sysfs virtual filesystem.  The tool 'systool' can query devices by bus, class and topology."
-HOMEPAGE = "http://linux-diag.sourceforge.net/Sysfsutils.html"
+HOMEPAGE = "https://linux-diag.sourceforge.net/Sysfsutils.html"
 
 LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LICENSE:${PN} = "GPL-2.0-only"
diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index d6da34e9b8..5520899375 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Enhances systemd compatilibity with existing SysVinit scripts"
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
+HOMEPAGE = "https://www.freedesktop.org/wiki/Software/systemd"
 LICENSE = "MIT"
 
 PACKAGE_WRITE_DEPS += "systemd-systemctl-native"
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index daf37060d7..caae2baff3 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -1,5 +1,5 @@
 SUMMARY = "A System and service manager"
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
+HOMEPAGE = "https://www.freedesktop.org/wiki/Software/systemd"
 
 DESCRIPTION = "systemd is a system and service manager for Linux, compatible with \
 SysV and LSB init scripts. systemd provides aggressive parallelization \
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.14.bb b/meta/recipes-core/sysvinit/sysvinit_3.14.bb
index d4bb797624..c1e6f06e94 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.14.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.14.bb
@@ -1,6 +1,6 @@
 SUMMARY = "System-V like init"
 DESCRIPTION = "This package is required to boot in most configurations.  It provides the /sbin/init program.  This is the first process started on boot, and the last process terminated before the system halts."
-HOMEPAGE = "http://savannah.nongnu.org/projects/sysvinit/"
+HOMEPAGE = "https://savannah.nongnu.org/projects/sysvinit/"
 SECTION = "base"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
index 124b7d32a2..29a223195f 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
@@ -1,5 +1,5 @@
 SUMMARY = "manage symlinks in /etc/rcN.d"
-HOMEPAGE = "http://github.com/philb/update-rc.d/"
+HOMEPAGE = "https://github.com/philb/update-rc.d/"
 DESCRIPTION = "update-rc.d is a utility that allows the management of symlinks to the initscripts in the /etc/rcN.d directory structure."
 SECTION = "base"
 
diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
index 592b7f1422..e26b3772af 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Zlib Compression Library"
 DESCRIPTION = "Zlib is a general-purpose, patent-free, lossless data compression \
 library which is used by many different programs."
-HOMEPAGE = "http://zlib.net/"
+HOMEPAGE = "https://zlib.net/"
 SECTION = "libs"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef63bc555f7aa6c0"
@@ -11,7 +11,7 @@ SRC_URI = "https://zlib.net/${BP}.tar.gz \
            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
            file://run-ptest \
            "
-UPSTREAM_CHECK_URI = "http://zlib.net/"
+UPSTREAM_CHECK_URI = "https://zlib.net/"
 
 SRC_URI[sha256sum] = "9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23"
 
diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb
index 46d1b91d65..86b075e820 100644
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb
@@ -1,5 +1,5 @@
 SUMMARY = "a collection of freely re-usable Autoconf macros"
-HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
+HOMEPAGE = "https://www.gnu.org/software/autoconf-archive/"
 SECTION = "devel"
 LICENSE = "GPL-3.0-with-autoconf-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=11cc2d3ee574f9d6b7ee797bdce4d423 \
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.72.bb b/meta/recipes-devtools/autoconf/autoconf_2.72.bb
index b599f270c7..2f9e8a8f47 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.72.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.72.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Autoconf is an extensible package of M4 macros that produce shell
 configure software source code packages. Autoconf creates a configuration script for a package from a template \
 file that lists the operating system features that the package can use, in the form of M4 macro calls."
 LICENSE = "GPL-3.0-or-later"
-HOMEPAGE = "http://www.gnu.org/software/autoconf/"
+HOMEPAGE = "https://www.gnu.org/software/autoconf/"
 SECTION = "devel"
 DEPENDS = "m4-native autoconf-native automake-native gnu-config-native help2man-native"
 DEPENDS:remove:class-native = "autoconf-native automake-native help2man-native"
diff --git a/meta/recipes-devtools/automake/automake.inc b/meta/recipes-devtools/automake/automake.inc
index 9946c73c71..fb7d1dbe64 100644
--- a/meta/recipes-devtools/automake/automake.inc
+++ b/meta/recipes-devtools/automake/automake.inc
@@ -2,7 +2,7 @@ SUMMARY = "A GNU tool for automatically generating Makefiles"
 DESCRIPTION = "Automake is a tool for automatically generating `Makefile.in' files compliant with the GNU Coding \
 Standards. Automake requires the use of Autoconf."
 LICENSE = "GPL-2.0-only"
-HOMEPAGE = "http://www.gnu.org/software/automake/"
+HOMEPAGE = "https://www.gnu.org/software/automake/"
 SECTION = "devel"
 
 SRC_URI = "${GNU_MIRROR}/automake/automake-${PV}.tar.gz"
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 00b1301258..d4bf8ded91 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -6,8 +6,8 @@ addresses into filenames and line numbers), ar (utility for creating, \
 modifying and extracting archives), nm (list symbols in object \
 files), objcopy (copy and translate object files), objdump (Display \
 object information), and other tools and related libraries."
-HOMEPAGE = "http://www.gnu.org/software/binutils/"
-BUGTRACKER = "http://sourceware.org/bugzilla/"
+HOMEPAGE = "https://www.gnu.org/software/binutils/"
+BUGTRACKER = "https://sourceware.org/bugzilla/"
 SECTION = "devel"
 LICENSE = "GPL-3.0-only"
 
diff --git a/meta/recipes-devtools/bison/bison_3.8.2.bb b/meta/recipes-devtools/bison/bison_3.8.2.bb
index 513d7ec287..b20c38dc76 100644
--- a/meta/recipes-devtools/bison/bison_3.8.2.bb
+++ b/meta/recipes-devtools/bison/bison_3.8.2.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Bison is a general-purpose parser generator that converts an anno
 an LALR(1) or GLR parser for that grammar.  Bison is upward compatible with Yacc: all properly-written Yacc \
 grammars ought to work with Bison with no change. Anyone familiar with Yacc should be able to use Bison with \
 little trouble."
-HOMEPAGE = "http://www.gnu.org/software/bison/"
+HOMEPAGE = "https://www.gnu.org/software/bison/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 SECTION = "devel"
diff --git a/meta/recipes-devtools/ccache/ccache_4.12.2.bb b/meta/recipes-devtools/ccache/ccache_4.12.2.bb
index 28f36e5ed7..1c191d550c 100644
--- a/meta/recipes-devtools/ccache/ccache_4.12.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.12.2.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "ccache is a compiler cache. It speeds up recompilation \
 by caching the result of previous compilations and detecting when the \
 same compilation is being done again. Supported languages are C, C\+\+, \
 Objective-C and Objective-C++."
-HOMEPAGE = "http://ccache.samba.org"
+HOMEPAGE = "https://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later & MIT & BSL-1.0 & ISC"
diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index fb7c29e242..c6568ff776 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 SUMMARY = "A set of tools for CD recording, including cdrecord"
-HOMEPAGE = "http://sourceforge.net/projects/cdrtools/"
+HOMEPAGE = "https://sourceforge.net/projects/cdrtools/"
 DESCRIPTION = "cdrecord tool is Highly portable CD/DVD/BluRay command line recording software."
 SECTION = "console/utils"
 LICENSE = "GPL-2.0-only & CDDL-1.0 & LGPL-2.1-or-later"
diff --git a/meta/recipes-devtools/clang/clang-cross-canadian_git.bb b/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
index 18bd6ecfde..5801900740 100644
--- a/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
+++ b/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
@@ -2,7 +2,7 @@
 # Released under the MIT license (see COPYING.MIT for the terms)
 
 SUMMARY = "Clang/LLVM based C/C++ compiler (cross-canadian for ${TARGET_ARCH} target)"
-HOMEPAGE = "http://clang.llvm.org/"
+HOMEPAGE = "https://clang.llvm.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 SECTION = "devel"
diff --git a/meta/recipes-devtools/clang/clang-cross_git.bb b/meta/recipes-devtools/clang/clang-cross_git.bb
index 2ec15dd1df..e9fc8a5bd1 100644
--- a/meta/recipes-devtools/clang/clang-cross_git.bb
+++ b/meta/recipes-devtools/clang/clang-cross_git.bb
@@ -2,7 +2,7 @@
 # Released under the MIT license (see COPYING.MIT for the terms)
 
 SUMMARY = "Cross compiler wrappers for LLVM based C/C++ compiler"
-HOMEPAGE = "http://clang.llvm.org/"
+HOMEPAGE = "https://clang.llvm.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 SECTION = "devel"
diff --git a/meta/recipes-devtools/clang/clang-crosssdk_git.bb b/meta/recipes-devtools/clang/clang-crosssdk_git.bb
index 9b527975a9..907b2dc3f0 100644
--- a/meta/recipes-devtools/clang/clang-crosssdk_git.bb
+++ b/meta/recipes-devtools/clang/clang-crosssdk_git.bb
@@ -2,7 +2,7 @@
 # Released under the MIT license (see COPYING.MIT for the terms)
 
 SUMMARY = "SDK Cross compiler wrappers for LLVM based C/C++ compiler"
-HOMEPAGE = "http://clang.llvm.org/"
+HOMEPAGE = "https://clang.llvm.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 SECTION = "devel"
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index e10c327a2a..cc9351617d 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -11,7 +11,7 @@ DESCRIPTION = "Clang is an LLVM based C/C++/Objective-C compiler, \
                 in your code, and are great examples of the sort \
                 of tools that can be built using the Clang frontend \
                 as a library to parse C/C++ code"
-HOMEPAGE = "http://clang.llvm.org/"
+HOMEPAGE = "https://clang.llvm.org/"
 SECTION = "devel"
 
 require common-clang.inc
diff --git a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
index 53d0d63169..e4fb7cedb2 100644
--- a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
@@ -4,7 +4,7 @@
 SUMMARY = "LLVM based C/C++ compiler Sanitizers Runtime"
 DESCRIPTION = "Runtime libraries that are required \
 				to run the code with sanitizer instrumentation"
-HOMEPAGE = "http://compiler-rt.llvm.org/"
+HOMEPAGE = "https://compiler-rt.llvm.org/"
 SECTION = "base"
 
 require common-clang.inc
diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index a265c2aa93..24f5deb815 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -6,7 +6,7 @@ DESCRIPTIOM = "Simple builtin library that provides an \
 				implementation of the low-level target-specific \
 				hooks required by code generation and other runtime \
 				components"
-HOMEPAGE = "http://compiler-rt.llvm.org/"
+HOMEPAGE = "https://compiler-rt.llvm.org/"
 SECTION = "base"
 
 require common-clang.inc
diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devtools/clang/libcxx_git.bb
index fee7cfc9ea..dfdb7b821e 100644
--- a/meta/recipes-devtools/clang/libcxx_git.bb
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -2,7 +2,7 @@
 # Released under the MIT license (see COPYING.MIT for the terms)
 
 SUMMARY = "libc++ is a new implementation of the C++ standard library, targeting C++11 and above"
-HOMEPAGE = "http://libcxx.llvm.org/"
+HOMEPAGE = "https://libcxx.llvm.org/"
 SECTION = "base"
 
 require common-clang.inc
diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devtools/clang/llvm_git.bb
index 96ea383731..4e2a5a0bc7 100644
--- a/meta/recipes-devtools/clang/llvm_git.bb
+++ b/meta/recipes-devtools/clang/llvm_git.bb
@@ -2,7 +2,7 @@
 # Released under the MIT license (see COPYING.MIT for the terms)
 
 SUMMARY = "The LLVM Compiler Infrastructure"
-HOMEPAGE = "http://llvm.org"
+HOMEPAGE = "https://llvm.org"
 LICENSE = "Apache-2.0-with-LLVM-exception"
 SECTION = "devel"
 
diff --git a/meta/recipes-devtools/clang/nativesdk-clang-glue.bb b/meta/recipes-devtools/clang/nativesdk-clang-glue.bb
index 8e5622f6c1..6870720c6b 100644
--- a/meta/recipes-devtools/clang/nativesdk-clang-glue.bb
+++ b/meta/recipes-devtools/clang/nativesdk-clang-glue.bb
@@ -2,7 +2,7 @@
 # Released under the MIT license (see COPYING.MIT for the terms)
 
 SUMMARY = "SDK Cross compiler wrappers for LLVM based C/C++ compiler"
-HOMEPAGE = "http://clang.llvm.org/"
+HOMEPAGE = "https://clang.llvm.org/"
 LICENSE = "Apache-2.0-with-LLVM-exception"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=0bcd48c3bdfef0c9d9fd17726e4b7dab"
 SECTION = "devel"
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index d120638b1b..dc15e6b902 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -6,8 +6,8 @@ DESCRIPTION = "CMake is used to control the software compilation process \
 using simple platform and compiler independent configuration files. CMake \
 generates native makefiles and workspaces that can be used in the compiler \
 environment of your choice."
-HOMEPAGE = "http://www.cmake.org/"
-BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
+HOMEPAGE = "https://www.cmake.org/"
+BUGTRACKER = "https://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=0cafc0f3b6b28f3d5ecb5d1a68c36471 \
diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb
index 35537572fe..a5569b0d7a 100644
--- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb
+++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb
@@ -1,13 +1,13 @@
 SUMMARY = "Command line utilities for working with *.desktop files"
 DESCRIPTION = "desktop-file-utils contains a few command line utilities for working with desktop entries"
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/desktop-file-utils"
+HOMEPAGE = "https://www.freedesktop.org/wiki/Software/desktop-file-utils"
 SECTION = "console/utils"
 LICENSE = "GPL-2.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/validator.c;beginline=4;endline=27;md5=281e1114ee6c486a1a0a4295986b9416"
 
-SRC_URI = "http://www.freedesktop.org/software/${BPN}/releases/${BP}.tar.xz"
+SRC_URI = "https://www.freedesktop.org/software/${BPN}/releases/${BP}.tar.xz"
 SRC_URI[sha256sum] = "4401d4e231d842c2de8242395a74a395ca468cd96f5f610d822df33594898a70"
 
 DEPENDS = "glib-2.0"
diff --git a/meta/recipes-devtools/diffstat/diffstat_1.68.bb b/meta/recipes-devtools/diffstat/diffstat_1.68.bb
index 488f0834d6..74259a9660 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.68.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.68.bb
@@ -2,12 +2,12 @@ SUMMARY = "Tool to produce a statistics based on a diff"
 DESCRIPTION = "diffstat reads the output of diff and displays a histogram of \
 the insertions, deletions, and modifications per-file. It is useful for \
 reviewing large, complex patch files."
-HOMEPAGE = "http://invisible-island.net/diffstat/"
+HOMEPAGE = "https://invisible-island.net/diffstat/"
 SECTION = "devel"
 LICENSE = "X11"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c432d3aeb935855b2ca1ad2a0542ce4"
 
-SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
+SRC_URI = "https://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://run-ptest \
            file://avoid-check-user-break-cc.patch \
            "
diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.7.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.7.bb
index 93c3678d9a..4d81950b41 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.7.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.7.bb
@@ -1,5 +1,5 @@
 SUMMARY = "DMI (Desktop Management Interface) table related utilities"
-HOMEPAGE = "http://www.nongnu.org/dmidecode/"
+HOMEPAGE = "https://www.nongnu.org/dmidecode/"
 DESCRIPTION = "Dmidecode reports information about your system's hardware as described in your system BIOS according to the SMBIOS/DMI standard (see a sample output)."
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta/recipes-devtools/dnf/dnf_4.24.0.bb b/meta/recipes-devtools/dnf/dnf_4.24.0.bb
index d40b85c4b0..15e7f81aa7 100644
--- a/meta/recipes-devtools/dnf/dnf_4.24.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.24.0.bb
@@ -27,7 +27,7 @@ inherit cmake gettext bash-completion setuptools3-base systemd
 
 DEPENDS += "libdnf librepo libcomps"
 
-# manpages generation requires http://www.sphinx-doc.org/
+# manpages generation requires https://www.sphinx-doc.org/
 EXTRA_OECMAKE = " -DWITH_MAN=0 -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
index 7e4730b5e9..1325c0c3e2 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "XSL stylesheets for processing DocBook XML to various output formats"
-HOMEPAGE = "http://docbook.sourceforge.net"
+HOMEPAGE = "https://docbook.sourceforge.net"
 LICENSE = "DocBook-XML"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6beadd98f9c54ab0c387e14211ee4d0e"
 
@@ -9,7 +9,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/docbook/docbook-xsl-${PV}.tar.bz2 \
 
 SRC_URI[sha256sum] = "725f452e12b296956e8bfb876ccece71eeecdd14b94f667f3ed9091761a4a968"
 
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/docbook/files/docbook-xsl/"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/docbook/files/docbook-xsl/"
 # Reject versions ending in .0 as those are release candidates
 UPSTREAM_CHECK_REGEX = "/docbook-xsl/(?P<pver>(\d+[\.\-_]*)+(?!\.0)\.\d+)/"
 
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index cce6e5f1ac..b17ca0149e 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Ext2 Filesystem Utilities"
 DESCRIPTION = "The Ext2 Filesystem Utilities (e2fsprogs) contain all of the standard utilities for creating, \
 fixing, configuring , and debugging ext2 filesystems."
-HOMEPAGE = "http://e2fsprogs.sourceforge.net/"
+HOMEPAGE = "https://e2fsprogs.sourceforge.net/"
 
 LICENSE = "GPL-2.0-only & LGPL-2.0-only & BSD-3-Clause & MIT"
 LICENSE:e2fsprogs-dumpe2fs = "GPL-2.0-only"
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.194.bb b/meta/recipes-devtools/elfutils/elfutils_0.194.bb
index f7963afcbe..dad081d900 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.194.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.194.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 DEPENDS = "zlib virtual/libintl"
 DEPENDS:append:libc-musl = " argp-standalone fts musl-legacy-error musl-obstack"
 # The Debian patches below are from:
-# http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.176-1.debian.tar.xz
+# https://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.176-1.debian.tar.xz
 SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://run-ptest \
            file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch \
diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 48b5b0d934..90a6599914 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -7,7 +7,7 @@ X11 GUIs. An interpreted language provides branching and high-level control \
 structures to direct the dialogue. In addition, the user can take control and \
 interact directly when desired, afterward returning control to the script. \
 "
-HOMEPAGE = "http://sourceforge.net/projects/expect/"
+HOMEPAGE = "https://sourceforge.net/projects/expect/"
 LICENSE = "PD"
 SECTION = "devel"
 
@@ -34,7 +34,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
            "
 SRC_URI[sha256sum] = "49a7da83b0bdd9f46d04a04deec19c7767bb9a323e40c4781f89caf760b92c34"
 
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/expect/files/Expect/"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/expect/files/Expect/"
 UPSTREAM_CHECK_REGEX = "/Expect/(?P<pver>(\d+[\.\-_]*)+)/"
 
 S = "${UNPACKDIR}/${BPN}${PV}"
diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.10.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.10.bb
index ba891931ac..08603d5efa 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.10.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.10.bb
@@ -12,7 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz \
            "
 SRC_URI[sha256sum] = "2abed61bc6d2b9ec498973c0440b8b804b7a72d7144069b5a9209b2ad693a282"
 
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/gptfdisk/files/gptfdisk/"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/gptfdisk/files/gptfdisk/"
 UPSTREAM_CHECK_REGEX = "/gptfdisk/(?P<pver>(\d+[\.\-_]*)+)/"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'CXX=${CXX}' gdisk fixparts ${PACKAGECONFIG_CONFARGS}"
diff --git a/meta/recipes-devtools/file/file_5.46.bb b/meta/recipes-devtools/file/file_5.46.bb
index c035e0b11d..d90cf595cc 100644
--- a/meta/recipes-devtools/file/file_5.46.bb
+++ b/meta/recipes-devtools/file/file_5.46.bb
@@ -1,7 +1,7 @@
 SUMMARY = "File classification tool"
 DESCRIPTION = "File attempts to classify files depending \
 on their contents and prints a description if a match is found."
-HOMEPAGE = "http://www.darwinsys.com/file/"
+HOMEPAGE = "https://www.darwinsys.com/file/"
 SECTION = "console/utils"
 
 # two clause BSD
diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index fa8c0fb6fd..0caaf1a01f 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Flex (The Fast Lexical Analyzer)"
 DESCRIPTION = "Flex is a fast lexical analyser generator.  Flex is a tool for generating programs that recognize \
 lexical patterns in text."
-HOMEPAGE = "http://sourceforge.net/projects/flex/"
+HOMEPAGE = "https://sourceforge.net/projects/flex/"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause & LGPL-2.0-or-later"
 LICENSE:${PN}-libfl = "BSD-3-Clause"
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 8d95698743..cbe2f9ba1a 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -1,5 +1,5 @@
 SUMMARY = "GNU cc and gcc C compilers"
-HOMEPAGE = "http://www.gnu.org/software/gcc/"
+HOMEPAGE = "https://www.gnu.org/software/gcc/"
 DESCRIPTION = "The GNU Compiler Collection includes front ends for C, C++, Objective-C, Fortran, Ada, Go, and D, as well as libraries for these languages (libstdc++,...). GCC was originally written as the compiler for the GNU operating system."
 SECTION = "devel"
 LICENSE = "GPL"
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 474cdf6514..e686c91ac9 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -1,5 +1,5 @@
 SUMMARY = "GNU debugger"
-HOMEPAGE = "http://www.gnu.org/software/gdb/"
+HOMEPAGE = "https://www.gnu.org/software/gdb/"
 DESCRIPTION = "GDB, the GNU Project debugger, allows you to see what is going on inside another program while it executes -- or what another program was doing at the moment it crashed."
 SECTION = "devel"
 DEPENDS = "expat gmp mpfr zlib ncurses virtual/libiconv ${LTTNGUST} bison-native"
diff --git a/meta/recipes-devtools/git/git_2.52.0.bb b/meta/recipes-devtools/git/git_2.52.0.bb
index 7312da9cfc..61253ccf99 100644
--- a/meta/recipes-devtools/git/git_2.52.0.bb
+++ b/meta/recipes-devtools/git/git_2.52.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Distributed version control system"
-HOMEPAGE = "http://git-scm.com"
+HOMEPAGE = "https://git-scm.com"
 DESCRIPTION = "Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency."
 SECTION = "console/utils"
 LICENSE = "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause & MIT & BSL-1.0 & LGPL-2.1-or-later"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.25.5.bb b/meta/recipes-devtools/go/go-binary-native_1.25.5.bb
index 5ecbca6d17..c79db8adac 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.25.5.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.25.5.bb
@@ -1,7 +1,7 @@
 # This recipe is for bootstrapping our go-cross from a prebuilt binary of Go from golang.org.
 
 SUMMARY = "Go programming language compiler (upstream binary for bootstrap)"
-HOMEPAGE = " http://golang.org/"
+HOMEPAGE = " https://golang.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7998cb338f82d15c0eff93b7004d272a"
 
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index 061db4296c..b7f81a80c9 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -9,7 +9,7 @@ DESCRIPTION = " The Go programming language is an open source project to make \
  fast, statically typed, compiled language that feels like a\
  dynamically typed, interpreted language."
 
-HOMEPAGE = " http://golang.org/"
+HOMEPAGE = " https://golang.org/"
 LICENSE = "BSD-3-Clause"
 
 inherit goarch
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
index 2ea75bba87..1aead806a3 100644
--- a/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "BSD replacement for libreadline"
 DESCRIPTION = "Command line editor library providing generic line editing, \
 history, and tokenization functions"
-HOMEPAGE = "http://www.thrysoee.dk/editline/"
+HOMEPAGE = "https://www.thrysoee.dk/editline/"
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1e4228d0c5a9093b01aeaaeae6641533"
@@ -10,7 +10,7 @@ DEPENDS = "ncurses"
 
 inherit autotools
 
-SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
+SRC_URI = "https://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
           "
 SRC_URI[sha256sum] = "21362b00653bbfc1c71f71a7578da66b5b5203559d43134d2dd7719e313ce041"
diff --git a/meta/recipes-devtools/libtool/libtool-2.5.4.inc b/meta/recipes-devtools/libtool/libtool-2.5.4.inc
index 4d9a822de2..4b97d7d6b0 100644
--- a/meta/recipes-devtools/libtool/libtool-2.5.4.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.5.4.inc
@@ -2,7 +2,7 @@ SUMMARY = "Generic library support script"
 DESCRIPTION = "This is GNU libtool, a generic library support script. \
 Libtool hides the complexity of generating special library types \
 (such as shared libraries) behind a consistent interface."
-HOMEPAGE = "http://www.gnu.org/software/libtool/libtool.html"
+HOMEPAGE = "https://www.gnu.org/software/libtool/libtool.html"
 SECTION = "devel"
 LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce \
diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.1.2.bb b/meta/recipes-devtools/log4cplus/log4cplus_2.1.2.bb
index 9a3c31e887..ca4f6cee94 100644
--- a/meta/recipes-devtools/log4cplus/log4cplus_2.1.2.bb
+++ b/meta/recipes-devtools/log4cplus/log4cplus_2.1.2.bb
@@ -1,8 +1,8 @@
 SUMMARY = "log4cplus provides a simple C++ logging API for log management"
 SECTION = "libs"
-HOMEPAGE = "http://sourceforge.net/projects/log4cplus/"
+HOMEPAGE = "https://sourceforge.net/projects/log4cplus/"
 DESCRIPTION = "log4cplus is a simple to use C++ logging API providing thread-safe, flexible, and arbitrarily granular control over log management and configuration. It is modelled after the Java log4j API."
-BUGTRACKER = "http://sourceforge.net/p/log4cplus/bugs/"
+BUGTRACKER = "https://sourceforge.net/p/log4cplus/bugs/"
 
 LICENSE = "Apache-2.0 & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
diff --git a/meta/recipes-devtools/lua/lua_5.4.8.bb b/meta/recipes-devtools/lua/lua_5.4.8.bb
index 1d37cddeb8..b78def353e 100644
--- a/meta/recipes-devtools/lua/lua_5.4.8.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.8.bb
@@ -2,11 +2,11 @@ SUMMARY = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=305;endline=326;md5=0e573c143cb6491b41cf02cfbcb8c267"
-HOMEPAGE = "http://www.lua.org/"
+HOMEPAGE = "https://www.lua.org/"
 
-SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
+SRC_URI = "https://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
            file://lua.pc.in \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'http://www.lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=tarballtest file://run-ptest ', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'https://www.lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=tarballtest file://run-ptest ', '', d)} \
            "
 
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
diff --git a/meta/recipes-devtools/make/make.inc b/meta/recipes-devtools/make/make.inc
index 56b863480c..c7ef1a8e32 100644
--- a/meta/recipes-devtools/make/make.inc
+++ b/meta/recipes-devtools/make/make.inc
@@ -2,7 +2,7 @@ SUMMARY = "GNU tool that controls the build process"
 DESCRIPTION = "Make is a tool which controls the generation of executables and other non-source files of a \
 program from the program's source files.  Make gets its knowledge of how to build your program from a file \
 called the makefile, which lists each of the non-source files and how to compute it from other files."
-HOMEPAGE = "http://www.gnu.org/software/make/"
+HOMEPAGE = "https://www.gnu.org/software/make/"
 SECTION = "devel"
 
 SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.gz \
diff --git a/meta/recipes-devtools/meson/meson_1.10.0.bb b/meta/recipes-devtools/meson/meson_1.10.0.bb
index 6f629b7ec3..a32462ba2e 100644
--- a/meta/recipes-devtools/meson/meson_1.10.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.10.0.bb
@@ -1,4 +1,4 @@
-HOMEPAGE = "http://mesonbuild.com"
+HOMEPAGE = "https://mesonbuild.com"
 SUMMARY = "A high performance build system"
 DESCRIPTION = "Meson is a build system designed to increase programmer \
 productivity. It does this by providing a fast, simple and easy to use \
diff --git a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
index 08ab677676..bc1da11277 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Tools for managing memory technology devices"
-HOMEPAGE = "http://www.linux-mtd.infradead.org/"
+HOMEPAGE = "https://www.linux-mtd.infradead.org/"
 DESCRIPTION = "mtd-utils tool is a generic Linux subsystem for memory devices, especially Flash devices."
 SECTION = "base"
 LICENSE = "GPL-2.0-or-later"
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.49.bb b/meta/recipes-devtools/mtools/mtools_4.0.49.bb
index 294b2f37b2..029f4760ac 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.49.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.49.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Utilities to access MS-DOS disks without mounting them"
 DESCRIPTION = "Mtools is a collection of utilities to access MS-DOS disks from GNU and Unix without mounting them."
-HOMEPAGE = "http://www.gnu.org/software/mtools/"
+HOMEPAGE = "https://www.gnu.org/software/mtools/"
 SECTION = "optional"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta/recipes-devtools/nasm/nasm_3.01.bb b/meta/recipes-devtools/nasm/nasm_3.01.bb
index 1e4719000f..c62d7ba9a0 100644
--- a/meta/recipes-devtools/nasm/nasm_3.01.bb
+++ b/meta/recipes-devtools/nasm/nasm_3.01.bb
@@ -1,11 +1,11 @@
 SUMMARY = "General-purpose x86 assembler"
 SECTION = "devel"
-HOMEPAGE = "http://www.nasm.us/"
+HOMEPAGE = "https://www.nasm.us/"
 DESCRIPTION = "The Netwide Assembler (NASM) is an assembler and disassembler for the Intel x86 architecture."
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6178dc4f5355e40552448080e67a214b"
 
-SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
+SRC_URI = "https://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
            file://0001-compiler.h-Backport-C23-support.patch \
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb
index 9f1a91e1d3..b83c1b3cfd 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Additional utilities for the opkg package manager"
 SUMMARY:update-alternatives-opkg = "Utility for managing the alternatives system"
 SECTION = "base"
-HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils"
+HOMEPAGE = "https://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=2;endline=18;md5=ffa11ff3c15eb31c6a7ceaa00cc9f986"
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
diff --git a/meta/recipes-devtools/orc/orc_0.4.41.bb b/meta/recipes-devtools/orc/orc_0.4.41.bb
index 60677577b0..05f42b1526 100644
--- a/meta/recipes-devtools/orc/orc_0.4.41.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.41.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Optimised Inner Loop Runtime Compiler"
-HOMEPAGE = "http://gstreamer.freedesktop.org/modules/orc.html"
+HOMEPAGE = "https://gstreamer.freedesktop.org/modules/orc.html"
 DESCRIPTION = "Optimised Inner Loop Runtime Compiler is a Library and set of tools for compiling and executing SIMD assembly language-like programs that operate on arrays of data."
 LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
-SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
+SRC_URI = "https://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
 SRC_URI[sha256sum] = "cb1bfd4f655289cd39bc04642d597be9de5427623f0861c1fc19c08d98467fa2"
 
 inherit meson pkgconfig gtk-doc
diff --git a/meta/recipes-devtools/patch/patch.inc b/meta/recipes-devtools/patch/patch.inc
index 44d3046fd8..03f96e73cd 100644
--- a/meta/recipes-devtools/patch/patch.inc
+++ b/meta/recipes-devtools/patch/patch.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "patch takes a patch file containing a difference listing \
 produced by the diff program and applies those differences to one or more \
 original files, producing patched versions."
 SECTION = "utils"
-HOMEPAGE = "http://savannah.gnu.org/projects/patch/"
+HOMEPAGE = "https://savannah.gnu.org/projects/patch/"
 
 SRC_URI = "${GNU_MIRROR}/patch/patch-${PV}.tar.gz"
 S = "${UNPACKDIR}/patch-${PV}"
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
 
diff --git a/meta/recipes-devtools/perl/perl_5.40.2.bb b/meta/recipes-devtools/perl/perl_5.40.2.bb
index a78d2ed0be..2be2da73d4 100644
--- a/meta/recipes-devtools/perl/perl_5.40.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.40.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Perl scripting language"
-HOMEPAGE = "http://www.perl.org/"
+HOMEPAGE = "https://www.perl.org/"
 DESCRIPTION = "Perl is a highly capable, feature-rich programming language"
 SECTION = "devel"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
index 12ca075b5d..41e9cfc904 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "pkgconf is a program which helps to configure compiler and linker
 flags for development frameworks. It is similar to pkg-config from \
 freedesktop.org, providing additional functionality while also maintaining \
 compatibility."
-HOMEPAGE = "http://pkgconf.org"
+HOMEPAGE = "https://pkgconf.org"
 BUGTRACKER = "https://github.com/pkgconf/pkgconf/issues"
 SECTION = "devel"
 PROVIDES += "pkgconfig"
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index 19b9b6bc9d..27c1178f44 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -1,8 +1,8 @@
 SUMMARY = "Helper tool used when compiling"
 DESCRIPTION = "pkg-config is a helper tool used when compiling applications and libraries. It helps determined \
 the correct compiler/link options.  It is also language-agnostic."
-HOMEPAGE = "http://pkg-config.freedesktop.org/wiki/"
-BUGTRACKER = "http://bugs.freedesktop.org/buglist.cgi?product=pkg-config"
+HOMEPAGE = "https://pkg-config.freedesktop.org/wiki/"
+BUGTRACKER = "https://bugs.freedesktop.org/buglist.cgi?product=pkg-config"
 SECTION = "console/utils"
 
 LICENSE = "GPL-2.0-or-later"
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 836e910fae..0f32508eb4 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -3,7 +3,7 @@
 # BBFETCH2=True PSEUDO_BUILD=1 ../bitbake/bin/bitbake pseudo-native [-c CMD]
 
 SUMMARY = "Pseudo gives fake root capabilities to a normal user"
-HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/pseudo"
+HOMEPAGE = "https://git.yoctoproject.org/cgit/cgit.cgi/pseudo"
 DESCRIPTION = "The pseudo utility offers a way to run commands in a virtualized root environment."
 LIC_FILES_CHKSUM = "file://COPYING;md5=a1d8023a6f953ac6ea4af765ff62d574"
 SECTION = "base"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 19b0d29b71..21a0d7570a 100644
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
 
diff --git a/meta/recipes-devtools/python/python-pycryptodome.inc b/meta/recipes-devtools/python/python-pycryptodome.inc
index ec9241e6d5..3e8878c15e 100644
--- a/meta/recipes-devtools/python/python-pycryptodome.inc
+++ b/meta/recipes-devtools/python/python-pycryptodome.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Cryptographic library for Python"
 DESCRIPTION = "PyCryptodome is a self-contained Python package of low-level\
  cryptographic primitives."
-HOMEPAGE = "http://www.pycryptodome.org"
+HOMEPAGE = "https://www.pycryptodome.org"
 LICENSE = "PD & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=29242a70410a4eeff488a28164e7ab93"
 
diff --git a/meta/recipes-devtools/python/python3-attrs_25.4.0.bb b/meta/recipes-devtools/python/python3-attrs_25.4.0.bb
index 7bc581b875..c55186a5f9 100644
--- a/meta/recipes-devtools/python/python3-attrs_25.4.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_25.4.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Classes Without Boilerplate"
-HOMEPAGE = "http://www.attrs.org/"
+HOMEPAGE = "https://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5e55731824cf9205cfabeab9a0600887"
 
diff --git a/meta/recipes-devtools/python/python3-babel_2.17.0.bb b/meta/recipes-devtools/python/python3-babel_2.17.0.bb
index adffaa044c..520ad3e82b 100644
--- a/meta/recipes-devtools/python/python3-babel_2.17.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.17.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A collection of tools for internationalizing Python applications"
-HOMEPAGE = "http://babel.edgewall.org/"
+HOMEPAGE = "https://babel.edgewall.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e83509a66c69efcb4f3a7d4f27fd0693"
 
diff --git a/meta/recipes-devtools/python/python3-certifi_2026.1.4.bb b/meta/recipes-devtools/python/python3-certifi_2026.1.4.bb
index 7a753f5b2d..fa50a9bd10 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.1.4.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.1.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python package for providing Mozilla's CA Bundle."
 DESCRIPTION = "This installable Python package contains a CA Bundle that you can reference in your \
 Python code. This is useful for verifying HTTP requests, for example.  This is the same CA Bundle \
 which ships with the Requests codebase, and is derived from Mozilla Firefox's canonical set."
-HOMEPAGE = " http://certifi.io/"
+HOMEPAGE = " https://certifi.io/"
 
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
diff --git a/meta/recipes-devtools/python/python3-cffi_2.0.0.bb b/meta/recipes-devtools/python/python3-cffi_2.0.0.bb
index 9bfc430dde..5e54555739 100644
--- a/meta/recipes-devtools/python/python3-cffi_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-cffi_2.0.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Foreign Function Interface for Python calling C code"
-HOMEPAGE = "http://cffi.readthedocs.org/"
+HOMEPAGE = "https://cffi.readthedocs.org/"
 LICENSE = "MIT-0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c0158ab9b75875f3bb7fea081d388818"
 DEPENDS += "libffi python3-pycparser"
diff --git a/meta/recipes-devtools/python/python3-click_8.3.1.bb b/meta/recipes-devtools/python/python3-click_8.3.1.bb
index 1f42fe1a50..f87b5a7132 100644
--- a/meta/recipes-devtools/python/python3-click_8.3.1.bb
+++ b/meta/recipes-devtools/python/python3-click_8.3.1.bb
@@ -4,7 +4,7 @@ Click is a Python package for creating beautiful command line interfaces \
 in a composable way with as little code as necessary. It's the "Command \
 Line Interface Creation Kit". It's highly configurable but comes with \
 sensible defaults out of the box."
-HOMEPAGE = "http://click.pocoo.org/"
+HOMEPAGE = "https://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
diff --git a/meta/recipes-devtools/python/python3-dbus_1.4.0.bb b/meta/recipes-devtools/python/python3-dbus_1.4.0.bb
index 2854eda30a..88c106a5b0 100644
--- a/meta/recipes-devtools/python/python3-dbus_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-dbus_1.4.0.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Python bindings for the DBus inter-process communication system"
 SECTION = "devel/python"
-HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
+HOMEPAGE = "https://www.freedesktop.org/Software/dbus"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=97f58951300aa52a9f9e3a62bd5c846c"
 DEPENDS = "expat dbus glib-2.0 virtual/libintl"
 
-SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.xz"
+SRC_URI = "https://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.xz"
 
 SRC_URI[sha256sum] = "c36b28f10ffcc8f1f798aca973bcc132f91f33eb9b6b8904381b4077766043d5"
 
diff --git a/meta/recipes-devtools/python/python3-docutils_0.22.4.bb b/meta/recipes-devtools/python/python3-docutils_0.22.4.bb
index 571a19a958..7d84b63e91 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.22.4.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.22.4.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Docutils is a modular system for processing documentation into useful formats"
-HOMEPAGE = "http://docutils.sourceforge.net"
+HOMEPAGE = "https://docutils.sourceforge.net"
 SECTION = "devel/python"
 LICENSE = "CC0-1.0 & BSD-2-Clause & GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=ce467b04b35c7ac3429b6908fc8b318e"
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 2126b5e92b..31dcd716bc 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "GitPython provides object model read and write access to \
 a git repository. Access repository information conveniently, alter the \
 index directly, handle remotes, or go down to low-level object database \
 access with big-files support."
-HOMEPAGE = "http://github.com/gitpython-developers/GitPython"
+HOMEPAGE = "https://github.com/gitpython-developers/GitPython"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5279a7ab369ba336989dcf2a107e5c8e"
diff --git a/meta/recipes-devtools/python/python3-gitdb_4.0.12.bb b/meta/recipes-devtools/python/python3-gitdb_4.0.12.bb
index 0b7eec876f..a790cc2502 100644
--- a/meta/recipes-devtools/python/python3-gitdb_4.0.12.bb
+++ b/meta/recipes-devtools/python/python3-gitdb_4.0.12.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A pure-Python git object database"
-HOMEPAGE = "http://github.com/gitpython-developers/gitdb"
+HOMEPAGE = "https://github.com/gitpython-developers/gitdb"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=59e5ecb13339a936eedf83282eaf4528"
diff --git a/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb b/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb
index d7ab4a5a77..2065e5d721 100644
--- a/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb
+++ b/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Simple module to parse ISO 8601 dates"
-HOMEPAGE = "http://pyiso8601.readthedocs.org/"
+HOMEPAGE = "https://pyiso8601.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aab31f2ef7ba214a5a341eaa47a7f367"
 
diff --git a/meta/recipes-devtools/python/python3-magic_0.4.27.bb b/meta/recipes-devtools/python/python3-magic_0.4.27.bb
index 2e561e69d7..e5818c808a 100644
--- a/meta/recipes-devtools/python/python3-magic_0.4.27.bb
+++ b/meta/recipes-devtools/python/python3-magic_0.4.27.bb
@@ -2,7 +2,7 @@ SUMMARY = "File type identification using libmagic"
 DESCRIPTION = "This module uses ctypes to access the libmagic file type \
     identification library. It makes use of the local magic database and supports \
     both textual and MIME-type output."
-HOMEPAGE = "http://github.com/ahupp/python-magic"
+HOMEPAGE = "https://github.com/ahupp/python-magic"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=61495c152d794e6be5799a9edca149e3"
diff --git a/meta/recipes-devtools/python/python3-mako_1.3.10.bb b/meta/recipes-devtools/python/python3-mako_1.3.10.bb
index 2d937dc184..0c86aa2f9f 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.10.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.10.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Templating library for Python"
-HOMEPAGE = "http://www.makotemplates.org/"
+HOMEPAGE = "https://www.makotemplates.org/"
 SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=73026b50800163bd3c75cfdc121d9eb5"
diff --git a/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb b/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb
index dace235bb8..7600746d32 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Implements a XML/HTML/XHTML Markup safe string for Python"
-HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
+HOMEPAGE = "https://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb
index 820ef27d2b..b1ea45a160 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Python library implementing ASN.1 types."
-HOMEPAGE = "http://pyasn1.sourceforge.net/"
+HOMEPAGE = "https://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 
diff --git a/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
index 20c2c332cd..90eeb708d7 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Python bindings for the Cairo canvas library"
-HOMEPAGE = "http://cairographics.org/pycairo"
-BUGTRACKER = "http://bugs.freedesktop.org"
+HOMEPAGE = "https://cairographics.org/pycairo"
+BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "python-devel"
 LICENSE = "LGPL-2.1-only & MPL-1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f3713ca2c28d9312ad718520b6dc3eee \
diff --git a/meta/recipes-devtools/python/python3-pygments_2.19.2.bb b/meta/recipes-devtools/python/python3-pygments_2.19.2.bb
index a1f73b441d..f4cd1d23e8 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.19.2.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.19.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Pygments is a syntax highlighting package written in Python."
 DESCRIPTION = "Pygments is a syntax highlighting package written in Python."
-HOMEPAGE = "http://pygments.org/"
+HOMEPAGE = "https://pygments.org/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
diff --git a/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb b/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
index dbf0fb0ee6..7f4f419671 100644
--- a/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
+++ b/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A Python SOCKS client module"
-HOMEPAGE = "http://python-requests.org"
+HOMEPAGE = "https://python-requests.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d457bcffb9661b45f799d4efee72f16"
 
diff --git a/meta/recipes-devtools/python/python3-pytz_2025.2.bb b/meta/recipes-devtools/python/python3-pytz_2025.2.bb
index 86bfceadc8..bbcb713958 100644
--- a/meta/recipes-devtools/python/python3-pytz_2025.2.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2025.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "World timezone definitions, modern and historical"
-HOMEPAGE = "http://pythonhosted.org/pytz"
+HOMEPAGE = "https://pythonhosted.org/pytz"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999"
 
diff --git a/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb b/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
index 78763a911e..e65b4a8bb7 100644
--- a/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
+++ b/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
@@ -1,5 +1,5 @@
 SUMMARY  = "A library implementing the 'SemVer' scheme."
-DESCRIPTION = "Semantic version comparison for Python (see http://semver.org/)"
+DESCRIPTION = "Semantic version comparison for Python (see https://semver.org/)"
 HOMEPAGE = "https://github.com/rbarrois/python-semanticversion"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fb31e3c1c7eeb8b5e8c07657cdd54e2"
diff --git a/meta/recipes-devtools/python/python3-smmap_6.0.0.bb b/meta/recipes-devtools/python/python3-smmap_6.0.0.bb
index 6abed1205f..1b36a5ce31 100644
--- a/meta/recipes-devtools/python/python3-smmap_6.0.0.bb
+++ b/meta/recipes-devtools/python/python3-smmap_6.0.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python implementation of a sliding window memory map manager"
 DESCRIPTION = "A pure Python implementation of a sliding memory map to \
 help unifying memory mapped access on 32 and 64 bit systems and to help \
 managing resources more efficiently."
-HOMEPAGE = "http://github.com/gitpython-developers/GitPython"
+HOMEPAGE = "https://github.com/gitpython-developers/GitPython"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
diff --git a/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb b/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb
index 0755d3e177..c1999f2c36 100644
--- a/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb
+++ b/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Sorted Containers is an Apache2 licensed sorted collections library, written in pure-Python, and fast as C-extensions."
-HOMEPAGE = "http://www.grantjenks.com/docs/sortedcontainers/"
+HOMEPAGE = "https://www.grantjenks.com/docs/sortedcontainers/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7c7c6a1a12ec816da16c1839137d53ae"
 
diff --git a/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb b/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
index 24e95da10d..34e201003d 100644
--- a/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Python documentation generator"
-HOMEPAGE = "http://sphinx-doc.org/"
+HOMEPAGE = "https://sphinx-doc.org/"
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=e30c37a2b7fb0afa3adc0d72b85e8b04"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb
index 141d1c4862..cfae73ac7e 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Is a sphinx extension which outputs QtHelp document."
-HOMEPAGE = "http://babel.edgewall.org/"
+HOMEPAGE = "https://babel.edgewall.org/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=f7a83b72ea86d04827575ec0b63430eb"
 
diff --git a/meta/recipes-devtools/python/python3_3.13.11.bb b/meta/recipes-devtools/python/python3_3.13.11.bb
index 2fcfd4aba1..8a1b9f2fbd 100644
--- a/meta/recipes-devtools/python/python3_3.13.11.bb
+++ b/meta/recipes-devtools/python/python3_3.13.11.bb
@@ -1,12 +1,12 @@
 SUMMARY = "The Python Programming Language"
-HOMEPAGE = "http://www.python.org"
+HOMEPAGE = "https://www.python.org"
 DESCRIPTION = "Python is a programming language that lets you work more quickly and integrate your systems more effectively."
 LICENSE = "PSF-2.0"
 SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3f64a4ff490f884d562feb77bf2435f1"
 
-SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
+SRC_URI = "https://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://run-ptest \
            file://create_manifest3.py \
            file://get_module_deps3.py \
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index eb4a5f71bc..7dc834372e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "QEMU is a hosted virtual machine monitor: it emulates the \
 machine's processor through dynamic binary translation and provides a set \
 of different hardware and device models for the machine, enabling it to run \
 a variety of guest operating systems"
-HOMEPAGE = "http://qemu.org"
+HOMEPAGE = "https://qemu.org"
 LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 
 DEPENDS += "bison-native meson-native ninja-native"
diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index 752ff3198d..0c1e464b03 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "QEMU wrapper script"
-HOMEPAGE = "http://qemu.org"
+HOMEPAGE = "https://qemu.org"
 LICENSE = "MIT"
 
 S = "${UNPACKDIR}"
diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index 59d13237e2..96a3d44ec6 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -2,7 +2,7 @@ SUMMARY = "Tool for working with series of patches"
 DESCRIPTION = "Quilt is a tool to manage large sets of patches by keeping \
 track of the changes each patch makes. Patches can be applied, un-applied,\
 refreshed, etc."
-HOMEPAGE = "http://savannah.nongnu.org/projects/quilt/"
+HOMEPAGE = "https://savannah.nongnu.org/projects/quilt/"
 SECTION = "devel"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta/recipes-devtools/rpm/rpm_4.20.1.bb b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
index ba967ec1fa..734f437179 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
@@ -18,7 +18,7 @@ DESCRIPTION:python3-rpm = "The python3-rpm package contains a module that permit
 written in the Python programming language to use the interface \
 supplied by the RPM Package Manager libraries."
 
-HOMEPAGE = "http://www.rpm.org"
+HOMEPAGE = "https://www.rpm.org"
 
 # libraries are also LGPL - how to express this?
 LICENSE = "GPL-2.0-only"
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
index 6de30d337d..3a04d1cb78 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "File synchronization tool"
-HOMEPAGE = "http://rsync.samba.org/"
+HOMEPAGE = "https://rsync.samba.org/"
 DESCRIPTION = "rsync is an open source utility that provides fast incremental file transfer."
-BUGTRACKER = "http://rsync.samba.org/bugzilla.html"
+BUGTRACKER = "https://rsync.samba.org/bugzilla.html"
 SECTION = "console/network"
 # GPL-2.0-or-later (<< 3.0.0), GPL-3.0-or-later (>= 3.0.0)
 # Includes opennsh and xxhash dynamic link exception
diff --git a/meta/recipes-devtools/ruby/ruby_3.4.7.bb b/meta/recipes-devtools/ruby/ruby_3.4.7.bb
index 2fbcfd1f1b..810c0d66f9 100644
--- a/meta/recipes-devtools/ruby/ruby_3.4.7.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.4.7.bb
@@ -4,7 +4,7 @@ and easy object-oriented programming. It has many features to process \
 text files and to do system management tasks (as in Perl). \
 It is simple, straight-forward, and extensible. \
 "
-HOMEPAGE = "http://www.ruby-lang.org/"
+HOMEPAGE = "https://www.ruby-lang.org/"
 SECTION = "devel/ruby"
 LICENSE = "Ruby | BSD-2-Clause | BSD-3-Clause | GPL-2.0-only | ISC | MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5b8c87559868796979806100db3f3805 \
@@ -18,7 +18,7 @@ DEPENDS:append:class-target = " ruby-native"
 DEPENDS:append:class-nativesdk = " ruby-native"
 
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
-SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
+SRC_URI = "https://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0001-extmk-fix-cross-compilation-of-external-gems.patch \
            file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch \
            file://run-ptest \
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb
index 8af93bec57..555f129307 100644
--- a/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb
+++ b/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Rust standard libaries"
-HOMEPAGE = "http://www.rust-lang.org"
+HOMEPAGE = "https://www.rust-lang.org"
 SECTION = "devel"
 LICENSE = "(MIT | Apache-2.0) & Unicode-3.0"
 LIC_FILES_CHKSUM = "file://../../COPYRIGHT;md5=11a3899825f4376896e438c8c753f8dc"
diff --git a/meta/recipes-devtools/rust/rust_1.92.0.bb b/meta/recipes-devtools/rust/rust_1.92.0.bb
index a25f65f674..681ebad660 100644
--- a/meta/recipes-devtools/rust/rust_1.92.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.92.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Rust compiler and runtime libaries"
-HOMEPAGE = "http://www.rust-lang.org"
+HOMEPAGE = "https://www.rust-lang.org"
 SECTION = "devel"
 LICENSE = "(MIT | Apache-2.0) & Unicode-3.0"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=11a3899825f4376896e438c8c753f8dc"
diff --git a/meta/recipes-devtools/strace/strace_6.18.bb b/meta/recipes-devtools/strace/strace_6.18.bb
index a2eba0797f..07dc2ef147 100644
--- a/meta/recipes-devtools/strace/strace_6.18.bb
+++ b/meta/recipes-devtools/strace/strace_6.18.bb
@@ -1,5 +1,5 @@
 SUMMARY = "System call tracing tool"
-HOMEPAGE = "http://strace.io"
+HOMEPAGE = "https://strace.io"
 DESCRIPTION = "strace is a diagnostic, debugging and instructional userspace utility for Linux. It is used to monitor and tamper with interactions between processes and the Linux kernel, which include system calls, signal deliveries, and changes of process state."
 SECTION = "console/utils"
 LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
diff --git a/meta/recipes-devtools/subversion/subversion_1.14.5.bb b/meta/recipes-devtools/subversion/subversion_1.14.5.bb
index 56ef1019fc..84c1ae3756 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.5.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.5.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Subversion (svn) version control system client"
-HOMEPAGE = "http://subversion.apache.org"
+HOMEPAGE = "https://subversion.apache.org"
 DESCRIPTION = "Subversion is an open source version control system."
 SECTION = "console/network"
 LICENSE = "Apache-2.0 & MIT"
diff --git a/meta/recipes-devtools/swig/swig_4.4.1.bb b/meta/recipes-devtools/swig/swig_4.4.1.bb
index f71a92d931..267cea6321 100644
--- a/meta/recipes-devtools/swig/swig_4.4.1.bb
+++ b/meta/recipes-devtools/swig/swig_4.4.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "SWIG - Simplified Wrapper and Interface Generator"
 DESCRIPTION = "SWIG is a compiler that makes it easy to integrate C and C++ \
 code with other languages including Perl, Tcl, Ruby, Python, Java, Guile, \
 Mzscheme, Chicken, OCaml, Pike, and C#."
-HOMEPAGE = "http://swig.sourceforge.net/"
+HOMEPAGE = "https://swig.sourceforge.net/"
 LICENSE = "BSD-3-Clause & GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e7807a6282784a7dde4c846626b08fc6 \
                     file://LICENSE-GPL;md5=d32239bcb673463ab874e80d47fae504 \
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index 449a75ebf8..13e7c6790c 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Multi-purpose linux bootloader"
-HOMEPAGE = "http://www.syslinux.org/"
+HOMEPAGE = "https://www.syslinux.org/"
 DESCRIPTION = "The Syslinux Project covers lightweight bootloaders for MS-DOS FAT filesystems (SYSLINUX), network booting (PXELINUX), bootable "El Torito" CD-ROMs (ISOLINUX), and Linux ext2/ext3/ext4 or btrfs filesystems (EXTLINUX). The project also includes MEMDISK, a tool to boot legacy operating systems (such as DOS) from nontraditional media; it is usually used in conjunction with PXELINUX and ISOLINUX."
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb
index 132b3d7dee..7507adb938 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Target Communication Framework for the Eclipse IDE"
-HOMEPAGE = "http://wiki.eclipse.org/TCF"
+HOMEPAGE = "https://wiki.eclipse.org/TCF"
 DESCRIPTION = "TCF is a vendor-neutral, lightweight, extensible network protocol mainly for communicating with embedded systems (targets)."
 BUGTRACKER = "https://bugs.eclipse.org/bugs/"
 
diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.3.bb b/meta/recipes-devtools/tcltk/tcl_9.0.3.bb
index 21a6cbb23d..0c6055e562 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.3.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.3.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Tool Command Language"
-HOMEPAGE = "http://tcl.sourceforge.net"
+HOMEPAGE = "https://tcl.sourceforge.net"
 DESCRIPTION = "Tool Command Language, is an open-source multi-purpose C library which includes a powerful dynamic scripting language. Together they provide ideal cross-platform development environment for any programming project."
 SECTION = "devel/tcltk"
 
-# http://www.tcl.tk/software/tcltk/license.html
+# https://www.tcl.tk/software/tcltk/license.html
 LICENSE = "TCL & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://license.terms;md5=058f6229798281bbcac4239c788cfa38 \
     file://compat/license.terms;md5=058f6229798281bbcac4239c788cfa38 \
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
index b97b20abd5..43f75f3e22 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Tool Command Language"
-HOMEPAGE = "http://tcl.sourceforge.net"
+HOMEPAGE = "https://tcl.sourceforge.net"
 DESCRIPTION = "Tool Command Language, is an open-source multi-purpose C library which includes a powerful dynamic scripting language. Together they provide ideal cross-platform development environment for any programming project."
 SECTION = "devel/tcltk"
 
-# http://www.tcl.tk/software/tcltk/license.html
+# https://www.tcl.tk/software/tcltk/license.html
 LICENSE = "TCL & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://license.terms;md5=058f6229798281bbcac4239c788cfa38 \
     file://compat/license.terms;md5=058f6229798281bbcac4239c788cfa38 \
diff --git a/meta/recipes-devtools/unifdef/unifdef_2.12.bb b/meta/recipes-devtools/unifdef/unifdef_2.12.bb
index e3bd4eb0f9..c7c32db8f4 100644
--- a/meta/recipes-devtools/unifdef/unifdef_2.12.bb
+++ b/meta/recipes-devtools/unifdef/unifdef_2.12.bb
@@ -1,14 +1,14 @@
 SUMMARY = "Selectively remove #ifdef statements from sources"
 SECTION = "devel"
 LICENSE = "BSD-2-Clause"
-HOMEPAGE = "http://dotat.at/prog/unifdef/"
+HOMEPAGE = "https://dotat.at/prog/unifdef/"
 DESCRIPTION = "The unifdef utility selectively processes conditional C preprocessor #if and #ifdef directives. It removes from a file both the directives and the additional text that they delimit, while otherwise leaving the file alone."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3498caf346f6b77934882101749ada23 \
                     file://unifdef.c;endline=32;md5=6f4ee8085d6e6ab0f7cb4390e1a9c497 \
                     "
 
-SRC_URI = "http://dotat.at/prog/${BPN}/${BP}.tar.xz \
+SRC_URI = "https://dotat.at/prog/${BPN}/${BP}.tar.xz \
            file://0001-Don-t-use-C23-constexpr-keyword.patch"
 SRC_URI[sha256sum] = "43ce0f02ecdcdc723b2475575563ddb192e988c886d368260bc0a63aee3ac400"
 
diff --git a/meta/recipes-devtools/vala/vala_0.56.18.bb b/meta/recipes-devtools/vala/vala_0.56.18.bb
index 16e5d2b7c8..58d5046c1d 100644
--- a/meta/recipes-devtools/vala/vala_0.56.18.bb
+++ b/meta/recipes-devtools/vala/vala_0.56.18.bb
@@ -1,5 +1,5 @@
 SUMMARY = "C#-like programming language for easing GObject programming"
-HOMEPAGE = "http://vala-project.org"
+HOMEPAGE = "https://vala-project.org"
 DESCRIPTION = "Vala is a C#-like language dedicated to ease GObject programming. \
 Vala compiles to plain C and has no runtime environment nor penalities whatsoever."
 SECTION = "devel"
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.26.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.26.0.bb
index 6f7d67df0e..1ddb87c986 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.26.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.26.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Valgrind memory debugger and instrumentation framework"
-HOMEPAGE = "http://valgrind.org/"
+HOMEPAGE = "https://valgrind.org/"
 DESCRIPTION = "Valgrind is an instrumentation framework for building dynamic analysis tools. There are Valgrind tools that can automatically detect many memory management and threading bugs, and profile your programs in detail."
-BUGTRACKER = "http://valgrind.org/support/bug_reports.html"
+BUGTRACKER = "https://valgrind.org/support/bug_reports.html"
 LICENSE = "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://include/pub_tool_basics.h;beginline=6;endline=29;md5=9ba449d120f6845e6a432073278d6e3a \
diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb b/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb
index 848c380363..6f17992e29 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Tool for creating HTML, PDF, EPUB, man pages"
 DESCRIPTION = "AsciiDoc is a text document format for writing short documents, \
 articles, books and UNIX man pages."
 
-HOMEPAGE = "http://asciidoc.org/"
+HOMEPAGE = "https://asciidoc.org/"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=aaee33adce0fc7cc40fee23f82f7f101 \
diff --git a/meta/recipes-extended/at/at_3.2.5.bb b/meta/recipes-extended/at/at_3.2.5.bb
index 112d1c4adc..d702feecb4 100644
--- a/meta/recipes-extended/at/at_3.2.5.bb
+++ b/meta/recipes-extended/at/at_3.2.5.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Delayed job execution and batch processing"
-HOMEPAGE = "http://blog.calhariz.com/"
+HOMEPAGE = "https://blog.calhariz.com/"
 DESCRIPTION = "At allows for commands to be run at a particular time.  Batch will execute commands when \
 the system load levels drop to a particular level."
 SECTION = "base"
diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 634209c911..4aed6acbe0 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -1,5 +1,5 @@
 SUMMARY = "An sh-compatible command language interpreter"
-HOMEPAGE = "http://tiswww.case.edu/php/chet/bash/bashtop.html"
+HOMEPAGE = "https://tiswww.case.edu/php/chet/bash/bashtop.html"
 DESCRIPTION = "Bash is the GNU Project's Bourne Again SHell, a complete implementation of the IEEE POSIX and Open Group shell specification with interactive command line editing, job control on architectures that support it, csh-like features such as history substitution and brace expansion, and a slew of other features."
 SECTION = "base/shell"
 
diff --git a/meta/recipes-extended/bc/bc_1.08.2.bb b/meta/recipes-extended/bc/bc_1.08.2.bb
index cebfed9642..9adec12154 100644
--- a/meta/recipes-extended/bc/bc_1.08.2.bb
+++ b/meta/recipes-extended/bc/bc_1.08.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Arbitrary precision calculator language"
-HOMEPAGE = "http://www.gnu.org/software/bc/bc.html"
+HOMEPAGE = "https://www.gnu.org/software/bc/bc.html"
 DESCRIPTION = "bc is an arbitrary precision numeric processing language. Syntax is similar to C, but differs in many substantial areas. It supports interactive execution of statements."
 
 LICENSE = "GPL-3.0-or-later"
diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-extended/cpio/cpio_2.15.bb
index fa011251e2..24c46d9058 100644
--- a/meta/recipes-extended/cpio/cpio_2.15.bb
+++ b/meta/recipes-extended/cpio/cpio_2.15.bb
@@ -1,7 +1,7 @@
 SUMMARY = "GNU cpio is a program to manage archives of files"
 DESCRIPTION = "GNU cpio is a tool for creating and extracting archives, or copying files from one place to \
 another. It handles a number of cpio formats as well as reading and writing tar files."
-HOMEPAGE = "http://www.gnu.org/software/cpio/"
+HOMEPAGE = "https://www.gnu.org/software/cpio/"
 SECTION = "base"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
diff --git a/meta/recipes-extended/ed/ed_1.22.4.bb b/meta/recipes-extended/ed/ed_1.22.4.bb
index 36b631b762..5a5d396b86 100644
--- a/meta/recipes-extended/ed/ed_1.22.4.bb
+++ b/meta/recipes-extended/ed/ed_1.22.4.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Line-oriented text editor"
-HOMEPAGE = "http://www.gnu.org/software/ed/"
+HOMEPAGE = "https://www.gnu.org/software/ed/"
 DESCRIPTION = "GNU ed is a line-oriented text editor. It is used to create, display, modify and otherwise manipulate text files, both interactively and via shell scripts. A restricted version of ed, red, can only edit files in the current directory and cannot execute shell commands."
 
 LICENSE = "GPL-2.0-only"
diff --git a/meta/recipes-extended/ethtool/ethtool_6.15.bb b/meta/recipes-extended/ethtool/ethtool_6.15.bb
index eb6b272d4a..bc974be82b 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.15.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.15.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Display or change ethernet card settings"
 DESCRIPTION = "A small utility for examining and tuning the settings of your ethernet-based network interfaces."
-HOMEPAGE = "http://www.kernel.org/pub/software/network/ethtool/"
+HOMEPAGE = "https://www.kernel.org/pub/software/network/ethtool/"
 SECTION = "console/network"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
diff --git a/meta/recipes-extended/findutils/findutils.inc b/meta/recipes-extended/findutils/findutils.inc
index ddcc05750b..4e382208db 100644
--- a/meta/recipes-extended/findutils/findutils.inc
+++ b/meta/recipes-extended/findutils/findutils.inc
@@ -2,8 +2,8 @@ SUMMARY = "find, locate, and xargs binaries"
 DESCRIPTION = "The GNU Find Utilities are the basic directory searching utilities of the GNU operating system. \
 These programs are typically used in conjunction with other programs to provide modular and powerful directory \
 search and file locating capabilities to other commands."
-HOMEPAGE = "http://www.gnu.org/software/findutils/"
-BUGTRACKER = "http://savannah.gnu.org/bugs/?group=findutils"
+HOMEPAGE = "https://www.gnu.org/software/findutils/"
+BUGTRACKER = "https://savannah.gnu.org/bugs/?group=findutils"
 SECTION = "console/utils"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.xz \
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
index 4cea898432..bc5f779be1 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
@@ -7,7 +7,7 @@ Furthermore, it can render PostScript and PDF files as graphics to be printed \
 on non-PostScript printers. Supported printers include common \
 dot-matrix, inkjet and laser models. \
 "
-HOMEPAGE = "http://www.ghostscript.com"
+HOMEPAGE = "https://www.ghostscript.com"
 SECTION = "console/utils"
 
 LICENSE = "AGPL-3.0-or-later"
diff --git a/meta/recipes-extended/gperf/gperf_3.3.bb b/meta/recipes-extended/gperf/gperf_3.3.bb
index 7af2130114..3a5c39c217 100644
--- a/meta/recipes-extended/gperf/gperf_3.3.bb
+++ b/meta/recipes-extended/gperf/gperf_3.3.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "GNU gperf is a perfect hash function generator"
-HOMEPAGE = "http://www.gnu.org/software/gperf"
+HOMEPAGE = "https://www.gnu.org/software/gperf"
 SUMMARY  = "Generate a perfect hash function from a set of keywords"
 LICENSE  = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
diff --git a/meta/recipes-extended/grep/grep_3.12.bb b/meta/recipes-extended/grep/grep_3.12.bb
index 2678d2d41e..6e5f57a468 100644
--- a/meta/recipes-extended/grep/grep_3.12.bb
+++ b/meta/recipes-extended/grep/grep_3.12.bb
@@ -1,7 +1,7 @@
 SUMMARY = "GNU grep utility"
-HOMEPAGE = "http://savannah.gnu.org/projects/grep/"
+HOMEPAGE = "https://savannah.gnu.org/projects/grep/"
 DESCRIPTION = "Grep searches one or more input files for lines containing a match to a specified pattern. By default, grep prints the matching lines."
-BUGTRACKER = "http://savannah.gnu.org/bugs/?group=grep"
+BUGTRACKER = "https://savannah.gnu.org/bugs/?group=grep"
 SECTION = "console/utils"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
diff --git a/meta/recipes-extended/groff/groff_1.23.0.bb b/meta/recipes-extended/groff/groff_1.23.0.bb
index 0c2ef61758..e1bf107b1c 100644
--- a/meta/recipes-extended/groff/groff_1.23.0.bb
+++ b/meta/recipes-extended/groff/groff_1.23.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "GNU Troff software"
 DESCRIPTION = "The groff (GNU troff) software is a typesetting package which reads plain text mixed with \
 formatting commands and produces formatted output."
 SECTION = "base"
-HOMEPAGE = "http://www.gnu.org/software/groff/"
+HOMEPAGE = "https://www.gnu.org/software/groff/"
 LICENSE = "GPL-3.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta/recipes-extended/gzip/gzip.inc b/meta/recipes-extended/gzip/gzip.inc
index 12232dd4da..bf563dcd48 100644
--- a/meta/recipes-extended/gzip/gzip.inc
+++ b/meta/recipes-extended/gzip/gzip.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Standard GNU compressor"
 DESCRIPTION = "GNU Gzip is a popular data compression program originally written by Jean-loup Gailly for the GNU \
 project. Mark Adler wrote the decompression part"
-HOMEPAGE = "http://www.gnu.org/software/gzip/"
+HOMEPAGE = "https://www.gnu.org/software/gzip/"
 SECTION = "console/utils"
 
 inherit autotools texinfo
diff --git a/meta/recipes-extended/hdparm/hdparm_9.65.bb b/meta/recipes-extended/hdparm/hdparm_9.65.bb
index e541d58fa5..2133e4ae71 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.65.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.65.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Utility for viewing/manipulating IDE disk drive/driver parameters"
-HOMEPAGE = "http://sourceforge.net/projects/hdparm/"
+HOMEPAGE = "https://sourceforge.net/projects/hdparm/"
 DESCRIPTION = "hdparm is a Linux shell utility for viewing \
 and manipulating various IDE drive and driver parameters."
 SECTION = "console/utils"
diff --git a/meta/recipes-extended/iptables/iptables_1.8.11.bb b/meta/recipes-extended/iptables/iptables_1.8.11.bb
index 686dc5afe5..7a1bca64d3 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.11.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.11.bb
@@ -1,14 +1,14 @@
 SUMMARY = "Tools for managing kernel packet filtering capabilities"
 DESCRIPTION = "iptables is the userspace command line program used to configure and control network packet \
 filtering code in Linux."
-HOMEPAGE = "http://www.netfilter.org/"
-BUGTRACKER = "http://bugzilla.netfilter.org/"
+HOMEPAGE = "https://www.netfilter.org/"
+BUGTRACKER = "https://bugzilla.netfilter.org/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://iptables/iptables.c;beginline=13;endline=25;md5=c5cffd09974558cf27d0f763df2a12dc \
 "
 
-SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.xz \
+SRC_URI = "https://netfilter.org/projects/iptables/files/iptables-${PV}.tar.xz \
            file://iptables.service \
            file://iptables.rules \
            file://ip6tables.service \
diff --git a/meta/recipes-extended/less/less_685.bb b/meta/recipes-extended/less/less_685.bb
index 904980a72f..4945c4ae1f 100644
--- a/meta/recipes-extended/less/less_685.bb
+++ b/meta/recipes-extended/less/less_685.bb
@@ -2,7 +2,7 @@ SUMMARY = "Text file viewer similar to more"
 DESCRIPTION = "Less is a program similar to more, i.e. a terminal \
 based program for viewing text files and the output from other \
 programs. Less offers many features beyond those that more does."
-HOMEPAGE = "http://www.greenwoodsoftware.com/"
+HOMEPAGE = "https://www.greenwoodsoftware.com/"
 SECTION = "console/utils"
 
 # (GPL-2.0-or-later (<< 418), GPL-3.0-or-later (>= 418)) | less
@@ -25,13 +25,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     "
 DEPENDS = "ncurses"
 
-SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
 SRC_URI[sha256sum] = "2701041e767e697ee420ce0825641cedc8f20b51576abe99d92c1666d332e9dc"
 
-UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
+UPSTREAM_CHECK_URI = "https://www.greenwoodsoftware.com/less/download.html"
 
 inherit autotools ptest update-alternatives
 
diff --git a/meta/recipes-extended/libaio/libaio_0.3.113.bb b/meta/recipes-extended/libaio/libaio_0.3.113.bb
index 2392fd5db2..f367aa5ce6 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.113.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.113.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Asynchronous I/O library"
 DESCRIPTION = "Asynchronous input/output library that uses the kernels native interface"
-HOMEPAGE = "http://lse.sourceforge.net/io/aio.html"
+HOMEPAGE = "https://lse.sourceforge.net/io/aio.html"
 
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.5.bb b/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
index fcfaf5d231..27fd7c5865 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Support for reading various archive formats"
 DESCRIPTION = "C library and command-line tools for reading and writing tar, cpio, zip, ISO, and other archive formats"
-HOMEPAGE = "http://www.libarchive.org/"
+HOMEPAGE = "https://www.libarchive.org/"
 SECTION = "devel"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7ce08437ff7f5e24d72e666313ae4084"
diff --git a/meta/recipes-extended/libidn/libidn2_2.3.8.bb b/meta/recipes-extended/libidn/libidn2_2.3.8.bb
index a53ac47d66..3e6322b3f0 100644
--- a/meta/recipes-extended/libidn/libidn2_2.3.8.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.3.8.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Internationalized Domain Name support library"
 DESCRIPTION = "Implementation of the Stringprep, Punycode and IDNA specifications defined by the IETF Internationalized Domain Names (IDN) working group."
-HOMEPAGE = "http://www.gnu.org/software/libidn/"
+HOMEPAGE = "https://www.gnu.org/software/libidn/"
 SECTION = "libs"
 LICENSE = "(GPL-2.0-or-later | LGPL-3.0-only) & GPL-3.0-or-later & Unicode-DFS-2016"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
diff --git a/meta/recipes-extended/libpipeline/libpipeline_1.5.8.bb b/meta/recipes-extended/libpipeline/libpipeline_1.5.8.bb
index 1f6de1d925..7ee5325394 100644
--- a/meta/recipes-extended/libpipeline/libpipeline_1.5.8.bb
+++ b/meta/recipes-extended/libpipeline/libpipeline_1.5.8.bb
@@ -2,7 +2,7 @@ SUMMARY = "pipeline manipulation library"
 DESCRIPTION = "This is a C library for setting up and running pipelines of processes, \
 without needing to involve shell command-line parsing which is often \
 error-prone and insecure."
-HOMEPAGE = "http://libpipeline.nongnu.org/"
+HOMEPAGE = "https://libpipeline.nongnu.org/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
index edc75a8366..c823822bae 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
@@ -1,8 +1,8 @@
 SUMMARY = "Transport-Independent RPC library"
 DESCRIPTION = "Libtirpc is a port of Suns Transport-Independent RPC library to Linux"
 SECTION = "libs/network"
-HOMEPAGE = "http://sourceforge.net/projects/libtirpc/"
-BUGTRACKER = "http://sourceforge.net/tracker/?group_id=183075&atid=903784"
+HOMEPAGE = "https://sourceforge.net/projects/libtirpc/"
+BUGTRACKER = "https://sourceforge.net/tracker/?group_id=183075&atid=903784"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3 \
                     file://src/netname.c;beginline=1;endline=27;md5=f8a8cd2cb25ac5aa16767364fb0e3c24"
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
index 8221d30283..636b6dff07 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Lightweight high-performance web server"
-HOMEPAGE = "http://www.lighttpd.net/"
+HOMEPAGE = "https://www.lighttpd.net/"
 DESCRIPTION = "Lightweight high-performance web server is designed and optimized for high performance environments. With a small memory footprint compared to other web-servers, effective management of the cpu-load, and advanced feature set (FastCGI, SCGI, Auth, Output-Compression, URL-Rewriting and many more)"
-BUGTRACKER = "http://redmine.lighttpd.net/projects/lighttpd/issues"
+BUGTRACKER = "https://redmine.lighttpd.net/projects/lighttpd/issues"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4dac5c6ab169aa212feb5028853a579"
@@ -10,7 +10,7 @@ SECTION = "net"
 RDEPENDS:${PN} = "lighttpd-module-dirlisting"
 RRECOMMENDS:${PN} = "lighttpd-module-accesslog"
 
-SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.xz \
+SRC_URI = "https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.xz \
            file://index.html.lighttpd \
            file://lighttpd.conf \
            file://lighttpd \
diff --git a/meta/recipes-extended/lsof/lsof_4.99.5.bb b/meta/recipes-extended/lsof/lsof_4.99.5.bb
index 292db224af..4d856c5d15 100644
--- a/meta/recipes-extended/lsof/lsof_4.99.5.bb
+++ b/meta/recipes-extended/lsof/lsof_4.99.5.bb
@@ -1,7 +1,7 @@
 SUMMARY = "LiSt Open Files tool"
 DESCRIPTION = "Lsof is a Unix-specific diagnostic tool. \
 Its name stands for LiSt Open Files, and it does just that."
-HOMEPAGE = "http://people.freebsd.org/~abe/"
+HOMEPAGE = "https://people.freebsd.org/~abe/"
 SECTION = "devel"
 LICENSE = "Spencer-94"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a48ac97a8550eff12395a2c0d6151510"
diff --git a/meta/recipes-extended/ltp/ltp_20250930.bb b/meta/recipes-extended/ltp/ltp_20250930.bb
index 30897de7ca..215f29471e 100644
--- a/meta/recipes-extended/ltp/ltp_20250930.bb
+++ b/meta/recipes-extended/ltp/ltp_20250930.bb
@@ -71,8 +71,8 @@ do_install(){
     # as it lacks dependency on some perl moudle such as LWP::Simple
     # And this script previously works as a tool for analyzing failures from LTP
     # runs on the OSDL's Scaleable Test Platform (STP) and it mainly accesses
-    # http://khack.osdl.org to retrieve ltp test results run on
-    # OSDL's Scaleable Test Platform, but now http://khack.osdl.org unaccessible
+    # https://khack.osdl.org to retrieve ltp test results run on
+    # OSDL's Scaleable Test Platform, but now https://khack.osdl.org unaccessible
     rm -rf ${D}${prefix}/bin/STPfailure_report.pl
 
     # The controllers memcg_stree test seems to cause us hangs and takes 900s
diff --git a/meta/recipes-extended/lzip/lzip_1.25.bb b/meta/recipes-extended/lzip/lzip_1.25.bb
index 590e35cb75..b413286074 100644
--- a/meta/recipes-extended/lzip/lzip_1.25.bb
+++ b/meta/recipes-extended/lzip/lzip_1.25.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Lossless data compressor based on the LZMA algorithm"
-HOMEPAGE = "http://lzip.nongnu.org/lzip.html"
+HOMEPAGE = "https://lzip.nongnu.org/lzip.html"
 DESCRIPTION = "Lzip is a lossless data compressor with a user interface similar to the one of gzip or bzip2. Lzip uses a simplified form of the Lempel-Ziv-Markov chain-Algorithm (LZMA) stream format, chosen to maximize safety and interoperability."
 SECTION = "console/utils"
 LICENSE = "GPL-2.0-or-later"
diff --git a/meta/recipes-extended/man-db/man-db_2.13.1.bb b/meta/recipes-extended/man-db/man-db_2.13.1.bb
index f044a47f7d..39094ebf37 100644
--- a/meta/recipes-extended/man-db/man-db_2.13.1.bb
+++ b/meta/recipes-extended/man-db/man-db_2.13.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "An implementation of the standard Unix documentation system accessed using the man command"
-HOMEPAGE = "http://man-db.nongnu.org/"
+HOMEPAGE = "https://man-db.nongnu.org/"
 DESCRIPTION = "man-db is an implementation of the standard Unix documentation system accessed using the man command. It uses a Berkeley DB database in place of the traditional flat-text whatis databases."
 LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
diff --git a/meta/recipes-extended/man-pages/man-pages_6.16.bb b/meta/recipes-extended/man-pages/man-pages_6.16.bb
index 5bd79c0425..8d49dd7b31 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.16.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.16.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Linux man-pages"
 DESCRIPTION = "The Linux man-pages project documents the Linux kernel and C library interfaces that are employed by user programs"
 SECTION = "console/utils"
-HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
+HOMEPAGE = "https://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPL-2.0-or-later & GPL-2.0-only & GPL-1.0-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause-UC & MIT"
 
 LIC_FILES_CHKSUM = "file://README;md5=c2d6fa1a74bdd79c25de6f4db7332294 \
diff --git a/meta/recipes-extended/mc/mc_4.8.33.bb b/meta/recipes-extended/mc/mc_4.8.33.bb
index fd18edf7be..50af5c67ce 100644
--- a/meta/recipes-extended/mc/mc_4.8.33.bb
+++ b/meta/recipes-extended/mc/mc_4.8.33.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Midnight Commander is an ncurses based file manager"
-HOMEPAGE = "http://www.midnight-commander.org/"
+HOMEPAGE = "https://www.midnight-commander.org/"
 DESCRIPTION = "GNU Midnight Commander is a visual file manager, licensed under GNU General Public License and therefore qualifies as Free Software. It's a feature rich full-screen text mode application that allows you to copy, move and delete files and whole directory trees, search for files and run commands in the subshell. Internal viewer and editor are included."
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=270bbafe360e73f9840bd7981621f9c2"
@@ -8,7 +8,7 @@ DEPENDS = "ncurses glib-2.0 util-linux file-replacement-native"
 RDEPENDS:${PN} = "ncurses-terminfo-base"
 RRECOMMENDS:${PN} = "ncurses-terminfo"
 
-SRC_URI = "http://ftp.midnight-commander.org/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "https://ftp.midnight-commander.org/${BPN}-${PV}.tar.bz2 \
            file://nomandate.patch \
            "
 SRC_URI[sha256sum] = "a3ceb0af84226fedfe5f339464ff2849c3f6bf0321b72027c47b2c10e66a6dba"
diff --git a/meta/recipes-extended/mdadm/mdadm_4.4.bb b/meta/recipes-extended/mdadm/mdadm_4.4.bb
index 26a60e4c1a..b2be396c6b 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.4.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Tool for managing software RAID under Linux"
-HOMEPAGE = "http://www.kernel.org/pub/linux/utils/raid/mdadm/"
+HOMEPAGE = "https://www.kernel.org/pub/linux/utils/raid/mdadm/"
 DESCRIPTION = "mdadm is a Linux utility used to manage and monitor software RAID devices."
 
 # Some files are GPL-2.0-only while others are GPL-2.0-or-later.
diff --git a/meta/recipes-extended/mingetty/mingetty_1.08.bb b/meta/recipes-extended/mingetty/mingetty_1.08.bb
index 892233054b..f134d21bee 100644
--- a/meta/recipes-extended/mingetty/mingetty_1.08.bb
+++ b/meta/recipes-extended/mingetty/mingetty_1.08.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Compact getty terminal handler for virtual consoles only"
 SECTION = "console/utils"
-HOMEPAGE = "http://sourceforge.net/projects/mingetty/"
+HOMEPAGE = "https://sourceforge.net/projects/mingetty/"
 DESCRIPTION = "This is a small Linux console getty that is started on the Linux text console, asks for a login name and then tranfers over to login directory. Is extended to allow automatic login and starting any app."
 LICENSE = "GPL-2.0-only"
 
diff --git a/meta/recipes-extended/net-tools/net-tools_2.10.bb b/meta/recipes-extended/net-tools/net-tools_2.10.bb
index 6c8297ba39..a6369ad04e 100644
--- a/meta/recipes-extended/net-tools/net-tools_2.10.bb
+++ b/meta/recipes-extended/net-tools/net-tools_2.10.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Basic networking tools"
 DESCRIPTION = "A collection of programs that form the base set of the NET-3 networking distribution for the Linux operating system"
-HOMEPAGE = "http://net-tools.berlios.de/"
-BUGTRACKER = "http://bugs.debian.org/net-tools"
+HOMEPAGE = "https://net-tools.berlios.de/"
+BUGTRACKER = "https://bugs.debian.org/net-tools"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ifconfig.c;beginline=11;endline=15;md5=d1ca372080ad5401e23ca0afc35cf9ba"
diff --git a/meta/recipes-extended/parted/parted_3.6.bb b/meta/recipes-extended/parted/parted_3.6.bb
index 8f703d162f..ac9cc89464 100644
--- a/meta/recipes-extended/parted/parted_3.6.bb
+++ b/meta/recipes-extended/parted/parted_3.6.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Disk partition editing/resizing utility"
-HOMEPAGE = "http://www.gnu.org/software/parted/parted.html"
+HOMEPAGE = "https://www.gnu.org/software/parted/parted.html"
 DESCRIPTION = "GNU Parted manipulates partition tables. This is useful for creating space for new operating systems, reorganizing disk usage, copying data on hard disks and disk imaging."
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2f31b266d3440dd7ee50f92cf67d8e6c"
diff --git a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
index 9653cb427b..6a495be58e 100644
--- a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
+++ b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Perl module for supporting simple generic namespaces"
-HOMEPAGE = "http://veillard.com/XML/"
+HOMEPAGE = "https://veillard.com/XML/"
 DESCRIPTION = "XML::NamespaceSupport offers a simple way to process namespace-based XML names. \
                 It also helps maintain a prefix-to-namespace URI map, and provides a number of \
                 basic checks. "
diff --git a/meta/recipes-extended/pigz/pigz_2.8.bb b/meta/recipes-extended/pigz/pigz_2.8.bb
index fcf0c93e41..bac89d2b5d 100644
--- a/meta/recipes-extended/pigz/pigz_2.8.bb
+++ b/meta/recipes-extended/pigz/pigz_2.8.bb
@@ -3,17 +3,17 @@ DESCRIPTION = "pigz, which stands for parallel implementation of gzip, is a \
 fully functional replacement for gzip that exploits multiple processors and \
 multiple cores to the hilt when compressing data. pigz was written by Mark \
 Adler, and uses the zlib and pthread libraries."
-HOMEPAGE = "http://zlib.net/pigz/"
+HOMEPAGE = "https://zlib.net/pigz/"
 SECTION = "console/utils"
 LICENSE = "Zlib & Apache-2.0"
 LIC_FILES_CHKSUM = "file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline=7;endline=21"
 
-SRC_URI = "http://zlib.net/${BPN}/fossils/${BP}.tar.gz"
+SRC_URI = "https://zlib.net/${BPN}/fossils/${BP}.tar.gz"
 SRC_URI[sha256sum] = "eb872b4f0e1f0ebe59c9f7bd8c506c4204893ba6a8492de31df416f0d5170fd0"
 PROVIDES:class-native += "gzip-native"
 
 # Point this at the homepage in case /fossils/ isn't updated
-UPSTREAM_CHECK_URI = "http://zlib.net/${BPN}/"
+UPSTREAM_CHECK_URI = "https://zlib.net/${BPN}/"
 UPSTREAM_CHECK_REGEX = "pigz-(?P<pver>.*)\.tar"
 
 DEPENDS = "zlib"
diff --git a/meta/recipes-extended/psmisc/psmisc_23.7.bb b/meta/recipes-extended/psmisc/psmisc_23.7.bb
index 44f8530977..9041abd6c9 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.7.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.7.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Utilities for managing processes on your system"
-HOMEPAGE = "http://psmisc.sf.net/"
+HOMEPAGE = "https://psmisc.sf.net/"
 DESCRIPTION = "The psmisc package contains utilities for managing processes on your \
 system: pstree, killall and fuser.  The pstree command displays a tree \
 structure of all of the running processes on your system.  The killall \
diff --git a/meta/recipes-extended/quota/quota_4.11.bb b/meta/recipes-extended/quota/quota_4.11.bb
index b386071961..c37b78c59b 100644
--- a/meta/recipes-extended/quota/quota_4.11.bb
+++ b/meta/recipes-extended/quota/quota_4.11.bb
@@ -1,8 +1,8 @@
 SUMMARY = "Tools for monitoring & limiting user disk usage per filesystem"
 SECTION = "base"
-HOMEPAGE = "http://sourceforge.net/projects/linuxquota/"
+HOMEPAGE = "https://sourceforge.net/projects/linuxquota/"
 DESCRIPTION = "Tools and patches for the Linux Diskquota system as part of the Linux kernel"
-BUGTRACKER = "http://sourceforge.net/tracker/?group_id=18136&atid=118136"
+BUGTRACKER = "https://sourceforge.net/tracker/?group_id=18136&atid=118136"
 LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://rquota_server.c;beginline=1;endline=20;md5=fe7e0d7e11c6f820f8fa62a5af71230f \
                     file://svc_socket.c;beginline=1;endline=17;md5=24d5a8792da45910786eeac750be8ceb"
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "0a51b8f920254d8e83c34a4c3082b7d241f5d6fd65188afadf29859d52
 
 CVE_PRODUCT = "linux_diskquota"
 
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/linuxquota/files/quota-tools/"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/linuxquota/files/quota-tools/"
 UPSTREAM_CHECK_REGEX = "/quota-tools/(?P<pver>(\d+[\.\-_]*)+)/"
 
 DEPENDS = "gettext-native e2fsprogs libnl dbus"
diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
index bcdadf4f10..a10ab927cd 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
@@ -2,8 +2,8 @@ SUMMARY = "Universal Addresses to RPC Program Number Mapper"
 DESCRIPTION = "The rpcbind utility is a server that converts RPC \
                program numbers into universal addresses."
 SECTION = "console/network"
-HOMEPAGE = "http://sourceforge.net/projects/rpcbind/"
-BUGTRACKER = "http://sourceforge.net/tracker/?group_id=201237&atid=976751"
+HOMEPAGE = "https://sourceforge.net/projects/rpcbind/"
+BUGTRACKER = "https://sourceforge.net/tracker/?group_id=201237&atid=976751"
 DEPENDS = "libtirpc quota"
 
 LICENSE = "BSD-3-Clause"
diff --git a/meta/recipes-extended/screen/screen_5.0.1.bb b/meta/recipes-extended/screen/screen_5.0.1.bb
index 69f4098519..19b87005a0 100644
--- a/meta/recipes-extended/screen/screen_5.0.1.bb
+++ b/meta/recipes-extended/screen/screen_5.0.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Multiplexing terminal manager"
 DESCRIPTION = "Screen is a full-screen window manager \
 that multiplexes a physical terminal between several \
 processes, typically interactive shells."
-HOMEPAGE = "http://www.gnu.org/software/screen/"
+HOMEPAGE = "https://www.gnu.org/software/screen/"
 BUGTRACKER = "https://savannah.gnu.org/bugs/?func=additem&group=screen"
 
 SECTION = "console/utils"
diff --git a/meta/recipes-extended/sed/sed_4.9.bb b/meta/recipes-extended/sed/sed_4.9.bb
index b30ddc73ca..d862720504 100644
--- a/meta/recipes-extended/sed/sed_4.9.bb
+++ b/meta/recipes-extended/sed/sed_4.9.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Stream EDitor (text filtering utility)"
-HOMEPAGE = "http://www.gnu.org/software/sed/"
+HOMEPAGE = "https://www.gnu.org/software/sed/"
 DESCRIPTION = "sed (stream editor) is a non-interactive command-line text editor."
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
index d66ef1e6a4..ba0f71feeb 100644
--- a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
+++ b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Shadow utils requirements for useradd.bbclass"
-HOMEPAGE = "http://github.com/shadow-maint/shadow"
-BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
+HOMEPAGE = "https://github.com/shadow-maint/shadow"
+BUGTRACKER = "https://github.com/shadow-maint/shadow/issues"
 SECTION = "base utils"
 LICENSE = "BSD-3-Clause | Artistic-1.0"
 LIC_FILES_CHKSUM = "file://login.defs_shadow-sysroot;endline=1;md5=ceddfb61608e4db87012499555184aed"
diff --git a/meta/recipes-extended/shadow/shadow_4.18.0.bb b/meta/recipes-extended/shadow/shadow_4.18.0.bb
index d9a49d8ccf..abb98fecd4 100644
--- a/meta/recipes-extended/shadow/shadow_4.18.0.bb
+++ b/meta/recipes-extended/shadow/shadow_4.18.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Tools to change and administer password and group data"
-HOMEPAGE = "http://github.com/shadow-maint/shadow"
+HOMEPAGE = "https://github.com/shadow-maint/shadow"
 DESCRIPTION = "${SUMMARY}"
-BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
+BUGTRACKER = "https://github.com/shadow-maint/shadow/issues"
 SECTION = "base/utils"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c9a450b7be84eac23e6353efecb60b5b \
diff --git a/meta/recipes-extended/slang/slang_2.3.3.bb b/meta/recipes-extended/slang/slang_2.3.3.bb
index 05b8aff0f2..f5b59d9227 100644
--- a/meta/recipes-extended/slang/slang_2.3.3.bb
+++ b/meta/recipes-extended/slang/slang_2.3.3.bb
@@ -7,14 +7,14 @@ The S-Lang library, provided in this package, provides the S-Lang \
 extension language.  S-Lang's syntax resembles C, which makes it easy \
 to recode S-Lang procedures in C if you need to."
 
-HOMEPAGE = "http://www.jedsoft.org/slang/"
+HOMEPAGE = "https://www.jedsoft.org/slang/"
 SECTION = "libs"
 DEPENDS = "ncurses virtual/libiconv"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a52a18a472d4f7e45479b06563717c02"
 
-SRC_URI = "http://www.jedsoft.org/releases/${BPN}/${BP}.tar.bz2 \
+SRC_URI = "https://www.jedsoft.org/releases/${BPN}/${BP}.tar.bz2 \
            file://no-x.patch \
            file://dont-link-to-host.patch \
            file://test-add-output-in-the-format-result-testname.patch \
@@ -25,8 +25,8 @@ SRC_URI = "http://www.jedsoft.org/releases/${BPN}/${BP}.tar.bz2 \
 
 SRC_URI[sha256sum] = "f9145054ae131973c61208ea82486d5dd10e3c5cdad23b7c4a0617743c8f5a18"
 
-UPSTREAM_CHECK_URI = "http://www.jedsoft.org/releases/slang/"
-PREMIRRORS:append = " http://www.jedsoft.org/releases/slang/.* http://www.jedsoft.org/releases/slang/old/"
+UPSTREAM_CHECK_URI = "https://www.jedsoft.org/releases/slang/"
+PREMIRRORS:append = " https://www.jedsoft.org/releases/slang/.* https://www.jedsoft.org/releases/slang/old/"
 
 inherit autotools-brokensep ptest
 CLEANBROKEN = "1"
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index a23de1fcf7..9ea3e0761d 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Provide limited super user privileges to specific users"
 DESCRIPTION = "Sudo (superuser do) allows a system administrator to give certain users (or groups of users) the ability to run some (or all) commands as root while logging all commands and arguments."
-HOMEPAGE = "http://www.sudo.ws"
-BUGTRACKER = "http://www.sudo.ws/bugs/"
+HOMEPAGE = "https://www.sudo.ws"
+BUGTRACKER = "https://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2841c822e587db145364ca95e9be2ffa \
diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb b/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb
index c436153d1b..28596ec5e5 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "System Log Daemons"
 DESCRIPTION = "The sysklogd package implements system log daemons: syslogd"
-HOMEPAGE = "http://www.infodrom.org/projects/sysklogd/"
+HOMEPAGE = "https://www.infodrom.org/projects/sysklogd/"
 SECTION = "base"
 
 LICENSE = "BSD-3-Clause"
diff --git a/meta/recipes-extended/tar/tar_1.35.bb b/meta/recipes-extended/tar/tar_1.35.bb
index d463eff97d..e385218095 100644
--- a/meta/recipes-extended/tar/tar_1.35.bb
+++ b/meta/recipes-extended/tar/tar_1.35.bb
@@ -1,7 +1,7 @@
 SUMMARY = "GNU file archiving program"
 DESCRIPTION = "GNU tar saves many files together into a single tape \
 or disk archive, and can restore individual files from the archive."
-HOMEPAGE = "http://www.gnu.org/software/tar/"
+HOMEPAGE = "https://www.gnu.org/software/tar/"
 SECTION = "base"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
diff --git a/meta/recipes-extended/texinfo/texinfo_7.2.bb b/meta/recipes-extended/texinfo/texinfo_7.2.bb
index 784f67f65b..7386326560 100644
--- a/meta/recipes-extended/texinfo/texinfo_7.2.bb
+++ b/meta/recipes-extended/texinfo/texinfo_7.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Documentation system for on-line information and printed output"
 DESCRIPTION = "Texinfo is a documentation system that can produce both \
 online information and printed output from a single source file. The \
 GNU Project uses the Texinfo file format for most of its documentation."
-HOMEPAGE = "http://www.gnu.org/software/texinfo/"
+HOMEPAGE = "https://www.gnu.org/software/texinfo/"
 SECTION = "console/utils"
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
diff --git a/meta/recipes-extended/time/time_1.9.bb b/meta/recipes-extended/time/time_1.9.bb
index d6d8aa6e1e..0387d5c625 100644
--- a/meta/recipes-extended/time/time_1.9.bb
+++ b/meta/recipes-extended/time/time_1.9.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Tool that measures CPU resources"
 DESCRIPTION = "time measures many of the CPU resources, such as time and \
 memory, that other programs use."
-HOMEPAGE = "http://www.gnu.org/software/time/"
+HOMEPAGE = "https://www.gnu.org/software/time/"
 SECTION = "utils"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index b9323432b8..06489c7c5d 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -1,20 +1,20 @@
 SUMMARY = "Timezone data"
 DESCRIPTION = "The Time Zone Database contains code and data that represent \
 the history of local time for many representative locations around the globe."
-HOMEPAGE = "http://www.iana.org/time-zones"
+HOMEPAGE = "https://www.iana.org/time-zones"
 SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
 PV = "2025c"
 
-SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
-           http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
+SRC_URI = "https://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
+           https://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
            "
 
 S = "${UNPACKDIR}/tz"
 
-UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
+UPSTREAM_CHECK_URI = "https://www.iana.org/time-zones"
 
 SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
 SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 1d22855e1c..0ca8370ba1 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Utilities for extracting and viewing files in .zip archives"
-HOMEPAGE = "http://www.info-zip.org"
+HOMEPAGE = "https://www.info-zip.org"
 DESCRIPTION = "Info-ZIP's purpose is to provide free, portable, high-quality versions of the Zip and UnZip compressor-archiver utilities that are compatible with the DOS-based PKZIP by PKWARE, Inc."
 SECTION = "console/utils"
 LICENSE = "Info-ZIP"
diff --git a/meta/recipes-extended/watchdog/watchdog-config.bb b/meta/recipes-extended/watchdog/watchdog-config.bb
index 58c565bd30..9d6ca589d2 100644
--- a/meta/recipes-extended/watchdog/watchdog-config.bb
+++ b/meta/recipes-extended/watchdog/watchdog-config.bb
@@ -2,8 +2,8 @@ SUMMARY = "Software watchdog"
 DESCRIPTION = "Watchdog is a daemon that checks if your system is still \
 working. If programs in user space are not longer executed it will reboot \
 the system."
-HOMEPAGE = "http://watchdog.sourceforge.net/"
-BUGTRACKER = "http://sourceforge.net/tracker/?group_id=172030&atid=860194"
+HOMEPAGE = "https://watchdog.sourceforge.net/"
+BUGTRACKER = "https://sourceforge.net/tracker/?group_id=172030&atid=860194"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
index c166ace665..f3195b0c7b 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
@@ -2,8 +2,8 @@ SUMMARY = "Software watchdog"
 DESCRIPTION = "Watchdog is a daemon that checks if your system is still \
 working. If programs in user space are not longer executed \
 it will reboot the system."
-HOMEPAGE = "http://watchdog.sourceforge.net/"
-BUGTRACKER = "http://sourceforge.net/tracker/?group_id=172030&atid=860194"
+HOMEPAGE = "https://watchdog.sourceforge.net/"
+BUGTRACKER = "https://sourceforge.net/tracker/?group_id=172030&atid=860194"
 
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=084236108b1d4a9851bf5213fea586fd"
@@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "b8e7c070e1b72aee2663bdc13b5cc39f76c9232669cfbb1ac0adc7275a
 # Can be dropped when the output next changes, avoids failures after
 # reproducibility issues
 
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/watchdog/files/watchdog/"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/watchdog/files/watchdog/"
 UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit autotools update-rc.d systemd pkgconfig
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index d1092551f7..e6819a4e21 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Compressor/archiver for creating and modifying .zip files"
-HOMEPAGE = "http://www.info-zip.org"
+HOMEPAGE = "https://www.info-zip.org"
 DESCRIPTION = "Info-ZIP's purpose is to provide free, portable, high-quality versions of the Zip and UnZip compressor-archiver utilities that are compatible with the DOS-based PKZIP by PKWARE, Inc."
 SECTION = "console/utils"
 
diff --git a/meta/recipes-extended/zstd/zstd_1.5.7.bb b/meta/recipes-extended/zstd/zstd_1.5.7.bb
index 0e872b95aa..7ca27201e8 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.7.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.7.bb
@@ -2,7 +2,7 @@ SUMMARY = "Zstandard - Fast real-time compression algorithm"
 DESCRIPTION = "Zstandard is a fast lossless compression algorithm, targeting \
 real-time compression scenarios at zlib-level and better compression ratios. \
 It's backed by a very fast entropy stage, provided by Huff0 and FSE library."
-HOMEPAGE = "http://www.zstd.net/"
+HOMEPAGE = "https://www.zstd.net/"
 SECTION = "console/utils"
 
 LICENSE = "BSD-3-Clause | GPL-2.0-only"
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb
index 35f99b2de0..f507a7ffb3 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Multi-platform toolkit for creating GUIs"
 DESCRIPTION = "GTK+ is a multi-platform toolkit for creating graphical user interfaces. Offering a complete \
 set of widgets, GTK+ is suitable for projects ranging from small one-off projects to complete application suites."
-HOMEPAGE = "http://www.gtk.org"
+HOMEPAGE = "https://www.gtk.org"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/gtk/-/issues/"
 SECTION = "libs"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
diff --git a/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb b/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
index 92791db169..a742d94807 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Multi-platform toolkit for creating GUIs"
 DESCRIPTION = "GTK is a multi-platform toolkit for creating graphical user interfaces. Offering a complete \
 set of widgets, GTK is suitable for projects ranging from small one-off projects to complete application suites."
-HOMEPAGE = "http://www.gtk.org"
+HOMEPAGE = "https://www.gtk.org"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/gtk/-/issues/"
 SECTION = "libs"
 
diff --git a/meta/recipes-graphics/cairo/cairo_1.18.4.bb b/meta/recipes-graphics/cairo/cairo_1.18.4.bb
index 3f6d02f8d4..bef8162f1c 100644
--- a/meta/recipes-graphics/cairo/cairo_1.18.4.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.18.4.bb
@@ -6,7 +6,7 @@ with various join and cap styles. All colors may be specified with \
 optional translucence (opacity/alpha) and combined using the \
 extended Porter/Duff compositing algebra as found in the X Render \
 Extension."
-HOMEPAGE = "http://cairographics.org"
+HOMEPAGE = "https://cairographics.org"
 BUGTRACKER = "https://gitlab.freedesktop.org/cairo/cairo/-/issues"
 SECTION = "libs"
 
@@ -27,7 +27,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77 \
 
 DEPENDS = "fontconfig freetype glib-2.0 libpng pixman zlib"
 
-SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
+SRC_URI = "https://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \
           "
 
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.131.bb b/meta/recipes-graphics/drm/libdrm_2.4.131.bb
index 1c55dd5550..f0590198ed 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.131.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.131.bb
@@ -3,14 +3,14 @@ DESCRIPTION = "The runtime library for accessing the kernel DRM services.  DRM \
 stands for \"Direct Rendering Manager\", which is the kernel portion of the \
 \"Direct Rendering Infrastructure\" (DRI).  DRI is required for many hardware \
 accelerated OpenGL drivers."
-HOMEPAGE = "http://dri.freedesktop.org"
+HOMEPAGE = "https://dri.freedesktop.org"
 SECTION = "x11/base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
 PROVIDES = "drm"
 DEPENDS = "libpthread-stubs"
 
-SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
+SRC_URI = "https://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
 SRC_URI[sha256sum] = "45ba9983b51c896406a3d654de81d313b953b76e6391e2797073d543c5f617d5"
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
index de2642bdd1..5499371093 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
@@ -8,7 +8,7 @@ particular rasterization library on the application. The X-specific \
 library 'Xft' uses fontconfig along with freetype to specify and \
 rasterize fonts."
 
-HOMEPAGE = "http://www.fontconfig.org"
+HOMEPAGE = "https://www.fontconfig.org"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=fontconfig"
 
 LICENSE = "MIT & PD"
diff --git a/meta/recipes-graphics/glew/glew_2.2.0.bb b/meta/recipes-graphics/glew/glew_2.2.0.bb
index b82b25c602..d972669f06 100644
--- a/meta/recipes-graphics/glew/glew_2.2.0.bb
+++ b/meta/recipes-graphics/glew/glew_2.2.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "OpenGL extension loading library"
 DESCRIPTION = "The OpenGL Extension Wrangler Library (GLEW) is a cross-platform open-source C/C++ extension loading library."
-HOMEPAGE = "http://glew.sourceforge.net/"
-BUGTRACKER = "http://sourceforge.net/tracker/?group_id=67586"
+HOMEPAGE = "https://glew.sourceforge.net/"
+BUGTRACKER = "https://sourceforge.net/tracker/?group_id=67586"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ac251558de685c6b9478d89be3149c2"
 
@@ -12,7 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
 
 SRC_URI[sha256sum] = "d4fc82893cfb00109578d0a1a2337fb8ca335b3ceccf97b97e5cc7f08e4353e1"
 
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/glew/files/glew"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/glew/files/glew"
 UPSTREAM_CHECK_REGEX = "/glew/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit lib_package pkgconfig features_check
diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
index d14a6403ff..26c84f7101 100644
--- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A thin layer of graphic data types"
-HOMEPAGE = "http://ebassi.github.io/graphene/"
+HOMEPAGE = "https://ebassi.github.io/graphene/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a7d871d9e23c450c421a85bb2819f648"
 
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb
index ef2f6aa4f9..1c715ef06e 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Text shaping library"
 DESCRIPTION = "HarfBuzz is an OpenType text shaping engine."
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/HarfBuzz"
+HOMEPAGE = "https://www.freedesktop.org/wiki/Software/HarfBuzz"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=HarfBuzz"
 SECTION = "libs"
 LICENSE = "MIT"
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb
index 26e84ca42c..17da2cc307 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Hardware accelerated JPEG compression/decompression library"
 DESCRIPTION = "libjpeg-turbo is a derivative of libjpeg that uses SIMD instructions (MMX, SSE2, NEON) to accelerate baseline JPEG compression and decompression"
-HOMEPAGE = "http://libjpeg-turbo.org/"
+HOMEPAGE = "https://libjpeg-turbo.org/"
 
 LICENSE = "IJG & BSD-3-Clause & Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=52fddabc7e8e79233150ebda95c3fc1f"
diff --git a/meta/recipes-graphics/libfakekey/libfakekey_git.bb b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
index 7416b84538..49ea565f57 100644
--- a/meta/recipes-graphics/libfakekey/libfakekey_git.bb
+++ b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
@@ -1,8 +1,8 @@
 SUMMARY = "Library for converting characters to X key-presses"
 DESCRIPTION = "libfakekey is a simple library for converting UTF-8 characters into 'fake' X \
 key-presses."
-HOMEPAGE = "http://matchbox-project.org/"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
+HOMEPAGE = "https://matchbox-project.org/"
+BUGTRACKER = "https://bugzilla.yoctoproject.org/"
 
 LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://src/libfakekey.c;endline=30;md5=602b5ccd48f64407510867f3373b448c"
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
index 9de44d4c95..eb8e39ec0d 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
@@ -4,8 +4,8 @@ System running on non-desktop embedded platforms such as handhelds, set-top \
 boxes, kiosks and anything else for which screen space, input mechanisms or \
 system resources are limited."
 SECTION = "x11/libs"
-HOMEPAGE = "http://matchbox-project.org/"
-BUGTRACKER = "http://bugzilla.yoctoproject.com/"
+HOMEPAGE = "https://matchbox-project.org/"
+BUGTRACKER = "https://bugzilla.yoctoproject.com/"
 
 LICENSE = "LGPL-2.0-or-later & HPND"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87712c91ca9a2c2d475a0604c00f8f54 \
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
index 834cf096b9..301cbf8b7b 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
@@ -2,8 +2,8 @@ SUMMARY = "Simple DirectMedia Layer"
 DESCRIPTION = "Simple DirectMedia Layer is a cross-platform multimedia \
 library designed to provide low level access to audio, keyboard, mouse, \
 joystick, 3D hardware via OpenGL, and 2D video framebuffer."
-HOMEPAGE = "http://www.libsdl.org"
-BUGTRACKER = "http://bugzilla.libsdl.org/"
+HOMEPAGE = "https://www.libsdl.org"
+BUGTRACKER = "https://bugzilla.libsdl.org/"
 
 SECTION = "libs"
 
diff --git a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
index d8be3417cc..54f4202fe9 100644
--- a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
+++ b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Custom Matchbox session files"
 DESCRIPTION = "Very simple session manager for matchbox tools"
-HOMEPAGE = "http://www.matchbox-project.org/"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
+HOMEPAGE = "https://www.matchbox-project.org/"
+BUGTRACKER = "https://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://matchbox-session;endline=20;md5=180f1c169a15d059a56c30094f6fb5ea"
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
index 3359193d65..7b2ba13e2e 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Matchbox lightweight window manager"
-HOMEPAGE = "http://matchbox-project.org"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
+HOMEPAGE = "https://matchbox-project.org"
+BUGTRACKER = "https://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://src/wm.h;endline=21;md5=ce20617ac10f26045cc57b8d977ab552 \
diff --git a/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb b/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
index 0a5d32b2c6..df458e7dce 100644
--- a/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
+++ b/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Library for caching application menus"
 DESCRIPTION = "A library creating and utilizing caches to speed up freedesktop.org application menus"
-HOMEPAGE = "http://lxde.sourceforge.net/"
+HOMEPAGE = "https://lxde.sourceforge.net/"
 
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0964c689fcf4c21c6797ea87408416b6"
@@ -14,6 +14,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/menu-cache-${PV}.tar.xz \
 
 SRC_URI[sha256sum] = "ed02eb459dcb398f69b9fa5bf4dd813020405afc84331115469cdf7be9273ec7"
 
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/lxde/files/menu-cache/1.1/"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/lxde/files/menu-cache/1.1/"
 
 inherit autotools gettext pkgconfig gtk-doc
diff --git a/meta/recipes-graphics/mesa/libglu_9.0.3.bb b/meta/recipes-graphics/mesa/libglu_9.0.3.bb
index 0e38671e41..ddefd4c791 100644
--- a/meta/recipes-graphics/mesa/libglu_9.0.3.bb
+++ b/meta/recipes-graphics/mesa/libglu_9.0.3.bb
@@ -1,7 +1,7 @@
 SUMMARY = "The OpenGL utility toolkit"
 DESCRIPTION = "GLU is a utility toolkit used with OpenGL implementations"
 
-HOMEPAGE = "http://mesa3d.org"
+HOMEPAGE = "https://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
diff --git a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
index 0bc8519e90..8783fed013 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Mesa demo applications"
 DESCRIPTION = "This package includes the demonstration application, such as glxgears. \
 These applications can be used for Mesa validation and benchmarking."
-HOMEPAGE = "http://mesa3d.org"
+HOMEPAGE = "https://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 835e4d46ea..5e66bed79e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -6,7 +6,7 @@ ranging from software emulation to complete hardware acceleration for modern GPU
 Mesa is used as part of the overall Direct Rendering Infrastructure and X.org \
 environment."
 
-HOMEPAGE = "http://mesa3d.org"
+HOMEPAGE = "https://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
diff --git a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
index e90786df44..e2698a70af 100644
--- a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
+++ b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Very simple session manager for X"
 DESCRIPTION = "Simple session manager for X, that provides just the right boilerplate to create a session and launch the browser "
-HOMEPAGE = "http://www.yoctoproject.org"
-BUGTRACKER = "http://bugzilla.pokylinux.org"
+HOMEPAGE = "https://www.yoctoproject.org"
+BUGTRACKER = "https://bugzilla.pokylinux.org"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mini-x-session;endline=5;md5=b6430bffbcf05f9760e72938826b7487"
diff --git a/meta/recipes-graphics/pango/pango_1.57.0.bb b/meta/recipes-graphics/pango/pango_1.57.0.bb
index 5dc8a67dfe..3bf5bb844d 100644
--- a/meta/recipes-graphics/pango/pango_1.57.0.bb
+++ b/meta/recipes-graphics/pango/pango_1.57.0.bb
@@ -4,8 +4,8 @@ with an emphasis on internationalization. Pango can be used anywhere \
 that text layout is needed, though most of the work on Pango so far has \
 been done in the context of the GTK+ widget toolkit. Pango forms the \
 core of text and font handling for GTK+-2.x."
-HOMEPAGE = "http://www.pango.org/"
-BUGTRACKER = "http://bugzilla.gnome.org"
+HOMEPAGE = "https://www.pango.org/"
+BUGTRACKER = "https://bugzilla.gnome.org"
 SECTION = "libs"
 LICENSE = "LGPL-2.0-or-later"
 
diff --git a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
index bdc91d7455..484614bc27 100644
--- a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
+++ b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
@@ -2,7 +2,7 @@ SUMMARY = "Enables monitoring and display of application startup"
 DESCRIPTION = "Contains a reference implementation of the startup notification protocol. \
 The reference implementation is mostly under an X Window System style license, and has \
 no special dependencies. "
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/startup-notification/"
+HOMEPAGE = "https://www.freedesktop.org/wiki/Software/startup-notification/"
 BUGTRACKER = "https://gitlab.freedesktop.org/xdg/startup-notification/-/issues"
 
 # most files are under MIT, but libsn/sn-util.c is under LGPL, the
@@ -21,7 +21,7 @@ inherit autotools pkgconfig features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "http://www.freedesktop.org/software/startup-notification/releases/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://www.freedesktop.org/software/startup-notification/releases/${BPN}-${PV}.tar.gz \
            file://obsolete_automake_macros.patch \
            file://time_t.patch \
 "
diff --git a/meta/recipes-graphics/wayland/libinput_1.30.1.bb b/meta/recipes-graphics/wayland/libinput_1.30.1.bb
index 8309d33304..fa4d894f30 100644
--- a/meta/recipes-graphics/wayland/libinput_1.30.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.30.1.bb
@@ -4,7 +4,7 @@ compositors and to provide a generic X.Org input driver. It provides \
 device detection, device handling, input device event processing and \
 abstraction so minimize the amount of custom input code compositors need to \
 provide the common set of functionality that users expect."
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libinput/"
+HOMEPAGE = "https://www.freedesktop.org/wiki/Software/libinput/"
 SECTION = "libs"
 
 LICENSE = "MIT"
diff --git a/meta/recipes-graphics/wayland/mtdev_1.1.7.bb b/meta/recipes-graphics/wayland/mtdev_1.1.7.bb
index 24803c4238..ac40894d13 100644
--- a/meta/recipes-graphics/wayland/mtdev_1.1.7.bb
+++ b/meta/recipes-graphics/wayland/mtdev_1.1.7.bb
@@ -5,13 +5,13 @@ multitouch events to the slotted type B protocol. The events put into mtdev may
 be from any MT device, specifically type A without contact tracking, type A with \
 contact tracking, or type B with contact tracking"
 
-HOMEPAGE = "http://bitmath.org/code/mtdev/"
+HOMEPAGE = "https://bitmath.org/code/mtdev/"
 SECTION = "libs"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea6bd0268bb0fcd6b27698616ceee5d6"
 
-SRC_URI = "http://bitmath.org/code/${BPN}/${BP}.tar.bz2"
+SRC_URI = "https://bitmath.org/code/${BPN}/${BP}.tar.bz2"
 SRC_URI[sha256sum] = "a107adad2101fecac54ac7f9f0e0a0dd155d954193da55c2340c97f2ff1d814e"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb
index e19045fed0..66a3ff2f4d 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb
@@ -4,7 +4,7 @@ available in the Wayland core protocol. Such protocols either add \
 completely new functionality, or extend the functionality of some other \
 protocol either in Wayland core, or some other protocol in \
 wayland-protocols."
-HOMEPAGE = "http://wayland.freedesktop.org"
+HOMEPAGE = "https://wayland.freedesktop.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.3.0.bb b/meta/recipes-graphics/wayland/wayland-utils_1.3.0.bb
index 9a1828ccb0..ef24c49788 100644
--- a/meta/recipes-graphics/wayland/wayland-utils_1.3.0.bb
+++ b/meta/recipes-graphics/wayland/wayland-utils_1.3.0.bb
@@ -4,7 +4,7 @@ wayland-info, a utility for displaying information about the Wayland \
 protocols supported by a Wayland compositor. \
 wayland-info is basically a standalone version of weston-info as found \
 in weston repository. "
-HOMEPAGE = "http://wayland.freedesktop.org"
+HOMEPAGE = "https://wayland.freedesktop.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=548a66038a77415e1df51118625e832f \
                    "
diff --git a/meta/recipes-graphics/wayland/wayland_1.24.0.bb b/meta/recipes-graphics/wayland/wayland_1.24.0.bb
index de7ee516bb..007201f96a 100644
--- a/meta/recipes-graphics/wayland/wayland_1.24.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.24.0.bb
@@ -5,7 +5,7 @@ a standalone display server running on Linux kernel modesetting and evdev \
 input devices, an X application, or a wayland client itself. The clients can \
 be traditional applications, X servers (rootless or fullscreen) or other \
 display servers."
-HOMEPAGE = "http://wayland.freedesktop.org"
+HOMEPAGE = "https://wayland.freedesktop.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
                     file://src/wayland-server.c;endline=24;md5=b8e046164a766bb1ede8ba38e9dcd7ce"
diff --git a/meta/recipes-graphics/wayland/weston_14.0.2.bb b/meta/recipes-graphics/wayland/weston_14.0.2.bb
index c53b03def0..ee8ee24aa7 100644
--- a/meta/recipes-graphics/wayland/weston_14.0.2.bb
+++ b/meta/recipes-graphics/wayland/weston_14.0.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Weston, a Wayland compositor"
 DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
-HOMEPAGE = "http://wayland.freedesktop.org"
+HOMEPAGE = "https://wayland.freedesktop.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
                     file://libweston/compositor.c;endline=27;md5=eb6d5297798cabe2ddc65e2af519bcf0 \
diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
index e5a0f903f1..dd2925ddea 100644
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Transparent X11 cursor theme for touchscreens"
-HOMEPAGE = "http://www.matchbox-project.org/"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
+HOMEPAGE = "https://www.matchbox-project.org/"
+BUGTRACKER = "https://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.8.0.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.8.0.bb
index 84bf530077..ee8f458458 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.8.0.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.8.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Touchscreen calibration program for X11"
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xinput_calibrator"
+HOMEPAGE = "https://www.freedesktop.org/wiki/Software/xinput_calibrator"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f34021557898e4b5a"
 DEPENDS = "virtual/libx11 libxi libxrandr"
diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
index 5dbe8abe86..25d1a72602 100644
--- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
+++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
@@ -1,5 +1,5 @@
 SUMMARY = "X application"
-HOMEPAGE = "http://www.x.org/"
+HOMEPAGE = "https://www.x.org/"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11/apps"
 LICENSE = "MIT"
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index dd964d466d..e9d21363bc 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -1,5 +1,5 @@
 SUMMARY = "X driver"
-HOMEPAGE = "http://www.x.org"
+HOMEPAGE = "https://www.x.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11/drivers"
 LICENSE = "MIT"
diff --git a/meta/recipes-graphics/xorg-font/xorg-font-common.inc b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
index a11b8e8ab2..015be0513e 100644
--- a/meta/recipes-graphics/xorg-font/xorg-font-common.inc
+++ b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
@@ -1,4 +1,4 @@
-HOMEPAGE = "http://www.x.org"
+HOMEPAGE = "https://www.x.org"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xorg"
 
 SECTION = "x11/fonts"
diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
index 28010f5f22..160843422d 100644
--- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
+++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Xorg minimal fonts data"
 DESCRIPTION = "Minimal fonts required by X.org."
-HOMEPAGE = "http://www.x.org"
+HOMEPAGE = "https://www.x.org"
 
 SECTION = "x11/fonts"
 
diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb
index 7bcf51d56f..9a0ba620b5 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Generic PCI access library for X"
 DESCRIPTION = "libpciaccess provides functionality for X to access the \
 PCI bus and devices in a platform-independent way."
 
-HOMEPAGE = "http://www.x.org"
+HOMEPAGE = "https://www.x.org"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xorg"
 SECTION = "x11/libs"
 
diff --git a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb
index 62384e6d2e..4932e2bab9 100644
--- a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb
@@ -1,13 +1,13 @@
 SUMMARY = "Library that provides weak aliases for pthread functions"
 DESCRIPTION = "This library provides weak aliases for pthread functions \
 not provided in libc or otherwise available by default."
-HOMEPAGE = "http://xcb.freedesktop.org"
-BUGTRACKER = "http://bugs.freedesktop.org/buglist.cgi?product=XCB"
+HOMEPAGE = "https://xcb.freedesktop.org"
+BUGTRACKER = "https://bugs.freedesktop.org/buglist.cgi?product=XCB"
 SECTION = "x11/libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6edc1fea03d959f0c2d743fe5ca746ad"
 
-SRC_URI = "http://xcb.freedesktop.org/dist/${BP}.tar.xz"
+SRC_URI = "https://xcb.freedesktop.org/dist/${BP}.tar.xz"
 SRC_URI[sha256sum] = "59da566decceba7c2a7970a4a03b48d9905f1262ff94410a649224e33d2442bc"
 
 inherit autotools
diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb
index fcd8aad303..43a8085fc4 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb
@@ -2,14 +2,14 @@ SUMMARY = "XCB: The X protocol C binding library"
 DESCRIPTION = "The X protocol C-language Binding (XCB) is a replacement \
 for Xlib featuring a small footprint, latency hiding, direct access to \
 the protocol, improved threading support, and extensibility."
-HOMEPAGE = "http://xcb.freedesktop.org"
+HOMEPAGE = "https://xcb.freedesktop.org"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=XCB"
 SECTION = "x11/libs"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 
-SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.xz \
+SRC_URI = "https://xcb.freedesktop.org/dist/libxcb-${PV}.tar.xz \
            file://0001-use-_Alignof-to-avoid-UB-in-ALIGNOF.patch"
 
 SRC_URI[sha256sum] = "599ebf9996710fea71622e6e184f3a8ad5b43d0e5fa8c4e407123c88a59a6d55"
diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb
index 42e6458090..7aac994fd9 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Generic XKB keymap library"
 DESCRIPTION = "libxkbcommon is a keymap compiler and support library which \
 processes a reduced subset of keymaps as defined by the XKB specification."
-HOMEPAGE = "http://www.xkbcommon.org"
+HOMEPAGE = "https://www.xkbcommon.org"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=70eff33050c59f900f5b83275dcf1211"
 LICENSE = "MIT & MIT-open-group & HPND & HPND-sell-variant & X11"
 
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb b/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb
index 58c7bf3d03..cdde8aef7a 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb
@@ -3,14 +3,14 @@ DESCRIPTION = "Pixman provides a library for manipulating pixel regions \
 -- a set of Y-X banded rectangles, image compositing using the \
 Porter/Duff model and implicit mask generation for geometric primitives \
 including trapezoids, triangles, and rectangles."
-HOMEPAGE = "http://www.pixman.org"
+HOMEPAGE = "https://www.pixman.org"
 SECTION = "x11/libs"
 DEPENDS = "zlib"
 
 SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.gz"
 SRC_URI[sha256sum] = "d09c44ebc3bd5bee7021c79f922fe8fb2fb57f7320f55e97ff9914d2346a591c"
 
-# see http://cairographics.org/releases/ - only even minor versions are stable
+# see https://cairographics.org/releases/ - only even minor versions are stable
 UPSTREAM_CHECK_REGEX = "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
 PE = "1"
diff --git a/meta/recipes-graphics/xorg-lib/xcb-util.inc b/meta/recipes-graphics/xorg-lib/xcb-util.inc
index 9898a6a13e..6594675f3c 100644
--- a/meta/recipes-graphics/xorg-lib/xcb-util.inc
+++ b/meta/recipes-graphics/xorg-lib/xcb-util.inc
@@ -6,7 +6,7 @@ functions and interfaces which make the raw X protocol more usable. Some \
 of the libraries also provide client-side code which is not strictly \
 part of the X protocol but which have traditionally been provided by \
 Xlib."
-HOMEPAGE = "http://xcb.freedesktop.org/XcbUtil/"
+HOMEPAGE = "https://xcb.freedesktop.org/XcbUtil/"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=XCB"
 
 LICENSE = "MIT"
@@ -16,7 +16,7 @@ SECTION = "x11/libs"
 DEPENDS = "libxcb"
 DEPENDS += "gperf-native"
 
-SRC_URI = "http://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.xz"
+SRC_URI = "https://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.xz"
 
 inherit autotools pkgconfig features_check
 
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
diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb
index cfefa53a0f..3591a3155d 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb
@@ -6,7 +6,7 @@ frequently released open source of X keyboard configuration data for X \
 Window System implementations.  The project is targeted to XKB-based \
 systems."
 
-HOMEPAGE = "http://freedesktop.org/wiki/Software/XKeyboardConfig"
+HOMEPAGE = "https://freedesktop.org/wiki/Software/XKeyboardConfig"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xkeyboard-config"
 
 LICENSE = "MIT & MIT"
diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index ba7fcb7304..dc1dfd14ef 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -1,4 +1,4 @@
-HOMEPAGE = "http://www.x.org"
+HOMEPAGE = "https://www.x.org"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xorg"
 
 SECTION = "x11/libs"
diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb
index 2a78a87e77..1e2c04bbe2 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Function prototypes for the X protocol C-language Binding \
 (XCB).  XCB is a replacement for Xlib featuring a small footprint, \
 latency hiding, direct access to the protocol, improved threading \
 support, and extensibility."
-HOMEPAGE = "http://xcb.freedesktop.org"
+HOMEPAGE = "https://xcb.freedesktop.org"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=XCB"
 
 SECTION = "x11/libs"
diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb
index d79dc23f1b..f3d616c66b 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "X Window System unified protocol definitions"
 DESCRIPTION = "This package provides the headers and specification documents defining \
 the core protocol and (many) extensions for the X Window System"
-HOMEPAGE = "http://www.x.org"
+HOMEPAGE = "https://www.x.org"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xorg"
 
 SECTION = "x11/libs"
diff --git a/meta/recipes-graphics/xorg-util/xorg-util-common.inc b/meta/recipes-graphics/xorg-util/xorg-util-common.inc
index 198921116d..0696ac1774 100644
--- a/meta/recipes-graphics/xorg-util/xorg-util-common.inc
+++ b/meta/recipes-graphics/xorg-util/xorg-util-common.inc
@@ -1,4 +1,4 @@
-HOMEPAGE = "http://www.x.org"
+HOMEPAGE = "https://www.x.org"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xorg"
 
 SECTION = "x11/utils"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index 8f3b9217a0..720bac055b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "X.Org X server configuration file"
-HOMEPAGE = "http://www.x.org"
+HOMEPAGE = "https://www.x.org"
 SECTION = "x11/base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index c79bb9e962..e384a966b3 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -1,5 +1,5 @@
 SUMMARY = "The X.Org X server"
-HOMEPAGE = "http://www.x.org"
+HOMEPAGE = "https://www.x.org"
 SECTION = "x11/base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=21e33dcccf2d5034f798a8ea62622939"
diff --git a/meta/recipes-graphics/xrestop/xrestop_0.4.bb b/meta/recipes-graphics/xrestop/xrestop_0.4.bb
index 0c237fcf56..71b384d0ca 100644
--- a/meta/recipes-graphics/xrestop/xrestop_0.4.bb
+++ b/meta/recipes-graphics/xrestop/xrestop_0.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "XRes: A top-like resource usage tool for X"
 
 DESCRIPTION = "top-like statistics of X11 server resource usage by clients"
 
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xrestop"
+HOMEPAGE = "https://www.freedesktop.org/wiki/Software/xrestop"
 BUGTRACKER = "https://bugs.freedesktop.org/"
 
 LICENSE = "GPL-2.0-or-later"
@@ -13,7 +13,7 @@ SECTION = "x11/utils"
 
 DEPENDS = "libxres libxext virtual/libx11 ncurses"
 
-SRC_URI = "http://downloads.yoctoproject.org/releases/xrestop/xrestop-${PV}.tar.gz"
+SRC_URI = "https://downloads.yoctoproject.org/releases/xrestop/xrestop-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "67c2fc94a7ecedbaae0d1837e82e93d1d98f4a6d759828860e552119af3ce257"
 
diff --git a/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb b/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb
index f053490409..c083713737 100644
--- a/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb
@@ -4,7 +4,7 @@ detailed information about request queue operations up to user space. There \
 are three major components: a kernel component, a utility to record the i/o \
 trace information for the kernel to user space, and utilities to analyse and \
 view the trace information."
-HOMEPAGE = "http://brick.kernel.dk/snaps/"
+HOMEPAGE = "https://brick.kernel.dk/snaps/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index dcd5ec140c..2831b65f58 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -1,4 +1,4 @@
-HOMEPAGE = "http://cryptodev-linux.org/"
+HOMEPAGE = "https://cryptodev-linux.org/"
 DESCRIPTION = "Cryptodev-linux is a device that allows access to Linux kernel \
 cryptographic drivers; thus allowing of userspace applications to take advantage \
 of hardware accelerators. Cryptodev-linux is implemented as a standalone \
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.32.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.32.bb
index e052cc5b1b..98c575e9a2 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.32.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.32.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Kexec fast reboot tools"
 DESCRIPTION = "Kexec is a fast reboot feature that lets you reboot to a new Linux kernel"
-HOMEPAGE = "http://kernel.org/pub/linux/utils/kernel/kexec/"
+HOMEPAGE = "https://kernel.org/pub/linux/utils/kernel/kexec/"
 SECTION = "kernel/userland"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce \
diff --git a/meta/recipes-kernel/kmod/kmod_34.2.bb b/meta/recipes-kernel/kmod/kmod_34.2.bb
index e5923a64cf..67086eeab9 100644
--- a/meta/recipes-kernel/kmod/kmod_34.2.bb
+++ b/meta/recipes-kernel/kmod/kmod_34.2.bb
@@ -4,7 +4,7 @@
 SUMMARY = "Tools for managing Linux kernel modules"
 DESCRIPTION = "kmod is a set of tools to handle common tasks with Linux kernel modules like \
                insert, remove, list, check properties, resolve dependencies and aliases."
-HOMEPAGE = "http://kernel.org/pub/linux/utils/kernel/kmod/"
+HOMEPAGE = "https://kernel.org/pub/linux/utils/kernel/kmod/"
 LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LICENSE:libkmod = "LGPL-2.1-or-later"
 SECTION = "base"
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
index b0cd6efde1..664747283c 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Babeltrace2 - Trace Format Babel Tower"
 DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
-HOMEPAGE = "http://babeltrace.org/"
+HOMEPAGE = "https://babeltrace.org/"
 BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
 LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause & BSD-4-Clause & GPL-3.0-or-later & CC-BY-SA-4.0 & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f6b015e4f388d6e78adb1b1f9a887d06"
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
index 1a15c5b420..544884435c 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.x"
 DESCRIPTION = "The LTTng UST 2.x package contains the userspace tracer library to trace userspace codes."
-HOMEPAGE = "http://lttng.org/ust"
+HOMEPAGE = "https://lttng.org/ust"
 BUGTRACKER = "https://bugs.lttng.org/projects/lttng-ust"
 
 LICENSE = "LGPL-2.1-or-later & MIT & GPL-2.0-only"
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb
index f3dfd3f35d..537d06e42a 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb
@@ -1,8 +1,8 @@
 SUMMARY = "ALSA sound library"
 DESCRIPTION = "(Occasionally a.k.a. libasound) is a userspace library that \
 provides a level of abstraction over the /dev interfaces provided by the kernel modules."
-HOMEPAGE = "http://www.alsa-project.org"
-BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
+HOMEPAGE = "https://www.alsa-project.org"
+BUGTRACKER = "https://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "libs/multimedia"
 LICENSE = "LGPL-2.1-only & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb
index 7db0c4d677..1981a8842e 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb
@@ -2,8 +2,8 @@ SUMMARY = "ALSA Plugins"
 DESCRIPTION = "Used to create virtual devices that can be used like normal \
 hardware devices but cause extra processing of the sound stream to take place. \
 They are used while configuring ALSA in the .asoundrc file."
-HOMEPAGE = "http://alsa-project.org"
-BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
+HOMEPAGE = "https://alsa-project.org"
+BUGTRACKER = "https://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "multimedia"
 CVE_PRODUCT = "alsa"
 
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.2.15.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.2.15.bb
index 1228176fb9..2cc9fe41d1 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.2.15.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.2.15.bb
@@ -2,8 +2,8 @@ SUMMARY = "Advanced tools for certain ALSA sound card drivers"
 DESCRIPTION = "Package containing a number of tools ranging from envy24control \
 which provides complete control over all devices with an envy24 chip, to \
 firmware loaders for pcmcia, USB and the hdsp devices."
-HOMEPAGE = "http://www.alsa-project.org"
-BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
+HOMEPAGE = "https://www.alsa-project.org"
+BUGTRACKER = "https://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "console/utils"
 LICENSE = "GPL-2.0-only & LGPL-2.0-or-later"
 DEPENDS = "alsa-lib"
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
index 927f94afb6..486fea3fff 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
@@ -1,8 +1,8 @@
 SUMMARY = "ALSA sound utilities"
 DESCRIPTION = "collection of small and often extremely powerful applications \
 designed to allow users to control the various parts of the ALSA system."
-HOMEPAGE = "http://www.alsa-project.org"
-BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
+HOMEPAGE = "https://www.alsa-project.org"
+BUGTRACKER = "https://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "console/utils"
 # Some parts are GPL-2.0-or-later, some are GPL-2.0-only (e.g. axfer, alsactl)
 # so result is GPL-2.0-only
diff --git a/meta/recipes-multimedia/flac/flac_1.5.0.bb b/meta/recipes-multimedia/flac/flac_1.5.0.bb
index d6df801aec..3a07487440 100644
--- a/meta/recipes-multimedia/flac/flac_1.5.0.bb
+++ b/meta/recipes-multimedia/flac/flac_1.5.0.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=802e79e394e372d01e863e3f4058cf40 \
                     file://include/FLAC/all.h;beginline=65;endline=70;md5=39aaf5e03c7364363884c8b8ddda8eea \
                     "
 
-SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
+SRC_URI = "https://downloads.xiph.org/releases/flac/${BP}.tar.xz \
            file://0001-API-documentation-replace-modules.html-by-topics.htm.patch"
 
 SRC_URI[sha256sum] = "f2c1c76592a82ffff8413ba3c4a1299b6c7ab06c734dee03fd88630485c2b920"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb
index a652dbba33..6746318dae 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Libav-based GStreamer 1.x plugin"
 DESCRIPTION = "Contains a GStreamer plugin for using the encoders, decoders, \
 muxers, and demuxers provided by FFmpeg."
-HOMEPAGE = "http://gstreamer.freedesktop.org/"
+HOMEPAGE = "https://gstreamer.freedesktop.org/"
 SECTION = "multimedia"
 
 # ffmpeg has comercial license flags so add it as we need ffmpeg as a dependency
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb
index 57ddf0bbba..55a1346df2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Python bindings for GStreamer 1.0"
 DESCRIPTION = "GStreamer Python binding overrides (complementing the bindings \
 provided by python-gi) "
-HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-python/"
+HOMEPAGE = "https://cgit.freedesktop.org/gstreamer/gst-python/"
 SECTION = "multimedia"
 
 LICENSE = "LGPL-2.1-or-later"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.9.bb
index ac6b52ee46..8e5124cd1e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.9.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A library on top of GStreamer for building an RTSP server"
-HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
+HOMEPAGE = "https://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
 SECTION = "multimedia"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
index c66f614629..f004464db4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
@@ -1,7 +1,7 @@
 SUMMARY = "GStreamer 1.0 multimedia framework"
 DESCRIPTION = "GStreamer is a multimedia framework for encoding and decoding video and sound. \
 It supports a wide range of formats including mp3, ogg, avi, mpeg and quicktime."
-HOMEPAGE = "http://gstreamer.freedesktop.org/"
+HOMEPAGE = "https://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
 LICENSE = "LGPL-2.1-or-later"
diff --git a/meta/recipes-multimedia/lame/lame_3.100.bb b/meta/recipes-multimedia/lame/lame_3.100.bb
index 42689df351..44695ea29e 100644
--- a/meta/recipes-multimedia/lame/lame_3.100.bb
+++ b/meta/recipes-multimedia/lame/lame_3.100.bb
@@ -1,7 +1,7 @@
 SUMMARY = "High quality MP3 audio encoder"
 DESCRIPTION = "LAME is an educational tool to be used for learning about MP3 encoding."
 HOMEPAGE = "https://lame.sourceforge.io/"
-BUGTRACKER = "http://sourceforge.net/tracker/?group_id=290&atid=100290"
+BUGTRACKER = "https://sourceforge.net/tracker/?group_id=290&atid=100290"
 SECTION = "console/utils"
 LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9 \
diff --git a/meta/recipes-multimedia/libogg/libogg_1.3.6.bb b/meta/recipes-multimedia/libogg/libogg_1.3.6.bb
index 4810f156f2..4286f25ef3 100644
--- a/meta/recipes-multimedia/libogg/libogg_1.3.6.bb
+++ b/meta/recipes-multimedia/libogg/libogg_1.3.6.bb
@@ -2,14 +2,14 @@ SUMMARY = "Ogg bitstream and framing libary"
 DESCRIPTION = "libogg is the bitstream and framing library \
 for the Ogg project. It provides functions which are \
 necessary to codec libraries like libvorbis."
-HOMEPAGE = "http://xiph.org/"
+HOMEPAGE = "https://xiph.org/"
 BUGTRACKER = "https://trac.xiph.org/newticket"
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
                     file://include/ogg/ogg.h;beginline=1;endline=11;md5=eda812856f13a3b1326eb8f020cc3b0b"
 
-SRC_URI = "http://downloads.xiph.org/releases/ogg/${BP}.tar.xz"
+SRC_URI = "https://downloads.xiph.org/releases/ogg/${BP}.tar.xz"
 
 SRC_URI[sha256sum] = "5c8253428e181840cd20d41f3ca16557a9cc04bad4a3d04cce84808677fa1061"
 
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.53.bb b/meta/recipes-multimedia/libpng/libpng_1.6.53.bb
index a43283eae7..2afc8c8e9d 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.53.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.53.bb
@@ -2,7 +2,7 @@ SUMMARY = "PNG image format decoding library"
 DESCRIPTION = "An open source project to develop and maintain the reference \
 library for use in applications that read, create, and manipulate PNG \
 (Portable Network Graphics) raster image files. "
-HOMEPAGE = "http://www.libpng.org/"
+HOMEPAGE = "https://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5516d77a3cf75f55a0d37254e3e65a20"
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "1d3fb8ccc2932d04aa3663e22ef5ef490244370f4e568d785016506877
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
-UPSTREAM_CHECK_URI = "http://libpng.org/pub/png/libpng.html"
+UPSTREAM_CHECK_URI = "https://libpng.org/pub/png/libpng.html"
 
 BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
index bacaf3aee6..04b72d17c2 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
@@ -1,13 +1,13 @@
 SUMMARY = "Theora Video Codec"
 DESCRIPTION = "The libtheora reference implementation provides the standard encoder and decoder under a BSD license."
-HOMEPAGE = "http://xiph.org/"
+HOMEPAGE = "https://xiph.org/"
 BUGTRACKER = "https://trac.xiph.org/newticket"
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cf91718f59eb6a83d06dc7bcaf411132"
 DEPENDS = "libogg"
 
-SRC_URI = "http://downloads.xiph.org/releases/theora/libtheora-${PV}.tar.xz \
+SRC_URI = "https://downloads.xiph.org/releases/theora/libtheora-${PV}.tar.xz \
            file://0001-add-missing-files.patch"
 
 SRC_URI[sha256sum] = "ebdf77a8f5c0a8f7a9e42323844fa09502b34eb1d1fece7b5f54da41fe2122ec"
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
index 0d4b3a4abd..ec29b77656 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
@@ -2,13 +2,13 @@ SUMMARY = "Provides support for the Tag Image File Format (TIFF)"
 DESCRIPTION = "Library provides support for the Tag Image File Format \
 (TIFF), a widely used format for storing image data.  This library \
 provide means to easily access and create TIFF image files."
-HOMEPAGE = "http://www.libtiff.org/"
+HOMEPAGE = "https://www.libtiff.org/"
 LICENSE = "libtiff & BSD-4.3TAHOE"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ab490c3088a0acff254eb2f8c577547"
 
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
diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb b/meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb
index b1897fe95d..ef98dc5c1c 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb
@@ -2,8 +2,8 @@ SUMMARY = "Audio decoder for MPEG-1 Layer 1/2/3"
 DESCRIPTION = "The core of mpg123 is an MPEG-1 Layer 1/2/3 decoding library, which can be used by other programs. \
 mpg123 also comes with a command-line tool which can playback using ALSA, PulseAudio, OSS, and several other APIs, \
 and also can write the decoded audio to WAV."
-HOMEPAGE = "http://mpg123.de/"
-BUGTRACKER = "http://sourceforge.net/p/mpg123/bugs/"
+HOMEPAGE = "https://mpg123.de/"
+BUGTRACKER = "https://sourceforge.net/p/mpg123/bugs/"
 SECTION = "multimedia"
 
 LICENSE = "LGPL-2.1-only"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index b9dc8e236f..eff18454cc 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Sound server for Linux and Unix-like operating systems"
 DESCRIPTION = "A general purpose sound server intended to run as a middleware \
 between your applications and your hardware devices, either using ALSA or OSS."
-HOMEPAGE = "http://www.pulseaudio.org"
+HOMEPAGE = "https://www.pulseaudio.org"
 SECTION = "libs/multimedia"
 
 # Most of PulseAudio code is under LGPL-2.1-or-later. There are a few
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
index c40198fa8f..e34eefe119 100644
--- a/meta/recipes-multimedia/speex/speex_1.2.1.bb
+++ b/meta/recipes-multimedia/speex/speex_1.2.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Speech Audio Codec"
 DESCRIPTION = "Speex is an Open Source/Free Software patent-free audio compression format designed for speech."
-HOMEPAGE = "http://www.speex.org"
+HOMEPAGE = "https://www.speex.org"
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eff3f76350f52a99a3df5eec6b79c02a \
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eff3f76350f52a99a3df5eec6b79c02a \
                     "
 DEPENDS = "libogg speexdsp"
 
-SRC_URI = "http://downloads.xiph.org/releases/speex/speex-${PV}.tar.gz"
+SRC_URI = "https://downloads.xiph.org/releases/speex/speex-${PV}.tar.gz"
 UPSTREAM_CHECK_REGEX = "speex-(?P<pver>\d+(\.\d+)+)\.tar"
 
 SRC_URI[sha256sum] = "4b44d4f2b38a370a2d98a78329fefc56a0cf93d1c1be70029217baae6628feea"
diff --git a/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb b/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb
index 435b56bbb8..91228be85f 100644
--- a/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb
+++ b/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb
@@ -1,11 +1,11 @@
 SUMMARY = "A patent-free DSP library"
 DESCRIPTION = "SpeexDSP is a patent-free, Open Source/Free Software DSP library."
-HOMEPAGE = "http://www.speex.org"
+HOMEPAGE = "https://www.speex.org"
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eff3f76350f52a99a3df5eec6b79c02a"
 
-SRC_URI = "http://downloads.xiph.org/releases/speex/speexdsp-${PV}.tar.gz"
+SRC_URI = "https://downloads.xiph.org/releases/speex/speexdsp-${PV}.tar.gz"
 
 UPSTREAM_CHECK_REGEX = "speexdsp-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-multimedia/webp/libwebp_1.6.0.bb b/meta/recipes-multimedia/webp/libwebp_1.6.0.bb
index 0ba90c406a..3e7a7919bf 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.6.0.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.6.0.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
 SRC_URI = "https://storage.googleapis.com/downloads.webmproject.org/releases/webp/${BP}.tar.gz"
 SRC_URI[sha256sum] = "e4ab7009bf0629fd11982d4c2aa83964cf244cffba7347ecd39019a9e38c4564"
 
-UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
+UPSTREAM_CHECK_URI = "https://downloads.webmproject.org/releases/webp/index.html"
 
 EXTRA_OECONF = " \
     --disable-wic \
diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index b3d1cfd695..f3df7823f9 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "H.264/MPEG-4 AVC video encoder"
 DESCRIPTION = "A free software library and application for encoding video streams into the H.264/MPEG-4 AVC format."
-HOMEPAGE = "http://www.videolan.org/developers/x264.html"
+HOMEPAGE = "https://www.videolan.org/developers/x264.html"
 
 LICENSE = "GPL-2.0-only"
 LICENSE_FLAGS = "commercial"
diff --git a/meta/recipes-sato/libptytty/libptytty_2.0.bb b/meta/recipes-sato/libptytty/libptytty_2.0.bb
index 1199f0f44b..7dce215ffe 100644
--- a/meta/recipes-sato/libptytty/libptytty_2.0.bb
+++ b/meta/recipes-sato/libptytty/libptytty_2.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = " OS independent and secure pty/tty and utmp/wtmp/lastlog handling"
-HOMEPAGE = "http://software.schmorp.de/pkg/libptytty.html"
+HOMEPAGE = "https://software.schmorp.de/pkg/libptytty.html"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-SRC_URI = "http://dist.schmorp.de/libptytty/libptytty-${PV}.tar.gz \
+SRC_URI = "https://dist.schmorp.de/libptytty/libptytty-${PV}.tar.gz \
            file://0001-CMakeLists.txt-do-not-run-cross-binary.patch \
            "
 SRC_URI[sha256sum] = "8033ed3aadf28759660d4f11f2d7b030acf2a6890cb0f7926fb0cfa6739d31f7"
diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
index 6286a15798..02ba862be8 100644
--- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
+++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Matchbox GTK+ theme configuration application"
-HOMEPAGE = "http://matchbox-project.org"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
+HOMEPAGE = "https://matchbox-project.org"
+BUGTRACKER = "https://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
index 85e5300520..699ed3baf0 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Matchbox Window Manager Desktop"
 DESCRIPTION = "A lightweight windows manager for embedded systems. It uses the desktop background to provide an application launcher and allows modules to be loaded for additional functionality."
-HOMEPAGE = "http://matchbox-project.org/"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
+HOMEPAGE = "https://matchbox-project.org/"
+BUGTRACKER = "https://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
index 5fc6c67bfc..926796616f 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Matchbox virtual keyboard for X11"
 DESCRIPTION = "An on screen 'virtual' or 'software' keyboard."
-HOMEPAGE = "http://matchbox-project.org"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
+HOMEPAGE = "https://matchbox-project.org"
+BUGTRACKER = "https://bugzilla.yoctoproject.org/"
 SECTION = "x11"
 
 LICENSE = "LGPL-2.1-only"
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
index a126571ade..d2ff11e1b2 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
@@ -1,8 +1,8 @@
 SUMMARY = "Simple GTK+ based panel for handheld devices"
 DESCRIPTION = "A flexible always present 'window bar' for holding application \
 launchers and small 'applet' style applications"
-HOMEPAGE = "http://matchbox-project.org"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
+HOMEPAGE = "https://matchbox-project.org"
+BUGTRACKER = "https://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
index 75065163ba..566fa05c64 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Custom Matchbox session files for the Sato environment"
-HOMEPAGE = "http://www.matchbox-project.org/"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
+HOMEPAGE = "https://www.matchbox-project.org/"
+BUGTRACKER = "https://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://session;endline=3;md5=f8a5c5b9c279e52dc094d10e11c2be63"
diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
index ce1f425b77..64811f3bab 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Lightweight GTK+ terminal application"
-HOMEPAGE = "http://www.matchbox-project.org/"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
+HOMEPAGE = "https://www.matchbox-project.org/"
+BUGTRACKER = "https://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc
index bd680111d9..8620f3287e 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc
@@ -1,6 +1,6 @@
 SUMMARY = "Matchbox window manager Sato themes"
-HOMEPAGE = "http://www.matchbox-project.org/"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
+HOMEPAGE = "https://www.matchbox-project.org/"
+BUGTRACKER = "https://bugzilla.yoctoproject.org/"
 
 LICENSE = "CC-BY-SA-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=aae86bb34b0a83716ca09f4e783d6ba4"
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
index 2e463cd7b3..8389aead3f 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Fast lightweight tabbed filemanager"
 DESCRIPTION = "A free file manager application and the standard file manager of LXDE."
-HOMEPAGE = "http://pcmanfm.sourceforge.net/"
+HOMEPAGE = "https://pcmanfm.sourceforge.net/"
 
 LICENSE = "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
@@ -19,7 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.xz \
 
 SRC_URI[sha256sum] = "14cb7b247493c4cce65fbb5902611e3ad00a7a870fbc1e50adc50428c5140cf7"
 
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/"
 
 inherit autotools pkgconfig features_check mime-xdg
 
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 9745c26502..b8508d2d12 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Simon Tatham's Portable Puzzle Collection"
 DESCRIPTION = "Collection of small computer programs which implement one-player puzzle games."
-HOMEPAGE = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
+HOMEPAGE = "https://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=191542b32377bde254e9799e0a46f18b"
 
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index 2eab0d4ec4..0a488c84eb 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -8,7 +8,7 @@ same time, including Xft fonts."
 HOMEPAGE = "https://rxvt.org/"
 DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty ncurses-native"
 
-SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
+SRC_URI = "https://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
 	   file://xwc.patch \
 	   file://rxvt.desktop \
 	   file://rxvt.png"
diff --git a/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb b/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb
index 5502b66905..c05ad4d98c 100644
--- a/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb
+++ b/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb
@@ -1,4 +1,4 @@
-HOMEPAGE = "http://tango.freedesktop.org/"
+HOMEPAGE = "https://tango.freedesktop.org/"
 SUMMARY = "Enables backwards compatibility with current desktop icon themes"
 DESCRIPTION = "A Perl script used for maintaining backwards \
 compatibility with current desktop icon themes, while migrating to the \
diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb
index 83de53c26e..cad6ec5b99 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Sato icon theme"
 HOMEPAGE = "https://www.yoctoproject.org/"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
+BUGTRACKER = "https://bugzilla.yoctoproject.org/"
 
 LICENSE = "CC-BY-SA-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=56a830bbe6e4697fe6cbbae01bb7c2b2"
diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
index a2af4faed3..3c272219a0 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Ultra-simple screen capture utility, aimed at handheld devices"
-HOMEPAGE = "http://www.o-hand.com"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
+HOMEPAGE = "https://www.o-hand.com"
+BUGTRACKER = "https://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPL-2.0-only & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
index 3869ab4a02..e7eb5ccc28 100644
--- a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
+++ b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Provides a bridge between gconf and xsettings"
 HOMEPAGE = "https://git.yoctoproject.org/cgit/cgit.cgi/xsettings-daemon/"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
+BUGTRACKER = "https://bugzilla.yoctoproject.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://xsettings-manager.h;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b \
                     file://xsettings-common.h;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b"
diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
index b5e3d2fc8a..3e172a2935 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Apache Portable Runtime (APR) companion library"
-HOMEPAGE = "http://apr.apache.org/"
+HOMEPAGE = "https://apr.apache.org/"
 SECTION = "libs"
 DEPENDS = "apr expat"
 
diff --git a/meta/recipes-support/apr/apr_1.7.6.bb b/meta/recipes-support/apr/apr_1.7.6.bb
index 13fa5daa3c..7483f4272b 100644
--- a/meta/recipes-support/apr/apr_1.7.6.bb
+++ b/meta/recipes-support/apr/apr_1.7.6.bb
@@ -3,7 +3,7 @@ SUMMARY = "Apache Portable Runtime (APR) library"
 DESCRIPTION = "Create and maintain software libraries that provide a predictable \
 and consistent interface to underlying platform-specific implementations."
 
-HOMEPAGE = "http://apr.apache.org/"
+HOMEPAGE = "https://apr.apache.org/"
 SECTION = "libs"
 DEPENDS = "util-linux"
 
diff --git a/meta/recipes-support/aspell/aspell_0.60.8.1.bb b/meta/recipes-support/aspell/aspell_0.60.8.1.bb
index 43940b1e1b..c68553ce41 100644
--- a/meta/recipes-support/aspell/aspell_0.60.8.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.1.bb
@@ -8,7 +8,7 @@ checker out there for the English language."
 
 SECTION = "console/utils"
 
-HOMEPAGE = "http://aspell.net/"
+HOMEPAGE = "https://aspell.net/"
 
 LICENSE = "LGPL-2.0-only | LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
diff --git a/meta/recipes-support/atk/at-spi2-core_2.58.3.bb b/meta/recipes-support/atk/at-spi2-core_2.58.3.bb
index 022d2ff71e..0b367a32b9 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.58.3.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.58.3.bb
@@ -3,7 +3,7 @@ SUMMARY = "Assistive Technology Service Provider Interface (dbus core)"
 DESCRIPTION = "It provides a Service Provider Interface for the Assistive Technologies available on the GNOME platform and a library against which applications can be linked."
 
 HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
-BUGTRACKER = "http://bugzilla.gnome.org/"
+BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-support/attr/acl_2.3.2.bb
index a405cc2692..39ff001a12 100644
--- a/meta/recipes-support/attr/acl_2.3.2.bb
+++ b/meta/recipes-support/attr/acl_2.3.2.bb
@@ -2,8 +2,8 @@ SUMMARY = "Utilities for managing POSIX Access Control Lists"
 DESCRIPTION = "ACL allows you to provide different levels of access to files \
 and folders for different users."
 
-HOMEPAGE = "http://savannah.nongnu.org/projects/acl/"
-BUGTRACKER = "http://savannah.nongnu.org/bugs/?group=acl"
+HOMEPAGE = "https://savannah.nongnu.org/projects/acl/"
+BUGTRACKER = "https://savannah.nongnu.org/bugs/?group=acl"
 
 SECTION = "libs"
 
diff --git a/meta/recipes-support/attr/attr_2.5.2.bb b/meta/recipes-support/attr/attr_2.5.2.bb
index 390445b959..831f6696dc 100644
--- a/meta/recipes-support/attr/attr_2.5.2.bb
+++ b/meta/recipes-support/attr/attr_2.5.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Utilities for manipulating filesystem extended attributes"
 DESCRIPTION = "Implement the ability for a user to attach name:value pairs to objects within the XFS filesystem."
 
-HOMEPAGE = "http://savannah.nongnu.org/projects/attr/"
+HOMEPAGE = "https://savannah.nongnu.org/projects/attr/"
 SECTION = "libs"
 
 DEPENDS = "virtual/libintl"
diff --git a/meta/recipes-support/boost/boost-1.90.0.inc b/meta/recipes-support/boost/boost-1.90.0.inc
index 9b0ce592d9..1a5dedfde7 100644
--- a/meta/recipes-support/boost/boost-1.90.0.inc
+++ b/meta/recipes-support/boost/boost-1.90.0.inc
@@ -3,7 +3,7 @@
 # work well with the C++ Standard Library. The libraries are
 # intended to be widely useful, and are in regular use by
 # thousands of programmers across a broad spectrum of applications.
-HOMEPAGE = "http://www.boost.org/"
+HOMEPAGE = "https://www.boost.org/"
 LICENSE = "BSL-1.0 & MIT & Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
@@ -14,7 +14,7 @@ BOOST_P = "boost_${BOOST_VER}"
 SRC_URI = "https://archives.boost.io/release/${PV}/source/${BOOST_P}.tar.bz2"
 SRC_URI[sha256sum] = "49551aff3b22cbc5c5a9ed3dbc92f0e23ea50a0f7325b0d198b705e8ee3fc305"
 
-UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
+UPSTREAM_CHECK_URI = "https://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
 
 S = "${UNPACKDIR}/${BOOST_P}"
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb b/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
index a11433c9da..6be5a1b864 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
@@ -2,7 +2,7 @@ SUMMARY = "Common CA certificates"
 DESCRIPTION = "This package includes PEM files of CA certificates to allow \
 SSL-based applications to check for the authenticity of SSL connections. \
 This derived from Debian's CA Certificates."
-HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
+HOMEPAGE = "https://packages.debian.org/sid/ca-certificates"
 SECTION = "misc"
 LICENSE = "GPL-2.0-or-later & MPL-2.0"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=ae5b36b514e3f12ce1aa8e2ee67f3d7e"
diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index acef3483bb..ec8d67ef72 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Framework for defining and tracking users, login sessions, and seats"
 DESCRIPTION = "It provides a mechanism for software to react to changes \
 of any of these items or of any of the metadata associated with them."
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/ConsoleKit"
+HOMEPAGE = "https://www.freedesktop.org/wiki/Software/ConsoleKit"
 BUGTRACKER = "https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
 
 LICENSE = "GPL-2.0-or-later"
@@ -15,7 +15,7 @@ inherit autotools pkgconfig features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "http://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-${PV}.tar.xz \
+SRC_URI = "https://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-${PV}.tar.xz \
            file://sepbuildfix.patch \
            file://add-polkit-configure-argument.patch \
 "
diff --git a/meta/recipes-support/dos2unix/dos2unix_7.5.3.bb b/meta/recipes-support/dos2unix/dos2unix_7.5.3.bb
index ae69110c39..e955348347 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.5.3.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.5.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Convert text file line endings between CRLF and LF"
 DESCRIPTION = "The Dos2unix package includes utilities dos2unix and \
 unix2dos to convert plain text files in DOS or Mac format to Unix \
 format and vice versa."
-HOMEPAGE = "http://waterlan.home.xs4all.nl/dos2unix.html"
+HOMEPAGE = "https://waterlan.home.xs4all.nl/dos2unix.html"
 SECTION = "support"
 
 LICENSE = "BSD-2-Clause"
diff --git a/meta/recipes-support/fribidi/fribidi_1.0.16.bb b/meta/recipes-support/fribidi/fribidi_1.0.16.bb
index 9f75446da2..4de7d3a0fc 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.16.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.16.bb
@@ -4,7 +4,7 @@ of interactive editors and widgets that implement BiDi functionality. \
 The BiDi algorithm is a prerequisite for supporting right-to-left scripts such \
 as Hebrew, Arabic, Syriac, and Thaana. "
 SECTION = "libs"
-HOMEPAGE = "http://fribidi.org/"
+HOMEPAGE = "https://fribidi.org/"
 BUGTRACKER = "https://github.com/fribidi/fribidi/issues"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
diff --git a/meta/recipes-support/gdbm/gdbm_1.26.bb b/meta/recipes-support/gdbm/gdbm_1.26.bb
index 0c8c7ec690..0cff5caa63 100644
--- a/meta/recipes-support/gdbm/gdbm_1.26.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.26.bb
@@ -2,7 +2,7 @@ SUMMARY = "Key/value database library with extensible hashing"
 DESCRIPTION = "Library of database functions that use extensible hashing \
 and work similar to the standard UNIX dbm. These routines are provided \
 to a programmer needing to create and manipulate a hashed database."
-HOMEPAGE = "http://www.gnu.org/software/gdbm/"
+HOMEPAGE = "https://www.gnu.org/software/gdbm/"
 SECTION = "libs"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=241da1b9fe42e642cbb2c24d5e0c4d24"
diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
index 1872226616..0eaec422fa 100644
--- a/meta/recipes-support/gmp/gmp.inc
+++ b/meta/recipes-support/gmp/gmp.inc
@@ -1,6 +1,6 @@
 SUMMARY = "GNU multiprecision arithmetic library"
 DESCRIPTION = "GMP is a free library for arbitrary precision arithmetic, operating on signed integers, rational numbers, and floating point numbers"
-HOMEPAGE = "http://gmplib.org/"
+HOMEPAGE = "https://gmplib.org/"
 SECTION = "devel"
 
 inherit autotools texinfo multilib_header
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.14.bb b/meta/recipes-support/gnupg/gnupg_2.5.14.bb
index e484b03424..c5f58d1f3b 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.14.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.14.bb
@@ -4,7 +4,7 @@ as defined by RFC4880 (also known as PGP). GnuPG allows you to encrypt \
 and sign your data and communications; it features a versatile key \
 management system, along with access modules for all kinds of public \
 key directories."
-HOMEPAGE = "http://www.gnupg.org/"
+HOMEPAGE = "https://www.gnupg.org/"
 LICENSE = "GPL-3.0-only & LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=189af8afca6d6075ba6c9e0aa8077626 \
                     file://COPYING.LGPL3;md5=a2b6bf2cb38ee52619e60f30a1fc7257"
diff --git a/meta/recipes-support/gnutls/libtasn1_4.20.0.bb b/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
index 8127ba5b1d..200bf14ffc 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Library for ASN.1 and DER manipulation"
 DESCRIPTION = "A highly portable C library that encodes and decodes \
 DER/BER data following an ASN.1 schema. "
-HOMEPAGE = "http://www.gnu.org/software/libtasn1/"
+HOMEPAGE = "https://www.gnu.org/software/libtasn1/"
 
 LICENSE = "GPL-3.0-or-later & LGPL-2.1-or-later"
 LICENSE:${PN}-bin = "GPL-3.0-or-later"
diff --git a/meta/recipes-support/gpgme/gpgme_2.0.1.bb b/meta/recipes-support/gpgme/gpgme_2.0.1.bb
index 364147fad5..cff1870c19 100644
--- a/meta/recipes-support/gpgme/gpgme_2.0.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_2.0.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "High-level GnuPG encryption/signing API"
 DESCRIPTION = "GnuPG Made Easy (GPGME) is a library designed to make access to GnuPG easier for applications. It provides a High-Level Crypto API for encryption, decryption, signing, signature verification and key management"
-HOMEPAGE = "http://www.gnupg.org/gpgme.html"
+HOMEPAGE = "https://www.gnupg.org/gpgme.html"
 BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 
 LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & GPL-3.0-or-later"
diff --git a/meta/recipes-support/itstool/itstool_2.0.7.bb b/meta/recipes-support/itstool/itstool_2.0.7.bb
index 3f0e9aaa52..b962637951 100644
--- a/meta/recipes-support/itstool/itstool_2.0.7.bb
+++ b/meta/recipes-support/itstool/itstool_2.0.7.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "It extracts messages from XML files and outputs PO template \
 files, then merges translations from MO files to create translated \
 XML files. It determines what to translate and how to chunk it into \
 messages using the W3C Internationalization Tag Set (ITS). "
-HOMEPAGE = "http://itstool.org/"
+HOMEPAGE = "https://itstool.org/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "\
     file://COPYING;md5=59c57b95fd7d0e9e238ebbc7ad47c5a5 \
@@ -14,7 +14,7 @@ inherit autotools python3native
 
 DEPENDS = "python3-lxml-native"
 
-SRC_URI = "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "https://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-Fix-insufficiently-quoted-regular-expressions.patch \
            file://0002-Switch-from-libxml2-to-lxml.patch \
            file://0003-Fix-element-check.patch \
diff --git a/meta/recipes-support/libassuan/libassuan_3.0.2.bb b/meta/recipes-support/libassuan/libassuan_3.0.2.bb
index 0d2ccce989..5d4e9140f8 100644
--- a/meta/recipes-support/libassuan/libassuan_3.0.2.bb
+++ b/meta/recipes-support/libassuan/libassuan_3.0.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "IPC library used by GnuPG and GPGME"
 DESCRIPTION = "A small library implementing the so-called Assuan protocol. \
 This protocol is used for IPC between most newer GnuPG components. \
 Both, server and client side functions are provided. "
-HOMEPAGE = "http://www.gnupg.org/related_software/libassuan/"
+HOMEPAGE = "https://www.gnupg.org/related_software/libassuan/"
 BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 
 LICENSE = "GPL-3.0-or-later & LGPL-2.1-or-later"
diff --git a/meta/recipes-support/libcap/libcap_2.77.bb b/meta/recipes-support/libcap/libcap_2.77.bb
index 9968cd5f50..cc72890d6b 100644
--- a/meta/recipes-support/libcap/libcap_2.77.bb
+++ b/meta/recipes-support/libcap/libcap_2.77.bb
@@ -2,7 +2,7 @@ SUMMARY = "Library for getting/setting POSIX.1e capabilities"
 DESCRIPTION = "A library providing the API to access POSIX capabilities. \
 These allow giving various kinds of specific privileges to individual \
 users, without giving them full root permissions."
-HOMEPAGE = "http://sites.google.com/site/fullycapable/"
+HOMEPAGE = "https://sites.google.com/site/fullycapable/"
 
 # The library is BSD | GPLv2, the PAM module is BSD | LGPLv2+
 LICENSE = "(BSD-3-Clause | GPL-2.0-only) & (BSD-3-Clause | LGPL-2.0-or-later)"
diff --git a/meta/recipes-support/libdaemon/libdaemon_0.14.bb b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
index a0378802c9..b452d48a8d 100644
--- a/meta/recipes-support/libdaemon/libdaemon_0.14.bb
+++ b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
@@ -4,12 +4,12 @@ facilities for logging and a signal handler to enable graceful shutdown, \
 as well as file locking to ensure that only a single copy of a given daemon \
 is running at a time."
 SECTION = "libs"
-HOMEPAGE = "http://0pointer.de/lennart/projects/libdaemon/"
+HOMEPAGE = "https://0pointer.de/lennart/projects/libdaemon/"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://libdaemon/daemon.h;beginline=9;endline=21;md5=bd9fbe57cd96d1a5848a8ba12d9a6bf4"
 
-SRC_URI = "http://0pointer.de/lennart/projects/libdaemon/libdaemon-${PV}.tar.gz \
+SRC_URI = "https://0pointer.de/lennart/projects/libdaemon/libdaemon-${PV}.tar.gz \
            file://fix-includes.patch \
           "
 
diff --git a/meta/recipes-support/libevdev/libevdev_1.13.6.bb b/meta/recipes-support/libevdev/libevdev_1.13.6.bb
index 4a2cfee4c1..51899e1ee7 100644
--- a/meta/recipes-support/libevdev/libevdev_1.13.6.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.13.6.bb
@@ -2,14 +2,14 @@ SUMMARY = "Wrapper library for evdev devices"
 DESCRIPTION = "A library for handling evdev kernel devices. It abstracts \
 the evdev ioctls through type-safe interfaces and provides functions \
 to change the appearance of the device."
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libevdev/"
+HOMEPAGE = "https://www.freedesktop.org/wiki/Software/libevdev/"
 SECTION = "libs"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=80c550b3197bcb8da7d7557ebcc3fc46 \
                     "
 
-SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
+SRC_URI = "https://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
 SRC_URI[sha256sum] = "73f215eccbd8233f414737ac06bca2687e67c44b97d2d7576091aa9718551110"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/recipes-support/libevent/libevent_2.1.12.bb
index 4e32b5217e..151774e866 100644
--- a/meta/recipes-support/libevent/libevent_2.1.12.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
@@ -4,7 +4,7 @@ notification. The libevent API provides a mechanism to execute a callback \
 function when a specific event occurs on a file descriptor or after a \
 timeout has been reached. libevent also supports callbacks triggered \
 by signals and regular timeouts"
-HOMEPAGE = "http://libevent.org/"
+HOMEPAGE = "https://libevent.org/"
 BUGTRACKER = "https://github.com/libevent/libevent/issues"
 SECTION = "libs"
 
diff --git a/meta/recipes-support/libffi/libffi_3.5.2.bb b/meta/recipes-support/libffi/libffi_3.5.2.bb
index f648a33a46..12784a4c5b 100644
--- a/meta/recipes-support/libffi/libffi_3.5.2.bb
+++ b/meta/recipes-support/libffi/libffi_3.5.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A portable foreign function interface library"
-HOMEPAGE = "http://sourceware.org/libffi/"
+HOMEPAGE = "https://sourceware.org/libffi/"
 DESCRIPTION = "The `libffi' library provides a portable, high level programming interface to various calling \
 conventions.  This allows a programmer to call any function specified by a call interface description at run \
 time. FFI stands for Foreign Function Interface.  A foreign function interface is the popular name for the \
diff --git a/meta/recipes-support/libfm/libfm-extra_1.3.2.bb b/meta/recipes-support/libfm/libfm-extra_1.3.2.bb
index 5bf2f0f502..393caea182 100644
--- a/meta/recipes-support/libfm/libfm-extra_1.3.2.bb
+++ b/meta/recipes-support/libfm/libfm-extra_1.3.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Library for file management"
 DESCRIPTION = "Contains a library and other files required by menu-cache-gen libexec of menu-cache-1.1.0. "
-HOMEPAGE = "http://pcmanfm.sourceforge.net/"
+HOMEPAGE = "https://pcmanfm.sourceforge.net/"
 
 LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://src/fm-extra.h;beginline=8;endline=21;md5=ef1f84da64b3c01cca447212f7ef6007"
diff --git a/meta/recipes-support/libfm/libfm_1.3.2.bb b/meta/recipes-support/libfm/libfm_1.3.2.bb
index ab29ce4b40..02b004926b 100644
--- a/meta/recipes-support/libfm/libfm_1.3.2.bb
+++ b/meta/recipes-support/libfm/libfm_1.3.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Library for file management"
 DESCRIPTION = "LibFM provides file management functions built on top of Glib/GIO \
 giving a convenient higher-level API."
-HOMEPAGE = "http://pcmanfm.sourceforge.net/"
+HOMEPAGE = "https://pcmanfm.sourceforge.net/"
 
 LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4641e94ec96f98fabc56ff9cc48be14b \
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb
index d0236b58b3..b2a54a2fa0 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "General purpose cryptographic library based on the code from GnuPG"
 DESCRIPTION = "A cryptography library developed as a separated module of GnuPG. \
 It can also be used independently of GnuPG, but depends on its error-reporting \
 library Libgpg-error."
-HOMEPAGE = "http://directory.fsf.org/project/libgcrypt/"
+HOMEPAGE = "https://directory.fsf.org/project/libgcrypt/"
 BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 SECTION = "libs"
 
diff --git a/meta/recipes-support/libgit2/libgit2_1.9.2.bb b/meta/recipes-support/libgit2/libgit2_1.9.2.bb
index 2e023b44ff..de756ad31e 100644
--- a/meta/recipes-support/libgit2/libgit2_1.9.2.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.9.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "the Git linkable library"
-HOMEPAGE = "http://libgit2.github.com/"
+HOMEPAGE = "https://libgit2.github.com/"
 LICENSE = "GPL-2.0-with-GCC-exception & MIT & OpenSSL & BSD-3-Clause & Zlib & ISC & LGPL-2.1-or-later & CC0-1.0 & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8eacfdc17c8f4d219e131a073973b97d"
 
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb
index d42a9028e8..9c87091114 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Small library that defines common error values for all GnuPG components"
 DESCRIPTION = "Contains common error codes and error handling functions used by GnuPG, Libgcrypt, GPGME and more packages. "
-HOMEPAGE = "http://www.gnupg.org/related_software/libgpg-error/"
+HOMEPAGE = "https://www.gnupg.org/related_software/libgpg-error/"
 BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 
 LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
index 7890dfa5c7..be46e34d7c 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "The Jitter RNG provides a noise source using the CPU execution ti
 It does not depend on any system resource other than a high-resolution time \
 stamp. It is a small-scale, yet fast entropy source that is viable in almost \
 all environments and on a lot of CPU architectures."
-HOMEPAGE = "http://www.chronox.de/jent.html"
+HOMEPAGE = "https://www.chronox.de/jent.html"
 LICENSE = "GPL-2.0-or-later | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e01027c4ad1fe5a4768f8488c945d491 \
                     file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
diff --git a/meta/recipes-support/libksba/libksba_1.6.7.bb b/meta/recipes-support/libksba/libksba_1.6.7.bb
index d97fa84977..2d0117ea6d 100644
--- a/meta/recipes-support/libksba/libksba_1.6.7.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.7.bb
@@ -4,7 +4,7 @@ CMS data and related objects more easy. It provides a highlevel interface to \
 the implemented protocols and presents the data in a consistent way. The \
 library does not rely on another cryptographic library but provides \
 hooks for easy integration with Libgcrypt. "
-HOMEPAGE = "http://www.gnupg.org/related_software/libksba/"
+HOMEPAGE = "https://www.gnupg.org/related_software/libksba/"
 LICENSE = "GPL-3.0-or-later & (GPL-2.0-or-later | LGPL-3.0-or-later)"
 LICENSE:${PN} = "GPL-2.0-or-later | LGPL-3.0-or-later"
 LICENSE:${PN}-doc = "GPL-3.0-or-later"
diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb
index fdca510d0b..ec0a3db0d2 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A small C library that is supposed to make it easy to run an HTTP server as part of another application"
-HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
+HOMEPAGE = "https://www.gnu.org/software/libmicrohttpd/"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=57d09285feac8a64efa878e692b14f36"
 SECTION = "net"
diff --git a/meta/recipes-support/libmpc/libmpc.inc b/meta/recipes-support/libmpc/libmpc.inc
index bc564d4dca..d8b1c4e34a 100644
--- a/meta/recipes-support/libmpc/libmpc.inc
+++ b/meta/recipes-support/libmpc/libmpc.inc
@@ -1,6 +1,6 @@
 SUMMARY = "C library for complex number arithmetic with arbitrary precision and correct rounding"
 DESCRIPTION = "Mpc is a C library for the arithmetic of complex numbers with arbitrarily high precision and correct rounding of the result. It is built upon and follows the same principles as Mpfr"
-HOMEPAGE = "http://www.multiprecision.org/"
+HOMEPAGE = "https://www.multiprecision.org/"
 LICENSE = "LGPL-3.0-only"
 SECTION = "libs"
 
diff --git a/meta/recipes-support/libpcre/libpcre2_10.47.bb b/meta/recipes-support/libpcre/libpcre2_10.47.bb
index 2ac249f05b..db90426acd 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -5,7 +5,7 @@ deployed PCRE library's API and feature are stable, future releases \
  will be for bugfixes only. All new future features will be to PCRE2, \
 not the original PCRE 8.x series."
 SUMMARY = "Perl Compatible Regular Expressions version 2"
-HOMEPAGE = "http://www.pcre.org"
+HOMEPAGE = "https://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.md;md5=6720bf3bcff57543b915c2b22e526df0 \
diff --git a/meta/recipes-support/libpcre/libpcre_8.45.bb b/meta/recipes-support/libpcre/libpcre_8.45.bb
index c5ecbd8cf2..c6bf7c3e1b 100644
--- a/meta/recipes-support/libpcre/libpcre_8.45.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.45.bb
@@ -3,7 +3,7 @@ expression pattern matching using the same syntax and semantics as Perl 5. PCRE
 has its own native API, as well as a set of wrapper functions that correspond \
 to the POSIX regular expression API."
 SUMMARY = "Perl Compatible Regular Expressions"
-HOMEPAGE = "http://www.pcre.org"
+HOMEPAGE = "https://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=b5d5d1a69a24ea2718263f1ff85a1c58"
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 11d7448687..45dc6527f6 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A client-side C library implementing the SSH2 protocol"
-HOMEPAGE = "http://www.libssh2.org/"
+HOMEPAGE = "https://www.libssh2.org/"
 SECTION = "libs"
 
 DEPENDS = "zlib"
@@ -7,7 +7,7 @@ DEPENDS = "zlib"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2fbf8f834408079bf1fcbadb9814b1bc"
 
-SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
+SRC_URI = "https://www.libssh2.org/download/${BP}.tar.gz \
            file://run-ptest \
            file://0001-Return-error-if-user-KEX-methods-are-invalid.patch \
            "
diff --git a/meta/recipes-support/libunistring/libunistring_1.4.1.bb b/meta/recipes-support/libunistring/libunistring_1.4.1.bb
index 791f4983ed..c74b887dd9 100644
--- a/meta/recipes-support/libunistring/libunistring_1.4.1.bb
+++ b/meta/recipes-support/libunistring/libunistring_1.4.1.bb
@@ -11,7 +11,7 @@ DESCRIPTION = "Text files are nowadays usually encoded in Unicode, and may\
  Unicode strings and for manipulating C strings according to the Unicode\
  standard.  This package contains documentation."
 
-HOMEPAGE = "http://www.gnu.org/software/libunistring/"
+HOMEPAGE = "https://www.gnu.org/software/libunistring/"
 SECTION = "devel"
 LICENSE = "LGPL-3.0-or-later | GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
diff --git a/meta/recipes-support/libunwind/libunwind_1.8.3.bb b/meta/recipes-support/libunwind/libunwind_1.8.3.bb
index bc1a108e42..1b3e63283e 100644
--- a/meta/recipes-support/libunwind/libunwind_1.8.3.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.8.3.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Library for obtaining the call-chain of a program"
 DESCRIPTION = "a portable and efficient C programming interface (API) to determine the call-chain of a program"
-HOMEPAGE = "http://www.nongnu.org/libunwind"
+HOMEPAGE = "https://www.nongnu.org/libunwind"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d80c8ed4062b8339b715f90fa68cc9f"
 DEPENDS:append:libc-musl = " libucontext"
diff --git a/meta/recipes-support/liburcu/liburcu_0.15.5.bb b/meta/recipes-support/liburcu/liburcu_0.15.5.bb
index 94124c6391..cac40cae86 100644
--- a/meta/recipes-support/liburcu/liburcu_0.15.5.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.15.5.bb
@@ -2,8 +2,8 @@ SUMMARY = "Userspace RCU (read-copy-update) library"
 DESCRIPTION = "A userspace RCU (read-copy-update) library. This data \
 synchronization library provides read-side access which scales linearly \
 with the number of cores. "
-HOMEPAGE = "http://lttng.org/urcu"
-BUGTRACKER = "http://lttng.org/project/issues"
+HOMEPAGE = "https://lttng.org/urcu"
+BUGTRACKER = "https://lttng.org/project/issues"
 
 LICENSE = "LGPL-2.1-or-later & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c2a92498b6e88e276f986877995425b8 \
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c2a92498b6e88e276f986877995425b8 \
                     file://include/urcu/uatomic/x86.h;beginline=1;endline=6;md5=358d69272ba7b5f85e29e342430d440c \
                     "
 
-SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
+SRC_URI = "https://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
 SRC_URI[sha256sum] = "b2f787a8a83512c32599e71cdabcc5131464947b82014896bd11413b2d782de1"
 
diff --git a/meta/recipes-support/libusb/libusb1_1.0.29.bb b/meta/recipes-support/libusb/libusb1_1.0.29.bb
index 856e32d1c6..cd13ce3553 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.29.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.29.bb
@@ -2,7 +2,7 @@ SUMMARY = "Userspace library to access USB (version 1.0)"
 DESCRIPTION = "A cross-platform library to access USB devices from Linux, \
 macOS, Windows, OpenBSD/NetBSD, Haiku and Solaris userspace."
 HOMEPAGE = "https://libusb.info"
-BUGTRACKER = "http://www.libusb.org/report"
+BUGTRACKER = "https://www.libusb.org/report"
 SECTION = "libs"
 
 LICENSE = "LGPL-2.1-or-later"
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.45.bb b/meta/recipes-support/libxslt/libxslt_1.1.45.bb
index 449ea2dd24..2aa6962c89 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.45.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.45.bb
@@ -4,7 +4,7 @@ XSLT itself is a an XML language to define transformation for XML. Libxslt is ba
 libxml2 the XML C library developed for the GNOME project. It also implements most of \
 the EXSLT set of processor-portable extensions functions and some of Saxon's evaluate \
 and expressions extensions."
-HOMEPAGE = "http://xmlsoft.org/XSLT/"
+HOMEPAGE = "https://xmlsoft.org/XSLT/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
 LICENSE = "MIT"
diff --git a/meta/recipes-support/lzo/lzo_2.10.bb b/meta/recipes-support/lzo/lzo_2.10.bb
index fbf9f2dbac..59093b7ebb 100644
--- a/meta/recipes-support/lzo/lzo_2.10.bb
+++ b/meta/recipes-support/lzo/lzo_2.10.bb
@@ -1,13 +1,13 @@
 SUMMARY = "Lossless data compression library"
 DESCRIPTION = "A portable lossless data compression library written in \
 ANSI C that offers pretty fast compression and *extremely* fast decompression. "
-HOMEPAGE = "http://www.oberhumer.com/opensource/lzo/"
+HOMEPAGE = "https://www.oberhumer.com/opensource/lzo/"
 SECTION = "libs"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/lzo_init.c;beginline=5;endline=25;md5=9ae697ca01829b0a383c5d2d163e0108"
 
-SRC_URI = "http://www.oberhumer.com/opensource/lzo/download/lzo-${PV}.tar.gz \
+SRC_URI = "https://www.oberhumer.com/opensource/lzo/download/lzo-${PV}.tar.gz \
            file://0001-Use-memcpy-instead-of-reinventing-it.patch \
 	   file://0001-Add-pkgconfigdir-to-solve-the-undefine-error.patch \
            file://run-ptest \
diff --git a/meta/recipes-support/lzop/lzop_1.04.bb b/meta/recipes-support/lzop/lzop_1.04.bb
index c32aa53422..ed326d17d3 100644
--- a/meta/recipes-support/lzop/lzop_1.04.bb
+++ b/meta/recipes-support/lzop/lzop_1.04.bb
@@ -5,14 +5,14 @@ gzip are much higher compression and decompression speed at the cost of some \n\
 compression ratio. The lzop compression utility was designed with the goals \n\
 of reliability, speed, portability and with reasonable drop-in compatibility \n\
 to gzip."
-HOMEPAGE = "http://www.lzop.org/"
+HOMEPAGE = "https://www.lzop.org/"
 DEPENDS += "lzo"
 
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/lzop.c;beginline=5;endline=21;md5=23d767de7754eb24b9e900b025cf7fc8"
 
-SRC_URI = "http://www.lzop.org/download/${BP}.tar.gz \
+SRC_URI = "https://www.lzop.org/download/${BP}.tar.gz \
            file://acinclude.m4 \
           "
 SRC_URI[sha256sum] = "7e72b62a8a60aff5200a047eea0773a8fb205caf7acbe1774d95147f305a2f41"
diff --git a/meta/recipes-support/mpfr/mpfr_4.2.2.bb b/meta/recipes-support/mpfr/mpfr_4.2.2.bb
index 4d1747c3fd..e73c207de9 100644
--- a/meta/recipes-support/mpfr/mpfr_4.2.2.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.2.2.bb
@@ -16,6 +16,6 @@ DEPENDS = "gmp"
 SRC_URI = "https://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
 SRC_URI[sha256sum] = "b67ba0383ef7e8a8563734e2e889ef5ec3c3b898a01d00fa0a6869ad81c6ce01"
 
-UPSTREAM_CHECK_URI = "http://www.mpfr.org/mpfr-current/"
+UPSTREAM_CHECK_URI = "https://www.mpfr.org/mpfr-current/"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/nettle/nettle_3.10.2.bb b/meta/recipes-support/nettle/nettle_3.10.2.bb
index e651f68cb9..f1282d506d 100644
--- a/meta/recipes-support/nettle/nettle_3.10.2.bb
+++ b/meta/recipes-support/nettle/nettle_3.10.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A low level cryptographic library"
 DESCRIPTION = "Nettle is a cryptographic library that is designed to fit easily in more or less any context: In crypto toolkits for object-oriented languages (C++, Python, Pike, ...), in applications like LSH or GNUPG, or even in kernel space."
-HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
+HOMEPAGE = "https://www.lysator.liu.se/~nisse/nettle/"
 DESCRIPTION = "It tries to solve a problem of providing a common set of \
 cryptographic algorithms for higher-level applications by implementing a \
 context-independent set of cryptographic algorithms"
diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
index 9e41c5b9ed..3949317d40 100644
--- a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
+++ b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
@@ -2,11 +2,11 @@ SUMMARY = "Name Service Switch module for resolving the local hostname"
 DESCRIPTION = "plugin for the GNU Name Service Switch (NSS) functionality of \
 the GNU C Library (glibc) providing host name resolution for the locally \
 configured system hostname as returned by gethostname(2)."
-HOMEPAGE = "http://0pointer.de/lennart/projects/nss-myhostname/"
+HOMEPAGE = "https://0pointer.de/lennart/projects/nss-myhostname/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-SRC_URI = "http://0pointer.de/lennart/projects/nss-myhostname/nss-myhostname-${PV}.tar.gz \
+SRC_URI = "https://0pointer.de/lennart/projects/nss-myhostname/nss-myhostname-${PV}.tar.gz \
            "
 
 SRC_URI[sha256sum] = "2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67e7caf2"
diff --git a/meta/recipes-support/numactl/numactl_2.0.19.bb b/meta/recipes-support/numactl/numactl_2.0.19.bb
index 38c09199c3..a0d99b3b41 100644
--- a/meta/recipes-support/numactl/numactl_2.0.19.bb
+++ b/meta/recipes-support/numactl/numactl_2.0.19.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Development package for building Applications that use numa"
-HOMEPAGE = "http://oss.sgi.com/projects/libnuma/" 
+HOMEPAGE = "https://oss.sgi.com/projects/libnuma/" 
 DESCRIPTION = "Simple NUMA policy support. It consists of a numactl program \
 to run other programs with a specific NUMA policy and a libnuma to do \
 allocations with NUMA policy in applications."
diff --git a/meta/recipes-support/pinentry/pinentry_1.3.2.bb b/meta/recipes-support/pinentry/pinentry_1.3.2.bb
index a5c8d2258a..5ecd2259cc 100644
--- a/meta/recipes-support/pinentry/pinentry_1.3.2.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.3.2.bb
@@ -2,9 +2,9 @@ SUMMARY = "Collection of simple PIN or passphrase entry dialogs"
 DESCRIPTION = "\
 	Pinentry is a collection of simple PIN or passphrase entry dialogs which \
 	utilize the Assuan protocol as described by the aegypten project; see \
-	http://www.gnupg.org/aegypten/ for details."
+	https://www.gnupg.org/aegypten/ for details."
 
-HOMEPAGE = "http://www.gnupg.org/related_software/pinentry/index.en.html"
+HOMEPAGE = "https://www.gnupg.org/related_software/pinentry/index.en.html"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
diff --git a/meta/recipes-support/popt/popt_1.19.bb b/meta/recipes-support/popt/popt_1.19.bb
index 525bf553b1..567547fb3c 100644
--- a/meta/recipes-support/popt/popt_1.19.bb
+++ b/meta/recipes-support/popt/popt_1.19.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e0206ac9471d06667e076212db20c5f4"
 
 DEPENDS = "virtual/libiconv"
 
-SRC_URI = "http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \
+SRC_URI = "https://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987fdad3ca2758c63240f9"
diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
index 89f85e2455..67eb12bd7e 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "A C program to run all installed ptests"
 DESCRIPTION = "The ptest-runner2 package installs a ptest-runner \
 program which loops through all installed ptest test suites and \
 runs them in sequence."
-HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
+HOMEPAGE = "https://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
diff --git a/meta/recipes-support/re2c/re2c_4.3.1.bb b/meta/recipes-support/re2c/re2c_4.3.1.bb
index bead73279f..6cf3a8bc05 100644
--- a/meta/recipes-support/re2c/re2c_4.3.1.bb
+++ b/meta/recipes-support/re2c/re2c_4.3.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Tool for writing very fast and very flexible scanners"
 DESCRIPTION = "A free and open-source lexer generator for C, C++ and Go. It compiles regular expressions to determinisitic finite automata and encodes the automata in the form of a program in the target language. Unlike any other such tool, re2c focuses on generating high efficient code for regular expression matching. As a result this allows a much broader range of use than any traditional lexer."
-HOMEPAGE = "http://re2c.org/"
+HOMEPAGE = "https://re2c.org/"
 BUGTRACKER = "https://github.com/skvadrik/re2c/issues"
 SECTION = "devel"
 LICENSE = "PD"
diff --git a/meta/recipes-support/sass/libsass_3.6.6.bb b/meta/recipes-support/sass/libsass_3.6.6.bb
index 26f549e53f..212a55ec31 100644
--- a/meta/recipes-support/sass/libsass_3.6.6.bb
+++ b/meta/recipes-support/sass/libsass_3.6.6.bb
@@ -1,5 +1,5 @@
 SUMMARY = "C/C++ port of the Sass CSS precompiler"
-HOMEPAGE = "http://sass-lang.com/libsass"
+HOMEPAGE = "https://sass-lang.com/libsass"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8f34396ca205f5e119ee77aae91fa27d"
 
diff --git a/meta/recipes-support/serf/serf_1.3.10.bb b/meta/recipes-support/serf/serf_1.3.10.bb
index c6b51452aa..dbeddc7b4f 100644
--- a/meta/recipes-support/serf/serf_1.3.10.bb
+++ b/meta/recipes-support/serf/serf_1.3.10.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "The Apache Serf library is a C-based HTTP client library built up
 Portable Runtime (APR) library. It multiplexes connections, running the \
 read/write communication asynchronously. Memory copies and transformations are \
 kept to a minimum to provide high performance operation."
-HOMEPAGE = "http://serf.apache.org/"
+HOMEPAGE = "https://serf.apache.org/"
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://norpath.patch \
            file://env.patch \
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
index f307aca35d..755b9b9331 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Shared MIME type database and specification"
 DESCRIPTION = "The shared-mime-info package contains the core database of common types."
-HOMEPAGE = "http://freedesktop.org/wiki/Software/shared-mime-info"
+HOMEPAGE = "https://freedesktop.org/wiki/Software/shared-mime-info"
 SECTION = "base"
 
 LICENSE = "GPL-2.0-only"
diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 94dbc38ec5..0943c77ee0 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -1,6 +1,6 @@
 SUMMARY = "Embeddable SQL database engine"
 DESCRIPTION = "A library that implements a small, fast, self-contained, high-reliability, full-featured, SQL database engine. SQLite is the most used database engine in the world. SQLite is built into all mobile phones and most computers and comes bundled inside countless other applications that people use every day"
-HOMEPAGE = "http://www.sqlite.org"
+HOMEPAGE = "https://www.sqlite.org"
 SECTION = "libs"
 
 PE = "3"
@@ -16,7 +16,7 @@ SQLITE_PV = "${@sqlite_download_version(d)}"
 S = "${UNPACKDIR}/sqlite-autoconf-${SQLITE_PV}"
 B = "${WORKDIR}/build"
 
-UPSTREAM_CHECK_URI = "http://www.sqlite.org/"
+UPSTREAM_CHECK_URI = "https://www.sqlite.org/"
 UPSTREAM_CHECK_REGEX = "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
 
 CVE_PRODUCT = "sqlite"
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
index 6b700578b8..a6890a100c 100644
--- a/meta/recipes-support/taglib/taglib_2.1.1.bb
+++ b/meta/recipes-support/taglib/taglib_2.1.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Library for reading and editing the meta-data of popular audio formats"
 DESCRIPTION = "Platform-independent library (tested on Windows/Linux) for reading and writing metadata in media files, including video, audio, and photo formats. This is a convenient one-stop-shop to present or tag all your media collection, regardless of which format/container these might use. You can read/write the standard or more common tags/properties of a media, or you can also create and retrieve your own custom tags."
 SECTION = "libs/multimedia"
-HOMEPAGE = "http://taglib.github.io/"
+HOMEPAGE = "https://taglib.github.io/"
 LICENSE = "LGPL-2.1-only | MPL-1.1"
 LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING.MPL;md5=bfe1f75d606912a4111c90743d6c7325 \
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "zlib utfcpp"
 
-SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
+SRC_URI = "https://taglib.github.io/releases/${BP}.tar.gz"
 
 SRC_URI[sha256sum] = "3716d31f7c83cbf17b67c8cf44dd82b2a2f17e6780472287a16823e70305ddba"
 
diff --git a/meta/recipes-support/xxhash/xxhash_0.8.3.bb b/meta/recipes-support/xxhash/xxhash_0.8.3.bb
index 15436113b1..3fc220f7a3 100644
--- a/meta/recipes-support/xxhash/xxhash_0.8.3.bb
+++ b/meta/recipes-support/xxhash/xxhash_0.8.3.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Extremely fast non-cryptographic hash algorithm"
 DESCRIPTION = "xxHash is an extremely fast non-cryptographic hash algorithm, \
 working at speeds close to RAM limits."
-HOMEPAGE = "http://www.xxhash.com/"
+HOMEPAGE = "https://www.xxhash.com/"
 LICENSE = "BSD-2-Clause & GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=13be6b481ff5616f77dda971191bb29b \
                     file://cli/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-- 
2.43.0


