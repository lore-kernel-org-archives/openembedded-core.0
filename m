Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743B9C64ED4
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:34 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.46761.1669908625061181489
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=L3/gCnmS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010184ce4f7318-07e1bd92-c3a1-4209-ab47-63479db871cb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908624;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9YgNTgUSec7qSR2G9pujigMCImLP3Tt5RFT09SqaAZk=;
	b=L3/gCnmSXP/GgEWrc71U+aiPO2XMgwBsNBhYYXq/0S8wFJStvTItKptOWY1+3IBV
	YhnwXHz1aL6hdYjU3uv2YNiJnnBl8C3N2VFl/eBkWcKDX8i6LJV5gWskoTfLH7fmWqA
	YNhiY/xKEM7QIpQSfTyFr9jwxCf63CJhoWjkzFCw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908624;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9YgNTgUSec7qSR2G9pujigMCImLP3Tt5RFT09SqaAZk=;
	b=HvxWZBeRfPgtrJRx//yH38a0OlJ87mp0Nn9Ktc22XyfkIgfVk/ibWeZl63E7uC/9
	TrAx64SrUOWolyGAWH6oqYpgUcitB63skZyV1ZHdG3Pf8fqrOZkREsAvkFVLVOGngyJ
	cS+IDp1shdJhrHrZB2fRmBft2frNeRBN5FrX/0fU=
Content-Type: multipart/mixed; boundary="===============5925238546835188968=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.18.9 SUCCEEDED
Message-ID: <01010184ce4f7318-07e1bd92-c3a1-4209-ab47-63479db871cb-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174122

--===============5925238546835188968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bind* to *9.18.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.18.8-9.18.9.patch
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
--===============5925238546835188968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bind/bind-dbg: PKGSIZE changed from 10762932 to 10857132 (+1%)
packages/core2-32-poky-linux/bind/bind-dbg: PV changed from "9.18.8" to "9.18.9"
packages/core2-32-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libirs-9.18.8.so /usr/lib/.debug/libns-9.18.8.so /usr/lib/.debug/libisccc-9.18.8.so /usr/lib/.debug/libisccfg-9.18.8.so /usr/lib/.debug/libdns-9.18.8.so /usr/lib/.debug/libisc-9.18.8.so /usr/lib/.debug/libbind9-9.18.8.so", added "/usr/lib/.debug/libisc-9.18.9.so /usr/lib/.debug/libns-9.18.9.so /usr/lib/.debug/libirs-9.18.9.so /usr/lib/.debug/libbind9-9.18.9.so /usr/lib/.debug/libdns-9.18.9.so /usr/lib/.debug/libisccc-9.18.9.so /usr/lib/.debug/libisccfg-9.18.9.so"
packages/core2-32-poky-linux/bind/bind-dbg: PKGV changed from 9.18.8 [default] to 9.18.9 [default]
packages/core2-32-poky-linux/bind/bind-dev: PKGSIZE changed from 1452447 to 1453177 (+0%)
packages/core2-32-poky-linux/bind/bind-dev: PV changed from "9.18.8" to "9.18.9"
packages/core2-32-poky-linux/bind/bind-dev: PKGV changed from 9.18.8 [default] to 9.18.9 [default]
packages/core2-32-poky-linux/bind/bind-doc: PKGSIZE changed from 308441 to 308556 (+0%)
packages/core2-32-poky-linux/bind/bind-doc: PV changed from "9.18.8" to "9.18.9"
packages/core2-32-poky-linux/bind/bind-doc: PKGV changed from 9.18.8 [default] to 9.18.9 [default]
packages/core2-32-poky-linux/bind/bind-libs: PKGSIZE changed from 6327664 to 6401392 (+1%)
packages/core2-32-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.18.8.so", added "/usr/lib/*-9.18.9.so"
packages/core2-32-poky-linux/bind/bind-libs: PV changed from "9.18.8" to "9.18.9"
packages/core2-32-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libns-9.18.8.so /usr/lib/libirs-9.18.8.so /usr/lib/libdns-9.18.8.so /usr/lib/libbind9-9.18.8.so /usr/lib/libisccc-9.18.8.so /usr/lib/libisccfg-9.18.8.so /usr/lib/libisc-9.18.8.so", added "/usr/lib/libisc-9.18.9.so /usr/lib/libirs-9.18.9.so /usr/lib/libdns-9.18.9.so /usr/lib/libisccfg-9.18.9.so /usr/lib/libns-9.18.9.so /usr/lib/libbind9-9.18.9.so /usr/lib/libisccc-9.18.9.so"
packages/core2-32-poky-linux/bind/bind-libs: PKGV changed from 9.18.8 [default] to 9.18.9 [default]
packages/core2-32-poky-linux/bind/bind-locale: PV changed from "9.18.8" to "9.18.9"
packages/core2-32-poky-linux/bind/bind-locale: PKGV changed from 9.18.8 [default] to 9.18.9 [default]
packages/core2-32-poky-linux/bind/bind-src: PKGSIZE changed from 9565235 to 9584446 (+0%)
packages/core2-32-poky-linux/bind/bind-src: PV changed from "9.18.8" to "9.18.9"
packages/core2-32-poky-linux/bind/bind-src: FILELIST: directory renamed /usr/src/debug/bind/9.18.8-r0/lib/isccfg -> /usr/src/debug/bind/9.18.9-r0/lib/isccfg, directory renamed /usr/src/debug/bind/9.18.8-r0/lib/isccfg/include/isccfg -> /usr/src/debug/bind/9.18.9-r0/lib/isccfg/include/isccfg, directory renamed /usr/src/debug/bind/9.18.8-r0/bin/named/include/named -> /usr/src/debug/bind/9.18.9-r0/bin/named/include/named, directory renamed /usr/src/debug/bind/9.18.8-r0/lib/dns/include/dns -> /usr/src/debug/bind/9.18.9-r0/lib/dns/include/dns, directory renamed /usr/src/debug/bind/9.18.8-r0/lib/dns/rdata/generic -> /usr/src/debug/bind/9.18.9-r0/lib/dns/rdata/generic, directory renamed /usr/src/debug/bind/9.18.8-r0/lib/dns/rdata/in_1 -> /usr/src/debug/bind/9.18.9-r0/lib/dns/rdata/in_1, directory renamed /usr/src/debug/bind/9.18.8-r0/bin/nsupdate -> /usr/src/debug/bind/9.18.9-r0/bin/nsupdate, directory renamed /usr/src/debug/bind/9.18.8-r0/lib/isccc -> /usr/src/debug/bind/9.18.9-r0/lib/isccc
 , directory renamed /usr/src/debug/bind/9.18.8-r0/bin/confgen -> /usr/src/debug/bind/9.18.9-r0/bin/confgen, directory renamed /usr/src/debug/bind/9.18.8-r0/lib/irs -> /usr/src/debug/bind/9.18.9-r0/lib/irs, directory renamed /usr/src/debug/bind/9.18.8-r0/lib/ns/include/ns -> /usr/src/debug/bind/9.18.9-r0/lib/ns/include/ns, directory renamed /usr/src/debug/bind/9.18.8-r0/bin/dig -> /usr/src/debug/bind/9.18.9-r0/bin/dig, directory renamed /usr/src/debug/bind/9.18.8-r0/lib/bind9 -> /usr/src/debug/bind/9.18.9-r0/lib/bind9, directory renamed /usr/src/debug/bind/9.18.8-r0/lib/irs/include/irs -> /usr/src/debug/bind/9.18.9-r0/lib/irs/include/irs, directory renamed /usr/src/debug/bind/9.18.8-r0/bin/rndc -> /usr/src/debug/bind/9.18.9-r0/bin/rndc, directory renamed /usr/src/debug/bind/9.18.8-r0/bin/delv -> /usr/src/debug/bind/9.18.9-r0/bin/delv, directory renamed /usr/src/debug/bind/9.18.8-r0/lib/dns/rdata/any_255 -> /usr/src/debug/bind/9.18.9-r0/lib/dns/rdata/any_255, directory renamed /usr/sr
 c/debug/bind/9.18.8-r0/bin/tools -> /usr/src/debug/bind/9.18.9-r0/bin/tools, directory renamed /usr/src/debug/bind/9.18.8-r0/lib/dns/rdata/hs_4 -> /usr/src/debug/bind/9.18.9-r0/lib/dns/rdata/hs_4, directory renamed /usr/src/debug/bind/9.18.8-r0/bin/check -> /usr/src/debug/bind/9.18.9-r0/bin/check, directory renamed /usr/src/debug/bind/9.18.8-r0/lib/dns/rdata/ch_3 -> /usr/src/debug/bind/9.18.9-r0/lib/dns/rdata/ch_3, directory renamed /usr/src/debug/bind/9.18.8-r0/bin/plugins -> /usr/src/debug/bind/9.18.9-r0/bin/plugins, directory renamed /usr/src/debug/bind/9.18.8-r0/lib/isc/include/isc -> /usr/src/debug/bind/9.18.9-r0/lib/isc/include/isc, directory renamed /usr/src/debug/bind/9.18.8-r0/lib/ns -> /usr/src/debug/bind/9.18.9-r0/lib/ns, directory renamed /usr/src/debug/bind/9.18.8-r0/lib/dns/include/dst -> /usr/src/debug/bind/9.18.9-r0/lib/dns/include/dst, directory renamed /usr/src/debug/bind/9.18.8-r0/lib/isccc/include/isccc -> /usr/src/debug/bind/9.18.9-r0/lib/isccc/include/isccc, di
 rectory renamed /usr/src/debug/bind/9.18.8-r0/lib/dns -> /usr/src/debug/bind/9.18.9-r0/lib/dns, directory renamed /usr/src/debug/bind/9.18.8-r0/lib/bind9/include/bind9 -> /usr/src/debug/bind/9.18.9-r0/lib/bind9/include/bind9, directory renamed /usr/src/debug/bind/9.18.8-r0/lib/isc/netmgr -> /usr/src/debug/bind/9.18.9-r0/lib/isc/netmgr, directory renamed /usr/src/debug/bind/9.18.8-r0/bin/dnssec -> /usr/src/debug/bind/9.18.9-r0/bin/dnssec, directory renamed /usr/src/debug/bind/9.18.8-r0/bin/named -> /usr/src/debug/bind/9.18.9-r0/bin/named, directory renamed /usr/src/debug/bind/9.18.8-r0/bin/confgen/include/confgen -> /usr/src/debug/bind/9.18.9-r0/bin/confgen/include/confgen, directory renamed /usr/src/debug/bind/9.18.8-r0/bin/named/include/dlz -> /usr/src/debug/bind/9.18.9-r0/bin/named/include/dlz, removed "/usr/src/debug/bind/9.18.8-r0/lib/isc/trampoline_p.h /usr/src/debug/bind/9.18.8-r0/lib/isc/netmgr_p.h /usr/src/debug/bind/9.18.8-r0/lib/isc/condition.c /usr/src/debug/bind/9.18.8-r
 0/lib/isc/stats.c /usr/src/debug/bind/9.18.8-r0/lib/isc/tls_p.h /usr/src/debug/bind/9.18.8-r0/lib/isc/string.c /usr/src/debug/bind/9.18.8-r0/lib/isc/region.c /usr/src/debug/bind/9.18.8-r0/lib/isc/ht.c /usr/src/debug/bind/9.18.8-r0/lib/isc/netscope.c /usr/src/debug/bind/9.18.8-r0/lib/isc/counter.c /usr/src/debug/bind/9.18.8-r0/lib/isc/hash.c /usr/src/debug/bind/9.18.8-r0/lib/isc/symtab.c /usr/src/debug/bind/9.18.8-r0/lib/isc/app.c /usr/src/debug/bind/9.18.8-r0/lib/isc/result.c /usr/src/debug/bind/9.18.8-r0/lib/isc/lex.c /usr/src/debug/bind/9.18.8-r0/lib/isc/glob.c /usr/src/debug/bind/9.18.8-r0/lib/isc/jemalloc_shim.h /usr/src/debug/bind/9.18.8-r0/lib/isc/random.c /usr/src/debug/bind/9.18.8-r0/lib/isc/buffer.c /usr/src/debug/bind/9.18.8-r0/lib/isc/mem.c /usr/src/debug/bind/9.18.8-r0/lib/isc/os_p.h /usr/src/debug/bind/9.18.8-r0/lib/isc/tm.c /usr/src/debug/bind/9.18.8-r0/lib/isc/radix.c /usr/src/debug/bind/9.18.8-r0/lib/isc/regex.c /usr/src/debug/bind/9.18.8-r0/lib/isc/os.c /usr/src/deb
 ug/bind/9.18.8-r0/lib/isc/parseint.c /usr/src/debug/bind/9.18.8-r0/lib/isc/error.c /usr/src/debug/bind/9.18.8-r0/lib/isc/dir.c /usr/src/debug/bind/9.18.8-r0/lib/isc/stdtime.c /usr/src/debug/bind/9.18.8-r0/lib/isc/base32.c /usr/src/debug/bind/9.18.8-r0/lib/isc/aes.c /usr/src/debug/bind/9.18.8-r0/lib/isc/heap.c /usr/src/debug/bind/9.18.8-r0/lib/isc/md.c /usr/src/debug/bind/9.18.8-r0/lib/isc/resource.c /usr/src/debug/bind/9.18.8-r0/lib/isc/timer_p.h /usr/src/debug/bind/9.18.8-r0/lib/isc/base64.c /usr/src/debug/bind/9.18.8-r0/lib/isc/errno.c /usr/src/debug/bind/9.18.8-r0/lib/isc/lib.c /usr/src/debug/bind/9.18.8-r0/lib/isc/trampoline.c /usr/src/debug/bind/9.18.8-r0/lib/isc/utf8.c /usr/src/debug/bind/9.18.8-r0/lib/isc/managers.c /usr/src/debug/bind/9.18.8-r0/lib/isc/commandline.c /usr/src/debug/bind/9.18.8-r0/lib/isc/portset.c /usr/src/debug/bind/9.18.8-r0/lib/isc/task_p.h /usr/src/debug/bind/9.18.8-r0/lib/isc/crc64.c /usr/src/debug/bind/9.18.8-r0/lib/isc/ratelimiter.c /usr/src/debug/bind
 /9.18.8-r0/lib/isc/rwlock.c /usr/src/debug/bind/9.18.8-r0/lib/isc/errno2result.h /usr/src/debug/bind/9.18.8-r0/lib/isc/assertions.c /usr/src/debug/bind/9.18.8-r0/lib/isc/mem_p.h /usr/src/debug/bind/9.18.8-r0/lib/isc/taskpool.c /usr/src/debug/bind/9.18.8-r0/lib/isc/event.c /usr/src/debug/bind/9.18.8-r0/lib/isc/thread.c /usr/src/debug/bind/9.18.8-r0/lib/isc/hex.c /usr/src/debug/bind/9.18.8-r0/lib/isc/mutexblock.c /usr/src/debug/bind/9.18.8-r0/lib/isc/entropy.c /usr/src/debug/bind/9.18.8-r0/lib/isc/siphash.c /usr/src/debug/bind/9.18.8-r0/lib/isc/nonce.c /usr/src/debug/bind/9.18.8-r0/lib/isc/entropy_private.h /usr/src/debug/bind/9.18.8-r0/lib/isc/errno2result.c /usr/src/debug/bind/9.18.8-r0/lib/isc/safe.c /usr/src/debug/bind/9.18.8-r0/lib/isc/httpd.c /usr/src/debug/bind/9.18.8-r0/lib/isc/mutex.c /usr/src/debug/bind/9.18.8-r0/lib/isc/quota.c /usr/src/debug/bind/9.18.8-r0/lib/isc/timer.c /usr/src/debug/bind/9.18.8-r0/lib/isc/hmac.c /usr/src/debug/bind/9.18.8-r0/lib/isc/net.c /usr/src/debu
 g/bind/9.18.8-r0/lib/isc/astack.c /usr/src/debug/bind/9.18.8-r0/lib/isc/sockaddr.c /usr/src/debug/bind/9.18.8-r0/lib/isc/iterated_hash.c /usr/src/debug/bind/9.18.8-r0/lib/isc/serial.c /usr/src/debug/bind/9.18.8-r0/lib/isc/syslog.c /usr/src/debug/bind/9.18.8-r0/lib/isc/meminfo.c /usr/src/debug/bind/9.18.8-r0/lib/isc/pool.c /usr/src/debug/bind/9.18.8-r0/lib/isc/file.c /usr/src/debug/bind/9.18.8-r0/lib/isc/fsaccess_common_p.h /usr/src/debug/bind/9.18.8-r0/lib/isc/log.c /usr/src/debug/bind/9.18.8-r0/lib/isc/backtrace.c /usr/src/debug/bind/9.18.8-r0/lib/isc/bind9.c /usr/src/debug/bind/9.18.8-r0/lib/isc/fsaccess_common.c /usr/src/debug/bind/9.18.8-r0/lib/isc/interfaceiter.c /usr/src/debug/bind/9.18.8-r0/lib/isc/task.c /usr/src/debug/bind/9.18.8-r0/lib/isc/fsaccess.c /usr/src/debug/bind/9.18.8-r0/lib/isc/time.c /usr/src/debug/bind/9.18.8-r0/lib/isc/stdio.c /usr/src/debug/bind/9.18.8-r0/lib/isc/netaddr.c /usr/src/debug/bind/9.18.8-r0/lib/isc/tls.c /usr/src/debug/bind/9.18.8-r0/lib/isc/url.c
 ", added "/usr/src/debug/bind/9.18.9-r0/lib/isc/sockaddr.c /usr/src/debug/bind/9.18.9-r0/lib/isc/meminfo.c /usr/src/debug/bind/9.18.9-r0/lib/isc/mem.c /usr/src/debug/bind/9.18.9-r0/lib/isc/trampoline_p.h /usr/src/debug/bind/9.18.9-r0/lib/isc/quota.c /usr/src/debug/bind/9.18.9-r0/lib/isc/picohttpparser.h /usr/src/debug/bind/9.18.9-r0/lib/isc/resource.c /usr/src/debug/bind/9.18.9-r0/lib/isc/mem_p.h /usr/src/debug/bind/9.18.9-r0/lib/isc/aes.c /usr/src/debug/bind/9.18.9-r0/lib/isc/netaddr.c /usr/src/debug/bind/9.18.9-r0/lib/isc/utf8.c /usr/src/debug/bind/9.18.9-r0/lib/isc/pool.c /usr/src/debug/bind/9.18.9-r0/lib/isc/bind9.c /usr/src/debug/bind/9.18.9-r0/lib/isc/dir.c /usr/src/debug/bind/9.18.9-r0/lib/isc/stdtime.c /usr/src/debug/bind/9.18.9-r0/lib/isc/region.c /usr/src/debug/bind/9.18.9-r0/lib/isc/condition.c /usr/src/debug/bind/9.18.9-r0/lib/isc/syslog.c /usr/src/debug/bind/9.18.9-r0/lib/isc/os.c /usr/src/debug/bind/9.18.9-r0/lib/isc/log.c /usr/src/debug/bind/9.18.9-r0/lib/isc/glob.c /
 usr/src/debug/bind/9.18.9-r0/lib/isc/serial.c /usr/src/debug/bind/9.18.9-r0/lib/isc/safe.c /usr/src/debug/bind/9.18.9-r0/lib/isc/fsaccess_common_p.h /usr/src/debug/bind/9.18.9-r0/lib/isc/file.c /usr/src/debug/bind/9.18.9-r0/lib/isc/parseint.c /usr/src/debug/bind/9.18.9-r0/lib/isc/nonce.c /usr/src/debug/bind/9.18.9-r0/lib/isc/crc64.c /usr/src/debug/bind/9.18.9-r0/lib/isc/mutexblock.c /usr/src/debug/bind/9.18.9-r0/lib/isc/string.c /usr/src/debug/bind/9.18.9-r0/lib/isc/siphash.c /usr/src/debug/bind/9.18.9-r0/lib/isc/event.c /usr/src/debug/bind/9.18.9-r0/lib/isc/time.c /usr/src/debug/bind/9.18.9-r0/lib/isc/taskpool.c /usr/src/debug/bind/9.18.9-r0/lib/isc/commandline.c /usr/src/debug/bind/9.18.9-r0/lib/isc/trampoline.c /usr/src/debug/bind/9.18.9-r0/lib/isc/os_p.h /usr/src/debug/bind/9.18.9-r0/lib/isc/url.c /usr/src/debug/bind/9.18.9-r0/lib/isc/random.c /usr/src/debug/bind/9.18.9-r0/lib/isc/regex.c /usr/src/debug/bind/9.18.9-r0/lib/isc/result.c /usr/src/debug/bind/9.18.9-r0/lib/isc/heap.c
  /usr/src/debug/bind/9.18.9-r0/lib/isc/tls_p.h /usr/src/debug/bind/9.18.9-r0/lib/isc/errno.c /usr/src/debug/bind/9.18.9-r0/lib/isc/mutex.c /usr/src/debug/bind/9.18.9-r0/lib/isc/tls.c /usr/src/debug/bind/9.18.9-r0/lib/isc/lex.c /usr/src/debug/bind/9.18.9-r0/lib/isc/assertions.c /usr/src/debug/bind/9.18.9-r0/lib/isc/task_p.h /usr/src/debug/bind/9.18.9-r0/lib/isc/app.c /usr/src/debug/bind/9.18.9-r0/lib/isc/fsaccess.c /usr/src/debug/bind/9.18.9-r0/lib/isc/entropy.c /usr/src/debug/bind/9.18.9-r0/lib/isc/ratelimiter.c /usr/src/debug/bind/9.18.9-r0/lib/isc/picohttpparser.c /usr/src/debug/bind/9.18.9-r0/lib/isc/errno2result.c /usr/src/debug/bind/9.18.9-r0/lib/isc/errno2result.h /usr/src/debug/bind/9.18.9-r0/lib/isc/managers.c /usr/src/debug/bind/9.18.9-r0/lib/isc/portset.c /usr/src/debug/bind/9.18.9-r0/lib/isc/httpd.c /usr/src/debug/bind/9.18.9-r0/lib/isc/rwlock.c /usr/src/debug/bind/9.18.9-r0/lib/isc/lib.c /usr/src/debug/bind/9.18.9-r0/lib/isc/stdio.c /usr/src/debug/bind/9.18.9-r0/lib/isc/
 hmac.c /usr/src/debug/bind/9.18.9-r0/lib/isc/jemalloc_shim.h /usr/src/debug/bind/9.18.9-r0/lib/isc/timer.c /usr/src/debug/bind/9.18.9-r0/lib/isc/backtrace.c /usr/src/debug/bind/9.18.9-r0/lib/isc/hash.c /usr/src/debug/bind/9.18.9-r0/lib/isc/fsaccess_common.c /usr/src/debug/bind/9.18.9-r0/lib/isc/symtab.c /usr/src/debug/bind/9.18.9-r0/lib/isc/netmgr_p.h /usr/src/debug/bind/9.18.9-r0/lib/isc/interfaceiter.c /usr/src/debug/bind/9.18.9-r0/lib/isc/thread.c /usr/src/debug/bind/9.18.9-r0/lib/isc/net.c /usr/src/debug/bind/9.18.9-r0/lib/isc/hex.c /usr/src/debug/bind/9.18.9-r0/lib/isc/entropy_private.h /usr/src/debug/bind/9.18.9-r0/lib/isc/radix.c /usr/src/debug/bind/9.18.9-r0/lib/isc/netscope.c /usr/src/debug/bind/9.18.9-r0/lib/isc/astack.c /usr/src/debug/bind/9.18.9-r0/lib/isc/base32.c /usr/src/debug/bind/9.18.9-r0/lib/isc/task.c /usr/src/debug/bind/9.18.9-r0/lib/isc/tm.c /usr/src/debug/bind/9.18.9-r0/lib/isc/error.c /usr/src/debug/bind/9.18.9-r0/lib/isc/base64.c /usr/src/debug/bind/9.18.9-r
 0/lib/isc/buffer.c /usr/src/debug/bind/9.18.9-r0/lib/isc/iterated_hash.c /usr/src/debug/bind/9.18.9-r0/lib/isc/md.c /usr/src/debug/bind/9.18.9-r0/lib/isc/counter.c /usr/src/debug/bind/9.18.9-r0/lib/isc/stats.c /usr/src/debug/bind/9.18.9-r0/lib/isc/ht.c /usr/src/debug/bind/9.18.9-r0/lib/isc/timer_p.h"
packages/core2-32-poky-linux/bind/bind-src: PKGV changed from 9.18.8 [default] to 9.18.9 [default]
packages/core2-32-poky-linux/bind/bind-staticdev: PV changed from "9.18.8" to "9.18.9"
packages/core2-32-poky-linux/bind/bind-staticdev: PKGV changed from 9.18.8 [default] to 9.18.9 [default]
packages/core2-32-poky-linux/bind/bind-utils: PKGSIZE changed from 491624 to 495720 (+1%)
packages/core2-32-poky-linux/bind/bind-utils: PV changed from "9.18.8" to "9.18.9"
packages/core2-32-poky-linux/bind/bind-utils: PKGV changed from 9.18.8 [default] to 9.18.9 [default]
packages/core2-32-poky-linux/bind/bind: PKGSIZE changed from 1216452 to 1220548 (+0%)
packages/core2-32-poky-linux/bind/bind: PV changed from "9.18.8" to "9.18.9"
packages/core2-32-poky-linux/bind/bind: PKGV changed from 9.18.8 [default] to 9.18.9 [default]
packages/core2-32-poky-linux/bind: PV changed from "9.18.8" to "9.18.9"
packages/core2-32-poky-linux/bind: PKGV changed from 9.18.8 [default] to 9.18.9 [default]
packages/core2-32-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.18.8/bind-9.18.8.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.18.9/bind-9.18.9.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
Changes to packages/core2-32-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.8.so to libbind9-9.18.9.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.8.so to libdns-9.18.9.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.8.so to libirs-9.18.9.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.8.so to libisccc-9.18.9.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.8.so to libisccfg-9.18.9.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.8.so to libisc-9.18.9.so
  /usr/lib/libns.so changed symlink target from libns-9.18.8.so to libns-9.18.9.so
  /usr/lib/libbind9-9.18.8.so moved to /usr/lib/libbind9-9.18.9.so
  /usr/lib/libdns-9.18.8.so moved to /usr/lib/libdns-9.18.9.so
  /usr/lib/libirs-9.18.8.so moved to /usr/lib/libirs-9.18.9.so
  /usr/lib/libisc-9.18.8.so moved to /usr/lib/libisc-9.18.9.so
  /usr/lib/libisccc-9.18.8.so moved to /usr/lib/libisccc-9.18.9.so
  /usr/lib/libisccfg-9.18.8.so moved to /usr/lib/libisccfg-9.18.9.so
  /usr/lib/libns-9.18.8.so moved to /usr/lib/libns-9.18.9.so

--===============5925238546835188968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccfg-9.18.8.so /usr/lib/libisc-9.18.8.so /usr/lib/libisccc-9.18.8.so /usr/lib/libns-9.18.8.so /usr/lib/libdns-9.18.8.so /usr/lib/libirs-9.18.8.so /usr/lib/libbind9-9.18.8.so", added "/usr/lib/libdns-9.18.9.so /usr/lib/libisccc-9.18.9.so /usr/lib/libirs-9.18.9.so /usr/lib/libns-9.18.9.so /usr/lib/libisccfg-9.18.9.so /usr/lib/libisc-9.18.9.so /usr/lib/libbind9-9.18.9.so"
Changes to packages/core2-32-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.8.so to libbind9-9.18.9.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.8.so to libdns-9.18.9.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.8.so to libirs-9.18.9.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.8.so to libisccc-9.18.9.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.8.so to libisccfg-9.18.9.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.8.so to libisc-9.18.9.so
  /usr/lib/libns.so changed symlink target from libns-9.18.8.so to libns-9.18.9.so
  /usr/lib/libbind9-9.18.8.so moved to /usr/lib/libbind9-9.18.9.so
  /usr/lib/libdns-9.18.8.so moved to /usr/lib/libdns-9.18.9.so
  /usr/lib/libirs-9.18.8.so moved to /usr/lib/libirs-9.18.9.so
  /usr/lib/libisc-9.18.8.so moved to /usr/lib/libisc-9.18.9.so
  /usr/lib/libisccc-9.18.8.so moved to /usr/lib/libisccc-9.18.9.so
  /usr/lib/libisccfg-9.18.8.so moved to /usr/lib/libisccfg-9.18.9.so
  /usr/lib/libns-9.18.8.so moved to /usr/lib/libns-9.18.9.so

--===============5925238546835188968==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.18.8-9.18.9.patch"

RnJvbSAzZjEyMWRhN2FkODg5NmZlZWY3NDA5MTliYmI5NWIxZGYzYmNjZmMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAwNjoyODo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJp
bmQ6IHVwZ3JhZGUgOS4xOC44IC0+IDkuMTguOQoKLS0tCiAuLi4vMDAwMS1hdm9pZC1zdGFydC1m
YWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoICAgICAgICAgICAgICAgfCAwCiAuLi4vMDAwMS1u
YW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaCAgfCAw
CiAuLi4vYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lz
ci5wYXRjaCAgfCAwCiAuLi4vYmluZC97YmluZC05LjE4LjggPT4gYmluZC05LjE4Ljl9L2JpbmQ5
ICAgICAgICAgICAgICAgICAgICAgfCAwCiAuLi4vYmluZC97YmluZC05LjE4LjggPT4gYmluZC05
LjE4Ljl9L2NvbmYucGF0Y2ggICAgICAgICAgICAgICAgfCAwCiAuLi4vYmluZC97YmluZC05LjE4
LjggPT4gYmluZC05LjE4Ljl9L2dlbmVyYXRlLXJuZGMta2V5LnNoICAgICAgfCAwCiAuLi4vaW5p
dC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoICAgICAgICAgICAgICAg
fCAwCiAuLi4vbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2ggICAgICAgICAgICAg
ICAgICAgICAgICAgfCAwCiAuLi4vYmluZC97YmluZC05LjE4LjggPT4gYmluZC05LjE4Ljl9L25h
bWVkLnNlcnZpY2UgICAgICAgICAgICAgfCAwCiAuLi4vYmluZC97YmluZF85LjE4LjguYmIgPT4g
YmluZF85LjE4LjkuYmJ9ICAgICAgICAgICAgICAgICAgICAgfCAyICstCiAxMCBmaWxlcyBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmluZC97YmluZC05LjE4LjggPT4gYmluZC05LjE4Ljl9LzAwMDEtYXZvaWQt
c3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCAoMTAwJSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQve2JpbmQtOS4xOC44ID0+IGJpbmQtOS4xOC45fS8wMDAx
LW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoICgx
MDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC97YmluZC05LjE4Ljgg
PT4gYmluZC05LjE4Ljl9L2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNl
YXJjaGVzLXN5c3IucGF0Y2ggKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL3tiaW5kLTkuMTguOCA9PiBiaW5kLTkuMTguOX0vYmluZDkgKDEwMCUpCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kLTkuMTguOCA9PiBiaW5kLTkuMTgu
OX0vY29uZi5wYXRjaCAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQve2JpbmQtOS4xOC44ID0+IGJpbmQtOS4xOC45fS9nZW5lcmF0ZS1ybmRjLWtleS5zaCAoMTAw
JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQve2JpbmQtOS4xOC44ID0+
IGJpbmQtOS4xOC45fS9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0
Y2ggKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kLTku
MTguOCA9PiBiaW5kLTkuMTguOX0vbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2gg
KDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kLTkuMTgu
OCA9PiBiaW5kLTkuMTguOX0vbmFtZWQuc2VydmljZSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQve2JpbmRfOS4xOC44LmJiID0+IGJpbmRfOS4xOC45LmJifSAo
OTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTku
MTguOC8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjkvMDAwMS1hdm9pZC1zdGFydC1m
YWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjgvMDAwMS1hdm9p
ZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjkvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJl
LXdpdGgtYmluZC11c2VyLnBhdGNoCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JpbmQvYmluZC05LjE4LjgvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhp
ZGUtYnVpbGQtb3B0aW9ucy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kLTkuMTguOS8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1v
cHRpb25zLnBhdGNoCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjgvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQt
c3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC45LzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0
YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2gKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguOC9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9y
LWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmQtOS4xOC45L2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFk
ZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2gKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguOC9iaW5kLWVuc3VyZS1z
ZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjkvYmluZC1lbnN1cmUtc2Vh
cmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC44L2JpbmQ5IGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC45L2JpbmQ5CnNpbWlsYXJpdHkgaW5k
ZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05
LjE4LjgvYmluZDkKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5k
LTkuMTguOS9iaW5kOQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5k
L2JpbmQtOS4xOC44L2NvbmYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZC05LjE4LjkvY29uZi5wYXRjaApzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC44L2NvbmYucGF0Y2gKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguOS9jb25mLnBh
dGNoCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4
LjgvZ2VuZXJhdGUtcm5kYy1rZXkuc2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZC05LjE4LjkvZ2VuZXJhdGUtcm5kYy1rZXkuc2gKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguOC9nZW5l
cmF0ZS1ybmRjLWtleS5zaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5k
L2JpbmQtOS4xOC45L2dlbmVyYXRlLXJuZGMta2V5LnNoCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjgvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1y
ZWFkLW9ubHktcm9vdGZzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQtOS4xOC45L2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaApz
aW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmQtOS4xOC44L2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rm
cy5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4x
OC45L2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC44L21ha2UtZXRj
LWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
aW5kL2JpbmQtOS4xOC45L21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoCnNpbWls
YXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQvYmluZC05LjE4LjgvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2gKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguOS9tYWtlLWV0Yy1p
bml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9iaW5kL2JpbmQtOS4xOC44L25hbWVkLnNlcnZpY2UgYi9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjkvbmFtZWQuc2VydmljZQpzaW1pbGFyaXR5IGluZGV4
IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4x
OC44L25hbWVkLnNlcnZpY2UKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmlu
ZC9iaW5kLTkuMTguOS9uYW1lZC5zZXJ2aWNlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZF85LjE4LjguYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZF85LjE4LjkuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4xOC44LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjE4LjkuYmIKaW5kZXggNDkyNWMwOTJj
Ny4uMTYwOTg2ZWI1MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5k
L2JpbmRfOS4xOC44LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5k
XzkuMTguOS5iYgpAQCAtMjAsNyArMjAsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZnRwLmlzYy5v
cmcvaXNjL2JpbmQ5LyR7UFZ9LyR7QlBOfS0ke1BWfS50YXIueHogXAogICAgICAgICAgICBmaWxl
Oi8vMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoIFwKICAgICAg
ICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGUzYzNhYjkzNzhkYjg0YmEwZjM3MDcz
ZDY3YmExMjVhZTRmMmZmOGRhZjM2NmM5ZGIyODdlM2YxYjJjMzVmMCIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICI2YTk2NjU5OThkNTY4NjA0NDYwZGYwOTE4ZmM4Y2NmYWQ3ZDI5Mzg4ZDRkODQyNTYw
YzA1NmNjMjExY2JiMjQzIgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9mdHAuaXNj
Lm9yZy9pc2MvYmluZDkvIgogIyBmb2xsb3cgdGhlIEVTViB2ZXJzaW9ucyBkaXZpc2libGUgYnkg
MgotLSAKMi4zMS4xCgo=

--===============5925238546835188968==--

