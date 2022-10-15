Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A81C64EC5
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web08.24454.1665871393752354382
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BjK9AV/X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010183ddac316b-0f3f2fcb-3b01-41a6-878f-242dfe2172f0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xLEXOf61SGTSriSX1TO52VL1+rO0M7Go7NQhhztHRN4=;
	b=BjK9AV/XKBOAkrtSmDUMYYF/kf/bCTduyzqPc+kGc4k7W+3z1TxHCjP/b1tEr+PD
	W4vkhWhKlbAV+GWwDd72kYM2nAyMIntnyLXLKmtKRO8j6Jjd4nscDTLStxFJ9PEpoBr
	ClUcCz7V1c8CQPe1Qld2AaQ2O3hFpTVr6aWSTQhk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xLEXOf61SGTSriSX1TO52VL1+rO0M7Go7NQhhztHRN4=;
	b=CKOSdIvPwvEcLGyF4yXMgta154z1I0/5boBV7skkLLGFZEVhGQpJym/v8A0IMLvK
	saMtYRU8TV4pXBkscicdnrvIXwufoWdJibR5ssYqVLK4oV1LIf1d/Iex2kR8aSMWYeD
	65q7MWriyWPjbc7ZCDmGpmu2oOZEUATXlQXRLpRQ=
Content-Type: multipart/mixed; boundary="===============1194474492070231444=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtools: upgrading to 4.0.41 SUCCEEDED
Message-ID: <01010183ddac316b-0f3f2fcb-3b01-41a6-878f-242dfe2172f0-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171770

--===============1194474492070231444==
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
--===============1194474492070231444==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mtools-upgrade-4.0.40-4.0.41.patch"

RnJvbSA2OGVjZTE3YTJjNTdjYmU3MjFiZWY5NzJkMjRkZTMyYjNhMTFlZGRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMDk6Mzg6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
dG9vbHM6IHVwZ3JhZGUgNC4wLjQwIC0+IDQuMC40MQoKLS0tCiAuLi4vbXRvb2xzL210b29scy9k
aXNhYmxlLWhhcmRjb2RlZC1jb25maWdzLnBhdGNoICAgICAgICAgICB8IDYgKysrLS0tCiAuLi4v
bXRvb2xzL3ttdG9vbHNfNC4wLjQwLmJiID0+IG10b29sc180LjAuNDEuYmJ9ICAgICAgICAgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMve210b29sc180LjAuNDAuYmIgPT4g
bXRvb2xzXzQuMC40MS5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbXRvb2xzL210b29scy9kaXNhYmxlLWhhcmRjb2RlZC1jb25maWdzLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvZGlzYWJsZS1oYXJkY29kZWQtY29uZmlncy5w
YXRjaAppbmRleCA4ZjQ2MTc0YTViLi43ZTdkOWRhMmRlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9kaXNhYmxlLWhhcmRjb2RlZC1jb25maWdzLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL2Rpc2FibGUtaGFyZGNv
ZGVkLWNvbmZpZ3MucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDNhMDVkYzJjMGFjZmYxNzEz
ZGQ0NGNlZjVlOWYzMjhmMDcwNmViM2UgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGZk
YzEyYjUyOWQ0Y2YzMDIxMjY0YTM0MjA5ZTExNmMwNDE3ZDEyOWQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBFZCBCYXJ0b3NoIDxlZC5iYXJ0b3NoQGxpbnV4LmludGVsLmNvbT4KIERh
dGU6IFR1ZSwgMTMgSnVuIDIwMTcgMTQ6NTU6NTIgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gRGlz
YWJsZWQgcmVhZGluZyBob3N0IGNvbmZpZ3MuCkBAIC0xMiwxMCArMTIsMTAgQEAgU2lnbmVkLW9m
Zi1ieTogRWQgQmFydG9zaCA8ZWQuYmFydG9zaEBsaW51eC5pbnRlbC5jb20+CiAgMSBmaWxlIGNo
YW5nZWQsIDggZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWcuYyBiL2NvbmZpZy5j
Ci1pbmRleCA2MzBmOTlkLi4wN2RiZjUzIDEwMDY0NAoraW5kZXggOGM1ZmE4My4uMzQ2MDQ4YiAx
MDA2NDQKIC0tLSBhL2NvbmZpZy5jCiArKysgYi9jb25maWcuYwotQEAgLTgzNCwxNCArODM0LDYg
QEAgdm9pZCByZWFkX2NvbmZpZyh2b2lkKQorQEAgLTg0MywxNCArODQzLDYgQEAgdm9pZCByZWFk
X2NvbmZpZyh2b2lkKQogIAltZW1jcHkoZGV2aWNlcywgY29uc3RfZGV2aWNlcywKICAJICAgICAg
IG5yX2NvbnN0X2RldmljZXMqc2l6ZW9mKHN0cnVjdCBkZXZpY2UpKTsKICAKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzXzQuMC40MC5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzXzQuMC40MS5iYgpzaW1pbGFyaXR5IGluZGV4IDkz
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29sc180LjAuNDAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzXzQuMC40MS5i
YgppbmRleCAyMDBjN2M3NjgxLi4yOWU3NDI3YTEwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvbXRvb2xzL210b29sc180LjAuNDAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL210b29scy9tdG9vbHNfNC4wLjQxLmJiCkBAIC0yNCw3ICsyNCw3IEBAIFJSRUNPTU1FTkRT
OiR7UE59OmxpYmMtZ2xpYmMgPSAiXAogCWdsaWJjLWdjb252LWlibTg2NiBcCiAJZ2xpYmMtZ2Nv
bnYtaWJtODY5IFwKIAkiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTIyZmNhNDIzNTQwMTFkZDIy
OTNhN2Y1MWYyMjhiNDZlYmJkODAyZTc3NDBiMDk3NTkxMmFmZWNiNzlkNWRmNCIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICIyNTQyMTUyMjY0ZmIzZWZmN2VkNzA2NjJhYmY0ZjRlZWY4MTMzYmMzN2Qw
YjdhNjg2YzI0MGRmMmI1ZjgwYTEzIgogCiBTUkNfVVJJID0gIiR7R05VX01JUlJPUn0vbXRvb2xz
L210b29scy0ke1BWfS50YXIuYnoyIFwKICAgICAgICAgICAgZmlsZTovL210b29scy1tYWtlaW5m
by5wYXRjaCBcCi0tIAoyLjMxLjEKCg==

--===============1194474492070231444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mtools: PV changed from "4.0.40" to "4.0.41"
packages/core2-32-poky-linux/mtools: PKGV changed from 4.0.40 [default] to 4.0.41 [default]
packages/core2-32-poky-linux/mtools: SRC_URI changed from "https://ftp.gnu.org/gnu/mtools/mtools-4.0.40.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch" to "https://ftp.gnu.org/gnu/mtools/mtools-4.0.41.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch"
packages/core2-32-poky-linux/mtools/mtools-dbg: PV changed from "4.0.40" to "4.0.41"
packages/core2-32-poky-linux/mtools/mtools-dbg: PKGSIZE changed from 725468 to 726188 (+0%)
packages/core2-32-poky-linux/mtools/mtools-dbg: PKGV changed from 4.0.40 [default] to 4.0.41 [default]
packages/core2-32-poky-linux/mtools/mtools-dev: PV changed from "4.0.40" to "4.0.41"
packages/core2-32-poky-linux/mtools/mtools-dev: PKGV changed from 4.0.40 [default] to 4.0.41 [default]
packages/core2-32-poky-linux/mtools/mtools-doc: PV changed from "4.0.40" to "4.0.41"
packages/core2-32-poky-linux/mtools/mtools-doc: PKGSIZE changed from 241856 to 241786 (-0%)
packages/core2-32-poky-linux/mtools/mtools-doc: PKGV changed from 4.0.40 [default] to 4.0.41 [default]
packages/core2-32-poky-linux/mtools/mtools-locale: PV changed from "4.0.40" to "4.0.41"
packages/core2-32-poky-linux/mtools/mtools-locale: PKGV changed from 4.0.40 [default] to 4.0.41 [default]
packages/core2-32-poky-linux/mtools/mtools-src: PV changed from "4.0.40" to "4.0.41"
packages/core2-32-poky-linux/mtools/mtools-src: PKGSIZE changed from 594283 to 596193 (+0%)
packages/core2-32-poky-linux/mtools/mtools-src: PKGV changed from 4.0.40 [default] to 4.0.41 [default]
packages/core2-32-poky-linux/mtools/mtools-src: FILELIST: removed "/usr/src/debug/mtools/4.0.40-r0/device.c /usr/src/debug/mtools/4.0.40-r0/dirCache.c /usr/src/debug/mtools/4.0.40-r0/file.h /usr/src/debug/mtools/4.0.40-r0/config.c /usr/src/debug/mtools/4.0.40-r0/old_dos.c /usr/src/debug/mtools/4.0.40-r0/sysincludes.h /usr/src/debug/mtools/4.0.40-r0/dos2unix.c /usr/src/debug/mtools/4.0.40-r0/vfat.h /usr/src/debug/mtools/4.0.40-r0/open_image.c /usr/src/debug/mtools/4.0.40-r0/htable.h /usr/src/debug/mtools/4.0.40-r0/fsP.h /usr/src/debug/mtools/4.0.40-r0/mcopy.c /usr/src/debug/mtools/4.0.40-r0/strtonum.c /usr/src/debug/mtools/4.0.40-r0/buffer.h /usr/src/debug/mtools/4.0.40-r0/force_io.c /usr/src/debug/mtools/4.0.40-r0/mlabel.c /usr/src/debug/mtools/4.0.40-r0/mpartition.c /usr/src/debug/mtools/4.0.40-r0/fs.h /usr/src/debug/mtools/4.0.40-r0/xdf_io.h /usr/src/debug/mtools/4.0.40-r0/scsi.c /usr/src/debug/mtools/4.0.40-r0/scsi_io.c /usr/src/debug/mtools/4.0.40-r0/nameclash.h /usr/src/debug/mt
 ools/4.0.40-r0/mdu.c /usr/src/debug/mtools/4.0.40-r0/missFuncs.c /usr/src/debug/mtools/4.0.40-r0/device.h /usr/src/debug/mtools/4.0.40-r0/remap.h /usr/src/debug/mtools/4.0.40-r0/mmove.c /usr/src/debug/mtools/4.0.40-r0/devices.c /usr/src/debug/mtools/4.0.40-r0/llong.c /usr/src/debug/mtools/4.0.40-r0/scsi.h /usr/src/debug/mtools/4.0.40-r0/lockdev.h /usr/src/debug/mtools/4.0.40-r0/mtools.h /usr/src/debug/mtools/4.0.40-r0/directory.c /usr/src/debug/mtools/4.0.40-r0/match.c /usr/src/debug/mtools/4.0.40-r0/hash.c /usr/src/debug/mtools/4.0.40-r0/mshortname.c /usr/src/debug/mtools/4.0.40-r0/tty.c /usr/src/debug/mtools/4.0.40-r0/privileges.c /usr/src/debug/mtools/4.0.40-r0/copyfile.c /usr/src/debug/mtools/4.0.40-r0/mbadblocks.c /usr/src/debug/mtools/4.0.40-r0/stream.h /usr/src/debug/mtools/4.0.40-r0/minfo.c /usr/src/debug/mtools/4.0.40-r0/devices.h /usr/src/debug/mtools/4.0.40-r0/mtoolsDirentry.h /usr/src/debug/mtools/4.0.40-r0/fat.c /usr/src/debug/mtools/4.0.40-r0/mkmanifest.c /usr/src/debu
 g/mtools/4.0.40-r0/charsetConv.c /usr/src/debug/mtools/4.0.40-r0/plain_io.c /usr/src/debug/mtools/4.0.40-r0/plain_io.h /usr/src/debug/mtools/4.0.40-r0/mtools.c /usr/src/debug/mtools/4.0.40-r0/open_image.h /usr/src/debug/mtools/4.0.40-r0/mcat.c /usr/src/debug/mtools/4.0.40-r0/mshowfat.c /usr/src/debug/mtools/4.0.40-r0/init.c /usr/src/debug/mtools/4.0.40-r0/mformat.c /usr/src/debug/mtools/4.0.40-r0/signal.c /usr/src/debug/mtools/4.0.40-r0/msdos.h /usr/src/debug/mtools/4.0.40-r0/precmd.c /usr/src/debug/mtools/4.0.40-r0/patchlevel.c /usr/src/debug/mtools/4.0.40-r0/partition.h /usr/src/debug/mtools/4.0.40-r0/dirCache.h /usr/src/debug/mtools/4.0.40-r0/vfat.c /usr/src/debug/mtools/4.0.40-r0/mmount.c /usr/src/debug/mtools/4.0.40-r0/offset.h /usr/src/debug/mtools/4.0.40-r0/mdir.c /usr/src/debug/mtools/4.0.40-r0/mzip.c /usr/src/debug/mtools/4.0.40-r0/direntry.c /usr/src/debug/mtools/4.0.40-r0/mainloop.c /usr/src/debug/mtools/4.0.40-r0/file_name.h /usr/src/debug/mtools/4.0.40-r0/misc.c /usr/sr
 c/debug/mtools/4.0.40-r0/xdf_io.c /usr/src/debug/mtools/4.0.40-r0/file_name.c /usr/src/debug/mtools/4.0.40-r0/mdel.c /usr/src/debug/mtools/4.0.40-r0/mdoctorfat.c /usr/src/debug/mtools/4.0.40-r0/expand.c /usr/src/debug/mtools/4.0.40-r0/dirCacheP.h /usr/src/debug/mtools/4.0.40-r0/lba.c /usr/src/debug/mtools/4.0.40-r0/buffer.c /usr/src/debug/mtools/4.0.40-r0/fat_free.c /usr/src/debug/mtools/4.0.40-r0/mcd.c /usr/src/debug/mtools/4.0.40-r0/mainloop.h /usr/src/debug/mtools/4.0.40-r0/unix2dos.c /usr/src/debug/mtools/4.0.40-r0/mk_direntry.c /usr/src/debug/mtools/4.0.40-r0/partition.c /usr/src/debug/mtools/4.0.40-r0/llong.h /usr/src/debug/mtools/4.0.40-r0/file.c /usr/src/debug/mtools/4.0.40-r0/offset.c /usr/src/debug/mtools/4.0.40-r0/scsi_io.h /usr/src/debug/mtools/4.0.40-r0/mmd.c /usr/src/debug/mtools/4.0.40-r0/unixdir.c /usr/src/debug/mtools/4.0.40-r0/lba.h /usr/src/debug/mtools/4.0.40-r0/streamcache.c /usr/src/debug/mtools/4.0.40-r0/stream.c /usr/src/debug/mtools/4.0.40-r0/old_dos.h /usr/
 src/debug/mtools/4.0.40-r0/mattrib.c /usr/src/debug/mtools/4.0.40-r0/swap.c /usr/src/debug/mtools/4.0.40-r0/swap.h /usr/src/debug/mtools/4.0.40-r0/lockdev.c /usr/src/debug/mtools/4.0.40-r0/remap.c", added "/usr/src/debug/mtools/4.0.41-r0/mcat.c /usr/src/debug/mtools/4.0.41-r0/init.c /usr/src/debug/mtools/4.0.41-r0/device.h /usr/src/debug/mtools/4.0.41-r0/nameclash.h /usr/src/debug/mtools/4.0.41-r0/charsetConv.c /usr/src/debug/mtools/4.0.41-r0/mlabel.c /usr/src/debug/mtools/4.0.41-r0/plain_io.c /usr/src/debug/mtools/4.0.41-r0/copyfile.c /usr/src/debug/mtools/4.0.41-r0/mpartition.c /usr/src/debug/mtools/4.0.41-r0/misc.c /usr/src/debug/mtools/4.0.41-r0/htable.h /usr/src/debug/mtools/4.0.41-r0/fsP.h /usr/src/debug/mtools/4.0.41-r0/mmd.c /usr/src/debug/mtools/4.0.41-r0/file_name.h /usr/src/debug/mtools/4.0.41-r0/streamcache.c /usr/src/debug/mtools/4.0.41-r0/vfat.c /usr/src/debug/mtools/4.0.41-r0/mbadblocks.c /usr/src/debug/mtools/4.0.41-r0/mdel.c /usr/src/debug/mtools/4.0.41-r0/file.c /u
 sr/src/debug/mtools/4.0.41-r0/minfo.c /usr/src/debug/mtools/4.0.41-r0/sysincludes.h /usr/src/debug/mtools/4.0.41-r0/unix2dos.c /usr/src/debug/mtools/4.0.41-r0/dirCache.h /usr/src/debug/mtools/4.0.41-r0/old_dos.c /usr/src/debug/mtools/4.0.41-r0/partition.c /usr/src/debug/mtools/4.0.41-r0/mmove.c /usr/src/debug/mtools/4.0.41-r0/fat_free.c /usr/src/debug/mtools/4.0.41-r0/scsi_io.c /usr/src/debug/mtools/4.0.41-r0/fs.h /usr/src/debug/mtools/4.0.41-r0/unixdir.c /usr/src/debug/mtools/4.0.41-r0/mainloop.c /usr/src/debug/mtools/4.0.41-r0/device.c /usr/src/debug/mtools/4.0.41-r0/stream.c /usr/src/debug/mtools/4.0.41-r0/tty.c /usr/src/debug/mtools/4.0.41-r0/mkmanifest.c /usr/src/debug/mtools/4.0.41-r0/mdoctorfat.c /usr/src/debug/mtools/4.0.41-r0/old_dos.h /usr/src/debug/mtools/4.0.41-r0/mattrib.c /usr/src/debug/mtools/4.0.41-r0/lockdev.c /usr/src/debug/mtools/4.0.41-r0/mshortname.c /usr/src/debug/mtools/4.0.41-r0/remap.c /usr/src/debug/mtools/4.0.41-r0/devices.c /usr/src/debug/mtools/4.0.41-r0
 /mmount.c /usr/src/debug/mtools/4.0.41-r0/precmd.c /usr/src/debug/mtools/4.0.41-r0/buffer.h /usr/src/debug/mtools/4.0.41-r0/lockdev.h /usr/src/debug/mtools/4.0.41-r0/fat.c /usr/src/debug/mtools/4.0.41-r0/privileges.c /usr/src/debug/mtools/4.0.41-r0/hash.c /usr/src/debug/mtools/4.0.41-r0/vfat.h /usr/src/debug/mtools/4.0.41-r0/mtools.c /usr/src/debug/mtools/4.0.41-r0/mzip.c /usr/src/debug/mtools/4.0.41-r0/open_image.h /usr/src/debug/mtools/4.0.41-r0/offset.h /usr/src/debug/mtools/4.0.41-r0/partition.h /usr/src/debug/mtools/4.0.41-r0/mcopy.c /usr/src/debug/mtools/4.0.41-r0/open_image.c /usr/src/debug/mtools/4.0.41-r0/scsi_io.h /usr/src/debug/mtools/4.0.41-r0/directory.c /usr/src/debug/mtools/4.0.41-r0/patchlevel.c /usr/src/debug/mtools/4.0.41-r0/xdf_io.c /usr/src/debug/mtools/4.0.41-r0/mcd.c /usr/src/debug/mtools/4.0.41-r0/stream.h /usr/src/debug/mtools/4.0.41-r0/dirCacheP.h /usr/src/debug/mtools/4.0.41-r0/fat_device.h /usr/src/debug/mtools/4.0.41-r0/llong.c /usr/src/debug/mtools/4.0.4
 1-r0/mshowfat.c /usr/src/debug/mtools/4.0.41-r0/swap.h /usr/src/debug/mtools/4.0.41-r0/lba.h /usr/src/debug/mtools/4.0.41-r0/file.h /usr/src/debug/mtools/4.0.41-r0/file_name.c /usr/src/debug/mtools/4.0.41-r0/expand.c /usr/src/debug/mtools/4.0.41-r0/strtonum.c /usr/src/debug/mtools/4.0.41-r0/swap.c /usr/src/debug/mtools/4.0.41-r0/llong.h /usr/src/debug/mtools/4.0.41-r0/mformat.c /usr/src/debug/mtools/4.0.41-r0/lba.c /usr/src/debug/mtools/4.0.41-r0/dirCache.c /usr/src/debug/mtools/4.0.41-r0/signal.c /usr/src/debug/mtools/4.0.41-r0/msdos.h /usr/src/debug/mtools/4.0.41-r0/devices.h /usr/src/debug/mtools/4.0.41-r0/missFuncs.c /usr/src/debug/mtools/4.0.41-r0/buffer.c /usr/src/debug/mtools/4.0.41-r0/mk_direntry.c /usr/src/debug/mtools/4.0.41-r0/offset.c /usr/src/debug/mtools/4.0.41-r0/mdu.c /usr/src/debug/mtools/4.0.41-r0/scsi.h /usr/src/debug/mtools/4.0.41-r0/match.c /usr/src/debug/mtools/4.0.41-r0/scsi.c /usr/src/debug/mtools/4.0.41-r0/config.c /usr/src/debug/mtools/4.0.41-r0/dos2unix.c 
 /usr/src/debug/mtools/4.0.41-r0/mainloop.h /usr/src/debug/mtools/4.0.41-r0/plain_io.h /usr/src/debug/mtools/4.0.41-r0/mtoolsDirentry.h /usr/src/debug/mtools/4.0.41-r0/xdf_io.h /usr/src/debug/mtools/4.0.41-r0/mdir.c /usr/src/debug/mtools/4.0.41-r0/force_io.c /usr/src/debug/mtools/4.0.41-r0/remap.h /usr/src/debug/mtools/4.0.41-r0/direntry.c /usr/src/debug/mtools/4.0.41-r0/mtools.h"
packages/core2-32-poky-linux/mtools/mtools-staticdev: PV changed from "4.0.40" to "4.0.41"
packages/core2-32-poky-linux/mtools/mtools-staticdev: PKGV changed from 4.0.40 [default] to 4.0.41 [default]
packages/core2-32-poky-linux/mtools/mtools: PV changed from "4.0.40" to "4.0.41"
packages/core2-32-poky-linux/mtools/mtools: PKGV changed from 4.0.40 [default] to 4.0.41 [default]

--===============1194474492070231444==--

