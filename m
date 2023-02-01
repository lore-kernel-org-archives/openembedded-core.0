Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFD6C63797
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:23 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.30369.1675272861168342215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=K7rBDb8b;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101860e0b335b-76232b24-7689-4548-af6a-13ca9252d5e9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272860;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=v+1WAajowlIJPblfPB6amC7ULJBLu/RgxwrVU05LUHI=;
	b=K7rBDb8bjuGZbBgi2FN81TXVJ+sxpsUR2JFh3epwvAFOaCY6PYX43Vy7cBHxdsUI
	qu0nA84h/Vitubaxvql/4pHSpRgjSzUs2Ttc+I/pGDuHijAH8ipjyn1neWvGCzmetNV
	q0sAUE5TbBK/kaQaYkQ7tC3GhpkAKL6KIVhSz35U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272860;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=v+1WAajowlIJPblfPB6amC7ULJBLu/RgxwrVU05LUHI=;
	b=j/O/vZOVZy/DusJW2Z/RId9d4CJFSOk5IiBEu7A6bgPdtzaFGnbSqrc4eBC5Qecr
	pJ+7CqRPubEyewUik6nGWsYkoqvy9B12u0aARJX5eMLA6PCwdgiIqtZ7RKF7GSot00i
	8nt74eOcqQ58l61d+JmhxY506gmB1Lvf2CZYv2Oc=
Content-Type: multipart/mixed; boundary="===============3953152589540920029=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libgit2: upgrading to 1.5.1 SUCCEEDED
Message-ID: <010101860e0b335b-76232b24-7689-4548-af6a-13ca9252d5e9-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176652

--===============3953152589540920029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgit2* to *1.5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgit2-upgrade-1.5.0-1.5.1.patch
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
--===============3953152589540920029==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgit2-upgrade-1.5.0-1.5.1.patch"

RnJvbSBhYTI2OTg2YzExYjgxMmJjZmI5MTRmYTMyMGJlZTZmMWNhYWZhZTNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNzoyOTowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmdpdDI6IHVwZ3JhZGUgMS41LjAgLT4gMS41LjEKCi0tLQogLi4uL2xpYmdpdDIve2xpYmdpdDJf
MS41LjAuYmIgPT4gbGliZ2l0Ml8xLjUuMS5iYn0gICAgICAgICAgICB8IDQgKystLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJnaXQyL3tsaWJnaXQyXzEuNS4wLmJiID0+IGxpYmdpdDJfMS41LjEu
YmJ9ICg3OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2l0Mi9saWJn
aXQyXzEuNS4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2l0Mi9saWJnaXQyXzEuNS4x
LmJiCnNpbWlsYXJpdHkgaW5kZXggNzglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYmdpdDIvbGliZ2l0Ml8xLjUuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGliZ2l0Mi9saWJnaXQyXzEuNS4xLmJiCmluZGV4IGVlNGQ3OWIxMWEuLjU5ODY2Y2UzODUgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdpdDIvbGliZ2l0Ml8xLjUuMC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnaXQyL2xpYmdpdDJfMS41LjEuYmIKQEAgLTUs
OCArNSw4IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTExMmU2YmI0
MjFkZWE3M2NkNDFkZTA5ZTc3N2YyZDJjIgogCiBERVBFTkRTID0gImN1cmwgb3BlbnNzbCB6bGli
IGxpYnNzaDIgbGliZ2NyeXB0IGxpYnBjcmUyIgogCi1TUkNfVVJJID0gImdpdDovL2dpdGh1Yi5j
b20vbGliZ2l0Mi9saWJnaXQyLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcyIKLVNSQ1JF
ViA9ICJmYmVhNDM5ZDRiNmZjOTFjNmI2MTlkMDFiODVhYjNiNzc0NmU0YzE5IgorU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL2xpYmdpdDIvbGliZ2l0Mi5naXQ7YnJhbmNoPW1haW50L3YxLjU7
cHJvdG9jb2w9aHR0cHMiCitTUkNSRVYgPSAiNDJlNWRiOThiOTYzYWU1MDMyMjljNjNlNDRlMDZl
NDM5ZGY1MGU1NiIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi4zNy4zCgo=

--===============3953152589540920029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libgit2: PV changed from "1.5.0" to "1.5.1"
packages/core2-32-poky-linux/libgit2: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
packages/core2-32-poky-linux/libgit2: SRC_URI changed from "git://github.com/libgit2/libgit2.git;branch=main;protocol=https" to "git://github.com/libgit2/libgit2.git;branch=maint/v1.5;protocol=https"
packages/core2-32-poky-linux/libgit2/libgit2-dbg: FILELIST: removed "/usr/lib/.debug/libgit2.so.1.5.0", added "/usr/lib/.debug/libgit2.so.1.5.1"
packages/core2-32-poky-linux/libgit2/libgit2-dbg: PV changed from "1.5.0" to "1.5.1"
packages/core2-32-poky-linux/libgit2/libgit2-dbg: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-dev: PV changed from "1.5.0" to "1.5.1"
packages/core2-32-poky-linux/libgit2/libgit2-dev: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-doc: PV changed from "1.5.0" to "1.5.1"
packages/core2-32-poky-linux/libgit2/libgit2-doc: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-locale: PV changed from "1.5.0" to "1.5.1"
packages/core2-32-poky-linux/libgit2/libgit2-locale: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-src: PV changed from "1.5.0" to "1.5.1"
packages/core2-32-poky-linux/libgit2/libgit2-src: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-src: PKGSIZE changed from 4061229 to 4067752 (+0%)
packages/core2-32-poky-linux/libgit2/libgit2-staticdev: PV changed from "1.5.0" to "1.5.1"
packages/core2-32-poky-linux/libgit2/libgit2-staticdev: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2: FILELIST: removed "/usr/lib/libgit2.so.1.5.0", added "/usr/lib/libgit2.so.1.5.1"
packages/core2-32-poky-linux/libgit2/libgit2: PV changed from "1.5.0" to "1.5.1"
packages/core2-32-poky-linux/libgit2/libgit2: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
Changes to packages/core2-32-poky-linux/libgit2 (sysroot):
  /usr/lib/libgit2.so.1.5 changed symlink target from libgit2.so.1.5.0 to libgit2.so.1.5.1
  /usr/lib/libgit2.so.1.5.0 moved to /usr/lib/libgit2.so.1.5.1

--===============3953152589540920029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libgit2/libgit2: FILELIST: removed "/usr/lib/libgit2.so.1.5.0", added "/usr/lib/libgit2.so.1.5.1"
Changes to packages/core2-32-poky-linux/libgit2 (sysroot):
  /usr/lib/libgit2.so.1.5 changed symlink target from libgit2.so.1.5.0 to libgit2.so.1.5.1
  /usr/lib/libgit2.so.1.5.0 moved to /usr/lib/libgit2.so.1.5.1

--===============3953152589540920029==--

