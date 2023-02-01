Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2F6C7EE2E
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.30004.1675272854805528539
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=i489HTeK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101860e0b194d-92866d98-84ac-457a-bce7-a400aac0bc05-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XX5KCAn/U01vLGS54Qh9W/KXtNGlMmQyrzVM0vjv/+c=;
	b=i489HTeKCz4zFdbaMLujWsrELh7lCMIsciEAQcji/zcOxQXKmJkwNnWMzl5V5cID
	a5/45u2FfiYFlVsCHIw+DSfn3eGsk9fFGNxVUNqpcMSQPgvleTWF8c5z/ARSRCQP/jU
	MDmgtBYVWgk36n5wUWMrcuvEJO7XozkJlWuD0EVU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XX5KCAn/U01vLGS54Qh9W/KXtNGlMmQyrzVM0vjv/+c=;
	b=FKOg2tMJbb3GlPc6Zy1qyCcyG/HboJ+uZPvMvMoggXa3z9sWnpOkdFHJBnhLx20S
	3QT0yp3XHXrEqRV1ZVx6v6G89TGd7ndCR9De3xatX5ttcK8xwXy4U0MHq0sUvkklr7Q
	9BtrjW4sv/TY3cOqRjrT2cSdgEpE35rviDVludaQ=
Content-Type: multipart/mixed; boundary="===============5042616439456454406=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.39.1 SUCCEEDED
Message-ID: <010101860e0b194d-92866d98-84ac-457a-bce7-a400aac0bc05-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176582

--===============5042616439456454406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *git* to *2.39.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.39.0-2.39.1.patch
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
--===============5042616439456454406==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.39.0-2.39.1.patch"

RnJvbSAyNDFhYWY3ZjNlODFlZjU4ZmIxNjM5YmY2ZDM3YjkxOTBmYjcwNzc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAwODo0MzozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdp
dDogdXBncmFkZSAyLjM5LjAgLT4gMi4zOS4xCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9n
aXQve2dpdF8yLjM5LjAuYmIgPT4gZ2l0XzIuMzkuMS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2l0L3tnaXRfMi4zOS4wLmJiID0+IGdpdF8yLjM5LjEuYmJ9ICg5OCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi4zOS4wLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2dpdC9naXRfMi4zOS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuMzkuMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi4zOS4xLmJiCmluZGV4IDM2MjJiOTcwOWQu
Ljg1NzdkODZlYWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIu
MzkuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjM5LjEuYmIKQEAg
LTE2Niw0ICsxNjYsNCBAQCBFWFRSQV9PRUNPTkYgKz0gImFjX2N2X3NucHJpbnRmX3JldHVybnNf
Ym9ndXM9bm8gXAogICAgICAgICAgICAgICAgICAiCiBFWFRSQV9PRU1BS0UgKz0gIk5PX0dFVFRF
WFQ9MSIKIAotU1JDX1VSSVt0YXJiYWxsLnNoYTI1NnN1bV0gPSAiZDkyOWZlNjdjZWY3YWMzY2E3
MDlkMmI1NmE5OTIwZjE3MTEyZDVhNTI0YmY4MTEyYWYzN2VjMDQ1YTdhNTEwOSIKK1NSQ19VUklb
dGFyYmFsbC5zaGEyNTZzdW1dID0gImFlOGQzNDI3ZTRjY2Q2NzdhYmM5MzFmMTYxODNjMGVjOTUz
ZTNiZmNkODY2NDkzNjAxMzUxZTA0YTJiOTczOTgiCi0tIAoyLjM3LjMKCg==

--===============5042616439456454406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/git/git-bash-completion: PV changed from "2.39.0" to "2.39.1"
packages/core2-32-poky-linux/git/git-bash-completion: PKGV changed from 2.39.0 [default] to 2.39.1 [default]
packages/core2-32-poky-linux/git/git-dbg: PKGSIZE changed from 77918076 to 77937656 (+0%)
packages/core2-32-poky-linux/git/git-dbg: PV changed from "2.39.0" to "2.39.1"
packages/core2-32-poky-linux/git/git-dbg: PKGV changed from 2.39.0 [default] to 2.39.1 [default]
packages/core2-32-poky-linux/git/git-dev: PV changed from "2.39.0" to "2.39.1"
packages/core2-32-poky-linux/git/git-dev: PKGV changed from 2.39.0 [default] to 2.39.1 [default]
packages/core2-32-poky-linux/git/git-doc: PV changed from "2.39.0" to "2.39.1"
packages/core2-32-poky-linux/git/git-doc: PKGV changed from 2.39.0 [default] to 2.39.1 [default]
packages/core2-32-poky-linux/git/git-locale: PV changed from "2.39.0" to "2.39.1"
packages/core2-32-poky-linux/git/git-locale: PKGV changed from 2.39.0 [default] to 2.39.1 [default]
packages/core2-32-poky-linux/git/git-perltools: PV changed from "2.39.0" to "2.39.1"
packages/core2-32-poky-linux/git/git-perltools: PKGV changed from 2.39.0 [default] to 2.39.1 [default]
packages/core2-32-poky-linux/git/git-src: PKGSIZE changed from 8946625 to 8951005 (+0%)
packages/core2-32-poky-linux/git/git-src: PV changed from "2.39.0" to "2.39.1"
packages/core2-32-poky-linux/git/git-src: PKGV changed from 2.39.0 [default] to 2.39.1 [default]
packages/core2-32-poky-linux/git/git-staticdev: PV changed from "2.39.0" to "2.39.1"
packages/core2-32-poky-linux/git/git-staticdev: PKGV changed from 2.39.0 [default] to 2.39.1 [default]
packages/core2-32-poky-linux/git/git-tk: PV changed from "2.39.0" to "2.39.1"
packages/core2-32-poky-linux/git/git-tk: PKGV changed from 2.39.0 [default] to 2.39.1 [default]
packages/core2-32-poky-linux/git/git: PKGSIZE changed from 27179056 to 27196624 (+0%)
packages/core2-32-poky-linux/git/git: PV changed from "2.39.0" to "2.39.1"
packages/core2-32-poky-linux/git/git: PKGV changed from 2.39.0 [default] to 2.39.1 [default]
packages/core2-32-poky-linux/git/gitweb: PV changed from "2.39.0" to "2.39.1"
packages/core2-32-poky-linux/git/gitweb: PKGV changed from 2.39.0 [default] to 2.39.1 [default]
packages/core2-32-poky-linux/git: PV changed from "2.39.0" to "2.39.1"
packages/core2-32-poky-linux/git: PKGV changed from 2.39.0 [default] to 2.39.1 [default]
packages/core2-32-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.39.0.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.39.1.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"

--===============5042616439456454406==--

