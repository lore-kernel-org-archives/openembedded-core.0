Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E06CA9EB0
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.3772.1684186748945180640
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FxgxlbHw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010188215a550b-c7657279-0ceb-4edc-b45f-3d5ad4bdb8c2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zhW5FrjGEGTAUBcDgORZ3WDjVB4WAESv0wzk2UAA2Vo=;
	b=FxgxlbHwT8I9NKOCzzoZN99obbBzFWOt8EGGKZQi7Z4UpnR/XGfiFC2j+ZrlJ9Ma
	7bv8tpyVs8PZTL0Iw3A8by0cQETdLZXjCPo2ypQv+61EzhLD6F3WrtnDy+tX4NylFVX
	316gHTrGqqwVQZYCJl6XV07bUx6X86HXFoLwrKtg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zhW5FrjGEGTAUBcDgORZ3WDjVB4WAESv0wzk2UAA2Vo=;
	b=hfwtQ8++080a9XIjXvwozd54UOUW6VwcUnlaEXAK6vtS3nhLP/JWMmvR3Kul3Lko
	2GtTfjoyd8mi415pejw6MYA1Qc2mjoEyR1VGKkS5IdVJQIoRyV5U9D3YIDWkbyA7Qx0
	zaDqqQCEdpwfL0i0lk4bk3lcCbX/qL5UAagCEbGc=
Content-Type: multipart/mixed; boundary="===============8034696103121970144=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] squashfs-tools: upgrading to 4.6.1 SUCCEEDED
Message-ID: <01010188215a550b-c7657279-0ceb-4edc-b45f-3d5ad4bdb8c2-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181326

--===============8034696103121970144==
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
--===============8034696103121970144==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-squashfs-tools-upgrade-4.5.1-4.6.1.patch"

RnJvbSBhZDIwMmZkMGQ1ODhmZmQ2NDY3NWViODZiNDJmNDgxOTgyZjk1MTA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTM6MjE6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cXVhc2hmcy10b29sczogdXBncmFkZSA0LjUuMSAtPiA0LjYuMQoKLS0tCiAuLi4uc2gtZG8tbm90
LXdyaXRlLW9yaWdpbmFsLXRpbWVzdGFtcHMucGF0Y2ggfCAzMCAtLS0tLS0tLS0tLS0tLS0tLS0t
CiAuLi4vc3F1YXNoZnMtdG9vbHMvc3F1YXNoZnMtdG9vbHNfZ2l0LmJiICAgICAgfCAgOCArKy0t
LQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDM1IGRlbGV0aW9ucygtKQogZGVs
ZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9zcXVhc2hmcy10b29scy9maWxl
cy8wMDAxLWluc3RhbGwtbWFucGFnZXMuc2gtZG8tbm90LXdyaXRlLW9yaWdpbmFsLXRpbWVzdGFt
cHMucGF0Y2gKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3F1YXNoZnMtdG9v
bHMvZmlsZXMvMDAwMS1pbnN0YWxsLW1hbnBhZ2VzLnNoLWRvLW5vdC13cml0ZS1vcmlnaW5hbC10
aW1lc3RhbXBzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3NxdWFzaGZzLXRvb2xzL2Zp
bGVzLzAwMDEtaW5zdGFsbC1tYW5wYWdlcy5zaC1kby1ub3Qtd3JpdGUtb3JpZ2luYWwtdGltZXN0
YW1wcy5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZWQxZDJmNWIzYi4uMDAw
MDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3F1YXNoZnMtdG9vbHMvZmlsZXMv
MDAwMS1pbnN0YWxsLW1hbnBhZ2VzLnNoLWRvLW5vdC13cml0ZS1vcmlnaW5hbC10aW1lc3RhbXBz
LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzAgKzAsMCBAQAotRnJvbSBiNDRiMDBkYWUxOTVk
ODU4Nzg1N2M3ZTgwNTRlOWJlNGVhYTFmOGIzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJv
bTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KLURhdGU6IFRodSwgNyBB
cHIgMjAyMiAwOToyNjowOSArMDIwMAotU3ViamVjdDogW1BBVENIXSBpbnN0YWxsLW1hbnBhZ2Vz
LnNoOiBkbyBub3Qgd3JpdGUgb3JpZ2luYWwgdGltZXN0YW1wcyBpbnRvCi0gLmd6IG1ldGFkYXRh
Ci0KLVRoaXMgaGVscHMgYmluYXJ5IHJlcHJvZHVjaWJpbGl0eS4KLQotVXBzdHJlYW0tU3RhdHVz
OiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0aHViLmNvbS9wbG91Z2hlci9zcXVhc2hmcy10b29scy9w
dWxsLzE3N10KLVNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9u
aXguZGU+Ci0tLS0KLSBnZW5lcmF0ZS1tYW5wYWdlcy9pbnN0YWxsLW1hbnBhZ2VzLnNoIHwgMiAr
LQotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQotCi1kaWZm
IC0tZ2l0IGEvZ2VuZXJhdGUtbWFucGFnZXMvaW5zdGFsbC1tYW5wYWdlcy5zaCBiL2dlbmVyYXRl
LW1hbnBhZ2VzL2luc3RhbGwtbWFucGFnZXMuc2gKLWluZGV4IGQ0YzllOTEuLjZhNDNiODkgMTAw
NzU1Ci0tLS0gYS9nZW5lcmF0ZS1tYW5wYWdlcy9pbnN0YWxsLW1hbnBhZ2VzLnNoCi0rKysgYi9n
ZW5lcmF0ZS1tYW5wYWdlcy9pbnN0YWxsLW1hbnBhZ2VzLnNoCi1AQCAtNTYsNyArNTYsNyBAQCBm
b3IgaSBpbiBta3NxdWFzaGZzIHVuc3F1YXNoZnMgc3Fmc3RhciBzcWZzY2F0OyBkbwotIAkJZXhp
dCAxCi0gCWZpCi0gCi0tCWlmICEgZ3ppcCAtZjkgJDIvJGkuMTsgdGhlbgotKwlpZiAhIGd6aXAg
LW4gLWY5ICQyLyRpLjE7IHRoZW4KLSAJCWVjaG8gIiQwOiBDb21wcmVzc2luZyBpbnN0YWxsZWQg
bWFucGFnZSBmYWlsZWQuICBBYm9ydGluZyIgPiYyCi0gCQlleGl0IDEKLSAJZmkKLS0tIAotMi4z
MC4yCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zcXVhc2hmcy10b29scy9z
cXVhc2hmcy10b29sc19naXQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3F1YXNoZnMtdG9v
bHMvc3F1YXNoZnMtdG9vbHNfZ2l0LmJiCmluZGV4IDRlMDA5ZDI2MjUuLjk4MmE0M2Y4ODkgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zcXVhc2hmcy10b29scy9zcXVhc2hmcy10
b29sc19naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3NxdWFzaGZzLXRvb2xzL3Nx
dWFzaGZzLXRvb2xzX2dpdC5iYgpAQCAtNywxMSArNyw5IEBAIFNFQ1RJT04gPSAiYmFzZSIKIExJ
Q0VOU0UgPSAiR1BMLTIuMC1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlO
RzttZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMiCiAKLVBWID0gIjQuNS4xIgot
U1JDUkVWID0gImFmZGQ2M2ZjMzg2OTE5YjRhYTQwZDU3M2IwYTYwNjk0MTRkMTQzMTciCi1TUkNf
VVJJID0gImdpdDovL2dpdGh1Yi5jb20vcGxvdWdoZXIvc3F1YXNoZnMtdG9vbHMuZ2l0O3Byb3Rv
Y29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIgXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1pbnN0YWxs
LW1hbnBhZ2VzLnNoLWRvLW5vdC13cml0ZS1vcmlnaW5hbC10aW1lc3RhbXBzLnBhdGNoIFwKLSAg
ICAgICAgICAgIgorUFYgPSAiNC42LjEiCitTUkNSRVYgPSAiZDhjYjgyZDk4NDAzMzBmOTM0NGVj
MzdiOTkyNTk1YjVkN2I0NDE4NCIKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9wbG91Z2hl
ci9zcXVhc2hmcy10b29scy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPXY2LjEuMSIKIFVQU1RS
RUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIig/UDxwdmVyPihcZCsoXC5cZCspKykpIgogCiBTID0g
IiR7V09SS0RJUn0vZ2l0IgotLSAKMi4zOS4yCgo=

--===============8034696103121970144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/squashfs-tools: PKGV changed from 4.5.1 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/squashfs-tools: PV changed from "4.5.1" to "4.6.1"
packages/core2-32-poky-linux/squashfs-tools: SRC_URI changed from "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=master file://0001-install-manpages.sh-do-not-write-original-timestamps.patch" to "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=v6.1.1"
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
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-src: PKGV changed from 4.5.1 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-src: FILELIST: removed "/usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/mksquashfs.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquashfs_info.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquashfs.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/process_fragments.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquash-123.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/mksquashfs.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquash-1.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/process_fragments.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquash-2.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquash-3.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquash-4.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquashfs.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquashfs_info.c /usr/src/debug/squ
 ashfs-tools/4.5.1-r0/squashfs-tools/compressor.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/gzip_wrapper.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/compressor.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquash-12.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/lzma_xz_wrapper.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/xattr.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/restore.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquash-34.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/tar_xattr.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/action.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/xattr.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/action.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/read_xattrs.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/restore.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/caches-queues-lists.h /usr/src/debug/s
 quashfs-tools/4.5.1-r0/squashfs-tools/zstd_wrapper.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/pseudo.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/read_fs.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/zstd_wrapper.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/caches-queues-lists.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/pseudo.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/read_fs.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquash-1234.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/info.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/xz_wrapper.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/lzo_wrapper.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/progressbar.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/lzo_wrapper.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/progressbar.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/xz_wrapper.h /usr/src
 /debug/squashfs-tools/4.5.1-r0/squashfs-tools/error.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/mksquashfs_error.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/squashfs_compat.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/lz4_wrapper.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/unsquashfs_xattr.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/lz4_wrapper.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/squashfs_fs.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/gzip_wrapper.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/info.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/sort.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/tar.c /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/tar.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/sort.h /usr/src/debug/squashfs-tools/4.5.1-r0/squashfs-tools/reader.c", added "/usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/gzip_wrapper.h /usr/src
 /debug/squashfs-tools/4.6.1-r0/squashfs-tools/reader.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/squashfs_fs.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/squashfs_compat.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/caches-queues-lists.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/tar.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/reader.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/gzip_wrapper.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/tar.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/mksquashfs_error.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/caches-queues-lists.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquash-12.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/read_fs.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/read_fs.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquash-34.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquas
 h-1234.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/compressor.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquashfs_info.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/action.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/lzma_xz_wrapper.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/lzo_wrapper.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/progressbar.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/read_xattrs.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/action.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/lzo_wrapper.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/compressor.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/progressbar.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquashfs_info.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/xz_wrapper.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/pseudo_xattr.c /usr/src/debug/squashfs-tools/4.6.1-
 r0/squashfs-tools/date.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/process_fragments.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/error.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/tar_xattr.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquash-123.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/date.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/process_fragments.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/mksquashfs.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquash-1.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquash-2.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/info.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquash-3.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/mksquashfs.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquash-4.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquashfs.c /usr/src/debug/squashfs-tools/4.6.1-
 r0/squashfs-tools/unsquashfs.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/info.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/xz_wrapper.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/xattr.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/restore.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/zstd_wrapper.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/restore.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/xattr.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/zstd_wrapper.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/pseudo.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/unsquashfs_xattr.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/pseudo.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/signals.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/lz4_wrapper.h /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/sort.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/lz
 4_wrapper.c /usr/src/debug/squashfs-tools/4.6.1-r0/squashfs-tools/sort.h"
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-src: PV changed from "4.5.1" to "4.6.1"
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-staticdev: PKGV changed from 4.5.1 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-staticdev: PV changed from "4.5.1" to "4.6.1"
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools: PKGSIZE changed from 486252 to 527340 (+8%)
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools: PKGV changed from 4.5.1 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/squashfs-tools/squashfs-tools: PV changed from "4.5.1" to "4.6.1"

--===============8034696103121970144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/squashfs-tools/squashfs-tools-doc: PKGSIZE changed from 14092 to 18027 (+28%)

--===============8034696103121970144==--

