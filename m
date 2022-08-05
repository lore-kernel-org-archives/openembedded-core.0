Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C15C25B08
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:27 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.4049.1659679406908229833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mruze7zs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101826c99f76e-81931884-8756-4405-b395-4c40f4e7954d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cBdFR7AmjYGL0lAhP0/yroaCM1LhZkcWz17rl61qP8o=;
	b=mruze7zs6KZKjrKh6kQjzlhqMkq82+VSsyCboFF3kGd0PEnR3TdAYT34bxyQQP4t
	AUoGRjH7CbOinYSyEFCiCnQkQX+r8dbVjlQc5dc2eCPtVuGcFiNHSvou3wC+NQ3lgt4
	BKmoent/BgkdtikUNQDs8EYJE+cFk/BXzWIfbTKc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cBdFR7AmjYGL0lAhP0/yroaCM1LhZkcWz17rl61qP8o=;
	b=Vi5uphu/KkJI6/J6BXYXU5zac4mcVRuDGw1koKNaj3mHvGWZlRV/9pni1M6rMERK
	ljVi/6keg/AVOyX8vcbJtRiFK+nf3k3Tj86wnDFGf+/G7jHAqlz3yALkbcdTs9mfPPV
	mDJ4sNFVWo7YUshtFXacrBo+U0ucqyIFVSz3evmY=
Content-Type: multipart/mixed; boundary="===============3521256736290229510=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.18.5 SUCCEEDED
Message-ID: 
 <010101826c99f76e-81931884-8756-4405-b395-4c40f4e7954d-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:26 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168881

--===============3521256736290229510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bind* to *9.18.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.18.4-9.18.5.patch
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
--===============3521256736290229510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/bind/bind-dev: FILELIST: added "/usr/include/isccfg/duration.h"
packages/core2-32-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisc-9.18.4.so /usr/lib/libirs-9.18.4.so /usr/lib/libns-9.18.4.so /usr/lib/libisccc-9.18.4.so /usr/lib/libisccfg-9.18.4.so /usr/lib/libbind9-9.18.4.so /usr/lib/libdns-9.18.4.so", added "/usr/lib/libns-9.18.5.so /usr/lib/libisc-9.18.5.so /usr/lib/libisccc-9.18.5.so /usr/lib/libdns-9.18.5.so /usr/lib/libirs-9.18.5.so /usr/lib/libisccfg-9.18.5.so /usr/lib/libbind9-9.18.5.so"
Changes to packages/core2-32-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.4.so to libbind9-9.18.5.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.4.so to libdns-9.18.5.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.4.so to libirs-9.18.5.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.4.so to libisccc-9.18.5.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.4.so to libisccfg-9.18.5.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.4.so to libisc-9.18.5.so
  /usr/lib/libns.so changed symlink target from libns-9.18.4.so to libns-9.18.5.so
  /usr/lib/libbind9-9.18.4.so moved to /usr/lib/libbind9-9.18.5.so
  /usr/lib/libdns-9.18.4.so moved to /usr/lib/libdns-9.18.5.so
  /usr/lib/libirs-9.18.4.so moved to /usr/lib/libirs-9.18.5.so
  /usr/lib/libisc-9.18.4.so moved to /usr/lib/libisc-9.18.5.so
  /usr/lib/libisccc-9.18.4.so moved to /usr/lib/libisccc-9.18.5.so
  /usr/lib/libisccfg-9.18.4.so moved to /usr/lib/libisccfg-9.18.5.so
  /usr/lib/libns-9.18.4.so moved to /usr/lib/libns-9.18.5.so
  /usr/include/isccfg/duration.h was added

--===============3521256736290229510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libbind9-9.18.4.so /usr/lib/.debug/libns-9.18.4.so /usr/lib/.debug/libirs-9.18.4.so /usr/lib/.debug/libisccc-9.18.4.so /usr/lib/.debug/libisccfg-9.18.4.so /usr/lib/.debug/libisc-9.18.4.so /usr/lib/.debug/libdns-9.18.4.so", added "/usr/lib/.debug/libbind9-9.18.5.so /usr/lib/.debug/libisccfg-9.18.5.so /usr/lib/.debug/libdns-9.18.5.so /usr/lib/.debug/libns-9.18.5.so /usr/lib/.debug/libisccc-9.18.5.so /usr/lib/.debug/libirs-9.18.5.so /usr/lib/.debug/libisc-9.18.5.so"
packages/core2-32-poky-linux/bind/bind-dbg: PV changed from "9.18.4" to "9.18.5"
packages/core2-32-poky-linux/bind/bind-dbg: PKGSIZE changed from 10723540 to 10751620 (+0%)
packages/core2-32-poky-linux/bind/bind-dbg: PKGV changed from 9.18.4 [default] to 9.18.5 [default]
packages/core2-32-poky-linux/bind/bind-dev: FILELIST: added "/usr/include/isccfg/duration.h"
packages/core2-32-poky-linux/bind/bind-dev: PV changed from "9.18.4" to "9.18.5"
packages/core2-32-poky-linux/bind/bind-dev: PKGSIZE changed from 1446948 to 1458352 (+1%)
packages/core2-32-poky-linux/bind/bind-dev: PKGV changed from 9.18.4 [default] to 9.18.5 [default]
packages/core2-32-poky-linux/bind/bind-doc: PV changed from "9.18.4" to "9.18.5"
packages/core2-32-poky-linux/bind/bind-doc: PKGSIZE changed from 311215 to 307842 (-1%)
packages/core2-32-poky-linux/bind/bind-doc: PKGV changed from 9.18.4 [default] to 9.18.5 [default]
packages/core2-32-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.18.4.so", added "/usr/lib/*-9.18.5.so"
packages/core2-32-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libirs-9.18.4.so /usr/lib/libisccc-9.18.4.so /usr/lib/libns-9.18.4.so /usr/lib/libdns-9.18.4.so /usr/lib/libbind9-9.18.4.so /usr/lib/libisc-9.18.4.so /usr/lib/libisccfg-9.18.4.so", added "/usr/lib/libisccc-9.18.5.so /usr/lib/libisc-9.18.5.so /usr/lib/libirs-9.18.5.so /usr/lib/libns-9.18.5.so /usr/lib/libbind9-9.18.5.so /usr/lib/libdns-9.18.5.so /usr/lib/libisccfg-9.18.5.so"
packages/core2-32-poky-linux/bind/bind-libs: PV changed from "9.18.4" to "9.18.5"
packages/core2-32-poky-linux/bind/bind-libs: PKGSIZE changed from 6348144 to 6368624 (+0%)
packages/core2-32-poky-linux/bind/bind-libs: PKGV changed from 9.18.4 [default] to 9.18.5 [default]
packages/core2-32-poky-linux/bind/bind-locale: PV changed from "9.18.4" to "9.18.5"
packages/core2-32-poky-linux/bind/bind-locale: PKGV changed from 9.18.4 [default] to 9.18.5 [default]
packages/core2-32-poky-linux/bind/bind-src: FILELIST: directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/bin/delv -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/bin/delv, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/bin/plugins -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/bin/plugins, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/bin/named -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/bin/named, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/bin/dig -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/bin/dig, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/dns/rdata/ch_3 -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/dns/rdata/hs_4, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/isc -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/isc, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/dns -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/dns, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9
 .18.4/lib/irs -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/irs, directory renamed /usr/src/debug/bind/9.18.4-r0/build/bin/named -> /usr/src/debug/bind/9.18.5-r0/build/bin/named, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/bin/named/include/named -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/bin/named/include/named, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/dns/rdata/in_1 -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/dns/rdata/in_1, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/bin/rndc -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/bin/rndc, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/irs/include/irs -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/irs/include/irs, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/dns/include/dns -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/dns/include/dns, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/bin/nsupdate -> /usr/src/debug/bind/9.18.
 5-r0/bind-9.18.5/bin/nsupdate, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/bin/confgen/include/confgen -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/bin/confgen/include/confgen, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/dns/include/dst -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/dns/include/dst, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/bin/check -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/bin/check, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/ns/include/ns -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/ns/include/ns, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/dns/rdata/any_255 -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/dns/rdata/any_255, directory renamed /usr/src/debug/bind/9.18.4-r0/build/lib/dns/include/dns -> /usr/src/debug/bind/9.18.5-r0/build/lib/dns/include/dns, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/bin/named/include/dlz -> /usr/src/debug/bind/9
 .18.5-r0/bind-9.18.5/bin/named/include/dlz, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/bind9/include/bind9 -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/bind9/include/bind9, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/bind9 -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/bind9, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/isc/netmgr -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/isc/netmgr, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/dns/rdata/hs_4 -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/dns/rdata/ch_3, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/isc/include/isc -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/isc/include/isc, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/isccc -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/isccc, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/dns/rdata/generic -> /usr/src/debug/bind/9.18.5-r0/bind-9
 .18.5/lib/dns/rdata/generic, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/bin/confgen -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/bin/confgen, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/bin/tools -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/bin/tools, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/isccc/include/isccc -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/isccc/include/isccc, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/bin/dnssec -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/bin/dnssec, directory renamed /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/ns -> /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/ns, removed "/usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/isccfg/kaspconf.c /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/isccfg/include/isccfg/aclconf.h /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/isccfg/include/isccfg/log.h /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/isccfg/dnsconf.c /usr/src/debug/bind/9.
 18.4-r0/bind-9.18.4/lib/isccfg/include/isccfg/kaspconf.h /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/isccfg/include/isccfg/cfg.h /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/isccfg/include/isccfg/grammar.h /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/isccfg/parser.c /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/isccfg/namedconf.c /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/isccfg/include/isccfg/namedconf.h /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/isccfg/aclconf.c /usr/src/debug/bind/9.18.4-r0/bind-9.18.4/lib/isccfg/log.c", added "/usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/isccfg/include/isccfg/aclconf.h /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/isccfg/kaspconf.c /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/isccfg/include/isccfg/log.h /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/isccfg/dnsconf.c /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/isccfg/namedconf.c /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/isccfg/log.c /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/i
 sccfg/parser.c /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/isccfg/include/isccfg/kaspconf.h /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/isccfg/include/isccfg/namedconf.h /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/isccfg/aclconf.c /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/isccfg/include/isccfg/grammar.h /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/isccfg/duration.c /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/isccfg/include/isccfg/cfg.h /usr/src/debug/bind/9.18.5-r0/bind-9.18.5/lib/isccfg/include/isccfg/duration.h"
packages/core2-32-poky-linux/bind/bind-src: PV changed from "9.18.4" to "9.18.5"
packages/core2-32-poky-linux/bind/bind-src: PKGSIZE changed from 9511072 to 9553199 (+0%)
packages/core2-32-poky-linux/bind/bind-src: PKGV changed from 9.18.4 [default] to 9.18.5 [default]
packages/core2-32-poky-linux/bind/bind-staticdev: PV changed from "9.18.4" to "9.18.5"
packages/core2-32-poky-linux/bind/bind-staticdev: PKGV changed from 9.18.4 [default] to 9.18.5 [default]
packages/core2-32-poky-linux/bind/bind-utils: PV changed from "9.18.4" to "9.18.5"
packages/core2-32-poky-linux/bind/bind-utils: PKGSIZE changed from 483432 to 487528 (+1%)
packages/core2-32-poky-linux/bind/bind-utils: PKGV changed from 9.18.4 [default] to 9.18.5 [default]
packages/core2-32-poky-linux/bind/bind: PV changed from "9.18.4" to "9.18.5"
packages/core2-32-poky-linux/bind/bind: PKGSIZE changed from 1207816 to 1212356 (+0%)
packages/core2-32-poky-linux/bind/bind: PKGV changed from 9.18.4 [default] to 9.18.5 [default]
packages/core2-32-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.18.4/bind-9.18.4.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.18.5/bind-9.18.5.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
packages/core2-32-poky-linux/bind: PV changed from "9.18.4" to "9.18.5"
packages/core2-32-poky-linux/bind: PKGV changed from 9.18.4 [default] to 9.18.5 [default]
Changes to packages/core2-32-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.4.so to libbind9-9.18.5.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.4.so to libdns-9.18.5.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.4.so to libirs-9.18.5.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.4.so to libisccc-9.18.5.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.4.so to libisccfg-9.18.5.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.4.so to libisc-9.18.5.so
  /usr/lib/libns.so changed symlink target from libns-9.18.4.so to libns-9.18.5.so
  /usr/lib/libbind9-9.18.4.so moved to /usr/lib/libbind9-9.18.5.so
  /usr/lib/libdns-9.18.4.so moved to /usr/lib/libdns-9.18.5.so
  /usr/lib/libirs-9.18.4.so moved to /usr/lib/libirs-9.18.5.so
  /usr/lib/libisc-9.18.4.so moved to /usr/lib/libisc-9.18.5.so
  /usr/lib/libisccc-9.18.4.so moved to /usr/lib/libisccc-9.18.5.so
  /usr/lib/libisccfg-9.18.4.so moved to /usr/lib/libisccfg-9.18.5.so
  /usr/lib/libns-9.18.4.so moved to /usr/lib/libns-9.18.5.so
  /usr/include/isccfg/duration.h was added

--===============3521256736290229510==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.18.4-9.18.5.patch"

RnJvbSBlYzQzOWIwZDA0YjEwZjBkMTBlZGJiMDZiNTNiYzQ2YjA2YmE5MjBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNCBBdWcgMjAyMiAxODozMjozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJp
bmQ6IHVwZ3JhZGUgOS4xOC40IC0+IDkuMTguNQoKLS0tCiAuLi4vMDAwMS1hdm9pZC1zdGFydC1m
YWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoICAgICAgICAgICAgICAgfCAwCiAuLi4vMDAwMS1u
YW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaCAgfCAw
CiAuLi4vYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lz
ci5wYXRjaCAgfCAwCiAuLi4vYmluZC97YmluZC05LjE4LjQgPT4gYmluZC05LjE4LjV9L2JpbmQ5
ICAgICAgICAgICAgICAgICAgICAgfCAwCiAuLi4vYmluZC97YmluZC05LjE4LjQgPT4gYmluZC05
LjE4LjV9L2NvbmYucGF0Y2ggICAgICAgICAgICAgICAgfCAwCiAuLi4vYmluZC97YmluZC05LjE4
LjQgPT4gYmluZC05LjE4LjV9L2dlbmVyYXRlLXJuZGMta2V5LnNoICAgICAgfCAwCiAuLi4vaW5p
dC5kLWFkZC1zdXBwb3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoICAgICAgICAgICAgICAg
fCAwCiAuLi4vbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2ggICAgICAgICAgICAg
ICAgICAgICAgICAgfCAwCiAuLi4vYmluZC97YmluZC05LjE4LjQgPT4gYmluZC05LjE4LjV9L25h
bWVkLnNlcnZpY2UgICAgICAgICAgICAgfCAwCiAuLi4vYmluZC97YmluZF85LjE4LjQuYmIgPT4g
YmluZF85LjE4LjUuYmJ9ICAgICAgICAgICAgICAgICAgICAgfCAyICstCiAxMCBmaWxlcyBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmluZC97YmluZC05LjE4LjQgPT4gYmluZC05LjE4LjV9LzAwMDEtYXZvaWQt
c3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaCAoMTAwJSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JpbmQve2JpbmQtOS4xOC40ID0+IGJpbmQtOS4xOC41fS8wMDAx
LW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoICgx
MDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC97YmluZC05LjE4LjQg
PT4gYmluZC05LjE4LjV9L2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNl
YXJjaGVzLXN5c3IucGF0Y2ggKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL3tiaW5kLTkuMTguNCA9PiBiaW5kLTkuMTguNX0vYmluZDkgKDEwMCUpCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kLTkuMTguNCA9PiBiaW5kLTkuMTgu
NX0vY29uZi5wYXRjaCAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQve2JpbmQtOS4xOC40ID0+IGJpbmQtOS4xOC41fS9nZW5lcmF0ZS1ybmRjLWtleS5zaCAoMTAw
JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQve2JpbmQtOS4xOC40ID0+
IGJpbmQtOS4xOC41fS9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0
Y2ggKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kLTku
MTguNCA9PiBiaW5kLTkuMTguNX0vbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2gg
KDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kLTkuMTgu
NCA9PiBiaW5kLTkuMTguNX0vbmFtZWQuc2VydmljZSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQve2JpbmRfOS4xOC40LmJiID0+IGJpbmRfOS4xOC41LmJifSAo
OTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTku
MTguNC8wMDAxLWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjUvMDAwMS1hdm9pZC1zdGFydC1m
YWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjQvMDAwMS1hdm9p
ZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjUvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJl
LXdpdGgtYmluZC11c2VyLnBhdGNoCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JpbmQvYmluZC05LjE4LjQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhp
ZGUtYnVpbGQtb3B0aW9ucy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9i
aW5kLTkuMTguNS8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1v
cHRpb25zLnBhdGNoCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQt
c3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC41LzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0
YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2gKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguNC9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9y
LWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmQtOS4xOC41L2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFk
ZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2gKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguNC9iaW5kLWVuc3VyZS1z
ZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjUvYmluZC1lbnN1cmUtc2Vh
cmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC40L2JpbmQ5IGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC41L2JpbmQ5CnNpbWlsYXJpdHkgaW5k
ZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05
LjE4LjQvYmluZDkKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5k
LTkuMTguNS9iaW5kOQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5k
L2JpbmQtOS4xOC40L2NvbmYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZC05LjE4LjUvY29uZi5wYXRjaApzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC40L2NvbmYucGF0Y2gKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguNS9jb25mLnBh
dGNoCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4
LjQvZ2VuZXJhdGUtcm5kYy1rZXkuc2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZC05LjE4LjUvZ2VuZXJhdGUtcm5kYy1rZXkuc2gKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguNC9nZW5l
cmF0ZS1ybmRjLWtleS5zaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5k
L2JpbmQtOS4xOC41L2dlbmVyYXRlLXJuZGMta2V5LnNoCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjQvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1y
ZWFkLW9ubHktcm9vdGZzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQtOS4xOC41L2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaApz
aW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9iaW5kL2JpbmQtOS4xOC40L2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rm
cy5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4x
OC41L2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xOC40L21ha2UtZXRj
LWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
aW5kL2JpbmQtOS4xOC41L21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoCnNpbWls
YXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQvYmluZC05LjE4LjQvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2gKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTguNS9tYWtlLWV0Yy1p
bml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9iaW5kL2JpbmQtOS4xOC40L25hbWVkLnNlcnZpY2UgYi9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZC05LjE4LjUvbmFtZWQuc2VydmljZQpzaW1pbGFyaXR5IGluZGV4
IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4x
OC40L25hbWVkLnNlcnZpY2UKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmlu
ZC9iaW5kLTkuMTguNS9uYW1lZC5zZXJ2aWNlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2JpbmQvYmluZF85LjE4LjQuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZF85LjE4LjUuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4xOC40LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjE4LjUuYmIKaW5kZXggOGM2MmZjNzcx
ZC4uNjA1OWNhNmEzMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5k
L2JpbmRfOS4xOC40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5k
XzkuMTguNS5iYgpAQCAtMjAsNyArMjAsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZnRwLmlzYy5v
cmcvaXNjL2JpbmQ5LyR7UFZ9LyR7QlBOfS0ke1BWfS50YXIueHogXAogICAgICAgICAgICBmaWxl
Oi8vMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoIFwKICAgICAg
ICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjI3N2FlNTAxNTlhMDBjMzAwZWI5MjZh
OWM1ZDUxOTUzMDM4YTkzNmJkODI0MmQ2OTEzZGZiNmVhYzQyNzYxZCIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICIwY2VlMDc4ZDc0ZjBiZGM0ZWMzNzQ0MzUwMjZiMjVkZTc4OTJmMjY1NDBhMThiMjJh
MDJlZjcyOGExMWRjYWU3IgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9mdHAuaXNj
Lm9yZy9pc2MvYmluZDkvIgogIyBmb2xsb3cgdGhlIEVTViB2ZXJzaW9ucyBkaXZpc2libGUgYnkg
MgotLSAKMi4zMS4xCgo=

--===============3521256736290229510==--

