Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1582ECCA487
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:09 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.39378.1656687062517298481
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cluntyBr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010181ba3e7315-48e47a9d-1565-4c18-b924-273d6fb9307b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687064;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=zjentCNBgRllKQXiINgK2mLJh0vZdu3TJpedY5zSgbM=;
	b=cluntyBrLSKlcZA1Gv4TVdgBMgp1ROoYviCPwXXDkzmEtsACoxPHM+ChHeecYkKb
	15gmF00659JOEEmIv4ZkB/eKnGxSxD/SKx57MrHX3JLNUe1CGSfROyixE+Jpcp+IO7q
	a+a0vZeWIY4Id5YPxgK1zygcZ2i1fSEHHdl1fl2U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687064;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=zjentCNBgRllKQXiINgK2mLJh0vZdu3TJpedY5zSgbM=;
	b=icHLdC49G7tVJTPmyQ6SOAd+GbhcG3SieWVVmfZHDTOEruqM3kqGwKl39ySIoJKG
	OVbHXg+rqV/UkIzamwGxQ1l3QaTtUa5lnwVqHJcgsrS4Smg+1poIt95gE/6NSE3MJhC
	hyRbNMgCbVVNHszmsy6BnOSBn3hwGc30NLqCJEPU=
Content-Type: multipart/mixed; boundary="===============6290911952981049186=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] pulseaudio: upgrading to 16.1 SUCCEEDED
Message-ID: 
 <01010181ba3e7315-48e47a9d-1565-4c18-b924-273d6fb9307b-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:04 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167522

--===============6290911952981049186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pulseaudio* to *16.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pulseaudio-upgrade-16.0-16.1.patch
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
--===============6290911952981049186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/pulseaudio: SRC_URI changed from "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-16.0.tar.xz file://0001-client-conf-Add-allow-autospawn-for-root.patch file://0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch file://volatiles.04_pulse file://0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch" to "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-16.1.tar.xz file://0001-client-conf-Add-allow-autospawn-for-root.patch file://0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch file://volatiles.04_pulse file://0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch"
packages/core2-32-poky-linux/pulseaudio: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/libpulse-mainloop-glib: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/libpulse-mainloop-glib: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/libpulse-simple: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/libpulse-simple: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/libpulse: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/libpulse: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/libpulsecommon: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/libpulsecommon: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/libpulsecommon: FILELIST: removed "/usr/lib/pulseaudio/libpulsecommon-16.0.so", added "/usr/lib/pulseaudio/libpulsecommon-16.1.so"
packages/core2-32-poky-linux/pulseaudio/libpulsecore: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/libpulsecore: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/libpulsecore: FILELIST: removed "/usr/lib/pulseaudio/libpulsecore-16.0.so", added "/usr/lib/pulseaudio/libpulsecore-16.1.so"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-bash-completion: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-bash-completion: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-dbg: PKGSIZE changed from 9925276 to 9925708 (+0%)
packages/core2-32-poky-linux/pulseaudio/pulseaudio-dbg: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-dbg: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-dbg: FILELIST: removed "/usr/lib/pulseaudio/.debug/libpulsecore-16.0.so /usr/lib/pulseaudio/.debug/libpulsecommon-16.0.so", added "/usr/lib/pulseaudio/.debug/libpulsecore-16.1.so /usr/lib/pulseaudio/.debug/libpulsecommon-16.1.so"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-dev: FILES: removed "/usr/lib/pulse-16.0/modules/*.la", added "/usr/lib/pulse-16.1/modules/*.la"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-dev: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-dev: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-doc: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-doc: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-lib-alsa-util: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-lib-alsa-util: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-lib-avahi-wrap: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-lib-avahi-wrap: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-lib-bluez5-util: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-lib-bluez5-util: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-lib-cli: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-lib-cli: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-lib-oss-util: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-lib-oss-util: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-lib-protocol-cli: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-lib-protocol-cli: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-lib-protocol-http: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-lib-protocol-http: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-lib-protocol-native: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-lib-protocol-native: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-lib-protocol-simple: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-lib-protocol-simple: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-lib-rtp: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-lib-rtp: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-af: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-af: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-as: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-as: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-be: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-be: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-bg: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-bg: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-bn-in: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-bn-in: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-ca: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-ca: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-cs: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-cs: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-da: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-da: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-de-ch: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-de-ch: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-de: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-de: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-el: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-el: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-eo: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-eo: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-es: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-es: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-fi: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-fi: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-fr: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-fr: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-gl: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-gl: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-gu: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-gu: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-he: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-he: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-hi: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-hi: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-hr: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-hr: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-hu: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-hu: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-id: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-id: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-it: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-it: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-ja: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-ja: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-ka: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-ka: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-kk: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-kk: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-kn: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-kn: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-ko: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-ko: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-lt: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-lt: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-ml: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-ml: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-mr: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-mr: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-nl: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-nl: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-nn: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-nn: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-oc: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-oc: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-or: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-or: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-pa: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-pa: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-pl: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-pl: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-pt-br: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-pt-br: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-pt: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-pt: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-ru: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-ru: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-si: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-si: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-sk: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-sk: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-sr+latin: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-sr+latin: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-sr: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-sr: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-sv: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-sv: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-ta: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-ta: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-te: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-te: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-tr: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-tr: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-uk: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-uk: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-zh-cn: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-zh-cn: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-zh-tw: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-locale-zh-tw: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-misc: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-misc: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-allow-passthrough: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-allow-passthrough: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-alsa-card: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-alsa-card: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-alsa-sink: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-alsa-sink: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-alsa-source: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-alsa-source: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-always-sink: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-always-sink: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-always-source: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-always-source: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-augment-properties: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-augment-properties: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-bluetooth-discover: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-bluetooth-discover: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-bluetooth-policy: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-bluetooth-policy: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-bluez5-device: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-bluez5-device: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-bluez5-discover: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-bluez5-discover: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-card-restore: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-card-restore: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-cli-protocol-tcp: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-cli-protocol-tcp: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-cli-protocol-unix: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-cli-protocol-unix: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-cli: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-cli: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-combine-sink: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-combine-sink: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-combine: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-combine: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-console-kit: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-console-kit: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-dbus-protocol: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-dbus-protocol: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-default-device-restore: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-default-device-restore: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-detect: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-detect: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-device-manager: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-device-manager: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-device-restore: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-device-restore: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-echo-cancel: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-echo-cancel: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-filter-apply: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-filter-apply: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-filter-heuristics: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-filter-heuristics: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-gsettings: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-gsettings: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-http-protocol-tcp: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-http-protocol-tcp: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-http-protocol-unix: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-http-protocol-unix: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-intended-roles: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-intended-roles: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-ladspa-sink: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-ladspa-sink: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-loopback: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-loopback: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-match: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-match: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-mmkbd-evdev: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-mmkbd-evdev: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-native-protocol-fd: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-native-protocol-fd: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-native-protocol-tcp: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-native-protocol-tcp: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-native-protocol-unix: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-native-protocol-unix: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-null-sink: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-null-sink: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-null-source: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-null-source: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-oss: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-oss: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-pipe-sink: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-pipe-sink: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-pipe-source: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-pipe-source: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-position-event-sounds: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-position-event-sounds: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-remap-sink: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-remap-sink: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-remap-source: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-remap-source: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-rescue-streams: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-rescue-streams: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-role-cork: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-role-cork: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-role-ducking: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-role-ducking: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-rtp-recv: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-rtp-recv: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-rtp-send: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-rtp-send: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-rygel-media-server: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-rygel-media-server: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-simple-protocol-tcp: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-simple-protocol-tcp: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-simple-protocol-unix: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-simple-protocol-unix: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-sine-source: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-sine-source: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-sine: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-sine: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-stream-restore: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-stream-restore: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-suspend-on-idle: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-suspend-on-idle: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-switch-on-connect: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-switch-on-connect: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-switch-on-port-available: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-switch-on-port-available: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-systemd-login: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-systemd-login: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-tunnel-sink-new: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-tunnel-sink-new: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-tunnel-sink: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-tunnel-sink: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-tunnel-source-new: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-tunnel-source-new: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-tunnel-source: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-tunnel-source: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-udev-detect: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-udev-detect: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-virtual-sink: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-virtual-sink: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-virtual-source: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-virtual-source: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-volume-restore: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-volume-restore: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-x11-bell: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-x11-bell: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-x11-cork-request: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-x11-cork-request: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-x11-publish: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-x11-publish: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-x11-xsmp: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-x11-xsmp: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-zeroconf-discover: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-zeroconf-discover: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-zeroconf-publish: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-module-zeroconf-publish: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-pa-info: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-pa-info: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-server: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-server: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-src: PKGSIZE changed from 6381927 to 6382554 (+0%)
packages/core2-32-poky-linux/pulseaudio/pulseaudio-src: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-src: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio-staticdev: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio-staticdev: PKGV changed from 16.0 [default] to 16.1 [default]
packages/core2-32-poky-linux/pulseaudio/pulseaudio: PV changed from "16.0" to "16.1"
packages/core2-32-poky-linux/pulseaudio/pulseaudio: PKGV changed from 16.0 [default] to 16.1 [default]
Changes to packages/core2-32-poky-linux/pulseaudio (sysroot):
  /usr/lib/pulseaudio/libpulsecommon-16.0.so moved to /usr/lib/pulseaudio/libpulsecommon-16.1.so
  /usr/lib/pulseaudio/libpulsecore-16.0.so moved to /usr/lib/pulseaudio/libpulsecore-16.1.so

--===============6290911952981049186==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-pulseaudio-upgrade-16.0-16.1.patch"

From d0a13e5ad676a76a2aed489cdaaa47f4f6f8dd9b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 13:19:25 +0000
Subject: [PATCH] pulseaudio: upgrade 16.0 -> 16.1

---
 .../pulseaudio/{pulseaudio_16.0.bb => pulseaudio_16.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_16.0.bb => pulseaudio_16.1.bb} (84%)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb
similarity index 84%
rename from meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb
rename to meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb
index f9940d4c85..64002cd1cc 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb
@@ -6,5 +6,5 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://volatiles.04_pulse \
            file://0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch \
            "
-SRC_URI[sha256sum] = "b4ec6271910a1a86803f165056547f700dfabaf8d5c6c69736f706b5bb889f47"
+SRC_URI[sha256sum] = "8eef32ce91d47979f95fd9a935e738cd7eb7463430dabc72863251751e504ae4"
 UPSTREAM_CHECK_REGEX = "pulseaudio-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
-- 
2.31.1


--===============6290911952981049186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/pulseaudio/libpulsecommon: FILELIST: removed "/usr/lib/pulseaudio/libpulsecommon-16.0.so", added "/usr/lib/pulseaudio/libpulsecommon-16.1.so"
packages/core2-32-poky-linux/pulseaudio/libpulsecore: FILELIST: removed "/usr/lib/pulseaudio/libpulsecore-16.0.so", added "/usr/lib/pulseaudio/libpulsecore-16.1.so"
Changes to packages/core2-32-poky-linux/pulseaudio (sysroot):
  /usr/lib/pulseaudio/libpulsecommon-16.0.so moved to /usr/lib/pulseaudio/libpulsecommon-16.1.so
  /usr/lib/pulseaudio/libpulsecore-16.0.so moved to /usr/lib/pulseaudio/libpulsecore-16.1.so

--===============6290911952981049186==--

