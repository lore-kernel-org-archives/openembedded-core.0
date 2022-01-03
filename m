Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7948DC433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 21:24:48 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.35374.1641245087362802910
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 13:24:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BvgT13hf;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: changhyeok.bae@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id e5so72160385wrc.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 13:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=zQoZ/1CQxSkvJJbOMROvyiT9g6niKyRYJKmfk0I4jUw=;
        b=BvgT13hfuERpcWWneV2rZ2UllvmB+6LV/vWIdTGc5RSRilBRVxzQhHzlh5Drd7FsRR
         AKzx2D/6Qg+Q3gB22/ATjkAS2BfgqKNa/aro9cLTWsV4Q329FgS2IzYKJGARnWrEdXuW
         0KnSfNBr4GksmZ8PIko5NBXXzfxwN1ctdi/qip9njFSGqIrBsHa5PX8EELm5WARC1jDZ
         v5nJhXfA7J95wpNveup1z0/57pmLx4CkxxpK+hfhS4egY46g/6O9zIbQrh/VZCXYe1Pt
         FNaphmZl2FShOlc5meIw/aQamrUFgfYN7leAXPgXWl56Wc5iCXbPuu++q7SGRfQgm5sE
         ahvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zQoZ/1CQxSkvJJbOMROvyiT9g6niKyRYJKmfk0I4jUw=;
        b=qjUcivZk+gNVecrkptMIe3ksFkwJLE4Oyu/S4OWMGSWapcrvJN0V8M5J2uuSAgMKkZ
         +0RpPsVN9SiTTorMpMAHvPKDJu3q6KNRG+XELL6xUuMOcc4n+V/1qQB+QvVmAXx7MEGI
         2FV4U0CFyJXjhANRYDwAkVypmxIA0QPbvmfzUScaA3Xq2NmqBvZ1tpcw3Oy7tBEyf9lt
         qTe3pwml0tFr/1O9tS/SshFqUmS74PAIS1Q/fD3zxL1qg+75u2b+L+nhpkPuheS1m7j7
         3CEYnssxTM7Ldc2NRP7dcrkrJdp8PXr6too1CgbPiJuPurTpPhknasxYRfevfdWBo29v
         EHyQ==
X-Gm-Message-State: AOAM530A93N81H5GcsRb04+cS2xb8BxVS1mBfXbgXZs4pv2MVUxeWoyi
	YjIh2PDLXJzpu+dhi31iDZTPCkldooFhhw==
X-Google-Smtp-Source: 
 ABdhPJxImShnYqf/Uc8njrQsDkd2A7iBOT2PI1SWDSDXZD4e0soSQdjCG8oFhODewaEOaMU+GITzGw==
X-Received: by 2002:a5d:53c5:: with SMTP id a5mr40199970wrw.328.1641245085466;
        Mon, 03 Jan 2022 13:24:45 -0800 (PST)
Received: from localhost.localdomain (ip5f5aec99.dynamic.kabel-deutschland.de.
 [95.90.236.153])
        by smtp.gmail.com with ESMTPSA id
 y8sm39583804wrd.10.2022.01.03.13.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 13:24:44 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH] iputils: update 20210722 to 20211215
Date: Mon,  3 Jan 2022 21:24:39 +0000
Message-Id: <20220103212439.93927-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 21:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160148

traceroute6 and tftpd were removed in iputils.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../0001-meson-Make-tests-optional.patch      | 220 ------------------
 ...putils_20210722.bb => iputils_20211215.bb} |  16 +-
 2 files changed, 5 insertions(+), 231 deletions(-)
 delete mode 100644 meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch
 rename meta/recipes-extended/iputils/{iputils_20210722.bb => iputils_20211215.bb} (78%)

diff --git a/meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch b/meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch
deleted file mode 100644
index 9f17cbdb87..0000000000
--- a/meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch
+++ /dev/null
@@ -1,220 +0,0 @@
-From d8048d60d30a2efe7883b36626123630ce69b9fc Mon Sep 17 00:00:00 2001
-From: Heiko Becker <heirecka@exherbo.org>
-Date: Fri, 23 Jul 2021 16:32:46 +0200
-Subject: [PATCH] meson: Make tests optional
-
-Now can be disabled with -DSKIP_TESTS=true.
-
-It allows to avoid meson error during build when ip isn't installed.
-
-Closes: #359
-
-Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
-Signed-off-by: Heiko Becker <heirecka@exherbo.org>
-[ pvorel: Rename variable TEST => SKIP_TESTS, default false, adjust
-the description ]
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-
-Upstream-Status: Backport [3163c49f9f4ad473a00d8a345ee334a028376011]
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- meson_options.txt     |  3 ++
- ping/meson.build      | 84 ++-----------------------------------------
- ping/test/meson.build | 81 +++++++++++++++++++++++++++++++++++++++++
- 3 files changed, 86 insertions(+), 82 deletions(-)
- create mode 100644 ping/test/meson.build
-
-diff --git a/meson_options.txt b/meson_options.txt
-index ac5f5d9..517667f 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -72,3 +72,6 @@ option('INSTALL_SYSTEMD_UNITS', type: 'boolean', value: false,
- 
- option('USE_GETTEXT', type: 'boolean', value: true,
- 	description: 'Enable I18N')
-+
-+option('SKIP_TESTS', type: 'boolean', value: false,
-+	description: 'Skip tests during build')
-diff --git a/ping/meson.build b/ping/meson.build
-index 1e678ec..83ea353 100644
---- a/ping/meson.build
-+++ b/ping/meson.build
-@@ -27,86 +27,6 @@ if (setcap_ping)
- 	)
- endif
- 
--##### TESTS #####
--
--# TODO: ::1 generates DEPRECATION: ":" is not allowed in test name "ping -c1 ::1", it has been replaced with "_"
--
--# GitHub CI does not have working IPv6
--# https://github.com/actions/virtual-environments/issues/668
--ipv6_dst = []
--ipv6_switch = []
--r = run_command('ip', '-6', 'a')
--if r.stdout().strip().contains('::1')
--  message('IPv6 enabled')
--  ipv6_dst = [ '::1' ]
--  ipv6_switch = [ '-6' ]
--else
--  message('WARNING: IPv6 disabled')
-+if not get_option('SKIP_TESTS')
-+	subdir('test')
- endif
--
--run_as_root = false
--r = run_command('id', '-u')
--if r.stdout().strip().to_int() == 0
--  message('running as root')
--  run_as_root = true
--else
--  message('running as normal user')
--endif
--
--foreach dst : [ 'localhost', '127.0.0.1' ] + ipv6_dst
--  foreach switch : [ '', '-4' ] + ipv6_switch
--	args = [ '-c1', dst ]
--	should_fail = false
--
--	if switch != ''
--	  args = [switch] + args
--	  if (switch == '-4' and dst == '::1') or (switch == '-6' and dst == '127.0.0.1')
--		 should_fail = true
--	  endif
--	endif
--
--	name = 'ping ' + ' '.join(args)
--	test(name, ping, args : args, should_fail : should_fail)
--  endforeach
--endforeach
--
--ping_tests_opt = [
--  [ '-c1' ],
--  [ '-c5', '-i0.1' ],
--  [ '-c1', '-I', 'lo' ],
--  [ '-c1', '-w1' ],
--  [ '-c1', '-W1' ],
--  [ '-c1', '-W1.1' ],
--]
--foreach dst : [ '127.0.0.1' ] + ipv6_dst
--  foreach args : ping_tests_opt
--	args += [ dst ]
--	name = 'ping ' + ' '.join(args)
--	test(name, ping, args : args)
--  endforeach
--endforeach
--
--ping_tests_opt_fail = [
--  [ '-c1.1' ],
--  [ '-I', 'nonexisting' ],
--  [ '-w0.1' ],
--  [ '-w0,1' ],
--]
--foreach dst : [ '127.0.0.1' ] + ipv6_dst
--  foreach args : ping_tests_opt_fail
--	args += [ dst ]
--	name = 'ping ' + ' '.join(args)
--	test(name, ping, args : args, should_fail : true)
--  endforeach
--endforeach
--
--ping_tests_user_fail = [
--  [ '-c1', '-i0.001' ], # -c1 required to quit ping when running as root
--]
--foreach dst : [ '127.0.0.1' ] + ipv6_dst
--  foreach args : ping_tests_user_fail
--	args += [ dst ]
--	name = 'ping ' + ' '.join(args)
--	test(name, ping, args : args, should_fail : not run_as_root)
--  endforeach
--endforeach
-diff --git a/ping/test/meson.build b/ping/test/meson.build
-new file mode 100644
-index 0000000..43aed75
---- /dev/null
-+++ b/ping/test/meson.build
-@@ -0,0 +1,81 @@
-+# TODO: ::1 generates DEPRECATION: ":" is not allowed in test name "ping -c1 ::1", it has been replaced with "_"
-+
-+# GitHub CI does not have working IPv6
-+# https://github.com/actions/virtual-environments/issues/668
-+ipv6_dst = []
-+ipv6_switch = []
-+r = run_command('ip', '-6', 'a')
-+if r.stdout().strip().contains('::1')
-+  message('IPv6 enabled')
-+  ipv6_dst = [ '::1' ]
-+  ipv6_switch = [ '-6' ]
-+else
-+  message('WARNING: IPv6 disabled')
-+endif
-+
-+run_as_root = false
-+r = run_command('id', '-u')
-+if r.stdout().strip().to_int() == 0
-+  message('running as root')
-+  run_as_root = true
-+else
-+  message('running as normal user')
-+endif
-+
-+foreach dst : [ 'localhost', '127.0.0.1' ] + ipv6_dst
-+  foreach switch : [ '', '-4' ] + ipv6_switch
-+	args = [ '-c1', dst ]
-+	should_fail = false
-+
-+	if switch != ''
-+	  args = [switch] + args
-+	  if (switch == '-4' and dst == '::1') or (switch == '-6' and dst == '127.0.0.1')
-+		 should_fail = true
-+	  endif
-+	endif
-+
-+	name = 'ping ' + ' '.join(args)
-+	test(name, ping, args : args, should_fail : should_fail)
-+  endforeach
-+endforeach
-+
-+ping_tests_opt = [
-+  [ '-c1' ],
-+  [ '-c5', '-i0.1' ],
-+  [ '-c1', '-I', 'lo' ],
-+  [ '-c1', '-w1' ],
-+  [ '-c1', '-W1' ],
-+  [ '-c1', '-W1.1' ],
-+]
-+foreach dst : [ '127.0.0.1' ] + ipv6_dst
-+  foreach args : ping_tests_opt
-+	args += [ dst ]
-+	name = 'ping ' + ' '.join(args)
-+	test(name, ping, args : args)
-+  endforeach
-+endforeach
-+
-+ping_tests_opt_fail = [
-+  [ '-c1.1' ],
-+  [ '-I', 'nonexisting' ],
-+  [ '-w0.1' ],
-+  [ '-w0,1' ],
-+]
-+foreach dst : [ '127.0.0.1' ] + ipv6_dst
-+  foreach args : ping_tests_opt_fail
-+	args += [ dst ]
-+	name = 'ping ' + ' '.join(args)
-+	test(name, ping, args : args, should_fail : true)
-+  endforeach
-+endforeach
-+
-+ping_tests_user_fail = [
-+  [ '-c1', '-i0.001' ], # -c1 required to quit ping when running as root
-+]
-+foreach dst : [ '127.0.0.1' ] + ipv6_dst
-+  foreach args : ping_tests_user_fail
-+	args += [ dst ]
-+	name = 'ping ' + ' '.join(args)
-+	test(name, ping, args : args, should_fail : not run_as_root)
-+  endforeach
-+endforeach
--- 
-2.30.2
-
diff --git a/meta/recipes-extended/iputils/iputils_20210722.bb b/meta/recipes-extended/iputils/iputils_20211215.bb
similarity index 78%
rename from meta/recipes-extended/iputils/iputils_20210722.bb
rename to meta/recipes-extended/iputils/iputils_20211215.bb
index d81f787dd8..b6b641344c 100644
--- a/meta/recipes-extended/iputils/iputils_20210722.bb
+++ b/meta/recipes-extended/iputils/iputils_20211215.bb
@@ -1,20 +1,19 @@
 SUMMARY = "Network monitoring tools"
-DESCRIPTION = "Utilities for the IP protocol, including traceroute6, \
+DESCRIPTION = "Utilities for the IP protocol, including \
 tracepath, tracepath6, ping, ping6 and arping."
 HOMEPAGE = "https://github.com/iputils/iputils"
 SECTION = "console/network"
 
 LICENSE = "BSD-3-Clause & GPLv2+"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=55aa8c9fcad0691cef0ecd420361e390"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bb64c89bb0e23b72930d2380894c47a1"
 
 DEPENDS = "gnutls"
 
 SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https \
            file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
-           file://0001-meson-Make-tests-optional.patch \
            "
-SRCREV = "71bb2a6c72e9f658e90ac618c73d873a76bbaa81"
+SRCREV = "1d1e7c43210d8af316a41cb2c53d612a4c16f34d"
 
 S = "${WORKDIR}/git"
 
@@ -25,7 +24,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>20\d+)"
 CVE_CHECK_WHITELIST += "CVE-2000-1213 CVE-2000-1214"
 
 PACKAGECONFIG ??= "libcap rarpd \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ninfod traceroute6', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ninfod', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false -DNO_SETCAP_OR_SUID=true, libcap libcap-native"
 PACKAGECONFIG[libidn] = "-DUSE_IDN=true, -DUSE_IDN=false, libidn2"
@@ -33,8 +32,6 @@ PACKAGECONFIG[gettext] = "-DUSE_GETTEXT=true, -DUSE_GETTEXT=false, gettext"
 PACKAGECONFIG[ninfod] = "-DBUILD_NINFOD=true,-DBUILD_NINFOD=false,"
 PACKAGECONFIG[rarpd] = "-DBUILD_RARPD=true,-DBUILD_RARPD=false,"
 PACKAGECONFIG[systemd] = "-Dsystemdunitdir=${systemd_system_unitdir},,systemd"
-PACKAGECONFIG[tftpd] = "-DBUILD_TFTPD=true, -DBUILD_TFTPD=false,"
-PACKAGECONFIG[traceroute6] = "-DBUILD_TRACEROUTE6=true,-DBUILD_TRACEROUTE6=false,"
 PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MANS=false -DBUILD_MANS=false, libxslt"
 
 inherit meson systemd update-alternatives pkgconfig
@@ -48,8 +45,7 @@ ALTERNATIVE_LINK_NAME[ping] = "${base_bindir}/ping"
 
 SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff ${PN}-rdisc \
              ${@bb.utils.contains('PACKAGECONFIG', 'rarpd', '${PN}-rarpd', '', d)} \
-             ${@bb.utils.contains('PACKAGECONFIG', 'tftpd', '${PN}-tftpd', '', d)} \
-             ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '${PN}-traceroute6 ${PN}-ninfod', '', d)}"
+             ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '${PN}-ninfod', '', d)}"
 PACKAGES += "${SPLITPKGS}"
 
 ALLOW_EMPTY:${PN} = "1"
@@ -59,9 +55,7 @@ FILES:${PN} = ""
 FILES:${PN}-ping = "${base_bindir}/ping.${BPN}"
 FILES:${PN}-arping = "${base_bindir}/arping"
 FILES:${PN}-tracepath = "${base_bindir}/tracepath"
-FILES:${PN}-traceroute6	= "${base_bindir}/traceroute6"
 FILES:${PN}-clockdiff = "${base_bindir}/clockdiff"
-FILES:${PN}-tftpd = "${base_bindir}/tftpd ${sysconfdir}/xinetd.d/tftp"
 FILES:${PN}-rarpd = "${base_sbindir}/rarpd  ${systemd_system_unitdir}/rarpd@.service"
 FILES:${PN}-rdisc = "${base_sbindir}/rdisc"
 FILES:${PN}-ninfod = "${base_sbindir}/ninfod ${sysconfdir}/init.d/ninfod.sh"
-- 
2.17.1


