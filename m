Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09EAAC32764
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:38 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web09.3949.1659679408543671215
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CcfCEJWo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101826c9a0245-e248e8f8-ef2d-4141-9253-919cc003024f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679408;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=eY0OOKF4pH1vil18i+vQJQc7DGOD0myuuwlM4k/sLjs=;
	b=CcfCEJWo/Du8lwVvGF3ZK2ZfC/bDFMkR+oKW6xrRWOU3XLkUWwtgaObLQn5b8NIx
	uiy3onXhXgJg3BYUXhyrYpWVtqLK/OSjSnuHeWExLxW++aAZLb+zqPJuZmEUwOdCjUt
	tm6eDe0kXXcVW4eABvarmx9zXzaDZhwBbrCmP2OU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679408;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=eY0OOKF4pH1vil18i+vQJQc7DGOD0myuuwlM4k/sLjs=;
	b=cGq7/qiJCVrUkOaoQ2YMs0O4c7FnCBnobP6P9a/2MjFNGtBrhiNeSxt/ICfGFC+j
	CgRkh81PcDooR9jjmak0Y77qQTcYQvs/JltK4sXwV7Pdxfi95BNhOSenRMeaZA7kbHS
	+/z/WAStJK+kJD/a64SCRCW/sdEE4ywg+DQHeM3Q=
Content-Type: multipart/mixed; boundary="===============2651152700735754074=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] gnutls: upgrading to 3.7.7 SUCCEEDED
Message-ID: 
 <010101826c9a0245-e248e8f8-ef2d-4141-9253-919cc003024f-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:28 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168911

--===============2651152700735754074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnutls* to *3.7.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnutls-upgrade-3.7.6-3.7.7.patch
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
--===============2651152700735754074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gnutls/gnutls-doc: FILELIST: added "/usr/share/man/man3/gnutls_cipher_encrypt3.3 /usr/share/man/man3/gnutls_cipher_decrypt3.3 /usr/share/man/man3/gnutls_fips140_run_self_tests.3"
packages/core2-32-poky-linux/gnutls/gnutls: FILELIST: removed "/usr/lib/libgnutls.so.30.33.1", added "/usr/lib/libgnutls.so.30.34.1"
Changes to packages/core2-32-poky-linux/gnutls (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.33.1 to libgnutls.so.30.34.1
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.33.1 to libgnutls.so.30.34.1
  /usr/lib/libgnutls.so.30.33.1 moved to /usr/lib/libgnutls.so.30.34.1
Changes to packages/x86_64-linux/gnutls-native (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.33.1 to libgnutls.so.30.34.1
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.33.1 to libgnutls.so.30.34.1
  /usr/lib/libgnutls.so.30.33.1 moved to /usr/lib/libgnutls.so.30.34.1

--===============2651152700735754074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gnutls/gnutls-bin: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-bin: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-dbg: PKGSIZE changed from 7541608 to 7553012 (+0%)
packages/core2-32-poky-linux/gnutls/gnutls-dbg: FILELIST: removed "/usr/lib/.debug/libgnutls.so.30.33.1", added "/usr/lib/.debug/libgnutls.so.30.34.1"
packages/core2-32-poky-linux/gnutls/gnutls-dbg: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-dbg: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-dev: PKGSIZE changed from 465708 to 466407 (+0%)
packages/core2-32-poky-linux/gnutls/gnutls-dev: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-dev: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-doc: PKGSIZE changed from 4410932 to 4419986 (+0%)
packages/core2-32-poky-linux/gnutls/gnutls-doc: FILELIST: added "/usr/share/man/man3/gnutls_cipher_decrypt3.3 /usr/share/man/man3/gnutls_fips140_run_self_tests.3 /usr/share/man/man3/gnutls_cipher_encrypt3.3"
packages/core2-32-poky-linux/gnutls/gnutls-doc: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-doc: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-fips: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-fips: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-locale-cs: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-cs: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-locale-de: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-de: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-locale-eo: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-eo: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-locale-es: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-es: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-locale-fi: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-fi: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-locale-fr: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-fr: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-locale-it: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-it: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-locale-ms: PKGSIZE changed from 24329 to 25528 (+5%)
packages/core2-32-poky-linux/gnutls/gnutls-locale-ms: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-ms: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-locale-nl: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-nl: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-locale-pl: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-pl: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-locale-pt-br: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-pt-br: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-locale-sr: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-sr: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-locale-sv: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-sv: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-locale-uk: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-uk: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-locale-vi: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-vi: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-locale-zh-cn: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-zh-cn: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-openssl: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-openssl: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-src: PKGSIZE changed from 8412615 to 8426271 (+0%)
packages/core2-32-poky-linux/gnutls/gnutls-src: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-src: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-staticdev: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-staticdev: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls-xx: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls-xx: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls/gnutls: PKGSIZE changed from 2276556 to 2280652 (+0%)
packages/core2-32-poky-linux/gnutls/gnutls: FILELIST: removed "/usr/lib/libgnutls.so.30.33.1", added "/usr/lib/libgnutls.so.30.34.1"
packages/core2-32-poky-linux/gnutls/gnutls: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls/gnutls: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls: PKGV changed from 3.7.6 [default] to 3.7.7 [default]
packages/core2-32-poky-linux/gnutls: PV changed from "3.7.6" to "3.7.7"
packages/core2-32-poky-linux/gnutls: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.6.tar.xz file://arm_eabi.patch file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch" to "https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.7.tar.xz file://arm_eabi.patch file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch"
Changes to packages/core2-32-poky-linux/gnutls (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.33.1 to libgnutls.so.30.34.1
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.33.1 to libgnutls.so.30.34.1
  /usr/lib/libgnutls.so.30.33.1 moved to /usr/lib/libgnutls.so.30.34.1
Changes to packages/x86_64-linux/gnutls-native (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.33.1 to libgnutls.so.30.34.1
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.33.1 to libgnutls.so.30.34.1
  /usr/lib/libgnutls.so.30.33.1 moved to /usr/lib/libgnutls.so.30.34.1

--===============2651152700735754074==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnutls-upgrade-3.7.6-3.7.7.patch"

RnJvbSBkYWRiYjIyZTBlNzllYWIwMmVjYzYwOWE0NDE2MjQ1NTFmMjMzZTZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNSBBdWcgMjAyMiAwNDo0ODoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdu
dXRsczogdXBncmFkZSAzLjcuNiAtPiAzLjcuNwoKLS0tCiAuLi4vcmVjaXBlcy1zdXBwb3J0L2du
dXRscy97Z251dGxzXzMuNy42LmJiID0+IGdudXRsc18zLjcuNy5iYn0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9nbnV0bHMve2dudXRsc18zLjcuNi5iYiA9PiBnbnV0bHNfMy43LjcuYmJ9ICg5
NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRsc18zLjcu
Ni5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHNfMy43LjcuYmIKc2ltaWxh
cml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2du
dXRsc18zLjcuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRs
c18zLjcuNy5iYgppbmRleCA2YTBlYjk3NGRkLi4wMWZkNGRiYTNkIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzXzMuNy42LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2dudXRscy9nbnV0bHNfMy43LjcuYmIKQEAgLTI0LDcgKzI0LDcgQEAgU1JDX1VS
SSA9ICJodHRwczovL3d3dy5nbnVwZy5vcmcvZnRwL2djcnlwdC9nbnV0bHMvdiR7U0hSVF9WRVJ9
L2dudXRscy0ke1BWfS50YXIKICAgICAgICAgICAgZmlsZTovLzAwMDEtQ3JlYXRpbmctLmhtYWMt
ZmlsZS1zaG91bGQtYmUtZXhjdXRlZC1pbi10YXJnZXQtZW52aS5wYXRjaCBcCiAgICAgICAgICAg
ICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc3MDY1NzE5YTM0NWJmYjE4ZmFhMjUwMTM0YmU0
YzUzYmVmNzBjMWJkNjFmNmMwYzIzY2ViOGI0NGYwMjYyZmYiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiYmU5MTQzZDBkNThlYWI2NGRiYTliNzcxMTRhYWFmYWM1MjliNmMwZDdlODFkZTZiZGYxYzli
NTkwMjdkMjEwNiIKIAogaW5oZXJpdCBhdXRvdG9vbHMgdGV4aW5mbyBwa2djb25maWcgZ2V0dGV4
dCBsaWJfcGFja2FnZSBndGstZG9jCiAKLS0gCjIuMzEuMQoK

--===============2651152700735754074==--

