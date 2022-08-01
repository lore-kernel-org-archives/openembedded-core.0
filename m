Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BD7C25B0D
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 08:15:07 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web08.22235.1659341690442547521
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 01:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kl0n/K5w;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 010101825878d122-2d26c357-3290-4e12-89fa-15bf7de9ee57-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659341689;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=E193iBulpC4qILHy3r9Y80I8ksA9ZjsaTN97KDMCmHE=;
	b=kl0n/K5w707nWQQ+JXn8dTNkA6umKRVqLkL+knR7A/qffazABpV0IjlYYeCRVI7K
	2w2LhwEKX6H5L+7MNCMDsYcxQXoSO5/HibWDV51+epPXO1zrz1y1C19cFzcc7VTOsQe
	TJTuPfj7e3LgmyYKssLitch3VrCeqy2iHy4Iv2cM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659341689;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=E193iBulpC4qILHy3r9Y80I8ksA9ZjsaTN97KDMCmHE=;
	b=YbLiFRBS8rPBrxdrI7IiVPAS3yIgw0bqDa9rhM4vCDoLI66+BX/l7xqEmP0OpnXD
	+Z2Bc/4Klzr7YSAcdp0jFxqzt2+KZmQjBnCL3bZBHm/lMT+9BXRhntnUR01jm8Rvin8
	ay1ajuEy0DDumc5vIJH7+r+DoKGGyIzP3No319Dw=
Content-Type: multipart/mixed; boundary="===============5914054132626219366=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] kea: upgrading to 2.2.0 SUCCEEDED
Message-ID: 
 <010101825878d122-2d26c357-3290-4e12-89fa-15bf7de9ee57-000000@us-west-2.amazonses.com>
Date: Mon, 1 Aug 2022 08:14:49 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 08:15:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168700

--===============5914054132626219366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kea* to *2.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kea-upgrade-2.0.2-2.2.0.patch
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
--===============5914054132626219366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/kea/kea-dbg: FILELIST: removed "/usr/lib/.debug/libkea-eval.so.27.0.0 /usr/lib/.debug/libkea-dhcp++.so.36.0.0 /usr/lib/.debug/libkea-cryptolink.so.16.0.0 /usr/lib/.debug/libkea-cfgclient.so.25.0.0 /usr/lib/.debug/libkea-dhcpsrv.so.51.0.0 /usr/lib/.debug/libkea-asiolink.so.27.0.0 /usr/lib/.debug/libkea-dns++.so.19.0.0 /usr/lib/.debug/libkea-d2srv.so.4.0.0 /usr/lib/.debug/libkea-http.so.30.0.0 /usr/lib/.debug/libkea-dhcp_ddns.so.18.0.0 /usr/lib/.debug/libkea-asiodns.so.14.0.0 /usr/lib/.debug/libkea-database.so.23.0.0 /usr/lib/.debug/libkea-hooks.so.40.0.0 /usr/lib/.debug/libkea-log.so.22.0.0 /usr/lib/.debug/libkea-util.so.36.0.0 /usr/lib/.debug/libkea-process.so.29.0.0 /usr/lib/.debug/libkea-cc.so.25.0.0", added "/usr/lib/.debug/libkea-asiolink.so.40.0.0 /usr/lib/.debug/libkea-log.so.35.0.0 /usr/lib/.debug/libkea-cryptolink.so.28.0.0 /usr/lib/.debug/libkea-dns++.so.30.0.0 /usr/lib/.debug/libkea-eval.so.39.0.0 /usr/lib/.debug/libkea-dhcp++.so.54.0.0 /usr/lib
 /.debug/libkea-dhcpsrv.so.69.0.0 /usr/lib/.debug/libkea-asiodns.so.24.0.0 /usr/lib/.debug/libkea-cfgclient.so.36.0.0 /usr/lib/.debug/libkea-dhcp_ddns.so.29.0.0 /usr/lib/.debug/libkea-d2srv.so.16.0.0 /usr/lib/.debug/libkea-process.so.40.0.0 /usr/lib/.debug/libkea-util.so.52.0.0 /usr/lib/.debug/libkea-http.so.42.0.0 /usr/lib/.debug/libkea-database.so.35.0.0 /usr/lib/.debug/libkea-cc.so.39.0.0 /usr/lib/.debug/libkea-hooks.so.57.0.0"
packages/core2-32-poky-linux/kea/kea-dbg: PKGV changed from 2.0.2 [default] to 2.2.0 [default]
packages/core2-32-poky-linux/kea/kea-dbg: PV changed from "2.0.2" to "2.2.0"
packages/core2-32-poky-linux/kea/kea-dbg: PKGSIZE changed from 264770748 to 271343268 (+2%)
packages/core2-32-poky-linux/kea/kea-dev: FILELIST: removed "/usr/include/kea/dhcpsrv/triplet.h", added "/usr/include/kea/util/reconnect_ctl.h /usr/include/kea/dhcp/pkt_template.h /usr/include/kea/util/file_utilities.h /usr/include/kea/util/dhcp_space.h /usr/include/kea/util/triplet.h /usr/include/kea/dhcpsrv/memfile_lease_limits.h"
packages/core2-32-poky-linux/kea/kea-dev: PKGV changed from 2.0.2 [default] to 2.2.0 [default]
packages/core2-32-poky-linux/kea/kea-dev: PV changed from "2.0.2" to "2.2.0"
packages/core2-32-poky-linux/kea/kea-dev: PKGSIZE changed from 3727892 to 3788213 (+2%)
packages/core2-32-poky-linux/kea/kea-doc: FILELIST: removed "/usr/share/doc/kea/examples/kea4/cassandra.json /usr/share/doc/kea/examples/kea6/cassandra.json", added "/usr/share/doc/kea/examples/agent/rbac.json"
packages/core2-32-poky-linux/kea/kea-doc: PKGV changed from 2.0.2 [default] to 2.2.0 [default]
packages/core2-32-poky-linux/kea/kea-doc: PV changed from "2.0.2" to "2.2.0"
packages/core2-32-poky-linux/kea/kea-doc: PKGSIZE changed from 1162901 to 1196793 (+3%)
packages/core2-32-poky-linux/kea/kea-locale: PKGV changed from 2.0.2 [default] to 2.2.0 [default]
packages/core2-32-poky-linux/kea/kea-locale: PV changed from "2.0.2" to "2.2.0"
packages/core2-32-poky-linux/kea/kea-src: FILELIST: directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/bin/agent -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/bin/agent, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/bin/lfc -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/bin/lfc, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/cryptolink -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/cryptolink, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/process -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/process, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/eval -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/eval, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/bin/dhcp6 -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/bin/dhcp6, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/config_backend -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/config_backend, directory renamed /usr/src/debug/kea/2
 .0.2-r0/kea-2.0.2/src/bin/dhcp4 -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/bin/dhcp4, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/hooks/dhcp/bootp -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/hooks/dhcp/bootp, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dns -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dns, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/encode -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/encode, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/stats -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/stats, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/asiodns -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/asiodns, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/io -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/io, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/bin/d2 -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/bin/d2, dir
 ectory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/hooks/dhcp/stat_cmds -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/hooks/dhcp/stat_cmds, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dns/rdata/generic/detail -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dns/rdata/generic/detail, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/d2srv -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/d2srv, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/http -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/http, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/log -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/log, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/cfgrpt -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/cfgrpt, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/database -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/database, directory renamed /usr/src/debug/kea/2.0.2-r0/build/src/
 lib/cfgrpt -> /usr/src/debug/kea/2.2.0-r0/build/src/lib/cfgrpt, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/hooks/dhcp/high_availability -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/hooks/dhcp/high_availability, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/asiolink -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/asiolink, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/log/interprocess -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/log/interprocess, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/exceptions -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/exceptions, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/cc -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/cc, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/hooks -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/hooks, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/hooks/dhcp/run_script -> /usr/src/debug/kea/2.2
 .0-r0/kea-2.2.0/src/hooks/dhcp/run_script, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/config -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/config, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcp_ddns -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcp_ddns, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/hooks/dhcp/flex_option -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/hooks/dhcp/flex_option, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/parsers -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/parsers, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/hooks/dhcp/lease_cmds -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/hooks/dhcp/lease_cmds, directory renamed /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcp -> /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcp, removed "/usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/hosts_log.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib
 /dhcpsrv/lease_mgr.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/stopwatch.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/dhcpsrv_log.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/lease.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/dhcpsrv_log.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/config_backend_dhcp4_mgr.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/free_lease_queue.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/ip_range_permutation.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/chrono_time_utils.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_iface.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/lease_mgr_factory.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cache_host_data_source.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_iface.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/resource_handler.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/uti
 l/io_utilities.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/staged_value.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/watched_thread.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/multi_threading_mgr.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/memory_segment_local.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/csv_lease_file4.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/pid_file.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_subnets6.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/buffer.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/unlock_guard.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_hosts_util.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/config_backend_dhcp4_mgr.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/config_backend_dhcp6_mgr.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/watched_thread.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_multi_
 threading.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_db_access.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/csv_lease_file6.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/filename.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_subnets4.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfgmgr.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/alloc_engine.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/multi_threading_mgr.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/alloc_engine.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/ip_range.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/versioned_csv_file.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_option_def.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/free_lease_queue.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/d2_client_mgr.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/config_backend_dhcp6.h /u
 sr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/writable_host_data_source.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/timer_mgr.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/shared_network.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/subnet_selector.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_mac_source.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/ncr_generator.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/state_model.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/triplet.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_hosts.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_shared_networks.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/network_state.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cb_ctl_dhcp4.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/ip_range.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/alloc_engine_log.h /usr/src/debug/ke
 a/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/config_backend_pool_dhcp6.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/host_container.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/alloc_engine_messages.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/srv_config.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_4o6.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/timer_mgr.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/stopwatch.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_host_operations.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/base_host_data_source.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/config_backend_pool_dhcp6.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/host_mgr.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/config_backend_dhcp4.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/time_utilities.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/pool.h /usr/src/
 debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_expiration.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/subnet_id.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/lease_mgr_factory.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/hosts_log.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_mac_source.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/readwrite_mutex.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/memory_segment.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/range_utilities.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cb_ctl_dhcp6.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/memfile_lease_mgr.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/subnet.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/csv_file.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/thread_pool.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/host_data_source_factory.cc /usr/src/debug/kea/2.0.2-r0/kea-
 2.0.2/src/lib/dhcpsrv/config_backend_dhcp6_mgr.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cb_ctl_dhcp.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/state_model.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_rsoo.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_subnets6.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/dhcpsrv_exceptions.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/shared_network.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/optional.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/filename.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/stopwatch_impl.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/client_class_def.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/lease_file_stats.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/csv_file.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/client_class_def.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/dh
 cpsrv_messages.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cb_ctl_dhcp6.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_option_def.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/chrono_time_utils.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/dhcp4o6_ipc.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/network_state.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/boost_time_utils.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/labeled_value.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/labeled_value.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/pointer_util.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/boost_time_utils.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/utils.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/lease_mgr.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_db_access.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/callout_handle_store.h /usr/src/deb
 ug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_hosts.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/alloc_engine_log.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/pool.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_consistency.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/versioned_csv_file.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/memfile_lease_mgr.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/config_backend_pool_dhcp4.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/csv_lease_file4.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/d2_client_cfg.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/csv_lease_file6.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/sanity_checker.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_multi_threading.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/sanity_checker.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_duid.h /usr/
 src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_consistency.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/alloc_engine_messages.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/network.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/d2_client_mgr.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/ip_range_permutation.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/time_utilities.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_duid.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/watch_socket.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/resource_handler.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cb_ctl_dhcp4.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_4o6.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/key_from_key.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/hosts_messages.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/lease.cc /usr/src/debug/kea/2.0.2-r0/
 kea-2.0.2/src/lib/dhcpsrv/cfgmgr.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/host_data_source_factory.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/strutil.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_host_operations.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_option.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/srv_config.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/memory_segment_local.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_hosts_util.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/ncr_generator.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/watch_socket.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/config_backend_pool_dhcp4.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_rsoo.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/host.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/stopwatch_impl.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib
 /dhcpsrv/subnet.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/dhcpsrv_messages.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/host.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_shared_networks.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/memfile_lease_storage.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_option.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/hosts_messages.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/d2_client_cfg.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/network.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_expiration.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/host_mgr.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/dhcp4o6_ipc.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/cfg_subnets4.cc /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/pid_file.h /usr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/dhcpsrv/lease_file_loader.h /u
 sr/src/debug/kea/2.0.2-r0/kea-2.0.2/src/lib/util/strutil.h", added "/usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_mac_source.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/lease_mgr_factory.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/d2_client_mgr.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/host.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/writable_host_data_source.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/reconnect_ctl.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/stopwatch.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/alloc_engine_log.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_option.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/labeled_value.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/reconnect_ctl.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_host_operations.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_subnets4.h /usr/src/debug/
 kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/network.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/memfile_lease_limits.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_subnets6.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/network.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/file_utilities.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/ip_range_permutation.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/host_container.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/hosts_log.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/shared_network.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/hosts_messages.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/state_model.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_option_def.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_host_operations.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/key_from_key.h /usr/src/debug/kea/2.2.0-
 r0/kea-2.2.0/src/lib/dhcpsrv/lease_file_loader.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_consistency.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/boost_time_utils.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/ip_range.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cb_ctl_dhcp.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_shared_networks.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/csv_file.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/lease.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/memfile_lease_limits.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_multi_threading.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/d2_client_cfg.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/resource_handler.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/boost_time_utils.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/config_backend_pool_dhcp4.h /usr/src/debug/kea/2.2
 .0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_duid.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/csv_file.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/optional.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/callout_handle_store.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/subnet_selector.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/time_utilities.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/strutil.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/memfile_lease_mgr.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/utils.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/chrono_time_utils.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/alloc_engine.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_globals.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/ip_range_permutation.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/pointer_util.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_
 hosts.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/thread_pool.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/versioned_csv_file.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/alloc_engine_log.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/dhcp_space.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_iface.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_shared_networks.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/multi_threading_mgr.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/csv_lease_file4.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfgmgr.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_hosts_util.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_rsoo.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/lease_mgr.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/state_model.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/ncr_generator.h /usr/src/debug/kea/2.2
 .0-r0/kea-2.2.0/src/lib/util/dhcp_space.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/d2_client_cfg.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/filename.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cb_ctl_dhcp4.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/unlock_guard.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_subnets6.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/dhcp4o6_ipc.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/watch_socket.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cache_host_data_source.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_globals.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/filename.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/readwrite_mutex.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/stopwatch.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_hosts.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/io_utilities.h /usr/s
 rc/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/lease_file_stats.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/hosts_log.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/pool.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/subnet_id.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/multi_threading_mgr.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/versioned_csv_file.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cb_ctl_dhcp4.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_expiration.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/lease_mgr_factory.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cb_ctl_dhcp6.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/config_backend_pool_dhcp6.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/pool.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/dhcpsrv_exceptions.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/srv_config.cc /usr/src/debug/kea/
 2.2.0-r0/kea-2.2.0/src/lib/util/buffer.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_4o6.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_rsoo.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/watch_socket.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_db_access.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/config_backend_dhcp4_mgr.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/host.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_4o6.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_subnets4.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/chrono_time_utils.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/memfile_lease_mgr.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/d2_client_mgr.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/config_backend_dhcp6_mgr.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/srv_config.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/u
 til/range_utilities.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/memory_segment_local.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_duid.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/csv_lease_file6.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/pid_file.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/host_data_source_factory.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/memory_segment.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_mac_source.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/file_utilities.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_consistency.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/resource_handler.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/free_lease_queue.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/memory_segment_local.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/sanity_checker.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/l
 ib/dhcpsrv/cfg_multi_threading.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/base_host_data_source.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/dhcpsrv_log.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_expiration.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/dhcpsrv_messages.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/watched_thread.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/network_state.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/client_class_def.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/watched_thread.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/dhcp4o6_ipc.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/subnet.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/stopwatch_impl.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_option_def.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/config_backend_pool_dhcp6.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/s
 rc/lib/dhcpsrv/dhcpsrv_log.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/csv_lease_file4.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/sanity_checker.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/ncr_generator.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/staged_value.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/host_data_source_factory.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/network_state.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/strutil.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cb_ctl_dhcp6.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/config_backend_dhcp6.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/lease_mgr.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_db_access.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/shared_network.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/config_backend_dhcp4_mgr.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0
 /src/lib/dhcpsrv/host_mgr.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/alloc_engine_messages.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/memfile_lease_storage.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_hosts_util.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/ip_range.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_option.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/alloc_engine.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/pid_file.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/config_backend_pool_dhcp4.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/dhcpsrv_messages.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/stopwatch_impl.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/config_backend_dhcp6_mgr.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/time_utilities.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/alloc_engine_messages.h /usr/src/debug/kea/2.2.0
 -r0/kea-2.2.0/src/lib/dhcpsrv/host_mgr.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/hosts_messages.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/free_lease_queue.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/triplet.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/timer_mgr.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/subnet.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/lease.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/timer_mgr.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/config_backend_dhcp4.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfg_iface.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/util/labeled_value.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/csv_lease_file6.cc /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/cfgmgr.h /usr/src/debug/kea/2.2.0-r0/kea-2.2.0/src/lib/dhcpsrv/client_class_def.cc"
packages/core2-32-poky-linux/kea/kea-src: PKGV changed from 2.0.2 [default] to 2.2.0 [default]
packages/core2-32-poky-linux/kea/kea-src: PV changed from "2.0.2" to "2.2.0"
packages/core2-32-poky-linux/kea/kea-src: PKGSIZE changed from 8938959 to 9149080 (+2%)
packages/core2-32-poky-linux/kea/kea-staticdev: PKGV changed from 2.0.2 [default] to 2.2.0 [default]
packages/core2-32-poky-linux/kea/kea-staticdev: PV changed from "2.0.2" to "2.2.0"
packages/core2-32-poky-linux/kea/kea: FILELIST: removed "/usr/lib/libkea-cc.so.25 /usr/share/kea/scripts/cql/upgrade_2.0_to_3.0.sh /usr/lib/libkea-database.so.23.0.0 /usr/lib/libkea-hooks.so.40.0.0 /usr/lib/libkea-eval.so.27.0.0 /usr/lib/libkea-dhcpsrv.so.51 /usr/share/kea/scripts/pgsql/upgrade_6.1_to_6.2.sh /usr/share/kea/scripts/cql/dhcpdb_create.cql /usr/share/kea/scripts/pgsql/upgrade_4.0_to_5.0.sh /usr/share/kea/scripts/cql/upgrade_4.0_to_5.0.sh /usr/lib/libkea-cryptolink.so.16.0.0 /usr/share/kea/scripts/pgsql/upgrade_5.1_to_6.0.sh /usr/lib/libkea-dhcp++.so.36 /usr/lib/libkea-eval.so.27 /usr/lib/libkea-dns++.so.19.0.0 /usr/lib/libkea-dns++.so.19 /usr/share/kea/scripts/pgsql/upgrade_3.1_to_3.2.sh /usr/lib/libkea-log.so.22 /usr/share/kea/scripts/pgsql/upgrade_5.0_to_5.1.sh /usr/share/kea/scripts/cql/dhcpdb_drop.cql /usr/share/kea/scripts/pgsql/upgrade_2.0_to_3.0.sh /usr/lib/libkea-dhcp++.so.36.0.0 /usr/lib/libkea-hooks.so.40 /usr/lib/libkea-cfgclient.so.25.0.0 /usr/lib/libkea-dhcp
 _ddns.so.18 /usr/lib/libkea-cfgclient.so.25 /usr/lib/libkea-http.so.30 /usr/share/kea/scripts/pgsql/upgrade_3.0_to_3.1.sh /usr/lib/libkea-cryptolink.so.16 /usr/share/kea/scripts/pgsql/upgrade_3.3_to_4.0.sh /usr/lib/libkea-http.so.30.0.0 /usr/lib/libkea-d2srv.so.4.0.0 /usr/lib/libkea-asiolink.so.27 /usr/lib/libkea-dhcp_ddns.so.18.0.0 /usr/lib/libkea-asiolink.so.27.0.0 /usr/lib/libkea-database.so.23 /usr/lib/libkea-dhcpsrv.so.51.0.0 /usr/lib/libkea-process.so.29.0.0 /usr/lib/libkea-cc.so.25.0.0 /usr/lib/libkea-asiodns.so.14 /usr/lib/libkea-util.so.36.0.0 /usr/lib/libkea-process.so.29 /usr/lib/libkea-util.so.36 /usr/share/kea/scripts/pgsql/upgrade_3.2_to_3.3.sh /usr/lib/libkea-log.so.22.0.0 /usr/share/kea/scripts/cql/upgrade_3.0_to_4.0.sh /usr/share/kea/scripts/pgsql/upgrade_6.0_to_6.1.sh /usr/share/kea/scripts/pgsql/upgrade_1.0_to_2.0.sh /usr/lib/libkea-asiodns.so.14.0.0 /usr/lib/libkea-d2srv.so.4 /usr/share/kea/scripts/cql/upgrade_1.0_to_2.0.sh /usr/share/kea/scripts/cql/wipe_data.sh
 ", added "/usr/lib/libkea-dhcp++.so.54 /usr/lib/libkea-cfgclient.so.36 /usr/lib/libkea-asiodns.so.24 /usr/lib/libkea-asiolink.so.40.0.0 /usr/share/kea/scripts/pgsql/upgrade_001.0_to_002.0.sh /usr/lib/libkea-log.so.35.0.0 /usr/lib/libkea-cc.so.39.0.0 /usr/lib/libkea-cfgclient.so.36.0.0 /usr/share/kea/scripts/pgsql/upgrade_003.0_to_003.1.sh /usr/lib/libkea-process.so.40 /usr/lib/libkea-cryptolink.so.28.0.0 /usr/share/kea/scripts/mysql/upgrade_012_to_013.sh /usr/share/kea/scripts/pgsql/upgrade_007_to_008.sh /usr/lib/libkea-eval.so.39 /usr/lib/libkea-http.so.42 /usr/lib/libkea-hooks.so.57 /usr/share/kea/api/gss-tsig-rekey-all.json /usr/lib/libkea-asiolink.so.40 /usr/lib/libkea-http.so.42.0.0 /usr/lib/libkea-database.so.35.0.0 /usr/lib/libkea-dhcp_ddns.so.29 /usr/share/kea/api/subnet6-delta-del.json /usr/lib/libkea-dhcpsrv.so.69 /usr/lib/libkea-eval.so.39.0.0 /usr/lib/libkea-asiodns.so.24.0.0 /usr/share/kea/scripts/pgsql/upgrade_009_to_010.sh /usr/share/kea/scripts/pgsql/upgrade_005.0_to
 _005.1.sh /usr/lib/libkea-dhcp++.so.54.0.0 /usr/lib/libkea-cryptolink.so.28 /usr/share/kea/api/gss-tsig-rekey.json /usr/share/kea/api/subnet6-delta-add.json /usr/share/kea/scripts/pgsql/upgrade_011_to_012.sh /usr/share/kea/scripts/pgsql/upgrade_012_to_013.sh /usr/lib/libkea-util.so.52 /usr/lib/libkea-d2srv.so.16 /usr/lib/libkea-database.so.35 /usr/lib/libkea-hooks.so.57.0.0 /usr/share/kea/scripts/pgsql/upgrade_003.1_to_003.2.sh /usr/lib/libkea-process.so.40.0.0 /usr/share/kea/scripts/pgsql/upgrade_006.0_to_006.1.sh /usr/lib/libkea-d2srv.so.16.0.0 /usr/lib/libkea-cc.so.39 /usr/share/kea/api/subnet4-delta-del.json /usr/share/kea/scripts/pgsql/upgrade_004.0_to_005.0.sh /usr/share/kea/scripts/pgsql/upgrade_006.2_to_007.0.sh /usr/share/kea/scripts/pgsql/upgrade_003.3_to_004.0.sh /usr/lib/libkea-dns++.so.30.0.0 /usr/share/kea/scripts/pgsql/upgrade_003.2_to_003.3.sh /usr/lib/libkea-dhcpsrv.so.69.0.0 /usr/share/kea/scripts/pgsql/upgrade_010_to_011.sh /usr/share/kea/api/subnet4-delta-add.jso
 n /usr/share/kea/scripts/pgsql/upgrade_008_to_009.sh /usr/share/kea/scripts/pgsql/upgrade_006.1_to_006.2.sh /usr/lib/libkea-dns++.so.30 /usr/share/kea/scripts/mysql/upgrade_013_to_014.sh /usr/share/kea/scripts/pgsql/upgrade_002.0_to_003.0.sh /usr/lib/libkea-dhcp_ddns.so.29.0.0 /usr/share/kea/scripts/pgsql/upgrade_005.1_to_006.0.sh /usr/lib/libkea-util.so.52.0.0 /usr/lib/libkea-log.so.35"
packages/core2-32-poky-linux/kea/kea: PKGV changed from 2.0.2 [default] to 2.2.0 [default]
packages/core2-32-poky-linux/kea/kea: PV changed from "2.0.2" to "2.2.0"
packages/core2-32-poky-linux/kea/kea: PKGSIZE changed from 16078267 to 16828658 (+5%)
packages/core2-32-poky-linux/kea: SRC_URI changed from "http://ftp.isc.org/isc/kea/2.0.2/kea-2.0.2.tar.gz file://kea-dhcp4.service file://kea-dhcp6.service file://kea-dhcp-ddns.service file://kea-dhcp4-server file://kea-dhcp6-server file://kea-dhcp-ddns-server file://fix-multilib-conflict.patch file://fix_pid_keactrl.patch file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch" to "http://ftp.isc.org/isc/kea/2.2.0/kea-2.2.0.tar.gz file://kea-dhcp4.service file://kea-dhcp6.service file://kea-dhcp-ddns.service file://kea-dhcp4-server file://kea-dhcp6-server file://kea-dhcp-ddns-server file://fix-multilib-conflict.patch file://fix_pid_keactrl.patch file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch"
packages/core2-32-poky-linux/kea: PKGV changed from 2.0.2 [default] to 2.2.0 [default]
packages/core2-32-poky-linux/kea: PV changed from "2.0.2" to "2.2.0"
Changes to packages/core2-32-poky-linux/kea (sysroot):
  /usr/lib/libkea-asiodns.so changed symlink target from libkea-asiodns.so.14.0.0 to libkea-asiodns.so.24.0.0
  /usr/lib/libkea-asiolink.so changed symlink target from libkea-asiolink.so.27.0.0 to libkea-asiolink.so.40.0.0
  /usr/lib/libkea-cc.so changed symlink target from libkea-cc.so.25.0.0 to libkea-cc.so.39.0.0
  /usr/lib/libkea-cfgclient.so changed symlink target from libkea-cfgclient.so.25.0.0 to libkea-cfgclient.so.36.0.0
  /usr/lib/libkea-cryptolink.so changed symlink target from libkea-cryptolink.so.16.0.0 to libkea-cryptolink.so.28.0.0
  /usr/lib/libkea-d2srv.so changed symlink target from libkea-d2srv.so.4.0.0 to libkea-d2srv.so.16.0.0
  /usr/lib/libkea-database.so changed symlink target from libkea-database.so.23.0.0 to libkea-database.so.35.0.0
  /usr/lib/libkea-dhcp_ddns.so changed symlink target from libkea-dhcp_ddns.so.18.0.0 to libkea-dhcp_ddns.so.29.0.0
  /usr/lib/libkea-dhcp++.so changed symlink target from libkea-dhcp++.so.36.0.0 to libkea-dhcp++.so.54.0.0
  /usr/lib/libkea-dhcpsrv.so changed symlink target from libkea-dhcpsrv.so.51.0.0 to libkea-dhcpsrv.so.69.0.0
  /usr/lib/libkea-dns++.so changed symlink target from libkea-dns++.so.19.0.0 to libkea-dns++.so.30.0.0
  /usr/lib/libkea-eval.so changed symlink target from libkea-eval.so.27.0.0 to libkea-eval.so.39.0.0
  /usr/lib/libkea-hooks.so changed symlink target from libkea-hooks.so.40.0.0 to libkea-hooks.so.57.0.0
  /usr/lib/libkea-http.so changed symlink target from libkea-http.so.30.0.0 to libkea-http.so.42.0.0
  /usr/lib/libkea-log.so changed symlink target from libkea-log.so.22.0.0 to libkea-log.so.35.0.0
  /usr/lib/libkea-process.so changed symlink target from libkea-process.so.29.0.0 to libkea-process.so.40.0.0
  /usr/lib/libkea-util.so changed symlink target from libkea-util.so.36.0.0 to libkea-util.so.52.0.0
  /usr/lib/libkea-asiodns.so.14.0.0 moved to /usr/lib/libkea-asiodns.so.24.0.0
  /usr/lib/libkea-asiodns.so.14 moved to /usr/lib/libkea-asiodns.so.24
  /usr/lib/libkea-asiolink.so.27.0.0 moved to /usr/lib/libkea-asiolink.so.40.0.0
  /usr/lib/libkea-asiolink.so.27 moved to /usr/lib/libkea-asiolink.so.40
  /usr/lib/libkea-cc.so.25.0.0 moved to /usr/lib/libkea-cc.so.39.0.0
  /usr/lib/libkea-cc.so.25 moved to /usr/lib/libkea-cc.so.39
  /usr/lib/libkea-cfgclient.so.25.0.0 moved to /usr/lib/libkea-cfgclient.so.36.0.0
  /usr/lib/libkea-cfgclient.so.25 moved to /usr/lib/libkea-cfgclient.so.36
  /usr/lib/libkea-cryptolink.so.16.0.0 moved to /usr/lib/libkea-cryptolink.so.28.0.0
  /usr/lib/libkea-cryptolink.so.16 moved to /usr/lib/libkea-cryptolink.so.28
  /usr/lib/libkea-database.so.23.0.0 moved to /usr/lib/libkea-database.so.35.0.0
  /usr/lib/libkea-database.so.23 moved to /usr/lib/libkea-database.so.35
  /usr/lib/libkea-dhcp_ddns.so.18.0.0 moved to /usr/lib/libkea-dhcp_ddns.so.29.0.0
  /usr/lib/libkea-dhcp_ddns.so.18 moved to /usr/lib/libkea-dhcp_ddns.so.29
  /usr/lib/libkea-dhcp++.so.36.0.0 moved to /usr/lib/libkea-dhcp++.so.54.0.0
  /usr/lib/libkea-dhcp++.so.36 moved to /usr/lib/libkea-dhcp++.so.54
  /usr/lib/libkea-dhcpsrv.so.51.0.0 moved to /usr/lib/libkea-dhcpsrv.so.69.0.0
  /usr/lib/libkea-dhcpsrv.so.51 moved to /usr/lib/libkea-dhcpsrv.so.69
  /usr/lib/libkea-dns++.so.19.0.0 moved to /usr/lib/libkea-dns++.so.30.0.0
  /usr/lib/libkea-dns++.so.19 moved to /usr/lib/libkea-dns++.so.30
  /usr/lib/libkea-eval.so.27.0.0 moved to /usr/lib/libkea-eval.so.39.0.0
  /usr/lib/libkea-eval.so.27 moved to /usr/lib/libkea-eval.so.39
  /usr/lib/libkea-hooks.so.40.0.0 moved to /usr/lib/libkea-hooks.so.57.0.0
  /usr/lib/libkea-hooks.so.40 moved to /usr/lib/libkea-hooks.so.57
  /usr/lib/libkea-http.so.30.0.0 moved to /usr/lib/libkea-http.so.42.0.0
  /usr/lib/libkea-http.so.30 moved to /usr/lib/libkea-http.so.42
  /usr/lib/libkea-log.so.22.0.0 moved to /usr/lib/libkea-log.so.35.0.0
  /usr/lib/libkea-log.so.22 moved to /usr/lib/libkea-log.so.35
  /usr/lib/libkea-process.so.29.0.0 moved to /usr/lib/libkea-process.so.40.0.0
  /usr/lib/libkea-process.so.29 moved to /usr/lib/libkea-process.so.40
  /usr/lib/libkea-util.so.36.0.0 moved to /usr/lib/libkea-util.so.52.0.0
  /usr/lib/libkea-util.so.36 moved to /usr/lib/libkea-util.so.52
  /usr/include/kea/dhcp/pkt_template.h was added
  /usr/include/kea/dhcpsrv/memfile_lease_limits.h was added
  /usr/include/kea/util/dhcp_space.h was added
  /usr/include/kea/util/file_utilities.h was added
  /usr/include/kea/util/reconnect_ctl.h was added
  /usr/include/kea/util/triplet.h was added
  /usr/lib/libkea-d2srv.so.16.0.0 was added
  /usr/lib/libkea-d2srv.so.16 was added
  /usr/share/kea/api/gss-tsig-rekey-all.json was added
  /usr/share/kea/api/gss-tsig-rekey.json was added
  /usr/share/kea/api/subnet4-delta-add.json was added
  /usr/share/kea/api/subnet4-delta-del.json was added
  /usr/share/kea/api/subnet6-delta-add.json was added
  /usr/share/kea/api/subnet6-delta-del.json was added
  /usr/share/kea/scripts/mysql/upgrade_012_to_013.sh was added
  /usr/share/kea/scripts/mysql/upgrade_013_to_014.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_001.0_to_002.0.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_002.0_to_003.0.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_003.0_to_003.1.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_003.1_to_003.2.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_003.2_to_003.3.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_003.3_to_004.0.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_004.0_to_005.0.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_005.0_to_005.1.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_005.1_to_006.0.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_006.0_to_006.1.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_006.1_to_006.2.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_006.2_to_007.0.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_007_to_008.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_008_to_009.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_009_to_010.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_010_to_011.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_011_to_012.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_012_to_013.sh was added
  /usr/include/kea/dhcpsrv/triplet.h was removed
  /usr/lib/libkea-d2srv.so.4.0.0 was removed
  /usr/lib/libkea-d2srv.so.4 was removed
  /usr/share/kea/scripts/cql was removed
  /usr/share/kea/scripts/cql/dhcpdb_create.cql was removed
  /usr/share/kea/scripts/cql/dhcpdb_drop.cql was removed
  /usr/share/kea/scripts/cql/upgrade_1.0_to_2.0.sh was removed
  /usr/share/kea/scripts/cql/upgrade_2.0_to_3.0.sh was removed
  /usr/share/kea/scripts/cql/upgrade_3.0_to_4.0.sh was removed
  /usr/share/kea/scripts/cql/upgrade_4.0_to_5.0.sh was removed
  /usr/share/kea/scripts/cql/wipe_data.sh was removed
  /usr/share/kea/scripts/pgsql/upgrade_1.0_to_2.0.sh was removed
  /usr/share/kea/scripts/pgsql/upgrade_2.0_to_3.0.sh was removed
  /usr/share/kea/scripts/pgsql/upgrade_3.0_to_3.1.sh was removed
  /usr/share/kea/scripts/pgsql/upgrade_3.1_to_3.2.sh was removed
  /usr/share/kea/scripts/pgsql/upgrade_3.2_to_3.3.sh was removed
  /usr/share/kea/scripts/pgsql/upgrade_3.3_to_4.0.sh was removed
  /usr/share/kea/scripts/pgsql/upgrade_4.0_to_5.0.sh was removed
  /usr/share/kea/scripts/pgsql/upgrade_5.0_to_5.1.sh was removed
  /usr/share/kea/scripts/pgsql/upgrade_5.1_to_6.0.sh was removed
  /usr/share/kea/scripts/pgsql/upgrade_6.0_to_6.1.sh was removed
  /usr/share/kea/scripts/pgsql/upgrade_6.1_to_6.2.sh was removed

--===============5914054132626219366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/kea/kea-dev: FILELIST: removed "/usr/include/kea/dhcpsrv/triplet.h", added "/usr/include/kea/util/dhcp_space.h /usr/include/kea/dhcp/pkt_template.h /usr/include/kea/dhcpsrv/memfile_lease_limits.h /usr/include/kea/util/reconnect_ctl.h /usr/include/kea/util/triplet.h /usr/include/kea/util/file_utilities.h"
packages/core2-32-poky-linux/kea/kea-doc: FILELIST: removed "/usr/share/doc/kea/examples/kea6/cassandra.json /usr/share/doc/kea/examples/kea4/cassandra.json", added "/usr/share/doc/kea/examples/agent/rbac.json"
packages/core2-32-poky-linux/kea/kea: FILELIST: removed "/usr/lib/libkea-dns++.so.19.0.0 /usr/lib/libkea-util.so.36.0.0 /usr/lib/libkea-hooks.so.40 /usr/lib/libkea-log.so.22.0.0 /usr/lib/libkea-dhcp++.so.36 /usr/lib/libkea-cfgclient.so.25.0.0 /usr/share/kea/scripts/pgsql/upgrade_4.0_to_5.0.sh /usr/share/kea/scripts/cql/upgrade_1.0_to_2.0.sh /usr/lib/libkea-d2srv.so.4.0.0 /usr/share/kea/scripts/pgsql/upgrade_6.1_to_6.2.sh /usr/lib/libkea-dhcp_ddns.so.18 /usr/share/kea/scripts/pgsql/upgrade_3.3_to_4.0.sh /usr/lib/libkea-dhcp_ddns.so.18.0.0 /usr/lib/libkea-cfgclient.so.25 /usr/lib/libkea-asiodns.so.14 /usr/lib/libkea-cryptolink.so.16.0.0 /usr/lib/libkea-asiodns.so.14.0.0 /usr/share/kea/scripts/pgsql/upgrade_5.0_to_5.1.sh /usr/lib/libkea-dhcpsrv.so.51 /usr/share/kea/scripts/cql/upgrade_2.0_to_3.0.sh /usr/share/kea/scripts/cql/dhcpdb_drop.cql /usr/share/kea/scripts/pgsql/upgrade_3.0_to_3.1.sh /usr/share/kea/scripts/pgsql/upgrade_1.0_to_2.0.sh /usr/lib/libkea-cc.so.25 /usr/lib/libkea-http.
 so.30.0.0 /usr/lib/libkea-log.so.22 /usr/share/kea/scripts/cql/upgrade_4.0_to_5.0.sh /usr/lib/libkea-dhcp++.so.36.0.0 /usr/share/kea/scripts/pgsql/upgrade_3.1_to_3.2.sh /usr/share/kea/scripts/pgsql/upgrade_3.2_to_3.3.sh /usr/lib/libkea-hooks.so.40.0.0 /usr/share/kea/scripts/cql/upgrade_3.0_to_4.0.sh /usr/share/kea/scripts/pgsql/upgrade_5.1_to_6.0.sh /usr/share/kea/scripts/pgsql/upgrade_6.0_to_6.1.sh /usr/lib/libkea-dns++.so.19 /usr/lib/libkea-cc.so.25.0.0 /usr/share/kea/scripts/cql/wipe_data.sh /usr/lib/libkea-dhcpsrv.so.51.0.0 /usr/lib/libkea-database.so.23.0.0 /usr/lib/libkea-asiolink.so.27 /usr/lib/libkea-asiolink.so.27.0.0 /usr/lib/libkea-eval.so.27 /usr/lib/libkea-cryptolink.so.16 /usr/lib/libkea-process.so.29 /usr/lib/libkea-http.so.30 /usr/lib/libkea-database.so.23 /usr/share/kea/scripts/cql/dhcpdb_create.cql /usr/lib/libkea-util.so.36 /usr/lib/libkea-d2srv.so.4 /usr/lib/libkea-eval.so.27.0.0 /usr/share/kea/scripts/pgsql/upgrade_2.0_to_3.0.sh /usr/lib/libkea-process.so.29.0.0
 ", added "/usr/share/kea/scripts/pgsql/upgrade_008_to_009.sh /usr/lib/libkea-log.so.35.0.0 /usr/share/kea/api/gss-tsig-rekey-all.json /usr/lib/libkea-cfgclient.so.36.0.0 /usr/lib/libkea-eval.so.39 /usr/lib/libkea-cryptolink.so.28.0.0 /usr/lib/libkea-d2srv.so.16.0.0 /usr/share/kea/scripts/pgsql/upgrade_005.1_to_006.0.sh /usr/share/kea/scripts/pgsql/upgrade_002.0_to_003.0.sh /usr/share/kea/scripts/pgsql/upgrade_005.0_to_005.1.sh /usr/lib/libkea-dhcpsrv.so.69 /usr/share/kea/api/subnet4-delta-add.json /usr/share/kea/scripts/pgsql/upgrade_006.1_to_006.2.sh /usr/share/kea/scripts/pgsql/upgrade_003.3_to_004.0.sh /usr/share/kea/scripts/pgsql/upgrade_010_to_011.sh /usr/lib/libkea-asiodns.so.24.0.0 /usr/lib/libkea-dhcp_ddns.so.29 /usr/lib/libkea-http.so.42 /usr/lib/libkea-dhcpsrv.so.69.0.0 /usr/share/kea/api/subnet6-delta-del.json /usr/lib/libkea-process.so.40.0.0 /usr/lib/libkea-database.so.35 /usr/lib/libkea-dhcp++.so.54 /usr/share/kea/scripts/pgsql/upgrade_006.2_to_007.0.sh /usr/share/kea/
 api/subnet6-delta-add.json /usr/lib/libkea-dhcp_ddns.so.29.0.0 /usr/lib/libkea-hooks.so.57.0.0 /usr/share/kea/scripts/mysql/upgrade_012_to_013.sh /usr/share/kea/scripts/mysql/upgrade_013_to_014.sh /usr/lib/libkea-http.so.42.0.0 /usr/share/kea/api/subnet4-delta-del.json /usr/lib/libkea-asiolink.so.40 /usr/share/kea/scripts/pgsql/upgrade_003.2_to_003.3.sh /usr/lib/libkea-util.so.52.0.0 /usr/lib/libkea-dns++.so.30.0.0 /usr/share/kea/scripts/pgsql/upgrade_003.1_to_003.2.sh /usr/share/kea/api/gss-tsig-rekey.json /usr/share/kea/scripts/pgsql/upgrade_003.0_to_003.1.sh /usr/lib/libkea-dns++.so.30 /usr/lib/libkea-cc.so.39 /usr/lib/libkea-log.so.35 /usr/lib/libkea-cryptolink.so.28 /usr/lib/libkea-hooks.so.57 /usr/lib/libkea-cfgclient.so.36 /usr/lib/libkea-process.so.40 /usr/share/kea/scripts/pgsql/upgrade_006.0_to_006.1.sh /usr/share/kea/scripts/pgsql/upgrade_012_to_013.sh /usr/lib/libkea-asiodns.so.24 /usr/lib/libkea-util.so.52 /usr/share/kea/scripts/pgsql/upgrade_004.0_to_005.0.sh /usr/shar
 e/kea/scripts/pgsql/upgrade_009_to_010.sh /usr/lib/libkea-cc.so.39.0.0 /usr/lib/libkea-d2srv.so.16 /usr/share/kea/scripts/pgsql/upgrade_001.0_to_002.0.sh /usr/lib/libkea-dhcp++.so.54.0.0 /usr/share/kea/scripts/pgsql/upgrade_007_to_008.sh /usr/share/kea/scripts/pgsql/upgrade_011_to_012.sh /usr/lib/libkea-eval.so.39.0.0 /usr/lib/libkea-database.so.35.0.0 /usr/lib/libkea-asiolink.so.40.0.0"
Changes to packages/core2-32-poky-linux/kea (sysroot):
  /usr/lib/libkea-asiodns.so changed symlink target from libkea-asiodns.so.14.0.0 to libkea-asiodns.so.24.0.0
  /usr/lib/libkea-asiolink.so changed symlink target from libkea-asiolink.so.27.0.0 to libkea-asiolink.so.40.0.0
  /usr/lib/libkea-cc.so changed symlink target from libkea-cc.so.25.0.0 to libkea-cc.so.39.0.0
  /usr/lib/libkea-cfgclient.so changed symlink target from libkea-cfgclient.so.25.0.0 to libkea-cfgclient.so.36.0.0
  /usr/lib/libkea-cryptolink.so changed symlink target from libkea-cryptolink.so.16.0.0 to libkea-cryptolink.so.28.0.0
  /usr/lib/libkea-d2srv.so changed symlink target from libkea-d2srv.so.4.0.0 to libkea-d2srv.so.16.0.0
  /usr/lib/libkea-database.so changed symlink target from libkea-database.so.23.0.0 to libkea-database.so.35.0.0
  /usr/lib/libkea-dhcp_ddns.so changed symlink target from libkea-dhcp_ddns.so.18.0.0 to libkea-dhcp_ddns.so.29.0.0
  /usr/lib/libkea-dhcp++.so changed symlink target from libkea-dhcp++.so.36.0.0 to libkea-dhcp++.so.54.0.0
  /usr/lib/libkea-dhcpsrv.so changed symlink target from libkea-dhcpsrv.so.51.0.0 to libkea-dhcpsrv.so.69.0.0
  /usr/lib/libkea-dns++.so changed symlink target from libkea-dns++.so.19.0.0 to libkea-dns++.so.30.0.0
  /usr/lib/libkea-eval.so changed symlink target from libkea-eval.so.27.0.0 to libkea-eval.so.39.0.0
  /usr/lib/libkea-hooks.so changed symlink target from libkea-hooks.so.40.0.0 to libkea-hooks.so.57.0.0
  /usr/lib/libkea-http.so changed symlink target from libkea-http.so.30.0.0 to libkea-http.so.42.0.0
  /usr/lib/libkea-log.so changed symlink target from libkea-log.so.22.0.0 to libkea-log.so.35.0.0
  /usr/lib/libkea-process.so changed symlink target from libkea-process.so.29.0.0 to libkea-process.so.40.0.0
  /usr/lib/libkea-util.so changed symlink target from libkea-util.so.36.0.0 to libkea-util.so.52.0.0
  /usr/lib/libkea-asiodns.so.14.0.0 moved to /usr/lib/libkea-asiodns.so.24.0.0
  /usr/lib/libkea-asiodns.so.14 moved to /usr/lib/libkea-asiodns.so.24
  /usr/lib/libkea-asiolink.so.27.0.0 moved to /usr/lib/libkea-asiolink.so.40.0.0
  /usr/lib/libkea-asiolink.so.27 moved to /usr/lib/libkea-asiolink.so.40
  /usr/lib/libkea-cc.so.25.0.0 moved to /usr/lib/libkea-cc.so.39.0.0
  /usr/lib/libkea-cc.so.25 moved to /usr/lib/libkea-cc.so.39
  /usr/lib/libkea-cfgclient.so.25.0.0 moved to /usr/lib/libkea-cfgclient.so.36.0.0
  /usr/lib/libkea-cfgclient.so.25 moved to /usr/lib/libkea-cfgclient.so.36
  /usr/lib/libkea-cryptolink.so.16.0.0 moved to /usr/lib/libkea-cryptolink.so.28.0.0
  /usr/lib/libkea-cryptolink.so.16 moved to /usr/lib/libkea-cryptolink.so.28
  /usr/lib/libkea-database.so.23.0.0 moved to /usr/lib/libkea-database.so.35.0.0
  /usr/lib/libkea-database.so.23 moved to /usr/lib/libkea-database.so.35
  /usr/lib/libkea-dhcp_ddns.so.18.0.0 moved to /usr/lib/libkea-dhcp_ddns.so.29.0.0
  /usr/lib/libkea-dhcp_ddns.so.18 moved to /usr/lib/libkea-dhcp_ddns.so.29
  /usr/lib/libkea-dhcp++.so.36.0.0 moved to /usr/lib/libkea-dhcp++.so.54.0.0
  /usr/lib/libkea-dhcp++.so.36 moved to /usr/lib/libkea-dhcp++.so.54
  /usr/lib/libkea-dhcpsrv.so.51.0.0 moved to /usr/lib/libkea-dhcpsrv.so.69.0.0
  /usr/lib/libkea-dhcpsrv.so.51 moved to /usr/lib/libkea-dhcpsrv.so.69
  /usr/lib/libkea-dns++.so.19.0.0 moved to /usr/lib/libkea-dns++.so.30.0.0
  /usr/lib/libkea-dns++.so.19 moved to /usr/lib/libkea-dns++.so.30
  /usr/lib/libkea-eval.so.27.0.0 moved to /usr/lib/libkea-eval.so.39.0.0
  /usr/lib/libkea-eval.so.27 moved to /usr/lib/libkea-eval.so.39
  /usr/lib/libkea-hooks.so.40.0.0 moved to /usr/lib/libkea-hooks.so.57.0.0
  /usr/lib/libkea-hooks.so.40 moved to /usr/lib/libkea-hooks.so.57
  /usr/lib/libkea-http.so.30.0.0 moved to /usr/lib/libkea-http.so.42.0.0
  /usr/lib/libkea-http.so.30 moved to /usr/lib/libkea-http.so.42
  /usr/lib/libkea-log.so.22.0.0 moved to /usr/lib/libkea-log.so.35.0.0
  /usr/lib/libkea-log.so.22 moved to /usr/lib/libkea-log.so.35
  /usr/lib/libkea-process.so.29.0.0 moved to /usr/lib/libkea-process.so.40.0.0
  /usr/lib/libkea-process.so.29 moved to /usr/lib/libkea-process.so.40
  /usr/lib/libkea-util.so.36.0.0 moved to /usr/lib/libkea-util.so.52.0.0
  /usr/lib/libkea-util.so.36 moved to /usr/lib/libkea-util.so.52
  /usr/include/kea/dhcp/pkt_template.h was added
  /usr/include/kea/dhcpsrv/memfile_lease_limits.h was added
  /usr/include/kea/util/dhcp_space.h was added
  /usr/include/kea/util/file_utilities.h was added
  /usr/include/kea/util/reconnect_ctl.h was added
  /usr/include/kea/util/triplet.h was added
  /usr/lib/libkea-d2srv.so.16.0.0 was added
  /usr/lib/libkea-d2srv.so.16 was added
  /usr/share/kea/api/gss-tsig-rekey-all.json was added
  /usr/share/kea/api/gss-tsig-rekey.json was added
  /usr/share/kea/api/subnet4-delta-add.json was added
  /usr/share/kea/api/subnet4-delta-del.json was added
  /usr/share/kea/api/subnet6-delta-add.json was added
  /usr/share/kea/api/subnet6-delta-del.json was added
  /usr/share/kea/scripts/mysql/upgrade_012_to_013.sh was added
  /usr/share/kea/scripts/mysql/upgrade_013_to_014.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_001.0_to_002.0.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_002.0_to_003.0.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_003.0_to_003.1.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_003.1_to_003.2.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_003.2_to_003.3.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_003.3_to_004.0.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_004.0_to_005.0.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_005.0_to_005.1.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_005.1_to_006.0.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_006.0_to_006.1.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_006.1_to_006.2.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_006.2_to_007.0.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_007_to_008.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_008_to_009.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_009_to_010.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_010_to_011.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_011_to_012.sh was added
  /usr/share/kea/scripts/pgsql/upgrade_012_to_013.sh was added
  /usr/include/kea/dhcpsrv/triplet.h was removed
  /usr/lib/libkea-d2srv.so.4.0.0 was removed
  /usr/lib/libkea-d2srv.so.4 was removed
  /usr/share/kea/scripts/cql was removed
  /usr/share/kea/scripts/cql/dhcpdb_create.cql was removed
  /usr/share/kea/scripts/cql/dhcpdb_drop.cql was removed
  /usr/share/kea/scripts/cql/upgrade_1.0_to_2.0.sh was removed
  /usr/share/kea/scripts/cql/upgrade_2.0_to_3.0.sh was removed
  /usr/share/kea/scripts/cql/upgrade_3.0_to_4.0.sh was removed
  /usr/share/kea/scripts/cql/upgrade_4.0_to_5.0.sh was removed
  /usr/share/kea/scripts/cql/wipe_data.sh was removed
  /usr/share/kea/scripts/pgsql/upgrade_1.0_to_2.0.sh was removed
  /usr/share/kea/scripts/pgsql/upgrade_2.0_to_3.0.sh was removed
  /usr/share/kea/scripts/pgsql/upgrade_3.0_to_3.1.sh was removed
  /usr/share/kea/scripts/pgsql/upgrade_3.1_to_3.2.sh was removed
  /usr/share/kea/scripts/pgsql/upgrade_3.2_to_3.3.sh was removed
  /usr/share/kea/scripts/pgsql/upgrade_3.3_to_4.0.sh was removed
  /usr/share/kea/scripts/pgsql/upgrade_4.0_to_5.0.sh was removed
  /usr/share/kea/scripts/pgsql/upgrade_5.0_to_5.1.sh was removed
  /usr/share/kea/scripts/pgsql/upgrade_5.1_to_6.0.sh was removed
  /usr/share/kea/scripts/pgsql/upgrade_6.0_to_6.1.sh was removed
  /usr/share/kea/scripts/pgsql/upgrade_6.1_to_6.2.sh was removed

--===============5914054132626219366==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-kea-upgrade-2.0.2-2.2.0.patch"

RnJvbSBmMDEyM2JkOGI2Yzg1NDQ2OWIzZTI1OTUwZGE2NWNjZGVlZjI3OWY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBdWcgMjAyMiAwNzo0NTo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGtl
YTogdXBncmFkZSAyLjAuMiAtPiAyLjIuMAoKLS0tCiAuLi4va2VhL3trZWFfMi4wLjIuYmIgPT4g
a2VhXzIuMi4wLmJifSAgICAgICAgfCAyNDkgKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgMjQ3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9rZWEve2tlYV8yLjAuMi5iYiA9PiBrZWFfMi4yLjAuYmJ9ICgxNyUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEva2VhXzIuMC4yLmJi
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEva2VhXzIuMi4wLmJiCnNpbWlsYXJpdHkg
aW5kZXggMTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkva2VhL2tlYV8y
LjAuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEva2VhXzIuMi4w
LmJiCmluZGV4IDEzZGExZjg1OGQuLjdjNjhhYTM4YzQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkva2VhL2tlYV8yLjAuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2tlYS9rZWFfMi4yLjAuYmIKQEAgLTEsOSArMSwyNTQgQEAKKyMgRklYTUU6IHRoZSBM
SUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdy
YWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQg
YW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZh
bHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0
IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNl
LVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6Cisj
CisjIC0tLSBDT1BZSU5HCisjICsrKyBDT1BZSU5HCisjIEBAIC00LDE4ICs0LDYgQEAKKyMgIExp
Y2Vuc2UsIHYuIDIuMC4gSWYgYSBjb3B5IG9mIHRoZSBNUEwgd2FzIG5vdCBkaXN0cmlidXRlZCB3
aXRoIHRoaXMKKyMgIGZpbGUsIFlvdSBjYW4gb2J0YWluIG9uZSBhdCBodHRwOi8vbW96aWxsYS5v
cmcvTVBMLzIuMC8uIEZ1bGwKKyMgIHRleHQgaXMgYWxzbyBpbmNsdWRlZCBiZWxvdy4KKyMgLQor
IyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgLQorIyAtVGhlIENhc3NhbmRyYSBiYWNrZW5kIGNv
ZGUgYW5kIHN1cHBvcnQgZm9yIEdvb2dsZSBiZW5jaG1hcmsgaXMgZGlzdHJpYnV0ZWQgdW5kZXIK
KyMgLXRoZSBBcGFjaGUgTGljZW5zZSwgVmVyc2lvbiAyLjAuIFRoZSB0ZXh0IGlzIGF2YWlsYWJs
ZSBhdAorIyAtaHR0cDovL3d3dy5hcGFjaGUub3JnL2xpY2Vuc2VzL0xJQ0VOU0UtMi4wLiBGdWxs
IHRleHQgaXMgYWxzbyBpbmNsdWRlZCBiZWxvdyBpbgorIyAtdGhpcyBmaWxlLiBCb3RoIGZlYXR1
cmVzIGFyZSBvcHRpb25hbCBhbmQgYXJlIGRpc2FibGVkIGJ5IGRlZmF1bHQuCisjIC0KKyMgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCisjIC0KKyMgLUZvciB5b3VyIGNvbnZlbmllbmNlLCBmdWxsIHRl
eHQgb2YgTVBMIDIuMCBhbmQgQXBhY2hlIDIuMCBsaWNlbnNlcyBpcyBhdmFpbGFibGUKKyMgLWJl
bG93OgorIyAgCisjICAtLS0gTVBMIDIuMCBsaWNlbnNlIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC0zOTUsMjEyICsz
ODMsNiBAQAorIyAgCisjICAtLS1lbmQgb2YgTVBMIDIuMCBsaWNlbnNlIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIC0tLS0gQXBhY2hl
IDIuMCBsaWNlbnNlIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQorIyAtCisjIC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBcGFj
aGUgTGljZW5zZQorIyAtICAgICAgICAgICAgICAgICAgICAgICAgICAgVmVyc2lvbiAyLjAsIEph
bnVhcnkgMjAwNAorIyAtICAgICAgICAgICAgICAgICAgICAgICAgaHR0cDovL3d3dy5hcGFjaGUu
b3JnL2xpY2Vuc2VzLworIyAtCisjIC0gICBURVJNUyBBTkQgQ09ORElUSU9OUyBGT1IgVVNFLCBS
RVBST0RVQ1RJT04sIEFORCBESVNUUklCVVRJT04KKyMgLQorIyAtICAgMS4gRGVmaW5pdGlvbnMu
CisjIC0KKyMgLSAgICAgICJMaWNlbnNlIiBzaGFsbCBtZWFuIHRoZSB0ZXJtcyBhbmQgY29uZGl0
aW9ucyBmb3IgdXNlLCByZXByb2R1Y3Rpb24sCisjIC0gICAgICBhbmQgZGlzdHJpYnV0aW9uIGFz
IGRlZmluZWQgYnkgU2VjdGlvbnMgMSB0aHJvdWdoIDkgb2YgdGhpcyBkb2N1bWVudC4KKyMgLQor
IyAtICAgICAgIkxpY2Vuc29yIiBzaGFsbCBtZWFuIHRoZSBjb3B5cmlnaHQgb3duZXIgb3IgZW50
aXR5IGF1dGhvcml6ZWQgYnkKKyMgLSAgICAgIHRoZSBjb3B5cmlnaHQgb3duZXIgdGhhdCBpcyBn
cmFudGluZyB0aGUgTGljZW5zZS4KKyMgLQorIyAtICAgICAgIkxlZ2FsIEVudGl0eSIgc2hhbGwg
bWVhbiB0aGUgdW5pb24gb2YgdGhlIGFjdGluZyBlbnRpdHkgYW5kIGFsbAorIyAtICAgICAgb3Ro
ZXIgZW50aXRpZXMgdGhhdCBjb250cm9sLCBhcmUgY29udHJvbGxlZCBieSwgb3IgYXJlIHVuZGVy
IGNvbW1vbgorIyAtICAgICAgY29udHJvbCB3aXRoIHRoYXQgZW50aXR5LiBGb3IgdGhlIHB1cnBv
c2VzIG9mIHRoaXMgZGVmaW5pdGlvbiwKKyMgLSAgICAgICJjb250cm9sIiBtZWFucyAoaSkgdGhl
IHBvd2VyLCBkaXJlY3Qgb3IgaW5kaXJlY3QsIHRvIGNhdXNlIHRoZQorIyAtICAgICAgZGlyZWN0
aW9uIG9yIG1hbmFnZW1lbnQgb2Ygc3VjaCBlbnRpdHksIHdoZXRoZXIgYnkgY29udHJhY3Qgb3IK
KyMgLSAgICAgIG90aGVyd2lzZSwgb3IgKGlpKSBvd25lcnNoaXAgb2YgZmlmdHkgcGVyY2VudCAo
NTAlKSBvciBtb3JlIG9mIHRoZQorIyAtICAgICAgb3V0c3RhbmRpbmcgc2hhcmVzLCBvciAoaWlp
KSBiZW5lZmljaWFsIG93bmVyc2hpcCBvZiBzdWNoIGVudGl0eS4KKyMgLQorIyAtICAgICAgIllv
dSIgKG9yICJZb3VyIikgc2hhbGwgbWVhbiBhbiBpbmRpdmlkdWFsIG9yIExlZ2FsIEVudGl0eQor
IyAtICAgICAgZXhlcmNpc2luZyBwZXJtaXNzaW9ucyBncmFudGVkIGJ5IHRoaXMgTGljZW5zZS4K
KyMgLQorIyAtICAgICAgIlNvdXJjZSIgZm9ybSBzaGFsbCBtZWFuIHRoZSBwcmVmZXJyZWQgZm9y
bSBmb3IgbWFraW5nIG1vZGlmaWNhdGlvbnMsCisjIC0gICAgICBpbmNsdWRpbmcgYnV0IG5vdCBs
aW1pdGVkIHRvIHNvZnR3YXJlIHNvdXJjZSBjb2RlLCBkb2N1bWVudGF0aW9uCisjIC0gICAgICBz
b3VyY2UsIGFuZCBjb25maWd1cmF0aW9uIGZpbGVzLgorIyAtCisjIC0gICAgICAiT2JqZWN0IiBm
b3JtIHNoYWxsIG1lYW4gYW55IGZvcm0gcmVzdWx0aW5nIGZyb20gbWVjaGFuaWNhbAorIyAtICAg
ICAgdHJhbnNmb3JtYXRpb24gb3IgdHJhbnNsYXRpb24gb2YgYSBTb3VyY2UgZm9ybSwgaW5jbHVk
aW5nIGJ1dAorIyAtICAgICAgbm90IGxpbWl0ZWQgdG8gY29tcGlsZWQgb2JqZWN0IGNvZGUsIGdl
bmVyYXRlZCBkb2N1bWVudGF0aW9uLAorIyAtICAgICAgYW5kIGNvbnZlcnNpb25zIHRvIG90aGVy
IG1lZGlhIHR5cGVzLgorIyAtCisjIC0gICAgICAiV29yayIgc2hhbGwgbWVhbiB0aGUgd29yayBv
ZiBhdXRob3JzaGlwLCB3aGV0aGVyIGluIFNvdXJjZSBvcgorIyAtICAgICAgT2JqZWN0IGZvcm0s
IG1hZGUgYXZhaWxhYmxlIHVuZGVyIHRoZSBMaWNlbnNlLCBhcyBpbmRpY2F0ZWQgYnkgYQorIyAt
ICAgICAgY29weXJpZ2h0IG5vdGljZSB0aGF0IGlzIGluY2x1ZGVkIGluIG9yIGF0dGFjaGVkIHRv
IHRoZSB3b3JrCisjIC0gICAgICAoYW4gZXhhbXBsZSBpcyBwcm92aWRlZCBpbiB0aGUgQXBwZW5k
aXggYmVsb3cpLgorIyAtCisjIC0gICAgICAiRGVyaXZhdGl2ZSBXb3JrcyIgc2hhbGwgbWVhbiBh
bnkgd29yaywgd2hldGhlciBpbiBTb3VyY2Ugb3IgT2JqZWN0CisjIC0gICAgICBmb3JtLCB0aGF0
IGlzIGJhc2VkIG9uIChvciBkZXJpdmVkIGZyb20pIHRoZSBXb3JrIGFuZCBmb3Igd2hpY2ggdGhl
CisjIC0gICAgICBlZGl0b3JpYWwgcmV2aXNpb25zLCBhbm5vdGF0aW9ucywgZWxhYm9yYXRpb25z
LCBvciBvdGhlciBtb2RpZmljYXRpb25zCisjIC0gICAgICByZXByZXNlbnQsIGFzIGEgd2hvbGUs
IGFuIG9yaWdpbmFsIHdvcmsgb2YgYXV0aG9yc2hpcC4gRm9yIHRoZSBwdXJwb3NlcworIyAtICAg
ICAgb2YgdGhpcyBMaWNlbnNlLCBEZXJpdmF0aXZlIFdvcmtzIHNoYWxsIG5vdCBpbmNsdWRlIHdv
cmtzIHRoYXQgcmVtYWluCisjIC0gICAgICBzZXBhcmFibGUgZnJvbSwgb3IgbWVyZWx5IGxpbmsg
KG9yIGJpbmQgYnkgbmFtZSkgdG8gdGhlIGludGVyZmFjZXMgb2YsCisjIC0gICAgICB0aGUgV29y
ayBhbmQgRGVyaXZhdGl2ZSBXb3JrcyB0aGVyZW9mLgorIyAtCisjIC0gICAgICAiQ29udHJpYnV0
aW9uIiBzaGFsbCBtZWFuIGFueSB3b3JrIG9mIGF1dGhvcnNoaXAsIGluY2x1ZGluZworIyAtICAg
ICAgdGhlIG9yaWdpbmFsIHZlcnNpb24gb2YgdGhlIFdvcmsgYW5kIGFueSBtb2RpZmljYXRpb25z
IG9yIGFkZGl0aW9ucworIyAtICAgICAgdG8gdGhhdCBXb3JrIG9yIERlcml2YXRpdmUgV29ya3Mg
dGhlcmVvZiwgdGhhdCBpcyBpbnRlbnRpb25hbGx5CisjIC0gICAgICBzdWJtaXR0ZWQgdG8gTGlj
ZW5zb3IgZm9yIGluY2x1c2lvbiBpbiB0aGUgV29yayBieSB0aGUgY29weXJpZ2h0IG93bmVyCisj
IC0gICAgICBvciBieSBhbiBpbmRpdmlkdWFsIG9yIExlZ2FsIEVudGl0eSBhdXRob3JpemVkIHRv
IHN1Ym1pdCBvbiBiZWhhbGYgb2YKKyMgLSAgICAgIHRoZSBjb3B5cmlnaHQgb3duZXIuIEZvciB0
aGUgcHVycG9zZXMgb2YgdGhpcyBkZWZpbml0aW9uLCAic3VibWl0dGVkIgorIyAtICAgICAgbWVh
bnMgYW55IGZvcm0gb2YgZWxlY3Ryb25pYywgdmVyYmFsLCBvciB3cml0dGVuIGNvbW11bmljYXRp
b24gc2VudAorIyAtICAgICAgdG8gdGhlIExpY2Vuc29yIG9yIGl0cyByZXByZXNlbnRhdGl2ZXMs
IGluY2x1ZGluZyBidXQgbm90IGxpbWl0ZWQgdG8KKyMgLSAgICAgIGNvbW11bmljYXRpb24gb24g
ZWxlY3Ryb25pYyBtYWlsaW5nIGxpc3RzLCBzb3VyY2UgY29kZSBjb250cm9sIHN5c3RlbXMsCisj
IC0gICAgICBhbmQgaXNzdWUgdHJhY2tpbmcgc3lzdGVtcyB0aGF0IGFyZSBtYW5hZ2VkIGJ5LCBv
ciBvbiBiZWhhbGYgb2YsIHRoZQorIyAtICAgICAgTGljZW5zb3IgZm9yIHRoZSBwdXJwb3NlIG9m
IGRpc2N1c3NpbmcgYW5kIGltcHJvdmluZyB0aGUgV29yaywgYnV0CisjIC0gICAgICBleGNsdWRp
bmcgY29tbXVuaWNhdGlvbiB0aGF0IGlzIGNvbnNwaWN1b3VzbHkgbWFya2VkIG9yIG90aGVyd2lz
ZQorIyAtICAgICAgZGVzaWduYXRlZCBpbiB3cml0aW5nIGJ5IHRoZSBjb3B5cmlnaHQgb3duZXIg
YXMgIk5vdCBhIENvbnRyaWJ1dGlvbi4iCisjIC0KKyMgLSAgICAgICJDb250cmlidXRvciIgc2hh
bGwgbWVhbiBMaWNlbnNvciBhbmQgYW55IGluZGl2aWR1YWwgb3IgTGVnYWwgRW50aXR5CisjIC0g
ICAgICBvbiBiZWhhbGYgb2Ygd2hvbSBhIENvbnRyaWJ1dGlvbiBoYXMgYmVlbiByZWNlaXZlZCBi
eSBMaWNlbnNvciBhbmQKKyMgLSAgICAgIHN1YnNlcXVlbnRseSBpbmNvcnBvcmF0ZWQgd2l0aGlu
IHRoZSBXb3JrLgorIyAtCisjIC0gICAyLiBHcmFudCBvZiBDb3B5cmlnaHQgTGljZW5zZS4gU3Vi
amVjdCB0byB0aGUgdGVybXMgYW5kIGNvbmRpdGlvbnMgb2YKKyMgLSAgICAgIHRoaXMgTGljZW5z
ZSwgZWFjaCBDb250cmlidXRvciBoZXJlYnkgZ3JhbnRzIHRvIFlvdSBhIHBlcnBldHVhbCwKKyMg
LSAgICAgIHdvcmxkd2lkZSwgbm9uLWV4Y2x1c2l2ZSwgbm8tY2hhcmdlLCByb3lhbHR5LWZyZWUs
IGlycmV2b2NhYmxlCisjIC0gICAgICBjb3B5cmlnaHQgbGljZW5zZSB0byByZXByb2R1Y2UsIHBy
ZXBhcmUgRGVyaXZhdGl2ZSBXb3JrcyBvZiwKKyMgLSAgICAgIHB1YmxpY2x5IGRpc3BsYXksIHB1
YmxpY2x5IHBlcmZvcm0sIHN1YmxpY2Vuc2UsIGFuZCBkaXN0cmlidXRlIHRoZQorIyAtICAgICAg
V29yayBhbmQgc3VjaCBEZXJpdmF0aXZlIFdvcmtzIGluIFNvdXJjZSBvciBPYmplY3QgZm9ybS4K
KyMgLQorIyAtICAgMy4gR3JhbnQgb2YgUGF0ZW50IExpY2Vuc2UuIFN1YmplY3QgdG8gdGhlIHRl
cm1zIGFuZCBjb25kaXRpb25zIG9mCisjIC0gICAgICB0aGlzIExpY2Vuc2UsIGVhY2ggQ29udHJp
YnV0b3IgaGVyZWJ5IGdyYW50cyB0byBZb3UgYSBwZXJwZXR1YWwsCisjIC0gICAgICB3b3JsZHdp
ZGUsIG5vbi1leGNsdXNpdmUsIG5vLWNoYXJnZSwgcm95YWx0eS1mcmVlLCBpcnJldm9jYWJsZQor
IyAtICAgICAgKGV4Y2VwdCBhcyBzdGF0ZWQgaW4gdGhpcyBzZWN0aW9uKSBwYXRlbnQgbGljZW5z
ZSB0byBtYWtlLCBoYXZlIG1hZGUsCisjIC0gICAgICB1c2UsIG9mZmVyIHRvIHNlbGwsIHNlbGws
IGltcG9ydCwgYW5kIG90aGVyd2lzZSB0cmFuc2ZlciB0aGUgV29yaywKKyMgLSAgICAgIHdoZXJl
IHN1Y2ggbGljZW5zZSBhcHBsaWVzIG9ubHkgdG8gdGhvc2UgcGF0ZW50IGNsYWltcyBsaWNlbnNh
YmxlCisjIC0gICAgICBieSBzdWNoIENvbnRyaWJ1dG9yIHRoYXQgYXJlIG5lY2Vzc2FyaWx5IGlu
ZnJpbmdlZCBieSB0aGVpcgorIyAtICAgICAgQ29udHJpYnV0aW9uKHMpIGFsb25lIG9yIGJ5IGNv
bWJpbmF0aW9uIG9mIHRoZWlyIENvbnRyaWJ1dGlvbihzKQorIyAtICAgICAgd2l0aCB0aGUgV29y
ayB0byB3aGljaCBzdWNoIENvbnRyaWJ1dGlvbihzKSB3YXMgc3VibWl0dGVkLiBJZiBZb3UKKyMg
LSAgICAgIGluc3RpdHV0ZSBwYXRlbnQgbGl0aWdhdGlvbiBhZ2FpbnN0IGFueSBlbnRpdHkgKGlu
Y2x1ZGluZyBhCisjIC0gICAgICBjcm9zcy1jbGFpbSBvciBjb3VudGVyY2xhaW0gaW4gYSBsYXdz
dWl0KSBhbGxlZ2luZyB0aGF0IHRoZSBXb3JrCisjIC0gICAgICBvciBhIENvbnRyaWJ1dGlvbiBp
bmNvcnBvcmF0ZWQgd2l0aGluIHRoZSBXb3JrIGNvbnN0aXR1dGVzIGRpcmVjdAorIyAtICAgICAg
b3IgY29udHJpYnV0b3J5IHBhdGVudCBpbmZyaW5nZW1lbnQsIHRoZW4gYW55IHBhdGVudCBsaWNl
bnNlcworIyAtICAgICAgZ3JhbnRlZCB0byBZb3UgdW5kZXIgdGhpcyBMaWNlbnNlIGZvciB0aGF0
IFdvcmsgc2hhbGwgdGVybWluYXRlCisjIC0gICAgICBhcyBvZiB0aGUgZGF0ZSBzdWNoIGxpdGln
YXRpb24gaXMgZmlsZWQuCisjIC0KKyMgLSAgIDQuIFJlZGlzdHJpYnV0aW9uLiBZb3UgbWF5IHJl
cHJvZHVjZSBhbmQgZGlzdHJpYnV0ZSBjb3BpZXMgb2YgdGhlCisjIC0gICAgICBXb3JrIG9yIERl
cml2YXRpdmUgV29ya3MgdGhlcmVvZiBpbiBhbnkgbWVkaXVtLCB3aXRoIG9yIHdpdGhvdXQKKyMg
LSAgICAgIG1vZGlmaWNhdGlvbnMsIGFuZCBpbiBTb3VyY2Ugb3IgT2JqZWN0IGZvcm0sIHByb3Zp
ZGVkIHRoYXQgWW91CisjIC0gICAgICBtZWV0IHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKKyMg
LQorIyAtICAgICAgKGEpIFlvdSBtdXN0IGdpdmUgYW55IG90aGVyIHJlY2lwaWVudHMgb2YgdGhl
IFdvcmsgb3IKKyMgLSAgICAgICAgICBEZXJpdmF0aXZlIFdvcmtzIGEgY29weSBvZiB0aGlzIExp
Y2Vuc2U7IGFuZAorIyAtCisjIC0gICAgICAoYikgWW91IG11c3QgY2F1c2UgYW55IG1vZGlmaWVk
IGZpbGVzIHRvIGNhcnJ5IHByb21pbmVudCBub3RpY2VzCisjIC0gICAgICAgICAgc3RhdGluZyB0
aGF0IFlvdSBjaGFuZ2VkIHRoZSBmaWxlczsgYW5kCisjIC0KKyMgLSAgICAgIChjKSBZb3UgbXVz
dCByZXRhaW4sIGluIHRoZSBTb3VyY2UgZm9ybSBvZiBhbnkgRGVyaXZhdGl2ZSBXb3JrcworIyAt
ICAgICAgICAgIHRoYXQgWW91IGRpc3RyaWJ1dGUsIGFsbCBjb3B5cmlnaHQsIHBhdGVudCwgdHJh
ZGVtYXJrLCBhbmQKKyMgLSAgICAgICAgICBhdHRyaWJ1dGlvbiBub3RpY2VzIGZyb20gdGhlIFNv
dXJjZSBmb3JtIG9mIHRoZSBXb3JrLAorIyAtICAgICAgICAgIGV4Y2x1ZGluZyB0aG9zZSBub3Rp
Y2VzIHRoYXQgZG8gbm90IHBlcnRhaW4gdG8gYW55IHBhcnQgb2YKKyMgLSAgICAgICAgICB0aGUg
RGVyaXZhdGl2ZSBXb3JrczsgYW5kCisjIC0KKyMgLSAgICAgIChkKSBJZiB0aGUgV29yayBpbmNs
dWRlcyBhICJOT1RJQ0UiIHRleHQgZmlsZSBhcyBwYXJ0IG9mIGl0cworIyAtICAgICAgICAgIGRp
c3RyaWJ1dGlvbiwgdGhlbiBhbnkgRGVyaXZhdGl2ZSBXb3JrcyB0aGF0IFlvdSBkaXN0cmlidXRl
IG11c3QKKyMgLSAgICAgICAgICBpbmNsdWRlIGEgcmVhZGFibGUgY29weSBvZiB0aGUgYXR0cmli
dXRpb24gbm90aWNlcyBjb250YWluZWQKKyMgLSAgICAgICAgICB3aXRoaW4gc3VjaCBOT1RJQ0Ug
ZmlsZSwgZXhjbHVkaW5nIHRob3NlIG5vdGljZXMgdGhhdCBkbyBub3QKKyMgLSAgICAgICAgICBw
ZXJ0YWluIHRvIGFueSBwYXJ0IG9mIHRoZSBEZXJpdmF0aXZlIFdvcmtzLCBpbiBhdCBsZWFzdCBv
bmUKKyMgLSAgICAgICAgICBvZiB0aGUgZm9sbG93aW5nIHBsYWNlczogd2l0aGluIGEgTk9USUNF
IHRleHQgZmlsZSBkaXN0cmlidXRlZAorIyAtICAgICAgICAgIGFzIHBhcnQgb2YgdGhlIERlcml2
YXRpdmUgV29ya3M7IHdpdGhpbiB0aGUgU291cmNlIGZvcm0gb3IKKyMgLSAgICAgICAgICBkb2N1
bWVudGF0aW9uLCBpZiBwcm92aWRlZCBhbG9uZyB3aXRoIHRoZSBEZXJpdmF0aXZlIFdvcmtzOyBv
ciwKKyMgLSAgICAgICAgICB3aXRoaW4gYSBkaXNwbGF5IGdlbmVyYXRlZCBieSB0aGUgRGVyaXZh
dGl2ZSBXb3JrcywgaWYgYW5kCisjIC0gICAgICAgICAgd2hlcmV2ZXIgc3VjaCB0aGlyZC1wYXJ0
eSBub3RpY2VzIG5vcm1hbGx5IGFwcGVhci4gVGhlIGNvbnRlbnRzCisjIC0gICAgICAgICAgb2Yg
dGhlIE5PVElDRSBmaWxlIGFyZSBmb3IgaW5mb3JtYXRpb25hbCBwdXJwb3NlcyBvbmx5IGFuZAor
IyAtICAgICAgICAgIGRvIG5vdCBtb2RpZnkgdGhlIExpY2Vuc2UuIFlvdSBtYXkgYWRkIFlvdXIg
b3duIGF0dHJpYnV0aW9uCisjIC0gICAgICAgICAgbm90aWNlcyB3aXRoaW4gRGVyaXZhdGl2ZSBX
b3JrcyB0aGF0IFlvdSBkaXN0cmlidXRlLCBhbG9uZ3NpZGUKKyMgLSAgICAgICAgICBvciBhcyBh
biBhZGRlbmR1bSB0byB0aGUgTk9USUNFIHRleHQgZnJvbSB0aGUgV29yaywgcHJvdmlkZWQKKyMg
LSAgICAgICAgICB0aGF0IHN1Y2ggYWRkaXRpb25hbCBhdHRyaWJ1dGlvbiBub3RpY2VzIGNhbm5v
dCBiZSBjb25zdHJ1ZWQKKyMgLSAgICAgICAgICBhcyBtb2RpZnlpbmcgdGhlIExpY2Vuc2UuCisj
IC0KKyMgLSAgICAgIFlvdSBtYXkgYWRkIFlvdXIgb3duIGNvcHlyaWdodCBzdGF0ZW1lbnQgdG8g
WW91ciBtb2RpZmljYXRpb25zIGFuZAorIyAtICAgICAgbWF5IHByb3ZpZGUgYWRkaXRpb25hbCBv
ciBkaWZmZXJlbnQgbGljZW5zZSB0ZXJtcyBhbmQgY29uZGl0aW9ucworIyAtICAgICAgZm9yIHVz
ZSwgcmVwcm9kdWN0aW9uLCBvciBkaXN0cmlidXRpb24gb2YgWW91ciBtb2RpZmljYXRpb25zLCBv
cgorIyAtICAgICAgZm9yIGFueSBzdWNoIERlcml2YXRpdmUgV29ya3MgYXMgYSB3aG9sZSwgcHJv
dmlkZWQgWW91ciB1c2UsCisjIC0gICAgICByZXByb2R1Y3Rpb24sIGFuZCBkaXN0cmlidXRpb24g
b2YgdGhlIFdvcmsgb3RoZXJ3aXNlIGNvbXBsaWVzIHdpdGgKKyMgLSAgICAgIHRoZSBjb25kaXRp
b25zIHN0YXRlZCBpbiB0aGlzIExpY2Vuc2UuCisjIC0KKyMgLSAgIDUuIFN1Ym1pc3Npb24gb2Yg
Q29udHJpYnV0aW9ucy4gVW5sZXNzIFlvdSBleHBsaWNpdGx5IHN0YXRlIG90aGVyd2lzZSwKKyMg
LSAgICAgIGFueSBDb250cmlidXRpb24gaW50ZW50aW9uYWxseSBzdWJtaXR0ZWQgZm9yIGluY2x1
c2lvbiBpbiB0aGUgV29yaworIyAtICAgICAgYnkgWW91IHRvIHRoZSBMaWNlbnNvciBzaGFsbCBi
ZSB1bmRlciB0aGUgdGVybXMgYW5kIGNvbmRpdGlvbnMgb2YKKyMgLSAgICAgIHRoaXMgTGljZW5z
ZSwgd2l0aG91dCBhbnkgYWRkaXRpb25hbCB0ZXJtcyBvciBjb25kaXRpb25zLgorIyAtICAgICAg
Tm90d2l0aHN0YW5kaW5nIHRoZSBhYm92ZSwgbm90aGluZyBoZXJlaW4gc2hhbGwgc3VwZXJzZWRl
IG9yIG1vZGlmeQorIyAtICAgICAgdGhlIHRlcm1zIG9mIGFueSBzZXBhcmF0ZSBsaWNlbnNlIGFn
cmVlbWVudCB5b3UgbWF5IGhhdmUgZXhlY3V0ZWQKKyMgLSAgICAgIHdpdGggTGljZW5zb3IgcmVn
YXJkaW5nIHN1Y2ggQ29udHJpYnV0aW9ucy4KKyMgLQorIyAtICAgNi4gVHJhZGVtYXJrcy4gVGhp
cyBMaWNlbnNlIGRvZXMgbm90IGdyYW50IHBlcm1pc3Npb24gdG8gdXNlIHRoZSB0cmFkZQorIyAt
ICAgICAgbmFtZXMsIHRyYWRlbWFya3MsIHNlcnZpY2UgbWFya3MsIG9yIHByb2R1Y3QgbmFtZXMg
b2YgdGhlIExpY2Vuc29yLAorIyAtICAgICAgZXhjZXB0IGFzIHJlcXVpcmVkIGZvciByZWFzb25h
YmxlIGFuZCBjdXN0b21hcnkgdXNlIGluIGRlc2NyaWJpbmcgdGhlCisjIC0gICAgICBvcmlnaW4g
b2YgdGhlIFdvcmsgYW5kIHJlcHJvZHVjaW5nIHRoZSBjb250ZW50IG9mIHRoZSBOT1RJQ0UgZmls
ZS4KKyMgLQorIyAtICAgNy4gRGlzY2xhaW1lciBvZiBXYXJyYW50eS4gVW5sZXNzIHJlcXVpcmVk
IGJ5IGFwcGxpY2FibGUgbGF3IG9yCisjIC0gICAgICBhZ3JlZWQgdG8gaW4gd3JpdGluZywgTGlj
ZW5zb3IgcHJvdmlkZXMgdGhlIFdvcmsgKGFuZCBlYWNoCisjIC0gICAgICBDb250cmlidXRvciBw
cm92aWRlcyBpdHMgQ29udHJpYnV0aW9ucykgb24gYW4gIkFTIElTIiBCQVNJUywKKyMgLSAgICAg
IFdJVEhPVVQgV0FSUkFOVElFUyBPUiBDT05ESVRJT05TIE9GIEFOWSBLSU5ELCBlaXRoZXIgZXhw
cmVzcyBvcgorIyAtICAgICAgaW1wbGllZCwgaW5jbHVkaW5nLCB3aXRob3V0IGxpbWl0YXRpb24s
IGFueSB3YXJyYW50aWVzIG9yIGNvbmRpdGlvbnMKKyMgLSAgICAgIG9mIFRJVExFLCBOT04tSU5G
UklOR0VNRU5ULCBNRVJDSEFOVEFCSUxJVFksIG9yIEZJVE5FU1MgRk9SIEEKKyMgLSAgICAgIFBB
UlRJQ1VMQVIgUFVSUE9TRS4gWW91IGFyZSBzb2xlbHkgcmVzcG9uc2libGUgZm9yIGRldGVybWlu
aW5nIHRoZQorIyAtICAgICAgYXBwcm9wcmlhdGVuZXNzIG9mIHVzaW5nIG9yIHJlZGlzdHJpYnV0
aW5nIHRoZSBXb3JrIGFuZCBhc3N1bWUgYW55CisjIC0gICAgICByaXNrcyBhc3NvY2lhdGVkIHdp
dGggWW91ciBleGVyY2lzZSBvZiBwZXJtaXNzaW9ucyB1bmRlciB0aGlzIExpY2Vuc2UuCisjIC0K
KyMgLSAgIDguIExpbWl0YXRpb24gb2YgTGlhYmlsaXR5LiBJbiBubyBldmVudCBhbmQgdW5kZXIg
bm8gbGVnYWwgdGhlb3J5LAorIyAtICAgICAgd2hldGhlciBpbiB0b3J0IChpbmNsdWRpbmcgbmVn
bGlnZW5jZSksIGNvbnRyYWN0LCBvciBvdGhlcndpc2UsCisjIC0gICAgICB1bmxlc3MgcmVxdWly
ZWQgYnkgYXBwbGljYWJsZSBsYXcgKHN1Y2ggYXMgZGVsaWJlcmF0ZSBhbmQgZ3Jvc3NseQorIyAt
ICAgICAgbmVnbGlnZW50IGFjdHMpIG9yIGFncmVlZCB0byBpbiB3cml0aW5nLCBzaGFsbCBhbnkg
Q29udHJpYnV0b3IgYmUKKyMgLSAgICAgIGxpYWJsZSB0byBZb3UgZm9yIGRhbWFnZXMsIGluY2x1
ZGluZyBhbnkgZGlyZWN0LCBpbmRpcmVjdCwgc3BlY2lhbCwKKyMgLSAgICAgIGluY2lkZW50YWws
IG9yIGNvbnNlcXVlbnRpYWwgZGFtYWdlcyBvZiBhbnkgY2hhcmFjdGVyIGFyaXNpbmcgYXMgYQor
IyAtICAgICAgcmVzdWx0IG9mIHRoaXMgTGljZW5zZSBvciBvdXQgb2YgdGhlIHVzZSBvciBpbmFi
aWxpdHkgdG8gdXNlIHRoZQorIyAtICAgICAgV29yayAoaW5jbHVkaW5nIGJ1dCBub3QgbGltaXRl
ZCB0byBkYW1hZ2VzIGZvciBsb3NzIG9mIGdvb2R3aWxsLAorIyAtICAgICAgd29yayBzdG9wcGFn
ZSwgY29tcHV0ZXIgZmFpbHVyZSBvciBtYWxmdW5jdGlvbiwgb3IgYW55IGFuZCBhbGwKKyMgLSAg
ICAgIG90aGVyIGNvbW1lcmNpYWwgZGFtYWdlcyBvciBsb3NzZXMpLCBldmVuIGlmIHN1Y2ggQ29u
dHJpYnV0b3IKKyMgLSAgICAgIGhhcyBiZWVuIGFkdmlzZWQgb2YgdGhlIHBvc3NpYmlsaXR5IG9m
IHN1Y2ggZGFtYWdlcy4KKyMgLQorIyAtICAgOS4gQWNjZXB0aW5nIFdhcnJhbnR5IG9yIEFkZGl0
aW9uYWwgTGlhYmlsaXR5LiBXaGlsZSByZWRpc3RyaWJ1dGluZworIyAtICAgICAgdGhlIFdvcmsg
b3IgRGVyaXZhdGl2ZSBXb3JrcyB0aGVyZW9mLCBZb3UgbWF5IGNob29zZSB0byBvZmZlciwKKyMg
LSAgICAgIGFuZCBjaGFyZ2UgYSBmZWUgZm9yLCBhY2NlcHRhbmNlIG9mIHN1cHBvcnQsIHdhcnJh
bnR5LCBpbmRlbW5pdHksCisjIC0gICAgICBvciBvdGhlciBsaWFiaWxpdHkgb2JsaWdhdGlvbnMg
YW5kL29yIHJpZ2h0cyBjb25zaXN0ZW50IHdpdGggdGhpcworIyAtICAgICAgTGljZW5zZS4gSG93
ZXZlciwgaW4gYWNjZXB0aW5nIHN1Y2ggb2JsaWdhdGlvbnMsIFlvdSBtYXkgYWN0IG9ubHkKKyMg
LSAgICAgIG9uIFlvdXIgb3duIGJlaGFsZiBhbmQgb24gWW91ciBzb2xlIHJlc3BvbnNpYmlsaXR5
LCBub3Qgb24gYmVoYWxmCisjIC0gICAgICBvZiBhbnkgb3RoZXIgQ29udHJpYnV0b3IsIGFuZCBv
bmx5IGlmIFlvdSBhZ3JlZSB0byBpbmRlbW5pZnksCisjIC0gICAgICBkZWZlbmQsIGFuZCBob2xk
IGVhY2ggQ29udHJpYnV0b3IgaGFybWxlc3MgZm9yIGFueSBsaWFiaWxpdHkKKyMgLSAgICAgIGlu
Y3VycmVkIGJ5LCBvciBjbGFpbXMgYXNzZXJ0ZWQgYWdhaW5zdCwgc3VjaCBDb250cmlidXRvciBi
eSByZWFzb24KKyMgLSAgICAgIG9mIHlvdXIgYWNjZXB0aW5nIGFueSBzdWNoIHdhcnJhbnR5IG9y
IGFkZGl0aW9uYWwgbGlhYmlsaXR5LgorIyAtCisjIC0gICBFTkQgT0YgVEVSTVMgQU5EIENPTkRJ
VElPTlMKKyMgLQorIyAtICAgQVBQRU5ESVg6IEhvdyB0byBhcHBseSB0aGUgQXBhY2hlIExpY2Vu
c2UgdG8geW91ciB3b3JrLgorIyAtCisjIC0gICAgICBUbyBhcHBseSB0aGUgQXBhY2hlIExpY2Vu
c2UgdG8geW91ciB3b3JrLCBhdHRhY2ggdGhlIGZvbGxvd2luZworIyAtICAgICAgYm9pbGVycGxh
dGUgbm90aWNlLCB3aXRoIHRoZSBmaWVsZHMgZW5jbG9zZWQgYnkgYnJhY2tldHMgIltdIgorIyAt
ICAgICAgcmVwbGFjZWQgd2l0aCB5b3VyIG93biBpZGVudGlmeWluZyBpbmZvcm1hdGlvbi4gKERv
bid0IGluY2x1ZGUKKyMgLSAgICAgIHRoZSBicmFja2V0cyEpICBUaGUgdGV4dCBzaG91bGQgYmUg
ZW5jbG9zZWQgaW4gdGhlIGFwcHJvcHJpYXRlCisjIC0gICAgICBjb21tZW50IHN5bnRheCBmb3Ig
dGhlIGZpbGUgZm9ybWF0LiBXZSBhbHNvIHJlY29tbWVuZCB0aGF0IGEKKyMgLSAgICAgIGZpbGUg
b3IgY2xhc3MgbmFtZSBhbmQgZGVzY3JpcHRpb24gb2YgcHVycG9zZSBiZSBpbmNsdWRlZCBvbiB0
aGUKKyMgLSAgICAgIHNhbWUgInByaW50ZWQgcGFnZSIgYXMgdGhlIGNvcHlyaWdodCBub3RpY2Ug
Zm9yIGVhc2llcgorIyAtICAgICAgaWRlbnRpZmljYXRpb24gd2l0aGluIHRoaXJkLXBhcnR5IGFy
Y2hpdmVzLgorIyAtCisjIC0gICBDb3B5cmlnaHQgW3l5eXldIFtuYW1lIG9mIGNvcHlyaWdodCBv
d25lcl0KKyMgLQorIyAtICAgTGljZW5zZWQgdW5kZXIgdGhlIEFwYWNoZSBMaWNlbnNlLCBWZXJz
aW9uIDIuMCAodGhlICJMaWNlbnNlIik7CisjIC0gICB5b3UgbWF5IG5vdCB1c2UgdGhpcyBmaWxl
IGV4Y2VwdCBpbiBjb21wbGlhbmNlIHdpdGggdGhlIExpY2Vuc2UuCisjIC0gICBZb3UgbWF5IG9i
dGFpbiBhIGNvcHkgb2YgdGhlIExpY2Vuc2UgYXQKKyMgLQorIyAtICAgICAgIGh0dHA6Ly93d3cu
YXBhY2hlLm9yZy9saWNlbnNlcy9MSUNFTlNFLTIuMAorIyAtCisjIC0gICBVbmxlc3MgcmVxdWly
ZWQgYnkgYXBwbGljYWJsZSBsYXcgb3IgYWdyZWVkIHRvIGluIHdyaXRpbmcsIHNvZnR3YXJlCisj
IC0gICBkaXN0cmlidXRlZCB1bmRlciB0aGUgTGljZW5zZSBpcyBkaXN0cmlidXRlZCBvbiBhbiAi
QVMgSVMiIEJBU0lTLAorIyAtICAgV0lUSE9VVCBXQVJSQU5USUVTIE9SIENPTkRJVElPTlMgT0Yg
QU5ZIEtJTkQsIGVpdGhlciBleHByZXNzIG9yIGltcGxpZWQuCisjIC0gICBTZWUgdGhlIExpY2Vu
c2UgZm9yIHRoZSBzcGVjaWZpYyBsYW5ndWFnZSBnb3Zlcm5pbmcgcGVybWlzc2lvbnMgYW5kCisj
IC0gICBsaW1pdGF0aW9ucyB1bmRlciB0aGUgTGljZW5zZS4KKyMgLQorIyAtLS0tIGVuZCBvZiBB
cGFjaGUgMi4wIGxpY2Vuc2UgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KKyMgLQorIyAgVGhlIGV4dC9jb3JvdXRpbmUgY29kZSBpcyBleHRlcm5hbGx5IG1h
aW50YWluZWQgYW5kIGRpc3RyaWJ1dGVkIHVuZGVyCisjICB0aGUgQm9vc3QgU29mdHdhcmUgTGlj
ZW5zZSwgVmVyc2lvbiAxLjAuICAoU2VlIGl0cyBhY2NvbXBhbnlpbmcgZmlsZQorIyAgTElDRU5T
RV8xXzAudHh0LikKKyMgCisjCisKIFNVTU1BUlkgPSAiSVNDIEtlYSBESENQIFNlcnZlciIKIERF
U0NSSVBUSU9OID0gIktlYSBpcyB0aGUgbmV4dCBnZW5lcmF0aW9uIG9mIERIQ1Agc29mdHdhcmUg
ZGV2ZWxvcGVkIGJ5IElTQy4gSXQgc3VwcG9ydHMgYm90aCBESENQdjQgYW5kIERIQ1B2NiBwcm90
b2NvbHMgYWxvbmcgd2l0aCB0aGVpciBleHRlbnNpb25zLCBlLmcuIHByZWZpeCBkZWxlZ2F0aW9u
IGFuZCBkeW5hbWljIHVwZGF0ZXMgdG8gRE5TLiIKIEhPTUVQQUdFID0gImh0dHA6Ly9rZWEuaXNj
Lm9yZyIKIFNFQ1RJT04gPSAiY29ubmVjdGl2aXR5IgogTElDRU5TRSA9ICJNUEwtMi4wICYgQXBh
Y2hlLTIuMCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWI0ZWNlZTk5
NWVlYjY3ODBhMTdkZDdlNTM5ZTk3YWJjIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09Q
WUlORzttZDU9OTdjZTE0YmRkMjczM2Y1Yjg0YWI1ZTI5MzgwZDA1N2QiCiAKIERFUEVORFMgPSAi
Ym9vc3QgbG9nNGNwbHVzIG9wZW5zc2wiCiAKQEAgLTE4LDcgKzI2Myw3IEBAIFNSQ19VUkkgPSAi
aHR0cDovL2Z0cC5pc2Mub3JnL2lzYy9rZWEvJHtQVn0vJHtCUH0udGFyLmd6IFwKICAgICAgICAg
ICAgZmlsZTovL2ZpeF9waWRfa2VhY3RybC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAx
LXNyYy1saWItbG9nLWxvZ2dlcl91bml0dGVzdF9zdXBwb3J0LmNjLWRvLW5vdC13cml0ZS0ucGF0
Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGQyODIxM2JkYzhlMmJi
ODcwYTM4M2IzMGFjMWU1M2Q1NGUxZWJhNDNkMmY4NmU1MTUxYjA4YjY2YWE2Y2YzMiIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICJkYTdkOTBjYTYyYTc3MjYwMmRhYzZlNzdlNTA3MzE5MDM4NDIyODk1
YWQ2OGVlYjE0MmYxNDg3ZDY3ZDUzMWQyIgogCiBpbmhlcml0IGF1dG90b29scyBzeXN0ZW1kIHVw
ZGF0ZS1yYy5kIHVwc3RyZWFtLXZlcnNpb24taXMtZXZlbgogCi0tIAoyLjMxLjEKCg==

--===============5914054132626219366==--

