Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B10C7EE24
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.12302.1678895726767966571
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MnWT/kD5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010186e5fbbbac-b19224bd-3739-41f2-a993-aff23c6a8fea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895726;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VeMPzDJXgDv7fmMnUqFOyfrG8JsFSzvvElHqcI3HXkc=;
	b=MnWT/kD5qTpby3odt9UOzZrQ42Ywr7mGEn/0DEc939g+eSjwUb9MqTwKKPQkmm91
	XenSelxPSvl30InrTDr6+rCo1OySy7+5LWKb+bh5aqwwBWOCciB7oBRg64XhfFwYzO5
	R0tHzTvEJ0ibNUrbI+zQqURQaRsb7gH2KVN9S+yM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895726;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VeMPzDJXgDv7fmMnUqFOyfrG8JsFSzvvElHqcI3HXkc=;
	b=SwVTvnGg8QWvl/i4bBbyAUcuOnD0anU/evus/InvSBoSbRlXnR7tyhi4C8csTvoq
	IFiK77ciag8P8NrW0vf6oRfFCKppDihJjDWZUmy0O554gCsL8D7kZj7d7z/9UOBSW7V
	79Zv9j+a32XGzAR25yIaWEU5jzYhVIMz4s76AJCY=
Content-Type: multipart/mixed; boundary="===============7127139216613563297=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 67.6.0 SUCCEEDED
Message-ID: <01010186e5fbbbac-b19224bd-3739-41f2-a993-aff23c6a8fea-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178608

--===============7127139216613563297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *67.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-67.4.0-67.6.0.patch
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
--===============7127139216613563297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-67.4.0.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-67.6.0.dist-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-67.4.0.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-67.6.0.dist-info

--===============7127139216613563297==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-67.4.0-67.6.0.patch"

RnJvbSA0YWNjNThmNDBlZjIxMWE2MmIzZjdmYmI4MjlmOTM0YTFmZmEwNTlmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMDg6MTU6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHM6IHVwZ3JhZGUgNjcuNC4wIC0+IDY3LjYuMAoKLS0tCiAuLi4vMDAw
MS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaCAg
fCAyICstCiAuLi55dGhvbjMtc2V0dXB0b29sc182Ny40LjAuYmIgPT4gcHl0aG9uMy1zZXR1cHRv
b2xzXzY3LjYuMC5iYn0gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRo
b24zLXNldHVwdG9vbHNfNjcuNC4wLmJiID0+IHB5dGhvbjMtc2V0dXB0b29sc182Ny42LjAuYmJ9
ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lf
aW5zdGFsbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1
cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3Rh
bGwucGF0Y2gKaW5kZXggYjEyZTRmNWQwNS4uOTA4NmI1Mjc3OSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25h
bGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFs
bHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSA4YTY3NzEwMTMxZmMxYjgyNDZlZGM0ZGJjZDgwNzdlZWQ5NmUxM2Y3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlN2RjYmM4NjI5YzMyYjk0N2I4ODJkMDE0NmVkYjU0Njk4
N2ZlZjUzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1
LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNyBKdWwgMjAxOCAxMDoxMzozOCArMDgw
MAogU3ViamVjdDogW1BBVENIXSBjb25kaXRpb25hbGx5IGRvIG5vdCBmZXRjaCBjb2RlIGJ5IGVh
c3lfaW5zdGFsbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNldHVwdG9vbHNfNjcuNC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXNldHVwdG9vbHNfNjcuNi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY3LjQu
MC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHNfNjcuNi4wLmJiCmluZGV4IDFhMjlkMzdhMDIuLmFhMWQ1MjVjMDIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY3LjQuMC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc182
Ny42LjAuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0g
IiBmaWxlOi8vMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWUKIFNSQ19V
UkkgKz0gIiBcCiAgICAgICAgICAgICBmaWxlOi8vMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5w
eS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZTVmZDBhNzEzMTQxYTRhMTA1NDEyMjMzYzYzZGM0ZTE3YmEwMDkwYzhlODMzNDU5NGFj
NzkwZWM5Nzc5MjMzMCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyZWU4OTJjZDVmMjlmMzM3MzA5
N2Y1YTgxNDY5N2UzOTdjZjNjZTMxMzYxNmRmMGFmMTEyMzFlMmFkMTE4MDc3IgogCiBERVBFTkRT
ICs9ICIke1BZVEhPTl9QTn0iCiAKLS0gCjIuMzkuMgoK

--===============7127139216613563297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools: PV changed from "67.4.0" to "67.6.0"
packages/core2-32-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-67.4.0.tar.gz;downloadfilename=setuptools-67.4.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-67.6.0.tar.gz;downloadfilename=setuptools-67.6.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 67.4.0 [default] to 67.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "67.4.0" to "67.6.0"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 67.4.0 [default] to 67.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGSIZE changed from 1387533 to 1393781 (+0%)
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "67.4.0" to "67.6.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 67.4.0 [default] to 67.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "67.4.0" to "67.6.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 67.4.0 [default] to 67.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "67.4.0" to "67.6.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 67.4.0 [default] to 67.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "67.4.0" to "67.6.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 67.4.0 [default] to 67.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "67.4.0" to "67.6.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 67.4.0 [default] to 67.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "67.4.0" to "67.6.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 67.4.0 [default] to 67.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "67.4.0" to "67.6.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 67.4.0 [default] to 67.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 5294020 to 5296118 (+0%)
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-67.4.0.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-67.6.0.dist-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-67.4.0.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-67.6.0.dist-info

--===============7127139216613563297==--

