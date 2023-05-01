Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759D5C88CBD
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:03 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.107418.1682976349473379046
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=k727RfZm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010187d9352ec9-1546e487-c5ea-4d8b-a768-3a36601f0730-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KPUhteP6KiGr+/OTvFi1DveUuw/u/I8TJfuMSGQWHVk=;
	b=k727RfZmpwQ9G88DKZw8RFlEjJD0yZd+G+zBvFxXHFeVn+qOQhnvwMHKt3Rp9gCB
	n2kFp0jSaLuuogGV1Wv9DYBaMOKuLWj/xWFP10+JYLHbLGtSutK/k86wphe8E5Nqh37
	PthG6eYwxKdibEijwqeEAgcqjqdxB3m2H5a45SWU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KPUhteP6KiGr+/OTvFi1DveUuw/u/I8TJfuMSGQWHVk=;
	b=R5UufGjnGdkhqYWQeBDv8PFFap7Mfr2BRx3dbDtXU0hmZ0GPhES1cHK2hz++7w4F
	qtCXiUTjc2TFSjLbERtOJoZCbV5udVs3U8vMLOZejU6xOMF+UVeEH/PINF+BfrSMtwp
	aIKq6LWSgHGxtCK2hPA4subZ9dfV9zzMHLkDRlxY=
Content-Type: multipart/mixed; boundary="===============1316216069998344858=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] apr: upgrading to 1.7.4 SUCCEEDED
Message-ID: <01010187d9352ec9-1546e487-c5ea-4d8b-a768-3a36601f0730-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180695

--===============1316216069998344858==
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
--===============1316216069998344858==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-apr-upgrade-1.7.3-1.7.4.patch"

RnJvbSBjNzg5ODk2MWM5OGE4ZGY5ZjUyN2MyYzFjNGUzYzdlZGU3ZmE0Yjg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAyMDo1Mzo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFw
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

--===============1316216069998344858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/apr/apr-bin: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-bin: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr-dbg: FILELIST: removed "/usr/lib/.debug/libapr-1.so.0.7.3", added "/usr/lib/.debug/libapr-1.so.0.7.4"
packages/core2-32-poky-linux/apr/apr-dbg: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-dbg: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr-dbg: PKGSIZE changed from 1191572 to 1191520 (-0%)
packages/core2-32-poky-linux/apr/apr-dev: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-dev: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr-dev: PKGSIZE changed from 573258 to 573259 (+0%)
packages/core2-32-poky-linux/apr/apr-doc: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-doc: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr-locale: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-locale: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr-ptest: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-ptest: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr-src: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-src: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr-src: PKGSIZE changed from 2024092 to 2023863 (-0%)
packages/core2-32-poky-linux/apr/apr-staticdev: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr-staticdev: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr/apr: FILELIST: removed "/usr/lib/libapr-1.so.0.7.3", added "/usr/lib/libapr-1.so.0.7.4"
packages/core2-32-poky-linux/apr/apr: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr/apr: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr: PKGV changed from 1.7.3 [default] to 1.7.4 [default]
packages/core2-32-poky-linux/apr: PV changed from "1.7.3" to "1.7.4"
packages/core2-32-poky-linux/apr: SRC_URI changed from "https://archive.apache.org/dist/apr/apr-1.7.3.tar.bz2 file://run-ptest file://0002-apr-Remove-workdir-path-references-from-installed-ap.patch file://0004-Fix-packet-discards-HTTP-redirect.patch file://0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch file://0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch file://libtoolize_check.patch file://0001-Add-option-to-disable-timed-dependant-tests.patch file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch" to "https://archive.apache.org/dist/apr/apr-1.7.4.tar.bz2 file://run-ptest file://0002-apr-Remove-workdir-path-references-from-installed-ap.patch file://0004-Fix-packet-discards-HTTP-redirect.patch file://0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch file://0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch file://libtoolize_check.patch file://0001-Add-option-to-disable-timed-dependant-tests.patch file://000
 1-configure-Remove-runtime-test-for-mmap-that-can-map-.patch"
Changes to packages/core2-32-poky-linux/apr (sysroot):
  /usr/lib/libapr-1.so.0 changed symlink target from libapr-1.so.0.7.3 to libapr-1.so.0.7.4
  /usr/lib/libapr-1.so changed symlink target from libapr-1.so.0.7.3 to libapr-1.so.0.7.4
  /usr/lib/libapr-1.so.0.7.3 moved to /usr/lib/libapr-1.so.0.7.4

--===============1316216069998344858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/apr/apr: FILELIST: removed "/usr/lib/libapr-1.so.0.7.3", added "/usr/lib/libapr-1.so.0.7.4"
Changes to packages/core2-32-poky-linux/apr (sysroot):
  /usr/lib/libapr-1.so.0 changed symlink target from libapr-1.so.0.7.3 to libapr-1.so.0.7.4
  /usr/lib/libapr-1.so changed symlink target from libapr-1.so.0.7.3 to libapr-1.so.0.7.4
  /usr/lib/libapr-1.so.0.7.3 moved to /usr/lib/libapr-1.so.0.7.4

--===============1316216069998344858==--

