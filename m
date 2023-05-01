Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F51C83003
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:51 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.107429.1682976350436536020
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aTRRlGwb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010187d9351e6a-643a3143-16b7-4f47-b251-b54c247e7ca9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NFBR2m6CIWsDcE/oyz+WNQrrBVDtaFxdnfKT6NmbDh0=;
	b=aTRRlGwbZ+6OHfqPBb6mCg0uJTkg1WhiyPLOQDMzHpsG38JNO+XKNlvUFAVqptG1
	pWF89k5dDa+9jPdnzf7526+dS9PuGFKpIyd2g+YbLfUIJnIcPILdqu3BQHxQBs0qjwK
	1U6Y/WAbOgEu8CsHoNV/XDPWgycVeaAA8n862/ao=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NFBR2m6CIWsDcE/oyz+WNQrrBVDtaFxdnfKT6NmbDh0=;
	b=dTvI5gtQPRJ4OZA165ympXVlofD2+RmiqJpH49X6GjyafuGfxHY/MyS/EQZbUz+i
	I3emEmG5xpHn04WF8lfynEoZjUBddtlPNcDV8VDe+oG6lJLDFFJHEDPgnVClS9NBFzE
	w6XzKld8NosCtYB621rdir1gvWYGOIhuCXhevPRU=
Content-Type: multipart/mixed; boundary="===============5059781727994614808=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dbusmock: upgrading to 0.29.0 SUCCEEDED
Message-ID: <01010187d9351e6a-643a3143-16b7-4f47-b251-b54c247e7ca9-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180617

--===============5059781727994614808==
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
--===============5059781727994614808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dbusmock: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
packages/core2-32-poky-linux/python3-dbusmock: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/python-dbusmock/python-dbusmock-0.28.7.tar.gz;downloadfilename=python-dbusmock-0.28.7.tar.gz" to "https://files.pythonhosted.org/packages/source/p/python-dbusmock/python-dbusmock-0.29.0.tar.gz;downloadfilename=python-dbusmock-0.29.0.tar.gz"
packages/core2-32-poky-linux/python3-dbusmock: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dev: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-dev: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-doc: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-doc: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-locale: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-locale: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-src: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-src: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PKGV changed from 0.28.7 [default] to 0.29.0 [default]
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PV changed from "0.28.7" to "0.29.0"
packages/core2-32-poky-linux/python3-dbusmock/python3-dbusmock: PKGSIZE changed from 454922 to 457628 (+1%)
Changes to packages/core2-32-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.11/site-packages/python_dbusmock-0.28.7.dist-info moved to /usr/lib/python3.11/site-packages/python_dbusmock-0.29.0.dist-info

--===============5059781727994614808==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dbusmock-upgrade-0.28.7-0.29.0.patch"

RnJvbSA5YmNlNzBiY2RmYzkyZDM2MmFiOTJjNTFkMTQwNDY1ZDhjOWFiMjNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxMDoyNDozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
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

--===============5059781727994614808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.11/site-packages/python_dbusmock-0.28.7.dist-info moved to /usr/lib/python3.11/site-packages/python_dbusmock-0.29.0.dist-info

--===============5059781727994614808==--

