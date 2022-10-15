Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2ACCC64EC6
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web08.24447.1665871392572109692
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cxtsSzu+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010183ddac331f-a2d1f461-f622-47e7-8f93-9c9c33a5e9c9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BviDIhu/GuIFoBeIxMzh7sTWH9sufWdP+lpiM/KJkcA=;
	b=cxtsSzu+Bav5qtNAdjiWoiflP1Vc4UxrtK0vTnql1ejt1kiJzZk6L2iqvRJtKmnY
	HlS3EnznqXtRMDwgrDMaFLK7Q0NcIa0BXDl52ZmOPeHQ4hfSUWQsqkiE+8tnz7bsRTu
	hEE6rhxKvt/wh4nN3dJUns+AuvHTW8dg2R72taYc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BviDIhu/GuIFoBeIxMzh7sTWH9sufWdP+lpiM/KJkcA=;
	b=CUDder21AcVt8MjJYg5CvoiSts3Ww7x0Z8HKpy9DyoGr9ZwT76y46B+pKOAlIou2
	MLYu/y8VYkbZGnnteF1mcIRiNpYxMDxuGOfKvEkvOtvnl8NTYxaLrl99HDw1EcA6WAB
	EfngYZ5AzhzsHql7qRXi9HaV7OSYqQZXjg7jFXe8=
Content-Type: multipart/mixed; boundary="===============0409239703699889155=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-iso8601: upgrading to 1.1.0 SUCCEEDED
Message-ID: <01010183ddac331f-a2d1f461-f622-47e7-8f93-9c9c33a5e9c9-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171771

--===============0409239703699889155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-iso8601* to *1.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-iso8601-upgrade-1.0.2-1.1.0.patch
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
--===============0409239703699889155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-iso8601 (sysroot):
  /usr/lib/python3.10/site-packages/iso8601-1.0.2.dist-info moved to /usr/lib/python3.10/site-packages/iso8601-1.1.0.dist-info

--===============0409239703699889155==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-iso8601-upgrade-1.0.2-1.1.0.patch"

RnJvbSA0MGNhOGI5YWQxNmZjYTU0NTkwOGQ2ZWRjYWU3NmZlZGVhMDBiMTU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTA6MjI6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWlzbzg2MDE6IHVwZ3JhZGUgMS4wLjIgLT4gMS4xLjAKCi0tLQogLi4uODYwMV8xLjAu
Mi5iYiA9PiBweXRob24zLWlzbzg2MDFfMS4xLjAuYmJ9IHwgMjMgKysrKysrKysrKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1pc284NjAxXzEuMC4yLmJi
ID0+IHB5dGhvbjMtaXNvODYwMV8xLjEuMC5iYn0gKDI0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaXNvODYwMV8xLjAuMi5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pc284NjAxXzEuMS4wLmJiCnNpbWlsYXJpdHkg
aW5kZXggMjQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1pc284NjAxXzEuMC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaXNvODYwMV8xLjEuMC5iYgppbmRleCA5M2FmMjMzZDI5Li5lZGU3ZDk5Y2U1IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaXNvODYwMV8x
LjAuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaXNvODYw
MV8xLjEuMC5iYgpAQCAtMSw5ICsxLDI4IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NV
TSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBm
b2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxp
Y2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQs
IGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAn
TGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHly
aWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5T
RQorIyArKysgTElDRU5TRQorIyBAQCAtMSw0ICsxLDQgQEAKKyMgLUNvcHlyaWdodCAoYykgMjAw
NyAtIDIwMTUgTWljaGFlbCBUd29tZXkKKyMgK0NvcHlyaWdodCAoYykgMjAwNyAtIDIwMjIgTWlj
aGFlbCBUd29tZXkKKyMgIAorIyAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBv
ZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEKKyMgIGNvcHkgb2YgdGhpcyBzb2Z0
d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUKKyMgCisjCisKIFNV
TU1BUlkgPSAiU2ltcGxlIG1vZHVsZSB0byBwYXJzZSBJU08gODYwMSBkYXRlcyIKIEhPTUVQQUdF
ID0gImh0dHA6Ly9weWlzbzg2MDEucmVhZHRoZWRvY3Mub3JnLyIKIExJQ0VOU0UgPSAiTUlUIgot
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YjA1NjI1ZjIzMzZmYTAyNGU4
ZDU3ZTY1YzY1OTU4NDQiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1h
YWIzMWYyZWY3YmEyMTRhNWEzNDFlYWE0N2E3ZjM2NyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjI3ZjUwMzIyMGU2ODQ1ZDlkYjk1NGZiMjEyYjk1YjAzNjJkOGI3ZTZjMWIyMzI2YTg3MDYxYzNk
ZTkzNTk0YjEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzI4MTFlN2I4MWRlZWUyMDYzZWE2ZDJl
OTRmODgxOWE4NmQxZjM4MTFlNDlkMjM2MjNhNDFmYTgzMmJlZjAzZiIKIAogaW5oZXJpdCBweXBp
IHB5dGhvbl9wb2V0cnlfY29yZQogCi0tIAoyLjMxLjEKCg==

--===============0409239703699889155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-iso8601: PV changed from "1.0.2" to "1.1.0"
packages/core2-32-poky-linux/python3-iso8601: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/iso8601/iso8601-1.0.2.tar.gz" to "https://files.pythonhosted.org/packages/source/i/iso8601/iso8601-1.1.0.tar.gz"
packages/core2-32-poky-linux/python3-iso8601: PKGV changed from 1.0.2 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-dbg: PV changed from "1.0.2" to "1.1.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-dbg: PKGV changed from 1.0.2 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-dev: PV changed from "1.0.2" to "1.1.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-dev: PKGV changed from 1.0.2 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-doc: PV changed from "1.0.2" to "1.1.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-doc: PKGV changed from 1.0.2 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-locale: PV changed from "1.0.2" to "1.1.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-locale: PKGV changed from 1.0.2 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-src: PV changed from "1.0.2" to "1.1.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-src: PKGV changed from 1.0.2 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-staticdev: PV changed from "1.0.2" to "1.1.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601-staticdev: PKGV changed from 1.0.2 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601: PV changed from "1.0.2" to "1.1.0"
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601: PKGV changed from 1.0.2 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/python3-iso8601/python3-iso8601: PKGSIZE changed from 37424 to 38691 (+3%)
Changes to packages/core2-32-poky-linux/python3-iso8601 (sysroot):
  /usr/lib/python3.10/site-packages/iso8601-1.0.2.dist-info moved to /usr/lib/python3.10/site-packages/iso8601-1.1.0.dist-info

--===============0409239703699889155==--

