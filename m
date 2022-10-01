Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE99C49EA5
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:53 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web09.344.1664643226945267114
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kDpzCqDc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 010101839477d976-1ebecef3-b971-4d13-8f41-3540dd48584b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=G31bpUNQnPlxILYDC0LXkzgtTxMsfKiExNWuZZeDH2c=;
	b=kDpzCqDcUPyTU2KOPjP47WJgz9nIR03mAmJBewz631QAVm7BT4RDLPr/o4MScTck
	Q4OrZLoGZXyfgef33zQgfS0O0ZuD9UCfwxWCXnp0912Y0Guxoc2hL9w2MsDd7FRa1g1
	p+2iCF/Rc5NcxT3ZXMCKqYCvQt1pBhuUHGRNAEE0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=G31bpUNQnPlxILYDC0LXkzgtTxMsfKiExNWuZZeDH2c=;
	b=hzacq93xMXLIq+IHfsov+Pk7vPDGlgoHRRyXE9l3qdfylfNWQyKiXN5oIH70vsn4
	MZuFG2+BqwZCQnLJMfv6cnx6g8lULCMVKkNPQ9/d4nk4KAAKifv4ZkXFC15L8Dgrr2B
	9AelEIr3dvhhtDnNNgt+6hsbqfS1PI+QcBcbP8zs=
Content-Type: multipart/mixed; boundary="===============3493499393749456135=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtools: upgrading to 4.0.41 SUCCEEDED
Message-ID: 
 <010101839477d976-1ebecef3-b971-4d13-8f41-3540dd48584b-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171266

--===============3493499393749456135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mtools* to *4.0.41* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mtools-upgrade-4.0.40-4.0.41.patch
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
--===============3493499393749456135==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mtools-upgrade-4.0.40-4.0.41.patch"

RnJvbSAxMTE5MzU2NmZkOWE2MDRhNTdhYjM3NDgxODdiNzYwNTdiYmFjODNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAwNzo0NzozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG10
b29sczogdXBncmFkZSA0LjAuNDAgLT4gNC4wLjQxCgotLS0KIC4uLi9tdG9vbHMvbXRvb2xzL2Rp
c2FibGUtaGFyZGNvZGVkLWNvbmZpZ3MucGF0Y2ggICAgICAgICAgIHwgNiArKystLS0KIC4uLi9t
dG9vbHMve210b29sc180LjAuNDAuYmIgPT4gbXRvb2xzXzQuMC40MS5iYn0gICAgICAgICAgIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy97bXRvb2xzXzQuMC40MC5iYiA9PiBt
dG9vbHNfNC4wLjQxLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9tdG9vbHMvbXRvb2xzL2Rpc2FibGUtaGFyZGNvZGVkLWNvbmZpZ3MucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9kaXNhYmxlLWhhcmRjb2RlZC1jb25maWdzLnBh
dGNoCmluZGV4IDhmNDYxNzRhNWIuLmI3NWE0ZDUzODcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL2Rpc2FibGUtaGFyZGNvZGVkLWNvbmZpZ3MucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvZGlzYWJsZS1oYXJkY29k
ZWQtY29uZmlncy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2EwNWRjMmMwYWNmZjE3MTNk
ZDQ0Y2VmNWU5ZjMyOGYwNzA2ZWIzZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNzIy
ZTBjNTkwODY5MzU1YTkyM2M1NTQ5OTYzNGYxNmUyOTc1NjVmNyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEVkIEJhcnRvc2ggPGVkLmJhcnRvc2hAbGludXguaW50ZWwuY29tPgogRGF0
ZTogVHVlLCAxMyBKdW4gMjAxNyAxNDo1NTo1MiArMDMwMAogU3ViamVjdDogW1BBVENIXSBEaXNh
YmxlZCByZWFkaW5nIGhvc3QgY29uZmlncy4KQEAgLTEyLDEwICsxMiwxMCBAQCBTaWduZWQtb2Zm
LWJ5OiBFZCBCYXJ0b3NoIDxlZC5iYXJ0b3NoQGxpbnV4LmludGVsLmNvbT4KICAxIGZpbGUgY2hh
bmdlZCwgOCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZy5jIGIvY29uZmlnLmMK
LWluZGV4IDYzMGY5OWQuLjA3ZGJmNTMgMTAwNjQ0CitpbmRleCA4YzVmYTgzLi4zNDYwNDhiIDEw
MDY0NAogLS0tIGEvY29uZmlnLmMKICsrKyBiL2NvbmZpZy5jCi1AQCAtODM0LDE0ICs4MzQsNiBA
QCB2b2lkIHJlYWRfY29uZmlnKHZvaWQpCitAQCAtODQzLDE0ICs4NDMsNiBAQCB2b2lkIHJlYWRf
Y29uZmlnKHZvaWQpCiAgCW1lbWNweShkZXZpY2VzLCBjb25zdF9kZXZpY2VzLAogIAkgICAgICAg
bnJfY29uc3RfZGV2aWNlcypzaXplb2Yoc3RydWN0IGRldmljZSkpOwogIApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHNfNC4wLjQwLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL210b29scy9tdG9vbHNfNC4wLjQxLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzXzQuMC40MC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHNfNC4wLjQxLmJi
CmluZGV4IDIwMGM3Yzc2ODEuLjI5ZTc0MjdhMTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tdG9vbHMvbXRvb2xzXzQuMC40MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbXRvb2xzL210b29sc180LjAuNDEuYmIKQEAgLTI0LDcgKzI0LDcgQEAgUlJFQ09NTUVORFM6
JHtQTn06bGliYy1nbGliYyA9ICJcCiAJZ2xpYmMtZ2NvbnYtaWJtODY2IFwKIAlnbGliYy1nY29u
di1pYm04NjkgXAogCSIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhMjJmY2E0MjM1NDAxMWRkMjI5
M2E3ZjUxZjIyOGI0NmViYmQ4MDJlNzc0MGIwOTc1OTEyYWZlY2I3OWQ1ZGY0IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjI1NDIxNTIyNjRmYjNlZmY3ZWQ3MDY2MmFiZjRmNGVlZjgxMzNiYzM3ZDBi
N2E2ODZjMjQwZGYyYjVmODBhMTMiCiAKIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9tdG9vbHMv
bXRvb2xzLSR7UFZ9LnRhci5iejIgXAogICAgICAgICAgICBmaWxlOi8vbXRvb2xzLW1ha2VpbmZv
LnBhdGNoIFwKLS0gCjIuMzEuMQoK

--===============3493499393749456135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mtools: SRC_URI changed from "https://ftp.gnu.org/gnu/mtools/mtools-4.0.40.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch" to "https://ftp.gnu.org/gnu/mtools/mtools-4.0.41.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch"
packages/core2-32-poky-linux/mtools: PV changed from "4.0.40" to "4.0.41"
packages/core2-32-poky-linux/mtools: PKGV changed from 4.0.40 [default] to 4.0.41 [default]
packages/core2-32-poky-linux/mtools/mtools-dbg: PKGSIZE changed from 725468 to 726188 (+0%)
packages/core2-32-poky-linux/mtools/mtools-dbg: PV changed from "4.0.40" to "4.0.41"
packages/core2-32-poky-linux/mtools/mtools-dbg: PKGV changed from 4.0.40 [default] to 4.0.41 [default]
packages/core2-32-poky-linux/mtools/mtools-dev: PV changed from "4.0.40" to "4.0.41"
packages/core2-32-poky-linux/mtools/mtools-dev: PKGV changed from 4.0.40 [default] to 4.0.41 [default]
packages/core2-32-poky-linux/mtools/mtools-doc: PKGSIZE changed from 241856 to 241786 (-0%)
packages/core2-32-poky-linux/mtools/mtools-doc: PV changed from "4.0.40" to "4.0.41"
packages/core2-32-poky-linux/mtools/mtools-doc: PKGV changed from 4.0.40 [default] to 4.0.41 [default]
packages/core2-32-poky-linux/mtools/mtools-locale: PV changed from "4.0.40" to "4.0.41"
packages/core2-32-poky-linux/mtools/mtools-locale: PKGV changed from 4.0.40 [default] to 4.0.41 [default]
packages/core2-32-poky-linux/mtools/mtools-src: FILELIST: removed "/usr/src/debug/mtools/4.0.40-r0/scsi.h /usr/src/debug/mtools/4.0.40-r0/mtools.h /usr/src/debug/mtools/4.0.40-r0/privileges.c /usr/src/debug/mtools/4.0.40-r0/mattrib.c /usr/src/debug/mtools/4.0.40-r0/mdel.c /usr/src/debug/mtools/4.0.40-r0/buffer.c /usr/src/debug/mtools/4.0.40-r0/fat.c /usr/src/debug/mtools/4.0.40-r0/mzip.c /usr/src/debug/mtools/4.0.40-r0/minfo.c /usr/src/debug/mtools/4.0.40-r0/tty.c /usr/src/debug/mtools/4.0.40-r0/device.h /usr/src/debug/mtools/4.0.40-r0/mtoolsDirentry.h /usr/src/debug/mtools/4.0.40-r0/mshortname.c /usr/src/debug/mtools/4.0.40-r0/match.c /usr/src/debug/mtools/4.0.40-r0/streamcache.c /usr/src/debug/mtools/4.0.40-r0/old_dos.c /usr/src/debug/mtools/4.0.40-r0/copyfile.c /usr/src/debug/mtools/4.0.40-r0/dirCacheP.h /usr/src/debug/mtools/4.0.40-r0/fat_free.c /usr/src/debug/mtools/4.0.40-r0/stream.h /usr/src/debug/mtools/4.0.40-r0/config.c /usr/src/debug/mtools/4.0.40-r0/unix2dos.c /usr/src/de
 bug/mtools/4.0.40-r0/vfat.c /usr/src/debug/mtools/4.0.40-r0/swap.c /usr/src/debug/mtools/4.0.40-r0/offset.c /usr/src/debug/mtools/4.0.40-r0/open_image.c /usr/src/debug/mtools/4.0.40-r0/hash.c /usr/src/debug/mtools/4.0.40-r0/dos2unix.c /usr/src/debug/mtools/4.0.40-r0/charsetConv.c /usr/src/debug/mtools/4.0.40-r0/directory.c /usr/src/debug/mtools/4.0.40-r0/direntry.c /usr/src/debug/mtools/4.0.40-r0/mshowfat.c /usr/src/debug/mtools/4.0.40-r0/lockdev.c /usr/src/debug/mtools/4.0.40-r0/mbadblocks.c /usr/src/debug/mtools/4.0.40-r0/mlabel.c /usr/src/debug/mtools/4.0.40-r0/old_dos.h /usr/src/debug/mtools/4.0.40-r0/mkmanifest.c /usr/src/debug/mtools/4.0.40-r0/offset.h /usr/src/debug/mtools/4.0.40-r0/llong.h /usr/src/debug/mtools/4.0.40-r0/expand.c /usr/src/debug/mtools/4.0.40-r0/swap.h /usr/src/debug/mtools/4.0.40-r0/mmount.c /usr/src/debug/mtools/4.0.40-r0/lba.c /usr/src/debug/mtools/4.0.40-r0/mcd.c /usr/src/debug/mtools/4.0.40-r0/misc.c /usr/src/debug/mtools/4.0.40-r0/mmd.c /usr/src/debug/m
 tools/4.0.40-r0/strtonum.c /usr/src/debug/mtools/4.0.40-r0/patchlevel.c /usr/src/debug/mtools/4.0.40-r0/dirCache.h /usr/src/debug/mtools/4.0.40-r0/mk_direntry.c /usr/src/debug/mtools/4.0.40-r0/missFuncs.c /usr/src/debug/mtools/4.0.40-r0/mformat.c /usr/src/debug/mtools/4.0.40-r0/mdoctorfat.c /usr/src/debug/mtools/4.0.40-r0/open_image.h /usr/src/debug/mtools/4.0.40-r0/vfat.h /usr/src/debug/mtools/4.0.40-r0/mainloop.h /usr/src/debug/mtools/4.0.40-r0/scsi.c /usr/src/debug/mtools/4.0.40-r0/unixdir.c /usr/src/debug/mtools/4.0.40-r0/precmd.c /usr/src/debug/mtools/4.0.40-r0/nameclash.h /usr/src/debug/mtools/4.0.40-r0/sysincludes.h /usr/src/debug/mtools/4.0.40-r0/plain_io.h /usr/src/debug/mtools/4.0.40-r0/msdos.h /usr/src/debug/mtools/4.0.40-r0/plain_io.c /usr/src/debug/mtools/4.0.40-r0/buffer.h /usr/src/debug/mtools/4.0.40-r0/llong.c /usr/src/debug/mtools/4.0.40-r0/mmove.c /usr/src/debug/mtools/4.0.40-r0/mcopy.c /usr/src/debug/mtools/4.0.40-r0/scsi_io.c /usr/src/debug/mtools/4.0.40-r0/force
 _io.c /usr/src/debug/mtools/4.0.40-r0/mainloop.c /usr/src/debug/mtools/4.0.40-r0/file.h /usr/src/debug/mtools/4.0.40-r0/devices.h /usr/src/debug/mtools/4.0.40-r0/htable.h /usr/src/debug/mtools/4.0.40-r0/mpartition.c /usr/src/debug/mtools/4.0.40-r0/mtools.c /usr/src/debug/mtools/4.0.40-r0/device.c /usr/src/debug/mtools/4.0.40-r0/fsP.h /usr/src/debug/mtools/4.0.40-r0/file_name.h /usr/src/debug/mtools/4.0.40-r0/remap.c /usr/src/debug/mtools/4.0.40-r0/scsi_io.h /usr/src/debug/mtools/4.0.40-r0/lba.h /usr/src/debug/mtools/4.0.40-r0/fs.h /usr/src/debug/mtools/4.0.40-r0/xdf_io.c /usr/src/debug/mtools/4.0.40-r0/lockdev.h /usr/src/debug/mtools/4.0.40-r0/mdu.c /usr/src/debug/mtools/4.0.40-r0/mcat.c /usr/src/debug/mtools/4.0.40-r0/xdf_io.h /usr/src/debug/mtools/4.0.40-r0/devices.c /usr/src/debug/mtools/4.0.40-r0/file.c /usr/src/debug/mtools/4.0.40-r0/remap.h /usr/src/debug/mtools/4.0.40-r0/signal.c /usr/src/debug/mtools/4.0.40-r0/init.c /usr/src/debug/mtools/4.0.40-r0/stream.c /usr/src/debug/mt
 ools/4.0.40-r0/mdir.c /usr/src/debug/mtools/4.0.40-r0/dirCache.c /usr/src/debug/mtools/4.0.40-r0/file_name.c /usr/src/debug/mtools/4.0.40-r0/partition.h /usr/src/debug/mtools/4.0.40-r0/partition.c", added "/usr/src/debug/mtools/4.0.41-r0/partition.h /usr/src/debug/mtools/4.0.41-r0/lba.h /usr/src/debug/mtools/4.0.41-r0/mainloop.h /usr/src/debug/mtools/4.0.41-r0/mbadblocks.c /usr/src/debug/mtools/4.0.41-r0/mcopy.c /usr/src/debug/mtools/4.0.41-r0/mmove.c /usr/src/debug/mtools/4.0.41-r0/mdu.c /usr/src/debug/mtools/4.0.41-r0/xdf_io.c /usr/src/debug/mtools/4.0.41-r0/buffer.c /usr/src/debug/mtools/4.0.41-r0/direntry.c /usr/src/debug/mtools/4.0.41-r0/lba.c /usr/src/debug/mtools/4.0.41-r0/mzip.c /usr/src/debug/mtools/4.0.41-r0/offset.c /usr/src/debug/mtools/4.0.41-r0/mtools.h /usr/src/debug/mtools/4.0.41-r0/mtools.c /usr/src/debug/mtools/4.0.41-r0/mdoctorfat.c /usr/src/debug/mtools/4.0.41-r0/force_io.c /usr/src/debug/mtools/4.0.41-r0/mshowfat.c /usr/src/debug/mtools/4.0.41-r0/scsi.c /usr/src
 /debug/mtools/4.0.41-r0/old_dos.h /usr/src/debug/mtools/4.0.41-r0/llong.c /usr/src/debug/mtools/4.0.41-r0/file_name.c /usr/src/debug/mtools/4.0.41-r0/mcat.c /usr/src/debug/mtools/4.0.41-r0/scsi_io.h /usr/src/debug/mtools/4.0.41-r0/devices.h /usr/src/debug/mtools/4.0.41-r0/mmd.c /usr/src/debug/mtools/4.0.41-r0/scsi_io.c /usr/src/debug/mtools/4.0.41-r0/hash.c /usr/src/debug/mtools/4.0.41-r0/dirCache.h /usr/src/debug/mtools/4.0.41-r0/remap.c /usr/src/debug/mtools/4.0.41-r0/device.c /usr/src/debug/mtools/4.0.41-r0/mdir.c /usr/src/debug/mtools/4.0.41-r0/directory.c /usr/src/debug/mtools/4.0.41-r0/signal.c /usr/src/debug/mtools/4.0.41-r0/lockdev.c /usr/src/debug/mtools/4.0.41-r0/misc.c /usr/src/debug/mtools/4.0.41-r0/fat_free.c /usr/src/debug/mtools/4.0.41-r0/old_dos.c /usr/src/debug/mtools/4.0.41-r0/streamcache.c /usr/src/debug/mtools/4.0.41-r0/mpartition.c /usr/src/debug/mtools/4.0.41-r0/mainloop.c /usr/src/debug/mtools/4.0.41-r0/patchlevel.c /usr/src/debug/mtools/4.0.41-r0/open_image.h
  /usr/src/debug/mtools/4.0.41-r0/mshortname.c /usr/src/debug/mtools/4.0.41-r0/open_image.c /usr/src/debug/mtools/4.0.41-r0/copyfile.c /usr/src/debug/mtools/4.0.41-r0/stream.c /usr/src/debug/mtools/4.0.41-r0/config.c /usr/src/debug/mtools/4.0.41-r0/minfo.c /usr/src/debug/mtools/4.0.41-r0/vfat.c /usr/src/debug/mtools/4.0.41-r0/mmount.c /usr/src/debug/mtools/4.0.41-r0/buffer.h /usr/src/debug/mtools/4.0.41-r0/file_name.h /usr/src/debug/mtools/4.0.41-r0/mlabel.c /usr/src/debug/mtools/4.0.41-r0/match.c /usr/src/debug/mtools/4.0.41-r0/strtonum.c /usr/src/debug/mtools/4.0.41-r0/nameclash.h /usr/src/debug/mtools/4.0.41-r0/tty.c /usr/src/debug/mtools/4.0.41-r0/xdf_io.h /usr/src/debug/mtools/4.0.41-r0/privileges.c /usr/src/debug/mtools/4.0.41-r0/file.c /usr/src/debug/mtools/4.0.41-r0/mattrib.c /usr/src/debug/mtools/4.0.41-r0/plain_io.h /usr/src/debug/mtools/4.0.41-r0/swap.c /usr/src/debug/mtools/4.0.41-r0/init.c /usr/src/debug/mtools/4.0.41-r0/plain_io.c /usr/src/debug/mtools/4.0.41-r0/devices
 .c /usr/src/debug/mtools/4.0.41-r0/swap.h /usr/src/debug/mtools/4.0.41-r0/dirCache.c /usr/src/debug/mtools/4.0.41-r0/llong.h /usr/src/debug/mtools/4.0.41-r0/sysincludes.h /usr/src/debug/mtools/4.0.41-r0/htable.h /usr/src/debug/mtools/4.0.41-r0/charsetConv.c /usr/src/debug/mtools/4.0.41-r0/fs.h /usr/src/debug/mtools/4.0.41-r0/lockdev.h /usr/src/debug/mtools/4.0.41-r0/file.h /usr/src/debug/mtools/4.0.41-r0/mk_direntry.c /usr/src/debug/mtools/4.0.41-r0/mtoolsDirentry.h /usr/src/debug/mtools/4.0.41-r0/partition.c /usr/src/debug/mtools/4.0.41-r0/precmd.c /usr/src/debug/mtools/4.0.41-r0/mdel.c /usr/src/debug/mtools/4.0.41-r0/dirCacheP.h /usr/src/debug/mtools/4.0.41-r0/missFuncs.c /usr/src/debug/mtools/4.0.41-r0/fat.c /usr/src/debug/mtools/4.0.41-r0/vfat.h /usr/src/debug/mtools/4.0.41-r0/fsP.h /usr/src/debug/mtools/4.0.41-r0/unix2dos.c /usr/src/debug/mtools/4.0.41-r0/msdos.h /usr/src/debug/mtools/4.0.41-r0/device.h /usr/src/debug/mtools/4.0.41-r0/mkmanifest.c /usr/src/debug/mtools/4.0.41-r
 0/offset.h /usr/src/debug/mtools/4.0.41-r0/stream.h /usr/src/debug/mtools/4.0.41-r0/scsi.h /usr/src/debug/mtools/4.0.41-r0/remap.h /usr/src/debug/mtools/4.0.41-r0/fat_device.h /usr/src/debug/mtools/4.0.41-r0/mcd.c /usr/src/debug/mtools/4.0.41-r0/mformat.c /usr/src/debug/mtools/4.0.41-r0/dos2unix.c /usr/src/debug/mtools/4.0.41-r0/unixdir.c /usr/src/debug/mtools/4.0.41-r0/expand.c"
packages/core2-32-poky-linux/mtools/mtools-src: PKGSIZE changed from 594283 to 596193 (+0%)
packages/core2-32-poky-linux/mtools/mtools-src: PV changed from "4.0.40" to "4.0.41"
packages/core2-32-poky-linux/mtools/mtools-src: PKGV changed from 4.0.40 [default] to 4.0.41 [default]
packages/core2-32-poky-linux/mtools/mtools-staticdev: PV changed from "4.0.40" to "4.0.41"
packages/core2-32-poky-linux/mtools/mtools-staticdev: PKGV changed from 4.0.40 [default] to 4.0.41 [default]
packages/core2-32-poky-linux/mtools/mtools: PV changed from "4.0.40" to "4.0.41"
packages/core2-32-poky-linux/mtools/mtools: PKGV changed from 4.0.40 [default] to 4.0.41 [default]

--===============3493499393749456135==--

