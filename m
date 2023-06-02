Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6CDC7EE45
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:41 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.7547.1685693437058702588
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=V5OPFQ9r;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101887b2890db-9fa93b02-8cda-429e-a81b-61c00c272da9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693436;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yNCJV+V9uitGcS0fan0qgjNyYYJ29ZBmyfRi5Vy8DhA=;
	b=V5OPFQ9r1ey0k0TDExts19Iqg+fmIhWDshDa49Z84Mlcjk9J8P3eF5cR1wqrAFT0
	msZCFoEGGUBz1VmamzKvEJN1pN+QbvDmaJ9bj6m8NHCSbi1l8oAxEHHUNkWGVI9Ul4O
	GNehZa0TIzfZLl2xUcODN/NV6aOgE+tN97ZfrtU4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693436;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yNCJV+V9uitGcS0fan0qgjNyYYJ29ZBmyfRi5Vy8DhA=;
	b=BDo8jTtaZ0drDvp2VqbOWW79aRz9cHLbb+dWyEFKZ1eKATbw4I/pko1ubL8EuGae
	q4jaTxfVBj/7NnFHSDBN60vbhLFsVtw0DTZccMGzG8eqoFUXj/+oGrWKKQwjO50W5K0
	po9y7TbJeDpENTM/8ibZLy4kGNEJDjnD31xg0OQ8=
Content-Type: multipart/mixed; boundary="===============4163289329513979910=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] apr: upgrading to 1.7.4 SUCCEEDED
Message-ID: <010101887b2890db-9fa93b02-8cda-429e-a81b-61c00c272da9-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182281

--===============4163289329513979910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *apr* to *1.7.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-apr-upgrade-1.7.3-1.7.4.patch
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
--===============4163289329513979910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/apr/apr: FILELIST: removed "/usr/lib/libapr-1.so.0.7.3", added "/usr/lib/libapr-1.so.0.7.4"
Changes to packages/core2-32-poky-linux/apr (sysroot):
  /usr/lib/libapr-1.so.0 changed symlink target from libapr-1.so.0.7.3 to libapr-1.so.0.7.4
  /usr/lib/libapr-1.so changed symlink target from libapr-1.so.0.7.3 to libapr-1.so.0.7.4
  /usr/lib/libapr-1.so.0.7.3 moved to /usr/lib/libapr-1.so.0.7.4

--===============4163289329513979910==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-apr-upgrade-1.7.3-1.7.4.patch"

RnJvbSAyNDljZTE3OWJkMzNiNzAyNjNiZjE3YmJhNGUxYThlZTM2NDdhYjAxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAwNTowNDozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFw
cjogdXBncmFkZSAxLjcuMyAtPiAxLjcuNAoKLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHIv
e2Fwcl8xLjcuMy5iYiA9PiBhcHJfMS43LjQuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQv
YXByL3thcHJfMS43LjMuYmIgPT4gYXByXzEuNy40LmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2Fwci9hcHJfMS43LjMuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9hcHIvYXByXzEuNy40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2Fwci9hcHJfMS43LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2Fwci9hcHJfMS43LjQuYmIKaW5kZXggOWE5M2ZlMDk2Ny4uZTU3MTQ2OTM0MSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXByL2Fwcl8xLjcuMy5iYgorKysgYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9hcHIvYXByXzEuNy40LmJiCkBAIC0yNCw3ICsyNCw3IEBAIFNSQ19V
UkkgPSAiJHtBUEFDSEVfTUlSUk9SfS9hcHIvJHtCUE59LSR7UFZ9LnRhci5iejIgXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1jb25maWd1cmUtUmVtb3ZlLXJ1bnRpbWUtdGVzdC1mb3ItbW1hcC10
aGF0LWNhbi1tYXAtLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNDU1ZTIxOGMwNjBjNDc0ZjJjODM0ODE2ODczZjZlZDY5YzBjZjBlNGNmZWU1NDI4MmNjOTNl
OGU5ODllZTU5ZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmYzY0OGRlOTgzZjNhMmE2YzllNzhk
ZWExZjE4MDYzOWJkMmZhZDZjMDZkNTU2ZDQzNjdhNzAxZmU1YzM1NTc3IgogCiBpbmhlcml0IGF1
dG90b29scy1icm9rZW5zZXAgbGliX3BhY2thZ2UgYmluY29uZmlnIG11bHRpbGliX2hlYWRlciBw
dGVzdCBtdWx0aWxpYl9zY3JpcHQKIAotLSAKMi4zOS4yCgo=

--===============4163289329513979910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/apr/apr-bin: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-bin: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr-dbg: FILELIST: removed "/usr/lib/.debug/libapr-1.so.0.7.3", added "/usr/lib/.debug/libapr-1.so.0.7.4"
packages/core2-32-poky-linux/apr/apr-dbg: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-dbg: PKGSIZE changed from 1198960 to 1198908 (-0%)
packages/core2-32-poky-linux/apr/apr-dbg: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr-dev: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-dev: PKGSIZE changed from 573258 to 573259 (+0%)
packages/core2-32-poky-linux/apr/apr-dev: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr-doc: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-doc: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr-locale: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-locale: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr-ptest: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-ptest: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr-src: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-src: PKGSIZE changed from 2024092 to 2023863 (-0%)
packages/core2-32-poky-linux/apr/apr-src: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr-staticdev: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-staticdev: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr: FILELIST: removed "/usr/lib/libapr-1.so.0.7.3", added "/usr/lib/libapr-1.so.0.7.4"
packages/core2-32-poky-linux/apr/apr: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr: SRC_URI changed from "https://archive.apache.org/dist/apr/apr-1.7.3.tar.bz2 file://run-ptest file://0002-apr-Remove-workdir-path-references-from-installed-ap.patch file://0004-Fix-packet-discards-HTTP-redirect.patch file://0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch file://0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch file://libtoolize_check.patch file://0001-Add-option-to-disable-timed-dependant-tests.patch file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch" to "https://archive.apache.org/dist/apr/apr-1.7.4.tar.bz2 file://run-ptest file://0002-apr-Remove-workdir-path-references-from-installed-ap.patch file://0004-Fix-packet-discards-HTTP-redirect.patch file://0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch file://0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch file://libtoolize_check.patch file://0001-Add-option-to-disable-timed-dependant-tests.patch file://000
 1-configure-Remove-runtime-test-for-mmap-that-can-map-.patch"
packages/core2-32-poky-linux/apr: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr: PV changed from "1.7.3" to "1.7.4"
Changes to packages/core2-32-poky-linux/apr (sysroot):
  /usr/lib/libapr-1.so.0 changed symlink target from libapr-1.so.0.7.3 to libapr-1.so.0.7.4
  /usr/lib/libapr-1.so changed symlink target from libapr-1.so.0.7.3 to libapr-1.so.0.7.4
  /usr/lib/libapr-1.so.0.7.3 moved to /usr/lib/libapr-1.so.0.7.4

--===============4163289329513979910==--

