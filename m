Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F50DC71143
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:19 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.20669.1672605967521233461
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OlSQeQ2X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101856f15a12d-636ba627-f6f7-4bc1-8c30-5d6fc138efed-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UILSfsTvThJJcRnChgZR5pgo2l0yeLAvDjKqqiCL2bI=;
	b=OlSQeQ2XZsYImFE+L3IlHK8D7WCMK4UHsjL4d3yAXsLS5gqLPPnXstcexWQNNCWx
	6wj36QkxID9CqyqFKsn50FmQ00gqB7AEzBpbnqWvZty1BvEQGJGOzrDXV7ZMtZfQCOC
	di7a7rHgPnH9IGczZBrjL/eiS3UyPQuPpkdNT7io=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UILSfsTvThJJcRnChgZR5pgo2l0yeLAvDjKqqiCL2bI=;
	b=QUJfdzWHZCms4uSbr9gecsGqbA0x5FGfDWCk6Rwomw/L3s+SErrEp0CJ9P0+4U93
	wgOrCzGLlol3n97hu/apLNfne35cUDkaYStqXINSj6aNx+K891YpoH0nnYHZlvDWavz
	38cj/vjCp/ylbciAvKBu2QQ8cthtNm3dK4ueGiIw=
Content-Type: multipart/mixed; boundary="===============2232093821920906683=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-importlib-metadata: upgrading to 5.2.0 SUCCEEDED
Message-ID: <010101856f15a12d-636ba627-f6f7-4bc1-8c30-5d6fc138efed-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175268

--===============2232093821920906683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-importlib-metadata* to *5.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-importlib-metadata-upgrade-5.0.0-5.2.0.patch
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
--===============2232093821920906683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.11/site-packages/importlib_metadata-5.0.0.dist-info moved to /usr/lib/python3.11/site-packages/importlib_metadata-5.2.0.dist-info

--===============2232093821920906683==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-importlib-metadata-upgrade-5.0.0-5.2.0.patch"

RnJvbSAyYTRlZDIwOTExYWM2NjYwMjgxNGViM2JjZmQyMmI4MmVlODY4YTkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAwOToxMzoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhOiB1cGdyYWRlIDUuMC4wIC0+IDUuMi4wCgotLS0KIC4u
LmliLW1ldGFkYXRhXzUuMC4wLmJiID0+IHB5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzUuMi4w
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaW1wb3J0bGli
LW1ldGFkYXRhXzUuMC4wLmJiID0+IHB5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzUuMi4wLmJi
fSAoODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1pbXBvcnRsaWItbWV0YWRhdGFfNS4wLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzUuMi4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
ODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pbXBv
cnRsaWItbWV0YWRhdGFfNS4wLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1pbXBvcnRsaWItbWV0YWRhdGFfNS4yLjAuYmIKaW5kZXggZjA2MjM2Njlk
Ny4uODkzYzYzZDdlNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV81LjAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzUuMi4wLmJiCkBAIC04LDcg
KzgsNyBAQCBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogUFlQSV9Q
QUNLQUdFID0gImltcG9ydGxpYl9tZXRhZGF0YSIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIi9p
bXBvcnRsaWItbWV0YWRhdGEvKD9QPHB2ZXI+KFxkK1tcLlwtX10qKSspLyIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImRhMzFkYjMyYjMwNDMxNGQwNDRkM2MxMmM3OWJkNTllMzA3ODg5YjI4N2Fk
MTJmZjM4N2IzNTAwODM1ZmMyYWIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDA0ZDQ4ZDYyYmJh
MGI3YTc3ZmY5ZDQwNWVmZDkxNTAxYmVmMmU2N2ZmNGFjZTBiZWQ0MGEwY2YyOGMzYzdjZCIKIAog
UyA9ICIke1dPUktESVJ9L2ltcG9ydGxpYl9tZXRhZGF0YS0ke1BWfSIKIAotLSAKMi4zNy4zCgo=

--===============2232093821920906683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-importlib-metadata: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-5.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-5.2.0.tar.gz"
packages/core2-32-poky-linux/python3-importlib-metadata: PV changed from "5.0.0" to "5.2.0"
packages/core2-32-poky-linux/python3-importlib-metadata: PKGV changed from 5.0.0 [default] to 5.2.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PV changed from "5.0.0" to "5.2.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PKGV changed from 5.0.0 [default] to 5.2.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PV changed from "5.0.0" to "5.2.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PKGV changed from 5.0.0 [default] to 5.2.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PV changed from "5.0.0" to "5.2.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PKGV changed from 5.0.0 [default] to 5.2.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PV changed from "5.0.0" to "5.2.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PKGV changed from 5.0.0 [default] to 5.2.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PV changed from "5.0.0" to "5.2.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PKGV changed from 5.0.0 [default] to 5.2.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PV changed from "5.0.0" to "5.2.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PKGV changed from 5.0.0 [default] to 5.2.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PV changed from "5.0.0" to "5.2.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGSIZE changed from 133585 to 133615 (+0%)
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGV changed from 5.0.0 [default] to 5.2.0 [default]
Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.11/site-packages/importlib_metadata-5.0.0.dist-info moved to /usr/lib/python3.11/site-packages/importlib_metadata-5.2.0.dist-info

--===============2232093821920906683==--

