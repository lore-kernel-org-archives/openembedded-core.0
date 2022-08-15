Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D8FFC32757
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:02 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web09.6463.1660589821223422996
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kRRFtzdv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010182a2ddc95d-6c231711-1fe6-4a6a-949e-435fd633ea71-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=T/fiUkL2wrF8i9GGa+Bfilr7+CqSHtrAumu6zVAh1Kk=;
	b=kRRFtzdvDg9tXQ9pVWD1m6yTiZji+vFYMZ73B+h2/Y+RulDe+F1mazoNRAkd3AaF
	iqRSJZviIA7ouCecMJ8a4E/7F0GMMuMcnP5no5qQNgxNNQvt5ki2T5/zDaJWNLWn3ER
	rJ7JENHSBCLJtoMkADZekWred35/qNqkYblE4Fm8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=T/fiUkL2wrF8i9GGa+Bfilr7+CqSHtrAumu6zVAh1Kk=;
	b=MELjXqRHCKIexTwaa6i8C6GcYbauxUyzmkylTRj2o2VIC5yj53Moi/KfbJaO0dC9
	bCAcSgfW8C1FvuK2c+BDT1NN1qCRl4eKrbl26F1CpKKd5nwSDQiBtlAYaWvbz1Ftryy
	rvMy570rKsw0F1uYVWePYY4I77HFHbcDUhO2X2d8=
Content-Type: multipart/mixed; boundary="===============2077561167188851706=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rsync: upgrading to 3.2.5 SUCCEEDED
Message-ID: 
 <01010182a2ddc95d-6c231711-1fe6-4a6a-949e-435fd633ea71-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:57:00 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169383

--===============2077561167188851706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rsync* to *3.2.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rsync-upgrade-3.2.4-3.2.5.patch
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
--===============2077561167188851706==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rsync-upgrade-3.2.4-3.2.5.patch"

RnJvbSBlNzE2YTc0N2ViZWE5MDkzMTZjNTEyNjdjMTFjZDcyNzY4NWNiNWMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMDg6NTQ6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
c3luYzogdXBncmFkZSAzLjIuNCAtPiAzLjIuNQoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnN5bmMve3JzeW5jXzMuMi40LmJiID0+IHJzeW5jXzMuMi41LmJifSB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9yc3luYy97cnN5bmNfMy4yLjQuYmIgPT4gcnN5bmNfMy4yLjUuYmJ9ICg5NiUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL3JzeW5jXzMuMi40LmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL3JzeW5jXzMuMi41LmJiCnNpbWlsYXJpdHkg
aW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9yc3luY18z
LjIuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL3JzeW5jXzMuMi41
LmJiCmluZGV4IGU2ZjkxN2I1Y2QuLmU0M2YzNWVhMmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9yc3luYy9yc3luY18zLjIuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnN5bmMvcnN5bmNfMy4yLjUuYmIKQEAgLTE2LDcgKzE2LDcgQEAgU1JDX1VSSSA9ICJodHRw
czovL2Rvd25sb2FkLnNhbWJhLm9yZy9wdWIvJHtCUE59L3NyYy8ke0JQfS50YXIuZ3ogXAogICAg
ICAgICAgICBmaWxlOi8vZGV0ZXJtaXNtLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNmY3NjE4MzhkMDgwNTJiMGI2NTc5Y2Y3ZjY3MzdkOTNlNDdmMDFmNGRh
MDRjNWQyNGQzNDQ3YjdmMmE1ZmFkMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyYWM0ZDIxNjM1
Y2RmNzkxODY3YmMzNzdjMzVjYTZkZGE3ZjUwZDkxOWE1OGJlNDUwNTdmZDUxNjAwYzY5YWJhIgog
CiAjIC0xNjU0OCByZXF1aXJlZCBmb3IgdjMuMS4zcHJlMS4gQWxyZWFkeSBpbiB2My4xLjMuCiBD
VkVfQ0hFQ0tfSUdOT1JFICs9ICIgQ1ZFLTIwMTctMTY1NDggIgotLSAKMi4zMS4xCgo=

--===============2077561167188851706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/rsync: PV changed from "3.2.4" to "3.2.5"
packages/core2-32-poky-linux/rsync: SRC_URI changed from "https://download.samba.org/pub/rsync/src/rsync-3.2.4.tar.gz file://rsyncd.conf file://makefile-no-rebuild.patch file://determism.patch" to "https://download.samba.org/pub/rsync/src/rsync-3.2.5.tar.gz file://rsyncd.conf file://makefile-no-rebuild.patch file://determism.patch"
packages/core2-32-poky-linux/rsync: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/core2-32-poky-linux/rsync/rsync-dbg: PV changed from "3.2.4" to "3.2.5"
packages/core2-32-poky-linux/rsync/rsync-dbg: PKGSIZE changed from 1131656 to 1140208 (+1%)
packages/core2-32-poky-linux/rsync/rsync-dbg: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/core2-32-poky-linux/rsync/rsync-dev: PV changed from "3.2.4" to "3.2.5"
packages/core2-32-poky-linux/rsync/rsync-dev: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/core2-32-poky-linux/rsync/rsync-doc: PV changed from "3.2.4" to "3.2.5"
packages/core2-32-poky-linux/rsync/rsync-doc: PKGSIZE changed from 280939 to 291486 (+4%)
packages/core2-32-poky-linux/rsync/rsync-doc: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/core2-32-poky-linux/rsync/rsync-locale: PV changed from "3.2.4" to "3.2.5"
packages/core2-32-poky-linux/rsync/rsync-locale: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/core2-32-poky-linux/rsync/rsync-src: PV changed from "3.2.4" to "3.2.5"
packages/core2-32-poky-linux/rsync/rsync-src: PKGSIZE changed from 1611114 to 1620900 (+1%)
packages/core2-32-poky-linux/rsync/rsync-src: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/core2-32-poky-linux/rsync/rsync-staticdev: PV changed from "3.2.4" to "3.2.5"
packages/core2-32-poky-linux/rsync/rsync-staticdev: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/core2-32-poky-linux/rsync/rsync: PV changed from "3.2.4" to "3.2.5"
packages/core2-32-poky-linux/rsync/rsync: PKGSIZE changed from 614566 to 622790 (+1%)
packages/core2-32-poky-linux/rsync/rsync: PKGV changed from 3.2.4 [default] to 3.2.5 [default]

--===============2077561167188851706==--

