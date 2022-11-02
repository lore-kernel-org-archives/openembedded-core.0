Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4769C64EC2
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.852.1667349633505542003
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KaFjdGiI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018435c85658-3371aec4-1e2d-43ff-bc22-95c770cfb654-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EgHFHMxuScQszAqFQfPIS0fTDPfWEaEdAFEXmwxPQoU=;
	b=KaFjdGiIW5eLA6gJtZb6UMOmjAKnbZ7CJZCM6TO+pIhkaVvyYow0HhVq7FW631c9
	bA+ZGmbKInU1Smjz01hNmlYU3alUrnKugZ/lb6K7n3wP7gCtEWDVijOlP/7+Gxo3HWR
	kClkV9rBi6UIjXlnrE5xSsZBt5Lfh7hnXFDcECbo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EgHFHMxuScQszAqFQfPIS0fTDPfWEaEdAFEXmwxPQoU=;
	b=GGY2wvQAbULRA7lQOBlFsOgesetmcvlW9pYqEyu0ysQdAZDxXHdxMywnvqAzz1c7
	7btJxVlecFHkH8lOeKvVTAXQ+P0pAfpMamG496mpXxE449TUECSSmd9AFJ6fOnNGeME
	39d8wUHN/cnhTUvfMkHBNK6KFzbaYsoPSzeyhofI=
Content-Type: multipart/mixed; boundary="===============3293490236375715484=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2022.9 SUCCEEDED
Message-ID: <0101018435c85658-3371aec4-1e2d-43ff-bc22-95c770cfb654-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172428

--===============3293490236375715484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2022.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2022.8.3-2022.9.patch
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
--===============3293490236375715484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dtschema: PV changed from "2022.8.3" to "2022.9"
packages/core2-32-poky-linux/python3-dtschema: PKGV changed from 2022.8.3 [default] to 2022.9 [default]
packages/core2-32-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.8.3.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.9.tar.gz"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2022.8.3" to "2022.9"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2022.8.3 [default] to 2022.9 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2022.8.3" to "2022.9"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2022.8.3 [default] to 2022.9 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2022.8.3" to "2022.9"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2022.8.3 [default] to 2022.9 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2022.8.3" to "2022.9"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2022.8.3 [default] to 2022.9 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2022.8.3" to "2022.9"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2022.8.3 [default] to 2022.9 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2022.8.3" to "2022.9"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2022.8.3 [default] to 2022.9 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2022.8.3" to "2022.9"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2022.8.3 [default] to 2022.9 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 288043 to 290645 (+1%)
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.11/site-packages/dtschema-2022.9.dist-info was added
  /usr/lib/python3.11/site-packages/dtschema-2022.9.dist-info/LICENSE.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2022.9.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/dtschema-2022.9.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/dtschema-2022.9.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2022.9.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/dtschema-2022.8.3.dist-info was removed
  /usr/lib/python3.11/site-packages/dtschema-2022.8.3.dist-info/LICENSE.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2022.8.3.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/dtschema-2022.8.3.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/dtschema-2022.8.3.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2022.8.3.dist-info/WHEEL was removed

--===============3293490236375715484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.11/site-packages/dtschema-2022.9.dist-info was added
  /usr/lib/python3.11/site-packages/dtschema-2022.9.dist-info/LICENSE.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2022.9.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/dtschema-2022.9.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/dtschema-2022.9.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2022.9.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/dtschema-2022.8.3.dist-info was removed
  /usr/lib/python3.11/site-packages/dtschema-2022.8.3.dist-info/LICENSE.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2022.8.3.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/dtschema-2022.8.3.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/dtschema-2022.8.3.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2022.8.3.dist-info/WHEEL was removed

--===============3293490236375715484==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2022.8.3-2022.9.patch"

RnJvbSA4ZGNkZmRjMjcyMTFhY2I1M2VjZWFmMzQzMDRiM2Y0M2M4NzFjZTJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAwOTo0NzoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZHRzY2hlbWE6IHVwZ3JhZGUgMjAyMi44LjMgLT4gMjAyMi45CgotLS0KIC4uLntweXRo
b24zLWR0c2NoZW1hXzIwMjIuOC4zLmJiID0+IHB5dGhvbjMtZHRzY2hlbWFfMjAyMi45LmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtZHRzY2hlbWFfMjAyMi44
LjMuYmIgPT4gcHl0aG9uMy1kdHNjaGVtYV8yMDIyLjkuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjIuOC4zLmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjIuOS5i
YgpzaW1pbGFyaXR5IGluZGV4IDgzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMi44LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIyLjkuYmIKaW5kZXggYmM4MTlj
MGRkNi4uM2RjYmMyZGNiMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWR0c2NoZW1hXzIwMjIuOC4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIyLjkuYmIKQEAgLTcsNyArNyw3IEBAIGluaGVy
aXQgcHlwaSBzZXR1cHRvb2xzMwogCiBQWVBJX1BBQ0tBR0UgPSAiZHRzY2hlbWEiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICIxMjhjODhhMzkzY2QwNDE1NGNlZjRkNGIxMGE2NDNlNDQ3M2FlMjkw
YjQzNmU4ZTYxZDJlOTdhZThlNTMyNTVkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImM5NTMzMzEy
YTJkNzdjNGNjZGJmZmRhMTUwNGFiYTg1MGQ5YjIyNGZkOGI0M2U5MjljZWUyYWE2ODQ3OGU4MmEi
CiAKIERFUEVORFMgKz0gInB5dGhvbjMtc2V0dXB0b29scy1zY20tbmF0aXZlIgogUkRFUEVORFM6
JHtQTn0gKz0gInB5dGhvbjMtcnVhbWVsLXlhbWwgcHl0aG9uMy1qc29uc2NoZW1hIHB5dGhvbjMt
cmZjMzk4NyIKLS0gCjIuMzEuMQoK

--===============3293490236375715484==--

