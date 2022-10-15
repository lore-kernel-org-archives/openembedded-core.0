Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5236C63708
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:19 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web12.24543.1665871395362773038
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nokKy2og;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010183ddac3465-088e4337-fd5d-47bc-b656-e5717e584cf4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/2FTCQTed2D5ocRBoNBWGWP9cwSvRLCGTYtWJVdUmhI=;
	b=nokKy2ogX5I4cPSDDDXc8ukz20/t1r04WNUYBYhJvUtwT1Z94wMTumHIEhuy5as6
	JjFVl75BmdUo8KQGw600TZ/s8wyKYTP5bBITxx5xouX/X24Il2Z/evlgU+l3kgVpvFq
	Rspkod8zqqWP4Dnk648/SxWRL2JFQp8VTTuVWrwk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/2FTCQTed2D5ocRBoNBWGWP9cwSvRLCGTYtWJVdUmhI=;
	b=GAJUH6iCPZcNWt3cMUUIsXBQfFlSx8Be3ud6Uz/f9ligNBDD3zeY7g/BPysE7R54
	aIfzXL8t2UqMhlwlbukrNn0ICptR9EIQPHZp1gpFbD+C6py5BoEwahg4kCxtBqIvFwX
	+E1B4ifNS5ZvXFNV4k8NqktNKi5lwP0x2COSXHJ0=
Content-Type: multipart/mixed; boundary="===============2988346894416566444=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 65.5.0 SUCCEEDED
Message-ID: <01010183ddac3465-088e4337-fd5d-47bc-b656-e5717e584cf4-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171818

--===============2988346894416566444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *65.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-65.0.2-65.5.0.patch
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
--===============2988346894416566444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-65.0.2.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-65.5.0.dist-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-65.0.2.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-65.5.0.dist-info

--===============2988346894416566444==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-65.0.2-65.5.0.patch"

RnJvbSA3YzQzMTlhNGU3MDlkMWZmYTVhNGI5NTg2MzYxNTcxZjU0MWJjYzAzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTE6MDY6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHM6IHVwZ3JhZGUgNjUuMC4yIC0+IDY1LjUuMAoKLS0tCiAuLi4vMDAw
MS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaCAg
fCAyICstCiAuLi55dGhvbjMtc2V0dXB0b29sc182NS4wLjIuYmIgPT4gcHl0aG9uMy1zZXR1cHRv
b2xzXzY1LjUuMC5iYn0gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRo
b24zLXNldHVwdG9vbHNfNjUuMC4yLmJiID0+IHB5dGhvbjMtc2V0dXB0b29sc182NS41LjAuYmJ9
ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lf
aW5zdGFsbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1
cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3Rh
bGwucGF0Y2gKaW5kZXggYzhjNzEzYzg0Mi4uNmQ0NTg0MjU0MSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25h
bGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFs
bHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSA0MmQzNDkwMzFjZDk1MmMxMjYyMGZjZjAyY2JhYjcwYTM3MWY0YjE5IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjOWQ2NDNkMmM3Mzg4NTc2MGU5MmQ2YzE0MTljZDY5Y2M3
MmMyOTY0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1
LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNyBKdWwgMjAxOCAxMDoxMzozOCArMDgw
MAogU3ViamVjdDogW1BBVENIXSBjb25kaXRpb25hbGx5IGRvIG5vdCBmZXRjaCBjb2RlIGJ5IGVh
c3lfaW5zdGFsbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNldHVwdG9vbHNfNjUuMC4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXNldHVwdG9vbHNfNjUuNS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY1LjAu
Mi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHNfNjUuNS4wLmJiCmluZGV4IDFhNjM5ZWEzMzMuLjgxOThjYmQxMDQgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY1LjAuMi5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc182
NS41LjAuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0g
IiBmaWxlOi8vMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWUKIFNSQ19V
UkkgKz0gImZpbGU6Ly8wMDAxLWNoYW5nZS1zaGViYW5nLXRvLXB5dGhvbjMucGF0Y2ggXAogICAg
ICAgICAgICAgZmlsZTovLzAwMDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1wb3Nz
aWJsZS10by1zdWJzdGl0ZS5wYXRjaCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjEwMWJmMTVj
YTcyM2JlZWY0MmM4ZGI5MWE3NjFmMzc0OGQ0ZDY5N2UxN2ZhZTkwNGRiNjBjMGI2MTlkOGQwOTQi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTEyZTU1MzYyMjBlMzgxNDYxNzZlZmI4MzNkNGE2MmFh
NzI2YjdiYmZmODJjZmJjOGJhOWVhYTM5OTZlMGIxNyIKIAogREVQRU5EUyArPSAiJHtQWVRIT05f
UE59IgogCi0tIAoyLjMxLjEKCg==

--===============2988346894416566444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-65.0.2.tar.gz file://0001-change-shebang-to-python3.patch file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-65.5.0.tar.gz file://0001-change-shebang-to-python3.patch file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/core2-32-poky-linux/python3-setuptools: PV changed from "65.0.2" to "65.5.0"
packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 65.0.2 [default] to 65.5.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "65.0.2" to "65.5.0"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 65.0.2 [default] to 65.5.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "65.0.2" to "65.5.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 65.0.2 [default] to 65.5.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "65.0.2" to "65.5.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 65.0.2 [default] to 65.5.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "65.0.2" to "65.5.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 65.0.2 [default] to 65.5.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "65.0.2" to "65.5.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 65.0.2 [default] to 65.5.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "65.0.2" to "65.5.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 65.0.2 [default] to 65.5.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "65.0.2" to "65.5.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 65.0.2 [default] to 65.5.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "65.0.2" to "65.5.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 65.0.2 [default] to 65.5.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 4902330 to 4898697 (-0%)
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-65.0.2.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-65.5.0.dist-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-65.0.2.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-65.5.0.dist-info

--===============2988346894416566444==--

