Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE0AC54EBD
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:17 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.20665.1672605967047534732
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dtCVQs2J;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101856f15a8aa-ec1470dd-88de-40c0-b9c8-2c5b474ba427-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605968;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L21WwcIdfdpIyJFAdykLF4XiIHTx27Kw8s+3Jtq6lTo=;
	b=dtCVQs2J93eey2qs0gOCFOM2/tcYk2c/o2nOTYZ0v5MOctWKESnqS+BbxQfWD1Ce
	34qKMgUIEfupJ4qJwG6pYE9SN+THw6evIMp14XS4xX1tcq4gvu7R2762Q5pXLbZScdT
	/FNNReJ/dFct6g6MIkQgponVXY8cCYbEcS7zz2H0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605968;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L21WwcIdfdpIyJFAdykLF4XiIHTx27Kw8s+3Jtq6lTo=;
	b=jdsWvng47NePABGItyvqgS8o7UB3WWHcM+0fjmC6ByQxlD+TAN6tZLLvEW7I9dHs
	IFM1kbXIiVwcv0SsVTC2oG7CmEGx+2KzqO6/quQ/yctVcQVAsOqXuR+fbAKojEmKMP0
	NsKVhyKXQwTcZXQMIeOBAMQZHDoD+YHeR4Po4wio=
Content-Type: multipart/mixed; boundary="===============6552122121302162684=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpsl: upgrading to 0.21.2 SUCCEEDED
Message-ID: <010101856f15a8aa-ec1470dd-88de-40c0-b9c8-2c5b474ba427-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175304

--===============6552122121302162684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpsl* to *0.21.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpsl-upgrade-0.21.1-0.21.2.patch
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
--===============6552122121302162684==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpsl-upgrade-0.21.1-0.21.2.patch"

RnJvbSBkYjY2MDdkYTdhODk1NDY5MDhkOTViZTgwYjY0YmFlMGQwNzg5ZmVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxOTo1OTo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnBzbDogdXBncmFkZSAwLjIxLjEgLT4gMC4yMS4yCgotLS0KIC4uLi97bGlicHNsXzAuMjEuMS5i
YiA9PiBsaWJwc2xfMC4yMS4yLmJifSAgICB8IDM0ICsrKysrKysrKysrKysrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYnBzbC97bGlicHNsXzAuMjEuMS5iYiA9PiBsaWJwc2xfMC4yMS4y
LmJifSAoNDMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnBzbC9saWJw
c2xfMC4yMS4xLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHNsL2xpYnBzbF8wLjIxLjIu
YmIKc2ltaWxhcml0eSBpbmRleCA0MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGlicHNsL2xpYnBzbF8wLjIxLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YnBzbC9saWJwc2xfMC4yMS4yLmJiCmluZGV4IDU4ZjU2YzE0NWUuLmVhODk5MmNmMmMgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnBzbC9saWJwc2xfMC4yMS4xLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnBzbC9saWJwc2xfMC4yMS4yLmJiCkBAIC0xLDMgKzEs
MzAgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBk
YXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVy
ZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2Ug
dXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hh
bmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4K
KyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykK
KyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFCisjICsrKyBMSUNFTlNFCisjIEBA
IC0xLDQgKzEsNCBAQAorIyAtQ29weXJpZ2h0IChDKSAyMDE0LTIwMTUgVGltIFLDvGhzZW4KKyMg
K0NvcHlyaWdodCAoQykgMjAxNC0yMDIyIFRpbSBSw7xoc2VuCisjICAKKyMgIFBlcm1pc3Npb24g
aXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmlu
ZyBhCisjICBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlv
biBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLAorIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORwor
IyBAQCAtMSw0ICsxLDQgQEAKKyMgLUNvcHlyaWdodCAoQykgMjAxNC0yMDE4IFRpbSBSw7xoc2Vu
CisjICtDb3B5cmlnaHQgKEMpIDIwMTQtMjAyMiBUaW0gUsO8aHNlbgorIyAgCisjICBQZXJtaXNz
aW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRh
aW5pbmcgYQorIyAgY29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50
YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwKKyMgCisjCisKIFNVTU1BUlkgPSAiUHVibGlj
IFN1ZmZpeCBMaXN0IGxpYnJhcnkiCiBERVNDUklQVElPTiA9ICJUaGUgbGlicHNsIHBhY2thZ2Ug
cHJvdmlkZXMgYSBsaWJyYXJ5IGZvciBhY2Nlc3NpbmcgYW5kIFwKIHJlc29sdmluZyBpbmZvcm1h
dGlvbiBmcm9tIHRoZSBQdWJsaWMgU3VmZml4IExpc3QgKFBTTCkuIFRoZSBQU0wgaXMgYSBzZXQg
b2YgXApAQCAtNywxMiArMzQsMTMgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9yb2NrZGFib290Lmdp
dGh1Yi5pby9saWJwc2wvIgogQlVHVFJBQ0tFUiA9ICJodHRwczovL2dpdGh1Yi5jb20vcm9ja2Rh
Ym9vdC9saWJwc2wvaXNzdWVzIgogCiBMSUNFTlNFID0gIk1JVCIKLUxJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTU0MzcwMzBkOWU0ZmJlNzI2N2NlZDA1OGRkYjhhN2Y1IFwK
LSAgICAgICAgICAgICAgICAgICAgZmlsZTovL0NPUFlJTkc7bWQ1PWY0MWQxMDk5N2ExMmRhNWVl
M2MyNGNlZWIwMTQ4ZDE4IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9
NmY0MGFiN2ZjZjVmZjE4ZjNmZjdmNGIwODYwNDkzZmEgXAorICAgICAgICAgICAgICAgICAgICBm
aWxlOi8vQ09QWUlORzttZDU9NmY0MGFiN2ZjZjVmZjE4ZjNmZjdmNGIwODYwNDkzZmEgXAorICAg
ICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25s
b2FkLyR7UFZ9LyR7QlB9LnRhci5neiBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJhYzZjZTFlMWZiZDRkMDI1NGM0ZGRiOWQzN2YxZmE5OWRlYzgzNjE5YzEyNTMzMjgxNTUy
MDZiODk2MjEwZDRjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImUzNTk5MWI2ZTE3MDAxYWZhMmMw
Y2EzYjEwYzM1NzY1MDYwMmI5MjU5NjIwOWI3NDkyODAyZjM3NjhhNjI4NWYiCiAKIEdJVEhVQl9C
QVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vcm9ja2RhYm9vdC9saWJwc2wvcmVsZWFzZXMi
CiAKLS0gCjIuMzcuMwoK

--===============6552122121302162684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libpsl/libpsl: PKGSIZE changed from 70951 to 79143 (+12%)
packages/core2-32-poky-linux/libpsl/libpsl: FILELIST: removed "/usr/lib/libpsl.so.5.3.3", added "/usr/lib/libpsl.so.5.3.4"
Changes to packages/core2-32-poky-linux/libpsl (sysroot):
  /usr/lib/libpsl.so.5 changed symlink target from libpsl.so.5.3.3 to libpsl.so.5.3.4
  /usr/lib/libpsl.so changed symlink target from libpsl.so.5.3.3 to libpsl.so.5.3.4
  /usr/lib/libpsl.so.5.3.3 moved to /usr/lib/libpsl.so.5.3.4

--===============6552122121302162684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libpsl: SRC_URI changed from "https://github.com/rockdaboot/libpsl/releases/download/0.21.1/libpsl-0.21.1.tar.gz" to "https://github.com/rockdaboot/libpsl/releases/download/0.21.2/libpsl-0.21.2.tar.gz"
packages/core2-32-poky-linux/libpsl: PV changed from "0.21.1" to "0.21.2"
packages/core2-32-poky-linux/libpsl: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-32-poky-linux/libpsl/libpsl-bin: PV changed from "0.21.1" to "0.21.2"
packages/core2-32-poky-linux/libpsl/libpsl-bin: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-32-poky-linux/libpsl/libpsl-dbg: PKGSIZE changed from 73068 to 73324 (+0%)
packages/core2-32-poky-linux/libpsl/libpsl-dbg: FILELIST: removed "/usr/lib/.debug/libpsl.so.5.3.3", added "/usr/lib/.debug/libpsl.so.5.3.4"
packages/core2-32-poky-linux/libpsl/libpsl-dbg: PV changed from "0.21.1" to "0.21.2"
packages/core2-32-poky-linux/libpsl/libpsl-dbg: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-32-poky-linux/libpsl/libpsl-dev: PV changed from "0.21.1" to "0.21.2"
packages/core2-32-poky-linux/libpsl/libpsl-dev: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-32-poky-linux/libpsl/libpsl-doc: PV changed from "0.21.1" to "0.21.2"
packages/core2-32-poky-linux/libpsl/libpsl-doc: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-32-poky-linux/libpsl/libpsl-locale: PV changed from "0.21.1" to "0.21.2"
packages/core2-32-poky-linux/libpsl/libpsl-locale: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-32-poky-linux/libpsl/libpsl-src: PKGSIZE changed from 374405 to 411139 (+10%)
packages/core2-32-poky-linux/libpsl/libpsl-src: PV changed from "0.21.1" to "0.21.2"
packages/core2-32-poky-linux/libpsl/libpsl-src: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-32-poky-linux/libpsl/libpsl-staticdev: PV changed from "0.21.1" to "0.21.2"
packages/core2-32-poky-linux/libpsl/libpsl-staticdev: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-32-poky-linux/libpsl/libpsl: PKGSIZE changed from 70951 to 79143 (+12%)
packages/core2-32-poky-linux/libpsl/libpsl: PV changed from "0.21.1" to "0.21.2"
packages/core2-32-poky-linux/libpsl/libpsl: FILELIST: removed "/usr/lib/libpsl.so.5.3.3", added "/usr/lib/libpsl.so.5.3.4"
packages/core2-32-poky-linux/libpsl/libpsl: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
Changes to packages/core2-32-poky-linux/libpsl (sysroot):
  /usr/lib/libpsl.so.5 changed symlink target from libpsl.so.5.3.3 to libpsl.so.5.3.4
  /usr/lib/libpsl.so changed symlink target from libpsl.so.5.3.3 to libpsl.so.5.3.4
  /usr/lib/libpsl.so.5.3.3 moved to /usr/lib/libpsl.so.5.3.4

--===============6552122121302162684==--

