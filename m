Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9D7CA9EA3
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.32126.1680384533158973336
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=glEEfoiy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101873eb9261f-4787d7b6-6a67-41a4-81bf-198eb43b73d7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=T1u4b3c4cOAYXHOa5IzkdncHIMh0inv/JXP4bTS1dYk=;
	b=glEEfoiyV1EqzDWO2mLyOOfq2jULZFFMKzT5rngNYOcI5Yxp1EvD/TQ9HM1++fLR
	+OoBy9kQynxLMguByVRb6rWSl7K2tKMaFEwghncZ0+OMhH+FE1cClpgjm982tzBbZxh
	IKh+VoL2ZZHMHdkjy70iIjZ4nhcZxygvlW+YscWI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=T1u4b3c4cOAYXHOa5IzkdncHIMh0inv/JXP4bTS1dYk=;
	b=i9Hzs38EQd5jiiLNIrq7AwUqhFKVsmQCcrZS9qVX00Kr6L6LnHbkW4r10p33/DiF
	y7LSXrzJtyRyoklL/TmotdtGcVKa3MGE1RFdVZkMDfsndT9vjLVEpgvE8KQ2yB3hmh+
	vS6qwV7eUAIvG669BB9ZniO1JzEbHW5dTVJlMl9E=
Content-Type: multipart/mixed; boundary="===============8315222837184175038=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 67.6.1 SUCCEEDED
Message-ID: <010101873eb9261f-4787d7b6-6a67-41a4-81bf-198eb43b73d7-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179486

--===============8315222837184175038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *67.6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-67.6.0-67.6.1.patch
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
--===============8315222837184175038==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-67.6.0-67.6.1.patch"

RnJvbSBiN2UwYjBlZjEzMzQyN2M5NGI5ZWFkOWJiZTljNzAxY2I4M2VjYjk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAxMDowMzo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29sczogdXBncmFkZSA2Ny42LjAgLT4gNjcuNi4xCgotLS0KIC4uLi8wMDAx
LWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoICB8
IDIgKy0KIC4uLnl0aG9uMy1zZXR1cHRvb2xzXzY3LjYuMC5iYiA9PiBweXRob24zLXNldHVwdG9v
bHNfNjcuNi4xLmJifSB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhv
bjMtc2V0dXB0b29sc182Ny42LjAuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzXzY3LjYuMS5iYn0g
KDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9p
bnN0YWxsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFs
bC5wYXRjaAppbmRleCBiMTJlNGY1ZDA1Li5iZTE4ZDY2YTYxIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFs
bHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxs
eS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3RhbGwucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDhhNjc3MTAxMzFmYzFiODI0NmVkYzRkYmNkODA3N2VlZDk2ZTEzZjcgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGU4OTE3OTk1MzQ0NTZjMmIyMDdjNGQyNGYwZGY5YzQwNjI3
MGY2NTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUu
amlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE3IEp1bCAyMDE4IDEwOjEzOjM4ICswODAw
CiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmRpdGlvbmFsbHkgZG8gbm90IGZldGNoIGNvZGUgYnkgZWFz
eV9pbnN0YWxsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc2V0dXB0b29sc182Ny42LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2V0dXB0b29sc182Ny42LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNjcuNi4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0
b29sc182Ny42LjEuYmIKaW5kZXggYWExZDUyNWMwMi4uYWQwZDdjYzUyNyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNjcuNi4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY3
LjYuMS5iYgpAQCAtMTEsNyArMTEsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAi
IGZpbGU6Ly8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZQogU1JDX1VS
SSArPSAiIFwKICAgICAgICAgICAgIGZpbGU6Ly8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5
LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3RpdGUucGF0Y2giCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICIyZWU4OTJjZDVmMjlmMzM3MzA5N2Y1YTgxNDY5N2UzOTdjZjNjZTMxMzYxNmRmMGFmMTEy
MzFlMmFkMTE4MDc3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI1N2RlOTJhOWQ1MGE2MGI4ZTIy
YWJmY2JiNzcxNTcxZmRlMGRiZjNlYzIzNDQ2MzIxMjAyN2E0ZWVlY2JlOWEiCiAKIERFUEVORFMg
Kz0gIiR7UFlUSE9OX1BOfSIKIAotLSAKMi4zOS4yCgo=

--===============8315222837184175038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-67.6.0.tar.gz;downloadfilename=setuptools-67.6.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-67.6.1.tar.gz;downloadfilename=setuptools-67.6.1.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 67.6.0 [default] to 67.6.1 [default]
packages/core2-32-poky-linux/python3-setuptools: PV changed from "67.6.0" to "67.6.1"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 67.6.0 [default] to 67.6.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "67.6.0" to "67.6.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 67.6.0 [default] to 67.6.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "67.6.0" to "67.6.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 67.6.0 [default] to 67.6.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "67.6.0" to "67.6.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 67.6.0 [default] to 67.6.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "67.6.0" to "67.6.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 67.6.0 [default] to 67.6.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "67.6.0" to "67.6.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 67.6.0 [default] to 67.6.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "67.6.0" to "67.6.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 67.6.0 [default] to 67.6.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "67.6.0" to "67.6.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 67.6.0 [default] to 67.6.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "67.6.0" to "67.6.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 5296118 to 5296613 (+0%)
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-67.6.0.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-67.6.1.dist-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-67.6.0.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-67.6.1.dist-info

--===============8315222837184175038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-67.6.0.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-67.6.1.dist-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-67.6.0.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-67.6.1.dist-info

--===============8315222837184175038==--

