Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C90CA9ED2
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:45 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.7634.1685693433053127972
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=C3SUm1r7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101887b2881d5-9f614994-99a4-4b07-a9c0-bc7f50cd2ef2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vyTjzusdocRHOkAneulDXGzwJlxJUdC7txqcNbzGN9k=;
	b=C3SUm1r7FYg4nkXTo1UScofN4zsj1hqbzISlykUzkZSo9CSkcr5dwTgZegtVk2Ni
	AHAB50dFV/Lt5LNW0SIxAU0TSUGLELyN2iTUgplHeFS8mNyyoYJnvuTKUGUWnGETL9o
	MoFVVDFDKSeq7obdP0XuLtvXpHSmAM8rlkmkr6Ig=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vyTjzusdocRHOkAneulDXGzwJlxJUdC7txqcNbzGN9k=;
	b=loP2D7BoumvnGy+RK+ewhID+lpr3LxavWF7kSgbUhqi1fzM0Cofe7C8jMVYjqHvL
	+XoCzQRgne9R1lHefMXq7+z84XBrktEBZCIQim8+5rZWJTgDbxoLr+ZMTusPEf9HSDY
	HzR1RTSZOIzUt8s6T7QxzO5Z40u5bdHwz9iNc7Rg=
Content-Type: multipart/mixed; boundary="===============4980480542505580862=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-importlib-metadata: upgrading to 6.6.0 SUCCEEDED
Message-ID: <010101887b2881d5-9f614994-99a4-4b07-a9c0-bc7f50cd2ef2-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182195

--===============4980480542505580862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-importlib-metadata* to *6.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-importlib-metadata-upgrade-6.2.0-6.6.0.patch
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
--===============4980480542505580862==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-importlib-metadata-upgrade-6.2.0-6.6.0.patch"

RnJvbSAzYWI5MTVlZWNhNDQ0NTg5Y2I4NmE0MWQ5ZmIyNTcxMDVmMzg5OGVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxNDo1MTowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhOiB1cGdyYWRlIDYuMi4wIC0+IDYuNi4wCgotLS0KIC4u
LmliLW1ldGFkYXRhXzYuMi4wLmJiID0+IHB5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzYuNi4w
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaW1wb3J0bGli
LW1ldGFkYXRhXzYuMi4wLmJiID0+IHB5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzYuNi4wLmJi
fSAoODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1pbXBvcnRsaWItbWV0YWRhdGFfNi4yLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzYuNi4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
ODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pbXBv
cnRsaWItbWV0YWRhdGFfNi4yLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1pbXBvcnRsaWItbWV0YWRhdGFfNi42LjAuYmIKaW5kZXggM2U5YjQwZWU5
ZC4uMzRiYzU1YjBlMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV82LjIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzYuNi4wLmJiCkBAIC04LDcg
KzgsNyBAQCBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogUFlQSV9Q
QUNLQUdFID0gImltcG9ydGxpYl9tZXRhZGF0YSIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIi9p
bXBvcnRsaWItbWV0YWRhdGEvKD9QPHB2ZXI+KFxkK1tcLlwtX10qKSspLyIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjkxMjdhYWQyZjQ5ZDcyMDNlNzExMjA5OGMxMmI5MmU0ZmQxMDYxY2NkMTg1
NDhjZGZkYzQ5MTcxYThjMDczY2MiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTI1MDFjZGY5Y2M2
NmViZDNlNjEyZjFiNGYwYzA3NjVkZmE0MmYwZmEzOGZmYjMxOWI2YmQ4NGRkNjc1ZDcwNSIKIAog
UyA9ICIke1dPUktESVJ9L2ltcG9ydGxpYl9tZXRhZGF0YS0ke1BWfSIKIAotLSAKMi4zOS4yCgo=

--===============4980480542505580862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.11/site-packages/importlib_metadata-6.2.0.dist-info moved to /usr/lib/python3.11/site-packages/importlib_metadata-6.6.0.dist-info

--===============4980480542505580862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-importlib-metadata: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-6.2.0.tar.gz;downloadfilename=importlib_metadata-6.2.0.tar.gz" to "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-6.6.0.tar.gz;downloadfilename=importlib_metadata-6.6.0.tar.gz"
packages/core2-32-poky-linux/python3-importlib-metadata: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGSIZE changed from 134917 to 144970 (+7%)
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PV changed from "6.2.0" to "6.6.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGV changed from 6.2.0 [default] to 6.6.0 [default]
Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.11/site-packages/importlib_metadata-6.2.0.dist-info moved to /usr/lib/python3.11/site-packages/importlib_metadata-6.6.0.dist-info

--===============4980480542505580862==--

