Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796DAC64E90
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:46 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web08.5161.1668517535773395009
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=M3BhfGFF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101847b652302-8b403336-d731-4b4b-89ba-bab75b9e3091-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/iAZbGnocZA8thEkhSzvEYPxErnhidSaLOKJ/CIZYh4=;
	b=M3BhfGFFaXKou+ZKlao8KqJ1+n2E5YTs/mQhy2BouuD7TcZMOhNKxFFgVGHRYVkf
	DrCTfWvfRELVLb1TbFcWV3r8uA94UtmSXrFbwYFgyfslSitPMYnkU0Kdgn4BRHsP7Yo
	t6jI3DoSdgtETgegjAWBCoznQgLj/kSAvVfErjUM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/iAZbGnocZA8thEkhSzvEYPxErnhidSaLOKJ/CIZYh4=;
	b=e1gvFwF3+9HooGFLjd0jG/5vr9m+nzfJjztVU+nWOExhDRyH/fGBTwdnwv9vCONf
	QbeKRNFTi5l0dJqqUWbL63IBnFHvi10YqnEMy5cw1tMUPr9EVLzfrqGUkjFGZf1zwzu
	HBtjpWVKr7G32tk4tSYg+3yitPgEcHR4W/xD3xHk=
Content-Type: multipart/mixed; boundary="===============1208700070519375613=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] babeltrace: upgrading to 1.5.11 SUCCEEDED
Message-ID: <010101847b652302-8b403336-d731-4b4b-89ba-bab75b9e3091-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173322

--===============1208700070519375613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *babeltrace* to *1.5.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-babeltrace-upgrade-1.5.8-1.5.11.patch
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
--===============1208700070519375613==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-babeltrace-upgrade-1.5.8-1.5.11.patch"

RnJvbSBhZWY3M2UzYTI2ODJjMzJkYmUwZjY0YjdjMmUyYTU2NGI5MjU2N2I5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMTE6MjM6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YWJlbHRyYWNlOiB1cGdyYWRlIDEuNS44IC0+IDEuNS4xMQoKLS0tCiAuLi4vbHR0bmcve2JhYmVs
dHJhY2VfMS41LjguYmIgPT4gYmFiZWx0cmFjZV8xLjUuMTEuYmJ9ICAgICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMta2VybmVsL2x0dG5nL3tiYWJlbHRyYWNlXzEuNS44LmJiID0+IGJhYmVsdHJhY2Vf
MS41LjExLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcv
YmFiZWx0cmFjZV8xLjUuOC5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFj
ZV8xLjUuMTEuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNlXzEuNS44LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
a2VybmVsL2x0dG5nL2JhYmVsdHJhY2VfMS41LjExLmJiCmluZGV4IDE5NjAxZTdkMWIuLjhlMmZl
NDE2NGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZV8x
LjUuOC5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2VfMS41LjEx
LmJiCkBAIC0xMCw3ICsxMCw3IEBAIERFUEVORFMgPSAiZ2xpYi0yLjAgdXRpbC1saW51eCBwb3B0
IGJpc29uLW5hdGl2ZSBmbGV4LW5hdGl2ZSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LmVmZmljaW9z
LmNvbS9iYWJlbHRyYWNlLmdpdDticmFuY2g9c3RhYmxlLTEuNSBcCiAJICAgZmlsZTovL3J1bi1w
dGVzdCBcCiAJICAiCi1TUkNSRVYgPSAiMDU0YTU0YWUxMGIwMWEyNzFhZmM0ZjE5NDk2YzA0MWIx
MGZiNDE0YyIKK1NSQ1JFViA9ICI5MWMwMGY3MDg4NDg4N2ZmNWM0ODQ5YThlM2Q0N2UzMTFhMjJi
YTlkIgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAidig/UDxwdmVyPjEoXC5cZCspKykk
IgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgotLSAKMi4zMS4xCgo=

--===============1208700070519375613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/babeltrace/babeltrace-dbg: PV changed from "1.5.8" to "1.5.11"
packages/core2-32-poky-linux/babeltrace/babeltrace-dbg: PKGSIZE changed from 1992052 to 1993036 (+0%)
packages/core2-32-poky-linux/babeltrace/babeltrace-dbg: PKGV changed from 1.5.8 [default] to 1.5.11 [default]
packages/core2-32-poky-linux/babeltrace/babeltrace-dev: PV changed from "1.5.8" to "1.5.11"
packages/core2-32-poky-linux/babeltrace/babeltrace-dev: PKGSIZE changed from 102270 to 102272 (+0%)
packages/core2-32-poky-linux/babeltrace/babeltrace-dev: PKGV changed from 1.5.8 [default] to 1.5.11 [default]
packages/core2-32-poky-linux/babeltrace/babeltrace-doc: PV changed from "1.5.8" to "1.5.11"
packages/core2-32-poky-linux/babeltrace/babeltrace-doc: PKGSIZE changed from 83892 to 84435 (+1%)
packages/core2-32-poky-linux/babeltrace/babeltrace-doc: PKGV changed from 1.5.8 [default] to 1.5.11 [default]
packages/core2-32-poky-linux/babeltrace/babeltrace-locale: PV changed from "1.5.8" to "1.5.11"
packages/core2-32-poky-linux/babeltrace/babeltrace-locale: PKGV changed from 1.5.8 [default] to 1.5.11 [default]
packages/core2-32-poky-linux/babeltrace/babeltrace-ptest: PV changed from "1.5.8" to "1.5.11"
packages/core2-32-poky-linux/babeltrace/babeltrace-ptest: PKGSIZE changed from 2291614 to 2291680 (+0%)
packages/core2-32-poky-linux/babeltrace/babeltrace-ptest: PKGV changed from 1.5.8 [default] to 1.5.11 [default]
packages/core2-32-poky-linux/babeltrace/babeltrace-src: PV changed from "1.5.8" to "1.5.11"
packages/core2-32-poky-linux/babeltrace/babeltrace-src: PKGSIZE changed from 1770859 to 1771176 (+0%)
packages/core2-32-poky-linux/babeltrace/babeltrace-src: PKGV changed from 1.5.8 [default] to 1.5.11 [default]
packages/core2-32-poky-linux/babeltrace/babeltrace-staticdev: PV changed from "1.5.8" to "1.5.11"
packages/core2-32-poky-linux/babeltrace/babeltrace-staticdev: PKGV changed from 1.5.8 [default] to 1.5.11 [default]
packages/core2-32-poky-linux/babeltrace/babeltrace: PV changed from "1.5.8" to "1.5.11"
packages/core2-32-poky-linux/babeltrace/babeltrace: PKGV changed from 1.5.8 [default] to 1.5.11 [default]
packages/core2-32-poky-linux/babeltrace: PV changed from "1.5.8" to "1.5.11"
packages/core2-32-poky-linux/babeltrace: PKGV changed from 1.5.8 [default] to 1.5.11 [default]

--===============1208700070519375613==--

