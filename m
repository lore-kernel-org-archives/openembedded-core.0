Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C780DC38A2B
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:52 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web09.345.1664643227257295476
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QvmVf8xR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101839477e57d-419e403d-1401-49fa-b535-f48814a25166-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643229;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=YwQJDz2ADOJimVodxJu4HXA5z54ud+YmQFrMNEL350o=;
	b=QvmVf8xRlOavmWCdY5ncp/jl9Ef7WdBMnRslxhd1Hr8KgdUv3ioMpuLpGtvrcc+A
	8tyTR4odLMQluKbKZ21o9SuRAdzSfZKEtoO62Z+PCzXTeIrFvJjN1wmN8Gnxo/sD47a
	enOm/G7/gs1VxQZ4fB6iQGYJJz+WVdWFpiyGij2I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643229;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=YwQJDz2ADOJimVodxJu4HXA5z54ud+YmQFrMNEL350o=;
	b=H7N4UD7ZsyLsmF1jHKdIKfSO4xedVhuDp+hhsACxIqTqGyK68zz4CxAvi8cO8PR7
	brJ4f4GYvY3O8CHl9HQ0lsZezQxuHXUuX/JWDP8mY45+Y9sM0/oSZnfJsm1Yy4vIpLG
	/RlPlHII/7oPF6Gk3uTiB5kb7/hp6QzZOX1Av0BE=
Content-Type: multipart/mixed; boundary="===============7007367590736456118=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] gnutls: upgrading to 3.7.8 SUCCEEDED
Message-ID: 
 <010101839477e57d-419e403d-1401-49fa-b535-f48814a25166-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:49 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171327

--===============7007367590736456118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnutls* to *3.7.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnutls-upgrade-3.7.7-3.7.8.patch
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
--===============7007367590736456118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gnutls/gnutls: FILELIST: removed "/usr/lib/libgnutls.so.30.34.1", added "/usr/lib/libgnutls.so.30.34.2"
Changes to packages/core2-32-poky-linux/gnutls (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.34.1 to libgnutls.so.30.34.2
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.34.1 to libgnutls.so.30.34.2
  /usr/lib/libgnutls.so.30.34.1 moved to /usr/lib/libgnutls.so.30.34.2
Changes to packages/x86_64-linux/gnutls-native (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.34.1 to libgnutls.so.30.34.2
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.34.1 to libgnutls.so.30.34.2
  /usr/lib/libgnutls.so.30.34.1 moved to /usr/lib/libgnutls.so.30.34.2

--===============7007367590736456118==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnutls-upgrade-3.7.7-3.7.8.patch"

RnJvbSBjNjY0NDI4MGQ0YjVkY2Q2NDFlNmJiMTdmYzkxNmNkNjI5ZDkxNjIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAxNTo0MDozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdu
dXRsczogdXBncmFkZSAzLjcuNyAtPiAzLjcuOAoKLS0tCiAuLi4vcmVjaXBlcy1zdXBwb3J0L2du
dXRscy97Z251dGxzXzMuNy43LmJiID0+IGdudXRsc18zLjcuOC5iYn0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9nbnV0bHMve2dudXRsc18zLjcuNy5iYiA9PiBnbnV0bHNfMy43LjguYmJ9ICg5
NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRsc18zLjcu
Ny5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHNfMy43LjguYmIKc2ltaWxh
cml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2du
dXRsc18zLjcuNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRs
c18zLjcuOC5iYgppbmRleCAwMWZkNGRiYTNkLi5mMmU5MTZmYzRlIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzXzMuNy43LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2dudXRscy9nbnV0bHNfMy43LjguYmIKQEAgLTI0LDcgKzI0LDcgQEAgU1JDX1VS
SSA9ICJodHRwczovL3d3dy5nbnVwZy5vcmcvZnRwL2djcnlwdC9nbnV0bHMvdiR7U0hSVF9WRVJ9
L2dudXRscy0ke1BWfS50YXIKICAgICAgICAgICAgZmlsZTovLzAwMDEtQ3JlYXRpbmctLmhtYWMt
ZmlsZS1zaG91bGQtYmUtZXhjdXRlZC1pbi10YXJnZXQtZW52aS5wYXRjaCBcCiAgICAgICAgICAg
ICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImJlOTE0M2QwZDU4ZWFiNjRkYmE5Yjc3MTE0YWFh
ZmFjNTI5YjZjMGQ3ZTgxZGU2YmRmMWM5YjU5MDI3ZDIxMDYiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiYzU4YWQzOWFmMDY3MGVmZTZhOGFlZTVlM2E4YjIzMzFhMTIwMDQxOGI2NGI3YzUxOTc3ZmIz
OTZkNDYxNzExNCIKIAogaW5oZXJpdCBhdXRvdG9vbHMgdGV4aW5mbyBwa2djb25maWcgZ2V0dGV4
dCBsaWJfcGFja2FnZSBndGstZG9jCiAKLS0gCjIuMzEuMQoK

--===============7007367590736456118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gnutls/gnutls-bin: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-bin: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-dbg: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-dbg: PKGSIZE changed from 7555844 to 7588476 (+0%)
packages/core2-32-poky-linux/gnutls/gnutls-dbg: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-dbg: FILELIST: removed "/usr/lib/.debug/libgnutls.so.30.34.1", added "/usr/lib/.debug/libgnutls.so.30.34.2"
packages/core2-32-poky-linux/gnutls/gnutls-dev: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-dev: PKGSIZE changed from 466407 to 466380 (-0%)
packages/core2-32-poky-linux/gnutls/gnutls-dev: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-doc: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-doc: PKGSIZE changed from 4419986 to 4422615 (+0%)
packages/core2-32-poky-linux/gnutls/gnutls-doc: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-fips: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-fips: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-cs: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-locale-cs: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-de: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-locale-de: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-eo: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-locale-eo: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-es: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-locale-es: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-fi: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-locale-fi: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-fr: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-locale-fr: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-it: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-locale-it: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-ms: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-locale-ms: PKGSIZE changed from 25528 to 25908 (+1%)
packages/core2-32-poky-linux/gnutls/gnutls-locale-ms: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-nl: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-locale-nl: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-pl: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-locale-pl: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-pt-br: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-locale-pt-br: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-sr: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-locale-sr: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-sv: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-locale-sv: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-uk: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-locale-uk: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-vi: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-locale-vi: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-zh-cn: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-locale-zh-cn: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-openssl: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-openssl: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-src: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-src: PKGSIZE changed from 8435008 to 8451585 (+0%)
packages/core2-32-poky-linux/gnutls/gnutls-src: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-staticdev: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-staticdev: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-xx: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-xx: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls: PKGSIZE changed from 2284748 to 2292940 (+0%)
packages/core2-32-poky-linux/gnutls/gnutls: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls: FILELIST: removed "/usr/lib/libgnutls.so.30.34.1", added "/usr/lib/libgnutls.so.30.34.2"
packages/core2-32-poky-linux/gnutls: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.7.tar.xz file://arm_eabi.patch file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch" to "https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.8.tar.xz file://arm_eabi.patch file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch"
packages/core2-32-poky-linux/gnutls: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
Changes to packages/core2-32-poky-linux/gnutls (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.34.1 to libgnutls.so.30.34.2
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.34.1 to libgnutls.so.30.34.2
  /usr/lib/libgnutls.so.30.34.1 moved to /usr/lib/libgnutls.so.30.34.2
Changes to packages/x86_64-linux/gnutls-native (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.34.1 to libgnutls.so.30.34.2
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.34.1 to libgnutls.so.30.34.2
  /usr/lib/libgnutls.so.30.34.1 moved to /usr/lib/libgnutls.so.30.34.2

--===============7007367590736456118==--

