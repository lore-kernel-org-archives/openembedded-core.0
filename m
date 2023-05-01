Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20E5C87FDE
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:51 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.107884.1682976349140769713
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Cg0vfGHF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010187d9351ae1-76510a1d-e919-46fd-a526-a2da6cf5e124-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=t/onIP9S9SMG5sbeMUli3L4VcPE6V7fW7yApCRmC6oQ=;
	b=Cg0vfGHFZZNipf+svsBE+mlbtnna9HJFasTA3IXI03+lCHPyVGnzUOMJjPV+tCHl
	LbpTklQ3MaHu4qDMMc0tAK3s2ej772j+XTyFjgI9q1i7MfzGUwtKVIZGrX95VP9WO1x
	4eQhVVdoqclXJ1BHhzUeUTwON3EQVNwrhqIOIIVE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=t/onIP9S9SMG5sbeMUli3L4VcPE6V7fW7yApCRmC6oQ=;
	b=j6wCCAk18RkAJnI9ACBGhFxUzhw0EIKfZksdxFkWlMI0KIto8epgNhu67W728qRo
	UCTooB64pBm2jJrxjUEKpHKoBf6lGUlcXdZ1ABuIGcEwiEJQz35RxHK6utcFdwiL74l
	I1OZ+m/phi9fAd+clC/R9DDnBLtqvAZEeFSs/Dcc=
Content-Type: multipart/mixed; boundary="===============5774440748633492558=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 0.21.1 SUCCEEDED
Message-ID: <01010187d9351ae1-76510a1d-e919-46fd-a526-a2da6cf5e124-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180598

--===============5774440748633492558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *createrepo-c* to *0.21.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-createrepo-c-upgrade-0.20.1-0.21.1.patch
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
--===============5774440748633492558==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-0.20.1-0.21.1.patch"

RnJvbSAyMTMyZjAwMzY4NTBiNzgxZmEwNDNjZTRiYTY1Zjk2ZjUyZDU5YTk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAwODoyNjowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNy
ZWF0ZXJlcG8tYzogdXBncmFkZSAwLjIwLjEgLT4gMC4yMS4xCgotLS0KIC4uLi9jcmVhdGVyZXBv
LWMvMDAwMS1pbmNsdWRlLXJwbS1ycG1zdHJpbmcuaC5wYXRjaCAgICAgIHwgOSArKysrKystLS0K
IC4uLi97Y3JlYXRlcmVwby1jXzAuMjAuMS5iYiA9PiBjcmVhdGVyZXBvLWNfMC4yMS4xLmJifSAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy97Y3JlYXRlcmVwby1j
XzAuMjAuMS5iYiA9PiBjcmVhdGVyZXBvLWNfMC4yMS4xLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jLzAwMDEtaW5j
bHVkZS1ycG0tcnBtc3RyaW5nLmgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRl
cmVwby1jL2NyZWF0ZXJlcG8tYy8wMDAxLWluY2x1ZGUtcnBtLXJwbXN0cmluZy5oLnBhdGNoCmlu
ZGV4IGEyNDllYWY1YTEuLjg4MzAxOTFmNjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jLzAwMDEtaW5jbHVkZS1ycG0tcnBtc3RyaW5n
LmgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVy
ZXBvLWMvMDAwMS1pbmNsdWRlLXJwbS1ycG1zdHJpbmcuaC5wYXRjaApAQCAtMSw3ICsxLDcgQEAK
LUZyb20gOGRlZmU2YWFmOTE2MTNjM2ZjYjU0MGRmNjVhOTRjZDU2ZDM3NzM2NyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gNmY1NjFkNzU1MzdjNzgxNTU3NTVhMzk4ZmZlNzQ5YzViYmI4
NDNjYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+CiBEYXRlOiBGcmksIDEzIEphbiAyMDIzIDEzOjIxOjUxIC0wODAwCi1TdWJqZWN0
OiBbUEFUQ0ggMS8yXSBpbmNsdWRlIHJwbS9ycG1zdHJpbmcuaAorU3ViamVjdDogW1BBVENIXSBp
bmNsdWRlIHJwbS9ycG1zdHJpbmcuaAogCiBJdHMgbmVlZGVkIGZvciByYXNwcmludGYgZGVjbGFy
YXRpb24KIApAQCAtMTEsMTAgKzExLDEzIEBAIG9uICdyYXNwcmludGYnOyBJU08gQzk5IGFuZCBs
YXRlciBkbyBub3Qgc3VwcG9ydCBpbXBsaWNpdCBmdW5jdGlvbiBkZWNsYXJhdGlvbnMKIAogVXBz
dHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0aHViLmNvbS9ycG0tc29mdHdhcmUt
bWFuYWdlbWVudC9jcmVhdGVyZXBvX2MvcHVsbC8zNDBdCiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgorCiAtLS0KICBzcmMveG1sX2ZpbGUuYyB8IDEgKwogIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCitkaWZmIC0tZ2l0IGEvc3JjL3htbF9maWxl
LmMgYi9zcmMveG1sX2ZpbGUuYworaW5kZXggZDI0MDBiOC4uODcxMTA5YyAxMDA2NDQKIC0tLSBh
L3NyYy94bWxfZmlsZS5jCiArKysgYi9zcmMveG1sX2ZpbGUuYwogQEAgLTE5LDYgKzE5LDcgQEAK
QEAgLTIzLDUgKzI2LDUgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWls
LmNvbT4KICAjaW5jbHVkZSA8Z2xpYi9nc3RkaW8uaD4KICsjaW5jbHVkZSA8cnBtL3JwbXN0cmlu
Zy5oPgogICNpbmNsdWRlIDxhc3NlcnQuaD4KKyAjaW5jbHVkZSA8cnBtL3JwbXN0cmluZy5oPgog
ICNpbmNsdWRlICJ4bWxfZmlsZS5oIgotICNpbmNsdWRlIDxlcnJuby5oPgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWNfMC4yMC4xLmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWNfMC4yMS4x
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzAuMjAuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWNfMC4yMS4xLmJiCmluZGV4IDFj
NGNkZDVlM2MuLjBmMWY3YWE2ZmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9j
cmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzAuMjAuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tY18wLjIxLjEuYmIKQEAgLTksNyArOSw3IEBA
IFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9ycG0tc29mdHdhcmUtbWFuYWdlbWVudC9jcmVh
dGVyZXBvX2M7YnJhbmNoPW1hc3RlcjtwCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWluY2x1ZGUt
cnBtLXJwbXN0cmluZy5oLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAiYWYxNGUx
NjRhM2U0YWI5ZGZhZWYxMjEyZTg1MmI5ZWNlYmMzMjZhMiIKK1NSQ1JFViA9ICIwNjUyZDczMDNj
ZTIzNmU1OTZjODNjMjljY2M5YmVlNzg2OGZjZTZlIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0Igog
Ci0tIAoyLjM5LjIKCg==

--===============5774440748633492558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: FILELIST: removed "/usr/lib/.debug/libcreaterepo_c.so.0.20.1", added "/usr/lib/.debug/libcreaterepo_c.so.0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1158848 to 1213820 (+5%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGSIZE changed from 142602 to 146318 (+3%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGSIZE changed from 1222467 to 1271448 (+4%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.0.20.1", added "/usr/lib/libcreaterepo_c.so.0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGSIZE changed from 526215 to 534884 (+2%)
packages/core2-32-poky-linux/createrepo-c: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.20.1 to libcreaterepo_c.so.0.21.1
  /usr/lib/libcreaterepo_c.so.0.20.1 moved to /usr/lib/libcreaterepo_c.so.0.21.1

--===============5774440748633492558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.0.20.1", added "/usr/lib/libcreaterepo_c.so.0.21.1"
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.20.1 to libcreaterepo_c.so.0.21.1
  /usr/lib/libcreaterepo_c.so.0.20.1 moved to /usr/lib/libcreaterepo_c.so.0.21.1

--===============5774440748633492558==--

