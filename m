Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676BBC27C55
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:39 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.42228.1717263217935323263
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CrPAbIVm;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=DyWIne1b;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018fd4dd309e-bf688b98-62be-415d-8830-4361164dfea1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263217;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=87lA2xr1DfP034oBJja5c657liE6jlbb5QXBjVsYeoo=;
	b=CrPAbIVmN3m6UIgF1mReWVzSkFzCSqfsfk4R+aiKezuS3sHXLhkSXQ6EKp8hU79u
	zQJV9W9NL2U2fLoi5wQ+vBe6ZVhSHpwpcvprVaRi1fBFdzLKNXb6hPk+MjUdSFVtQr8
	7SiF4+W5r0z1R9F5HO+bvklSY9g/eBPkgJvFlm6s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263217;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=87lA2xr1DfP034oBJja5c657liE6jlbb5QXBjVsYeoo=;
	b=DyWIne1b6JncO/W0Okhui4RuTpm6lrx1MGAatcMyG2bP+g+Eir/w34xNucfNa8d9
	qTXogUTVKhN3vx32x4ZUGXxv8hqLbXkTqkGEMfJxr29G2G3kWHUjCwbZk4jR2jDrA0S
	WQ9KG7ULv8bnmmqo1dYJTrFPbiwUEeY9BjnSLlUo=
Content-Type: multipart/mixed; boundary="===============4345713813571358162=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] kea: upgrading to 2.6.0 SUCCEEDED
Message-ID: <0101018fd4dd309e-bf688b98-62be-415d-8830-4361164dfea1-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200122

--===============4345713813571358162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kea* to *2.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kea-upgrade-2.4.1-2.6.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 385460f884a4b852afeaa2d81d1037782c2be176 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 07:57:40 +0000
Subject: [PATCH] kea: upgrade 2.4.1 -> 2.6.0

---
 ...er_unittest_support.cc-do-not-write-.patch |  3 +--
 .../kea/files/fix-multilib-conflict.patch     |  7 +++---
 .../kea/files/fix_pid_keactrl.patch           |  7 +++---
 .../kea/{kea_2.4.1.bb => kea_2.6.0.bb}        | 23 +++++++++++++++++--
 4 files changed, 28 insertions(+), 12 deletions(-)
 rename meta/recipes-connectivity/kea/{kea_2.4.1.bb => kea_2.6.0.bb} (77%)

diff --git a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
index 94fbd12737..120b4fabcb 100644
--- a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
+++ b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
@@ -1,4 +1,4 @@
-From 841924e1fe8db2bff3eab8d37634ef08f86c00ec Mon Sep 17 00:00:00 2001
+From 36864bf97a685b07887150442b94d7dd59970e30 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 15:57:03 +0000
 Subject: [PATCH] src/lib/log/logger_unittest_support.cc: do not write build
@@ -8,7 +8,6 @@ This breaks reproducibility and is needed only in unit testing.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  src/lib/log/logger_unittest_support.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
index 5b135b3aee..af4ab03b23 100644
--- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -1,4 +1,4 @@
-From 06ebd1b2ced426c420ed162980eca194f9f918ae Mon Sep 17 00:00:00 2001
+From b7a49483ba3117a565a46fa715cefdc8294aa0ee Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 22 Sep 2020 15:02:33 +0800
 Subject: [PATCH] There are conflict of config files between kea and lib32-kea:
@@ -14,14 +14,13 @@ Because they are all commented out, replace the expanded libdir path with
 
 Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issues/2602]
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
 ---
  src/bin/keactrl/kea-ctrl-agent.conf.pre | 3 ++-
  src/bin/keactrl/kea-dhcp4.conf.pre      | 4 ++--
  2 files changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/src/bin/keactrl/kea-ctrl-agent.conf.pre b/src/bin/keactrl/kea-ctrl-agent.conf.pre
-index e6ae8b8..50a3092 100644
+index d8e0429..b2ec5b5 100644
 --- a/src/bin/keactrl/kea-ctrl-agent.conf.pre
 +++ b/src/bin/keactrl/kea-ctrl-agent.conf.pre
 @@ -51,7 +51,8 @@
@@ -35,7 +34,7 @@ index e6ae8b8..50a3092 100644
  //          "param1": "foo"
  //      }
 diff --git a/src/bin/keactrl/kea-dhcp4.conf.pre b/src/bin/keactrl/kea-dhcp4.conf.pre
-index 6edb8a1..b2a7385 100644
+index 55af9db..056f06f 100644
 --- a/src/bin/keactrl/kea-dhcp4.conf.pre
 +++ b/src/bin/keactrl/kea-dhcp4.conf.pre
 @@ -255,7 +255,7 @@
diff --git a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
index 63a6a2805b..568646c896 100644
--- a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
+++ b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
@@ -1,4 +1,4 @@
-From c878a356712606549f7f188b62f7d1cae08a176e Mon Sep 17 00:00:00 2001
+From 017f339d246b519757c69dbb577957831bbe40a2 Mon Sep 17 00:00:00 2001
 From: Armin kuster <akuster808@gmail.com>
 Date: Wed, 14 Oct 2020 22:48:31 -0700
 Subject: [PATCH] Busybox does not support ps -p so use pgrep
@@ -7,16 +7,15 @@ Upstream-Status: Inappropriate [embedded specific]
 Based on changes from Diego Sueiro <Diego.Sueiro@arm.com>
 
 Signed-off-by: Armin kuster <akuster808@gmail.com>
-
 ---
  src/bin/keactrl/keactrl.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/bin/keactrl/keactrl.in b/src/bin/keactrl/keactrl.in
-index 450e997..c353ca9 100644
+index cccfdac..20ae2e6 100644
 --- a/src/bin/keactrl/keactrl.in
 +++ b/src/bin/keactrl/keactrl.in
-@@ -149,8 +149,8 @@ check_running() {
+@@ -146,8 +146,8 @@ check_running() {
      # Get the PID from the PID file (if it exists)
      get_pid_from_file "${proc_name}"
      if [ ${_pid} -gt 0 ]; then
diff --git a/meta/recipes-connectivity/kea/kea_2.4.1.bb b/meta/recipes-connectivity/kea/kea_2.6.0.bb
similarity index 77%
rename from meta/recipes-connectivity/kea/kea_2.4.1.bb
rename to meta/recipes-connectivity/kea/kea_2.6.0.bb
index 19309ce314..da15b572ba 100644
--- a/meta/recipes-connectivity/kea/kea_2.4.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.6.0.bb
@@ -1,9 +1,28 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,4 +1,4 @@
+# -Copyright (C) 2009-2023 Internet Systems Consortium, Inc. ("ISC")
+# +Copyright (C) 2009-2024 Internet Systems Consortium, Inc. ("ISC")
+#  
+#  This Source Code Form is subject to the terms of the Mozilla Public
+#  License, v. 2.0. If a copy of the MPL was not distributed with this
+# 
+#
+
 SUMMARY = "ISC Kea DHCP Server"
 DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It supports both DHCPv4 and DHCPv6 protocols along with their extensions, e.g. prefix delegation and dynamic updates to DNS."
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ea061fa0188838072c4248c1318ec131"
+LIC_FILES_CHKSUM = "file://COPYING;md5=618093ea9de92c70a115268c1d53421f"
 
 DEPENDS = "boost log4cplus openssl"
 
@@ -18,7 +37,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            "
-SRC_URI[sha256sum] = "815c61f5c271caa4a1db31dd656eb50a7f6ea973da3690f7c8581408e180131a"
+SRC_URI[sha256sum] = "207ceae33eb3b81ec4e6ac5605249a85b93779333b62aadf39e489f11dbcdc8d"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.44.0


--===============4345713813571358162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/kea/kea-dbg: PV changed from "2.4.1" to "2.6.0"
packages/core2-64-poky-linux/kea/kea-dbg: PKGSIZE changed from 331380496 to 351667448 (+6%)
packages/core2-64-poky-linux/kea/kea-dbg: PKGV changed from 2.4.1 [default] to 2.6.0 [default]
packages/core2-64-poky-linux/kea/kea-dbg: FILELIST: removed "/usr/lib/.debug/libkea-database.so.48.0.0 /usr/lib/.debug/libkea-process.so.57.0.0 /usr/lib/.debug/libkea-tcp.so.5.0.0 /usr/lib/.debug/libkea-cc.so.54.0.0 /usr/lib/.debug/libkea-cfgclient.so.51.0.0 /usr/lib/.debug/libkea-http.so.56.0.0 /usr/lib/.debug/libkea-stats.so.29.0.0 /usr/lib/.debug/libkea-dhcp_ddns.so.41.0.0 /usr/lib/.debug/libkea-eval.so.52.0.0 /usr/lib/.debug/libkea-dhcpsrv.so.90.0.0 /usr/lib/.debug/libkea-asiodns.so.35.0.0 /usr/lib/.debug/libkea-d2srv.so.30.0.0 /usr/lib/.debug/libkea-hooks.so.78.0.0 /usr/lib/.debug/libkea-dns++.so.42.0.0 /usr/lib/.debug/libkea-exceptions.so.23.0.0 /usr/lib/.debug/libkea-dhcp++.so.74.0.0 /usr/lib/.debug/libkea-log.so.48.0.0 /usr/lib/.debug/libkea-cryptolink.so.38.0.0 /usr/lib/.debug/libkea-util.so.68.0.0 /usr/lib/.debug/libkea-asiolink.so.56.0.0", added "/usr/lib/.debug/libkea-dhcp++.so.89.0.0 /usr/lib/.debug/libkea-eval.so.69.0.0 /usr/lib/.debug/libkea-database.so.61.0.0 /usr/lib
 /.debug/libkea-tcp.so.18.0.0 /usr/lib/.debug/libkea-dhcpsrv.so.108.0.0 /usr/lib/.debug/libkea-process.so.72.0.0 /usr/lib/.debug/libkea-cc.so.68.0.0 /usr/lib/.debug/libkea-cfgclient.so.65.0.0 /usr/lib/.debug/libkea-util.so.84.0.0 /usr/lib/kea/hooks/.debug/libdhcp_perfmon.so /usr/lib/.debug/libkea-dhcp_ddns.so.56.0.0 /usr/lib/.debug/libkea-hooks.so.97.0.0 /usr/lib/.debug/libkea-d2srv.so.46.0.0 /usr/lib/.debug/libkea-asiodns.so.48.0.0 /usr/lib/.debug/libkea-dns++.so.56.0.0 /usr/lib/.debug/libkea-http.so.71.0.0 /usr/lib/.debug/libkea-stats.so.41.0.0 /usr/lib/.debug/libkea-exceptions.so.33.0.0 /usr/lib/.debug/libkea-log.so.61.0.0 /usr/lib/.debug/libkea-cryptolink.so.50.0.0 /usr/lib/.debug/libkea-asiolink.so.71.0.0"
packages/core2-64-poky-linux/kea/kea-dev: PV changed from "2.4.1" to "2.6.0"
packages/core2-64-poky-linux/kea/kea-dev: PKGSIZE changed from 3983538 to 3976558 (-0%)
packages/core2-64-poky-linux/kea/kea-dev: PKGV changed from 2.4.1 [default] to 2.6.0 [default]
packages/core2-64-poky-linux/kea/kea-dev: FILELIST: removed "/usr/include/kea/dns/rrset_collection_base.h /usr/include/kea/util/encode/hex.h /usr/include/kea/util/time_utilities.h /usr/include/kea/util/encode/base16_from_binary.h /usr/include/kea/util/strutil.h /usr/include/kea/util/encode/base32hex.h /usr/include/kea/dns/rrcollator.h /usr/include/kea/dns/dns_fwd.h /usr/include/kea/dns/masterload.h /usr/include/kea/dns/nsec3hash.h /usr/include/kea/util/encode/base64.h /usr/include/kea/dns/qid_gen.h /usr/include/kea/util/io_utilities.h /usr/include/kea/dns/zone_checker.h /usr/include/kea/util/file_utilities.h /usr/include/kea/util/io/fd_share.h /usr/include/kea/dns/rdata_pimpl_holder.h /usr/include/kea/util/encode/binary_from_base16.h /usr/include/kea/util/filename.h /usr/include/kea/dns/rrset_collection.h /usr/include/kea/util/encode/binary_from_base32hex.h /usr/include/kea/dns/rdatafields.h /usr/include/kea/util/encode/base32hex_from_binary.h", added "/usr/include/kea/dns/char_strin
 g.h /usr/include/kea/d2srv/d2_zone.h /usr/include/kea/dns/time_utils.h /usr/include/kea/dhcp/option4_dnr.h /usr/include/kea/dhcp/option6_dnr.h /usr/include/kea/util/io.h /usr/include/kea/util/filesystem.h /usr/include/kea/dns/txt_like.h /usr/include/kea/d2srv/d2_update_message.h /usr/include/kea/config/cmd_response_creator_factory.h /usr/include/kea/util/str.h /usr/include/kea/d2srv/nc_trans.h /usr/include/kea/d2srv/d2_tsig_key.h /usr/include/kea/asiolink/io_service_mgr.h /usr/include/kea/dhcp/option_classless_static_route.h /usr/include/kea/util/chrono_time_utils.h /usr/include/kea/d2srv/d2_stats.h /usr/include/kea/util/encode/encode.h /usr/include/kea/config/cmd_response_creator.h /usr/include/kea/d2srv/dns_client.h /usr/include/kea/config/cmd_http_listener.h"
packages/core2-64-poky-linux/kea/kea-doc: PV changed from "2.4.1" to "2.6.0"
packages/core2-64-poky-linux/kea/kea-doc: PKGSIZE changed from 1322472 to 1343103 (+2%)
packages/core2-64-poky-linux/kea/kea-doc: PKGV changed from 2.4.1 [default] to 2.6.0 [default]
packages/core2-64-poky-linux/kea/kea-doc: FILELIST: removed "/usr/share/doc/kea/examples/kea6/dnr.json /usr/share/doc/kea/examples/kea4/dnr.json", added "/usr/share/doc/kea/SECURITY.md"
packages/core2-64-poky-linux/kea/kea-locale: PV changed from "2.4.1" to "2.6.0"
packages/core2-64-poky-linux/kea/kea-locale: PKGV changed from 2.4.1 [default] to 2.6.0 [default]
packages/core2-64-poky-linux/kea/kea-src: PV changed from "2.4.1" to "2.6.0"
packages/core2-64-poky-linux/kea/kea-src: PKGSIZE changed from 12450452 to 12453428 (+0%)
packages/core2-64-poky-linux/kea/kea-src: PKGV changed from 2.4.1 [default] to 2.6.0 [default]
packages/core2-64-poky-linux/kea/kea-src: FILELIST: directory renamed /usr/src/debug/kea/2.4.1/src/bin/dhcp6 -> /usr/src/debug/kea/2.6.0/src/bin/dhcp6, directory renamed /usr/src/debug/kea/2.4.1/src/lib/eval -> /usr/src/debug/kea/2.6.0/src/lib/eval, directory renamed /usr/src/debug/kea/2.4.1/src/bin/dhcp4 -> /usr/src/debug/kea/2.6.0/src/bin/dhcp4, directory renamed /usr/src/debug/kea/2.4.1/src/bin/lfc -> /usr/src/debug/kea/2.6.0/src/bin/lfc, directory renamed /usr/src/debug/kea/2.4.1/src/lib/d2srv -> /usr/src/debug/kea/2.6.0/src/lib/d2srv, directory renamed /usr/src/debug/kea/2.4.1/src/lib/tcp -> /usr/src/debug/kea/2.6.0/src/lib/tcp, directory renamed /usr/src/debug/kea/2.4.1/src/lib/stats -> /usr/src/debug/kea/2.6.0/src/lib/stats, directory renamed /usr/src/debug/kea/2.4.1/src/hooks/dhcp/flex_option -> /usr/src/debug/kea/2.6.0/src/hooks/dhcp/flex_option, directory renamed /usr/src/debug/kea/2.4.1/src/lib/exceptions -> /usr/src/debug/kea/2.6.0/src/lib/exceptions, directory renamed /u
 sr/src/debug/kea/2.4.1/src/lib/cryptolink -> /usr/src/debug/kea/2.6.0/src/lib/cryptolink, directory renamed /usr/src/debug/kea/2.4.1/src/lib/log/interprocess -> /usr/src/debug/kea/2.6.0/src/lib/log/interprocess, directory renamed /usr/src/debug/kea/2.4.1/src/lib/cc -> /usr/src/debug/kea/2.6.0/src/lib/cc, directory renamed /usr/src/debug/kea/2.4.1/src/hooks/dhcp/stat_cmds -> /usr/src/debug/kea/2.6.0/src/hooks/dhcp/stat_cmds, directory renamed /usr/src/debug/kea/2.4.1/src/lib/config_backend -> /usr/src/debug/kea/2.6.0/src/lib/config_backend, directory renamed /usr/src/debug/kea/2.4.1/src/lib/dhcpsrv -> /usr/src/debug/kea/2.6.0/src/lib/dhcpsrv, directory renamed /usr/src/debug/kea/2.4.1/src/lib/config -> /usr/src/debug/kea/2.6.0/src/lib/config, directory renamed /usr/src/debug/kea/2.4.1/src/lib/database -> /usr/src/debug/kea/2.6.0/src/lib/database, directory renamed /usr/src/debug/kea/2.4.1/src/lib/asiodns -> /usr/src/debug/kea/2.6.0/src/lib/asiodns, directory renamed /usr/src/debug/ke
 a/2.4.1/src/hooks/dhcp/run_script -> /usr/src/debug/kea/2.6.0/src/hooks/dhcp/run_script, directory renamed /usr/src/debug/kea/2.4.1/src/hooks/dhcp/bootp -> /usr/src/debug/kea/2.6.0/src/hooks/dhcp/bootp, directory renamed /usr/src/debug/kea/2.4.1/src/lib/dhcp_ddns -> /usr/src/debug/kea/2.6.0/src/lib/dhcp_ddns, directory renamed /usr/src/debug/kea/2.4.1/src/lib/dhcpsrv/parsers -> /usr/src/debug/kea/2.6.0/src/lib/dhcpsrv/parsers, directory renamed /usr/src/debug/kea/2.4.1/src/hooks/dhcp/lease_cmds -> /usr/src/debug/kea/2.6.0/src/hooks/dhcp/lease_cmds, directory renamed /usr/src/debug/kea/2.4.1/src/lib/process/cfgrpt -> /usr/src/debug/kea/2.6.0/src/lib/process/cfgrpt, directory renamed /usr/src/debug/kea/2.4.1/src/lib/hooks -> /usr/src/debug/kea/2.6.0/src/lib/hooks, directory renamed /usr/src/debug/kea/2.4.1/src/lib/process -> /usr/src/debug/kea/2.6.0/src/lib/process, directory renamed /usr/src/debug/kea/2.4.1/src/lib/http -> /usr/src/debug/kea/2.6.0/src/lib/http, directory renamed /usr
 /src/debug/kea/2.4.1/src/lib/log -> /usr/src/debug/kea/2.6.0/src/lib/log, directory renamed /usr/src/debug/kea/2.4.1/src/bin/agent -> /usr/src/debug/kea/2.6.0/src/bin/agent, removed "/usr/src/debug/kea/2.4.1/src/lib/dns/qid_gen.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt4o6.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt_filter.h /usr/src/debug/kea/2.4.1/src/lib/util/optional.h /usr/src/debug/kea/2.4.1/src/lib/util/watch_socket.cc /usr/src/debug/kea/2.4.1/src/lib/util/watched_thread.h /usr/src/debug/kea/2.4.1/src/bin/d2/location.hh /usr/src/debug/kea/2.4.1/src/lib/util/triplet.h /usr/src/debug/kea/2.4.1/src/lib/util/thread_pool.h /usr/src/debug/kea/2.4.1/src/lib/dns/rrttl.cc /usr/src/debug/kea/2.4.1/src/lib/dns/tsigerror.h /usr/src/debug/kea/2.4.1/src/lib/util/dhcp_space.cc /usr/src/debug/kea/2.4.1/src/lib/dns/opcode.cc /usr/src/debug/kea/2.4.1/src/lib/util/encode/binary_from_base32hex.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/common_tls.h /usr/src/debug/kea/2.4.1/src/lib/util/buffer
 .h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_log.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_status_code.h /usr/src/debug/kea/2.4.1/src/lib/dns/zone_checker.cc /usr/src/debug/kea/2.4.1/src/bin/d2/d2_lexer.ll /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/communication_state.cc /usr/src/debug/kea/2.4.1/src/lib/util/strutil.h /usr/src/debug/kea/2.4.1/src/lib/dns/master_lexer.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/version.cc /usr/src/debug/kea/2.4.1/src/lib/util/chrono_time_utils.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/tcp_socket.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/tls_socket.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/udp_socket.h /usr/src/debug/kea/2.4.1/src/lib/dns/serial.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/iface_mgr_linux.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/opaque_data_tuple.cc /usr/src/debug/kea/2.4.1/src/lib/dns/exceptions.cc /usr/src/debug/kea/2.4.1/src/lib/dns/dns_fwd.h /usr/src/debug/kea/2.4.1/src/lib
 /util/pid_file.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/packet_queue.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_address.cc /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_service.h /usr/src/debug/kea/2.4.1/src/lib/dns/master_loader.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_auth.cc /usr/src/debug/kea/2.4.1/src/lib/util/stopwatch_impl.cc /usr/src/debug/kea/2.4.1/src/lib/dns/exceptions.h /usr/src/debug/kea/2.4.1/src/bin/d2/d2_process.cc /usr/src/debug/kea/2.4.1/src/lib/util/reconnect_ctl.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_vendor.cc /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_service_states.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_pdexclude.h /usr/src/debug/kea/2.4.1/src/lib/dns/rrset.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rdata/generic/detail/char_string.h /usr/src/debug/kea/2.4.1/src/lib/dns/rdata/generic/detail/nsec3param_common.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option4_addrlst.cc /usr/src/debug/kea/2.4.1/src/lib/dh
 cp/option6_addrlst.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rcode.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rdata.cc /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/command_creator.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_opaque_data_tuples.h /usr/src/debug/kea/2.4.1/src/lib/dns/serial.cc /usr/src/debug/kea/2.4.1/src/lib/util/boost_time_utils.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/interval_timer.cc /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_config_parser.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/unix_domain_socket_acceptor.h /usr/src/debug/kea/2.4.1/src/lib/util/encode/base16_from_binary.h /usr/src/debug/kea/2.4.1/src/lib/util/csv_file.cc /usr/src/debug/kea/2.4.1/src/lib/dns/messagerenderer.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/packet_queue_mgr6.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/packet_queue_mgr4.cc /usr/src/debug/kea/2.4.1/src/bin/d2/simple_remove.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/protocol_util.cc /usr/src/debug/kea/2.4.1/src
 /bin/d2/d2_parser.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/duid_factory.h /usr/src/debug/kea/2.4.1/src/lib/dns/tsigkey.cc /usr/src/debug/kea/2.4.1/src/lib/util/time_utilities.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/packet_queue_mgr.h /usr/src/debug/kea/2.4.1/src/lib/util/encode/hex.h /usr/src/debug/kea/2.4.1/src/lib/util/pid_file.h /usr/src/debug/kea/2.4.1/src/lib/util/bigints.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_service.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option4_client_fqdn.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_client_fqdn.h /usr/src/debug/kea/2.4.1/src/lib/dns/messagerenderer.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_socket.h /usr/src/debug/kea/2.4.1/src/lib/util/io/fd.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_service_thread_pool.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_vendor_class.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/dhcp4.h /usr/src/debug/kea/2.4.1/src/lib/util/encode
 /base_n.cc /usr/src/debug/kea/2.4.1/src/lib/util/encode/binary_from_base16.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/query_filter.h /usr/src/debug/kea/2.4.1/src/bin/d2/simple_add.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_custom.h /usr/src/debug/kea/2.4.1/src/lib/dns/master_lexer.cc /usr/src/debug/kea/2.4.1/src/lib/util/multi_threading_mgr.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_vendor_class.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt6.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt4.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt_filter.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_vendor.h /usr/src/debug/kea/2.4.1/src/lib/util/filename.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/command_creator.h /usr/src/debug/kea/2.4.1/src/bin/d2/nc_add.h /usr/src/debug/kea/2.4.1/src/lib/util/time_utilities.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_definition.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_messages.h /usr/src/debug/kea
 /2.4.1/src/lib/asiolink/io_endpoint.cc /usr/src/debug/kea/2.4.1/src/lib/dns/masterload.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rrset_collection.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/classify.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_callouts.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rdata/generic/detail/nsec3param_common.cc /usr/src/debug/kea/2.4.1/src/lib/dns/zone_checker.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_impl.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt_filter_inet6.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_opaque_data_tuples.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/socket_info.h /usr/src/debug/kea/2.4.1/src/lib/dns/edns.cc /usr/src/debug/kea/2.4.1/src/lib/util/encode/base32hex_from_binary.h /usr/src/debug/kea/2.4.1/src/lib/util/io/socketsession.cc /usr/src/debug/kea/2.4.1/src/bin/d2/d2_queue_mgr.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/dhcp6.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_data_types.cc /usr/src/debug/kea/2.4.1
 /src/lib/dns/rdata/generic/detail/char_string.cc /usr/src/debug/kea/2.4.1/src/lib/util/chrono_time_utils.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_socket.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/std_option_defs.h /usr/src/debug/kea/2.4.1/src/lib/util/state_model.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rrset_collection_base.h /usr/src/debug/kea/2.4.1/src/lib/util/unlock_guard.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_acceptor.h /usr/src/debug/kea/2.4.1/src/lib/dns/tsigrecord.cc /usr/src/debug/kea/2.4.1/src/lib/dns/message.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/unix_domain_socket_endpoint.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/docsis3_option_defs.h /usr/src/debug/kea/2.4.1/src/lib/util/labeled_value.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/unix_domain_socket.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_service.h /usr/src/debug/kea/2.4.1/src/lib/dns/tsig.h /usr/src/debug/kea/2.4.1/src/lib/dns/rdata.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_status_code.cc /u
 sr/src/debug/kea/2.4.1/src/lib/dns/rrclass.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_service.cc /usr/src/debug/kea/2.4.1/src/lib/dns/master_loader_callbacks.h /usr/src/debug/kea/2.4.1/src/lib/dns/nsec3hash.cc /usr/src/debug/kea/2.4.1/src/lib/util/io/sockaddr_util.h /usr/src/debug/kea/2.4.1/src/lib/dns/master_loader.h /usr/src/debug/kea/2.4.1/src/lib/dns/name.h /usr/src/debug/kea/2.4.1/src/lib/dns/rdata_pimpl_holder.h /usr/src/debug/kea/2.4.1/src/lib/dns/rrparamregistry.cc /usr/src/debug/kea/2.4.1/src/lib/util/watch_socket.h /usr/src/debug/kea/2.4.1/src/lib/dns/rrtype.cc /usr/src/debug/kea/2.4.1/src/lib/util/state_model.h /usr/src/debug/kea/2.4.1/src/lib/util/stopwatch_impl.h /usr/src/debug/kea/2.4.1/src/lib/dns/message.h /usr/src/debug/kea/2.4.1/src/bin/d2/d2_lexer.cc /usr/src/debug/kea/2.4.1/src/lib/dns/edns.h /usr/src/debug/kea/2.4.1/src/bin/d2/d2_update_mgr.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option4_client_fqdn.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_client_fq
 dn.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_error.h /usr/src/debug/kea/2.4.1/src/lib/util/stopwatch.cc /usr/src/debug/kea/2.4.1/src/lib/dns/tsig.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/interval_timer.h /usr/src/debug/kea/2.4.1/src/lib/dns/masterload.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_pdexclude.cc /usr/src/debug/kea/2.4.1/src/lib/util/strutil.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/duid_factory.cc /usr/src/debug/kea/2.4.1/src/bin/d2/d2_parser.yy /usr/src/debug/kea/2.4.1/src/lib/dns/rdata/generic/detail/lexer_util.h /usr/src/debug/kea/2.4.1/src/lib/dns/labelsequence.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/process_spawn.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_ia.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rdatafields.cc /usr/src/debug/kea/2.4.1/src/lib/util/encode/base32hex.h /usr/src/debug/kea/2.4.1/src/lib/dns/opcode.h /usr/src/debug/kea/2.4.1/src/lib/util/encode/base64.h /usr/src/debug/kea/2.4.1/src/lib/util/reconnect_ctl.h /usr/src/debug/kea/2.4.
 1/src/lib/dhcp/option4_dnr.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_dnr.h /usr/src/debug/kea/2.4.1/src/lib/util/stopwatch.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_string.cc /usr/src/debug/kea/2.4.1/src/bin/d2/d2_controller.cc /usr/src/debug/kea/2.4.1/src/lib/util/boost_time_utils.h /usr/src/debug/kea/2.4.1/src/bin/d2/main.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_space.h /usr/src/debug/kea/2.4.1/src/bin/d2/nc_remove.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_iaprefix.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_config.h /usr/src/debug/kea/2.4.1/src/lib/util/file_utilities.cc /usr/src/debug/kea/2.4.1/src/bin/d2/d2_parser.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/tcp_endpoint.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/udp_endpoint.h /usr/src/debug/kea/2.4.1/src/lib/util/readwrite_mutex.h /usr/src/debug/kea/2.4.1/src/lib/util/filename.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/openssl_tls.h 
 /usr/src/debug/kea/2.4.1/src/lib/util/io/socketsession.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt_filter_inet.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rrcollator.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rdata/generic/detail/ds_like.h /usr/src/debug/kea/2.4.1/src/lib/util/file_utilities.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_service_thread_pool.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/tcp_acceptor.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/tls_acceptor.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_data_types.h /usr/src/debug/kea/2.4.1/src/lib/dns/rdata/generic/detail/nsec_bitmap.h /usr/src/debug/kea/2.4.1/src/lib/util/memory_segment_local.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/duid.cc /usr/src/debug/kea/2.4.1/src/bin/d2/d2_controller.h /usr/src/debug/kea/2.4.1/src/lib/dns/tsigkey.h /usr/src/debug/kea/2.4.1/src/lib/dns/rdata/generic/detail/nsec_bitmap.cc /usr/src/debug/kea/2.4.1/src/lib/dns/question.cc /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_config_pa
 rser.h /usr/src/debug/kea/2.4.1/src/lib/util/encode/utf8.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_int_array.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt_filter6.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_address.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/opaque_data_tuple.h /usr/src/debug/kea/2.4.1/src/lib/dns/qid_gen.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/packet_queue_mgr4.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/packet_queue_mgr6.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_service_states.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/packet_queue_ring.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/addr_utilities.h /usr/src/debug/kea/2.4.1/src/lib/dns/name.cc /usr/src/debug/kea/2.4.1/src/lib/dns/labelsequence.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/unix_domain_socket.h /usr/src/debug/kea/2.4.1/src/lib/util/io/fd_share.h /usr/src/debug/kea/2.4.1/src/lib/util/io/fd_share.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt4o6.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/duid.
 h /usr/src/debug/kea/2.4.1/src/lib/dns/nsec3hash.h /usr/src/debug/kea/2.4.1/src/lib/dns/rrclass.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt_filter_lpf.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/lease_update_backlog.h /usr/src/debug/kea/2.4.1/src/bin/d2/d2_update_mgr.cc /usr/src/debug/kea/2.4.1/src/bin/d2/simple_add.cc /usr/src/debug/kea/2.4.1/src/lib/util/memory_segment.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_space_container.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/process_spawn.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_ia.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_int.h /usr/src/debug/kea/2.4.1/src/lib/dns/rdatafields.h /usr/src/debug/kea/2.4.1/src/lib/dns/name_internal.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_iaprefix.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt_filter_lpf.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option4_dnr.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_dnr.cc /usr/src/debug/kea/2.4.1/src/lib/dns/master_loader_callbac
 ks.cc /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_config.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_endpoint.h /usr/src/debug/kea/2.4.1/src/lib/util/range_utilities.h /usr/src/debug/kea/2.4.1/src/lib/util/staged_value.h /usr/src/debug/kea/2.4.1/src/lib/util/pointer_util.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_messages.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/libdhcp++.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt_filter_inet6.h /usr/src/debug/kea/2.4.1/src/lib/util/multi_threading_mgr.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_auth.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_service_signal.cc /usr/src/debug/kea/2.4.1/src/lib/util/versioned_csv_file.cc /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_server_type.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/communication_state.h /usr/src/debug/kea/2.4.1/src/lib/dns/tsigerror.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_iaaddr.cc /usr/src/debug/kea/2.4.1/
 src/lib/dns/rdataclass.cc /usr/src/debug/kea/2.4.1/src/bin/d2/d2_queue_mgr.h /usr/src/debug/kea/2.4.1/src/lib/util/versioned_csv_file.h /usr/src/debug/kea/2.4.1/src/bin/d2/parser_context.cc /usr/src/debug/kea/2.4.1/src/lib/util/dhcp_space.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt4.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/protocol_util.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/hwaddr.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_iaaddr.h /usr/src/debug/kea/2.4.1/src/lib/dns/rdata/generic/detail/txt_like.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt6.cc /usr/src/debug/kea/2.4.1/src/bin/d2/nc_add.cc /usr/src/debug/kea/2.4.1/src/lib/util/io/fd.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_asio_socket.h /usr/src/debug/kea/2.4.1/src/bin/d2/parser_context.h /usr/src/debug/kea/2.4.1/src/lib/util/io_utilities.h /usr/src/debug/kea/2.4.1/src/lib/util/csv_file.h /usr/src/debug/kea/2.4.1/src/lib/dns/rcode.h /usr/src/debug/kea/2.4.1/src/lib/dns/rrparamregistry.h /usr/src/debug/kea/2.4.1/src/bin
 /d2/nc_remove.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_space.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/classify.cc /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_impl.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/iface_mgr.h /usr/src/debug/kea/2.4.1/src/lib/dns/rrttl.h /usr/src/debug/kea/2.4.1/src/lib/util/encode/utf8.h /usr/src/debug/kea/2.4.1/src/lib/util/io/pktinfo_utilities.h /usr/src/debug/kea/2.4.1/src/bin/d2/d2_process.h /usr/src/debug/kea/2.4.1/src/lib/dns/question.h /usr/src/debug/kea/2.4.1/src/bin/d2/simple_remove.h /usr/src/debug/kea/2.4.1/src/lib/dns/rrset_collection.cc /usr/src/debug/kea/2.4.1/src/lib/util/memory_segment_local.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/libdhcp++.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_definition.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/common_tls.cc /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/ha_log.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt.cc /usr/src/
 debug/kea/2.4.1/src/lib/dns/master_lexer_inputsource.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option4_addrlst.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option6_addrlst.h /usr/src/debug/kea/2.4.1/src/lib/dns/tsigrecord.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_custom.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rrcollator.h /usr/src/debug/kea/2.4.1/src/lib/asiolink/openssl_tls.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/hwaddr.h /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/lease_update_backlog.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/option_string.h /usr/src/debug/kea/2.4.1/src/lib/dns/master_lexer_state.h /usr/src/debug/kea/2.4.1/src/lib/dns/rrset.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt_filter_inet.h /usr/src/debug/kea/2.4.1/src/lib/util/watched_thread.cc /usr/src/debug/kea/2.4.1/src/hooks/dhcp/high_availability/query_filter.cc /usr/src/debug/kea/2.4.1/src/lib/util/labeled_value.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/addr_utilities.cc /usr/src/debug/kea/2.4.1/src/li
 b/dns/rrtype.h /usr/src/debug/kea/2.4.1/src/lib/dhcp/pkt_filter6.cc /usr/src/debug/kea/2.4.1/src/lib/dhcp/iface_mgr.cc /usr/src/debug/kea/2.4.1/src/lib/asiolink/io_service_signal.h /usr/src/debug/kea/2.4.1/src/lib/dns/master_lexer_inputsource.cc /usr/src/debug/kea/2.4.1/src/lib/dns/rdataclass.h", added "/usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt4o6.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt_filter.h /usr/src/debug/kea/2.6.0/src/lib/util/optional.h /usr/src/debug/kea/2.6.0/src/lib/util/watch_socket.cc /usr/src/debug/kea/2.6.0/src/lib/util/watched_thread.h /usr/src/debug/kea/2.6.0/src/bin/d2/location.hh /usr/src/debug/kea/2.6.0/src/lib/util/triplet.h /usr/src/debug/kea/2.6.0/src/lib/util/thread_pool.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/alarm.h /usr/src/debug/kea/2.6.0/src/lib/dns/rrttl.cc /usr/src/debug/kea/2.6.0/src/lib/dns/tsigerror.h /usr/src/debug/kea/2.6.0/src/lib/util/dhcp_space.cc /usr/src/debug/kea/2.6.0/src/lib/dns/opcode.cc /usr/src/debug/kea/2.6.0/src/lib/asio
 link/common_tls.h /usr/src/debug/kea/2.6.0/src/lib/util/buffer.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_log.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_status_code.h /usr/src/debug/kea/2.6.0/src/bin/d2/d2_lexer.ll /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/lease_sync_filter.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/communication_state.cc /usr/src/debug/kea/2.6.0/src/lib/dns/char_string.cc /usr/src/debug/kea/2.6.0/src/lib/dns/master_lexer.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/version.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/monitored_duration.h /usr/src/debug/kea/2.6.0/src/lib/util/chrono_time_utils.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/tcp_socket.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/tls_socket.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/udp_socket.h /usr/src/debug/kea/2.6.0/src/lib/dns/serial.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/iface_mgr_linux.cc /usr/src/debug/kea/2.6.0/src
 /lib/dhcp/opaque_data_tuple.cc /usr/src/debug/kea/2.6.0/src/lib/dns/exceptions.cc /usr/src/debug/kea/2.6.0/src/bin/d2/check_exists_add.cc /usr/src/debug/kea/2.6.0/src/bin/d2/simple_add_without_dhcid.h /usr/src/debug/kea/2.6.0/src/lib/util/pid_file.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/packet_queue.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_address.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_service.h /usr/src/debug/kea/2.6.0/src/lib/dns/master_loader.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_auth.cc /usr/src/debug/kea/2.6.0/src/lib/util/stopwatch_impl.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/alarm.cc /usr/src/debug/kea/2.6.0/src/lib/dns/exceptions.h /usr/src/debug/kea/2.6.0/src/bin/d2/d2_process.cc /usr/src/debug/kea/2.6.0/src/lib/util/reconnect_ctl.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_vendor.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_service_states.cc /usr/src/debug/kea/2.6.0/src/lib/util/str.h /usr/src/deb
 ug/kea/2.6.0/src/lib/dhcp/option6_pdexclude.h /usr/src/debug/kea/2.6.0/src/lib/dns/rrset.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option4_addrlst.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_addrlst.cc /usr/src/debug/kea/2.6.0/src/lib/dns/rcode.cc /usr/src/debug/kea/2.6.0/src/lib/dns/rdata.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/command_creator.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_opaque_data_tuples.h /usr/src/debug/kea/2.6.0/src/lib/dns/serial.cc /usr/src/debug/kea/2.6.0/src/lib/util/boost_time_utils.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/interval_timer.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_config_parser.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/unix_domain_socket_acceptor.h /usr/src/debug/kea/2.6.0/src/bin/d2/check_exists_add.h /usr/src/debug/kea/2.6.0/src/lib/util/csv_file.cc /usr/src/debug/kea/2.6.0/src/lib/dns/messagerenderer.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/packet_queue_mgr4.cc /usr/src/debug/kea/2.6
 .0/src/lib/dhcp/packet_queue_mgr6.cc /usr/src/debug/kea/2.6.0/src/bin/d2/simple_remove.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/perfmon_log.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/protocol_util.cc /usr/src/debug/kea/2.6.0/src/bin/d2/d2_parser.cc /usr/src/debug/kea/2.6.0/src/lib/util/io.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/duid_factory.h /usr/src/debug/kea/2.6.0/src/lib/dns/tsigkey.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/packet_queue_mgr.h /usr/src/debug/kea/2.6.0/src/lib/util/pid_file.h /usr/src/debug/kea/2.6.0/src/lib/util/bigints.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/monitored_duration_store.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_service.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/version.cc /usr/src/debug/kea/2.6.0/src/lib/dns/time_utils.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option4_client_fqdn.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_client_fqdn.h /usr/src/debug/kea/2.6.0/src/lib/dns/messagerenderer.cc /usr/src/d
 ebug/kea/2.6.0/src/lib/asiolink/io_socket.h /usr/src/debug/kea/2.6.0/src/lib/util/io/fd.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_service_thread_pool.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_vendor_class.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/lease_sync_filter.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/dhcp4.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/query_filter.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/perfmon_config.cc /usr/src/debug/kea/2.6.0/src/bin/d2/simple_add.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/monitored_duration.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_custom.h /usr/src/debug/kea/2.6.0/src/lib/dns/master_lexer.cc /usr/src/debug/kea/2.6.0/src/lib/util/multi_threading_mgr.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_vendor_class.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt6.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt4.h /usr/src/debug/kea/2.6.0/src/h
 ooks/dhcp/perfmon/perfmon_messages.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/perfmon_log.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt_filter.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_vendor.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/command_creator.h /usr/src/debug/kea/2.6.0/src/bin/d2/nc_add.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_definition.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_messages.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_endpoint.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/classify.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_callouts.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_impl.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt_filter_inet6.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_opaque_data_tuples.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/socket_info.h /usr/src/debug/kea/2.6.0/src/lib/dns/edns.cc /usr/src/debug/kea/2.6.0/src/bin/d2/d2_queue_mgr.cc /usr/src/debug/kea/
 2.6.0/src/lib/dhcp/dhcp6.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_data_types.cc /usr/src/debug/kea/2.6.0/src/lib/util/chrono_time_utils.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_socket.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/std_option_defs.h /usr/src/debug/kea/2.6.0/src/lib/util/state_model.cc /usr/src/debug/kea/2.6.0/src/lib/util/unlock_guard.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_acceptor.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/perfmon_config.h /usr/src/debug/kea/2.6.0/src/lib/dns/tsigrecord.cc /usr/src/debug/kea/2.6.0/src/lib/dns/message.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/unix_domain_socket_endpoint.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/docsis3_option_defs.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/perfmon_callouts.cc /usr/src/debug/kea/2.6.0/src/lib/util/labeled_value.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/unix_domain_socket.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_service.h /usr/src/debug/kea/2.6.0/src/lib/dns/tsig.h
  /usr/src/debug/kea/2.6.0/src/bin/d2/simple_remove_without_dhcid.h /usr/src/debug/kea/2.6.0/src/lib/dns/rdata.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_status_code.cc /usr/src/debug/kea/2.6.0/src/lib/dns/rrclass.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_service.cc /usr/src/debug/kea/2.6.0/src/lib/dns/master_loader_callbacks.h /usr/src/debug/kea/2.6.0/src/lib/util/encode/encode.cc /usr/src/debug/kea/2.6.0/src/lib/util/io/sockaddr_util.h /usr/src/debug/kea/2.6.0/src/lib/dns/master_loader.h /usr/src/debug/kea/2.6.0/src/lib/dns/name.h /usr/src/debug/kea/2.6.0/src/lib/dns/rrparamregistry.cc /usr/src/debug/kea/2.6.0/src/lib/util/watch_socket.h /usr/src/debug/kea/2.6.0/src/lib/dns/rrtype.cc /usr/src/debug/kea/2.6.0/src/lib/util/state_model.h /usr/src/debug/kea/2.6.0/src/lib/util/stopwatch_impl.h /usr/src/debug/kea/2.6.0/src/lib/dns/message.h /usr/src/debug/kea/2.6.0/src/bin/d2/d2_lexer.cc /usr/src/debug/kea/2.6.0/src/lib/dns/edns.h /usr/src/debug/kea/2.6.0/src/bin/d2/d2_update_
 mgr.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option4_client_fqdn.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_client_fqdn.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_error.h /usr/src/debug/kea/2.6.0/src/lib/util/stopwatch.cc /usr/src/debug/kea/2.6.0/src/lib/dns/tsig.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/interval_timer.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_pdexclude.cc /usr/src/debug/kea/2.6.0/src/lib/dns/time_utils.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/duid_factory.cc /usr/src/debug/kea/2.6.0/src/bin/d2/d2_parser.yy /usr/src/debug/kea/2.6.0/src/lib/dns/labelsequence.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/process_spawn.cc /usr/src/debug/kea/2.6.0/src/bin/d2/check_exists_remove.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_ia.cc /usr/src/debug/kea/2.6.0/src/lib/dns/opcode.h /usr/src/debug/kea/2.6.0/src/lib/util/reconnect_ctl.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option4_dnr.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_dnr.h /usr/src/debug/kea/2.
 6.0/src/lib/util/stopwatch.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_string.cc /usr/src/debug/kea/2.6.0/src/bin/d2/d2_controller.cc /usr/src/debug/kea/2.6.0/src/lib/util/boost_time_utils.h /usr/src/debug/kea/2.6.0/src/bin/d2/main.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_space.h /usr/src/debug/kea/2.6.0/src/bin/d2/nc_remove.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_iaprefix.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_config.h /usr/src/debug/kea/2.6.0/src/bin/d2/d2_parser.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/tcp_endpoint.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/udp_endpoint.h /usr/src/debug/kea/2.6.0/src/lib/util/filesystem.cc /usr/src/debug/kea/2.6.0/src/lib/util/readwrite_mutex.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/openssl_tls.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt_filter_inet.cc /usr/src/debug/kea/2.6.0/src/bin/d2/check_exists_remove.h /usr/src/debug/kea/2.6.0/src/lib/asiolink
 /io_service_thread_pool.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/tcp_acceptor.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/tls_acceptor.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_data_types.h /usr/src/debug/kea/2.6.0/src/lib/util/memory_segment_local.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/duid.cc /usr/src/debug/kea/2.6.0/src/bin/d2/d2_controller.h /usr/src/debug/kea/2.6.0/src/lib/dns/tsigkey.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/alarm_store.cc /usr/src/debug/kea/2.6.0/src/lib/dns/question.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_config_parser.h /usr/src/debug/kea/2.6.0/src/lib/util/encode/utf8.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_int_array.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt_filter6.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_address.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/opaque_data_tuple.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/packet_queue_mgr4.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/packet_queue_mgr6.h /usr/src/debu
 g/kea/2.6.0/src/hooks/dhcp/high_availability/ha_service_states.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/packet_queue_ring.h /usr/src/debug/kea/2.6.0/src/bin/d2/simple_add_without_dhcid.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/addr_utilities.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_service_mgr.h /usr/src/debug/kea/2.6.0/src/lib/dns/name.cc /usr/src/debug/kea/2.6.0/src/lib/dns/labelsequence.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/unix_domain_socket.h /usr/src/debug/kea/2.6.0/src/bin/d2/simple_remove_without_dhcid.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt4o6.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/duid.h /usr/src/debug/kea/2.6.0/src/lib/dns/rrclass.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt_filter_lpf.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/lease_update_backlog.h /usr/src/debug/kea/2.6.0/src/bin/d2/d2_update_mgr.cc /usr/src/debug/kea/2.6.0/src/bin/d2/simple_add.cc /usr/src/debug/kea/2.6.0/src/lib/util/memory_segment.h /usr/src/debug/kea/2.6.0/src/li
 b/util/encode/encode.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_space_container.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/process_spawn.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_ia.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_int.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_relationship_mapper.h /usr/src/debug/kea/2.6.0/src/lib/dns/name_internal.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_iaprefix.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt_filter_lpf.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option4_dnr.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_dnr.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/perfmon_mgr.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/perfmon_messages.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_config.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_endpoint.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_classless_static_route.h /usr/src/debug/kea/2.6.0/src/lib/util/range_utilities.h /usr/src/de
 bug/kea/2.6.0/src/lib/util/staged_value.h /usr/src/debug/kea/2.6.0/src/lib/util/pointer_util.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/perfmon_mgr.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_messages.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/libdhcp++.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt_filter_inet6.h /usr/src/debug/kea/2.6.0/src/lib/util/multi_threading_mgr.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_auth.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_service_signal.cc /usr/src/debug/kea/2.6.0/src/lib/util/versioned_csv_file.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_server_type.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/communication_state.h /usr/src/debug/kea/2.6.0/src/lib/dns/tsigerror.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_iaaddr.cc /usr/src/debug/kea/2.6.0/src/lib/dns/rdataclass.cc /usr/src/debug/kea/2.6.0/src/bin/d2/d2_queue_mgr.h /usr/src/debug/kea/2.6.0/src/lib/util/versioned_csv_file.h /u
 sr/src/debug/kea/2.6.0/src/lib/util/str.cc /usr/src/debug/kea/2.6.0/src/bin/d2/parser_context.cc /usr/src/debug/kea/2.6.0/src/lib/util/dhcp_space.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt4.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/protocol_util.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/hwaddr.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_iaaddr.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt6.cc /usr/src/debug/kea/2.6.0/src/bin/d2/nc_add.cc /usr/src/debug/kea/2.6.0/src/lib/util/io/fd.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_asio_socket.h /usr/src/debug/kea/2.6.0/src/bin/d2/parser_context.h /usr/src/debug/kea/2.6.0/src/lib/util/csv_file.h /usr/src/debug/kea/2.6.0/src/lib/dns/rcode.h /usr/src/debug/kea/2.6.0/src/lib/dns/rrparamregistry.h /usr/src/debug/kea/2.6.0/src/lib/dns/char_string.h /usr/src/debug/kea/2.6.0/src/bin/d2/nc_remove.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_space.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/classify.cc 
 /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_impl.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/iface_mgr.h /usr/src/debug/kea/2.6.0/src/lib/dns/rrttl.h /usr/src/debug/kea/2.6.0/src/lib/util/encode/utf8.h /usr/src/debug/kea/2.6.0/src/lib/util/io/pktinfo_utilities.h /usr/src/debug/kea/2.6.0/src/bin/d2/d2_process.h /usr/src/debug/kea/2.6.0/src/lib/dns/question.h /usr/src/debug/kea/2.6.0/src/bin/d2/simple_remove.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/monitored_duration_store.cc /usr/src/debug/kea/2.6.0/src/lib/util/memory_segment_local.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/libdhcp++.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_definition.cc /usr/src/debug/kea/2.6.0/src/lib/util/filesystem.h /usr/src/debug/kea/2.6.0/src/lib/asiolink/common_tls.cc /usr/src/debug/kea/2.6.0/src/lib/dns/txt_like.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/ha_log.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/perfmon/alarm_store.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/
 pkt.cc /usr/src/debug/kea/2.6.0/src/lib/dns/master_lexer_inputsource.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option4_addrlst.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option6_addrlst.h /usr/src/debug/kea/2.6.0/src/lib/dns/tsigrecord.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_custom.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/openssl_tls.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/hwaddr.h /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/lease_update_backlog.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_string.h /usr/src/debug/kea/2.6.0/src/lib/dns/master_lexer_state.h /usr/src/debug/kea/2.6.0/src/lib/dns/rrset.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/pkt_filter_inet.h /usr/src/debug/kea/2.6.0/src/lib/util/watched_thread.cc /usr/src/debug/kea/2.6.0/src/hooks/dhcp/high_availability/query_filter.cc /usr/src/debug/kea/2.6.0/src/lib/util/labeled_value.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/addr_utilities.cc /usr/src/debug/kea/2.6.0/src/lib/dns/rrtype.h /usr/src/debug/kea/
 2.6.0/src/lib/dhcp/pkt_filter6.cc /usr/src/debug/kea/2.6.0/src/lib/dhcp/iface_mgr.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_service_mgr.cc /usr/src/debug/kea/2.6.0/src/lib/asiolink/io_service_signal.h /usr/src/debug/kea/2.6.0/src/lib/dhcp/option_classless_static_route.cc /usr/src/debug/kea/2.6.0/src/lib/dns/master_lexer_inputsource.cc /usr/src/debug/kea/2.6.0/src/lib/dns/rdataclass.h"
packages/core2-64-poky-linux/kea/kea-staticdev: PV changed from "2.4.1" to "2.6.0"
packages/core2-64-poky-linux/kea/kea-staticdev: PKGV changed from 2.4.1 [default] to 2.6.0 [default]
packages/core2-64-poky-linux/kea/kea: PV changed from "2.4.1" to "2.6.0"
packages/core2-64-poky-linux/kea/kea: PKGSIZE changed from 19750583 to 20070912 (+2%)
packages/core2-64-poky-linux/kea/kea: PKGV changed from 2.4.1 [default] to 2.6.0 [default]
packages/core2-64-poky-linux/kea/kea: FILELIST: removed "/usr/lib/libkea-eval.so.52 /usr/lib/libkea-stats.so.29 /usr/lib/libkea-exceptions.so.23 /usr/lib/libkea-cc.so.54.0.0 /usr/lib/libkea-exceptions.so.23.0.0 /usr/lib/libkea-database.so.48 /usr/lib/libkea-dhcp++.so.74.0.0 /usr/lib/libkea-cfgclient.so.51 /usr/lib/libkea-asiolink.so.56.0.0 /usr/lib/libkea-process.so.57.0.0 /usr/lib/libkea-stats.so.29.0.0 /usr/lib/libkea-dhcp++.so.74 /usr/lib/libkea-d2srv.so.30 /usr/lib/libkea-hooks.so.78 /usr/share/kea/api/libreload.json /usr/lib/libkea-process.so.57 /usr/lib/libkea-util.so.68 /usr/lib/libkea-dhcpsrv.so.90 /usr/lib/libkea-log.so.48.0.0 /usr/lib/libkea-dns++.so.42.0.0 /usr/lib/libkea-http.so.56 /usr/lib/libkea-database.so.48.0.0 /usr/lib/libkea-asiodns.so.35.0.0 /usr/lib/libkea-cfgclient.so.51.0.0 /usr/lib/libkea-dhcp_ddns.so.41.0.0 /usr/lib/libkea-util.so.68.0.0 /usr/lib/libkea-eval.so.52.0.0 /usr/lib/libkea-asiolink.so.56 /usr/lib/libkea-tcp.so.5.0.0 /usr/lib/libkea-cryptolink.so.38
  /usr/lib/libkea-cryptolink.so.38.0.0 /usr/lib/libkea-d2srv.so.30.0.0 /usr/lib/libkea-hooks.so.78.0.0 /usr/lib/libkea-cc.so.54 /usr/lib/libkea-asiodns.so.35 /usr/lib/libkea-dhcp_ddns.so.41 /usr/lib/libkea-log.so.48 /usr/lib/libkea-dns++.so.42 /usr/lib/libkea-http.so.56.0.0 /usr/lib/libkea-dhcpsrv.so.90.0.0 /usr/lib/libkea-tcp.so.5", added "/usr/lib/libkea-eval.so.69.0.0 /usr/lib/libkea-util.so.84.0.0 /usr/lib/libkea-database.so.61 /usr/lib/libkea-tcp.so.18.0.0 /usr/lib/libkea-cc.so.68.0.0 /usr/lib/libkea-exceptions.so.33.0.0 /usr/lib/kea/hooks/libdhcp_perfmon.so /usr/lib/libkea-stats.so.41 /usr/lib/libkea-cc.so.68 /usr/lib/libkea-dhcp_ddns.so.56 /usr/lib/libkea-d2srv.so.46.0.0 /usr/share/kea/scripts/pgsql/upgrade_018_to_019.sh /usr/share/kea/scripts/pgsql/upgrade_019_to_020.sh /usr/share/kea/scripts/pgsql/upgrade_020_to_021.sh /usr/share/kea/scripts/pgsql/upgrade_021_to_022.sh /usr/lib/libkea-asiolink.so.71.0.0 /usr/lib/libkea-process.so.72 /usr/lib/libkea-eval.so.69 /usr/lib/libkea
 -asiodns.so.48 /usr/lib/libkea-process.so.72.0.0 /usr/lib/libkea-hooks.so.97 /usr/lib/libkea-log.so.61.0.0 /usr/lib/libkea-tcp.so.18 /usr/lib/libkea-dns++.so.56 /usr/lib/libkea-http.so.71.0.0 /usr/lib/libkea-dhcpsrv.so.108 /usr/lib/libkea-exceptions.so.33 /usr/lib/libkea-stats.so.41.0.0 /usr/lib/libkea-database.so.61.0.0 /usr/lib/libkea-asiodns.so.48.0.0 /usr/lib/libkea-cfgclient.so.65.0.0 /usr/lib/libkea-dhcp_ddns.so.56.0.0 /usr/lib/libkea-http.so.71 /usr/share/kea/scripts/mysql/upgrade_019_to_020.sh /usr/share/kea/scripts/mysql/upgrade_020_to_021.sh /usr/share/kea/scripts/mysql/upgrade_021_to_022.sh /usr/lib/libkea-hooks.so.97.0.0 /usr/lib/libkea-dhcp++.so.89.0.0 /usr/lib/libkea-util.so.84 /usr/lib/libkea-asiolink.so.71 /usr/lib/libkea-cfgclient.so.65 /usr/lib/libkea-cryptolink.so.50.0.0 /usr/lib/libkea-dns++.so.56.0.0 /usr/lib/libkea-dhcp++.so.89 /usr/lib/libkea-dhcpsrv.so.108.0.0 /usr/lib/libkea-log.so.61 /usr/share/kea/api/extended-info6-upgrade.json /usr/lib/libkea-d2srv.so.46
  /usr/lib/libkea-cryptolink.so.50"
packages/core2-64-poky-linux/kea: PV changed from "2.4.1" to "2.6.0"
packages/core2-64-poky-linux/kea: PKGV changed from 2.4.1 [default] to 2.6.0 [default]
packages/core2-64-poky-linux/kea: SRC_URI changed from "http://ftp.isc.org/isc/kea/2.4.1/kea-2.4.1.tar.gz file://kea-dhcp4.service file://kea-dhcp6.service file://kea-dhcp-ddns.service file://kea-dhcp4-server file://kea-dhcp6-server file://kea-dhcp-ddns-server file://fix-multilib-conflict.patch file://fix_pid_keactrl.patch file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch" to "http://ftp.isc.org/isc/kea/2.6.0/kea-2.6.0.tar.gz file://kea-dhcp4.service file://kea-dhcp6.service file://kea-dhcp-ddns.service file://kea-dhcp4-server file://kea-dhcp6-server file://kea-dhcp-ddns-server file://fix-multilib-conflict.patch file://fix_pid_keactrl.patch file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch"
Changes to packages/core2-64-poky-linux/kea (sysroot):
  /usr/lib/libkea-asiodns.so changed symlink target from libkea-asiodns.so.35.0.0 to libkea-asiodns.so.48.0.0
  /usr/lib/libkea-asiolink.so changed symlink target from libkea-asiolink.so.56.0.0 to libkea-asiolink.so.71.0.0
  /usr/lib/libkea-cc.so changed symlink target from libkea-cc.so.54.0.0 to libkea-cc.so.68.0.0
  /usr/lib/libkea-cfgclient.so changed symlink target from libkea-cfgclient.so.51.0.0 to libkea-cfgclient.so.65.0.0
  /usr/lib/libkea-cryptolink.so changed symlink target from libkea-cryptolink.so.38.0.0 to libkea-cryptolink.so.50.0.0
  /usr/lib/libkea-d2srv.so changed symlink target from libkea-d2srv.so.30.0.0 to libkea-d2srv.so.46.0.0
  /usr/lib/libkea-database.so changed symlink target from libkea-database.so.48.0.0 to libkea-database.so.61.0.0
  /usr/lib/libkea-dhcp_ddns.so changed symlink target from libkea-dhcp_ddns.so.41.0.0 to libkea-dhcp_ddns.so.56.0.0
  /usr/lib/libkea-dhcp++.so changed symlink target from libkea-dhcp++.so.74.0.0 to libkea-dhcp++.so.89.0.0
  /usr/lib/libkea-dhcpsrv.so changed symlink target from libkea-dhcpsrv.so.90.0.0 to libkea-dhcpsrv.so.108.0.0
  /usr/lib/libkea-dns++.so changed symlink target from libkea-dns++.so.42.0.0 to libkea-dns++.so.56.0.0
  /usr/lib/libkea-eval.so changed symlink target from libkea-eval.so.52.0.0 to libkea-eval.so.69.0.0
  /usr/lib/libkea-exceptions.so changed symlink target from libkea-exceptions.so.23.0.0 to libkea-exceptions.so.33.0.0
  /usr/lib/libkea-hooks.so changed symlink target from libkea-hooks.so.78.0.0 to libkea-hooks.so.97.0.0
  /usr/lib/libkea-http.so changed symlink target from libkea-http.so.56.0.0 to libkea-http.so.71.0.0
  /usr/lib/libkea-log.so changed symlink target from libkea-log.so.48.0.0 to libkea-log.so.61.0.0
  /usr/lib/libkea-process.so changed symlink target from libkea-process.so.57.0.0 to libkea-process.so.72.0.0
  /usr/lib/libkea-stats.so changed symlink target from libkea-stats.so.29.0.0 to libkea-stats.so.41.0.0
  /usr/lib/libkea-tcp.so changed symlink target from libkea-tcp.so.5.0.0 to libkea-tcp.so.18.0.0
  /usr/lib/libkea-util.so changed symlink target from libkea-util.so.68.0.0 to libkea-util.so.84.0.0
  /usr/lib/libkea-asiodns.so.35.0.0 moved to /usr/lib/libkea-asiodns.so.48.0.0
  /usr/lib/libkea-asiodns.so.35 moved to /usr/lib/libkea-asiodns.so.48
  /usr/lib/libkea-asiolink.so.56.0.0 moved to /usr/lib/libkea-asiolink.so.71.0.0
  /usr/lib/libkea-asiolink.so.56 moved to /usr/lib/libkea-asiolink.so.71
  /usr/lib/libkea-cc.so.54.0.0 moved to /usr/lib/libkea-cc.so.68.0.0
  /usr/lib/libkea-cc.so.54 moved to /usr/lib/libkea-cc.so.68
  /usr/lib/libkea-cfgclient.so.51.0.0 moved to /usr/lib/libkea-cfgclient.so.65.0.0
  /usr/lib/libkea-cfgclient.so.51 moved to /usr/lib/libkea-cfgclient.so.65
  /usr/lib/libkea-cryptolink.so.38.0.0 moved to /usr/lib/libkea-cryptolink.so.50.0.0
  /usr/lib/libkea-cryptolink.so.38 moved to /usr/lib/libkea-cryptolink.so.50
  /usr/lib/libkea-d2srv.so.30.0.0 moved to /usr/lib/libkea-d2srv.so.46.0.0
  /usr/lib/libkea-d2srv.so.30 moved to /usr/lib/libkea-d2srv.so.46
  /usr/lib/libkea-database.so.48.0.0 moved to /usr/lib/libkea-database.so.61.0.0
  /usr/lib/libkea-database.so.48 moved to /usr/lib/libkea-database.so.61
  /usr/lib/libkea-dhcp_ddns.so.41.0.0 moved to /usr/lib/libkea-dhcp_ddns.so.56.0.0
  /usr/lib/libkea-dhcp_ddns.so.41 moved to /usr/lib/libkea-dhcp_ddns.so.56
  /usr/lib/libkea-dhcp++.so.74.0.0 moved to /usr/lib/libkea-dhcp++.so.89.0.0
  /usr/lib/libkea-dhcp++.so.74 moved to /usr/lib/libkea-dhcp++.so.89
  /usr/lib/libkea-dns++.so.42.0.0 moved to /usr/lib/libkea-dns++.so.56.0.0
  /usr/lib/libkea-dns++.so.42 moved to /usr/lib/libkea-dns++.so.56
  /usr/lib/libkea-eval.so.52.0.0 moved to /usr/lib/libkea-eval.so.69.0.0
  /usr/lib/libkea-eval.so.52 moved to /usr/lib/libkea-eval.so.69
  /usr/lib/libkea-exceptions.so.23.0.0 moved to /usr/lib/libkea-exceptions.so.33.0.0
  /usr/lib/libkea-exceptions.so.23 moved to /usr/lib/libkea-exceptions.so.33
  /usr/lib/libkea-hooks.so.78.0.0 moved to /usr/lib/libkea-hooks.so.97.0.0
  /usr/lib/libkea-hooks.so.78 moved to /usr/lib/libkea-hooks.so.97
  /usr/lib/libkea-http.so.56.0.0 moved to /usr/lib/libkea-http.so.71.0.0
  /usr/lib/libkea-http.so.56 moved to /usr/lib/libkea-http.so.71
  /usr/lib/libkea-log.so.48.0.0 moved to /usr/lib/libkea-log.so.61.0.0
  /usr/lib/libkea-log.so.48 moved to /usr/lib/libkea-log.so.61
  /usr/lib/libkea-process.so.57.0.0 moved to /usr/lib/libkea-process.so.72.0.0
  /usr/lib/libkea-process.so.57 moved to /usr/lib/libkea-process.so.72
  /usr/lib/libkea-stats.so.29.0.0 moved to /usr/lib/libkea-stats.so.41.0.0
  /usr/lib/libkea-stats.so.29 moved to /usr/lib/libkea-stats.so.41
  /usr/lib/libkea-util.so.68.0.0 moved to /usr/lib/libkea-util.so.84.0.0
  /usr/lib/libkea-util.so.68 moved to /usr/lib/libkea-util.so.84
  /usr/include/kea/asiolink/io_service_mgr.h was added
  /usr/include/kea/config/cmd_http_listener.h was added
  /usr/include/kea/config/cmd_response_creator_factory.h was added
  /usr/include/kea/config/cmd_response_creator.h was added
  /usr/include/kea/d2srv/d2_stats.h was added
  /usr/include/kea/d2srv/d2_tsig_key.h was added
  /usr/include/kea/d2srv/d2_update_message.h was added
  /usr/include/kea/d2srv/d2_zone.h was added
  /usr/include/kea/d2srv/dns_client.h was added
  /usr/include/kea/d2srv/nc_trans.h was added
  /usr/include/kea/dhcp/option4_dnr.h was added
  /usr/include/kea/dhcp/option6_dnr.h was added
  /usr/include/kea/dhcp/option_classless_static_route.h was added
  /usr/include/kea/dns/char_string.h was added
  /usr/include/kea/dns/time_utils.h was added
  /usr/include/kea/dns/txt_like.h was added
  /usr/include/kea/util/chrono_time_utils.h was added
  /usr/include/kea/util/encode/encode.h was added
  /usr/include/kea/util/filesystem.h was added
  /usr/include/kea/util/io.h was added
  /usr/include/kea/util/str.h was added
  /usr/lib/kea/hooks/libdhcp_perfmon.so was added
  /usr/lib/libkea-dhcpsrv.so.108.0.0 was added
  /usr/lib/libkea-dhcpsrv.so.108 was added
  /usr/lib/libkea-tcp.so.18.0.0 was added
  /usr/lib/libkea-tcp.so.18 was added
  /usr/share/kea/api/extended-info6-upgrade.json was added
  /usr/share/kea/scripts/mysql/upgrade_019_to_020.sh was added
  /usr/share/kea/scripts/mysql/upgrade_020_to_021.sh was added
  /usr/share/kea/scripts/mysql/upgrade_021_to_022.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_018_to_019.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_019_to_020.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_020_to_021.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_021_to_022.sh was added
  /usr/include/kea/dns/dns_fwd.h was removed
  /usr/include/kea/dns/masterload.h was removed
  /usr/include/kea/dns/nsec3hash.h was removed
  /usr/include/kea/dns/qid_gen.h was removed
  /usr/include/kea/dns/rdatafields.h was removed
  /usr/include/kea/dns/rdata_pimpl_holder.h was removed
  /usr/include/kea/dns/rrcollator.h was removed
  /usr/include/kea/dns/rrset_collection_base.h was removed
  /usr/include/kea/dns/rrset_collection.h was removed
  /usr/include/kea/dns/zone_checker.h was removed
  /usr/include/kea/util/encode/base16_from_binary.h was removed
  /usr/include/kea/util/encode/base32hex_from_binary.h was removed
  /usr/include/kea/util/encode/base32hex.h was removed
  /usr/include/kea/util/encode/base64.h was removed
  /usr/include/kea/util/encode/binary_from_base16.h was removed
  /usr/include/kea/util/encode/binary_from_base32hex.h was removed
  /usr/include/kea/util/encode/hex.h was removed
  /usr/include/kea/util/filename.h was removed
  /usr/include/kea/util/file_utilities.h was removed
  /usr/include/kea/util/io/fd_share.h was removed
  /usr/include/kea/util/io_utilities.h was removed
  /usr/include/kea/util/strutil.h was removed
  /usr/include/kea/util/time_utilities.h was removed
  /usr/lib/libkea-dhcpsrv.so.90.0.0 was removed
  /usr/lib/libkea-dhcpsrv.so.90 was removed
  /usr/lib/libkea-tcp.so.5.0.0 was removed
  /usr/lib/libkea-tcp.so.5 was removed
  /usr/share/kea/api/libreload.json was removed

--===============4345713813571358162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/kea/kea-dev: FILELIST: removed "/usr/include/kea/util/encode/base16_from_binary.h /usr/include/kea/dns/masterload.h /usr/include/kea/util/encode/base64.h /usr/include/kea/dns/nsec3hash.h /usr/include/kea/dns/rrset_collection.h /usr/include/kea/util/encode/binary_from_base16.h /usr/include/kea/dns/qid_gen.h /usr/include/kea/util/encode/base32hex_from_binary.h /usr/include/kea/dns/rdata_pimpl_holder.h /usr/include/kea/util/time_utilities.h /usr/include/kea/util/encode/binary_from_base32hex.h /usr/include/kea/util/strutil.h /usr/include/kea/dns/rrset_collection_base.h /usr/include/kea/util/encode/base32hex.h /usr/include/kea/util/io/fd_share.h /usr/include/kea/util/encode/hex.h /usr/include/kea/util/io_utilities.h /usr/include/kea/util/filename.h /usr/include/kea/dns/rrcollator.h /usr/include/kea/dns/zone_checker.h /usr/include/kea/util/file_utilities.h /usr/include/kea/dns/rdatafields.h /usr/include/kea/dns/dns_fwd.h", added "/usr/include/kea/config/cmd_htt
 p_listener.h /usr/include/kea/config/cmd_response_creator.h /usr/include/kea/dns/char_string.h /usr/include/kea/util/encode/encode.h /usr/include/kea/d2srv/nc_trans.h /usr/include/kea/d2srv/dns_client.h /usr/include/kea/dhcp/option4_dnr.h /usr/include/kea/dhcp/option6_dnr.h /usr/include/kea/dns/txt_like.h /usr/include/kea/util/filesystem.h /usr/include/kea/util/str.h /usr/include/kea/d2srv/d2_stats.h /usr/include/kea/util/io.h /usr/include/kea/d2srv/d2_zone.h /usr/include/kea/d2srv/d2_tsig_key.h /usr/include/kea/d2srv/d2_update_message.h /usr/include/kea/config/cmd_response_creator_factory.h /usr/include/kea/asiolink/io_service_mgr.h /usr/include/kea/util/chrono_time_utils.h /usr/include/kea/dns/time_utils.h /usr/include/kea/dhcp/option_classless_static_route.h"
packages/core2-64-poky-linux/kea/kea-doc: FILELIST: removed "/usr/share/doc/kea/examples/kea4/dnr.json /usr/share/doc/kea/examples/kea6/dnr.json", added "/usr/share/doc/kea/SECURITY.md"
packages/core2-64-poky-linux/kea/kea: FILELIST: removed "/usr/lib/libkea-hooks.so.78 /usr/lib/libkea-tcp.so.5.0.0 /usr/lib/libkea-dns++.so.42 /usr/lib/libkea-database.so.48 /usr/lib/libkea-asiolink.so.56 /usr/lib/libkea-cfgclient.so.51.0.0 /usr/lib/libkea-hooks.so.78.0.0 /usr/lib/libkea-dhcp_ddns.so.41 /usr/lib/libkea-asiodns.so.35 /usr/lib/libkea-exceptions.so.23 /usr/lib/libkea-dhcpsrv.so.90 /usr/lib/libkea-util.so.68.0.0 /usr/lib/libkea-process.so.57.0.0 /usr/lib/libkea-dhcp++.so.74 /usr/lib/libkea-asiolink.so.56.0.0 /usr/lib/libkea-http.so.56.0.0 /usr/lib/libkea-cryptolink.so.38.0.0 /usr/lib/libkea-tcp.so.5 /usr/lib/libkea-dns++.so.42.0.0 /usr/lib/libkea-asiodns.so.35.0.0 /usr/lib/libkea-http.so.56 /usr/lib/libkea-eval.so.52.0.0 /usr/lib/libkea-eval.so.52 /usr/lib/libkea-dhcpsrv.so.90.0.0 /usr/lib/libkea-stats.so.29.0.0 /usr/lib/libkea-log.so.48.0.0 /usr/lib/libkea-process.so.57 /usr/lib/libkea-d2srv.so.30 /usr/lib/libkea-stats.so.29 /usr/lib/libkea-exceptions.so.23.0.0 /usr/lib/
 libkea-log.so.48 /usr/lib/libkea-dhcp++.so.74.0.0 /usr/lib/libkea-database.so.48.0.0 /usr/lib/libkea-cfgclient.so.51 /usr/lib/libkea-cryptolink.so.38 /usr/lib/libkea-d2srv.so.30.0.0 /usr/lib/libkea-cc.so.54.0.0 /usr/lib/libkea-util.so.68 /usr/lib/libkea-dhcp_ddns.so.41.0.0 /usr/lib/libkea-cc.so.54 /usr/share/kea/api/libreload.json", added "/usr/lib/libkea-hooks.so.97 /usr/lib/libkea-database.so.61 /usr/lib/libkea-tcp.so.18 /usr/lib/libkea-d2srv.so.46 /usr/lib/libkea-cfgclient.so.65.0.0 /usr/lib/libkea-util.so.84 /usr/share/kea/scripts/pgsql/upgrade_018_to_019.sh /usr/share/kea/scripts/pgsql/upgrade_019_to_020.sh /usr/share/kea/scripts/pgsql/upgrade_020_to_021.sh /usr/share/kea/scripts/pgsql/upgrade_021_to_022.sh /usr/lib/libkea-stats.so.41.0.0 /usr/lib/libkea-cryptolink.so.50 /usr/lib/libkea-dns++.so.56.0.0 /usr/lib/libkea-dhcp++.so.89.0.0 /usr/lib/libkea-asiodns.so.48 /usr/lib/libkea-process.so.72.0.0 /usr/lib/libkea-cfgclient.so.65 /usr/lib/libkea-cc.so.68 /usr/lib/kea/hooks/libdh
 cp_perfmon.so /usr/lib/libkea-asiolink.so.71.0.0 /usr/lib/libkea-eval.so.69.0.0 /usr/lib/libkea-cryptolink.so.50.0.0 /usr/share/kea/api/extended-info6-upgrade.json /usr/lib/libkea-asiodns.so.48.0.0 /usr/lib/libkea-tcp.so.18.0.0 /usr/lib/libkea-log.so.61.0.0 /usr/lib/libkea-util.so.84.0.0 /usr/lib/libkea-http.so.71 /usr/lib/libkea-dns++.so.56 /usr/lib/libkea-dhcp++.so.89 /usr/lib/libkea-dhcpsrv.so.108 /usr/lib/libkea-hooks.so.97.0.0 /usr/lib/libkea-dhcp_ddns.so.56 /usr/lib/libkea-d2srv.so.46.0.0 /usr/lib/libkea-process.so.72 /usr/share/kea/scripts/mysql/upgrade_019_to_020.sh /usr/share/kea/scripts/mysql/upgrade_020_to_021.sh /usr/share/kea/scripts/mysql/upgrade_021_to_022.sh /usr/lib/libkea-exceptions.so.33.0.0 /usr/lib/libkea-exceptions.so.33 /usr/lib/libkea-database.so.61.0.0 /usr/lib/libkea-eval.so.69 /usr/lib/libkea-log.so.61 /usr/lib/libkea-dhcpsrv.so.108.0.0 /usr/lib/libkea-stats.so.41 /usr/lib/libkea-cc.so.68.0.0 /usr/lib/libkea-dhcp_ddns.so.56.0.0 /usr/lib/libkea-http.so.71.0
 .0 /usr/lib/libkea-asiolink.so.71"
Changes to packages/core2-64-poky-linux/kea (sysroot):
  /usr/lib/libkea-asiodns.so changed symlink target from libkea-asiodns.so.35.0.0 to libkea-asiodns.so.48.0.0
  /usr/lib/libkea-asiolink.so changed symlink target from libkea-asiolink.so.56.0.0 to libkea-asiolink.so.71.0.0
  /usr/lib/libkea-cc.so changed symlink target from libkea-cc.so.54.0.0 to libkea-cc.so.68.0.0
  /usr/lib/libkea-cfgclient.so changed symlink target from libkea-cfgclient.so.51.0.0 to libkea-cfgclient.so.65.0.0
  /usr/lib/libkea-cryptolink.so changed symlink target from libkea-cryptolink.so.38.0.0 to libkea-cryptolink.so.50.0.0
  /usr/lib/libkea-d2srv.so changed symlink target from libkea-d2srv.so.30.0.0 to libkea-d2srv.so.46.0.0
  /usr/lib/libkea-database.so changed symlink target from libkea-database.so.48.0.0 to libkea-database.so.61.0.0
  /usr/lib/libkea-dhcp_ddns.so changed symlink target from libkea-dhcp_ddns.so.41.0.0 to libkea-dhcp_ddns.so.56.0.0
  /usr/lib/libkea-dhcp++.so changed symlink target from libkea-dhcp++.so.74.0.0 to libkea-dhcp++.so.89.0.0
  /usr/lib/libkea-dhcpsrv.so changed symlink target from libkea-dhcpsrv.so.90.0.0 to libkea-dhcpsrv.so.108.0.0
  /usr/lib/libkea-dns++.so changed symlink target from libkea-dns++.so.42.0.0 to libkea-dns++.so.56.0.0
  /usr/lib/libkea-eval.so changed symlink target from libkea-eval.so.52.0.0 to libkea-eval.so.69.0.0
  /usr/lib/libkea-exceptions.so changed symlink target from libkea-exceptions.so.23.0.0 to libkea-exceptions.so.33.0.0
  /usr/lib/libkea-hooks.so changed symlink target from libkea-hooks.so.78.0.0 to libkea-hooks.so.97.0.0
  /usr/lib/libkea-http.so changed symlink target from libkea-http.so.56.0.0 to libkea-http.so.71.0.0
  /usr/lib/libkea-log.so changed symlink target from libkea-log.so.48.0.0 to libkea-log.so.61.0.0
  /usr/lib/libkea-process.so changed symlink target from libkea-process.so.57.0.0 to libkea-process.so.72.0.0
  /usr/lib/libkea-stats.so changed symlink target from libkea-stats.so.29.0.0 to libkea-stats.so.41.0.0
  /usr/lib/libkea-tcp.so changed symlink target from libkea-tcp.so.5.0.0 to libkea-tcp.so.18.0.0
  /usr/lib/libkea-util.so changed symlink target from libkea-util.so.68.0.0 to libkea-util.so.84.0.0
  /usr/lib/libkea-asiodns.so.35.0.0 moved to /usr/lib/libkea-asiodns.so.48.0.0
  /usr/lib/libkea-asiodns.so.35 moved to /usr/lib/libkea-asiodns.so.48
  /usr/lib/libkea-asiolink.so.56.0.0 moved to /usr/lib/libkea-asiolink.so.71.0.0
  /usr/lib/libkea-asiolink.so.56 moved to /usr/lib/libkea-asiolink.so.71
  /usr/lib/libkea-cc.so.54.0.0 moved to /usr/lib/libkea-cc.so.68.0.0
  /usr/lib/libkea-cc.so.54 moved to /usr/lib/libkea-cc.so.68
  /usr/lib/libkea-cfgclient.so.51.0.0 moved to /usr/lib/libkea-cfgclient.so.65.0.0
  /usr/lib/libkea-cfgclient.so.51 moved to /usr/lib/libkea-cfgclient.so.65
  /usr/lib/libkea-cryptolink.so.38.0.0 moved to /usr/lib/libkea-cryptolink.so.50.0.0
  /usr/lib/libkea-cryptolink.so.38 moved to /usr/lib/libkea-cryptolink.so.50
  /usr/lib/libkea-d2srv.so.30.0.0 moved to /usr/lib/libkea-d2srv.so.46.0.0
  /usr/lib/libkea-d2srv.so.30 moved to /usr/lib/libkea-d2srv.so.46
  /usr/lib/libkea-database.so.48.0.0 moved to /usr/lib/libkea-database.so.61.0.0
  /usr/lib/libkea-database.so.48 moved to /usr/lib/libkea-database.so.61
  /usr/lib/libkea-dhcp_ddns.so.41.0.0 moved to /usr/lib/libkea-dhcp_ddns.so.56.0.0
  /usr/lib/libkea-dhcp_ddns.so.41 moved to /usr/lib/libkea-dhcp_ddns.so.56
  /usr/lib/libkea-dhcp++.so.74.0.0 moved to /usr/lib/libkea-dhcp++.so.89.0.0
  /usr/lib/libkea-dhcp++.so.74 moved to /usr/lib/libkea-dhcp++.so.89
  /usr/lib/libkea-dns++.so.42.0.0 moved to /usr/lib/libkea-dns++.so.56.0.0
  /usr/lib/libkea-dns++.so.42 moved to /usr/lib/libkea-dns++.so.56
  /usr/lib/libkea-eval.so.52.0.0 moved to /usr/lib/libkea-eval.so.69.0.0
  /usr/lib/libkea-eval.so.52 moved to /usr/lib/libkea-eval.so.69
  /usr/lib/libkea-exceptions.so.23.0.0 moved to /usr/lib/libkea-exceptions.so.33.0.0
  /usr/lib/libkea-exceptions.so.23 moved to /usr/lib/libkea-exceptions.so.33
  /usr/lib/libkea-hooks.so.78.0.0 moved to /usr/lib/libkea-hooks.so.97.0.0
  /usr/lib/libkea-hooks.so.78 moved to /usr/lib/libkea-hooks.so.97
  /usr/lib/libkea-http.so.56.0.0 moved to /usr/lib/libkea-http.so.71.0.0
  /usr/lib/libkea-http.so.56 moved to /usr/lib/libkea-http.so.71
  /usr/lib/libkea-log.so.48.0.0 moved to /usr/lib/libkea-log.so.61.0.0
  /usr/lib/libkea-log.so.48 moved to /usr/lib/libkea-log.so.61
  /usr/lib/libkea-process.so.57.0.0 moved to /usr/lib/libkea-process.so.72.0.0
  /usr/lib/libkea-process.so.57 moved to /usr/lib/libkea-process.so.72
  /usr/lib/libkea-stats.so.29.0.0 moved to /usr/lib/libkea-stats.so.41.0.0
  /usr/lib/libkea-stats.so.29 moved to /usr/lib/libkea-stats.so.41
  /usr/lib/libkea-util.so.68.0.0 moved to /usr/lib/libkea-util.so.84.0.0
  /usr/lib/libkea-util.so.68 moved to /usr/lib/libkea-util.so.84
  /usr/include/kea/asiolink/io_service_mgr.h was added
  /usr/include/kea/config/cmd_http_listener.h was added
  /usr/include/kea/config/cmd_response_creator_factory.h was added
  /usr/include/kea/config/cmd_response_creator.h was added
  /usr/include/kea/d2srv/d2_stats.h was added
  /usr/include/kea/d2srv/d2_tsig_key.h was added
  /usr/include/kea/d2srv/d2_update_message.h was added
  /usr/include/kea/d2srv/d2_zone.h was added
  /usr/include/kea/d2srv/dns_client.h was added
  /usr/include/kea/d2srv/nc_trans.h was added
  /usr/include/kea/dhcp/option4_dnr.h was added
  /usr/include/kea/dhcp/option6_dnr.h was added
  /usr/include/kea/dhcp/option_classless_static_route.h was added
  /usr/include/kea/dns/char_string.h was added
  /usr/include/kea/dns/time_utils.h was added
  /usr/include/kea/dns/txt_like.h was added
  /usr/include/kea/util/chrono_time_utils.h was added
  /usr/include/kea/util/encode/encode.h was added
  /usr/include/kea/util/filesystem.h was added
  /usr/include/kea/util/io.h was added
  /usr/include/kea/util/str.h was added
  /usr/lib/kea/hooks/libdhcp_perfmon.so was added
  /usr/lib/libkea-dhcpsrv.so.108.0.0 was added
  /usr/lib/libkea-dhcpsrv.so.108 was added
  /usr/lib/libkea-tcp.so.18.0.0 was added
  /usr/lib/libkea-tcp.so.18 was added
  /usr/share/kea/api/extended-info6-upgrade.json was added
  /usr/share/kea/scripts/mysql/upgrade_019_to_020.sh was added
  /usr/share/kea/scripts/mysql/upgrade_020_to_021.sh was added
  /usr/share/kea/scripts/mysql/upgrade_021_to_022.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_018_to_019.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_019_to_020.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_020_to_021.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_021_to_022.sh was added
  /usr/include/kea/dns/dns_fwd.h was removed
  /usr/include/kea/dns/masterload.h was removed
  /usr/include/kea/dns/nsec3hash.h was removed
  /usr/include/kea/dns/qid_gen.h was removed
  /usr/include/kea/dns/rdatafields.h was removed
  /usr/include/kea/dns/rdata_pimpl_holder.h was removed
  /usr/include/kea/dns/rrcollator.h was removed
  /usr/include/kea/dns/rrset_collection_base.h was removed
  /usr/include/kea/dns/rrset_collection.h was removed
  /usr/include/kea/dns/zone_checker.h was removed
  /usr/include/kea/util/encode/base16_from_binary.h was removed
  /usr/include/kea/util/encode/base32hex_from_binary.h was removed
  /usr/include/kea/util/encode/base32hex.h was removed
  /usr/include/kea/util/encode/base64.h was removed
  /usr/include/kea/util/encode/binary_from_base16.h was removed
  /usr/include/kea/util/encode/binary_from_base32hex.h was removed
  /usr/include/kea/util/encode/hex.h was removed
  /usr/include/kea/util/filename.h was removed
  /usr/include/kea/util/file_utilities.h was removed
  /usr/include/kea/util/io/fd_share.h was removed
  /usr/include/kea/util/io_utilities.h was removed
  /usr/include/kea/util/strutil.h was removed
  /usr/include/kea/util/time_utilities.h was removed
  /usr/lib/libkea-dhcpsrv.so.90.0.0 was removed
  /usr/lib/libkea-dhcpsrv.so.90 was removed
  /usr/lib/libkea-tcp.so.5.0.0 was removed
  /usr/lib/libkea-tcp.so.5 was removed
  /usr/share/kea/api/libreload.json was removed

--===============4345713813571358162==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-kea-upgrade-2.4.1-2.6.0.patch"

RnJvbSAzODU0NjBmODg0YTRiODUyYWZlYWEyZDgxZDEwMzc3ODJjMmJlMTc2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAwNzo1Nzo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGtl
YTogdXBncmFkZSAyLjQuMSAtPiAyLjYuMAoKLS0tCiAuLi5lcl91bml0dGVzdF9zdXBwb3J0LmNj
LWRvLW5vdC13cml0ZS0ucGF0Y2ggfCAgMyArLS0KIC4uLi9rZWEvZmlsZXMvZml4LW11bHRpbGli
LWNvbmZsaWN0LnBhdGNoICAgICB8ICA3ICsrKy0tLQogLi4uL2tlYS9maWxlcy9maXhfcGlkX2tl
YWN0cmwucGF0Y2ggICAgICAgICAgIHwgIDcgKysrLS0tCiAuLi4va2VhL3trZWFfMi40LjEuYmIg
PT4ga2VhXzIuNi4wLmJifSAgICAgICAgfCAyMyArKysrKysrKysrKysrKysrKy0tCiA0IGZpbGVz
IGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL3trZWFfMi40LjEuYmIgPT4ga2VhXzIuNi4wLmJifSAo
NzclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzLzAw
MDEtc3JjLWxpYi1sb2ctbG9nZ2VyX3VuaXR0ZXN0X3N1cHBvcnQuY2MtZG8tbm90LXdyaXRlLS5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzLzAwMDEtc3JjLWxpYi1s
b2ctbG9nZ2VyX3VuaXR0ZXN0X3N1cHBvcnQuY2MtZG8tbm90LXdyaXRlLS5wYXRjaAppbmRleCA5
NGZiZDEyNzM3Li4xMjBiNGZhYmNiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2tlYS9maWxlcy8wMDAxLXNyYy1saWItbG9nLWxvZ2dlcl91bml0dGVzdF9zdXBwb3J0LmNj
LWRvLW5vdC13cml0ZS0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEv
ZmlsZXMvMDAwMS1zcmMtbGliLWxvZy1sb2dnZXJfdW5pdHRlc3Rfc3VwcG9ydC5jYy1kby1ub3Qt
d3JpdGUtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4NDE5MjRlMWZlOGRiMmJmZjNlYWI4
ZDM3NjM0ZWYwOGY4NmMwMGVjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzNjg2NGJm
OTdhNjg1YjA3ODg3MTUwNDQyYjk0ZDdkZDU5OTcwZTMwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRl
OiBUdWUsIDEwIE5vdiAyMDIwIDE1OjU3OjAzICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNyYy9s
aWIvbG9nL2xvZ2dlcl91bml0dGVzdF9zdXBwb3J0LmNjOiBkbyBub3Qgd3JpdGUgYnVpbGQKQEAg
LTgsNyArOCw2IEBAIFRoaXMgYnJlYWtzIHJlcHJvZHVjaWJpbGl0eSBhbmQgaXMgbmVlZGVkIG9u
bHkgaW4gdW5pdCB0ZXN0aW5nLgogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29l
LWNvcmUgc3BlY2lmaWNdCiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5r
YW5hdmluQGdtYWlsLmNvbT4KLQogLS0tCiAgc3JjL2xpYi9sb2cvbG9nZ2VyX3VuaXR0ZXN0X3N1
cHBvcnQuY2MgfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxlcy9m
aXgtbXVsdGlsaWItY29uZmxpY3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tl
YS9maWxlcy9maXgtbXVsdGlsaWItY29uZmxpY3QucGF0Y2gKaW5kZXggNWIxMzViM2FlZS4uYWY0
YWIwM2IyMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMv
Zml4LW11bHRpbGliLWNvbmZsaWN0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkva2VhL2ZpbGVzL2ZpeC1tdWx0aWxpYi1jb25mbGljdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gMDZlYmQxYjJjZWQ0MjZjNDIwZWQxNjI5ODBlY2ExOTRmOWY5MThhZSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjdhNDk0ODNiYTMxMTdhNTY1YTQ2ZmE3MTVjZWZkYzgyOTRh
YTBlZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEthaSBLYW5nIDxrYWkua2FuZ0B3
aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAyMiBTZXAgMjAyMCAxNTowMjozMyArMDgwMAogU3Vi
amVjdDogW1BBVENIXSBUaGVyZSBhcmUgY29uZmxpY3Qgb2YgY29uZmlnIGZpbGVzIGJldHdlZW4g
a2VhIGFuZCBsaWIzMi1rZWE6CkBAIC0xNCwxNCArMTQsMTMgQEAgQmVjYXVzZSB0aGV5IGFyZSBh
bGwgY29tbWVudGVkIG91dCwgcmVwbGFjZSB0aGUgZXhwYW5kZWQgbGliZGlyIHBhdGggd2l0aAog
CiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRsYWIuaXNjLm9yZy9pc2Mt
cHJvamVjdHMva2VhLy0vaXNzdWVzLzI2MDJdCiBTaWduZWQtb2ZmLWJ5OiBLYWkgS2FuZyA8a2Fp
LmthbmdAd2luZHJpdmVyLmNvbT4KLQogLS0tCiAgc3JjL2Jpbi9rZWFjdHJsL2tlYS1jdHJsLWFn
ZW50LmNvbmYucHJlIHwgMyArKy0KICBzcmMvYmluL2tlYWN0cmwva2VhLWRoY3A0LmNvbmYucHJl
ICAgICAgfCA0ICsrLS0KICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9iaW4va2VhY3RybC9rZWEtY3RybC1hZ2VudC5j
b25mLnByZSBiL3NyYy9iaW4va2VhY3RybC9rZWEtY3RybC1hZ2VudC5jb25mLnByZQotaW5kZXgg
ZTZhZThiOC4uNTBhMzA5MiAxMDA2NDQKK2luZGV4IGQ4ZTA0MjkuLmIyZWM1YjUgMTAwNjQ0CiAt
LS0gYS9zcmMvYmluL2tlYWN0cmwva2VhLWN0cmwtYWdlbnQuY29uZi5wcmUKICsrKyBiL3NyYy9i
aW4va2VhY3RybC9rZWEtY3RybC1hZ2VudC5jb25mLnByZQogQEAgLTUxLDcgKzUxLDggQEAKQEAg
LTM1LDcgKzM0LDcgQEAgaW5kZXggZTZhZThiOC4uNTBhMzA5MiAxMDA2NDQKICAvLyAgICAgICAg
ICAicGFyYW0xIjogImZvbyIKICAvLyAgICAgIH0KIGRpZmYgLS1naXQgYS9zcmMvYmluL2tlYWN0
cmwva2VhLWRoY3A0LmNvbmYucHJlIGIvc3JjL2Jpbi9rZWFjdHJsL2tlYS1kaGNwNC5jb25mLnBy
ZQotaW5kZXggNmVkYjhhMS4uYjJhNzM4NSAxMDA2NDQKK2luZGV4IDU1YWY5ZGIuLjA1NmYwNmYg
MTAwNjQ0CiAtLS0gYS9zcmMvYmluL2tlYWN0cmwva2VhLWRoY3A0LmNvbmYucHJlCiArKysgYi9z
cmMvYmluL2tlYWN0cmwva2VhLWRoY3A0LmNvbmYucHJlCiBAQCAtMjU1LDcgKzI1NSw3IEBACmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxlcy9maXhfcGlkX2tl
YWN0cmwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9maWxlcy9maXhfcGlk
X2tlYWN0cmwucGF0Y2gKaW5kZXggNjNhNmEyODA1Yi4uNTY4NjQ2Yzg5NiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEvZmlsZXMvZml4X3BpZF9rZWFjdHJsLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2ZpbGVzL2ZpeF9waWRfa2VhY3Ry
bC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzg3OGEzNTY3MTI2MDY1NDlmN2YxODhiNjJm
N2QxY2FlMDhhMTc2ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDE3ZjMzOWQyNDZi
NTE5NzU3YzY5ZGJiNTc3OTU3ODMxYmJlNDBhMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEFybWluIGt1c3RlciA8YWt1c3RlcjgwOEBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDE0IE9j
dCAyMDIwIDIyOjQ4OjMxIC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIEJ1c3lib3ggZG9lcyBub3Qg
c3VwcG9ydCBwcyAtcCBzbyB1c2UgcGdyZXAKQEAgLTcsMTYgKzcsMTUgQEAgVXBzdHJlYW0tU3Rh
dHVzOiBJbmFwcHJvcHJpYXRlIFtlbWJlZGRlZCBzcGVjaWZpY10KIEJhc2VkIG9uIGNoYW5nZXMg
ZnJvbSBEaWVnbyBTdWVpcm8gPERpZWdvLlN1ZWlyb0Bhcm0uY29tPgogCiBTaWduZWQtb2ZmLWJ5
OiBBcm1pbiBrdXN0ZXIgPGFrdXN0ZXI4MDhAZ21haWwuY29tPgotCiAtLS0KICBzcmMvYmluL2tl
YWN0cmwva2VhY3RybC5pbiB8IDQgKystLQogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvYmluL2tlYWN0cmwva2VhY3Ry
bC5pbiBiL3NyYy9iaW4va2VhY3RybC9rZWFjdHJsLmluCi1pbmRleCA0NTBlOTk3Li5jMzUzY2E5
IDEwMDY0NAoraW5kZXggY2NjZmRhYy4uMjBhZTJlNiAxMDA2NDQKIC0tLSBhL3NyYy9iaW4va2Vh
Y3RybC9rZWFjdHJsLmluCiArKysgYi9zcmMvYmluL2tlYWN0cmwva2VhY3RybC5pbgotQEAgLTE0
OSw4ICsxNDksOCBAQCBjaGVja19ydW5uaW5nKCkgeworQEAgLTE0Niw4ICsxNDYsOCBAQCBjaGVj
a19ydW5uaW5nKCkgewogICAgICAjIEdldCB0aGUgUElEIGZyb20gdGhlIFBJRCBmaWxlIChpZiBp
dCBleGlzdHMpCiAgICAgIGdldF9waWRfZnJvbV9maWxlICIke3Byb2NfbmFtZX0iCiAgICAgIGlm
IFsgJHtfcGlkfSAtZ3QgMCBdOyB0aGVuCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2tlYS9rZWFfMi40LjEuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9r
ZWFfMi42LjAuYmIKc2ltaWxhcml0eSBpbmRleCA3NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9rZWEva2VhXzIuNC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2tlYS9rZWFfMi42LjAuYmIKaW5kZXggMTkzMDljZTMxNC4uZGExNWI1NzJiYSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEva2VhXzIuNC4xLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2tlYV8yLjYuMC5iYgpAQCAtMSw5ICsx
LDI4IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVw
ZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZl
cmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNl
IHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNo
YW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcu
CisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicp
CisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORworIyBA
QCAtMSw0ICsxLDQgQEAKKyMgLUNvcHlyaWdodCAoQykgMjAwOS0yMDIzIEludGVybmV0IFN5c3Rl
bXMgQ29uc29ydGl1bSwgSW5jLiAoIklTQyIpCisjICtDb3B5cmlnaHQgKEMpIDIwMDktMjAyNCBJ
bnRlcm5ldCBTeXN0ZW1zIENvbnNvcnRpdW0sIEluYy4gKCJJU0MiKQorIyAgCisjICBUaGlzIFNv
dXJjZSBDb2RlIEZvcm0gaXMgc3ViamVjdCB0byB0aGUgdGVybXMgb2YgdGhlIE1vemlsbGEgUHVi
bGljCisjICBMaWNlbnNlLCB2LiAyLjAuIElmIGEgY29weSBvZiB0aGUgTVBMIHdhcyBub3QgZGlz
dHJpYnV0ZWQgd2l0aCB0aGlzCisjIAorIworCiBTVU1NQVJZID0gIklTQyBLZWEgREhDUCBTZXJ2
ZXIiCiBERVNDUklQVElPTiA9ICJLZWEgaXMgdGhlIG5leHQgZ2VuZXJhdGlvbiBvZiBESENQIHNv
ZnR3YXJlIGRldmVsb3BlZCBieSBJU0MuIEl0IHN1cHBvcnRzIGJvdGggREhDUHY0IGFuZCBESENQ
djYgcHJvdG9jb2xzIGFsb25nIHdpdGggdGhlaXIgZXh0ZW5zaW9ucywgZS5nLiBwcmVmaXggZGVs
ZWdhdGlvbiBhbmQgZHluYW1pYyB1cGRhdGVzIHRvIEROUy4iCiBIT01FUEFHRSA9ICJodHRwOi8v
a2VhLmlzYy5vcmciCiBTRUNUSU9OID0gImNvbm5lY3Rpdml0eSIKIExJQ0VOU0UgPSAiTVBMLTIu
MCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWVhMDYxZmEwMTg4ODM4
MDcyYzQyNDhjMTMxOGVjMTMxIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9NjE4MDkzZWE5ZGU5MmM3MGExMTUyNjhjMWQ1MzQyMWYiCiAKIERFUEVORFMgPSAiYm9vc3Qg
bG9nNGNwbHVzIG9wZW5zc2wiCiAKQEAgLTE4LDcgKzM3LDcgQEAgU1JDX1VSSSA9ICJodHRwOi8v
ZnRwLmlzYy5vcmcvaXNjL2tlYS8ke1BWfS8ke0JQfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxl
Oi8vZml4X3BpZF9rZWFjdHJsLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtc3JjLWxp
Yi1sb2ctbG9nZ2VyX3VuaXR0ZXN0X3N1cHBvcnQuY2MtZG8tbm90LXdyaXRlLS5wYXRjaCBcCiAg
ICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4MTVjNjFmNWMyNzFjYWE0YTFkYjMx
ZGQ2NTZlYjUwYTdmNmVhOTczZGEzNjkwZjdjODU4MTQwOGUxODAxMzFhIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjIwN2NlYWUzM2ViM2I4MWVjNGU2YWM1NjA1MjQ5YTg1YjkzNzc5MzMzYjYyYWFk
ZjM5ZTQ4OWYxMWRiY2RjOGQiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHN5c3RlbWQgdXBkYXRlLXJj
LmQgdXBzdHJlYW0tdmVyc2lvbi1pcy1ldmVuCiAKLS0gCjIuNDQuMAoK

--===============4345713813571358162==--

