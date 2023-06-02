Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF90CCA462
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:46 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.7627.1685693431792338926
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Dk0orvfV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101887b2880c3-4d52f290-17e6-4495-b682-13ef734315f9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=B4Hrse4Sl/rogTD6r1hanQ5wPQ0jBORgBSyF7bSqGfA=;
	b=Dk0orvfVZ0iQhMtqXt+T/TYT4MC5+WFEDw7vewSYc9Gj1H2ZhfzIkt95aRYzj6ws
	cGKVnDo3q1LNC12VbWsOVGU3vqHlc/P+uQArxSB5W2KQDzw1taUH6aSNRP7UD9KAvHn
	UibnIKX818auNCB2Q+R32EKApQx97kck77nQhICY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=B4Hrse4Sl/rogTD6r1hanQ5wPQ0jBORgBSyF7bSqGfA=;
	b=c911+ibOg1sYZWG72iHhu4DOQECyWlvtdyhh/Wwyw7UrDRqp7fRx6/lKCg+2z5H6
	mkNEQZwJjeq+EUiH7bD2150ZVVCShgn6lRvAdvNyOPtgKVWtT1yEMLzilw+iTzpgIim
	5KNZb/jbISkVPLn+FTVr6/7VsmJSdlSoNIQBl9J0=
Content-Type: multipart/mixed; boundary="===============1165146468230971796=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dbusmock: upgrading to 0.29.0 SUCCEEDED
Message-ID: <010101887b2880c3-4d52f290-17e6-4495-b682-13ef734315f9-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182178

--===============1165146468230971796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dbusmock* to *0.29.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dbusmock-upgrade-0.28.7-0.29.0.patch
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
--===============1165146468230971796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.11/site-packages/python_dbusmock-0.28.7.dist-info moved to /usr/lib/python3.11/site-packages/python_dbusmock-0.29.0.dist-info

--===============1165146468230971796==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dbusmock-upgrade-0.28.7-0.29.0.patch"

RnJvbSA3NmViZjE3ODY4OTI4MjNkYzlhN2JmYjgxM2Y4YTgyNjhmOTdjMjY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxNDoyMzo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZGJ1c21vY2s6IHVwZ3JhZGUgMC4yOC43IC0+IDAuMjkuMAoKLS0tCiAuLi4ve3B5dGhv
bjMtZGJ1c21vY2tfMC4yOC43LmJiID0+IHB5dGhvbjMtZGJ1c21vY2tfMC4yOS4wLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWRidXNtb2NrXzAuMjguNy5i
YiA9PiBweXRob24zLWRidXNtb2NrXzAuMjkuMC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZGJ1c21vY2tfMC4yOC43LmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRidXNtb2NrXzAuMjkuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtZGJ1c21vY2tfMC4yOC43LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZGJ1c21vY2tfMC4yOS4wLmJiCmluZGV4IDRlYTIxYTU2ZWEuLjMy
YTQzZTAwYjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1kYnVzbW9ja18wLjI4LjcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWRidXNtb2NrXzAuMjkuMC5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0
cHM6Ly9weXBpLm9yZy9wcm9qZWN0L3B5dGhvbi1kYnVzbW9jay8iCiBMSUNFTlNFID0gIkdQTC0z
LjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWU2YTYwMGZk
NWUxZDljYmRlMmQ5ODM2ODAyMzNhZDAyIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDc4Njk3
Nzc1MGRiY2JkZTZlMjU1MzMzOWEyZTY2ZDlhOGQ0NDUzZDVjODQ4Yjk0NWU4ZmQxYmFkYjczNmZm
ZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzZWZkYjNkODAwMzg2YjY1ZTg4NTRkOGVlNDUzODc2
NDI0MTM4MmI0ZTY2NDQyM2FkN2Q5NTljOTAwOGRkNDA4IgogCiBQWVBJX1BBQ0tBR0UgPSAicHl0
aG9uLWRidXNtb2NrIgogCi0tIAoyLjM5LjIKCg==

--===============1165146468230971796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dbusmock: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/python-dbusmock/python-dbusmock-0.28.7.tar.gz;downloadfilename=python-dbusmock-0.28.7.tar.gz" to "https://files.pythonhosted.org/packages/source/p/python-dbusmock/python-dbusmock-0.29.0.tar.gz;downloadfilename=python-dbusmock-0.29.0.tar.gz"
packages/core2-32-poky-linux/python3-dbusmock: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dev: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dev: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-doc: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-doc: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-locale: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-locale: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-src: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-src: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PKGSIZE changed from 454922 to 457628 (+1%)
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
Changes to packages/core2-32-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.11/site-packages/python_dbusmock-0.28.7.dist-info moved to /usr/lib/python3.11/site-packages/python_dbusmock-0.29.0.dist-info

--===============1165146468230971796==--

