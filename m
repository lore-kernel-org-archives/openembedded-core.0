Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92E2C433FE
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:13:11 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web12.24664.1665871975172393266
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cIo7pp9G;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010183ddb50f2f-aa9697f3-4cab-4796-93ec-f33b905fb0d7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871974;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=UodZ+uSffW8FEW9aC4bHsksUrEwfLJoxv9vSnxz9EeM=;
	b=cIo7pp9Gz0C2F9rtj8Wxbofwp8O4RAqmKx9Znhd9o1WIxHCdAuu9S1bHkuPryiBC
	+w4j0+HOXWcU1NO1W7dNMO5zhxsCOOsADisBRtcoNHrW6n8EwNjtQ7S2rlTtKo40Zue
	SOIM+Ntowqh4tJitUR3tmMRRQANoE4CdoG1H0ZLo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871974;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=UodZ+uSffW8FEW9aC4bHsksUrEwfLJoxv9vSnxz9EeM=;
	b=C2IWtYs/IJ1lHfdwvbCDcxlzTcCIcG6IAqeMicoxcIJmJ4w/onB3EdAj5erdb0T9
	25lZtoVyKHHW4EoQX5xGHSOb7623MdFHxuBfR6ACH8VtToGpvQr2q1CPtgetp/R3skC
	ejoxQ3210mvTEk6BZ+/XqBqs4IZZj10/sEElYpzw=
Content-Type: multipart/mixed; boundary="===============8123691113778275330=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] gnutls: upgrading to 3.7.8 SUCCEEDED
Message-ID: <01010183ddb50f2f-aa9697f3-4cab-4796-93ec-f33b905fb0d7-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:12:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171869

--===============8123691113778275330==
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
--===============8123691113778275330==
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

--===============8123691113778275330==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnutls-upgrade-3.7.7-3.7.8.patch"

RnJvbSBmNmJmM2U0ODgzZDlhZDYzMmViNTMwMzNmM2ZjOTVhMGE1YTliM2IzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMjA6Mjc6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bnV0bHM6IHVwZ3JhZGUgMy43LjcgLT4gMy43LjgKCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC9n
bnV0bHMve2dudXRsc18zLjcuNy5iYiA9PiBnbnV0bHNfMy43LjguYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ251dGxzL3tnbnV0bHNfMy43LjcuYmIgPT4gZ251dGxzXzMuNy44LmJifSAo
OTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHNfMy43
LjcuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzXzMuNy44LmJiCnNpbWls
YXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9n
bnV0bHNfMy43LjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0
bHNfMy43LjguYmIKaW5kZXggMDFmZDRkYmEzZC4uZjJlOTE2ZmM0ZSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRsc18zLjcuNy5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzXzMuNy44LmJiCkBAIC0yNCw3ICsyNCw3IEBAIFNSQ19V
UkkgPSAiaHR0cHM6Ly93d3cuZ251cGcub3JnL2Z0cC9nY3J5cHQvZ251dGxzL3Yke1NIUlRfVkVS
fS9nbnV0bHMtJHtQVn0udGFyCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUNyZWF0aW5nLS5obWFj
LWZpbGUtc2hvdWxkLWJlLWV4Y3V0ZWQtaW4tdGFyZ2V0LWVudmkucGF0Y2ggXAogICAgICAgICAg
ICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiZTkxNDNkMGQ1OGVhYjY0ZGJhOWI3NzExNGFh
YWZhYzUyOWI2YzBkN2U4MWRlNmJkZjFjOWI1OTAyN2QyMTA2IgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImM1OGFkMzlhZjA2NzBlZmU2YThhZWU1ZTNhOGIyMzMxYTEyMDA0MThiNjRiN2M1MTk3N2Zi
Mzk2ZDQ2MTcxMTQiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHRleGluZm8gcGtnY29uZmlnIGdldHRl
eHQgbGliX3BhY2thZ2UgZ3RrLWRvYwogCi0tIAoyLjMxLjEKCg==

--===============8123691113778275330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gnutls/gnutls-bin: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-bin: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
packages/core2-32-poky-linux/gnutls/gnutls-dbg: PV changed from "3.7.7" to "3.7.8"
packages/core2-32-poky-linux/gnutls/gnutls-dbg: FILELIST: removed "/usr/lib/.debug/libgnutls.so.30.34.1", added "/usr/lib/.debug/libgnutls.so.30.34.2"
packages/core2-32-poky-linux/gnutls/gnutls-dbg: PKGSIZE changed from 7555844 to 7588476 (+0%)
packages/core2-32-poky-linux/gnutls/gnutls-dbg: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
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
packages/core2-32-poky-linux/gnutls/gnutls: FILELIST: removed "/usr/lib/libgnutls.so.30.34.1", added "/usr/lib/libgnutls.so.30.34.2"
packages/core2-32-poky-linux/gnutls/gnutls: PKGSIZE changed from 2284748 to 2292940 (+0%)
packages/core2-32-poky-linux/gnutls/gnutls: PKGV changed from 3.7.7 [default] to 3.7.8 [default]
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

--===============8123691113778275330==--

