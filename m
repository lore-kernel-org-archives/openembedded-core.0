Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3350C77B74
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:01 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.32142.1680384535556441972
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kpYZGhRb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101873eb93047-b2d4df67-c6c2-404d-934c-3e1868ee94ca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VRsly0MAbZcv/GXb+1tutpBStTgC6BVCjTRF7NO5qhY=;
	b=kpYZGhRbiF2GCQdSK2GJtbSy/9fem9cktrY/NMOoqhxtrIlROEh7jk5+Ho5bKQQg
	mONoIRlXZ1QP5Ly1H5S9VPB/vnZ7SJ89lTCIiKlJY6nG5fEHa+wCI9PBS1jGISUzo5E
	/wgtLXggiiL/FcSlEP0o2Ek1GXALyY7J4OPDlOcM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VRsly0MAbZcv/GXb+1tutpBStTgC6BVCjTRF7NO5qhY=;
	b=gTHUF+Q0Mc8bmem2RdlHv3bq0auhcMVVO8ttEYkzz688L+Z+9WU2LeY4iHRCt3Ja
	W4zTtUNycGZS/oQkWB0I2pwl+w6mDm/CRFWtYgoCWrF45w9NDNFIadVKR9W+VwGoApz
	2l/LnngqL8w0ONUrv6vYuEKxVFktnyBI1QgvNldA=
Content-Type: multipart/mixed; boundary="===============8118938987411320935=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] apr: upgrading to 1.7.3 SUCCEEDED
Message-ID: <010101873eb93047-b2d4df67-c6c2-404d-934c-3e1868ee94ca-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:56 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179564

--===============8118938987411320935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *apr* to *1.7.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-apr-upgrade-1.7.2-1.7.3.patch
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
--===============8118938987411320935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/apr/apr-bin: PV changed from "1.7.2" to "1.7.3"
packages/core2-32-poky-linux/apr/apr-bin: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/core2-32-poky-linux/apr/apr-dbg: PV changed from "1.7.2" to "1.7.3"
packages/core2-32-poky-linux/apr/apr-dbg: FILELIST: removed "/usr/lib/.debug/libapr-1.so.0.7.2", added "/usr/lib/.debug/libapr-1.so.0.7.3"
packages/core2-32-poky-linux/apr/apr-dbg: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/core2-32-poky-linux/apr/apr-dbg: PKGSIZE changed from 1163376 to 1191572 (+2%)
packages/core2-32-poky-linux/apr/apr-dev: PV changed from "1.7.2" to "1.7.3"
packages/core2-32-poky-linux/apr/apr-dev: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/core2-32-poky-linux/apr/apr-dev: PKGSIZE changed from 572611 to 573258 (+0%)
packages/core2-32-poky-linux/apr/apr-doc: PV changed from "1.7.2" to "1.7.3"
packages/core2-32-poky-linux/apr/apr-doc: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/core2-32-poky-linux/apr/apr-locale: PV changed from "1.7.2" to "1.7.3"
packages/core2-32-poky-linux/apr/apr-locale: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/core2-32-poky-linux/apr/apr-ptest: PV changed from "1.7.2" to "1.7.3"
packages/core2-32-poky-linux/apr/apr-ptest: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/core2-32-poky-linux/apr/apr-ptest: PKGSIZE changed from 398504 to 423080 (+6%)
packages/core2-32-poky-linux/apr/apr-src: PV changed from "1.7.2" to "1.7.3"
packages/core2-32-poky-linux/apr/apr-src: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/core2-32-poky-linux/apr/apr-src: PKGSIZE changed from 1987769 to 2024092 (+2%)
packages/core2-32-poky-linux/apr/apr-staticdev: PV changed from "1.7.2" to "1.7.3"
packages/core2-32-poky-linux/apr/apr-staticdev: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/core2-32-poky-linux/apr/apr: PV changed from "1.7.2" to "1.7.3"
packages/core2-32-poky-linux/apr/apr: FILELIST: removed "/usr/lib/libapr-1.so.0.7.2", added "/usr/lib/libapr-1.so.0.7.3"
packages/core2-32-poky-linux/apr/apr: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/core2-32-poky-linux/apr: SRC_URI changed from "https://archive.apache.org/dist/apr/apr-1.7.2.tar.bz2 file://run-ptest file://0002-apr-Remove-workdir-path-references-from-installed-ap.patch file://0004-Fix-packet-discards-HTTP-redirect.patch file://0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch file://0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch file://libtoolize_check.patch file://0001-Add-option-to-disable-timed-dependant-tests.patch file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch" to "https://archive.apache.org/dist/apr/apr-1.7.3.tar.bz2 file://run-ptest file://0002-apr-Remove-workdir-path-references-from-installed-ap.patch file://0004-Fix-packet-discards-HTTP-redirect.patch file://0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch file://0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch file://libtoolize_check.patch file://0001-Add-option-to-disable-timed-dependant-tests.patch file://000
 1-configure-Remove-runtime-test-for-mmap-that-can-map-.patch"
packages/core2-32-poky-linux/apr: PV changed from "1.7.2" to "1.7.3"
packages/core2-32-poky-linux/apr: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
Changes to packages/core2-32-poky-linux/apr (sysroot):
  /usr/lib/libapr-1.so.0 changed symlink target from libapr-1.so.0.7.2 to libapr-1.so.0.7.3
  /usr/lib/libapr-1.so changed symlink target from libapr-1.so.0.7.2 to libapr-1.so.0.7.3
  /usr/lib/libapr-1.so.0.7.2 moved to /usr/lib/libapr-1.so.0.7.3

--===============8118938987411320935==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-apr-upgrade-1.7.2-1.7.3.patch"

RnJvbSA2NTg4NWEwYWE5ZDVhMzc3NDNkOWMzZmViNTI3Y2UxMjIxYTA1NTc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAyMDoxOTowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFw
cjogdXBncmFkZSAxLjcuMiAtPiAxLjcuMwoKLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHIv
e2Fwcl8xLjcuMi5iYiA9PiBhcHJfMS43LjMuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQv
YXByL3thcHJfMS43LjIuYmIgPT4gYXByXzEuNy4zLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2Fwci9hcHJfMS43LjIuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9hcHIvYXByXzEuNy4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2Fwci9hcHJfMS43LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2Fwci9hcHJfMS43LjMuYmIKaW5kZXggYzkwNTljOTkyMS4uOWE5M2ZlMDk2NyAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXByL2Fwcl8xLjcuMi5iYgorKysgYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9hcHIvYXByXzEuNy4zLmJiCkBAIC0yNCw3ICsyNCw3IEBAIFNSQ19V
UkkgPSAiJHtBUEFDSEVfTUlSUk9SfS9hcHIvJHtCUE59LSR7UFZ9LnRhci5iejIgXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1jb25maWd1cmUtUmVtb3ZlLXJ1bnRpbWUtdGVzdC1mb3ItbW1hcC10
aGF0LWNhbi1tYXAtLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNzVlNzdjYzg2Nzc2YzAzMGMwYTVjNDA4ZGZiZDBiZjJhMGI3NWVlZDUzNTFlNTJkNTQzOWZh
MWU1NTA5YTQzZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0NTVlMjE4YzA2MGM0NzRmMmM4MzQ4
MTY4NzNmNmVkNjljMGNmMGU0Y2ZlZTU0MjgyY2M5M2U4ZTk4OWVlNTllIgogCiBpbmhlcml0IGF1
dG90b29scy1icm9rZW5zZXAgbGliX3BhY2thZ2UgYmluY29uZmlnIG11bHRpbGliX2hlYWRlciBw
dGVzdCBtdWx0aWxpYl9zY3JpcHQKIAotLSAKMi4zOS4yCgo=

--===============8118938987411320935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/apr/apr: FILELIST: removed "/usr/lib/libapr-1.so.0.7.2", added "/usr/lib/libapr-1.so.0.7.3"
Changes to packages/core2-32-poky-linux/apr (sysroot):
  /usr/lib/libapr-1.so.0 changed symlink target from libapr-1.so.0.7.2 to libapr-1.so.0.7.3
  /usr/lib/libapr-1.so changed symlink target from libapr-1.so.0.7.2 to libapr-1.so.0.7.3
  /usr/lib/libapr-1.so.0.7.2 moved to /usr/lib/libapr-1.so.0.7.3

--===============8118938987411320935==--

