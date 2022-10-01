Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B90C4743E
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:53 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.501.1664643227220915888
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cpUmskQN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 010101839477daed-545babae-3e85-43a0-b813-c81b3c721e9a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Tvqx3jIEk9Vo/Q+QLhFsxX07QCi+gNkTNyuV7PJBq5U=;
	b=cpUmskQN2A/aHed/DQllL2oph+1dw5bVyztV+zOnt8s3Nl8QfHo4RxHTqQ5HPDiV
	L9kpXV2WWRkcif4mnhkDteUpoSyqZ2ExVCwNQWNLVBfj1wu78wnVv6I1hpqeSNADB9p
	MK8jcqWx15AuAJo64QyC3jwR/mVkKMxz4uOJOwYc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Tvqx3jIEk9Vo/Q+QLhFsxX07QCi+gNkTNyuV7PJBq5U=;
	b=f4bpSDgo6Rm00ILvN67RGjrpXMYvX1V2nZqLROOhxWSAMaTYkWoZLwFVdqIenKc8
	rA8NNJw5JIdmrWVna7Xdr8af2e6o7UYuuwlDUQL9EzF0qDlKIG77qvhO240zlyTez9g
	jbSxnLLLdha6GrC9xAnaqlrUksKZ8kcWSD2uo3Gk=
Content-Type: multipart/mixed; boundary="===============5830548821598149186=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2022.9 SUCCEEDED
Message-ID: 
 <010101839477daed-545babae-3e85-43a0-b813-c81b3c721e9a-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171271

--===============5830548821598149186==
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
--===============5830548821598149186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info was added
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info/WHEEL was removed

--===============5830548821598149186==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2022.8.3-2022.9.patch"

RnJvbSAwNGI3YTU3NzY2Yzk2N2ZmMTczYmYzYjc2NzVlNWFiMGI0YjQxYWU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAwODoxNTo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
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

--===============5830548821598149186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dtschema: PV changed from "2022.8.3" to "2022.9"
packages/core2-32-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.8.3.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.9.tar.gz"
packages/core2-32-poky-linux/python3-dtschema: PKGV changed from 2022.8.3 [default] to 2022.9 [default]
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
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 243550 to 245688 (+1%)
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info was added
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/dtschema-2022.9.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/dtschema-2022.8.3.dist-info/WHEEL was removed

--===============5830548821598149186==--

