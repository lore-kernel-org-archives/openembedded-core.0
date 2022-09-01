Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6533CC6FA97
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:56 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web12.12467.1662040787053403693
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=n7f3aYVd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010182f959c2b6-994ce43b-cb93-49ad-833d-9fc7ed49aeaa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Sjx3d7wkQb/vPZryhcNbC5XX7bQ5Y+AlcpyJfnQpPdA=;
	b=n7f3aYVd4kkyUG0cEN3rQcF9LZnLzYB1WrcrCoem7CTgJIDBYbqvXPzsSGRie3e3
	nOLfeNS6VNDtGxT9jHxu6yia0Yr6ZgFaoTl1DyRNBImWiBvEoAfFYk6UucRShY1VLRN
	gEqPdrg/uhxfAWs+pyQv260i7SoUMhl820U8Xy50=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Sjx3d7wkQb/vPZryhcNbC5XX7bQ5Y+AlcpyJfnQpPdA=;
	b=L5up5ZohzmtnKzQhiVz/iXdg2muhwyiSvQmCTGgimY2cF3OhYW+/POQR1/TJi8Ht
	D57aewKS3rh3UuXd1nLSqqEpX6uhRdLi/B6d3fUsxQhMf0nEPHA0cFylVOw+ksU3VTp
	JftMgPqR+S9FsGoASIhgLkZX0ICaFwz7Az412JNY=
Content-Type: multipart/mixed; boundary="===============0497904774566944407=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 65.3.0 SUCCEEDED
Message-ID: 
 <01010182f959c2b6-994ce43b-cb93-49ad-833d-9fc7ed49aeaa-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:45 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170191

--===============0497904774566944407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *65.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-65.0.2-65.3.0.patch
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
--===============0497904774566944407==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-65.0.2-65.3.0.patch"

RnJvbSAzMjM4MmY4ZmFkMzExYzgwNzNkNTM0ZWNkZDViNjJlOWNlMTE0NjI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAwNzoyMDowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29sczogdXBncmFkZSA2NS4wLjIgLT4gNjUuMy4wCgotLS0KIC4uLi8wMDAx
LWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoICB8
IDIgKy0KIC4uLnl0aG9uMy1zZXR1cHRvb2xzXzY1LjAuMi5iYiA9PiBweXRob24zLXNldHVwdG9v
bHNfNjUuMy4wLmJifSB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhv
bjMtc2V0dXB0b29sc182NS4wLjIuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzXzY1LjMuMC5iYn0g
KDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9p
bnN0YWxsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFs
bC5wYXRjaAppbmRleCBjOGM3MTNjODQyLi4zYWJmZTg3MmM2IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFs
bHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxs
eS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3RhbGwucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDQyZDM0OTAzMWNkOTUyYzEyNjIwZmNmMDJjYmFiNzBhMzcxZjRiMTkgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDliMTkyZmM5ZTJlMmFlNmZjMzQwYmEzY2EwZjZlNWNjMDYx
NDU0NWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUu
amlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE3IEp1bCAyMDE4IDEwOjEzOjM4ICswODAw
CiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmRpdGlvbmFsbHkgZG8gbm90IGZldGNoIGNvZGUgYnkgZWFz
eV9pbnN0YWxsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc2V0dXB0b29sc182NS4wLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2V0dXB0b29sc182NS4zLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNjUuMC4y
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0
b29sc182NS4zLjAuYmIKaW5kZXggMWE2MzllYTMzMy4uMzQ3MWQyODA1ZCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNjUuMC4yLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY1
LjMuMC5iYgpAQCAtMTEsNyArMTEsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAi
IGZpbGU6Ly8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZQogU1JDX1VS
SSArPSAiZmlsZTovLzAwMDEtY2hhbmdlLXNoZWJhbmctdG8tcHl0aG9uMy5wYXRjaCBcCiAgICAg
ICAgICAgICBmaWxlOi8vMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3Np
YmxlLXRvLXN1YnN0aXRlLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTAxYmYxNWNh
NzIzYmVlZjQyYzhkYjkxYTc2MWYzNzQ4ZDRkNjk3ZTE3ZmFlOTA0ZGI2MGMwYjYxOWQ4ZDA5NCIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3NzMyODcxZjRmN2ZhNThmYjZiZGNhZWFkYjAxNjFiMmJk
MDQ2Yzg1OTA1ZGJhYTA2NmJkY2JjYzgxOTUzYjU3IgogCiBERVBFTkRTICs9ICIke1BZVEhPTl9Q
Tn0iCiAKLS0gCjIuMzEuMQoK

--===============0497904774566944407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools: PV changed from "65.0.2" to "65.3.0"
packages/core2-32-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-65.0.2.tar.gz file://0001-change-shebang-to-python3.patch file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-65.3.0.tar.gz file://0001-change-shebang-to-python3.patch file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 65.0.2 [default] to 65.3.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "65.0.2" to "65.3.0"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 65.0.2 [default] to 65.3.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "65.0.2" to "65.3.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 65.0.2 [default] to 65.3.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "65.0.2" to "65.3.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 65.0.2 [default] to 65.3.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "65.0.2" to "65.3.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 65.0.2 [default] to 65.3.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "65.0.2" to "65.3.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 65.0.2 [default] to 65.3.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "65.0.2" to "65.3.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 65.0.2 [default] to 65.3.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "65.0.2" to "65.3.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 65.0.2 [default] to 65.3.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "65.0.2" to "65.3.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 65.0.2 [default] to 65.3.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 4902330 to 4896867 (-0%)
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-65.0.2.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-65.3.0.dist-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-65.0.2.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-65.3.0.dist-info

--===============0497904774566944407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-65.0.2.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-65.3.0.dist-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-65.0.2.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-65.3.0.dist-info

--===============0497904774566944407==--

