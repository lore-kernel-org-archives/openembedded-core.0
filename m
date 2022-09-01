Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D66DC6FA99
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:56 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.12571.1662040786985398651
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nGertPW8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 01010182f959c4da-1b97abea-74cb-4db8-85e3-0c7b68b11ebd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040786;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=56ixV40Y3Z/7VwkQbJEk9WVCZ3wPFVpIblcLtToUNDg=;
	b=nGertPW80zGFh/Iu8F/HjnHK6N0Q7HqYuN1L0GIT3gQZrGfsHerBuE+MKbn1Wluw
	bzk0XEWehOQYPYyzy1cTgpw8cLhBW/j0sRKA09BLAwSnYnXdH0szh5UjCToN39R7aEu
	6yyqG36YwJVUuVutwu4LWbK8QH0Ylu2NNZpMsYVg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040786;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=56ixV40Y3Z/7VwkQbJEk9WVCZ3wPFVpIblcLtToUNDg=;
	b=iZEdqMCpHu4jiT7+rrLeXfBc8Pk0Mvi21t0Zyz8AJQ1VOOD8AycPbxg74OArCOsE
	tbtVXVy6cPdmSkPJ//lGbvIfXuk/XWOULFlMGGFa6aBVKLvYNLAp/wESDAOShH/MWQT
	Vglj5qtKQsnxlCVvJMXUNEHxScfxJ2sdcOLNd0XI=
Content-Type: multipart/mixed; boundary="===============6288266774911373381=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librsvg: upgrading to 2.54.5 SUCCEEDED
Message-ID: 
 <01010182f959c4da-1b97abea-74cb-4db8-85e3-0c7b68b11ebd-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170190

--===============6288266774911373381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *librsvg* to *2.54.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-librsvg-upgrade-2.54.4-2.54.5.patch
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
--===============6288266774911373381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/librsvg: PV changed from "2.54.4" to "2.54.5"
packages/core2-32-poky-linux/librsvg: SRC_URI changed from "https://download.gnome.org/sources//librsvg/2.54/librsvg-2.54.4.tar.xz;name=archive file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch" to "https://download.gnome.org/sources//librsvg/2.54/librsvg-2.54.5.tar.xz;name=archive file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch"
packages/core2-32-poky-linux/librsvg: PKGV changed from 2.54.4 [default] to 2.54.5 [default]
packages/core2-32-poky-linux/librsvg/librsvg-dbg: PV changed from "2.54.4" to "2.54.5"
packages/core2-32-poky-linux/librsvg/librsvg-dbg: PKGSIZE changed from 8506492 to 7934712 (-7%)
packages/core2-32-poky-linux/librsvg/librsvg-dbg: PKGV changed from 2.54.4 [default] to 2.54.5 [default]
packages/core2-32-poky-linux/librsvg/librsvg-dev: PV changed from "2.54.4" to "2.54.5"
packages/core2-32-poky-linux/librsvg/librsvg-dev: PKGV changed from 2.54.4 [default] to 2.54.5 [default]
packages/core2-32-poky-linux/librsvg/librsvg-doc: PV changed from "2.54.4" to "2.54.5"
packages/core2-32-poky-linux/librsvg/librsvg-doc: PKGV changed from 2.54.4 [default] to 2.54.5 [default]
packages/core2-32-poky-linux/librsvg/librsvg-gtk: PV changed from "2.54.4" to "2.54.5"
packages/core2-32-poky-linux/librsvg/librsvg-gtk: PKGV changed from 2.54.4 [default] to 2.54.5 [default]
packages/core2-32-poky-linux/librsvg/librsvg-locale: PV changed from "2.54.4" to "2.54.5"
packages/core2-32-poky-linux/librsvg/librsvg-locale: PKGV changed from 2.54.4 [default] to 2.54.5 [default]
packages/core2-32-poky-linux/librsvg/librsvg-src: PV changed from "2.54.4" to "2.54.5"
packages/core2-32-poky-linux/librsvg/librsvg-src: PKGV changed from 2.54.4 [default] to 2.54.5 [default]
packages/core2-32-poky-linux/librsvg/librsvg-staticdev: PV changed from "2.54.4" to "2.54.5"
packages/core2-32-poky-linux/librsvg/librsvg-staticdev: PKGV changed from 2.54.4 [default] to 2.54.5 [default]
packages/core2-32-poky-linux/librsvg/librsvg: PV changed from "2.54.4" to "2.54.5"
packages/core2-32-poky-linux/librsvg/librsvg: PKGSIZE changed from 12214487 to 12239143 (+0%)
packages/core2-32-poky-linux/librsvg/librsvg: PKGV changed from 2.54.4 [default] to 2.54.5 [default]
packages/core2-32-poky-linux/librsvg/rsvg: PV changed from "2.54.4" to "2.54.5"
packages/core2-32-poky-linux/librsvg/rsvg: PKGSIZE changed from 5969560 to 5953192 (-0%)
packages/core2-32-poky-linux/librsvg/rsvg: PKGV changed from 2.54.4 [default] to 2.54.5 [default]

--===============6288266774911373381==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-librsvg-upgrade-2.54.4-2.54.5.patch"

RnJvbSA0YTdjNjg2NDg1OWQ2ZTBmMjdjNWU3N2JjNzM4NjJmOGFjODdlNTIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAwOToxNDo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnJzdmc6IHVwZ3JhZGUgMi41NC40IC0+IDIuNTQuNQoKLS0tCiAuLi4vbGlicnN2Zy97bGlicnN2
Z18yLjU0LjQuYmIgPT4gbGlicnN2Z18yLjU0LjUuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ25vbWUvbGlicnN2Zy97bGlicnN2Z18yLjU0LjQuYmIgPT4gbGlicnN2Z18yLjU0LjUu
YmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnJzdmcvbGlicnN2
Z18yLjU0LjQuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGlicnN2Zy9saWJyc3ZnXzIuNTQuNS5i
YgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvbGli
cnN2Zy9saWJyc3ZnXzIuNTQuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2xpYnJz
dmcvbGlicnN2Z18yLjU0LjUuYmIKaW5kZXggODJiMWJmOWJjZS4uZmM1MmFlNjFjNSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnJzdmcvbGlicnN2Z18yLjU0LjQuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWdub21lL2xpYnJzdmcvbGlicnN2Z18yLjU0LjUuYmIKQEAgLTIwLDcgKzIw
LDcgQEAgU1JDX1VSSSArPSAiZmlsZTovLzAwMDEtTWFrZWZpbGUuYW0tcGFzcy1ydXN0LXRhcmdl
dC10by1jYXJnby1hbHNvLXdoZW4tbm90LS5wYXQKICAgICAgICAgICAgZmlsZTovLzAwMDEtc3lz
dGVtLWRlcHMtc3JjLWxpYi5ycy1kby1ub3QtcHJvYmUtaW50by1oYXJjb2RlZC1saS5wYXRjaCBc
CiAgICAgICAgICAgICIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiZWExNTJhMjQz
ZjZhNDNjMGUwMzZhMjhjNzBkZTNmY2JjZGVhNTY2NGM2ODExYzc4NTkyYmMyMjllY2MyNDgzMyIK
K1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjRmMDMxOTBmNDUzMjRkMWZhMWY1MmE3OWRm
Y2RlZDFmNjRlYWY0OWIzYWUyZjg4ZWVkYWIwYzA3NjE3Y2FlNmUiCiAKICMgbGlicnN2ZyBpcyBz
dGlsbCBhdXRvdG9vbHMtYmFzZWQsIGJ1dCBpcyBjYWxsaW5nIGNhcmdvIGZyb20gaXRzIGF1dG9t
YWtlLWRyaXZlbiBtYWtlZmlsZXMKICMgc28gd2UgY2Fubm90IHVzZSBjYXJnbyBjbGFzcyBkaXJl
Y3RseSwgYnV0IHN0aWxsIG5lZWQgYml0cyBhbmQgcGllY2VzIGZyb20gaXQgCi0tIAoyLjMxLjEK
Cg==

--===============6288266774911373381==--

