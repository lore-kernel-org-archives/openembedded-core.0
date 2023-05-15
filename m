Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE38EC88CBC
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:16 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.3762.1684186747387470666
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BYWcBLIB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010188215a587a-d72331bd-03f3-42e1-9d54-7a9da4dabad5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AOVL7kqt6mey3sAqLv87e1DH4ygZtYs0GraXWr3RzHE=;
	b=BYWcBLIBvFgPIA2dKvP8ke9yOQwIUdAzCX/B3wo9nvOgmMeWsxhlLJ368sOmbeLH
	qWcdzqsn6FyyF8pdpAQ1YuMSFWqBIf13223jYV9FE4576F6DYtqsij5wxRac8nXhnOH
	P7+Jl3q6236/L32n99ACupq9tUq4+pvfuDTOUQ7Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AOVL7kqt6mey3sAqLv87e1DH4ygZtYs0GraXWr3RzHE=;
	b=Z812ttjYKQsvBbGlVNmXDM80iZMPAS974YzDhcEMqHYgdF5a8c+cB3gR6bvRiSwx
	Ms6lC8hVmmy/XCKWq8NNq3dKTJA+AF4V9txqQ1noBHLQ1QFy2YuHLEWdkgIk+Td6y15
	XNp08Dh+XqZAHJQCqvpveGccng7Q48dTmtXE81nE=
Content-Type: multipart/mixed; boundary="===============3310334065850524840=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wget: upgrading to 1.21.4 SUCCEEDED
Message-ID: <01010188215a587a-d72331bd-03f3-42e1-9d54-7a9da4dabad5-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181339

--===============3310334065850524840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wget* to *1.21.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wget-upgrade-1.21.3-1.21.4.patch
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
--===============3310334065850524840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/wget: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget: PACKAGES: added "wget-locale-ka"
packages/core2-32-poky-linux/wget: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget: SRC_URI changed from "https://ftp.gnu.org/gnu/wget/wget-1.21.3.tar.gz file://0002-improve-reproducibility.patch" to "https://ftp.gnu.org/gnu/wget/wget-1.21.4.tar.gz file://0002-improve-reproducibility.patch"
packages/core2-32-poky-linux/wget/wget-dbg: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-dbg: PKGSIZE changed from 1329472 to 1339332 (+1%)
packages/core2-32-poky-linux/wget/wget-dbg: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-dev: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-dev: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-doc: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-doc: PKGSIZE changed from 233669 to 233677 (+0%)
packages/core2-32-poky-linux/wget/wget-doc: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-af: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-af: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-be: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-be: PKGSIZE changed from 23843 to 98110 (+311%)
packages/core2-32-poky-linux/wget/wget-locale-be: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-bg: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-bg: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-ca: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-ca: PKGSIZE changed from 34697 to 34625 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-ca: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-cs: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-cs: PKGSIZE changed from 87541 to 87863 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-cs: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-da: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-da: PKGSIZE changed from 27195 to 27130 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-da: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-de: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-de: PKGSIZE changed from 90321 to 90681 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-de: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-el: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-el: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-en-gb: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-en-gb: PKGSIZE changed from 8365 to 8427 (+1%)
packages/core2-32-poky-linux/wget/wget-locale-en-gb: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-eo: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-eo: PKGSIZE changed from 80571 to 82274 (+2%)
packages/core2-32-poky-linux/wget/wget-locale-eo: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-es: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-es: PKGSIZE changed from 84891 to 85775 (+1%)
packages/core2-32-poky-linux/wget/wget-locale-es: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-et: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-et: PKGSIZE changed from 79250 to 79536 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-et: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-eu: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-eu: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-fi: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-fi: PKGSIZE changed from 71680 to 71623 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-fi: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-fr: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-fr: PKGSIZE changed from 88506 to 88786 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-fr: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-ga: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-ga: PKGSIZE changed from 76717 to 76654 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-ga: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-gl: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-gl: PKGSIZE changed from 24196 to 24131 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-gl: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-he: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-he: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-hr: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-hr: PKGSIZE changed from 81728 to 82185 (+1%)
packages/core2-32-poky-linux/wget/wget-locale-hr: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-hu: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-hu: PKGSIZE changed from 82226 to 90495 (+10%)
packages/core2-32-poky-linux/wget/wget-locale-hu: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-id: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-id: PKGSIZE changed from 30193 to 61467 (+104%)
packages/core2-32-poky-linux/wget/wget-locale-id: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-it: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-it: PKGSIZE changed from 86629 to 86569 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-it: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-ja: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-ja: PKGSIZE changed from 92018 to 92245 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-ja: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-ko: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-ko: PKGSIZE changed from 82621 to 82916 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-ko: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-lt: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-lt: PKGSIZE changed from 15711 to 15765 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-lt: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-ms: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-ms: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-nb: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-nb: PKGSIZE changed from 78832 to 79149 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-nb: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-nl: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-nl: PKGSIZE changed from 65087 to 65020 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-nl: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-pl: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-pl: PKGSIZE changed from 85834 to 86113 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-pl: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-pt-br: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-pt-br: PKGSIZE changed from 85338 to 87209 (+2%)
packages/core2-32-poky-linux/wget/wget-locale-pt-br: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-pt: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-pt: PKGSIZE changed from 83372 to 83308 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-pt: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-ro: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-ro: PKGSIZE changed from 84546 to 87795 (+4%)
packages/core2-32-poky-linux/wget/wget-locale-ro: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-ru: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-ru: PKGSIZE changed from 105554 to 105837 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-ru: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-rw: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-rw: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-sk: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-sk: PKGSIZE changed from 80943 to 81233 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-sk: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-sl: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-sl: PKGSIZE changed from 28068 to 28011 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-sl: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-sr: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-sr: PKGSIZE changed from 105082 to 105410 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-sr: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-sv: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-sv: PKGSIZE changed from 83324 to 83640 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-sv: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-tr: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-tr: PKGSIZE changed from 73064 to 73002 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-tr: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-uk: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-uk: PKGSIZE changed from 106329 to 106628 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-uk: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-vi: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-vi: PKGSIZE changed from 82728 to 90469 (+9%)
packages/core2-32-poky-linux/wget/wget-locale-vi: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-zh-cn: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-zh-cn: PKGSIZE changed from 77661 to 79391 (+2%)
packages/core2-32-poky-linux/wget/wget-locale-zh-cn: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-zh-tw: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-zh-tw: PKGSIZE changed from 80432 to 80753 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-zh-tw: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-src: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-src: PKGSIZE changed from 2781944 to 2818203 (+1%)
packages/core2-32-poky-linux/wget/wget-src: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-src: FILELIST: directory renamed /usr/src/debug/wget/1.21.3-r0/lib/malloc -> /usr/src/debug/wget/1.21.4-r0/lib/malloc, directory renamed /usr/src/debug/wget/1.21.3-r0/lib/sys -> /usr/src/debug/wget/1.21.4-r0/lib/sys, directory renamed /usr/src/debug/wget/1.21.3-r0/src -> /usr/src/debug/wget/1.21.4-r0/src, removed "/usr/src/debug/wget/1.21.3-r0/lib/exitfail.h /usr/src/debug/wget/1.21.3-r0/lib/fnmatch.h /usr/src/debug/wget/1.21.3-r0/lib/exitfail.c /usr/src/debug/wget/1.21.3-r0/lib/xalloc-die.c /usr/src/debug/wget/1.21.3-r0/lib/fnmatch.c /usr/src/debug/wget/1.21.3-r0/lib/hard-locale.c /usr/src/debug/wget/1.21.3-r0/lib/hard-locale.h /usr/src/debug/wget/1.21.3-r0/lib/mbiter.h /usr/src/debug/wget/1.21.3-r0/lib/sha1.h /usr/src/debug/wget/1.21.3-r0/lib/xstrndup.c /usr/src/debug/wget/1.21.3-r0/lib/idx.h /usr/src/debug/wget/1.21.3-r0/lib/regex_internal.h /usr/src/debug/wget/1.21.3-r0/lib/xmemdup0.c /usr/src/debug/wget/1.21.3-r0/lib/base32.c /usr/src/debug
 /wget/1.21.3-r0/lib/fflush.c /usr/src/debug/wget/1.21.3-r0/lib/c-strcasecmp.c /usr/src/debug/wget/1.21.3-r0/lib/regex_internal.c /usr/src/debug/wget/1.21.3-r0/lib/xmemdup0.h /usr/src/debug/wget/1.21.3-r0/lib/xstrndup.h /usr/src/debug/wget/1.21.3-r0/lib/fseeko.c /usr/src/debug/wget/1.21.3-r0/lib/localcharset.c /usr/src/debug/wget/1.21.3-r0/lib/setlocale_null.c /usr/src/debug/wget/1.21.3-r0/lib/quotearg.h /usr/src/debug/wget/1.21.3-r0/lib/getopt-core.h /usr/src/debug/wget/1.21.3-r0/lib/getopt1.c /usr/src/debug/wget/1.21.3-r0/lib/wchar.h /usr/src/debug/wget/1.21.3-r0/lib/localcharset.h /usr/src/debug/wget/1.21.3-r0/lib/setlocale_null.h /usr/src/debug/wget/1.21.3-r0/lib/error.h /usr/src/debug/wget/1.21.3-r0/lib/quotearg.c /usr/src/debug/wget/1.21.3-r0/lib/fcntl.h /usr/src/debug/wget/1.21.3-r0/lib/getopt.c /usr/src/debug/wget/1.21.3-r0/lib/mbchar.c /usr/src/debug/wget/1.21.3-r0/lib/memchr.c /usr/src/debug/wget/1.21.3-r0/lib/strtol.c /usr/src/debug/wget/1.21.3-r0/lib/sha256.c /usr/src/deb
 ug/wget/1.21.3-r0/lib/tmpdir.c /usr/src/debug/wget/1.21.3-r0/lib/quote.h /usr/src/debug/wget/1.21.3-r0/lib/regex.h /usr/src/debug/wget/1.21.3-r0/lib/stdio.h /usr/src/debug/wget/1.21.3-r0/lib/sha256.h /usr/src/debug/wget/1.21.3-r0/lib/stdlib.h /usr/src/debug/wget/1.21.3-r0/lib/string.h /usr/src/debug/wget/1.21.3-r0/lib/fcntl.c /usr/src/debug/wget/1.21.3-r0/lib/fseek.c /usr/src/debug/wget/1.21.3-r0/lib/base32.h /usr/src/debug/wget/1.21.3-r0/lib/af_alg.h /usr/src/debug/wget/1.21.3-r0/lib/dirent.h /usr/src/debug/wget/1.21.3-r0/lib/basename.c /usr/src/debug/wget/1.21.3-r0/lib/ialloc.h /usr/src/debug/wget/1.21.3-r0/lib/basename-lgpl.c /usr/src/debug/wget/1.21.3-r0/lib/ioctl.c /usr/src/debug/wget/1.21.3-r0/lib/mbchar.h /usr/src/debug/wget/1.21.3-r0/lib/basename-lgpl.h /usr/src/debug/wget/1.21.3-r0/lib/getopt_int.h /usr/src/debug/wget/1.21.3-r0/lib/fnmatch_loop.c /usr/src/debug/wget/1.21.3-r0/lib/mbrtowc.c /usr/src/debug/wget/1.21.3-r0/lib/regexec.c /usr/src/debug/wget/1.21.3-r0/lib/sha1.c 
 /usr/src/debug/wget/1.21.3-r0/lib/c-ctype.h /usr/src/debug/wget/1.21.3-r0/lib/dirname.h /usr/src/debug/wget/1.21.3-r0/lib/xmalloc.c /usr/src/debug/wget/1.21.3-r0/lib/tmpdir.h /usr/src/debug/wget/1.21.3-r0/lib/xalloc.h /usr/src/debug/wget/1.21.3-r0/lib/getopt-ext.h /usr/src/debug/wget/1.21.3-r0/lib/md5.c /usr/src/debug/wget/1.21.3-r0/lib/md5.h /usr/src/debug/wget/1.21.3-r0/lib/c-strcase.h /usr/src/debug/wget/1.21.3-r0/lib/strerror.c /usr/src/debug/wget/1.21.3-r0/lib/regcomp.c /usr/src/debug/wget/1.21.3-r0/lib/sha1-stream.c /usr/src/debug/wget/1.21.3-r0/lib/c-strcaseeq.h /usr/src/debug/wget/1.21.3-r0/lib/c-strncasecmp.c", added "/usr/src/debug/wget/1.21.4-r0/lib/hard-locale.c /usr/src/debug/wget/1.21.4-r0/lib/hard-locale.h /usr/src/debug/wget/1.21.4-r0/lib/mbsrtowcs-state.c /usr/src/debug/wget/1.21.4-r0/lib/mbchar.c /usr/src/debug/wget/1.21.4-r0/lib/memchr.c /usr/src/debug/wget/1.21.4-r0/lib/md5.h /usr/src/debug/wget/1.21.4-r0/lib/sha256.c /usr/src/debug/wget/1.21.4-r0/lib/strtol.c /u
 sr/src/debug/wget/1.21.4-r0/lib/base32.c /usr/src/debug/wget/1.21.4-r0/lib/fflush.c /usr/src/debug/wget/1.21.4-r0/lib/fseeko.c /usr/src/debug/wget/1.21.4-r0/lib/getopt.c /usr/src/debug/wget/1.21.4-r0/lib/mbchar.h /usr/src/debug/wget/1.21.4-r0/lib/mbiter.h /usr/src/debug/wget/1.21.4-r0/lib/md5.c /usr/src/debug/wget/1.21.4-r0/lib/sha256.h /usr/src/debug/wget/1.21.4-r0/lib/stdlib.h /usr/src/debug/wget/1.21.4-r0/lib/string.h /usr/src/debug/wget/1.21.4-r0/lib/tmpdir.h /usr/src/debug/wget/1.21.4-r0/lib/xalloc.h /usr/src/debug/wget/1.21.4-r0/lib/base32.h /usr/src/debug/wget/1.21.4-r0/lib/strnlen1.c /usr/src/debug/wget/1.21.4-r0/lib/strnlen1.h /usr/src/debug/wget/1.21.4-r0/lib/mbsrtowcs.c /usr/src/debug/wget/1.21.4-r0/lib/sha1-stream.c /usr/src/debug/wget/1.21.4-r0/lib/quotearg.h /usr/src/debug/wget/1.21.4-r0/lib/getopt-core.h /usr/src/debug/wget/1.21.4-r0/lib/quotearg.c /usr/src/debug/wget/1.21.4-r0/lib/basename-lgpl.c /usr/src/debug/wget/1.21.4-r0/lib/basename-lgpl.h /usr/src/debug/wget/1
 .21.4-r0/lib/fnmatch_loop.c /usr/src/debug/wget/1.21.4-r0/lib/c-strcaseeq.h /usr/src/debug/wget/1.21.4-r0/lib/tmpdir.c /usr/src/debug/wget/1.21.4-r0/lib/exitfail.h /usr/src/debug/wget/1.21.4-r0/lib/exitfail.c /usr/src/debug/wget/1.21.4-r0/lib/xalloc-die.c /usr/src/debug/wget/1.21.4-r0/lib/idx.h /usr/src/debug/wget/1.21.4-r0/lib/regex_internal.h /usr/src/debug/wget/1.21.4-r0/lib/xmemdup0.c /usr/src/debug/wget/1.21.4-r0/lib/c-strcasecmp.c /usr/src/debug/wget/1.21.4-r0/lib/regex_internal.c /usr/src/debug/wget/1.21.4-r0/lib/xmemdup0.h /usr/src/debug/wget/1.21.4-r0/lib/af_alg.h /usr/src/debug/wget/1.21.4-r0/lib/dirent.h /usr/src/debug/wget/1.21.4-r0/lib/ialloc.h /usr/src/debug/wget/1.21.4-r0/lib/localcharset.c /usr/src/debug/wget/1.21.4-r0/lib/setlocale_null.c /usr/src/debug/wget/1.21.4-r0/lib/localcharset.h /usr/src/debug/wget/1.21.4-r0/lib/setlocale_null.h /usr/src/debug/wget/1.21.4-r0/lib/c-ctype.h /usr/src/debug/wget/1.21.4-r0/lib/dirname.h /usr/src/debug/wget/1.21.4-r0/lib/sha1.h /u
 sr/src/debug/wget/1.21.4-r0/lib/mbrtowc.c /usr/src/debug/wget/1.21.4-r0/lib/regexec.c /usr/src/debug/wget/1.21.4-r0/lib/sha1.c /usr/src/debug/wget/1.21.4-r0/lib/xmalloc.c /usr/src/debug/wget/1.21.4-r0/lib/getopt-ext.h /usr/src/debug/wget/1.21.4-r0/lib/c-strncasecmp.c /usr/src/debug/wget/1.21.4-r0/lib/mbsrtowcs-impl.h /usr/src/debug/wget/1.21.4-r0/lib/fnmatch.h /usr/src/debug/wget/1.21.4-r0/lib/fnmatch.c /usr/src/debug/wget/1.21.4-r0/lib/xstrndup.c /usr/src/debug/wget/1.21.4-r0/lib/xstrndup.h /usr/src/debug/wget/1.21.4-r0/lib/getopt1.c /usr/src/debug/wget/1.21.4-r0/lib/quote.h /usr/src/debug/wget/1.21.4-r0/lib/regex.h /usr/src/debug/wget/1.21.4-r0/lib/stdio.h /usr/src/debug/wget/1.21.4-r0/lib/wchar.h /usr/src/debug/wget/1.21.4-r0/lib/fcntl.h /usr/src/debug/wget/1.21.4-r0/lib/ioctl.c /usr/src/debug/wget/1.21.4-r0/lib/btowc.c /usr/src/debug/wget/1.21.4-r0/lib/fcntl.c /usr/src/debug/wget/1.21.4-r0/lib/fopen.c /usr/src/debug/wget/1.21.4-r0/lib/fseek.c /usr/src/debug/wget/1.21.4-r0/lib/ba
 sename.c /usr/src/debug/wget/1.21.4-r0/lib/getopt_int.h /usr/src/debug/wget/1.21.4-r0/lib/c-strcase.h /usr/src/debug/wget/1.21.4-r0/lib/strerror.c /usr/src/debug/wget/1.21.4-r0/lib/regcomp.c"
packages/core2-32-poky-linux/wget/wget-staticdev: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-staticdev: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget: PKGV changed from 1.21.3 [default] to 1.21.4 [default]

--===============3310334065850524840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/wget: PACKAGES: added "wget-locale-ka"
packages/core2-32-poky-linux/wget/wget-locale-be: PKGSIZE changed from 23843 to 98110 (+311%)
packages/core2-32-poky-linux/wget/wget-locale-hu: PKGSIZE changed from 82226 to 90495 (+10%)
packages/core2-32-poky-linux/wget/wget-locale-id: PKGSIZE changed from 30193 to 61467 (+104%)

--===============3310334065850524840==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wget-upgrade-1.21.3-1.21.4.patch"

RnJvbSAwYmZjMzMzMTRkMWNmNjZlM2IwNmU1YmRmOGIzZTQyZjljMzA2ZTY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTU6MDE6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
Z2V0OiB1cGdyYWRlIDEuMjEuMyAtPiAxLjIxLjQKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3dnZXQvd2dldC5pbmMgICAgICAgICAgIHwgIDIgKy0KIC4uLi93Z2V0L3t3Z2V0XzEuMjEuMy5i
YiA9PiB3Z2V0XzEuMjEuNC5iYn0gICB8IDI0ICsrKysrKysrKysrKysrKysrKy0KIDIgZmlsZXMg
Y2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvd2dldC97d2dldF8xLjIxLjMuYmIgPT4gd2dldF8xLjIxLjQuYmJ9ICgx
MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3dnZXQvd2dldC5pbmMgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0LmluYwppbmRleCA1OGNiNWNhNzNkLi4zMGFi
YWZmN2I3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0LmluYwor
KysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0LmluYwpAQCAtNyw3ICs3LDcgQEAg
RlRQIHNpdGVzIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS93Z2V0
LyIKIFNFQ1RJT04gPSAiY29uc29sZS9uZXR3b3JrIgogTElDRU5TRSA9ICJHUEwtMy4wLW9ubHki
Ci1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1jNjc4OTU3YjBjOGU5NjRh
YTZjNzBmZDc3NjQxYTcxZSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1
PTZmNjUwMTJkMWRhZjk4Y2IwOWIzODZjZmI2OGRmMjZiIgogCiBpbmhlcml0IGF1dG90b29scyBn
ZXR0ZXh0IHRleGluZm8gdXBkYXRlLWFsdGVybmF0aXZlcyBwa2djb25maWcKIApkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3dnZXQvd2dldF8xLjIxLjMuYmIgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvd2dldC93Z2V0XzEuMjEuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDEzJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0XzEuMjEuMy5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3dnZXQvd2dldF8xLjIxLjQuYmIKaW5kZXggZjE3NmEx
NTQ2Yy4uNzQ1NWY3ZTA4ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3dnZXQv
d2dldF8xLjIxLjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3dnZXQvd2dldF8xLjIx
LjQuYmIKQEAgLTEsNyArMSwyOSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFs
dWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93
aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNl
IHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQg
c3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vu
c2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQg
eWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcKKyMg
KysrIENPUFlJTkcKKyMgQEAgLTEsNyArMSw3IEBACisjICAgICAgICAgICAgICAgICAgICAgIEdO
VSBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisjICAgICAgICAgICAgICAgICAgICAgICAgIFZlcnNp
b24gMywgMjkgSnVuZSAyMDA3CisjICAKKyMgLSBDb3B5cmlnaHQgKEMpIDIwMDcgRnJlZSBTb2Z0
d2FyZSBGb3VuZGF0aW9uLCBJbmMuIDxodHRwczovL2ZzZi5vcmcvPgorIyArIENvcHlyaWdodCAo
QykgMjAwNywgMjAyMyBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4gPGh0dHBzOi8vZnNm
Lm9yZy8+CisjICAgRXZlcnlvbmUgaXMgcGVybWl0dGVkIHRvIGNvcHkgYW5kIGRpc3RyaWJ1dGUg
dmVyYmF0aW0gY29waWVzCisjICAgb2YgdGhpcyBsaWNlbnNlIGRvY3VtZW50LCBidXQgY2hhbmdp
bmcgaXQgaXMgbm90IGFsbG93ZWQuCisjICAKKyMgCisjCisKIFNSQ19VUkkgPSAiJHtHTlVfTUlS
Uk9SfS93Z2V0L3dnZXQtJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDItaW1w
cm92ZS1yZXByb2R1Y2liaWxpdHkucGF0Y2ggXAogICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjU3MjZiYjhiYzVjYTBmNmRjNzExMGY2NDE2ZTRiYjcwMTllMmQyZmY1YmY5M2Qx
Y2EyZmZjYzY2NTZmMjIwZTUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODE1NDJmNWNlZmI4ZmFh
Y2MzOWJiYmM2YzgyZGVkODBlM2U0YTg4NTA1YWU3MmVhNTFkZjI3NTI1YmNkZTA0YyIKIAogcmVx
dWlyZSB3Z2V0LmluYwotLSAKMi4zOS4yCgo=

--===============3310334065850524840==--

