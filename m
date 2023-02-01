Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38275C77B7B
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.30011.1675272855573389865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hhrejQF5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101860e0b1d1f-f54c1f04-a2a9-46c5-a2e9-45541b748ab6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Uf3FJXQ2ki5/zylPsskUikDz36fMnuuhYBbBPzN9fgk=;
	b=hhrejQF5t31SXUv1uh8cHNLW5BKDnxKPPnri5V3kq42f4dYj8zDCvExATc2CplBf
	RVnBMY8rfr3A0BMq4lQdd7cB2NqYeoKWkKhcb/n8t14Le/Ed2sj5iul+DZ5ejuK7eEz
	IxaXX3JpGtR3piYK9AbA7b2ITCFAp6IvWLN/JNY0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Uf3FJXQ2ki5/zylPsskUikDz36fMnuuhYBbBPzN9fgk=;
	b=VVzAJXtJUQzPa+mSLS6rbw2xQVl3u9kDJfCu8EtTJ1ZaOaEuAuGNC3/SII6VWBTn
	zACSD+X3BjWsAsBialNV01GIzdKu5vO8kW4oggumG78hA0lC54sRnBT9PPR7zOB0ZC/
	kxvfWKU6cTnvspT9HAky3zkpT5LEm1yzlF9BA4Hs=
Content-Type: multipart/mixed; boundary="===============0856031096206481574=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodome: upgrading to 3.17 SUCCEEDED
Message-ID: <010101860e0b1d1f-f54c1f04-a2a9-46c5-a2e9-45541b748ab6-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176597

--===============0856031096206481574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycryptodome* to *3.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycryptodome-upgrade-3.16.0-3.17.patch
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
--===============0856031096206481574==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycryptodome-upgrade-3.16.0-3.17.patch"

RnJvbSBjZDEzYzk4ZDA1MmYwYjU3MTE3ODA2OWJjNWRhYmMzZjk5NTNmY2EzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxMTo0NjowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHljcnlwdG9kb21lOiB1cGdyYWRlIDMuMTYuMCAtPiAzLjE3CgotLS0KIC4uLmhvbjMt
cHljcnlwdG9kb21lXzMuMTYuMC5iYiA9PiBweXRob24zLXB5Y3J5cHRvZG9tZV8zLjE3LmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHljcnlwdG9kb21lXzMu
MTYuMC5iYiA9PiBweXRob24zLXB5Y3J5cHRvZG9tZV8zLjE3LmJifSAoMzglKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4x
Ni4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9t
ZV8zLjE3LmJiCnNpbWlsYXJpdHkgaW5kZXggMzglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4xNi4wLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21lXzMuMTcuYmIK
aW5kZXggMTVlZTMxYzY2YS4uMDVmNjU0ZjIyNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZV8zLjE2LjAuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZV8zLjE3LmJiCkBAIC0x
LDUgKzEsNSBAQAogcmVxdWlyZSBweXRob24tcHljcnlwdG9kb21lLmluYwogaW5oZXJpdCBzZXR1
cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGU0NWQyZDg1MmE2NmVjZmI5MDRmMDkw
YzNmODdkYzBkZmI4OWE0OTk1NzBhYmFkODU5MGYxMGQ5Y2ZmYjM1MCIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJiY2UyZTJkOGU4MmZjZjk3MjAwNTY1MjM3MWEzZTg3MzE5NTZhMGMxZmJiNzE5Y2M4
OTc5NDNiMzY5NWFkOTFiIgogCi0tIAoyLjM3LjMKCg==

--===============0856031096206481574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pycryptodome: PKGV changed from 3.16.0 [default] to 3.17 [default]
packages/core2-32-poky-linux/python3-pycryptodome: PV changed from "3.16.0" to "3.17"
packages/core2-32-poky-linux/python3-pycryptodome: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.16.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.17.tar.gz"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGSIZE changed from 1042288 to 1068428 (+3%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGV changed from 3.16.0 [default] to 3.17 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PV changed from "3.16.0" to "3.17"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PKGV changed from 3.16.0 [default] to 3.17 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PV changed from "3.16.0" to "3.17"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PKGV changed from 3.16.0 [default] to 3.17 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PV changed from "3.16.0" to "3.17"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PKGV changed from 3.16.0 [default] to 3.17 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PV changed from "3.16.0" to "3.17"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGSIZE changed from 2772209 to 2772376 (+0%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGV changed from 3.16.0 [default] to 3.17 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PV changed from "3.16.0" to "3.17"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PKGV changed from 3.16.0 [default] to 3.17 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PV changed from "3.16.0" to "3.17"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGSIZE changed from 2843277 to 2870721 (+1%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGV changed from 3.16.0 [default] to 3.17 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PV changed from "3.16.0" to "3.17"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGSIZE changed from 3634243 to 3643349 (+0%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGV changed from 3.16.0 [default] to 3.17 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: PV changed from "3.16.0" to "3.17"
Changes to packages/core2-32-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/AUTHORS.rst was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/LICENSE.rst was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.16.0.dist-info was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.16.0.dist-info/AUTHORS.rst was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.16.0.dist-info/LICENSE.rst was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.16.0.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.16.0.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.16.0.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.16.0.dist-info/WHEEL was removed

--===============0856031096206481574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/AUTHORS.rst was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/LICENSE.rst was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.17.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/pycryptodome-3.16.0.dist-info was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.16.0.dist-info/AUTHORS.rst was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.16.0.dist-info/LICENSE.rst was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.16.0.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.16.0.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.16.0.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/pycryptodome-3.16.0.dist-info/WHEEL was removed

--===============0856031096206481574==--

