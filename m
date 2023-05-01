Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117C4C88C85
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:52 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.107883.1682976348773182789
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=naPcpVd/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010187d9352420-8a47d5c0-edb8-4770-b104-733c9d992a0e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ivlBgeBLwUI4pbksopcbMgmrppDk0RDiAL+DjQQ+7F4=;
	b=naPcpVd/f6Em+eZBLeiT63z79PLcTQBAW042fPW/uwZTiMleOepJVvEsjv+oUvyc
	f2tBvYRvOPjK1jd9ZacuoiiXD8PzX8dJjj99J7V3MNYO9EuZFneXzaPRcx9QRE1sWCn
	iNZ6K0oz04RufEalEmloRZ41Gs9IvtC8djehVsBw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ivlBgeBLwUI4pbksopcbMgmrppDk0RDiAL+DjQQ+7F4=;
	b=JSXcYEA4tAHZHLCgDPp51UN0PJ7PKEtCZxFt3LhR2/WoXp+QchPQFZvl2c3GwqJK
	f+Qq4ZljcP9YCy3s6V9myWuQJI+NPGtmLtq5FHgP8dwuRy8X3QmvEcoGFdY2leoSNFT
	y3RBBuTahAbUAoCUvvqivUvwdCMvBfxUptD4+33E=
Content-Type: multipart/mixed; boundary="===============8270866539545165370=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] squashfs-tools: upgrading to 4.6.1 SUCCEEDED
Message-ID: <01010187d9352420-8a47d5c0-edb8-4770-b104-733c9d992a0e-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180638

--===============8270866539545165370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *squashfs-tools* to *4.6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-squashfs-tools-upgrade-4.5.1-4.6.1.patch
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
--===============8270866539545165370==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-squashfs-tools-upgrade-4.5.1-4.6.1.patch"

RnJvbSAwZGVlMjE0ODI5MWUxZTdkMWNlNDNlOWEyYzg1NjJjOThiNjQ4ZDM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxNDoxMjozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNx
dWFzaGZzLXRvb2xzOiB1cGdyYWRlIDQuNS4xIC0+IDQuNi4xCgotLS0KIC4uLi5zaC1kby1ub3Qt
d3JpdGUtb3JpZ2luYWwtdGltZXN0YW1wcy5wYXRjaCB8IDMwIC0tLS0tLS0tLS0tLS0tLS0tLS0K
IC4uLi9zcXVhc2hmcy10b29scy9zcXVhc2hmcy10b29sc19naXQuYmIgICAgICB8ICA4ICsrLS0t
CiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMzUgZGVsZXRpb25zKC0pCiBkZWxl
dGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3NxdWFzaGZzLXRvb2xzL2ZpbGVz
LzAwMDEtaW5zdGFsbC1tYW5wYWdlcy5zaC1kby1ub3Qtd3JpdGUtb3JpZ2luYWwtdGltZXN0YW1w
cy5wYXRjaAoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zcXVhc2hmcy10b29s
cy9maWxlcy8wMDAxLWluc3RhbGwtbWFucGFnZXMuc2gtZG8tbm90LXdyaXRlLW9yaWdpbmFsLXRp
bWVzdGFtcHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3F1YXNoZnMtdG9vbHMvZmls
ZXMvMDAwMS1pbnN0YWxsLW1hbnBhZ2VzLnNoLWRvLW5vdC13cml0ZS1vcmlnaW5hbC10aW1lc3Rh
bXBzLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBlZDFkMmY1YjNiLi4wMDAw
MDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zcXVhc2hmcy10b29scy9maWxlcy8w
MDAxLWluc3RhbGwtbWFucGFnZXMuc2gtZG8tbm90LXdyaXRlLW9yaWdpbmFsLXRpbWVzdGFtcHMu
cGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzMCArMCwwIEBACi1Gcm9tIGI0NGIwMGRhZTE5NWQ4
NTg3ODU3YzdlODA1NGU5YmU0ZWFhMWY4YjMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9t
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgotRGF0ZTogVGh1LCA3IEFw
ciAyMDIyIDA5OjI2OjA5ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIGluc3RhbGwtbWFucGFnZXMu
c2g6IGRvIG5vdCB3cml0ZSBvcmlnaW5hbCB0aW1lc3RhbXBzIGludG8KLSAuZ3ogbWV0YWRhdGEK
LQotVGhpcyBoZWxwcyBiaW5hcnkgcmVwcm9kdWNpYmlsaXR5LgotCi1VcHN0cmVhbS1TdGF0dXM6
IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL3Bsb3VnaGVyL3NxdWFzaGZzLXRvb2xzL3B1
bGwvMTc3XQotU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25p
eC5kZT4KLS0tLQotIGdlbmVyYXRlLW1hbnBhZ2VzL2luc3RhbGwtbWFucGFnZXMuc2ggfCAyICst
Ci0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRpZmYg
LS1naXQgYS9nZW5lcmF0ZS1tYW5wYWdlcy9pbnN0YWxsLW1hbnBhZ2VzLnNoIGIvZ2VuZXJhdGUt
bWFucGFnZXMvaW5zdGFsbC1tYW5wYWdlcy5zaAotaW5kZXggZDRjOWU5MS4uNmE0M2I4OSAxMDA3
NTUKLS0tLSBhL2dlbmVyYXRlLW1hbnBhZ2VzL2luc3RhbGwtbWFucGFnZXMuc2gKLSsrKyBiL2dl
bmVyYXRlLW1hbnBhZ2VzL2luc3RhbGwtbWFucGFnZXMuc2gKLUBAIC01Niw3ICs1Niw3IEBAIGZv
ciBpIGluIG1rc3F1YXNoZnMgdW5zcXVhc2hmcyBzcWZzdGFyIHNxZnNjYXQ7IGRvCi0gCQlleGl0
IDEKLSAJZmkKLSAKLS0JaWYgISBnemlwIC1mOSAkMi8kaS4xOyB0aGVuCi0rCWlmICEgZ3ppcCAt
biAtZjkgJDIvJGkuMTsgdGhlbgotIAkJZWNobyAiJDA6IENvbXByZXNzaW5nIGluc3RhbGxlZCBt
YW5wYWdlIGZhaWxlZC4gIEFib3J0aW5nIiA+JjIKLSAJCWV4aXQgMQotIAlmaQotLS0gCi0yLjMw
LjIKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3NxdWFzaGZzLXRvb2xzL3Nx
dWFzaGZzLXRvb2xzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zcXVhc2hmcy10b29s
cy9zcXVhc2hmcy10b29sc19naXQuYmIKaW5kZXggNGUwMDlkMjYyNS4uOTgyYTQzZjg4OSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3NxdWFzaGZzLXRvb2xzL3NxdWFzaGZzLXRv
b2xzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3F1YXNoZnMtdG9vbHMvc3F1
YXNoZnMtdG9vbHNfZ2l0LmJiCkBAIC03LDExICs3LDkgQEAgU0VDVElPTiA9ICJiYXNlIgogTElD
RU5TRSA9ICJHUEwtMi4wLW9ubHkiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5H
O21kNT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyIKIAotUFYgPSAiNC41LjEiCi1T
UkNSRVYgPSAiYWZkZDYzZmMzODY5MTliNGFhNDBkNTczYjBhNjA2OTQxNGQxNDMxNyIKLVNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9wbG91Z2hlci9zcXVhc2hmcy10b29scy5naXQ7cHJvdG9j
b2w9aHR0cHM7YnJhbmNoPW1hc3RlciBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLWluc3RhbGwt
bWFucGFnZXMuc2gtZG8tbm90LXdyaXRlLW9yaWdpbmFsLXRpbWVzdGFtcHMucGF0Y2ggXAotICAg
ICAgICAgICAiCitQViA9ICI0LjYuMSIKK1NSQ1JFViA9ICJkOGNiODJkOTg0MDMzMGY5MzQ0ZWMz
N2I5OTI1OTViNWQ3YjQ0MTg0IgorU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3Bsb3VnaGVy
L3NxdWFzaGZzLXRvb2xzLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9djYuMS4xIgogVVBTVFJF
QU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+KFxkKyhcLlxkKykrKSkiCiAKIFMgPSAi
JHtXT1JLRElSfS9naXQiCi0tIAoyLjM5LjIKCg==

--===============8270866539545165370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/squashfs-tools: SRC_URI changed from "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=master file://0001-install-manpages.sh-do-not-write-original-timestamps.patch" to "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=v6.1.1"
packages/core2-32-poky-linux/squashfs-tools: PKGV changed from 4.5.1 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/squashfs-tools: PV changed from "4.5.1" to "4.6.1"
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-dbg: PKGSIZE changed from 990368 to 1063808 (+7%)
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-dbg: PKGV changed from 4.5.1 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-dbg: PV changed from "4.5.1" to "4.6.1"
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-dev: PKGSIZE changed from 13473 to 13487 (+0%)
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-dev: PKGV changed from 4.5.1 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-dev: PV changed from "4.5.1" to "4.6.1"
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-doc: PKGSIZE changed from 14092 to 18027 (+28%)
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-doc: PKGV changed from 4.5.1 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-doc: PV changed from "4.5.1" to "4.6.1"
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-locale: PKGV changed from 4.5.1 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-locale: PV changed from "4.5.1" to "4.6.1"
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-src: PKGSIZE changed from 882898 to 958469 (+9%)
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-src: FILELIST: removed "/usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/process_fragments.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/mksquashfs.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/action.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/sort.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquash-1.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquash-2.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/action.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/mksquashfs.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/process_fragments.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/reader.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/squashfs_fs.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquashfs.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/sort.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools
 /unsquashfs_info.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/read_fs.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquash-123.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/compressor.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/read_fs.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/compressor.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/restore.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/zstd_wrapper.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/gzip_wrapper.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/zstd_wrapper.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/restore.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquash-12.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/gzip_wrapper.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/lz4_wrapper.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/lzo_wrapper.h /usr/src/debug/squashfs-tools/4.5.1-r0/
 squashfs-tools/progressbar.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/info.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/lzo_wrapper.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/progressbar.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/lz4_wrapper.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/info.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/pseudo.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/error.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/pseudo.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/read_xattrs.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquashfs_info.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquash-34.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/xz_wrapper.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/lzma_xz_wrapper.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/squashfs_compat.h /usr/src/debug/squashfs-tools/4.5.1
 -r0/squashfs-tools/xz_wrapper.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquash-3.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquash-4.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquashfs.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/mksquashfs_error.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/tar_xattr.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/caches-queues-lists.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquash-1234.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/xattr.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/caches-queues-lists.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/tar.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquashfs_xattr.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/xattr.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/tar.h", added "/usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/pseudo.c /usr/src/debug
 /squashfs-tools/4.6.1-r0/squashfs-tools/reader.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/lz4_wrapper.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/pseudo.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/lz4_wrapper.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/reader.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/error.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquashfs_info.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/lzo_wrapper.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/progressbar.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquash-1234.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/xz_wrapper.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/progressbar.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/lzo_wrapper.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquashfs_info.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/xz_wrapper.h /usr
 /src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/restore.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/sort.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/restore.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/sort.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/tar.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/info.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/pseudo_xattr.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquashfs_xattr.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/tar.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/info.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/lzma_xz_wrapper.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/squashfs_fs.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/process_fragments.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/mksquashfs.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquash-123.c /usr/src/debug/sq
 uashfs-tools/4.6.1-r0/squashfs-tools/squashfs_compat.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquashfs.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/signals.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/mksquashfs.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/process_fragments.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/compressor.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquash-1.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquash-2.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquash-3.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquash-4.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquashfs.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/compressor.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/action.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/read_fs.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/zstd_wrapper.c /usr/
 src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/gzip_wrapper.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/xattr.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquash-12.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/zstd_wrapper.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/action.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/read_fs.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/gzip_wrapper.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/read_xattrs.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/date.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquash-34.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/caches-queues-lists.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/mksquashfs_error.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/xattr.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/caches-queues-lists.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/
 date.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/tar_xattr.c"
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-src: PKGV changed from 4.5.1 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-src: PV changed from "4.5.1" to "4.6.1"
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-staticdev: PKGV changed from 4.5.1 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-staticdev: PV changed from "4.5.1" to "4.6.1"
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools: PKGSIZE changed from 486252 to 527340 (+8%)
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools: PKGV changed from 4.5.1 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools: PV changed from "4.5.1" to "4.6.1"

--===============8270866539545165370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-doc: PKGSIZE changed from 14092 to 18027 (+28%)

--===============8270866539545165370==--

