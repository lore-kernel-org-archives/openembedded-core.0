Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361AFC49EC1
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:38 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web09.3949.1659679408543671215
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eufpv5Ly;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101826c99fe3f-1273256f-f949-4da6-8c9b-1e64b3f5f8f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dBVtdqpgP1oli9U04IFFKj2883pbQgGdG+QhoNlx2IU=;
	b=eufpv5Ly5NyqzcbOWr8KH7B25Cg8majx4X+NBhyN5b8WiAO3oBUBRUCci30viKaO
	l9kXbwvyu+ZllEmkHTlDTJYOelFHaa4CG/dY2zbuUmsNW5GG8FnDA4eSoBiNZ0NoRQV
	VFNeuQbrdWJS7gU29y+t7dA8Gsh2vrEbvFRt2cz4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dBVtdqpgP1oli9U04IFFKj2883pbQgGdG+QhoNlx2IU=;
	b=c5HLor1rf6Tb0VwkpU+ICs+vIvTw4jrsioFY5g9TAz/74GHB47fYiD/570WTSIzU
	s2mQjC8sPuGaLXdmuVF+PCfWUQyFjjHT9P5Xy5Tps4SrRQCm8vFcZTrvsa8GzIk4Y62
	XBe7GrUiDkhw4FMzhb3s0oIT1e57isXtVHjls5AA=
Content-Type: multipart/mixed; boundary="===============8219141267184523457=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 63.4.1 SUCCEEDED
Message-ID: 
 <010101826c99fe3f-1273256f-f949-4da6-8c9b-1e64b3f5f8f5-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:27 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168899

--===============8219141267184523457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *63.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-63.3.0-63.4.1.patch
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
--===============8219141267184523457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-63.3.0.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-63.4.1.dist-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-63.3.0.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-63.4.1.dist-info

--===============8219141267184523457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools: PV changed from "63.3.0" to "63.4.1"
packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 63.3.0 [default] to 63.4.1 [default]
packages/core2-32-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-63.3.0.tar.gz file://0001-change-shebang-to-python3.patch file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-63.4.1.tar.gz file://0001-change-shebang-to-python3.patch file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "63.3.0" to "63.4.1"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 63.3.0 [default] to 63.4.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "63.3.0" to "63.4.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 63.3.0 [default] to 63.4.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "63.3.0" to "63.4.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 63.3.0 [default] to 63.4.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "63.3.0" to "63.4.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 63.3.0 [default] to 63.4.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "63.3.0" to "63.4.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 63.3.0 [default] to 63.4.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "63.3.0" to "63.4.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 63.3.0 [default] to 63.4.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "63.3.0" to "63.4.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 63.3.0 [default] to 63.4.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "63.3.0" to "63.4.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 4861255 to 4864266 (+0%)
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 63.3.0 [default] to 63.4.1 [default]
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-63.3.0.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-63.4.1.dist-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-63.3.0.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-63.4.1.dist-info

--===============8219141267184523457==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-63.3.0-63.4.1.patch"

RnJvbSBlNTA3MDU4NWJjYzlkOGJhYWUwOGIzMGNiOGRiZjlkMWI1NWMxNTBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNCBBdWcgMjAyMiAyMjoxNzo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29sczogdXBncmFkZSA2My4zLjAgLT4gNjMuNC4xCgotLS0KIC4uLi8wMDAx
LWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoICB8
IDIgKy0KIC4uLnl0aG9uMy1zZXR1cHRvb2xzXzYzLjMuMC5iYiA9PiBweXRob24zLXNldHVwdG9v
bHNfNjMuNC4xLmJifSB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhv
bjMtc2V0dXB0b29sc182My4zLjAuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzXzYzLjQuMS5iYn0g
KDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9p
bnN0YWxsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFs
bC5wYXRjaAppbmRleCA5YzVmZjZhZDlmLi4yODg4ZTNkNjJjIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFs
bHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxs
eS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3RhbGwucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDNhNWFlNDU0YzA3Mzg1MTBkYWY1ZGY2OGI3OTY4Y2FiNjZjY2ViN2YgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGEwMjBmZDkwYTcwNjBmNzc4M2VmMjg2YmNkZjlkYmYzMDcx
ODQ5NzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUu
amlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE3IEp1bCAyMDE4IDEwOjEzOjM4ICswODAw
CiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmRpdGlvbmFsbHkgZG8gbm90IGZldGNoIGNvZGUgYnkgZWFz
eV9pbnN0YWxsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc2V0dXB0b29sc182My4zLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2V0dXB0b29sc182My40LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNjMuMy4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0
b29sc182My40LjEuYmIKaW5kZXggZGE3ZTc4OTJmZC4uZTMxNjY1ZjNiZSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNjMuMy4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzYz
LjQuMS5iYgpAQCAtMTEsNyArMTEsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAi
IGZpbGU6Ly8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZQogU1JDX1VS
SSArPSAiZmlsZTovLzAwMDEtY2hhbmdlLXNoZWJhbmctdG8tcHl0aG9uMy5wYXRjaCBcCiAgICAg
ICAgICAgICBmaWxlOi8vMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3Np
YmxlLXRvLXN1YnN0aXRlLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjczYjY4NDdh
ZTYxZjc4MjljMWFmZmNkZDlhMzJmNjdhYTY1MjMzYmU1MDhmNGZiYWFiODY2YzVmYWE0ZTQwOCIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3Yzc4NTRlZTE0MjlhMjQwMDkwMjk3NjI4ZGM5Zjc1YjM1
MzE4ZDE5MzUzNzk2OGUyZGMxNDAxMGVlMmY1YmNhIgogCiBERVBFTkRTICs9ICIke1BZVEhPTl9Q
Tn0iCiAKLS0gCjIuMzEuMQoK

--===============8219141267184523457==--

