Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965B1C2FC26
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:40 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.5934.1689456453455337169
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QB/dF5Pb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101895b73a433-4f46fb83-989b-4ffb-8374-f2db05d1515a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456452;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=m73Pji7kiPAffBzhJlAM8IgEob6sAbUPxDcb7RLd6XU=;
	b=QB/dF5Pbnztzrt/GE8bAfiqpDs1HTlWAC3gQEhVwPay7lKIN4NYRdj14k8SdCVMo
	x4fL9nf8GPdC19BYaQKmqfFyLuZzDvCZoXIvSWAgRXRlh4cAQ3zaCLY/jPEcMHwHsBd
	SzbnZNFPavieu6YAu1ukPYkRtKYh6GrjPN9T9aP8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456452;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=m73Pji7kiPAffBzhJlAM8IgEob6sAbUPxDcb7RLd6XU=;
	b=iDEJ9mdbRDlVe1B1edIE3RTKT8eOuamAC2odxEZzK1hiCUJeNfYcqHeO5Tdkwp0P
	hBCJGc1k/DoCZ4L4rOLkqhtPpo/5tkz9ik/OnerPpVN7xttql/yntEQRivsT5GTGPh6
	rkknasv1wwE0BXpmGiudfp5F8wGNDUaGu2asq5+Q=
Content-Type: multipart/mixed; boundary="===============6518726521550432616=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] kea: upgrading to 2.4.0 SUCCEEDED
Message-ID: <010101895b73a433-4f46fb83-989b-4ffb-8374-f2db05d1515a-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184316

--===============6518726521550432616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kea* to *2.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kea-upgrade-2.2.0-2.4.0.patch
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
From 01a9e548ec9bae883540f3d471ba1fd642cf5307 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 08:20:21 +0000
Subject: [PATCH] kea: upgrade 2.2.0 -> 2.4.0

---
 .../kea/{kea_2.2.0.bb => kea_2.4.0.bb}        | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/kea/{kea_2.2.0.bb => kea_2.4.0.bb} (77%)

diff --git a/meta/recipes-connectivity/kea/kea_2.2.0.bb b/meta/recipes-connectivity/kea/kea_2.4.0.bb
similarity index 77%
rename from meta/recipes-connectivity/kea/kea_2.2.0.bb
rename to meta/recipes-connectivity/kea/kea_2.4.0.bb
index 2c2e5a74dd..e5809e8d3d 100644
--- a/meta/recipes-connectivity/kea/kea_2.2.0.bb
+++ b/meta/recipes-connectivity/kea/kea_2.4.0.bb
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
+# -Copyright (C) 2009-2022 Internet Systems Consortium, Inc. ("ISC")
+# +Copyright (C) 2009-2023 Internet Systems Consortium, Inc. ("ISC")
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
-LIC_FILES_CHKSUM = "file://COPYING;md5=97ce14bdd2733f5b84ab5e29380d057d"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea061fa0188838072c4248c1318ec131"
 
 DEPENDS = "boost log4cplus openssl"
 
@@ -18,7 +37,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            "
-SRC_URI[sha256sum] = "da7d90ca62a772602dac6e77e507319038422895ad68eeb142f1487d67d531d2"
+SRC_URI[sha256sum] = "3a33cd08dc3319ff544e6bbf2c0429042106f4051ebe115dc1bb2625c95003f7"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.39.2


--===============6518726521550432616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/kea/kea-dbg: FILELIST: removed "/usr/lib/.debug/libkea-dns++.so.30.0.0 /usr/lib/.debug/libkea-cc.so.39.0.0 /usr/lib/.debug/libkea-dhcp++.so.54.0.0 /usr/lib/.debug/libkea-eval.so.39.0.0 /usr/lib/.debug/libkea-asiodns.so.24.0.0 /usr/lib/.debug/libkea-cryptolink.so.28.0.0 /usr/lib/.debug/libkea-database.so.35.0.0 /usr/lib/.debug/libkea-stats.so.18.0.0 /usr/lib/.debug/libkea-exceptions.so.13.0.0 /usr/lib/.debug/libkea-process.so.40.0.0 /usr/lib/.debug/libkea-dhcpsrv.so.69.0.0 /usr/lib/.debug/libkea-dhcp_ddns.so.29.0.0 /usr/lib/.debug/libkea-log.so.35.0.0 /usr/lib/.debug/libkea-cfgclient.so.36.0.0 /usr/lib/.debug/libkea-hooks.so.57.0.0 /usr/lib/.debug/libkea-http.so.42.0.0 /usr/lib/.debug/libkea-util.so.52.0.0 /usr/lib/.debug/libkea-asiolink.so.40.0.0 /usr/lib/.debug/libkea-d2srv.so.16.0.0", added "/usr/lib/.debug/libkea-cc.so.54.0.0 /usr/lib/.debug/libkea-tcp.so.5.0.0 /usr/lib/.debug/libkea-dns++.so.42.0.0 /usr/lib/.debug/libkea-stats.so.29.0.0 /usr/lib/.debu
 g/libkea-cryptolink.so.38.0.0 /usr/lib/.debug/libkea-dhcp++.so.73.0.0 /usr/lib/.debug/libkea-database.so.48.0.0 /usr/lib/.debug/libkea-exceptions.so.23.0.0 /usr/lib/.debug/libkea-dhcp_ddns.so.41.0.0 /usr/lib/.debug/libkea-http.so.56.0.0 /usr/lib/.debug/libkea-asiodns.so.35.0.0 /usr/lib/.debug/libkea-eval.so.52.0.0 /usr/lib/.debug/libkea-log.so.48.0.0 /usr/lib/.debug/libkea-util.so.68.0.0 /usr/lib/.debug/libkea-dhcpsrv.so.89.0.0 /usr/lib/.debug/libkea-cfgclient.so.51.0.0 /usr/lib/.debug/libkea-process.so.57.0.0 /usr/lib/.debug/libkea-asiolink.so.56.0.0 /usr/lib/.debug/libkea-d2srv.so.30.0.0 /usr/lib/.debug/libkea-hooks.so.77.0.0"
packages/core2-32-poky-linux/kea/kea-dbg: PKGSIZE changed from 265489932 to 300785248 (+13%)
packages/core2-32-poky-linux/kea/kea-dbg: PV changed from "2.2.0" to "2.4.0"
packages/core2-32-poky-linux/kea/kea-dbg: PKGV changed from 2.2.0 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/kea/kea-dev: FILELIST: removed "/usr/include/kea/http/http_thread_pool.h /usr/include/kea/dhcpsrv/free_lease_queue.h", added "/usr/include/kea/dhcpsrv/random_allocator.h /usr/include/kea/dhcpsrv/iterative_allocator.h /usr/include/kea/tcp/tcp_connection_acceptor.h /usr/include/kea/tcp/tcp_stream_msg.h /usr/include/kea/dhcpsrv/allocation_state.h /usr/include/kea/tcp/tcp_log.h /usr/include/kea/asiolink/io_service_thread_pool.h /usr/include/kea/tcp/tcp_connection_pool.h /usr/lib/libkea-tcp.so /usr/include/kea/tcp/mt_tcp_listener_mgr.h /usr/include/kea/tcp/tcp_listener.h /usr/include/kea/dhcpsrv/cfg_globals.h /usr/include/kea/tcp/tcp_messages.h /usr/include/kea/dhcpsrv/random_allocation_state.h /usr/include/kea/dhcpsrv/flq_allocation_state.h /usr/include/kea/tcp/tcp_connection.h /usr/include/kea/dhcpsrv/tracking_lease_mgr.h /usr/include/kea/dhcpsrv/iterative_allocation_state.h /usr/include/kea/dhcpsrv/allocator.h /usr/include/kea/dhcpsrv/flq_allocator.h /usr/i
 nclude/kea/util/bigints.h"
packages/core2-32-poky-linux/kea/kea-dev: PKGSIZE changed from 3788213 to 3983652 (+5%)
packages/core2-32-poky-linux/kea/kea-dev: PV changed from "2.2.0" to "2.4.0"
packages/core2-32-poky-linux/kea/kea-dev: PKGV changed from 2.2.0 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/kea/kea-doc: FILELIST: removed "/usr/share/doc/kea/examples/kea6/ha-hot-standby.json /usr/share/doc/kea/examples/kea4/ha-load-balancing-primary.json", added "/usr/share/doc/kea/examples/kea4/ha-load-balancing-server2-mt.json /usr/share/doc/kea/examples/kea6/ha-hot-standby-server2.json /usr/share/doc/kea/examples/template-ha-mt-tls/kea-ca-1.conf /usr/share/doc/kea/examples/template-ha-mt-tls/kea-ca-2.conf /usr/share/doc/kea/examples/template-ha-mt-tls/info.md /usr/share/doc/kea/examples/kea4/dnr.json /usr/share/doc/kea/examples/kea4/ha-load-balancing-server1-mt-with-tls.json /usr/share/doc/kea/examples/kea6/dnr.json /usr/share/doc/kea/examples/kea6/ha-hot-standby-server1-with-tls.json /usr/share/doc/kea/examples/template-ha-mt-tls/kea-dhcp4-1.conf /usr/share/doc/kea/examples/template-ha-mt-tls/kea-dhcp4-2.conf"
packages/core2-32-poky-linux/kea/kea-doc: PKGSIZE changed from 1196793 to 1322079 (+10%)
packages/core2-32-poky-linux/kea/kea-doc: PV changed from "2.2.0" to "2.4.0"
packages/core2-32-poky-linux/kea/kea-doc: PKGV changed from 2.2.0 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/kea/kea-locale: PV changed from "2.2.0" to "2.4.0"
packages/core2-32-poky-linux/kea/kea-locale: PKGV changed from 2.2.0 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/kea/kea-src: FILELIST: directory renamed /usr/src/debug/kea/2.2.0-r0/src/lib/log/interprocess -> /usr/src/debug/kea/2.4.0-r0/src/lib/log/interprocess, directory renamed /usr/src/debug/kea/2.2.0-r0/src/lib/config_backend -> /usr/src/debug/kea/2.4.0-r0/src/lib/config_backend, directory renamed /usr/src/debug/kea/2.2.0-r0/src/lib/util/encode -> /usr/src/debug/kea/2.4.0-r0/src/lib/util/encode, directory renamed /usr/src/debug/kea/2.2.0-r0/src/hooks/dhcp/flex_option -> /usr/src/debug/kea/2.4.0-r0/src/hooks/dhcp/flex_option, directory renamed /usr/src/debug/kea/2.2.0-r0/src/bin/dhcp4 -> /usr/src/debug/kea/2.4.0-r0/src/bin/dhcp4, directory renamed /usr/src/debug/kea/2.2.0-r0/src/bin/dhcp6 -> /usr/src/debug/kea/2.4.0-r0/src/bin/dhcp6, directory renamed /usr/src/debug/kea/2.2.0-r0/src/lib/util/io -> /usr/src/debug/kea/2.4.0-r0/src/lib/util/io, directory renamed /usr/src/debug/kea/2.2.0-r0/src/hooks/dhcp/high_availability -> /usr/src/debug/kea/2.4.0-r0/src/hooks/dh
 cp/high_availability, directory renamed /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp_ddns -> /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp_ddns, directory renamed /usr/src/debug/kea/2.2.0-r0/src/bin/d2 -> /usr/src/debug/kea/2.4.0-r0/src/bin/d2, directory renamed /usr/src/debug/kea/2.2.0-r0/src/lib/cryptolink -> /usr/src/debug/kea/2.4.0-r0/src/lib/cryptolink, directory renamed /usr/src/debug/kea/2.2.0-r0/src/hooks/dhcp/stat_cmds -> /usr/src/debug/kea/2.4.0-r0/src/hooks/dhcp/stat_cmds, directory renamed /usr/src/debug/kea/2.2.0-r0/src/lib/asiodns -> /usr/src/debug/kea/2.4.0-r0/src/lib/asiodns, directory renamed /usr/src/debug/kea/2.2.0-r0/src/lib/dns -> /usr/src/debug/kea/2.4.0-r0/src/lib/dns, directory renamed /usr/src/debug/kea/2.2.0-r0/src/bin/lfc -> /usr/src/debug/kea/2.4.0-r0/src/bin/lfc, directory renamed /usr/src/debug/kea/2.2.0-r0/src/lib/log -> /usr/src/debug/kea/2.4.0-r0/src/lib/log, directory renamed /usr/src/debug/kea/2.2.0-r0/src/lib/database -> /usr/src/debug/kea/2.4.0-r0/src/lib
 /database, directory renamed /usr/src/debug/kea/2.2.0-r0/src/lib/d2srv -> /usr/src/debug/kea/2.4.0-r0/src/lib/d2srv, directory renamed /usr/src/debug/kea/2.2.0-r0/src/lib/dns/rdata/generic/detail -> /usr/src/debug/kea/2.4.0-r0/src/lib/dns/rdata/generic/detail, directory renamed /usr/src/debug/kea/2.2.0-r0/src/lib/hooks -> /usr/src/debug/kea/2.4.0-r0/src/lib/hooks, directory renamed /usr/src/debug/kea/2.2.0-r0/src/lib/stats -> /usr/src/debug/kea/2.4.0-r0/src/lib/stats, directory renamed /usr/src/debug/kea/2.2.0-r0/src/bin/agent -> /usr/src/debug/kea/2.4.0-r0/src/bin/agent, directory renamed /usr/src/debug/kea/2.2.0-r0/src/lib/process -> /usr/src/debug/kea/2.4.0-r0/src/lib/process, directory renamed /usr/src/debug/kea/2.2.0-r0/src/hooks/dhcp/bootp -> /usr/src/debug/kea/2.4.0-r0/src/hooks/dhcp/bootp, directory renamed /usr/src/debug/kea/2.2.0-r0/src/lib/cc -> /usr/src/debug/kea/2.4.0-r0/src/lib/cc, directory renamed /usr/src/debug/kea/2.2.0-r0/src/lib/cfgrpt -> /usr/src/debug/kea/2.4.0
 -r0/src/lib/process/cfgrpt, directory renamed /usr/src/debug/kea/2.2.0-r0/src/lib/exceptions -> /usr/src/debug/kea/2.4.0-r0/src/lib/exceptions, directory renamed /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/parsers -> /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/parsers, directory renamed /usr/src/debug/kea/2.2.0-r0/src/lib/config -> /usr/src/debug/kea/2.4.0-r0/src/lib/config, directory renamed /usr/src/debug/kea/2.2.0-r0/src/lib/eval -> /usr/src/debug/kea/2.4.0-r0/src/lib/eval, directory renamed /usr/src/debug/kea/2.2.0-r0/src/hooks/dhcp/run_script -> /usr/src/debug/kea/2.4.0-r0/src/hooks/dhcp/run_script, removed "/usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/host.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/lease_file_stats.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/pool.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/ip_range.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/dhcpsrv_log.cc /usr/src/debug/kea/2.2.0-r0/src/lib/util/reconnect_ctl.cc /usr/src/debug/kea/2.2.0-r0/src/lib/
 dhcp/option_custom.cc /usr/src/debug/kea/2.2.0-r0/src/lib/util/csv_file.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/stopwatch.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/watched_thread.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/connection.cc /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/unix_domain_socket.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/alloc_engine.cc /usr/src/debug/kea/2.2.0-r0/src/lib/http/url.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option6_status_code.cc /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/io_address.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfgmgr.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/dhcpsrv_messages.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_db_access.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/classify.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_mac_source.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/basic_auth.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/lease_mgr.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/shared_network.h /
 usr/src/debug/kea/2.2.0-r0/src/lib/http/response_parser.cc /usr/src/debug/kea/2.2.0-r0/src/lib/util/labeled_value.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option_int.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/ip_range_permutation.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/auth_log.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cache_host_data_source.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/response_creator.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/duid.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/host_container.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/connection.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/date_time.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option_space.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/range_utilities.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/client.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_iface.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/http_messages.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option_vendor_class.h /usr/src/debug/kea/2
 .2.0-r0/src/lib/asiolink/io_service_signal.cc /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/io_endpoint.cc /usr/src/debug/kea/2.2.0-r0/src/lib/http/http_thread_pool.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/http_types.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/state_model.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option6_iaprefix.cc /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/openssl_tls.cc /usr/src/debug/kea/2.2.0-r0/src/lib/http/response_context.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/alloc_engine_log.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/resource_handler.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/filename.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/boost_time_utils.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/watch_socket.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/iface_mgr.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/base_host_data_source.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cb_ctl_dhcp4.cc /usr/src/debu
 g/kea/2.2.0-r0/src/lib/dhcpsrv/cb_ctl_dhcp6.cc /usr/src/debug/kea/2.2.0-r0/src/lib/http/post_request.cc /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/io_socket.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfgmgr.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/duid.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option_string.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cb_ctl_dhcp.h /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/tcp_endpoint.h /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/udp_endpoint.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/subnet_selector.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_4o6.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/hosts_messages.cc /usr/src/debug/kea/2.2.0-r0/src/lib/util/filename.cc /usr/src/debug/kea/2.2.0-r0/src/lib/util/memory_segment_local.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/libdhcp++.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option_opaque_data_tuples.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/versioned_csv_file.cc /usr/src/debug/
 kea/2.2.0-r0/src/lib/dhcp/pkt_filter_inet6.cc /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/common_tls.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_multi_threading.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/opaque_data_tuple.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/request_context.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/host_mgr.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/auth_messages.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/duid_factory.h /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/unix_domain_socket.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option_opaque_data_tuples.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/docsis3_option_defs.h /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/io_service.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/protocol_util.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option_definition.cc /usr/src/debug/kea/2.2.0-r0/src/lib/http/http_header.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_hosts.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cf
 g_mac_source.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_option.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/packet_queue_mgr6.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/d2_client_cfg.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_option.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/http_thread_pool.cc /usr/src/debug/kea/2.2.0-r0/src/lib/http/auth_log.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/hwaddr.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/pkt4o6.cc /usr/src/debug/kea/2.2.0-r0/src/lib/http/response_parser.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_expiration.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/pkt_filter6.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/response_creator.cc /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/io_service.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option_string.h /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/tcp_acceptor.h /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/tls_acceptor.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/ncr_generato
 r.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/free_lease_queue.cc /usr/src/debug/kea/2.2.0-r0/src/lib/util/memory_segment.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/d2_client_mgr.cc /usr/src/debug/kea/2.2.0-r0/src/lib/util/versioned_csv_file.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option_vendor.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/alloc_engine_messages.cc /usr/src/debug/kea/2.2.0-r0/src/lib/util/csv_file.cc /usr/src/debug/kea/2.2.0-r0/src/lib/http/basic_auth.cc /usr/src/debug/kea/2.2.0-r0/src/hooks/dhcp/lease_cmds/lease_cmds_messages.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/iface_mgr_linux.cc /usr/src/debug/kea/2.2.0-r0/src/hooks/dhcp/lease_cmds/lease_cmds_log.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/pkt_filter_inet.cc /usr/src/debug/kea/2.2.0-r0/src/lib/http/http_message_parser_base.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_hosts_util.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_option_def.cc /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/common_t
 ls.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/pkt_filter_inet6.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option6_ia.cc /usr/src/debug/kea/2.2.0-r0/src/hooks/dhcp/lease_cmds/version.cc /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/unix_domain_socket_acceptor.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/iface_mgr.cc /usr/src/debug/kea/2.2.0-r0/src/lib/util/multi_threading_mgr.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_shared_networks.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/memfile_lease_limits.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/chrono_time_utils.h /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/interval_timer.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/dhcp4.h /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/io_acceptor.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/dhcp6.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/lease_mgr_factory.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cb_ctl_dhcp4.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cb_ctl_dhcp6.h /usr/src/debug/kea/2.2.
 0-r0/src/lib/dhcpsrv/config_backend_dhcp4_mgr.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/config_backend_dhcp6_mgr.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/labeled_value.cc /usr/src/debug/kea/2.2.0-r0/src/lib/http/auth_config.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/strutil.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option6_iaaddr.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option_definition.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/request_parser.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_duid.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/dhcp_space.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/client_class_def.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/ip_range.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/connection_pool.cc /usr/src/debug/kea/2.2.0-r0/src/lib/util/watched_thread.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/ncr_generator.h /usr/src/debug/kea/2.2.0-r0/src/hooks/dhcp/lease_cmds/lease_cmds_callouts.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/pkt6.h /us
 r/src/debug/kea/2.2.0-r0/src/lib/dhcp/option_space_container.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/response_json.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/http_message_parser_base.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/duid_factory.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_consistency.h /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/addr_utilities.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/lease.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/multi_threading_mgr.cc /usr/src/debug/kea/2.2.0-r0/src/lib/http/date_time.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/pid_file.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/packet_queue.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/http_log.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option6_pdexclude.cc /usr/src/debug/kea/2.2.0-r0/src/lib/util/time_utilities.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/utils.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option4_client_fqdn.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option6_client_fqdn.h
  /usr/src/debug/kea/2.2.0-r0/src/lib/http/listener_impl.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/hosts_messages.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option_vendor.cc /usr/src/debug/kea/2.2.0-r0/src/lib/util/optional.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/ip_range_permutation.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/pkt4.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/pkt_filter.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_globals.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_globals.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/subnet.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/socket_info.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/subnet.cc /usr/src/debug/kea/2.2.0-r0/src/lib/util/staged_value.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/pkt_filter_lpf.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option4_client_fqdn.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option6_client_fqdn.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/lease.cc /usr/src/debug/kea/2.2
 .0-r0/src/lib/http/http_header.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/writable_host_data_source.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_hosts.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_subnets4.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_subnets6.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option_space.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_duid.cc /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/io_address.cc /usr/src/debug/kea/2.2.0-r0/src/lib/http/request.cc /usr/src/debug/kea/2.2.0-r0/src/lib/util/file_utilities.cc /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/io_endpoint.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/sanity_checker.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/basic_auth_config.cc /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/io_socket.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option6_iaaddr.cc /usr/src/debug/kea/2.2.0-r0/src/lib/http/request_parser.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/shared_network.cc /usr/src/deb
 ug/kea/2.2.0-r0/src/lib/dhcpsrv/host_data_source_factory.cc /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/io_error.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/auth_messages.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_host_operations.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/csv_lease_file4.cc /usr/src/debug/kea/2.2.0-r0/src/lib/util/io_utilities.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option6_status_code.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/alloc_engine_messages.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_subnets4.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_subnets6.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option6_auth.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_consistency.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option6_ia.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/request.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option6_auth.cc /usr/src/debug/kea/2.2.0-r0/src/lib/util/readwrite_mutex.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/classify
 .cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option4_addrlst.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option6_addrlst.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/http_acceptor.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/client_class_def.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/opaque_data_tuple.cc /usr/src/debug/kea/2.2.0-r0/src/lib/util/chrono_time_utils.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/lease_mgr_factory.cc /usr/src/debug/kea/2.2.0-r0/src/lib/http/http_message.cc /usr/src/debug/kea/2.2.0-r0/src/lib/util/stopwatch.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option_data_types.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/post_request_json.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/config_backend_dhcp4.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/config_backend_dhcp6.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/host_data_source_factory.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/client.cc /usr/src/debug/kea/2.2.0-r0
 /src/lib/http/header_context.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_option_def.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/dhcpsrv_exceptions.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/stopwatch_impl.h /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/addr_utilities.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_iface.cc /usr/src/debug/kea/2.2.0-r0/src/lib/http/response.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/config_backend_pool_dhcp6.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/memfile_lease_mgr.cc /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/process_spawn.cc /usr/src/debug/kea/2.2.0-r0/src/hooks/dhcp/lease_cmds/lease_cmds_messages.cc /usr/src/debug/kea/2.2.0-r0/src/lib/http/http_messages.cc /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/interval_timer.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/unlock_guard.h /usr/src/debug/kea/2.2.0-r0/src/hooks/dhcp/lease_cmds/lease_parser.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/packet_queue_mgr4.h /usr/src/debug/kea/2.2.0-r0
 /src/lib/util/stopwatch_impl.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/config_backend_pool_dhcp4.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/csv_lease_file6.cc /usr/src/debug/kea/2.2.0-r0/src/lib/http/response.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/packet_queue_mgr6.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/libdhcp++.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/packet_queue_ring.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/file_utilities.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/network_state.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/d2_client_mgr.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/dhcp4o6_ipc.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option_data_types.cc /usr/src/debug/kea/2.2.0-r0/src/lib/util/strutil.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/boost_time_utils.cc /usr/src/debug/kea/2.2.0-r0/src/lib/http/post_request.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/post_request_json.cc /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/io_service_signal.h /usr/src/
 debug/kea/2.2.0-r0/src/lib/util/buffer.h /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/process_spawn.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_rsoo.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/pkt_filter6.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/timer_mgr.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/pkt4.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/protocol_util.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/host_mgr.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/srv_config.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/pkt_filter.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option_custom.h /usr/src/debug/kea/2.2.0-r0/src/hooks/dhcp/lease_cmds/lease_cmds.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/std_option_defs.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/connection_pool.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/thread_pool.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/packet_queue_mgr4.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/network.h /usr/src/debug/kea/2.2.0-r0/src/lib/a
 siolink/io_asio_socket.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/pkt_filter_lpf.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/lease_file_loader.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/pkt.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/url.cc /usr/src/debug/kea/2.2.0-r0/src/lib/util/time_utilities.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option6_pdexclude.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/reconnect_ctl.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/key_from_key.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/hosts_log.cc /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/unix_domain_socket_endpoint.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/alloc_engine.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/http_message.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option4_addrlst.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option6_addrlst.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_db_access.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/hosts_log.h /usr/src/debug/kea/2.2.0-r0/src/lib/
 dhcp/option6_iaprefix.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_expiration.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_4o6.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_host_operations.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/free_lease_queue.h /usr/src/debug/kea/2.2.0-r0/src/hooks/dhcp/lease_cmds/lease_cmds_log.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/d2_client_cfg.h /usr/src/debug/kea/2.2.0-r0/src/hooks/dhcp/lease_cmds/lease_cmds.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/triplet.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_hosts_util.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/pkt_filter_inet.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/pkt.cc /usr/src/debug/kea/2.2.0-r0/src/lib/util/memory_segment_local.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/watch_socket.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/memfile_lease_mgr.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/state_model.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/callout_handle_store.h /u
 sr/src/debug/kea/2.2.0-r0/src/lib/http/basic_auth_config.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/lease_mgr.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/dhcpsrv_log.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/srv_config.h /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/tcp_socket.h /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/tls_socket.h /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/udp_socket.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/network_state.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/packet_queue_mgr.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/http_log.h /usr/src/debug/kea/2.2.0-r0/src/hooks/dhcp/lease_cmds/lease_parser.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/pid_file.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/config_backend_dhcp4_mgr.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/config_backend_dhcp6_mgr.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/subnet_id.h /usr/src/debug/kea/2.2.0-r0/src/lib/util/pointer_util.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsr
 v/sanity_checker.cc /usr/src/debug/kea/2.2.0-r0/src/lib/http/listener.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/network.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/memfile_lease_storage.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/alloc_engine_log.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option_vendor_class.cc /usr/src/debug/kea/2.2.0-r0/src/lib/http/response_creator_factory.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/host.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/pool.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_rsoo.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/timer_mgr.h /usr/src/debug/kea/2.2.0-r0/src/lib/asiolink/openssl_tls.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/config_backend_pool_dhcp4.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/csv_lease_file6.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_shared_networks.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/memfile_lease_limits.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/hwaddr.h /usr/src/debug/
 kea/2.2.0-r0/src/lib/dhcp/pkt4o6.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/dhcp4o6_ipc.cc /usr/src/debug/kea/2.2.0-r0/src/lib/util/dhcp_space.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/cfg_multi_threading.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/listener.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/option_int_array.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcp/pkt6.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/resource_handler.cc /usr/src/debug/kea/2.2.0-r0/src/lib/http/listener_impl.h /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/csv_lease_file4.h /usr/src/debug/kea/2.2.0-r0/src/lib/http/response_json.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/config_backend_pool_dhcp6.cc /usr/src/debug/kea/2.2.0-r0/src/lib/dhcpsrv/dhcpsrv_messages.cc", added "/usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/host.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/lease_file_stats.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/pool.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/ip_range.cc /usr/src/deb
 ug/kea/2.4.0-r0/src/lib/dhcpsrv/dhcpsrv_log.cc /usr/src/debug/kea/2.4.0-r0/src/lib/util/reconnect_ctl.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option_custom.cc /usr/src/debug/kea/2.4.0-r0/src/lib/util/csv_file.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/stopwatch.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/watched_thread.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/connection.cc /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/unix_domain_socket.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/alloc_engine.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/url.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option6_status_code.cc /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/io_address.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfgmgr.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/dhcpsrv_messages.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/iterative_allocation_state.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_db_access.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/classify.h /usr/src/debug/kea
 /2.4.0-r0/src/lib/dhcpsrv/cfg_mac_source.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/basic_auth.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/lease_mgr.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/shared_network.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/response_parser.cc /usr/src/debug/kea/2.4.0-r0/src/lib/util/labeled_value.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option_int.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/ip_range_permutation.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/flq_allocation_state.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/auth_log.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cache_host_data_source.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/response_creator.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/duid.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/host_container.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/connection.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/date_time.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option_space.h /usr/src/debug/kea/2.4
 .0-r0/src/lib/util/range_utilities.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/client.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_iface.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/http_messages.h /usr/src/debug/kea/2.4.0-r0/src/lib/tcp/tcp_connection_acceptor.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option_vendor_class.h /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/io_service_signal.cc /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/io_endpoint.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/http_types.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/state_model.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option6_iaprefix.cc /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/openssl_tls.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/response_context.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/alloc_engine_log.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/resource_handler.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/filename.h /usr/src/debug/kea/2.4
 .0-r0/src/lib/util/boost_time_utils.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/watch_socket.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/iface_mgr.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/base_host_data_source.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cb_ctl_dhcp4.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cb_ctl_dhcp6.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/post_request.cc /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/io_socket.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfgmgr.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/duid.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option_string.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cb_ctl_dhcp.h /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/tcp_endpoint.h /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/udp_endpoint.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/subnet_selector.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_4o6.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/hosts_messages.cc /usr/src/debug/kea/2.4.0-r0/sr
 c/lib/util/filename.cc /usr/src/debug/kea/2.4.0-r0/src/lib/util/memory_segment_local.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/libdhcp++.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option_opaque_data_tuples.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/versioned_csv_file.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/pkt_filter_inet6.cc /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/common_tls.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_multi_threading.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/opaque_data_tuple.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/request_context.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/host_mgr.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/auth_messages.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/duid_factory.h /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/unix_domain_socket.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option_opaque_data_tuples.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/docsis3_option_defs.h /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/io_
 service.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/protocol_util.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option_definition.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/http_header.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_hosts.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_mac_source.cc /usr/src/debug/kea/2.4.0-r0/src/lib/tcp/tcp_connection.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/allocation_state.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_option.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/packet_queue_mgr6.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/d2_client_cfg.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_option.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/auth_log.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/hwaddr.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/pkt4o6.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/response_parser.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_expiration.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/pkt_filter6.h /u
 sr/src/debug/kea/2.4.0-r0/src/lib/http/response_creator.cc /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/io_service.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option_string.h /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/tcp_acceptor.h /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/tls_acceptor.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/ncr_generator.cc /usr/src/debug/kea/2.4.0-r0/src/lib/tcp/mt_tcp_listener_mgr.cc /usr/src/debug/kea/2.4.0-r0/src/lib/util/memory_segment.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/allocator.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/d2_client_mgr.cc /usr/src/debug/kea/2.4.0-r0/src/lib/util/versioned_csv_file.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option4_dnr.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option6_dnr.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option_vendor.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/alloc_engine_messages.cc /usr/src/debug/kea/2.4.0-r0/src/lib/util/csv_file.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/basic_auth.c
 c /usr/src/debug/kea/2.4.0-r0/src/hooks/dhcp/lease_cmds/lease_cmds_messages.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/iface_mgr_linux.cc /usr/src/debug/kea/2.4.0-r0/src/hooks/dhcp/lease_cmds/lease_cmds_log.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/pkt_filter_inet.cc /usr/src/debug/kea/2.4.0-r0/src/lib/tcp/tcp_stream_msg.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/http_message_parser_base.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_hosts_util.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_option_def.cc /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/common_tls.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/pkt_filter_inet6.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option6_ia.cc /usr/src/debug/kea/2.4.0-r0/src/lib/tcp/tcp_connection.h /usr/src/debug/kea/2.4.0-r0/src/hooks/dhcp/lease_cmds/version.cc /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/unix_domain_socket_acceptor.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/iface_mgr.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/allocator
 .cc /usr/src/debug/kea/2.4.0-r0/src/lib/util/multi_threading_mgr.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_shared_networks.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/memfile_lease_limits.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/iterative_allocation_state.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/chrono_time_utils.h /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/interval_timer.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/dhcp4.h /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/io_acceptor.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/dhcp6.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/lease_mgr_factory.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cb_ctl_dhcp4.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cb_ctl_dhcp6.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/iterative_allocator.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/config_backend_dhcp4_mgr.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/config_backend_dhcp6_mgr.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/labeled_val
 ue.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/auth_config.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/strutil.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option6_iaaddr.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option_definition.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/request_parser.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_duid.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/dhcp_space.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/client_class_def.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/ip_range.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/connection_pool.cc /usr/src/debug/kea/2.4.0-r0/src/lib/util/watched_thread.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/ncr_generator.h /usr/src/debug/kea/2.4.0-r0/src/hooks/dhcp/lease_cmds/lease_cmds_callouts.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/pkt6.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option_space_container.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/response_json.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/http_messa
 ge_parser_base.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/duid_factory.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_consistency.h /usr/src/debug/kea/2.4.0-r0/src/lib/tcp/tcp_log.h /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/addr_utilities.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/lease.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/multi_threading_mgr.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/date_time.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/pid_file.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/packet_queue.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/http_log.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option6_pdexclude.cc /usr/src/debug/kea/2.4.0-r0/src/lib/util/time_utilities.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/utils.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option4_client_fqdn.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option6_client_fqdn.h /usr/src/debug/kea/2.4.0-r0/src/lib/tcp/tcp_listener.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/listener_impl.cc /usr/s
 rc/debug/kea/2.4.0-r0/src/lib/dhcpsrv/hosts_messages.h /usr/src/debug/kea/2.4.0-r0/src/lib/tcp/tcp_stream_msg.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option_vendor.cc /usr/src/debug/kea/2.4.0-r0/src/lib/util/optional.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/ip_range_permutation.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/pkt4.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/pkt_filter.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_globals.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_globals.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/subnet.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/socket_info.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/subnet.cc /usr/src/debug/kea/2.4.0-r0/src/lib/util/staged_value.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/pkt_filter_lpf.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option4_client_fqdn.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option6_client_fqdn.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/lease.cc /usr/src/debug/kea/2.4.0-r0/sr
 c/lib/http/http_header.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/writable_host_data_source.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_hosts.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_subnets4.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_subnets6.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option_space.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_duid.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/flq_allocator.h /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/io_address.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/request.cc /usr/src/debug/kea/2.4.0-r0/src/lib/util/file_utilities.cc /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/io_endpoint.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/sanity_checker.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/basic_auth_config.cc /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/io_socket.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option6_iaaddr.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/request_parser.cc /usr/src/debug/kea/2.4
 .0-r0/src/lib/dhcpsrv/shared_network.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/host_data_source_factory.cc /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/io_error.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/auth_messages.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_host_operations.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/csv_lease_file4.cc /usr/src/debug/kea/2.4.0-r0/src/lib/util/io_utilities.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option6_status_code.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/alloc_engine_messages.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_subnets4.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_subnets6.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option6_auth.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_consistency.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option6_ia.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/request.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/bigints.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option6_auth.cc /usr/
 src/debug/kea/2.4.0-r0/src/lib/util/readwrite_mutex.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/classify.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option4_addrlst.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option6_addrlst.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/http_acceptor.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/client_class_def.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/opaque_data_tuple.cc /usr/src/debug/kea/2.4.0-r0/src/lib/util/chrono_time_utils.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/lease_mgr_factory.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/http_message.cc /usr/src/debug/kea/2.4.0-r0/src/lib/util/stopwatch.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option_data_types.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/flq_allocator.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/post_request_json.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/config_backend_dhcp4.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/config_b
 ackend_dhcp6.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/host_data_source_factory.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/header_context.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/client.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_option_def.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/dhcpsrv_exceptions.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/stopwatch_impl.h /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/addr_utilities.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_iface.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/response.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/config_backend_pool_dhcp6.h /usr/src/debug/kea/2.4.0-r0/src/lib/tcp/mt_tcp_listener_mgr.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/memfile_lease_mgr.cc /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/process_spawn.cc /usr/src/debug/kea/2.4.0-r0/src/hooks/dhcp/lease_cmds/lease_cmds_messages.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/allocation_state.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/http
 _messages.cc /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/interval_timer.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/unlock_guard.h /usr/src/debug/kea/2.4.0-r0/src/hooks/dhcp/lease_cmds/lease_parser.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/packet_queue_mgr4.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/stopwatch_impl.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/config_backend_pool_dhcp4.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/csv_lease_file6.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/response.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/packet_queue_mgr6.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/libdhcp++.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/packet_queue_ring.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/file_utilities.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/network_state.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/d2_client_mgr.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/dhcp4o6_ipc.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option_data_types.cc /usr/src/debug/
 kea/2.4.0-r0/src/lib/util/strutil.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/boost_time_utils.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/post_request.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/post_request_json.cc /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/io_service_signal.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/buffer.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/random_allocation_state.cc /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/process_spawn.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_rsoo.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/pkt_filter6.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/timer_mgr.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/pkt4.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/protocol_util.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/host_mgr.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/srv_config.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/pkt_filter.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option_custom.h /usr/src/debug/kea/2.4.0-r0/src/ho
 oks/dhcp/lease_cmds/lease_cmds.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/std_option_defs.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/random_allocator.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/connection_pool.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/thread_pool.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/packet_queue_mgr4.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/network.h /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/io_asio_socket.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/iterative_allocator.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/pkt_filter_lpf.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/lease_file_loader.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/pkt.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/url.cc /usr/src/debug/kea/2.4.0-r0/src/lib/util/time_utilities.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option6_pdexclude.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/reconnect_ctl.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/key_from_key.h /usr/src/debug/kea/2.4.0-r0/
 src/lib/dhcpsrv/hosts_log.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option4_dnr.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option6_dnr.cc /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/unix_domain_socket_endpoint.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/alloc_engine.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/http_message.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option4_addrlst.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option6_addrlst.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_db_access.h /usr/src/debug/kea/2.4.0-r0/src/hooks/dhcp/lease_cmds/lease_cmds_exceptions.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/hosts_log.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option6_iaprefix.h /usr/src/debug/kea/2.4.0-r0/src/lib/tcp/tcp_log.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_expiration.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_4o6.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_host_operations.cc /usr/src/debug/kea/2.4.0-r0/src/hooks/dhcp/lease_cmds/leas
 e_cmds_log.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/d2_client_cfg.h /usr/src/debug/kea/2.4.0-r0/src/hooks/dhcp/lease_cmds/lease_cmds.h /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/io_service_thread_pool.cc /usr/src/debug/kea/2.4.0-r0/src/lib/tcp/tcp_connection_pool.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/triplet.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_hosts_util.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/pkt_filter_inet.h /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/io_service_thread_pool.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/pkt.cc /usr/src/debug/kea/2.4.0-r0/src/lib/util/memory_segment_local.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/watch_socket.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/memfile_lease_mgr.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/state_model.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/callout_handle_store.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/basic_auth_config.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/lease_mgr.cc /usr/src/
 debug/kea/2.4.0-r0/src/lib/dhcpsrv/dhcpsrv_log.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/srv_config.h /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/tcp_socket.h /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/tls_socket.h /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/udp_socket.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/network_state.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/packet_queue_mgr.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/http_log.h /usr/src/debug/kea/2.4.0-r0/src/hooks/dhcp/lease_cmds/lease_parser.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/pid_file.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/config_backend_dhcp4_mgr.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/config_backend_dhcp6_mgr.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/subnet_id.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/flq_allocation_state.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/random_allocator.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/pointer_util.h /usr/src/debug/kea/2.4.0-r0/src/lib/d
 hcpsrv/sanity_checker.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/listener.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/network.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/memfile_lease_storage.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/alloc_engine_log.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option_vendor_class.cc /usr/src/debug/kea/2.4.0-r0/src/lib/tcp/tcp_listener.h /usr/src/debug/kea/2.4.0-r0/src/lib/http/response_creator_factory.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/host.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/pool.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_rsoo.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/timer_mgr.h /usr/src/debug/kea/2.4.0-r0/src/lib/asiolink/openssl_tls.h /usr/src/debug/kea/2.4.0-r0/src/lib/tcp/tcp_messages.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/config_backend_pool_dhcp4.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/csv_lease_file6.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_shared_networks.h /usr/src/debug/kea
 /2.4.0-r0/src/lib/dhcpsrv/memfile_lease_limits.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/hwaddr.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/pkt4o6.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/dhcp4o6_ipc.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/tracking_lease_mgr.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/tracking_lease_mgr.h /usr/src/debug/kea/2.4.0-r0/src/lib/util/dhcp_space.h /usr/src/debug/kea/2.4.0-r0/src/lib/tcp/tcp_connection_pool.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/cfg_multi_threading.h /usr/src/debug/kea/2.4.0-r0/src/lib/tcp/tcp_messages.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/listener.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/option_int_array.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/random_allocation_state.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcp/pkt6.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/resource_handler.cc /usr/src/debug/kea/2.4.0-r0/src/lib/http/listener_impl.h /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/csv_lease_file4.h /usr
 /src/debug/kea/2.4.0-r0/src/lib/http/response_json.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/config_backend_pool_dhcp6.cc /usr/src/debug/kea/2.4.0-r0/src/lib/dhcpsrv/dhcpsrv_messages.cc"
packages/core2-32-poky-linux/kea/kea-src: PKGSIZE changed from 11742853 to 12452666 (+6%)
packages/core2-32-poky-linux/kea/kea-src: PV changed from "2.2.0" to "2.4.0"
packages/core2-32-poky-linux/kea/kea-src: PKGV changed from 2.2.0 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/kea/kea-staticdev: PV changed from "2.2.0" to "2.4.0"
packages/core2-32-poky-linux/kea/kea-staticdev: PKGV changed from 2.2.0 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/kea/kea: FILELIST: removed "/usr/lib/libkea-process.so.40.0.0 /usr/lib/libkea-dhcpsrv.so.69 /usr/lib/libkea-asiolink.so.40 /usr/lib/libkea-d2srv.so.16.0.0 /usr/lib/libkea-hooks.so.57.0.0 /usr/lib/libkea-dhcp_ddns.so.29.0.0 /usr/lib/libkea-http.so.42 /usr/lib/libkea-stats.so.18.0.0 /usr/lib/libkea-eval.so.39.0.0 /usr/lib/libkea-util.so.52 /usr/lib/libkea-cryptolink.so.28.0.0 /usr/lib/libkea-database.so.35 /usr/lib/libkea-dhcpsrv.so.69.0.0 /usr/lib/libkea-asiodns.so.24 /usr/lib/libkea-cfgclient.so.36.0.0 /usr/lib/libkea-exceptions.so.13 /usr/lib/libkea-dhcp++.so.54.0.0 /usr/lib/libkea-database.so.35.0.0 /usr/lib/libkea-log.so.35.0.0 /usr/lib/libkea-dhcp++.so.54 /usr/lib/libkea-eval.so.39 /usr/lib/libkea-stats.so.18 /usr/lib/libkea-dns++.so.30.0.0 /usr/lib/libkea-cc.so.39.0.0 /usr/lib/libkea-http.so.42.0.0 /usr/lib/libkea-asiolink.so.40.0.0 /usr/lib/libkea-hooks.so.57 /usr/lib/libkea-dhcp_ddns.so.29 /usr/lib/libkea-log.so.35 /usr/lib/libkea-dns++.so.30 /usr/
 lib/libkea-cc.so.39 /usr/lib/libkea-asiodns.so.24.0.0 /usr/lib/libkea-cfgclient.so.36 /usr/lib/libkea-process.so.40 /usr/lib/libkea-cryptolink.so.28 /usr/lib/libkea-exceptions.so.13.0.0 /usr/lib/libkea-util.so.52.0.0 /usr/lib/libkea-d2srv.so.16", added "/usr/share/kea/api/lease6-write.json /usr/lib/libkea-process.so.57.0.0 /usr/lib/libkea-dhcp_ddns.so.41.0.0 /usr/lib/libkea-dhcp++.so.73.0.0 /usr/lib/libkea-dhcpsrv.so.89 /usr/lib/libkea-stats.so.29 /usr/lib/libkea-hooks.so.77.0.0 /usr/share/kea/api/config-hash-get.json /usr/lib/libkea-http.so.56.0.0 /usr/lib/libkea-stats.so.29.0.0 /usr/lib/libkea-cryptolink.so.38.0.0 /usr/lib/libkea-dhcp_ddns.so.41 /usr/lib/libkea-dhcpsrv.so.89.0.0 /usr/lib/libkea-tcp.so.5 /usr/lib/libkea-process.so.57 /usr/lib/libkea-cryptolink.so.38 /usr/lib/libkea-dns++.so.42 /usr/lib/libkea-cfgclient.so.51.0.0 /usr/share/kea/api/lease4-write.json /usr/lib/libkea-dhcp++.so.73 /usr/lib/libkea-hooks.so.77 /usr/share/kea/scripts/pgsql/upgrade_013_to_014.sh /usr/share
 /kea/scripts/pgsql/upgrade_014_to_015.sh /usr/lib/libkea-dns++.so.42.0.0 /usr/share/kea/api/reservation-get-by-address.json /usr/share/kea/scripts/pgsql/upgrade_015_to_016.sh /usr/share/kea/scripts/pgsql/upgrade_016_to_017.sh /usr/share/kea/scripts/pgsql/upgrade_017_to_018.sh /usr/lib/libkea-database.so.48.0.0 /usr/lib/libkea-asiolink.so.56 /usr/share/kea/api/reservation-update.json /usr/share/kea/scripts/mysql/upgrade_017_to_018.sh /usr/lib/libkea-d2srv.so.30.0.0 /usr/share/kea/scripts/mysql/upgrade_018_to_019.sh /usr/share/kea/scripts/mysql/upgrade_014_to_015.sh /usr/share/kea/scripts/mysql/upgrade_015_to_016.sh /usr/share/kea/scripts/mysql/upgrade_016_to_017.sh /usr/lib/libkea-log.so.48 /usr/lib/libkea-eval.so.52 /usr/lib/libkea-cc.so.54.0.0 /usr/share/kea/api/extended-info4-upgrade.json /usr/lib/libkea-asiolink.so.56.0.0 /usr/lib/libkea-tcp.so.5.0.0 /usr/lib/libkea-database.so.48 /usr/lib/libkea-util.so.68 /usr/lib/libkea-d2srv.so.30 /usr/lib/libkea-log.so.48.0.0 /usr/lib/libkea
 -eval.so.52.0.0 /usr/lib/libkea-asiodns.so.35.0.0 /usr/lib/libkea-asiodns.so.35 /usr/lib/libkea-cc.so.54 /usr/lib/libkea-exceptions.so.23 /usr/lib/libkea-exceptions.so.23.0.0 /usr/lib/libkea-util.so.68.0.0 /usr/lib/libkea-http.so.56 /usr/lib/libkea-cfgclient.so.51"
packages/core2-32-poky-linux/kea/kea: PKGSIZE changed from 16997078 to 18450135 (+9%)
packages/core2-32-poky-linux/kea/kea: PV changed from "2.2.0" to "2.4.0"
packages/core2-32-poky-linux/kea/kea: PKGV changed from 2.2.0 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/kea: SRC_URI changed from "http://ftp.isc.org/isc/kea/2.2.0/kea-2.2.0.tar.gz file://kea-dhcp4.service file://kea-dhcp6.service file://kea-dhcp-ddns.service file://kea-dhcp4-server file://kea-dhcp6-server file://kea-dhcp-ddns-server file://fix-multilib-conflict.patch file://fix_pid_keactrl.patch file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch" to "http://ftp.isc.org/isc/kea/2.4.0/kea-2.4.0.tar.gz file://kea-dhcp4.service file://kea-dhcp6.service file://kea-dhcp-ddns.service file://kea-dhcp4-server file://kea-dhcp6-server file://kea-dhcp-ddns-server file://fix-multilib-conflict.patch file://fix_pid_keactrl.patch file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch"
packages/core2-32-poky-linux/kea: PV changed from "2.2.0" to "2.4.0"
packages/core2-32-poky-linux/kea: PKGV changed from 2.2.0 [default] to 2.4.0 [default]
Changes to packages/core2-32-poky-linux/kea (sysroot):
  /usr/lib/libkea-asiodns.so changed symlink target from libkea-asiodns.so.24.0.0 to libkea-asiodns.so.35.0.0
  /usr/lib/libkea-asiolink.so changed symlink target from libkea-asiolink.so.40.0.0 to libkea-asiolink.so.56.0.0
  /usr/lib/libkea-cc.so changed symlink target from libkea-cc.so.39.0.0 to libkea-cc.so.54.0.0
  /usr/lib/libkea-cfgclient.so changed symlink target from libkea-cfgclient.so.36.0.0 to libkea-cfgclient.so.51.0.0
  /usr/lib/libkea-cryptolink.so changed symlink target from libkea-cryptolink.so.28.0.0 to libkea-cryptolink.so.38.0.0
  /usr/lib/libkea-d2srv.so changed symlink target from libkea-d2srv.so.16.0.0 to libkea-d2srv.so.30.0.0
  /usr/lib/libkea-database.so changed symlink target from libkea-database.so.35.0.0 to libkea-database.so.48.0.0
  /usr/lib/libkea-dhcp_ddns.so changed symlink target from libkea-dhcp_ddns.so.29.0.0 to libkea-dhcp_ddns.so.41.0.0
  /usr/lib/libkea-dhcp++.so changed symlink target from libkea-dhcp++.so.54.0.0 to libkea-dhcp++.so.73.0.0
  /usr/lib/libkea-dhcpsrv.so changed symlink target from libkea-dhcpsrv.so.69.0.0 to libkea-dhcpsrv.so.89.0.0
  /usr/lib/libkea-dns++.so changed symlink target from libkea-dns++.so.30.0.0 to libkea-dns++.so.42.0.0
  /usr/lib/libkea-eval.so changed symlink target from libkea-eval.so.39.0.0 to libkea-eval.so.52.0.0
  /usr/lib/libkea-exceptions.so changed symlink target from libkea-exceptions.so.13.0.0 to libkea-exceptions.so.23.0.0
  /usr/lib/libkea-hooks.so changed symlink target from libkea-hooks.so.57.0.0 to libkea-hooks.so.77.0.0
  /usr/lib/libkea-http.so changed symlink target from libkea-http.so.42.0.0 to libkea-http.so.56.0.0
  /usr/lib/libkea-log.so changed symlink target from libkea-log.so.35.0.0 to libkea-log.so.48.0.0
  /usr/lib/libkea-process.so changed symlink target from libkea-process.so.40.0.0 to libkea-process.so.57.0.0
  /usr/lib/libkea-stats.so changed symlink target from libkea-stats.so.18.0.0 to libkea-stats.so.29.0.0
  /usr/lib/libkea-util.so changed symlink target from libkea-util.so.52.0.0 to libkea-util.so.68.0.0
  /usr/lib/libkea-asiodns.so.24.0.0 moved to /usr/lib/libkea-asiodns.so.35.0.0
  /usr/lib/libkea-asiodns.so.24 moved to /usr/lib/libkea-asiodns.so.35
  /usr/lib/libkea-asiolink.so.40.0.0 moved to /usr/lib/libkea-asiolink.so.56.0.0
  /usr/lib/libkea-asiolink.so.40 moved to /usr/lib/libkea-asiolink.so.56
  /usr/lib/libkea-cc.so.39.0.0 moved to /usr/lib/libkea-cc.so.54.0.0
  /usr/lib/libkea-cc.so.39 moved to /usr/lib/libkea-cc.so.54
  /usr/lib/libkea-cfgclient.so.36.0.0 moved to /usr/lib/libkea-cfgclient.so.51.0.0
  /usr/lib/libkea-cfgclient.so.36 moved to /usr/lib/libkea-cfgclient.so.51
  /usr/lib/libkea-cryptolink.so.28.0.0 moved to /usr/lib/libkea-cryptolink.so.38.0.0
  /usr/lib/libkea-cryptolink.so.28 moved to /usr/lib/libkea-cryptolink.so.38
  /usr/lib/libkea-d2srv.so.16.0.0 moved to /usr/lib/libkea-d2srv.so.30.0.0
  /usr/lib/libkea-d2srv.so.16 moved to /usr/lib/libkea-d2srv.so.30
  /usr/lib/libkea-database.so.35.0.0 moved to /usr/lib/libkea-database.so.48.0.0
  /usr/lib/libkea-database.so.35 moved to /usr/lib/libkea-database.so.48
  /usr/lib/libkea-dhcp_ddns.so.29.0.0 moved to /usr/lib/libkea-dhcp_ddns.so.41.0.0
  /usr/lib/libkea-dhcp_ddns.so.29 moved to /usr/lib/libkea-dhcp_ddns.so.41
  /usr/lib/libkea-dhcp++.so.54.0.0 moved to /usr/lib/libkea-dhcp++.so.73.0.0
  /usr/lib/libkea-dhcp++.so.54 moved to /usr/lib/libkea-dhcp++.so.73
  /usr/lib/libkea-dhcpsrv.so.69.0.0 moved to /usr/lib/libkea-dhcpsrv.so.89.0.0
  /usr/lib/libkea-dhcpsrv.so.69 moved to /usr/lib/libkea-dhcpsrv.so.89
  /usr/lib/libkea-dns++.so.30.0.0 moved to /usr/lib/libkea-dns++.so.42.0.0
  /usr/lib/libkea-dns++.so.30 moved to /usr/lib/libkea-dns++.so.42
  /usr/lib/libkea-eval.so.39.0.0 moved to /usr/lib/libkea-eval.so.52.0.0
  /usr/lib/libkea-eval.so.39 moved to /usr/lib/libkea-eval.so.52
  /usr/lib/libkea-exceptions.so.13.0.0 moved to /usr/lib/libkea-exceptions.so.23.0.0
  /usr/lib/libkea-exceptions.so.13 moved to /usr/lib/libkea-exceptions.so.23
  /usr/lib/libkea-hooks.so.57.0.0 moved to /usr/lib/libkea-hooks.so.77.0.0
  /usr/lib/libkea-hooks.so.57 moved to /usr/lib/libkea-hooks.so.77
  /usr/lib/libkea-http.so.42.0.0 moved to /usr/lib/libkea-http.so.56.0.0
  /usr/lib/libkea-http.so.42 moved to /usr/lib/libkea-http.so.56
  /usr/lib/libkea-log.so.35.0.0 moved to /usr/lib/libkea-log.so.48.0.0
  /usr/lib/libkea-log.so.35 moved to /usr/lib/libkea-log.so.48
  /usr/lib/libkea-process.so.40.0.0 moved to /usr/lib/libkea-process.so.57.0.0
  /usr/lib/libkea-process.so.40 moved to /usr/lib/libkea-process.so.57
  /usr/lib/libkea-stats.so.18.0.0 moved to /usr/lib/libkea-stats.so.29.0.0
  /usr/lib/libkea-stats.so.18 moved to /usr/lib/libkea-stats.so.29
  /usr/lib/libkea-util.so.52.0.0 moved to /usr/lib/libkea-util.so.68.0.0
  /usr/lib/libkea-util.so.52 moved to /usr/lib/libkea-util.so.68
  /usr/include/kea/asiolink/io_service_thread_pool.h was added
  /usr/include/kea/dhcpsrv/allocation_state.h was added
  /usr/include/kea/dhcpsrv/allocator.h was added
  /usr/include/kea/dhcpsrv/cfg_globals.h was added
  /usr/include/kea/dhcpsrv/flq_allocation_state.h was added
  /usr/include/kea/dhcpsrv/flq_allocator.h was added
  /usr/include/kea/dhcpsrv/iterative_allocation_state.h was added
  /usr/include/kea/dhcpsrv/iterative_allocator.h was added
  /usr/include/kea/dhcpsrv/random_allocation_state.h was added
  /usr/include/kea/dhcpsrv/random_allocator.h was added
  /usr/include/kea/dhcpsrv/tracking_lease_mgr.h was added
  /usr/include/kea/tcp was added
  /usr/include/kea/tcp/mt_tcp_listener_mgr.h was added
  /usr/include/kea/tcp/tcp_connection_acceptor.h was added
  /usr/include/kea/tcp/tcp_connection.h was added
  /usr/include/kea/tcp/tcp_connection_pool.h was added
  /usr/include/kea/tcp/tcp_listener.h was added
  /usr/include/kea/tcp/tcp_log.h was added
  /usr/include/kea/tcp/tcp_messages.h was added
  /usr/include/kea/tcp/tcp_stream_msg.h was added
  /usr/include/kea/util/bigints.h was added
  /usr/lib/libkea-tcp.so.5.0.0 was added
  /usr/lib/libkea-tcp.so.5 was added
  /usr/lib/libkea-tcp.so was added
  /usr/share/kea/api/config-hash-get.json was added
  /usr/share/kea/api/extended-info4-upgrade.json was added
  /usr/share/kea/api/lease4-write.json was added
  /usr/share/kea/api/lease6-write.json was added
  /usr/share/kea/api/reservation-get-by-address.json was added
  /usr/share/kea/api/reservation-update.json was added
  /usr/share/kea/scripts/mysql/upgrade_014_to_015.sh was added
  /usr/share/kea/scripts/mysql/upgrade_015_to_016.sh was added
  /usr/share/kea/scripts/mysql/upgrade_016_to_017.sh was added
  /usr/share/kea/scripts/mysql/upgrade_017_to_018.sh was added
  /usr/share/kea/scripts/mysql/upgrade_018_to_019.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_013_to_014.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_014_to_015.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_015_to_016.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_016_to_017.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_017_to_018.sh was added
  /usr/include/kea/dhcpsrv/free_lease_queue.h was removed
  /usr/include/kea/http/http_thread_pool.h was removed

--===============6518726521550432616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/kea/kea-dbg: PKGSIZE changed from 265489932 to 300785248 (+13%)
packages/core2-32-poky-linux/kea/kea-dev: FILELIST: removed "/usr/include/kea/http/http_thread_pool.h /usr/include/kea/dhcpsrv/free_lease_queue.h", added "/usr/include/kea/dhcpsrv/flq_allocator.h /usr/include/kea/dhcpsrv/flq_allocation_state.h /usr/include/kea/dhcpsrv/allocator.h /usr/lib/libkea-tcp.so /usr/include/kea/asiolink/io_service_thread_pool.h /usr/include/kea/dhcpsrv/cfg_globals.h /usr/include/kea/tcp/tcp_listener.h /usr/include/kea/dhcpsrv/iterative_allocator.h /usr/include/kea/tcp/tcp_messages.h /usr/include/kea/dhcpsrv/tracking_lease_mgr.h /usr/include/kea/tcp/tcp_connection_acceptor.h /usr/include/kea/tcp/tcp_connection_pool.h /usr/include/kea/tcp/mt_tcp_listener_mgr.h /usr/include/kea/util/bigints.h /usr/include/kea/tcp/tcp_stream_msg.h /usr/include/kea/dhcpsrv/allocation_state.h /usr/include/kea/tcp/tcp_log.h /usr/include/kea/dhcpsrv/random_allocator.h /usr/include/kea/tcp/tcp_connection.h /usr/include/kea/dhcpsrv/random_allocation_state.h /usr/include/kea/dhcpsrv/ite
 rative_allocation_state.h"
packages/core2-32-poky-linux/kea/kea-doc: FILELIST: removed "/usr/share/doc/kea/examples/kea4/ha-load-balancing-primary.json /usr/share/doc/kea/examples/kea6/ha-hot-standby.json", added "/usr/share/doc/kea/examples/template-ha-mt-tls/kea-dhcp4-1.conf /usr/share/doc/kea/examples/template-ha-mt-tls/kea-dhcp4-2.conf /usr/share/doc/kea/examples/kea4/dnr.json /usr/share/doc/kea/examples/kea6/dnr.json /usr/share/doc/kea/examples/kea4/ha-load-balancing-server2-mt.json /usr/share/doc/kea/examples/template-ha-mt-tls/kea-ca-1.conf /usr/share/doc/kea/examples/kea4/ha-load-balancing-server1-mt-with-tls.json /usr/share/doc/kea/examples/template-ha-mt-tls/kea-ca-2.conf /usr/share/doc/kea/examples/template-ha-mt-tls/info.md /usr/share/doc/kea/examples/kea6/ha-hot-standby-server1-with-tls.json /usr/share/doc/kea/examples/kea6/ha-hot-standby-server2.json"
packages/core2-32-poky-linux/kea/kea-doc: PKGSIZE changed from 1196793 to 1322079 (+10%)
packages/core2-32-poky-linux/kea/kea: FILELIST: removed "/usr/lib/libkea-stats.so.18.0.0 /usr/lib/libkea-cryptolink.so.28.0.0 /usr/lib/libkea-database.so.35.0.0 /usr/lib/libkea-http.so.42 /usr/lib/libkea-cryptolink.so.28 /usr/lib/libkea-asiolink.so.40.0.0 /usr/lib/libkea-asiodns.so.24 /usr/lib/libkea-dhcpsrv.so.69 /usr/lib/libkea-exceptions.so.13.0.0 /usr/lib/libkea-dhcp++.so.54.0.0 /usr/lib/libkea-asiolink.so.40 /usr/lib/libkea-log.so.35 /usr/lib/libkea-process.so.40 /usr/lib/libkea-dhcpsrv.so.69.0.0 /usr/lib/libkea-dhcp_ddns.so.29 /usr/lib/libkea-log.so.35.0.0 /usr/lib/libkea-asiodns.so.24.0.0 /usr/lib/libkea-dns++.so.30 /usr/lib/libkea-d2srv.so.16 /usr/lib/libkea-eval.so.39.0.0 /usr/lib/libkea-stats.so.18 /usr/lib/libkea-cfgclient.so.36 /usr/lib/libkea-cfgclient.so.36.0.0 /usr/lib/libkea-http.so.42.0.0 /usr/lib/libkea-cc.so.39.0.0 /usr/lib/libkea-dhcp_ddns.so.29.0.0 /usr/lib/libkea-util.so.52 /usr/lib/libkea-database.so.35 /usr/lib/libkea-util.so.52.0.0 /usr/lib/libkea-process.so.
 40.0.0 /usr/lib/libkea-hooks.so.57 /usr/lib/libkea-dns++.so.30.0.0 /usr/lib/libkea-cc.so.39 /usr/lib/libkea-d2srv.so.16.0.0 /usr/lib/libkea-eval.so.39 /usr/lib/libkea-exceptions.so.13 /usr/lib/libkea-dhcp++.so.54 /usr/lib/libkea-hooks.so.57.0.0", added "/usr/lib/libkea-stats.so.29 /usr/lib/libkea-tcp.so.5.0.0 /usr/lib/libkea-util.so.68.0.0 /usr/lib/libkea-cryptolink.so.38.0.0 /usr/lib/libkea-util.so.68 /usr/lib/libkea-database.so.48.0.0 /usr/share/kea/api/lease4-write.json /usr/lib/libkea-tcp.so.5 /usr/lib/libkea-dhcp_ddns.so.41 /usr/lib/libkea-asiolink.so.56.0.0 /usr/lib/libkea-dns++.so.42.0.0 /usr/lib/libkea-dhcp++.so.73.0.0 /usr/lib/libkea-exceptions.so.23.0.0 /usr/lib/libkea-database.so.48 /usr/share/kea/api/reservation-get-by-address.json /usr/lib/libkea-dns++.so.42 /usr/share/kea/scripts/mysql/upgrade_014_to_015.sh /usr/share/kea/scripts/mysql/upgrade_015_to_016.sh /usr/share/kea/scripts/mysql/upgrade_016_to_017.sh /usr/share/kea/scripts/mysql/upgrade_017_to_018.sh /usr/share/
 kea/scripts/mysql/upgrade_018_to_019.sh /usr/lib/libkea-dhcpsrv.so.89.0.0 /usr/lib/libkea-log.so.48 /usr/lib/libkea-exceptions.so.23 /usr/share/kea/api/lease6-write.json /usr/share/kea/scripts/pgsql/upgrade_014_to_015.sh /usr/share/kea/scripts/pgsql/upgrade_013_to_014.sh /usr/share/kea/scripts/pgsql/upgrade_015_to_016.sh /usr/share/kea/scripts/pgsql/upgrade_016_to_017.sh /usr/share/kea/scripts/pgsql/upgrade_017_to_018.sh /usr/share/kea/api/config-hash-get.json /usr/lib/libkea-asiodns.so.35.0.0 /usr/lib/libkea-cfgclient.so.51.0.0 /usr/lib/libkea-d2srv.so.30 /usr/lib/libkea-dhcpsrv.so.89 /usr/lib/libkea-dhcp++.so.73 /usr/lib/libkea-eval.so.52 /usr/lib/libkea-http.so.56.0.0 /usr/lib/libkea-cc.so.54.0.0 /usr/lib/libkea-cfgclient.so.51 /usr/lib/libkea-dhcp_ddns.so.41.0.0 /usr/lib/libkea-eval.so.52.0.0 /usr/lib/libkea-http.so.56 /usr/lib/libkea-hooks.so.77.0.0 /usr/lib/libkea-cryptolink.so.38 /usr/lib/libkea-asiodns.so.35 /usr/share/kea/api/extended-info4-upgrade.json /usr/lib/libkea-hook
 s.so.77 /usr/lib/libkea-asiolink.so.56 /usr/lib/libkea-process.so.57.0.0 /usr/lib/libkea-log.so.48.0.0 /usr/lib/libkea-d2srv.so.30.0.0 /usr/lib/libkea-process.so.57 /usr/share/kea/api/reservation-update.json /usr/lib/libkea-cc.so.54 /usr/lib/libkea-stats.so.29.0.0"
Changes to packages/core2-32-poky-linux/kea (sysroot):
  /usr/lib/libkea-asiodns.so changed symlink target from libkea-asiodns.so.24.0.0 to libkea-asiodns.so.35.0.0
  /usr/lib/libkea-asiolink.so changed symlink target from libkea-asiolink.so.40.0.0 to libkea-asiolink.so.56.0.0
  /usr/lib/libkea-cc.so changed symlink target from libkea-cc.so.39.0.0 to libkea-cc.so.54.0.0
  /usr/lib/libkea-cfgclient.so changed symlink target from libkea-cfgclient.so.36.0.0 to libkea-cfgclient.so.51.0.0
  /usr/lib/libkea-cryptolink.so changed symlink target from libkea-cryptolink.so.28.0.0 to libkea-cryptolink.so.38.0.0
  /usr/lib/libkea-d2srv.so changed symlink target from libkea-d2srv.so.16.0.0 to libkea-d2srv.so.30.0.0
  /usr/lib/libkea-database.so changed symlink target from libkea-database.so.35.0.0 to libkea-database.so.48.0.0
  /usr/lib/libkea-dhcp_ddns.so changed symlink target from libkea-dhcp_ddns.so.29.0.0 to libkea-dhcp_ddns.so.41.0.0
  /usr/lib/libkea-dhcp++.so changed symlink target from libkea-dhcp++.so.54.0.0 to libkea-dhcp++.so.73.0.0
  /usr/lib/libkea-dhcpsrv.so changed symlink target from libkea-dhcpsrv.so.69.0.0 to libkea-dhcpsrv.so.89.0.0
  /usr/lib/libkea-dns++.so changed symlink target from libkea-dns++.so.30.0.0 to libkea-dns++.so.42.0.0
  /usr/lib/libkea-eval.so changed symlink target from libkea-eval.so.39.0.0 to libkea-eval.so.52.0.0
  /usr/lib/libkea-exceptions.so changed symlink target from libkea-exceptions.so.13.0.0 to libkea-exceptions.so.23.0.0
  /usr/lib/libkea-hooks.so changed symlink target from libkea-hooks.so.57.0.0 to libkea-hooks.so.77.0.0
  /usr/lib/libkea-http.so changed symlink target from libkea-http.so.42.0.0 to libkea-http.so.56.0.0
  /usr/lib/libkea-log.so changed symlink target from libkea-log.so.35.0.0 to libkea-log.so.48.0.0
  /usr/lib/libkea-process.so changed symlink target from libkea-process.so.40.0.0 to libkea-process.so.57.0.0
  /usr/lib/libkea-stats.so changed symlink target from libkea-stats.so.18.0.0 to libkea-stats.so.29.0.0
  /usr/lib/libkea-util.so changed symlink target from libkea-util.so.52.0.0 to libkea-util.so.68.0.0
  /usr/lib/libkea-asiodns.so.24.0.0 moved to /usr/lib/libkea-asiodns.so.35.0.0
  /usr/lib/libkea-asiodns.so.24 moved to /usr/lib/libkea-asiodns.so.35
  /usr/lib/libkea-asiolink.so.40.0.0 moved to /usr/lib/libkea-asiolink.so.56.0.0
  /usr/lib/libkea-asiolink.so.40 moved to /usr/lib/libkea-asiolink.so.56
  /usr/lib/libkea-cc.so.39.0.0 moved to /usr/lib/libkea-cc.so.54.0.0
  /usr/lib/libkea-cc.so.39 moved to /usr/lib/libkea-cc.so.54
  /usr/lib/libkea-cfgclient.so.36.0.0 moved to /usr/lib/libkea-cfgclient.so.51.0.0
  /usr/lib/libkea-cfgclient.so.36 moved to /usr/lib/libkea-cfgclient.so.51
  /usr/lib/libkea-cryptolink.so.28.0.0 moved to /usr/lib/libkea-cryptolink.so.38.0.0
  /usr/lib/libkea-cryptolink.so.28 moved to /usr/lib/libkea-cryptolink.so.38
  /usr/lib/libkea-d2srv.so.16.0.0 moved to /usr/lib/libkea-d2srv.so.30.0.0
  /usr/lib/libkea-d2srv.so.16 moved to /usr/lib/libkea-d2srv.so.30
  /usr/lib/libkea-database.so.35.0.0 moved to /usr/lib/libkea-database.so.48.0.0
  /usr/lib/libkea-database.so.35 moved to /usr/lib/libkea-database.so.48
  /usr/lib/libkea-dhcp_ddns.so.29.0.0 moved to /usr/lib/libkea-dhcp_ddns.so.41.0.0
  /usr/lib/libkea-dhcp_ddns.so.29 moved to /usr/lib/libkea-dhcp_ddns.so.41
  /usr/lib/libkea-dhcp++.so.54.0.0 moved to /usr/lib/libkea-dhcp++.so.73.0.0
  /usr/lib/libkea-dhcp++.so.54 moved to /usr/lib/libkea-dhcp++.so.73
  /usr/lib/libkea-dhcpsrv.so.69.0.0 moved to /usr/lib/libkea-dhcpsrv.so.89.0.0
  /usr/lib/libkea-dhcpsrv.so.69 moved to /usr/lib/libkea-dhcpsrv.so.89
  /usr/lib/libkea-dns++.so.30.0.0 moved to /usr/lib/libkea-dns++.so.42.0.0
  /usr/lib/libkea-dns++.so.30 moved to /usr/lib/libkea-dns++.so.42
  /usr/lib/libkea-eval.so.39.0.0 moved to /usr/lib/libkea-eval.so.52.0.0
  /usr/lib/libkea-eval.so.39 moved to /usr/lib/libkea-eval.so.52
  /usr/lib/libkea-exceptions.so.13.0.0 moved to /usr/lib/libkea-exceptions.so.23.0.0
  /usr/lib/libkea-exceptions.so.13 moved to /usr/lib/libkea-exceptions.so.23
  /usr/lib/libkea-hooks.so.57.0.0 moved to /usr/lib/libkea-hooks.so.77.0.0
  /usr/lib/libkea-hooks.so.57 moved to /usr/lib/libkea-hooks.so.77
  /usr/lib/libkea-http.so.42.0.0 moved to /usr/lib/libkea-http.so.56.0.0
  /usr/lib/libkea-http.so.42 moved to /usr/lib/libkea-http.so.56
  /usr/lib/libkea-log.so.35.0.0 moved to /usr/lib/libkea-log.so.48.0.0
  /usr/lib/libkea-log.so.35 moved to /usr/lib/libkea-log.so.48
  /usr/lib/libkea-process.so.40.0.0 moved to /usr/lib/libkea-process.so.57.0.0
  /usr/lib/libkea-process.so.40 moved to /usr/lib/libkea-process.so.57
  /usr/lib/libkea-stats.so.18.0.0 moved to /usr/lib/libkea-stats.so.29.0.0
  /usr/lib/libkea-stats.so.18 moved to /usr/lib/libkea-stats.so.29
  /usr/lib/libkea-util.so.52.0.0 moved to /usr/lib/libkea-util.so.68.0.0
  /usr/lib/libkea-util.so.52 moved to /usr/lib/libkea-util.so.68
  /usr/include/kea/asiolink/io_service_thread_pool.h was added
  /usr/include/kea/dhcpsrv/allocation_state.h was added
  /usr/include/kea/dhcpsrv/allocator.h was added
  /usr/include/kea/dhcpsrv/cfg_globals.h was added
  /usr/include/kea/dhcpsrv/flq_allocation_state.h was added
  /usr/include/kea/dhcpsrv/flq_allocator.h was added
  /usr/include/kea/dhcpsrv/iterative_allocation_state.h was added
  /usr/include/kea/dhcpsrv/iterative_allocator.h was added
  /usr/include/kea/dhcpsrv/random_allocation_state.h was added
  /usr/include/kea/dhcpsrv/random_allocator.h was added
  /usr/include/kea/dhcpsrv/tracking_lease_mgr.h was added
  /usr/include/kea/tcp was added
  /usr/include/kea/tcp/mt_tcp_listener_mgr.h was added
  /usr/include/kea/tcp/tcp_connection_acceptor.h was added
  /usr/include/kea/tcp/tcp_connection.h was added
  /usr/include/kea/tcp/tcp_connection_pool.h was added
  /usr/include/kea/tcp/tcp_listener.h was added
  /usr/include/kea/tcp/tcp_log.h was added
  /usr/include/kea/tcp/tcp_messages.h was added
  /usr/include/kea/tcp/tcp_stream_msg.h was added
  /usr/include/kea/util/bigints.h was added
  /usr/lib/libkea-tcp.so.5.0.0 was added
  /usr/lib/libkea-tcp.so.5 was added
  /usr/lib/libkea-tcp.so was added
  /usr/share/kea/api/config-hash-get.json was added
  /usr/share/kea/api/extended-info4-upgrade.json was added
  /usr/share/kea/api/lease4-write.json was added
  /usr/share/kea/api/lease6-write.json was added
  /usr/share/kea/api/reservation-get-by-address.json was added
  /usr/share/kea/api/reservation-update.json was added
  /usr/share/kea/scripts/mysql/upgrade_014_to_015.sh was added
  /usr/share/kea/scripts/mysql/upgrade_015_to_016.sh was added
  /usr/share/kea/scripts/mysql/upgrade_016_to_017.sh was added
  /usr/share/kea/scripts/mysql/upgrade_017_to_018.sh was added
  /usr/share/kea/scripts/mysql/upgrade_018_to_019.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_013_to_014.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_014_to_015.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_015_to_016.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_016_to_017.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_017_to_018.sh was added
  /usr/include/kea/dhcpsrv/free_lease_queue.h was removed
  /usr/include/kea/http/http_thread_pool.h was removed

--===============6518726521550432616==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-kea-upgrade-2.2.0-2.4.0.patch"

RnJvbSAwMWE5ZTU0OGVjOWJhZTg4MzU0MGYzZDQ3MWJhMWZkNjQyY2Y1MzA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMDg6MjA6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBr
ZWE6IHVwZ3JhZGUgMi4yLjAgLT4gMi40LjAKCi0tLQogLi4uL2tlYS97a2VhXzIuMi4wLmJiID0+
IGtlYV8yLjQuMC5iYn0gICAgICAgIHwgMjMgKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNo
YW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9rZWEve2tlYV8yLjIuMC5iYiA9PiBrZWFfMi40LjAuYmJ9ICg3NyUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEva2VhXzIuMi4wLmJi
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEva2VhXzIuNC4wLmJiCnNpbWlsYXJpdHkg
aW5kZXggNzclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2tlYV8y
LjIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEva2VhXzIuNC4w
LmJiCmluZGV4IDJjMmU1YTc0ZGQuLmU1ODA5ZThkM2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkva2VhL2tlYV8yLjIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2tlYS9rZWFfMi40LjAuYmIKQEAgLTEsOSArMSwyOCBAQAorIyBGSVhNRTogdGhlIExJ
Q19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3Jh
ZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBh
bmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFs
dWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQg
bWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2Ut
VXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMK
KyMgLS0tIENPUFlJTkcKKyMgKysrIENPUFlJTkcKKyMgQEAgLTEsNCArMSw0IEBACisjIC1Db3B5
cmlnaHQgKEMpIDIwMDktMjAyMiBJbnRlcm5ldCBTeXN0ZW1zIENvbnNvcnRpdW0sIEluYy4gKCJJ
U0MiKQorIyArQ29weXJpZ2h0IChDKSAyMDA5LTIwMjMgSW50ZXJuZXQgU3lzdGVtcyBDb25zb3J0
aXVtLCBJbmMuICgiSVNDIikKKyMgIAorIyAgVGhpcyBTb3VyY2UgQ29kZSBGb3JtIGlzIHN1Ympl
Y3QgdG8gdGhlIHRlcm1zIG9mIHRoZSBNb3ppbGxhIFB1YmxpYworIyAgTGljZW5zZSwgdi4gMi4w
LiBJZiBhIGNvcHkgb2YgdGhlIE1QTCB3YXMgbm90IGRpc3RyaWJ1dGVkIHdpdGggdGhpcworIyAK
KyMKKwogU1VNTUFSWSA9ICJJU0MgS2VhIERIQ1AgU2VydmVyIgogREVTQ1JJUFRJT04gPSAiS2Vh
IGlzIHRoZSBuZXh0IGdlbmVyYXRpb24gb2YgREhDUCBzb2Z0d2FyZSBkZXZlbG9wZWQgYnkgSVND
LiBJdCBzdXBwb3J0cyBib3RoIERIQ1B2NCBhbmQgREhDUHY2IHByb3RvY29scyBhbG9uZyB3aXRo
IHRoZWlyIGV4dGVuc2lvbnMsIGUuZy4gcHJlZml4IGRlbGVnYXRpb24gYW5kIGR5bmFtaWMgdXBk
YXRlcyB0byBETlMuIgogSE9NRVBBR0UgPSAiaHR0cDovL2tlYS5pc2Mub3JnIgogU0VDVElPTiA9
ICJjb25uZWN0aXZpdHkiCiBMSUNFTlNFID0gIk1QTC0yLjAiCi1MSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9DT1BZSU5HO21kNT05N2NlMTRiZGQyNzMzZjViODRhYjVlMjkzODBkMDU3ZCIKK0xJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWVhMDYxZmEwMTg4ODM4MDcyYzQy
NDhjMTMxOGVjMTMxIgogCiBERVBFTkRTID0gImJvb3N0IGxvZzRjcGx1cyBvcGVuc3NsIgogCkBA
IC0xOCw3ICszNyw3IEBAIFNSQ19VUkkgPSAiaHR0cDovL2Z0cC5pc2Mub3JnL2lzYy9rZWEvJHtQ
Vn0vJHtCUH0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL2ZpeF9waWRfa2VhY3RybC5wYXRj
aCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXNyYy1saWItbG9nLWxvZ2dlcl91bml0dGVzdF9z
dXBwb3J0LmNjLWRvLW5vdC13cml0ZS0ucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiZGE3ZDkwY2E2MmE3NzI2MDJkYWM2ZTc3ZTUwNzMxOTAzODQyMjg5NWFkNjhl
ZWIxNDJmMTQ4N2Q2N2Q1MzFkMiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzYTMzY2QwOGRjMzMx
OWZmNTQ0ZTZiYmYyYzA0MjkwNDIxMDZmNDA1MWViZTExNWRjMWJiMjYyNWM5NTAwM2Y3IgogCiBp
bmhlcml0IGF1dG90b29scyBzeXN0ZW1kIHVwZGF0ZS1yYy5kIHVwc3RyZWFtLXZlcnNpb24taXMt
ZXZlbgogCi0tIAoyLjM5LjIKCg==

--===============6518726521550432616==--

