Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C23C3DA7D
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:07 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.20656.1672605966065155977
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=leBmkjQF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101856f159b56-1680f4e2-12fb-4cc6-88cf-f7dd606b0ae8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605965;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ErGDfkKr+It9tFP3KJwRiHMfcqlowsffQQAgw1r8H6w=;
	b=leBmkjQF4I9hPNJl8hIqroWuapzeI9sNW+G0Exv8waZ4AZu7Jan6JjhebB1Msl2r
	BnTElv+AHMG0Eg86pA8gbwqfDq5VHU4r3gKo0acpbAgD48//tElfixnsifNP8qPwbFc
	3B9yw4vhSKJOf98vDsMHYLrJfKVdMz7N9rsh/SJY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605965;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ErGDfkKr+It9tFP3KJwRiHMfcqlowsffQQAgw1r8H6w=;
	b=bibLPI//DoTWtiJ+bNlBhuN7ZhZRA3+cD+TLb8bzJHfHVGPt7IkuOf3dDx0OrLwe
	CJu8VAaGbAN2A1BKMNOwjKAr1JTgxOiNJEMkMc7nvI42/kJKwKnGCSMXL9bkqeNbS9Z
	GWEWusY5b3F+9BFQtR9ueuggNUi6zMN67dfmquPA=
Content-Type: multipart/mixed; boundary="===============8395193934899549227=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] file: upgrading to 5.44 SUCCEEDED
Message-ID: <010101856f159b56-1680f4e2-12fb-4cc6-88cf-f7dd606b0ae8-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175242

--===============8395193934899549227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *file* to *5.44* has Succeeded.

Next steps:
    - apply the patch: git am 0001-file-upgrade-5.43-5.44.patch
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
--===============8395193934899549227==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-file-upgrade-5.43-5.44.patch"

RnJvbSA2MGQwZjM0ZjRhYWM1NTE4MDY2MjkxMDhiMjFkYTNmYmQwYzFjYzkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAwNzoxMTowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZp
bGU6IHVwZ3JhZGUgNS40MyAtPiA1LjQ0CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9maWxl
L3tmaWxlXzUuNDMuYmIgPT4gZmlsZV81LjQ0LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9maWxlL3tmaWxlXzUuNDMuYmIgPT4gZmlsZV81LjQ0LmJifSAoOTclKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9maWxlL2ZpbGVfNS40My5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9maWxlL2ZpbGVfNS40NC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmlsZS9maWxlXzUuNDMuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9maWxlL2ZpbGVfNS40NC5iYgppbmRleCAxMDJkMGZkYTI2Li5iM2Q4
MjE1MThhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmlsZS9maWxlXzUuNDMu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2ZpbGUvZmlsZV81LjQ0LmJiCkBAIC0xMyw3
ICsxMyw3IEBAIERFUEVORFM6Y2xhc3MtbmF0aXZlID0gImJ6aXAyLXJlcGxhY2VtZW50LW5hdGl2
ZSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2ZpbGUvZmlsZS5naXQ7YnJhbmNoPW1h
c3Rlcjtwcm90b2NvbD1odHRwcyIKIAotU1JDUkVWID0gIjAxMTc3OGEyODc3Zjc1NTk3ZWQ4M2Mx
YTI3MTZkOTE3NzcwOTIwZWUiCitTUkNSRVYgPSAiYjkyZWVkNDFiMWJjMDczOWM1YzVkNzBjNDQ0
ZTBjNTc0NDI5MzIxYiIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIGluaGVyaXQgYXV0b3Rvb2xz
IHVwZGF0ZS1hbHRlcm5hdGl2ZXMKLS0gCjIuMzcuMwoK

--===============8395193934899549227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/file/file-dbg: PKGV changed from 5.43 [default] to 5.44 [default]
packages/core2-32-poky-linux/file/file-dbg: PV changed from "5.43" to "5.44"
packages/core2-32-poky-linux/file/file-dbg: PKGSIZE changed from 522620 to 523208 (+0%)
packages/core2-32-poky-linux/file/file-dev: PKGV changed from 5.43 [default] to 5.44 [default]
packages/core2-32-poky-linux/file/file-dev: PV changed from "5.43" to "5.44"
packages/core2-32-poky-linux/file/file-dev: PKGSIZE changed from 6027 to 6129 (+2%)
packages/core2-32-poky-linux/file/file-doc: PKGV changed from 5.43 [default] to 5.44 [default]
packages/core2-32-poky-linux/file/file-doc: PV changed from "5.43" to "5.44"
packages/core2-32-poky-linux/file/file-doc: PKGSIZE changed from 57701 to 57876 (+0%)
packages/core2-32-poky-linux/file/file-locale: PKGV changed from 5.43 [default] to 5.44 [default]
packages/core2-32-poky-linux/file/file-locale: PV changed from "5.43" to "5.44"
packages/core2-32-poky-linux/file/file-src: PKGV changed from 5.43 [default] to 5.44 [default]
packages/core2-32-poky-linux/file/file-src: PV changed from "5.43" to "5.44"
packages/core2-32-poky-linux/file/file-src: PKGSIZE changed from 504794 to 513281 (+2%)
packages/core2-32-poky-linux/file/file-staticdev: PKGV changed from 5.43 [default] to 5.44 [default]
packages/core2-32-poky-linux/file/file-staticdev: PV changed from "5.43" to "5.44"
packages/core2-32-poky-linux/file/file: PKGV changed from 5.43 [default] to 5.44 [default]
packages/core2-32-poky-linux/file/file: PV changed from "5.43" to "5.44"
packages/core2-32-poky-linux/file/file: PKGSIZE changed from 8166409 to 8468257 (+4%)
packages/core2-32-poky-linux/file: PKGV changed from 5.43 [default] to 5.44 [default]
packages/core2-32-poky-linux/file: PV changed from "5.43" to "5.44"

--===============8395193934899549227==--

