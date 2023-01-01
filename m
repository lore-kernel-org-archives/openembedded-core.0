Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F96BC71149
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:19 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.20180.1672605967453687595
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HBMQmJed;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101856f15a229-0fc9dbce-f1c1-4bee-b041-50518cde7114-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605967;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=F8RHOg1iL59zFKmHVebKU3B+XAEWmKo9FOt1DDiqMFA=;
	b=HBMQmJedGly5YPlCfgt1vn43UfkAHRo5vOxulfGqdThWCQ/kjZS5ad9Dzm6re1tL
	ZasUsCd3GhBJD9FL69okcUOIYSPAkRJ1CUMV+Uj6VlhBGixsLEK9arbLINu8+ryKqJj
	WRnatOciVSiNSEbgiWPzthRGtlHmzqihkRXkU4nQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=F8RHOg1iL59zFKmHVebKU3B+XAEWmKo9FOt1DDiqMFA=;
	b=BIxPf/4gaXCysXmBEOolazkfq0JCJbEBO8GF4xEpnvPtLTu8ibQXe6CI3kwlj6P0
	Lk9CCKB5DFuG6Rb9c0iq0xMoyD1uDFOTCmJ1HZBtHVonxXE98uX+OcGg0F50RWaSsdn
	xBGPjiAsV9FkvuJQw83Fj23lkGN1jISZs8yoyTOw=
Content-Type: multipart/mixed; boundary="===============2836520975056456197=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 65.6.3 SUCCEEDED
Message-ID: <010101856f15a229-0fc9dbce-f1c1-4bee-b041-50518cde7114-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175264

--===============2836520975056456197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *65.6.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-65.5.1-65.6.3.patch
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
--===============2836520975056456197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.11/site-packages/setuptools-65.5.1.dist-info -> /usr/lib/python3.11/site-packages/setuptools-65.6.3.dist-info, added "/usr/lib/python3.11/site-packages/setuptools/_distutils/_log.py /usr/lib/python3.11/site-packages/setuptools/_distutils/__pycache__/_log.cpython-311.pyc"
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-65.5.1.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-65.6.3.dist-info
  /usr/lib/python3.11/site-packages/setuptools/_distutils/_log.py was added
  /usr/lib/python3.11/site-packages/setuptools/_distutils/__pycache__/_log.cpython-311.pyc was added
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-65.5.1.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-65.6.3.dist-info
  /usr/lib/python3.11/site-packages/setuptools/_distutils/_log.py was added

--===============2836520975056456197==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-65.5.1-65.6.3.patch"

RnJvbSAyMTJiNDA5MzVlNmRlZDE2NTJmNTMxN2Q0YjY4ZWI5NjNmZTQ2N2QzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxMDozNDo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29sczogdXBncmFkZSA2NS41LjEgLT4gNjUuNi4zCgotLS0KIC4uLi8wMDAx
LWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoICB8
IDIgKy0KIC4uLnl0aG9uMy1zZXR1cHRvb2xzXzY1LjUuMS5iYiA9PiBweXRob24zLXNldHVwdG9v
bHNfNjUuNi4zLmJifSB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhv
bjMtc2V0dXB0b29sc182NS41LjEuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzXzY1LjYuMy5iYn0g
KDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9p
bnN0YWxsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFs
bC5wYXRjaAppbmRleCAxYjVmOWM3NTc3Li4yMTEwYzRhODc3IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFs
bHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxs
eS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3RhbGwucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIGEwZTA4NzNhOGVlNjY3NGQ0M2U2MDRkNjZiZjY2ZDk0ZmM4ZWViNmYgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDJlNTczNjk1OTNlZGU1MzM2Zjk0N2U3Yjk5MDNlYmM2NzNm
OThmZWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUu
amlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE3IEp1bCAyMDE4IDEwOjEzOjM4ICswODAw
CiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmRpdGlvbmFsbHkgZG8gbm90IGZldGNoIGNvZGUgYnkgZWFz
eV9pbnN0YWxsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc2V0dXB0b29sc182NS41LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2V0dXB0b29sc182NS42LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNjUuNS4x
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0
b29sc182NS42LjMuYmIKaW5kZXggOGRjNzI0ZTU1YS4uYThiY2IzYTYwMiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNjUuNS4xLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY1
LjYuMy5iYgpAQCAtMTEsNyArMTEsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAi
IGZpbGU6Ly8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZQogU1JDX1VS
SSArPSAiZmlsZTovLzAwMDEtY2hhbmdlLXNoZWJhbmctdG8tcHl0aG9uMy5wYXRjaCBcCiAgICAg
ICAgICAgICBmaWxlOi8vMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3Np
YmxlLXRvLXN1YnN0aXRlLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTE5N2ExOWFh
OGVjOTcyMjkyOGYyMjA2ZjhkZTc1MmRlZjBlNGM5ZmM2OTUzNTI3MzYwZDFjMzZkOTRkZGIyZiIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhNzYyMDc1N2JmOTg0YjU4ZGVhZjMyZmM4YTQ1NzdhOWJi
YzA4NTBjZjkyYzIwZTFjZTQxYzM4YzE5ZTVmYjc1IgogCiBERVBFTkRTICs9ICIke1BZVEhPTl9Q
Tn0iCiAKLS0gCjIuMzcuMwoK

--===============2836520975056456197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-65.5.1.tar.gz file://0001-change-shebang-to-python3.patch file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-65.6.3.tar.gz file://0001-change-shebang-to-python3.patch file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.11/site-packages/setuptools-65.5.1.dist-info -> /usr/lib/python3.11/site-packages/setuptools-65.6.3.dist-info, added "/usr/lib/python3.11/site-packages/setuptools/_distutils/_log.py /usr/lib/python3.11/site-packages/setuptools/_distutils/__pycache__/_log.cpython-311.pyc"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 6060291 to 6065304 (+0%)
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-65.5.1.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-65.6.3.dist-info
  /usr/lib/python3.11/site-packages/setuptools/_distutils/_log.py was added
  /usr/lib/python3.11/site-packages/setuptools/_distutils/__pycache__/_log.cpython-311.pyc was added
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-65.5.1.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-65.6.3.dist-info
  /usr/lib/python3.11/site-packages/setuptools/_distutils/_log.py was added

--===============2836520975056456197==--

