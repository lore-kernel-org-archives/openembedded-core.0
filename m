Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32EB1C64EB1
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:34 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.46822.1669908626679545683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YB2BJG5U;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010184ce4f79b5-09e7bf1d-4dc9-46f6-b795-58037638c20a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AS+pNe8wKsso2G9y8EvMogcgtLYRDFOX8bHqu1vlwmM=;
	b=YB2BJG5UqkLboTNVyaXk6EXSoTY6qKjrb/tXHeQSnFUq6tJRQ0TfX99itx17+3Z1
	J3FugwbXCxdaPK7O1baRLlVGTIJXMQ3zx9fpcpFgL2uiMcNLhdWJHntOfVDr+Tk4idQ
	42jFvXTNlpJJMJJ3KV4sGPr8hY0cYJptfSJ1OMX0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AS+pNe8wKsso2G9y8EvMogcgtLYRDFOX8bHqu1vlwmM=;
	b=Vw+MKL4zQLCXazo+/+Ijly7tqiWJOYFoLSD6FoWipPVBLIzrTuWsazAklifVKFPV
	/mEekEOews7f7j7HnKooPldlY5+iWFFTzGED84dVVcTo2vqQdxVhJP1PtyFtjKEUchx
	vSkDqOqmWkripWUSwxJuLISA7u1HmFafl/XSvT34=
Content-Type: multipart/mixed; boundary="===============1080997147136018887=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-importlib-metadata: upgrading to 5.1.0 SUCCEEDED
Message-ID: <01010184ce4f79b5-09e7bf1d-4dc9-46f6-b795-58037638c20a-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174140

--===============1080997147136018887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-importlib-metadata* to *5.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-importlib-metadata-upgrade-5.0.0-5.1.0.patch
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
--===============1080997147136018887==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-importlib-metadata-upgrade-5.0.0-5.1.0.patch"

RnJvbSA5NjA3ZjU4MWE5MDY2YzQwZDhiOWYxMWI1YWQ2YjYzMDAxMjNiYzY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAwOTozMDowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhOiB1cGdyYWRlIDUuMC4wIC0+IDUuMS4wCgotLS0KIC4u
LmliLW1ldGFkYXRhXzUuMC4wLmJiID0+IHB5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzUuMS4w
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaW1wb3J0bGli
LW1ldGFkYXRhXzUuMC4wLmJiID0+IHB5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzUuMS4wLmJi
fSAoODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1pbXBvcnRsaWItbWV0YWRhdGFfNS4wLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzUuMS4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
ODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pbXBv
cnRsaWItbWV0YWRhdGFfNS4wLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1pbXBvcnRsaWItbWV0YWRhdGFfNS4xLjAuYmIKaW5kZXggZjA2MjM2Njlk
Ny4uZDQ3YWNjZmU3YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV81LjAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzUuMS4wLmJiCkBAIC04LDcg
KzgsNyBAQCBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogUFlQSV9Q
QUNLQUdFID0gImltcG9ydGxpYl9tZXRhZGF0YSIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIi9p
bXBvcnRsaWItbWV0YWRhdGEvKD9QPHB2ZXI+KFxkK1tcLlwtX10qKSspLyIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImRhMzFkYjMyYjMwNDMxNGQwNDRkM2MxMmM3OWJkNTllMzA3ODg5YjI4N2Fk
MTJmZjM4N2IzNTAwODM1ZmMyYWIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDUwNTlmOWYxZThl
NDFmODBlOWM1NmMyZWU1ODgxMTQ1MGMzMTk4NGRmYTYyNTMyOWZmZDdjMGRhZDg4YTczYiIKIAog
UyA9ICIke1dPUktESVJ9L2ltcG9ydGxpYl9tZXRhZGF0YS0ke1BWfSIKIAotLSAKMi4zMS4xCgo=

--===============1080997147136018887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-importlib-metadata: PV changed from "5.0.0" to "5.1.0"
packages/core2-32-poky-linux/python3-importlib-metadata: PKGV changed from 5.0.0 [default] to 5.1.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-5.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-5.1.0.tar.gz"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PV changed from "5.0.0" to "5.1.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PKGV changed from 5.0.0 [default] to 5.1.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PV changed from "5.0.0" to "5.1.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PKGV changed from 5.0.0 [default] to 5.1.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PV changed from "5.0.0" to "5.1.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PKGV changed from 5.0.0 [default] to 5.1.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PV changed from "5.0.0" to "5.1.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PKGV changed from 5.0.0 [default] to 5.1.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PV changed from "5.0.0" to "5.1.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PKGV changed from 5.0.0 [default] to 5.1.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PV changed from "5.0.0" to "5.1.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PKGV changed from 5.0.0 [default] to 5.1.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PV changed from "5.0.0" to "5.1.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGV changed from 5.0.0 [default] to 5.1.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGSIZE changed from 133922 to 132474 (-1%)
Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.11/site-packages/importlib_metadata-5.0.0.dist-info moved to /usr/lib/python3.11/site-packages/importlib_metadata-5.1.0.dist-info

--===============1080997147136018887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.11/site-packages/importlib_metadata-5.0.0.dist-info moved to /usr/lib/python3.11/site-packages/importlib_metadata-5.1.0.dist-info

--===============1080997147136018887==--

