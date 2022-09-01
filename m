Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A130BC6FD25
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:57 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web08.12623.1662040786134342915
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QS1D3XMK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010182f959bfdc-6da37c59-074c-4075-b87b-151b78e7fc44-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Fwk7Mm3vt0dbvaBBAPXfE0t11yYwWZmBl+JNiQyHXAw=;
	b=QS1D3XMKQOLPvxxDrGpMQLEN7ypy/bClEi5iMZdrcBxAZNEBHI7hajxWxtYFwvMv
	gDkF5f2MYdVOaEiDeocNIp68GvgECNx5Rj7351u7+9PY/T14LKIX/NV5OHP9It1BzOu
	ZvIn3eAAwfOfvdKW63H8pz8NJKM+iTjK+iwx0xs4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Fwk7Mm3vt0dbvaBBAPXfE0t11yYwWZmBl+JNiQyHXAw=;
	b=R9ScUD0q9dFqrnQeX3y9dJhUlehLaYV8LNIRXjek/zlTUTyAN0z2P5y0C/km2PEY
	/Vnr1iQOq+5yOJsnsRNBmNKGuo2W/ksRctukhG+P1Pkyfq+3MNUO33CTsOwwy0XXfSz
	ZoVoHg4pK2iZJvwQJm38drqd/mPqrmMAJesZdb4U=
Content-Type: multipart/mixed; boundary="===============5321249154720435196=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.37.3 SUCCEEDED
Message-ID: 
 <01010182f959bfdc-6da37c59-074c-4075-b87b-151b78e7fc44-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:44 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170171

--===============5321249154720435196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *git* to *2.37.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.37.2-2.37.3.patch
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
--===============5321249154720435196==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.37.2-2.37.3.patch"

RnJvbSAzZGYyMjFmMWJjN2FjOTZmMTc4MDg3ZTQ4YTdjNDk0Mjg2ZTg2YzgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAwNjozNDoxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdp
dDogdXBncmFkZSAyLjM3LjIgLT4gMi4zNy4zCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9n
aXQve2dpdF8yLjM3LjIuYmIgPT4gZ2l0XzIuMzcuMy5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2l0L3tnaXRfMi4zNy4yLmJiID0+IGdpdF8yLjM3LjMuYmJ9ICg5OCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi4zNy4yLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2dpdC9naXRfMi4zNy4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuMzcuMi5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi4zNy4zLmJiCmluZGV4IGI3ODU4ZTJlNDYu
LjJlZWQ4NWU4MDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIu
MzcuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjM3LjMuYmIKQEAg
LTE2NSw0ICsxNjUsNCBAQCBFWFRSQV9PRUNPTkYgKz0gImFjX2N2X3NucHJpbnRmX3JldHVybnNf
Ym9ndXM9bm8gXAogICAgICAgICAgICAgICAgICAiCiBFWFRSQV9PRU1BS0UgKz0gIk5PX0dFVFRF
WFQ9MSIKIAotU1JDX1VSSVt0YXJiYWxsLnNoYTI1NnN1bV0gPSAiNGM0Mjg5MDhlM2EyZGNhNDE3
NGRmNmVmNDlhY2M5OTVhNGZkYjFiNDUyMDVhMmM3OTc5NDQ4N2EzM2JjMDZlNSIKK1NSQ19VUklb
dGFyYmFsbC5zaGEyNTZzdW1dID0gIjE4MWY2NTU4NzE1NWVhNDhjNjgyZjYzMTM1Njc4ZWM1MzA1
NWFkZjE1MzI0Mjg3NTI5MTJkMzU2ZTQ2YjY0YTgiCi0tIAoyLjMxLjEKCg==

--===============5321249154720435196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/git/git-bash-completion: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git/git-bash-completion: PV changed from "2.37.2" to "2.37.3"
packages/core2-32-poky-linux/git/git-dbg: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git/git-dbg: PKGSIZE changed from 69653236 to 69676308 (+0%)
packages/core2-32-poky-linux/git/git-dbg: PV changed from "2.37.2" to "2.37.3"
packages/core2-32-poky-linux/git/git-dev: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git/git-dev: PV changed from "2.37.2" to "2.37.3"
packages/core2-32-poky-linux/git/git-doc: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git/git-doc: PV changed from "2.37.2" to "2.37.3"
packages/core2-32-poky-linux/git/git-locale: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git/git-locale: PV changed from "2.37.2" to "2.37.3"
packages/core2-32-poky-linux/git/git-perltools: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git/git-perltools: PV changed from "2.37.2" to "2.37.3"
packages/core2-32-poky-linux/git/git-src: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git/git-src: PKGSIZE changed from 8736766 to 8740756 (+0%)
packages/core2-32-poky-linux/git/git-src: PV changed from "2.37.2" to "2.37.3"
packages/core2-32-poky-linux/git/git-staticdev: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git/git-staticdev: PV changed from "2.37.2" to "2.37.3"
packages/core2-32-poky-linux/git/git-tk: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git/git-tk: PV changed from "2.37.2" to "2.37.3"
packages/core2-32-poky-linux/git/git: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git/git: PKGSIZE changed from 24221194 to 24229612 (+0%)
packages/core2-32-poky-linux/git/git: PV changed from "2.37.2" to "2.37.3"
packages/core2-32-poky-linux/git/gitweb: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git/gitweb: PV changed from "2.37.2" to "2.37.3"
packages/core2-32-poky-linux/git: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.37.2.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.37.3.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"
packages/core2-32-poky-linux/git: PV changed from "2.37.2" to "2.37.3"

--===============5321249154720435196==--

