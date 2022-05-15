Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C251AC47092
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web09.19058.1652634915039028854
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JV6vEhmn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010180c8b78d8b-ce8b0062-36cb-4fdc-8c81-090d84759152-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pSx26IfK4sbpDTnUZubTuwBHwFntPjvx3/SCvUWjEQ8=;
	b=JV6vEhmniEvOgtxbwp/ScVWQbpa43i/CTL8qOEwuxwXtWQK0jtRlBjZTHkxpdbdd
	152Kq+0qzsppmFku43orHn3FTwK/4uSy0qzj0dMstxbG6jIEmtYbFiFJkEjBtokCqLB
	FfUF/nWv5Mp4AWtnqq66ewnWHlRjs8t8lk/OqfTw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pSx26IfK4sbpDTnUZubTuwBHwFntPjvx3/SCvUWjEQ8=;
	b=QflZIG1IAEJtah85UjeT8QIXfn9gxDgk/MhycMDGh8VGzGa2jUUcyiptybT7SANi
	YBNBe3RWgNhpVl/Cr4+UJ2kX0zVgzmjqP2lAomXKLmoAmhjsiOpZsZTQrvXNyg5ZVUP
	hviXaY6Rpj5RLY+EDr8drL+t8Nq5k0cJh4VGzHgI=
Content-Type: multipart/mixed; boundary="===============1159442796547457862=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0: upgrading to 1.20.2 SUCCEEDED
Message-ID: 
 <01010180c8b78d8b-ce8b0062-36cb-4fdc-8c81-090d84759152-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:14 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165653

--===============1159442796547457862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0* to *1.20.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-upgrade-1.20.1-1.20.2.patch
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
--===============1159442796547457862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-dbg: FILELIST: removed "/usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2001.0-gdb.py /usr/lib/.debug/libgstbase-1.0.so.0.2001.0 /usr/lib/.debug/libgstreamer-1.0.so.0.2001.0 /usr/lib/.debug/libgstcontroller-1.0.so.0.2001.0 /usr/lib/.debug/libgstnet-1.0.so.0.2001.0 /usr/lib/.debug/libgstcheck-1.0.so.0.2001.0", added "/usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2002.0-gdb.py /usr/lib/.debug/libgstcheck-1.0.so.0.2002.0 /usr/lib/.debug/libgstnet-1.0.so.0.2002.0 /usr/lib/.debug/libgstreamer-1.0.so.0.2002.0 /usr/lib/.debug/libgstcontroller-1.0.so.0.2002.0 /usr/lib/.debug/libgstbase-1.0.so.0.2002.0"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGSIZE changed from 11753450 to 11753946 (+0%)
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-dev: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-doc: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-doc: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-src: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGSIZE changed from 9271468 to 9273564 (+0%)
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstbase-1.0.so.0.2001.0 /usr/lib/libgstnet-1.0.so.0.2001.0 /usr/lib/libgstcheck-1.0.so.0.2001.0 /usr/lib/libgstcontroller-1.0.so.0.2001.0 /usr/lib/libgstreamer-1.0.so.0.2001.0", added "/usr/lib/libgstcontroller-1.0.so.0.2002.0 /usr/lib/libgstreamer-1.0.so.0.2002.0 /usr/lib/libgstbase-1.0.so.0.2002.0 /usr/lib/libgstcheck-1.0.so.0.2002.0 /usr/lib/libgstnet-1.0.so.0.2002.0"
packages/core2-32-poky-linux/gstreamer1.0: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.20.1.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch;striplevel=3 file://0002-tests-add-support-for-install-the-tests.patch;striplevel=3 file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 file://0005-tests-remove-gstbin-test_watch_for_state_change-test.patch" to "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.20.2.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch;striplevel=3 file://0002-tests-add-support-for-install-the-tests.patch;striplevel=3 file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 file://0005-tests-remove-gstbin-test_watch_for_state_change-test.patch"
Changes to packages/core2-32-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.2001.0 to libgstbase-1.0.so.0.2002.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.2001.0 to libgstcheck-1.0.so.0.2002.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.2001.0 to libgstcontroller-1.0.so.0.2002.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.2001.0 to libgstnet-1.0.so.0.2002.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.2001.0 to libgstreamer-1.0.so.0.2002.0
  /usr/lib/libgstbase-1.0.so.0.2001.0 moved to /usr/lib/libgstbase-1.0.so.0.2002.0
  /usr/lib/libgstcheck-1.0.so.0.2001.0 moved to /usr/lib/libgstcheck-1.0.so.0.2002.0
  /usr/lib/libgstcontroller-1.0.so.0.2001.0 moved to /usr/lib/libgstcontroller-1.0.so.0.2002.0
  /usr/lib/libgstnet-1.0.so.0.2001.0 moved to /usr/lib/libgstnet-1.0.so.0.2002.0
  /usr/lib/libgstreamer-1.0.so.0.2001.0 moved to /usr/lib/libgstreamer-1.0.so.0.2002.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2001.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2002.0-gdb.py
Changes to packages/x86_64-linux/gcc-cross-i686 (sysroot):
  /sysroot-providers/virtual_i686-poky-linux-g++ was added
  /sysroot-providers/virtual_i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux was added
  /usr/bin/i686-poky-linux/i686-poky-linux-c++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-cpp was added
  /usr/bin/i686-poky-linux/i686-poky-linux-g++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-12.1.0 was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ar was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-nm was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ranlib was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-dump was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-tool was added
  /usr/bin/i686-poky-linux/i686-poky-linux-lto-dump was added
  /usr/libexec/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/cc1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/cc1plus was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/collect2 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/g++-mapper-server was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-strip was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/fixincl was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/fixinc.sh was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/mkheaders was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/mkinstalldirs was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcp1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcp1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcp1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/liblto_plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/lto1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/lto-wrapper was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/gengtype was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/strip was added
  /usr/lib/i686-poky-linux was added
  /usr/lib/i686-poky-linux/bfd-plugins was added
  /usr/lib/i686-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/i686-poky-linux/gcc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/adxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/ammintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/amxbf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/amxint8intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/amxtileintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx5124fmapsintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx5124vnniwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512bf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512bf16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512bitalgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512bwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512cdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512dqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512erintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512fintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512fp16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512fp16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512ifmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512ifmavlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512pfintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vbmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vbmi2vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vbmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vbmivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vlbwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vldqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vnnivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vp2intersectintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vpopcntdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avxvnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/bmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/bmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/bmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/cet.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/cetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/cldemoteintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/clflushoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/clwbintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/clzerointrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/cpuid.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/cross-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/emmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/enqcmdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/f16cintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include-fixed was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include-fixed/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include-fixed/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include-fixed/syslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/float.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/fma4intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/fmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/fxsrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/gfniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/hresetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/ia32intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/immintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/iso646.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/keylockerintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/lwpintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/lzcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/mm3dnow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/mmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/mm_malloc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/movdirintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/mwaitintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/mwaitxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/nmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/pconfigintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/pkuintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/pmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/popcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/prfchwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/quadmath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/quadmath_weak.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/rdseedintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/rtmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/serializeintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/sgxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/shaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/smmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdalign.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdatomic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdbool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stddef.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdfix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdint-gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdnoreturn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/tbmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/tmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/tsxldtrkintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/uintrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/unwind.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/vaesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/varargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/vpclmulqdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/waitpkgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/wbnoinvdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/wmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/x86gprintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/x86intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xopintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xsavecintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xsaveintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xsaveoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xsavesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xtestintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/fixinc_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/include/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/include/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/macro_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/mkheaders.conf was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/gtype.state was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ada was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ada/gcc-interface was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/addresses.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/align.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/alloc-pool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/all-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ansidecl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/array-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/asan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/attr-fnspec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/attribs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/auto-host.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/auto-profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/backend.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/basic-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/bb-reorder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/b-header-vars was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/bitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/builtin-attrs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/builtins.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/builtin-types.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/bversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/calls.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ccmp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family/c-common.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family/c-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family/c-objc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family/c-pragma.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfganal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgbuild.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgexpand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfg-flags.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfghooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgloopmanip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cgraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cif-code.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/collect2-aix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/collect2.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/collect-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/color-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/common was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/common/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/common/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/conditions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/configargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/dbxelf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/elfos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/glibc-stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/gnu-user.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/att.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/i386.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/i386-isa.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/linux64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/linux-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/stringop.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/unix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/x86-64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/initfini-array.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/linux-android.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/linux-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/convert.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/coretypes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/coroutine-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/coverage.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/cp-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/cp-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/name-lookup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/operators.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cppbuiltin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cppdefault.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cpplib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/type-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cselib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ctfc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/d was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/data-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dbgcnt.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dbgcnt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dbxout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ddg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/d/d-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/debug.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/defaults.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/df.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dfp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-color.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-event-id.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-metadata.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-spec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-url.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/digraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dojump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dominance.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/domwalk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/double-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dump-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dumpfile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dwarf2asm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dwarf2ctf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dwarf2out.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/edit-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/emit-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/errors.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/escaped_string.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/et-forest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/except.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/explow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/expmed.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/fibonacci_heap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/file-find.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/filenames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/file-prefix-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/fixed-value.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/flag-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/fold-const-call.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/fold-const.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/function-abi.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcc-plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcc-rich-location.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcc-symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcov-counter.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcov-io.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcse-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/generic-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gengtype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/genrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gensupport.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ggc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ggc-internal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-array-bounds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-predicate-analysis.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-cache.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-edge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-gori.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-trace.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-ssa-evrp-analyze.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-ssa-warn-access.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-walk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimplify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimplify-me.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/glimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gomp-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/graphds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/graph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/graphite.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/graphviz.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gsstruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gstab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gsyms.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gtm-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gtype-desc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hard-reg-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hash-map-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hash-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hashtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hash-table.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/highlev-plugin-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hosthooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hosthooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hw-doloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hwint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ifcvt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/inchash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/incpath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/input.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-addr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-attr-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-attr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-codes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-modes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-modes-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/internal-fn.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/internal-fn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/intl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/int-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-fnsummary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-icf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-modref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-modref-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-predicate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-prop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-reference.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ira.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ira-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/is-a.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/iterator-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/langhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/langhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lcm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/libiberty.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/limitx.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/limity.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/line-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/loop-unroll.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lower-subreg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lra-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lto-compress.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lto-section-names.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lto-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/machmode.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/machmode.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/md5.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/memmodel.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/memory-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/mem-stats.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/mem-stats-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/mode-classes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/mux-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/objc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/objc/objc-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/obstack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/obstack-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-expand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-general.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-offload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-simd-clone.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optabs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optabs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optabs-libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optabs-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optabs-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optinfo-emit-json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/options.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/opt-problem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/opts-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/opt-suggestions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ordered-hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/output.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/passes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/pass-instances.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/pass_manager.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/plugin-api.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/plugin.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/plugin-version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/pointer-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/poly-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/poly-int-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/predict.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/prefix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/print-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/print-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/profile-count.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/range-op.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/read-md.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/read-rtl-function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/real.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/realmpfr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/recog.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/regcprop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/reg-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/regrename.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/regset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/regs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/reload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/resource.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtlanal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtl.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtl-error.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtlhash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtlhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtl-iter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtl-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtx-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/run-rtl-passes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/safe-ctype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sanitizer.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sbitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sched-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/selftest-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/selftest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/selftest-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sel-sched-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sel-sched.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sel-sched-ir.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sese.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/shortest-paths.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/shrink-wrap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/signop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sparseset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/spellcheck.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/spellcheck-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/splay-tree-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sreal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ssa-iterators.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/stab.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/statistics.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/stmt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/stor-layout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/streamer-hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/stringpool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/substring-locations.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/symbol-summary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/symtab-clones.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/symtab-thunks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sync-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/system.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target-globals.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target-hooks-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target-insns.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/targhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/timevar.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/timevar.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tm_p.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tm-preds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/toplev.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tracer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/trans-mem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-affine.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-check.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-chrec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-data-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-dfa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-eh.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-hasher.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-if-conv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-into-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-nested.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-object-size.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-outof-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-parloops.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-pass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-phinodes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-sra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-address.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-dom.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-dse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-live.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-loop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssanames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-operands.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-ter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/treestruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-switch-conversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-vectorizer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-vrp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tristate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tsystem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/typeclass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/typed-splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ubsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/valtrack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-pointer-equiv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-prof.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-range-equiv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-relation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/varasm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vec-perm-indices.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vmsdbg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vr-values.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vtable-verify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/wide-int-bitmask.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/wide-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/wide-int-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/xcoff.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/xcoffout.h was added
  /sysroot-providers/virtual_i686-poky-linux-musl-g++ was removed
  /sysroot-providers/virtual_i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-c++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-cpp was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-g++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-12.1.0 was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ar was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-nm was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ranlib was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-dump was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-tool was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-lto-dump was removed
  /usr/libexec/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/cc1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/cc1plus was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/collect2 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/g++-mapper-server was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-strip was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/fixincl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/fixinc.sh was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/mkheaders was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/mkinstalldirs was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcp1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcp1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/liblto_plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/lto1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/lto-wrapper was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/gengtype was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/strip was removed
  /usr/lib/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/i686-poky-linux-musl/gcc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/adxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/ammintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/amxbf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/amxint8intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/amxtileintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx5124fmapsintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx5124vnniwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512bf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512bf16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512bitalgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512bwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512cdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512dqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512erintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512fintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512fp16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512fp16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512ifmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512ifmavlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512pfintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vbmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vbmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vbmivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vlbwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vldqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vnnivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vp2intersectintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avxvnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/bmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/bmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/bmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/cet.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/cetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/cldemoteintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/clflushoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/clwbintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/clzerointrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/cpuid.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/cross-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/emmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/enqcmdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/f16cintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include-fixed was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include-fixed/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include-fixed/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include-fixed/syslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/float.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/fma4intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/fmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/fxsrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/gfniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/hresetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/ia32intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/immintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/iso646.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/keylockerintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/lwpintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/lzcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/mm3dnow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/mmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/mm_malloc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/movdirintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/mwaitintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/mwaitxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/nmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/pconfigintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/pkuintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/pmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/popcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/prfchwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/quadmath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/quadmath_weak.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/rdseedintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/rtmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/serializeintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/sgxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/shaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/smmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdalign.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdatomic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdbool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stddef.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdfix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdint-gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdnoreturn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/tbmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/tmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/tsxldtrkintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/uintrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/unwind.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/vaesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/varargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/vpclmulqdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/waitpkgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/wbnoinvdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/wmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/x86gprintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/x86intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xopintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xsavecintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xsaveintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xsaveoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xsavesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xtestintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/fixinc_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/include/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/include/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/macro_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/mkheaders.conf was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/gtype.state was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ada was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ada/gcc-interface was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/addresses.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/align.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/alloc-pool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/all-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ansidecl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/array-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/asan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/attr-fnspec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/attribs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/auto-host.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/auto-profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/backend.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/basic-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/bb-reorder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/b-header-vars was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/bitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/builtin-attrs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/builtins.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/builtin-types.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/bversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/calls.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ccmp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family/c-common.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family/c-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family/c-objc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfganal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgbuild.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgexpand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfg-flags.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfghooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgloopmanip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cgraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cif-code.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/collect2-aix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/collect2.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/collect-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/color-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/common was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/common/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/common/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/conditions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/configargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/dbxelf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/elfos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/gnu-user.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/att.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/i386.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/i386-isa.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/linux64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/stringop.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/unix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/initfini-array.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/linux-android.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/linux-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/convert.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/coretypes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/coroutine-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/coverage.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/cp-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/cp-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/name-lookup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/operators.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cppbuiltin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cppdefault.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cpplib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/type-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cselib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ctfc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/d was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/data-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dbgcnt.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dbgcnt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dbxout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ddg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/d/d-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/debug.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/defaults.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/df.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dfp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-color.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-spec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-url.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/digraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dojump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dominance.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/domwalk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/double-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dump-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dumpfile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dwarf2asm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dwarf2ctf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dwarf2out.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/edit-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/emit-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/errors.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/escaped_string.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/et-forest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/except.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/explow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/expmed.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/fibonacci_heap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/file-find.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/filenames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/file-prefix-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/fixed-value.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/flag-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/fold-const-call.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/fold-const.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/function-abi.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcc-plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcc-rich-location.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcc-symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcov-counter.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcov-io.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcse-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/generic-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gengtype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/genrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gensupport.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ggc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ggc-internal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-predicate-analysis.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-cache.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-edge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-gori.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-trace.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-ssa-evrp-analyze.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-ssa-warn-access.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-walk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimplify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimplify-me.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/glimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gomp-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/graphds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/graph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/graphite.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/graphviz.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gsstruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gstab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gsyms.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gtm-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gtype-desc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hard-reg-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hash-map-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hash-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hashtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hash-table.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hosthooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hosthooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hw-doloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hwint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ifcvt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/inchash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/incpath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/input.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-addr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-attr-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-attr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-codes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-modes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-modes-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/internal-fn.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/internal-fn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/intl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/int-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-icf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-modref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-predicate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-prop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-reference.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ira.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ira-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/is-a.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/iterator-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/langhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/langhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lcm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/libiberty.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/limitx.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/limity.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/line-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/loop-unroll.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lower-subreg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lra-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lto-compress.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lto-section-names.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lto-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/machmode.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/machmode.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/md5.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/memmodel.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/memory-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/mem-stats.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/mem-stats-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/mode-classes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/mux-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/objc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/objc/objc-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/obstack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/obstack-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-expand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-general.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-offload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-simd-clone.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optabs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optabs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optabs-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optabs-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/options.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/opt-problem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/opts-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/opt-suggestions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ordered-hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/output.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/passes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/pass-instances.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/pass_manager.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/plugin-api.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/plugin.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/plugin-version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/pointer-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/poly-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/poly-int-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/predict.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/prefix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/print-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/print-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/profile-count.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/range-op.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/read-md.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/read-rtl-function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/real.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/realmpfr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/recog.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/regcprop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/reg-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/regrename.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/regset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/regs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/reload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/resource.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtlanal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtl.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtl-error.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtlhash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtlhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtl-iter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtl-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/run-rtl-passes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/safe-ctype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sanitizer.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sbitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sched-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/selftest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/selftest-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sel-sched-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sel-sched.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sel-sched-ir.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sese.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/shortest-paths.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/shrink-wrap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/signop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sparseset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/spellcheck.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/spellcheck-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/splay-tree-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sreal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ssa-iterators.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/stab.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/statistics.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/stmt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/stor-layout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/streamer-hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/stringpool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/substring-locations.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/symbol-summary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/symtab-clones.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/symtab-thunks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sync-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/system.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target-globals.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target-hooks-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target-insns.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/targhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/timevar.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/timevar.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tm_p.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tm-preds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/toplev.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tracer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/trans-mem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-affine.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-check.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-chrec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-data-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-dfa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-eh.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-hasher.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-if-conv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-into-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-nested.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-object-size.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-parloops.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-pass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-phinodes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-sra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-address.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-live.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssanames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/treestruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-vectorizer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-vrp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tristate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tsystem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/typeclass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/typed-splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ubsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/valtrack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-pointer-equiv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-prof.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-range-equiv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-relation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/varasm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vec-perm-indices.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vmsdbg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vr-values.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vtable-verify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/wide-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/wide-int-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/xcoff.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/xcoffout.h was removed

--===============1159442796547457862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 70 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-62702a1b1d86b858400e5a7428f7529cf08699a9"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:62702a1b1d86b858400e5a7428f7529cf08699a9"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 18 Local 7 Mirrors 0 Missed 11 Current 402 (38% match, 97% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 406 of 420 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata_setscene)
NOTE: Running task 1097 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_fetch)
NOTE: Running task 1179 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_write_config)
NOTE: Running task 1389 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe psmisc-23.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 1493 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_unpack)
NOTE: Running task 1494 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/psmisc/23.4-r0/temp/log.do_packagedata_setscene.1196080
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 419 of 420 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_package_setscene)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 1495 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_patch)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_patch: Succeeded
NOTE: Running task 1496 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1497 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe psmisc-23.4-r0: task do_package_setscene: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_populate_lic unihash changed to bdaba4e28a61850149ca33f9ff3df635dbe3bc95125ea678c2b4e1d4a71e946f
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1498 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_configure)
NOTE: recipe psmisc-23.4-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1508 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata)
NOTE: Running task 1509 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1510 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_configure: Started
NOTE: recipe psmisc-23.4-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to a4787267b87206a3556ff21db492c8420179d3f57dc576d54ca82181b3451039
NOTE: recipe psmisc-23.4-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1521 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 28be58ea1d4240f61f1260f01f80546cbd160e229b27b92a1e15091dc485182c
NOTE: Running task 1526 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_configure: Succeeded
NOTE: Running task 1527 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1528 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_compile: Succeeded
NOTE: Running task 1529 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1530 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_install: Succeeded
NOTE: Running task 1531 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1532 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_package)
NOTE: Running task 1533 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package: Succeeded
NOTE: Running task 1534 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1535 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_package_write_rpm)
NOTE: Running task 1536 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_package_qa)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1537 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1537 tasks of which 1512 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 43 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-src went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-dbg went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package fuser went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package fuser-doc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package killall went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package killall-doc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package pstree went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package pstree-doc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-staticdev went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-dev went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-doc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-extras went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-bg went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ca went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-cs went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-da went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-de went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-el went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-eo went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-es went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-eu went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-fi went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-fr went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-hr went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-hu went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-id went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-it went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ja went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-nb went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-nl went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-pl went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-pt went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-pt-br went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ro went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ru went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-sr went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-sv went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-uk went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-vi went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-zh-cn went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-zh-tw went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1159442796547457862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstreamer-1.0.so.0.2001.0 /usr/lib/libgstnet-1.0.so.0.2001.0 /usr/lib/libgstcheck-1.0.so.0.2001.0 /usr/lib/libgstcontroller-1.0.so.0.2001.0 /usr/lib/libgstbase-1.0.so.0.2001.0", added "/usr/lib/libgstreamer-1.0.so.0.2002.0 /usr/lib/libgstnet-1.0.so.0.2002.0 /usr/lib/libgstcontroller-1.0.so.0.2002.0 /usr/lib/libgstcheck-1.0.so.0.2002.0 /usr/lib/libgstbase-1.0.so.0.2002.0"
Changes to packages/core2-32-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.2001.0 to libgstbase-1.0.so.0.2002.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.2001.0 to libgstcheck-1.0.so.0.2002.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.2001.0 to libgstcontroller-1.0.so.0.2002.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.2001.0 to libgstnet-1.0.so.0.2002.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.2001.0 to libgstreamer-1.0.so.0.2002.0
  /usr/lib/libgstbase-1.0.so.0.2001.0 moved to /usr/lib/libgstbase-1.0.so.0.2002.0
  /usr/lib/libgstcheck-1.0.so.0.2001.0 moved to /usr/lib/libgstcheck-1.0.so.0.2002.0
  /usr/lib/libgstcontroller-1.0.so.0.2001.0 moved to /usr/lib/libgstcontroller-1.0.so.0.2002.0
  /usr/lib/libgstnet-1.0.so.0.2001.0 moved to /usr/lib/libgstnet-1.0.so.0.2002.0
  /usr/lib/libgstreamer-1.0.so.0.2001.0 moved to /usr/lib/libgstreamer-1.0.so.0.2002.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2001.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2002.0-gdb.py
Changes to packages/x86_64-linux/gcc-cross-i686 (sysroot):
  /sysroot-providers/virtual_i686-poky-linux-g++ was added
  /sysroot-providers/virtual_i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux was added
  /usr/bin/i686-poky-linux/i686-poky-linux-c++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-cpp was added
  /usr/bin/i686-poky-linux/i686-poky-linux-g++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-12.1.0 was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ar was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-nm was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ranlib was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-dump was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-tool was added
  /usr/bin/i686-poky-linux/i686-poky-linux-lto-dump was added
  /usr/libexec/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/cc1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/cc1plus was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/collect2 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/g++-mapper-server was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/i686-poky-linux-strip was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/fixincl was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/fixinc.sh was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/mkheaders was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/mkinstalldirs was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcc1.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcp1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcp1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/libcp1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/liblto_plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/lto1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/lto-wrapper was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/gengtype was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.1.0/strip was added
  /usr/lib/i686-poky-linux was added
  /usr/lib/i686-poky-linux/bfd-plugins was added
  /usr/lib/i686-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/i686-poky-linux/gcc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/adxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/ammintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/amxbf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/amxint8intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/amxtileintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx5124fmapsintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx5124vnniwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512bf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512bf16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512bitalgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512bwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512cdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512dqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512erintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512fintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512fp16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512fp16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512ifmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512ifmavlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512pfintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vbmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vbmi2vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vbmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vbmivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vlbwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vldqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vnnivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vp2intersectintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vpopcntdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/avxvnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/bmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/bmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/bmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/cet.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/cetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/cldemoteintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/clflushoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/clwbintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/clzerointrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/cpuid.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/cross-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/emmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/enqcmdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/f16cintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include-fixed was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include-fixed/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include-fixed/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include-fixed/syslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/float.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/fma4intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/fmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/fxsrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/gfniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/hresetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/ia32intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/immintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/iso646.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/keylockerintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/lwpintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/lzcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/mm3dnow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/mmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/mm_malloc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/movdirintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/mwaitintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/mwaitxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/nmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/pconfigintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/pkuintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/pmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/popcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/prfchwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/quadmath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/quadmath_weak.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/rdseedintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/rtmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/serializeintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/sgxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/shaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/smmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdalign.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdatomic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdbool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stddef.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdfix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdint-gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/stdnoreturn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/tbmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/tmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/tsxldtrkintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/uintrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/unwind.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/vaesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/varargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/vpclmulqdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/waitpkgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/wbnoinvdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/wmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/x86gprintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/x86intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xopintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xsavecintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xsaveintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xsaveoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xsavesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/include/xtestintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/fixinc_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/include/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/include/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/macro_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/install-tools/mkheaders.conf was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/gtype.state was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ada was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ada/gcc-interface was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/addresses.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/align.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/alloc-pool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/all-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ansidecl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/array-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/asan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/attr-fnspec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/attribs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/auto-host.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/auto-profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/backend.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/basic-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/bb-reorder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/b-header-vars was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/bitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/builtin-attrs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/builtins.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/builtin-types.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/bversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/calls.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ccmp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family/c-common.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family/c-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family/c-objc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family/c-pragma.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfganal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgbuild.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgexpand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfg-flags.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfghooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgloopmanip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cfgrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cgraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cif-code.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/collect2-aix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/collect2.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/collect-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/color-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/common was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/common/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/common/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/conditions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/configargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/dbxelf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/elfos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/glibc-stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/gnu-user.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/att.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/i386.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/i386-isa.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/linux64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/linux-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/stringop.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/unix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/x86-64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/initfini-array.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/linux-android.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/linux-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/convert.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/coretypes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/coroutine-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/coverage.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/cp-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/cp-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/name-lookup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/operators.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cppbuiltin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cppdefault.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cpplib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cp/type-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/cselib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ctfc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/c-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/d was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/data-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dbgcnt.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dbgcnt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dbxout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ddg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/d/d-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/debug.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/defaults.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/df.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dfp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-color.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-event-id.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-metadata.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-spec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/diagnostic-url.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/digraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dojump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dominance.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/domwalk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/double-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dump-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dumpfile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dwarf2asm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dwarf2ctf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/dwarf2out.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/edit-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/emit-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/errors.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/escaped_string.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/et-forest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/except.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/explow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/expmed.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/fibonacci_heap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/file-find.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/filenames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/file-prefix-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/fixed-value.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/flag-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/fold-const-call.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/fold-const.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/function-abi.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcc-plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcc-rich-location.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcc-symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcov-counter.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcov-io.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcse-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gcse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/generic-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gengtype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/genrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gensupport.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ggc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ggc-internal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-array-bounds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-predicate-analysis.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-cache.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-edge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-gori.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-range-trace.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-ssa-evrp-analyze.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-ssa-warn-access.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimple-walk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimplify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gimplify-me.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/glimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gomp-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/graphds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/graph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/graphite.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/graphviz.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gsstruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gstab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gsyms.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gtm-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/gtype-desc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hard-reg-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hash-map-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hash-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hashtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hash-table.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/highlev-plugin-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hosthooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hosthooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hw-doloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/hwint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ifcvt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/inchash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/incpath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/input.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-addr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-attr-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-attr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-codes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-modes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-modes-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/insn-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/internal-fn.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/internal-fn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/intl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/int-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-fnsummary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-icf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-modref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-modref-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-predicate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-prop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-reference.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ipa-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ira.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ira-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/is-a.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/iterator-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/langhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/langhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lcm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/libiberty.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/limitx.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/limity.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/line-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/loop-unroll.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lower-subreg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lra-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lto-compress.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lto-section-names.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/lto-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/machmode.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/machmode.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/md5.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/memmodel.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/memory-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/mem-stats.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/mem-stats-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/mode-classes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/mux-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/objc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/objc/objc-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/obstack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/obstack-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-expand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-general.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-offload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/omp-simd-clone.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optabs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optabs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optabs-libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optabs-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optabs-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optinfo-emit-json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/optinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/options.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/opt-problem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/opts-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/opt-suggestions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ordered-hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/output.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/passes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/pass-instances.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/pass_manager.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/plugin-api.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/plugin.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/plugin-version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/pointer-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/poly-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/poly-int-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/predict.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/prefix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/print-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/print-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/profile-count.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/range-op.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/read-md.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/read-rtl-function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/real.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/realmpfr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/recog.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/regcprop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/reg-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/regrename.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/regset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/regs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/reload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/resource.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtlanal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtl.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtl-error.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtlhash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtlhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtl-iter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtl-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/rtx-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/run-rtl-passes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/safe-ctype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sanitizer.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sbitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sched-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/selftest-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/selftest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/selftest-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sel-sched-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sel-sched.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sel-sched-ir.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sese.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/shortest-paths.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/shrink-wrap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/signop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sparseset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/spellcheck.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/spellcheck-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/splay-tree-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sreal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ssa-iterators.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/stab.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/statistics.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/stmt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/stor-layout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/streamer-hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/stringpool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/substring-locations.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/symbol-summary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/symtab-clones.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/symtab-thunks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/sync-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/system.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target-globals.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target-hooks-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/target-insns.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/targhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/timevar.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/timevar.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tm_p.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tm-preds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/toplev.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tracer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/trans-mem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-affine.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-check.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-chrec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-data-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-dfa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-eh.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-hasher.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-if-conv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-into-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-nested.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-object-size.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-outof-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-parloops.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-pass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-phinodes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-sra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-address.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-dom.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-dse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-live.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-loop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssanames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-operands.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-ter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/treestruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-switch-conversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-vectorizer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tree-vrp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tristate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/tsystem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/typeclass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/typed-splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/ubsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/valtrack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-pointer-equiv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-prof.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-range-equiv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/value-relation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/varasm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vec-perm-indices.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vmsdbg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vr-values.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/vtable-verify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/wide-int-bitmask.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/wide-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/wide-int-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/xcoff.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.1.0/plugin/include/xcoffout.h was added
  /sysroot-providers/virtual_i686-poky-linux-musl-g++ was removed
  /sysroot-providers/virtual_i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-c++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-cpp was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-g++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-12.1.0 was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ar was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-nm was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ranlib was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-dump was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-tool was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-lto-dump was removed
  /usr/libexec/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/cc1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/cc1plus was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/collect2 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/g++-mapper-server was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/i686-poky-linux-musl-strip was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/fixincl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/fixinc.sh was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/mkheaders was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/mkinstalldirs was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcc1.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcp1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/libcp1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/liblto_plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/lto1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/lto-wrapper was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/gengtype was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/strip was removed
  /usr/lib/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/i686-poky-linux-musl/gcc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/adxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/ammintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/amxbf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/amxint8intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/amxtileintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx5124fmapsintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx5124vnniwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512bf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512bf16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512bitalgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512bwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512cdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512dqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512erintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512fintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512fp16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512fp16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512ifmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512ifmavlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512pfintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vbmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vbmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vbmivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vlbwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vldqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vnnivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vp2intersectintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/avxvnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/bmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/bmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/bmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/cet.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/cetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/cldemoteintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/clflushoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/clwbintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/clzerointrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/cpuid.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/cross-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/emmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/enqcmdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/f16cintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include-fixed was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include-fixed/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include-fixed/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include-fixed/syslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/float.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/fma4intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/fmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/fxsrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/gfniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/hresetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/ia32intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/immintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/iso646.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/keylockerintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/lwpintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/lzcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/mm3dnow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/mmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/mm_malloc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/movdirintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/mwaitintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/mwaitxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/nmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/pconfigintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/pkuintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/pmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/popcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/prfchwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/quadmath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/quadmath_weak.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/rdseedintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/rtmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/serializeintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/sgxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/shaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/smmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdalign.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdatomic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdbool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stddef.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdfix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdint-gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/stdnoreturn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/tbmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/tmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/tsxldtrkintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/uintrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/unwind.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/vaesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/varargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/vpclmulqdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/waitpkgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/wbnoinvdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/wmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/x86gprintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/x86intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xopintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xsavecintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xsaveintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xsaveoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xsavesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/include/xtestintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/fixinc_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/include/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/include/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/macro_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/install-tools/mkheaders.conf was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/gtype.state was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ada was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ada/gcc-interface was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/addresses.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/align.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/alloc-pool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/all-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ansidecl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/array-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/asan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/attr-fnspec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/attribs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/auto-host.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/auto-profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/backend.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/basic-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/bb-reorder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/b-header-vars was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/bitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/builtin-attrs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/builtins.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/builtin-types.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/bversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/calls.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ccmp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family/c-common.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family/c-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family/c-objc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfganal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgbuild.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgexpand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfg-flags.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfghooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgloopmanip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cfgrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cgraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cif-code.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/collect2-aix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/collect2.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/collect-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/color-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/common was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/common/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/common/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/conditions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/configargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/dbxelf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/elfos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/gnu-user.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/att.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/i386.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/i386-isa.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/linux64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/stringop.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/unix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/initfini-array.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/linux-android.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/linux-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/convert.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/coretypes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/coroutine-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/coverage.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/cp-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/cp-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/name-lookup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/operators.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cppbuiltin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cppdefault.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cpplib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cp/type-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/cselib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ctfc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/c-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/d was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/data-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dbgcnt.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dbgcnt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dbxout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ddg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/d/d-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/debug.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/defaults.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/df.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dfp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-color.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-spec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/diagnostic-url.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/digraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dojump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dominance.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/domwalk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/double-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dump-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dumpfile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dwarf2asm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dwarf2ctf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/dwarf2out.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/edit-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/emit-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/errors.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/escaped_string.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/et-forest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/except.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/explow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/expmed.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/fibonacci_heap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/file-find.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/filenames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/file-prefix-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/fixed-value.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/flag-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/fold-const-call.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/fold-const.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/function-abi.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcc-plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcc-rich-location.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcc-symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcov-counter.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcov-io.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcse-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gcse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/generic-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gengtype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/genrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gensupport.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ggc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ggc-internal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-predicate-analysis.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-cache.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-edge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-gori.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-range-trace.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-ssa-evrp-analyze.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-ssa-warn-access.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimple-walk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimplify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gimplify-me.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/glimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gomp-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/graphds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/graph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/graphite.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/graphviz.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gsstruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gstab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gsyms.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gtm-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/gtype-desc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hard-reg-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hash-map-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hash-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hashtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hash-table.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hosthooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hosthooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hw-doloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/hwint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ifcvt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/inchash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/incpath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/input.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-addr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-attr-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-attr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-codes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-modes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-modes-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/insn-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/internal-fn.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/internal-fn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/intl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/int-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-icf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-modref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-predicate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-prop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-reference.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ipa-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ira.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ira-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/is-a.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/iterator-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/langhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/langhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lcm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/libiberty.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/limitx.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/limity.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/line-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/loop-unroll.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lower-subreg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lra-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lto-compress.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lto-section-names.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/lto-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/machmode.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/machmode.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/md5.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/memmodel.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/memory-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/mem-stats.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/mem-stats-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/mode-classes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/mux-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/objc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/objc/objc-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/obstack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/obstack-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-expand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-general.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-offload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/omp-simd-clone.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optabs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optabs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optabs-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optabs-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/optinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/options.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/opt-problem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/opts-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/opt-suggestions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ordered-hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/output.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/passes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/pass-instances.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/pass_manager.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/plugin-api.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/plugin.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/plugin-version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/pointer-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/poly-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/poly-int-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/predict.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/prefix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/print-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/print-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/profile-count.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/range-op.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/read-md.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/read-rtl-function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/real.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/realmpfr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/recog.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/regcprop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/reg-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/regrename.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/regset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/regs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/reload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/resource.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtlanal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtl.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtl-error.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtlhash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtlhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtl-iter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtl-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/run-rtl-passes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/safe-ctype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sanitizer.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sbitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sched-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/selftest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/selftest-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sel-sched-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sel-sched.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sel-sched-ir.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sese.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/shortest-paths.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/shrink-wrap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/signop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sparseset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/spellcheck.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/spellcheck-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/splay-tree-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sreal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ssa-iterators.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/stab.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/statistics.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/stmt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/stor-layout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/streamer-hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/stringpool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/substring-locations.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/symbol-summary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/symtab-clones.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/symtab-thunks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/sync-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/system.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target-globals.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target-hooks-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/target-insns.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/targhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/timevar.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/timevar.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tm_p.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tm-preds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/toplev.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tracer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/trans-mem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-affine.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-check.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-chrec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-data-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-dfa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-eh.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-hasher.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-if-conv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-into-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-nested.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-object-size.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-parloops.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-pass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-phinodes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-sra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-address.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-live.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssanames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/treestruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-vectorizer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tree-vrp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tristate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/tsystem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/typeclass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/typed-splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/ubsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/valtrack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-pointer-equiv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-prof.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-range-equiv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/value-relation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/varasm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vec-perm-indices.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vmsdbg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vr-values.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/vtable-verify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/wide-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/wide-int-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/xcoff.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/plugin/include/xcoffout.h was removed

--===============1159442796547457862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1643 targets, 50 skipped, 0 masked, 0 errors.
Removing 35 recipes from the core2-32 sysroot...done.
Removing 55 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-62702a1b1d86b858400e5a7428f7529cf08699a9"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:62702a1b1d86b858400e5a7428f7529cf08699a9"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 150 Local 142 Mirrors 0 Missed 8 Current 151 (94% match, 97% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 156 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 157 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 160 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 161 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 164 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 165 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running task 672 of 1141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_fetch)
NOTE: Running task 688 of 1141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_write_config)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 691 of 1141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_write_config: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 169 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 170 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 172 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_setscene)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_unpack: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 175 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 176 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_populate_sysroot_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/psmisc/23.4-r0/temp/log.do_packagedata_setscene.1210485
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_unpack: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 180 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_package_setscene)
NOTE: Running task 705 of 1141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_patch)
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_patch: Started
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 182 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 183 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 184 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 185 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 187 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 188 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 189 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 190 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 191 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 192 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 193 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 194 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_patch: Succeeded
NOTE: Running task 710 of 1141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 711 of 1141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_populate_lic)
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_lic: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 197 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.38.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 200 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_lic: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_populate_lic unihash changed to bdaba4e28a61850149ca33f9ff3df635dbe3bc95125ea678c2b4e1d4a71e946f
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_setscene: Started
NOTE: recipe psmisc-23.4-r0: task do_package_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 211 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 212 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 213 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe psmisc-23.4-r0: task do_package_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 217 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 218 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 219 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 220 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 221 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 222 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 226 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 227 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 232 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 233 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 234 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 235 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 237 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 238 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 239 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 240 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 241 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 242 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 251 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 256 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 258 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 264 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 270 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 272 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 274 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 276 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 278 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 279 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 282 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 285 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 286 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 295 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 298 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 299 of 301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1065 of 1141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1127 of 1141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata)
NOTE: Running task 1128 of 1141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.4-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe psmisc-23.4-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1130 of 1141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_configure: Succeeded
NOTE: Running task 1131 of 1141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1132 of 1141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_compile: Succeeded
NOTE: Running task 1133 of 1141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1134 of 1141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_install: Succeeded
NOTE: Running task 1135 of 1141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1136 of 1141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_package)
NOTE: Running task 1137 of 1141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package: Succeeded
NOTE: Running task 1138 of 1141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1139 of 1141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_package_write_rpm)
NOTE: Running task 1140 of 1141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_package_qa)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1141 of 1141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1141 tasks of which 1120 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 43 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-src went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-dbg went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package fuser went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package fuser-doc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package killall went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package killall-doc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package pstree went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package pstree-doc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-staticdev went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-dev went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-doc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-extras went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-bg went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ca went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-cs went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-da went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-de went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-el went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-eo went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-es went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-eu went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-fi went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-fr went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-hr went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-hu went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-id went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-it went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ja went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-nb went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-nl went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-pl went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-pt went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-pt-br went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ro went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ru went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-sr went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-sv went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-uk went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-vi went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-zh-cn went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-zh-tw went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1159442796547457862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 63 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-62702a1b1d86b858400e5a7428f7529cf08699a9"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:62702a1b1d86b858400e5a7428f7529cf08699a9"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 18 Local 7 Mirrors 0 Missed 11 Current 398 (38% match, 97% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 402 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata_setscene)
NOTE: Running task 1094 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_fetch)
NOTE: Running task 1171 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_write_config)
NOTE: Running task 1379 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe psmisc-23.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 1479 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_unpack)
NOTE: Running task 1480 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/psmisc/23.4-r0/temp/log.do_packagedata_setscene.1182169
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 415 of 416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_package_setscene)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 1481 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_patch)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_patch: Succeeded
NOTE: Running task 1482 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1483 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe psmisc-23.4-r0: task do_package_setscene: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_populate_lic unihash changed to bdaba4e28a61850149ca33f9ff3df635dbe3bc95125ea678c2b4e1d4a71e946f
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_package_setscene: Succeeded
NOTE: Running task 1484 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_configure)
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1494 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata)
NOTE: Running task 1495 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1496 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_configure: Started
NOTE: recipe psmisc-23.4-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b66cac58edb771b109ed64655cea5c8c334aeae1090430b4b9cb3a7493c0551c
NOTE: recipe psmisc-23.4-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1507 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 359f8d35f3643abf6826e617d0d167fcf8b19ee2957168c556ba750cc012b0b5
NOTE: Running task 1512 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_configure: Succeeded
NOTE: Running task 1513 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1514 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_compile: Succeeded
NOTE: Running task 1515 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1516 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_install: Succeeded
NOTE: Running task 1517 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1518 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_package)
NOTE: Running task 1519 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package: Succeeded
NOTE: Running task 1520 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1521 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_package_write_rpm)
NOTE: Running task 1522 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_package_qa)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1523 of 1523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1523 tasks of which 1498 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 43 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-src went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-dbg went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package fuser went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package fuser-doc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package killall went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package killall-doc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package pstree went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package pstree-doc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-staticdev went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-dev went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-doc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-extras went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-bg went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ca went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-cs went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-da went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-de went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-el went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-eo went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-es went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-eu went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-fi went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-fr went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-hr went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-hu went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-id went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-it went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ja went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-nb went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-nl went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-pl went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-pt went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-pt-br went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ro went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ru went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-sr went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-sv went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-uk went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-vi went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-zh-cn went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-zh-tw went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1159442796547457862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (883 cached, 1 parsed). 1642 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-62702a1b1d86b858400e5a7428f7529cf08699a9"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:62702a1b1d86b858400e5a7428f7529cf08699a9"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 18 Local 7 Mirrors 0 Missed 11 Current 402 (38% match, 97% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 406 of 420 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata_setscene)
NOTE: Running task 1097 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_fetch)
NOTE: Running task 1179 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_write_config)
NOTE: Running task 1389 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe psmisc-23.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 1493 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_unpack)
NOTE: Running task 1494 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/psmisc/23.4-r0/temp/log.do_packagedata_setscene.1154294
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 419 of 420 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_package_setscene)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 1495 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_patch)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe psmisc-23.4-r0: task do_package_setscene: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_patch: Succeeded
NOTE: Running task 1496 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1497 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_lic: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_package_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_populate_lic unihash changed to bdaba4e28a61850149ca33f9ff3df635dbe3bc95125ea678c2b4e1d4a71e946f
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1507 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1508 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_configure)
NOTE: Running task 1509 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1510 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe psmisc-23.4-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to fb3c8441b8c6896d1bfcca1c31c63967fd6ebadcd0412c4032d25462e0061156
NOTE: recipe psmisc-23.4-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1521 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to d6da3a62e28efee8ad4a3cb235af3b2f838f70686182e5facfbed9881e307e9c
NOTE: Running task 1526 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_configure: Succeeded
NOTE: Running task 1527 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1528 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_compile: Succeeded
NOTE: Running task 1529 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1530 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_install: Succeeded
NOTE: Running task 1531 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1532 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_package)
NOTE: Running task 1533 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package: Succeeded
NOTE: Running task 1534 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1535 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_package_write_rpm)
NOTE: Running task 1536 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_package_qa)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1537 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1537 tasks of which 1512 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 43 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-src went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-dbg went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package fuser went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package fuser-doc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package killall went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package killall-doc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package pstree went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package pstree-doc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-staticdev went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-dev went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-doc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-extras went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-bg went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ca went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-cs went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-da went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-de went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-el went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-eo went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-es went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-eu went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-fi went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-fr went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-hr went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-hu went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-id went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-it went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ja went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-nb went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-nl went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-pl went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-pt went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-pt-br went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ro went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ru went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-sr went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-sv went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-uk went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-vi went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-zh-cn went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-zh-tw went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1159442796547457862==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-upgrade-1.20.1-1.20.2.patch"

From a7902efed76167e983d2efa0b2a9f01549bbe8d7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 15:42:00 +0000
Subject: [PATCH] gstreamer1.0: upgrade 1.20.1 -> 1.20.2

---
 .../{gstreamer1.0_1.20.1.bb => gstreamer1.0_1.20.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.1.bb => gstreamer1.0_1.20.2.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
index 81b94928d9..3aa9aa7048 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            file://0005-tests-remove-gstbin-test_watch_for_state_change-test.patch \
            "
-SRC_URI[sha256sum] = "de094a404a3ad8f4977829ea87edf695a4da0b5c8f613ebe54ab414bac89f031"
+SRC_URI[sha256sum] = "df24e8792691a02dfe003b3833a51f1dbc6c3331ae625d143b17da939ceb5e0a"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.31.1


--===============1159442796547457862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 53 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-62702a1b1d86b858400e5a7428f7529cf08699a9"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:62702a1b1d86b858400e5a7428f7529cf08699a9"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 18 Local 7 Mirrors 0 Missed 11 Current 402 (38% match, 97% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 406 of 420 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata_setscene)
NOTE: Running task 1097 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_fetch)
NOTE: Running task 1179 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_write_config)
NOTE: Running task 1392 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe psmisc-23.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 1493 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_unpack)
NOTE: Running task 1494 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/psmisc/23.4-r0/temp/log.do_packagedata_setscene.1168271
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 419 of 420 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_package_setscene)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 1495 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_patch)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1496 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1497 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_populate_lic)
NOTE: recipe psmisc-23.4-r0: task do_package_setscene: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_populate_lic unihash changed to bdaba4e28a61850149ca33f9ff3df635dbe3bc95125ea678c2b4e1d4a71e946f
NOTE: recipe psmisc-23.4-r0: task do_package_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1502 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1508 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata)
NOTE: Running task 1509 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1510 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe psmisc-23.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to ee9ea557f16a8e77018ceb5e8d08eafa1b980af31ebf807d01b8efc24788c202
NOTE: recipe psmisc-23.4-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1521 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 67a4fc9c78a3cceb1476f59eee38eb091258cfd494b23b9668e50c7fa8ef4384
NOTE: Running task 1526 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_configure: Succeeded
NOTE: Running task 1527 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1528 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_compile: Succeeded
NOTE: Running task 1529 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1530 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_install: Succeeded
NOTE: Running task 1531 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1532 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_package)
NOTE: Running task 1533 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package: Succeeded
NOTE: Running task 1534 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1535 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_package_write_rpm)
NOTE: Running task 1536 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_package_qa)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1537 of 1537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1537 tasks of which 1512 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 43 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-src went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-dbg went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package fuser went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package fuser-doc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package killall went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package killall-doc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package pstree went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package pstree-doc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-staticdev went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-dev went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-doc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-extras went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-bg went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ca went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-cs went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-da went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-de went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-el went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-eo went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-es went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-eu went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-fi went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-fr went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-hr went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-hu went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-id went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-it went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ja went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-nb went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-nl went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-pl went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-pt went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-pt-br went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ro went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-ru went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-sr went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-sv went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-uk went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-vi went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-zh-cn went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: QA Issue: Package version for package psmisc-locale-zh-tw went backwards which would break package feeds (from 0:23.5-r0 to 0:23.4-r0) [version-going-backwards]
ERROR: psmisc-23.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1159442796547457862==--

