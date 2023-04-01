Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F36CA9EAB
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.32129.1680384533739890735
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LxXhF4kP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101873eb9251d-4e204f84-5cea-4053-bca0-142beeb5cee9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pwKwA++tbPNPr9CP00VOt9S+B5ce3mMFgtBM/kf2trg=;
	b=LxXhF4kPtX6JJ6kGLulA1PBzsT0ASMB55NuNy4roKYieE+2ZUsL0qgfIkgFVEoi7
	kxQJF9neejKgCUVXD6YEIW5Xz6HsIDvywEYDE8n9CVaJmWRjkOD2RNAxUQTxL3nCwtZ
	Q7vPjrAgkZHqWmvX/mUjO+UXu+rIPHV4yUqfnUek=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pwKwA++tbPNPr9CP00VOt9S+B5ce3mMFgtBM/kf2trg=;
	b=Kq2H/AWz6d70PjEEdx/N+B8B7DhNMSgVi/x8ThNlLIu9cyMYX2apmRCIAvz0ZJfg
	14uGUQYpYS+l7mpgD5dwCdkkZQ3LJmvIz2p2wvMKpn4LxnAivrViuf5iuw+eVLzUSbo
	X1xENn5TKSb64r15HehFnZs+XL9GD2RMWG54jXCA=
Content-Type: multipart/mixed; boundary="===============1690069560768521060=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-importlib-metadata: upgrading to 6.1.0 SUCCEEDED
Message-ID: <010101873eb9251d-4e204f84-5cea-4053-bca0-142beeb5cee9-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179483

--===============1690069560768521060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-importlib-metadata* to *6.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-importlib-metadata-upgrade-6.0.0-6.1.0.patch
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
--===============1690069560768521060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-importlib-metadata: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/python3-importlib-metadata: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-6.0.0.tar.gz;downloadfilename=importlib_metadata-6.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-6.1.0.tar.gz;downloadfilename=importlib_metadata-6.1.0.tar.gz"
packages/core2-32-poky-linux/python3-importlib-metadata: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGSIZE changed from 133685 to 134262 (+0%)
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.11/site-packages/importlib_metadata-6.0.0.dist-info moved to /usr/lib/python3.11/site-packages/importlib_metadata-6.1.0.dist-info

--===============1690069560768521060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.11/site-packages/importlib_metadata-6.0.0.dist-info moved to /usr/lib/python3.11/site-packages/importlib_metadata-6.1.0.dist-info

--===============1690069560768521060==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-importlib-metadata-upgrade-6.0.0-6.1.0.patch"

RnJvbSA4ZjViNThmZjRjZGIxZmE0OTZlZWE0MzZhYjlhY2RjOTI2YjQyM2IzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAwOToxOToyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhOiB1cGdyYWRlIDYuMC4wIC0+IDYuMS4wCgotLS0KIC4u
LmliLW1ldGFkYXRhXzYuMC4wLmJiID0+IHB5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzYuMS4w
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaW1wb3J0bGli
LW1ldGFkYXRhXzYuMC4wLmJiID0+IHB5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzYuMS4wLmJi
fSAoODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1pbXBvcnRsaWItbWV0YWRhdGFfNi4wLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzYuMS4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
ODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pbXBv
cnRsaWItbWV0YWRhdGFfNi4wLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1pbXBvcnRsaWItbWV0YWRhdGFfNi4xLjAuYmIKaW5kZXggYjMzYTFiNTg1
OC4uMGMyMjY0NDg4ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV82LjAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzYuMS4wLmJiCkBAIC04LDcg
KzgsNyBAQCBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogUFlQSV9Q
QUNLQUdFID0gImltcG9ydGxpYl9tZXRhZGF0YSIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIi9p
bXBvcnRsaWItbWV0YWRhdGEvKD9QPHB2ZXI+KFxkK1tcLlwtX10qKSspLyIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImUzNTRiZWRlYjYwZWZhNmFmZmRjYzhhZTEyMWI3MzU0NGE3YWE3NDE1NmQw
NDczMTE5NDhmNmQ3MTFjZDM3OGQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDNjZTkyODFlMDk3
NTgzZDc1OGMyYzcwOGM0Mzc2MzcxMjYxYTAyYzM0NjgyNDkxYThlOTgzNTIzNjVhYWQyMCIKIAog
UyA9ICIke1dPUktESVJ9L2ltcG9ydGxpYl9tZXRhZGF0YS0ke1BWfSIKIAotLSAKMi4zOS4yCgo=

--===============1690069560768521060==--

