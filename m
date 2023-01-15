Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D57C76196
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:32 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.145826.1673805743388991396
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dBv32jr3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010185b698c1b6-753cccd1-cae2-46ff-a5b9-903e9090bd18-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VNkEVpI0ZO/aEmseaydhcwaETZxx9sWwdPe0JFaxC00=;
	b=dBv32jr3Z59WKhakYNn1gIjCsw4I0XE2LiilbCU+ggwv70XNT3/vV8l9X68Vitkw
	hontN+qef9AC0CXbWCVFgW97k+kX5o5B+GzcKYWU7sW2MP17Qt+glp6JaA5NDULhmjr
	J7wt390UMJbzHLJXP8cK7pMFBSElpyM56Xo8ff2U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VNkEVpI0ZO/aEmseaydhcwaETZxx9sWwdPe0JFaxC00=;
	b=ThaG6MFjMKU1Py6Ewe37u0Qy8HbOICe6sDQxFKKJt++eG1bAXK+7ezoM6cTfbAqF
	SP6Vx1tWvYkSo7UR4bXwatFldR73552zkyzzj931K7o7hfENF7hgnJAPjrk2PoRsHFs
	L0cerwP3MKhxAJ3xKjAq1J9Fl9ziJxKemiYbEyTg=
Content-Type: multipart/mixed; boundary="===============1910027278880150630=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: =?utf-8?b?QW7DrWJhbCBMaW3Ds24gPGxpbW9uLmFuaWJhbEBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dpkg: upgrading to 1.21.18 SUCCEEDED
Message-ID: <01010185b698c1b6-753cccd1-cae2-46ff-a5b9-903e9090bd18-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175897

--===============1910027278880150630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dpkg* to *1.21.18* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dpkg-upgrade-1.21.17-1.21.18.patch
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
--===============1910027278880150630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dpkg/dpkg-dbg: PKGSIZE changed from 2789996 to 2793264 (+0%)
packages/core2-32-poky-linux/dpkg/dpkg-dbg: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-dbg: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-dev: PKGSIZE changed from 159275 to 159470 (+0%)
packages/core2-32-poky-linux/dpkg/dpkg-dev: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-dev: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-doc: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-doc: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ast: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ast: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-bs: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-bs: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ca: PKGSIZE changed from 297498 to 295074 (-1%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-ca: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ca: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-cs: PKGSIZE changed from 124752 to 124640 (-0%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-cs: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-cs: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-da: PKGSIZE changed from 112982 to 112883 (-0%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-da: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-da: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-de: PKGSIZE changed from 293584 to 291013 (-1%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-de: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-de: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-dz: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-dz: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-el: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-el: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-eo: PKGSIZE changed from 113291 to 113183 (-0%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-eo: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-eo: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-es: PKGSIZE changed from 187869 to 187769 (-0%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-es: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-es: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-et: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-et: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-eu: PKGSIZE changed from 117701 to 117584 (-0%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-eu: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-eu: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-fr: PKGSIZE changed from 197331 to 197226 (-0%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-fr: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-fr: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-gl: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-gl: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-hu: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-hu: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-id: PKGSIZE changed from 67823 to 67694 (-0%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-id: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-id: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-it: PKGSIZE changed from 134471 to 134366 (-0%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-it: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-it: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ja: PKGSIZE changed from 138671 to 138562 (-0%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-ja: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ja: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-km: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-km: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ko: PKGSIZE changed from 77453 to 77308 (-0%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-ko: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ko: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ku: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ku: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-lt: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-lt: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-mr: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-mr: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-nb: PKGSIZE changed from 68059 to 67932 (-0%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-nb: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-nb: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ne: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ne: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-nl: PKGSIZE changed from 172776 to 170374 (-1%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-nl: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-nl: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-nn: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-nn: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-oc: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-oc: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-pa: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-pa: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-pl: PKGSIZE changed from 207987 to 207845 (-0%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-pl: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-pl: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-pt-br: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-pt-br: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-pt: PKGSIZE changed from 141274 to 141173 (-0%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-pt: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-pt: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ro: PKGSIZE changed from 73415 to 73282 (-0%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-ro: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ro: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ru: PKGSIZE changed from 229450 to 229310 (-0%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-ru: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ru: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-sk: PKGSIZE changed from 111601 to 111498 (-0%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-sk: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-sk: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-sv: PKGSIZE changed from 265846 to 263445 (-1%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-sv: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-sv: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-th: PKGSIZE changed from 175264 to 175093 (-0%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-th: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-th: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-tl: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-tl: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-tr: PKGSIZE changed from 130691 to 130576 (-0%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-tr: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-tr: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-vi: PKGSIZE changed from 134070 to 133973 (-0%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-vi: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-vi: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-zh-cn: PKGSIZE changed from 161073 to 158720 (-1%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-zh-cn: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-zh-cn: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-zh-tw: PKGSIZE changed from 109458 to 109362 (-0%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-zh-tw: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-locale-zh-tw: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-perl: PKGSIZE changed from 655726 to 655667 (-0%)
packages/core2-32-poky-linux/dpkg/dpkg-perl: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-perl: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-src: PKGSIZE changed from 1165886 to 1173994 (+1%)
packages/core2-32-poky-linux/dpkg/dpkg-src: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-src: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-start-stop: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-start-stop: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg-staticdev: PKGSIZE changed from 989916 to 995880 (+1%)
packages/core2-32-poky-linux/dpkg/dpkg-staticdev: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg-staticdev: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/dpkg: PKGSIZE changed from 1474908 to 1479016 (+0%)
packages/core2-32-poky-linux/dpkg/dpkg: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/dpkg: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg: PKGV changed from 1.21.17 [default] to 1.21.18 [default]
packages/core2-32-poky-linux/dpkg/update-alternatives-dpkg: PV changed from "1.21.17" to "1.21.18"
packages/core2-32-poky-linux/dpkg/update-alternatives-dpkg: PKGV changed from 1.21.17 [default] to 1.21.18 [default]

--===============1910027278880150630==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dpkg-upgrade-1.21.17-1.21.18.patch"

RnJvbSBjMmQxMjExODkxMDA1OGIzODk5NWZlNzBmMjFlZTY4OGU1MjU5OGZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMDc6NTM6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
cGtnOiB1cGdyYWRlIDEuMjEuMTcgLT4gMS4yMS4xOAoKLS0tCiAuLi4vZHBrZy9kcGtnLzAwMDEt
YnVpbGQuYy1pZ25vcmUtcmV0dXJuLW9mLTEtZnJvbS10YXItY2YucGF0Y2ggfCAyICstCiBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZHBrZy97ZHBrZ18xLjIxLjE3LmJiID0+IGRwa2dfMS4yMS4xOC5i
Yn0gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy97ZHBrZ18xLjIxLjE3LmJiID0+
IGRwa2dfMS4yMS4xOC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZHBrZy9kcGtnLzAwMDEtYnVpbGQuYy1pZ25vcmUtcmV0dXJuLW9mLTEtZnJvbS10YXItY2Yu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtYnVpbGQuYy1pZ25v
cmUtcmV0dXJuLW9mLTEtZnJvbS10YXItY2YucGF0Y2gKaW5kZXggMWI1Yjg5NjQ0Zi4uMjRhNGIw
NjVhOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDAxLWJ1
aWxkLmMtaWdub3JlLXJldHVybi1vZi0xLWZyb20tdGFyLWNmLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1idWlsZC5jLWlnbm9yZS1yZXR1cm4tb2YtMS1m
cm9tLXRhci1jZi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTRjYTIwYTE4MjUzYmNmMDkx
NWIyZTI5ODViYmVlNzliZjg4MWViZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTc3
MTlhMjVkMTMzNTFkNTNiYzYwMTgyZTBiNzY4N2I0ZWNjZDM5OCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IFBhdWwgRWdnbGV0b24gPHBhdWwuZWdnbGV0b25AbGludXgubWljcm9zb2Z0
LmNvbT4KIERhdGU6IFR1ZSwgMTYgSnVuIDIwMjAgMDM6NTc6MjUgKzAwMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gYnVpbGQuYzogaWdub3JlIHJldHVybiBvZiAxIGZyb20gdGFyIC1jZgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZ18xLjIxLjE3LmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2Rwa2cvZHBrZ18xLjIxLjE4LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2dfMS4yMS4xNy5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZ18xLjIxLjE4LmJiCmluZGV4IGY2
Njg3NjcxZjAuLjNiYjg0YTQzM2EgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
cGtnL2Rwa2dfMS4yMS4xNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtn
XzEuMjEuMTguYmIKQEAgLTE4LDYgKzE4LDYgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9zYWxzYS5kZWJp
YW4ub3JnL2Rwa2ctdGVhbS9kcGtnLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbgogCiBT
UkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiIGZpbGU6Ly8wMDAxLWJ1aWxkLmMtaWdub3Jl
LXJldHVybi1vZi0xLWZyb20tdGFyLWNmLnBhdGNoIgogCi1TUkNSRVYgPSAiZTkxYmU3NTJlY2Zj
M2Q0ZjU1MTQ4MzVjNzk2MDk4MDQ5NDBkNGI5NyIKK1NSQ1JFViA9ICJlYmMyYzNkZWYzMzVhYzM5
MWIwMTAzMjNhYjY1YTMwMjY0OGYzZWM3IgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgotLSAKMi4z
Ny4zCgo=

--===============1910027278880150630==--

