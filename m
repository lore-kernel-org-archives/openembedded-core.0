Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2032AC7619A
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:46 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.10153.1676508397610298712
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ROvixrIJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018657affd53-08c3426c-0d65-4f24-a4ce-91ddd03f1c24-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2ve1MJW7ZlxnTPG9uJdNR1vbwcyo34xOxgRque9JzAk=;
	b=ROvixrIJGvEXSi38m0bl84Vepxi+Vj1+bHr1uD5kPF86uQWcdRJ65IkvZgfenfja
	GuKImlP2Q8uyAMuqm1mCL1CQ6wEDTMphVTeAmPmry9CbLTke4IJnY4y95nIgj+5lAVp
	KO1XxU/iNNS1ANcx4xup8hlPWe3ozA/j+yReEwP0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2ve1MJW7ZlxnTPG9uJdNR1vbwcyo34xOxgRque9JzAk=;
	b=LVRK13nbf4XhCObyNUrIfkK+hfFgLJYE3hlXZyZtcu95HdJYswbYqekl2nCLGNvx
	Uz7sOmZTYM4ApB4D37SC5y6TbnUi/HU41FWg7f8f2dker5rsouKJu1FlboyOIBfhfyU
	qRaSFoLwbOBy/uV6BOulPwfMJg4WXkyNaKjiErKE=
Content-Type: multipart/mixed; boundary="===============5344331526821736937=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] zstd: upgrading to 1.5.4 SUCCEEDED
Message-ID: <0101018657affd53-08c3426c-0d65-4f24-a4ce-91ddd03f1c24-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177251

--===============5344331526821736937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *zstd* to *1.5.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-zstd-upgrade-1.5.2-1.5.4.patch
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
--===============5344331526821736937==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-zstd-upgrade-1.5.2-1.5.4.patch"

RnJvbSAzZmM4YTg5OGYyMDlmMmIxNzk2OTg0ZWRiYWJiZDUzNmQwMjBiODY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMjA6MTc6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB6
c3RkOiB1cGdyYWRlIDEuNS4yIC0+IDEuNS40CgotLS0KIC4uLi96c3RkL3t6c3RkXzEuNS4yLmJi
ID0+IHpzdGRfMS41LjQuYmJ9ICAgICB8IDQyICsrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC96c3RkL3t6c3RkXzEuNS4yLmJiID0+IHpzdGRfMS41LjQuYmJ9ICg0NSUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3pzdGQvenN0ZF8xLjUuMi5iYiBi
L21ldGEvcmVjaXBlcy1leHRlbmRlZC96c3RkL3pzdGRfMS41LjQuYmIKc2ltaWxhcml0eSBpbmRl
eCA0NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3pzdGQvenN0ZF8xLjUuMi5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3pzdGQvenN0ZF8xLjUuNC5iYgppbmRl
eCAyYTYzOGViNDI2Li4yZGQyZWE0MDQwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvenN0ZC96c3RkXzEuNS4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC96c3RkL3pz
dGRfMS41LjQuYmIKQEAgLTEsMyArMSwzOCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtT
VU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUg
Zm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBs
aWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVk
LCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEg
J0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5
cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VO
U0UKKyMgKysrIExJQ0VOU0UKKyMgQEAgLTIsNyArMiw3IEBACisjICAKKyMgIEZvciBac3RhbmRh
cmQgc29mdHdhcmUKKyMgIAorIyAtQ29weXJpZ2h0IChjKSAyMDE2LXByZXNlbnQsIEZhY2Vib29r
LCBJbmMuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisjICtDb3B5cmlnaHQgKGMpIE1ldGEgUGxhdGZv
cm1zLCBJbmMuIGFuZCBhZmZpbGlhdGVzLiBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyAgCisjICBS
ZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9y
IHdpdGhvdXQgbW9kaWZpY2F0aW9uLAorIyAgYXJlIHBlcm1pdHRlZCBwcm92aWRlZCB0aGF0IHRo
ZSBmb2xsb3dpbmcgY29uZGl0aW9ucyBhcmUgbWV0OgorIyBAQCAtMTQsOSArMTQsOSBAQAorIyAg
ICAgdGhpcyBsaXN0IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dpbmcgZGlzY2xhaW1lciBp
biB0aGUgZG9jdW1lbnRhdGlvbgorIyAgICAgYW5kL29yIG90aGVyIG1hdGVyaWFscyBwcm92aWRl
ZCB3aXRoIHRoZSBkaXN0cmlidXRpb24uCisjICAKKyMgLSAqIE5laXRoZXIgdGhlIG5hbWUgRmFj
ZWJvb2sgbm9yIHRoZSBuYW1lcyBvZiBpdHMgY29udHJpYnV0b3JzIG1heSBiZSB1c2VkIHRvCisj
IC0gICBlbmRvcnNlIG9yIHByb21vdGUgcHJvZHVjdHMgZGVyaXZlZCBmcm9tIHRoaXMgc29mdHdh
cmUgd2l0aG91dCBzcGVjaWZpYworIyAtICAgcHJpb3Igd3JpdHRlbiBwZXJtaXNzaW9uLgorIyAr
ICogTmVpdGhlciB0aGUgbmFtZSBGYWNlYm9vaywgbm9yIE1ldGEsIG5vciB0aGUgbmFtZXMgb2Yg
aXRzIGNvbnRyaWJ1dG9ycyBtYXkKKyMgKyAgIGJlIHVzZWQgdG8gZW5kb3JzZSBvciBwcm9tb3Rl
IHByb2R1Y3RzIGRlcml2ZWQgZnJvbSB0aGlzIHNvZnR3YXJlIHdpdGhvdXQKKyMgKyAgIHNwZWNp
ZmljIHByaW9yIHdyaXR0ZW4gcGVybWlzc2lvbi4KKyMgIAorIyAgVEhJUyBTT0ZUV0FSRSBJUyBQ
Uk9WSURFRCBCWSBUSEUgQ09QWVJJR0hUIEhPTERFUlMgQU5EIENPTlRSSUJVVE9SUyAiQVMgSVMi
IEFORAorIyAgQU5ZIEVYUFJFU1MgT1IgSU1QTElFRCBXQVJSQU5USUVTLCBJTkNMVURJTkcsIEJV
VCBOT1QgTElNSVRFRCBUTywgVEhFIElNUExJRUQKKyMgCisjCisKIFNVTU1BUlkgPSAiWnN0YW5k
YXJkIC0gRmFzdCByZWFsLXRpbWUgY29tcHJlc3Npb24gYWxnb3JpdGhtIgogREVTQ1JJUFRJT04g
PSAiWnN0YW5kYXJkIGlzIGEgZmFzdCBsb3NzbGVzcyBjb21wcmVzc2lvbiBhbGdvcml0aG0sIHRh
cmdldGluZyBcCiByZWFsLXRpbWUgY29tcHJlc3Npb24gc2NlbmFyaW9zIGF0IHpsaWItbGV2ZWwg
YW5kIGJldHRlciBjb21wcmVzc2lvbiByYXRpb3MuIFwKQEAgLTYsMTIgKzQxLDEzIEBAIEhPTUVQ
QUdFID0gImh0dHA6Ly93d3cuenN0ZC5uZXQvIgogU0VDVElPTiA9ICJjb25zb2xlL3V0aWxzIgog
CiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSAmIEdQTC0yLjAtb25seSIKLUxJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWM3ZjBiMTYxZWRiZTUyZjVmMzQ1YTNkMTMxMWQwYjMy
IFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL0NPUFlJTkc7bWQ1PTM5YmJhN2QyY2YwYmEx
MDM2ZjJhNmUyYmU1MmZlM2YwIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTtt
ZDU9MDgyMmEzMmY3YWNkYmUwMTM2MDY3NDY2NDE3NDZlZTggXAorICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vQ09QWUlORzttZDU9MzliYmE3ZDJjZjBiYTEwMzZmMmE2ZTJiZTUyZmUzZjAgXAor
ICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9mYWNl
Ym9vay96c3RkLmdpdDticmFuY2g9cmVsZWFzZTtwcm90b2NvbD1odHRwcyIKIAotU1JDUkVWID0g
ImU0N2U2NzRjZDA5NTgzZmYwNTAzZjBmNmRlZmQ2ZDIzZDhiNzE4ZDMiCitTUkNSRVYgPSAiOTQ1
ZjI3NzU4YzBmZDY3YjYzNjEwM2EzOGRiZjA1MDI2NmM2YjkwYSIKIFVQU1RSRUFNX0NIRUNLX0dJ
VFRBR1JFR0VYID0gInYoP1A8cHZlcj5cZCsoXC5cZCspKykiCiAKIENWRV9QUk9EVUNUID0gInpz
dGFuZGFyZCIKLS0gCjIuMzcuMwoK

--===============5344331526821736937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/zstd: PKGV changed from 1.5.2 [default] to 1.5.4 [default]
packages/core2-32-poky-linux/zstd: PV changed from "1.5.2" to "1.5.4"
packages/core2-32-poky-linux/zstd/libzstd: FILELIST: removed "/usr/lib/libzstd.so.1.5.2", added "/usr/lib/libzstd.so.1.5.4"
packages/core2-32-poky-linux/zstd/libzstd: PKGSIZE changed from 759308 to 763232 (+1%)
packages/core2-32-poky-linux/zstd/libzstd: PKGV changed from 1.5.2 [default] to 1.5.4 [default]
packages/core2-32-poky-linux/zstd/libzstd: PV changed from "1.5.2" to "1.5.4"
Changes to packages/core2-32-poky-linux/zstd (sysroot):
  /usr/lib/libzstd.so.1 changed symlink target from libzstd.so.1.5.2 to libzstd.so.1.5.4
  /usr/lib/libzstd.so changed symlink target from libzstd.so.1.5.2 to libzstd.so.1.5.4
  /usr/lib/libzstd.so.1.5.2 moved to /usr/lib/libzstd.so.1.5.4
packages/core2-32-poky-linux/zstd/zstd-dbg: FILELIST: removed "/usr/lib/.debug/libzstd.so.1.5.2", added "/usr/lib/.debug/libzstd.so.1.5.4"
packages/core2-32-poky-linux/zstd/zstd-dbg: PKGSIZE changed from 14520484 to 15041084 (+4%)
packages/core2-32-poky-linux/zstd/zstd-dbg: PKGV changed from 1.5.2 [default] to 1.5.4 [default]
packages/core2-32-poky-linux/zstd/zstd-dbg: PV changed from "1.5.2" to "1.5.4"
packages/core2-32-poky-linux/zstd/zstd-dev: PKGSIZE changed from 178541 to 200334 (+12%)
packages/core2-32-poky-linux/zstd/zstd-dev: PKGV changed from 1.5.2 [default] to 1.5.4 [default]
packages/core2-32-poky-linux/zstd/zstd-dev: PV changed from "1.5.2" to "1.5.4"
packages/core2-32-poky-linux/zstd/zstd-doc: PKGSIZE changed from 31045 to 34326 (+11%)
packages/core2-32-poky-linux/zstd/zstd-doc: PKGV changed from 1.5.2 [default] to 1.5.4 [default]
packages/core2-32-poky-linux/zstd/zstd-doc: PV changed from "1.5.2" to "1.5.4"
packages/core2-32-poky-linux/zstd/zstd-locale: PKGV changed from 1.5.2 [default] to 1.5.4 [default]
packages/core2-32-poky-linux/zstd/zstd-locale: PV changed from "1.5.2" to "1.5.4"
packages/core2-32-poky-linux/zstd/zstd-src: FILELIST: directory renamed /usr/src/debug/zstd/1.5.2-r0/lib/decompress -> /usr/src/debug/zstd/1.5.4-r0/lib/decompress, directory renamed /usr/src/debug/zstd/1.5.2-r0/contrib/pzstd -> /usr/src/debug/zstd/1.5.4-r0/contrib/pzstd, directory renamed /usr/src/debug/zstd/1.5.2-r0/lib/compress -> /usr/src/debug/zstd/1.5.4-r0/lib/compress, directory renamed /usr/src/debug/zstd/1.5.2-r0/lib/legacy -> /usr/src/debug/zstd/1.5.4-r0/lib/legacy, directory renamed /usr/src/debug/zstd/1.5.2-r0/contrib/pzstd/utils -> /usr/src/debug/zstd/1.5.4-r0/contrib/pzstd/utils, directory renamed /usr/src/debug/zstd/1.5.2-r0/lib/dictBuilder -> /usr/src/debug/zstd/1.5.4-r0/lib/dictBuilder, directory renamed /usr/src/debug/zstd/1.5.2-r0/lib -> /usr/src/debug/zstd/1.5.4-r0/lib, removed "/usr/src/debug/zstd/1.5.2-r0/programs/timefn.h /usr/src/debug/zstd/1.5.2-r0/lib/common/zstd_trace.h /usr/src/debug/zstd/1.5.2-r0/lib/common/bitstream.h /usr/src/debug/zstd/1.5.2-r0/programs
 /timefn.c /usr/src/debug/zstd/1.5.2-r0/programs/dibio.h /usr/src/debug/zstd/1.5.2-r0/programs/datagen.h /usr/src/debug/zstd/1.5.2-r0/programs/benchfn.c /usr/src/debug/zstd/1.5.2-r0/lib/common/error_private.c /usr/src/debug/zstd/1.5.2-r0/programs/datagen.c /usr/src/debug/zstd/1.5.2-r0/programs/dibio.c /usr/src/debug/zstd/1.5.2-r0/lib/common/error_private.h /usr/src/debug/zstd/1.5.2-r0/programs/benchfn.h /usr/src/debug/zstd/1.5.2-r0/programs/fileio.c /usr/src/debug/zstd/1.5.2-r0/programs/fileio.h /usr/src/debug/zstd/1.5.2-r0/lib/common/pool.h /usr/src/debug/zstd/1.5.2-r0/lib/common/threading.c /usr/src/debug/zstd/1.5.2-r0/lib/common/pool.c /usr/src/debug/zstd/1.5.2-r0/lib/common/huf.h /usr/src/debug/zstd/1.5.2-r0/lib/common/threading.h /usr/src/debug/zstd/1.5.2-r0/lib/common/cpu.h /usr/src/debug/zstd/1.5.2-r0/programs/zstdcli.c /usr/src/debug/zstd/1.5.2-r0/lib/common/zstd_internal.h /usr/src/debug/zstd/1.5.2-r0/programs/util.c /usr/src/debug/zstd/1.5.2-r0/lib/common/entropy_common.c /
 usr/src/debug/zstd/1.5.2-r0/programs/util.h /usr/src/debug/zstd/1.5.2-r0/programs/benchzstd.h /usr/src/debug/zstd/1.5.2-r0/programs/zstdcli_trace.h /usr/src/debug/zstd/1.5.2-r0/programs/benchzstd.c /usr/src/debug/zstd/1.5.2-r0/lib/common/fse.h /usr/src/debug/zstd/1.5.2-r0/programs/zstdcli_trace.c /usr/src/debug/zstd/1.5.2-r0/lib/common/xxhash.h /usr/src/debug/zstd/1.5.2-r0/lib/common/zstd_common.c /usr/src/debug/zstd/1.5.2-r0/lib/common/mem.h /usr/src/debug/zstd/1.5.2-r0/lib/common/debug.c /usr/src/debug/zstd/1.5.2-r0/lib/common/fse_decompress.c", added "/usr/src/debug/zstd/1.5.4-r0/lib/common/huf.h /usr/src/debug/zstd/1.5.4-r0/programs/fileio.c /usr/src/debug/zstd/1.5.4-r0/lib/common/zstd_common.c /usr/src/debug/zstd/1.5.4-r0/programs/fileio.h /usr/src/debug/zstd/1.5.4-r0/lib/common/debug.c /usr/src/debug/zstd/1.5.4-r0/programs/benchzstd.h /usr/src/debug/zstd/1.5.4-r0/programs/zstdcli_trace.c /usr/src/debug/zstd/1.5.4-r0/programs/zstdcli_trace.h /usr/src/debug/zstd/1.5.4-r0/program
 s/benchzstd.c /usr/src/debug/zstd/1.5.4-r0/programs/datagen.h /usr/src/debug/zstd/1.5.4-r0/lib/common/threading.c /usr/src/debug/zstd/1.5.4-r0/programs/dibio.c /usr/src/debug/zstd/1.5.4-r0/lib/common/bitstream.h /usr/src/debug/zstd/1.5.4-r0/programs/datagen.c /usr/src/debug/zstd/1.5.4-r0/programs/dibio.h /usr/src/debug/zstd/1.5.4-r0/lib/common/threading.h /usr/src/debug/zstd/1.5.4-r0/programs/util.c /usr/src/debug/zstd/1.5.4-r0/programs/benchfn.c /usr/src/debug/zstd/1.5.4-r0/programs/fileio_asyncio.c /usr/src/debug/zstd/1.5.4-r0/lib/common/fse_decompress.c /usr/src/debug/zstd/1.5.4-r0/programs/fileio_asyncio.h /usr/src/debug/zstd/1.5.4-r0/lib/common/zstd_trace.h /usr/src/debug/zstd/1.5.4-r0/programs/benchfn.h /usr/src/debug/zstd/1.5.4-r0/lib/common/fse.h /usr/src/debug/zstd/1.5.4-r0/lib/common/error_private.c /usr/src/debug/zstd/1.5.4-r0/lib/common/mem.h /usr/src/debug/zstd/1.5.4-r0/programs/fileio_common.h /usr/src/debug/zstd/1.5.4-r0/lib/common/error_private.h /usr/src/debug/zstd/
 1.5.4-r0/lib/common/bits.h /usr/src/debug/zstd/1.5.4-r0/lib/common/zstd_internal.h /usr/src/debug/zstd/1.5.4-r0/lib/common/entropy_common.c /usr/src/debug/zstd/1.5.4-r0/programs/zstdcli.c /usr/src/debug/zstd/1.5.4-r0/lib/common/cpu.h /usr/src/debug/zstd/1.5.4-r0/lib/common/xxhash.h /usr/src/debug/zstd/1.5.4-r0/programs/timefn.c /usr/src/debug/zstd/1.5.4-r0/programs/util.h /usr/src/debug/zstd/1.5.4-r0/lib/common/pool.h /usr/src/debug/zstd/1.5.4-r0/programs/fileio_types.h /usr/src/debug/zstd/1.5.4-r0/programs/timefn.h /usr/src/debug/zstd/1.5.4-r0/lib/common/pool.c"
packages/core2-32-poky-linux/zstd/zstd-src: PKGSIZE changed from 3035944 to 3141229 (+3%)
packages/core2-32-poky-linux/zstd/zstd-src: PKGV changed from 1.5.2 [default] to 1.5.4 [default]
packages/core2-32-poky-linux/zstd/zstd-src: PV changed from "1.5.2" to "1.5.4"
packages/core2-32-poky-linux/zstd/zstd-staticdev: PKGSIZE changed from 3922390 to 4015874 (+2%)
packages/core2-32-poky-linux/zstd/zstd-staticdev: PKGV changed from 1.5.2 [default] to 1.5.4 [default]
packages/core2-32-poky-linux/zstd/zstd-staticdev: PV changed from "1.5.2" to "1.5.4"
packages/core2-32-poky-linux/zstd/zstd: PKGSIZE changed from 1645751 to 1694746 (+3%)
packages/core2-32-poky-linux/zstd/zstd: PKGV changed from 1.5.2 [default] to 1.5.4 [default]
packages/core2-32-poky-linux/zstd/zstd: PV changed from "1.5.2" to "1.5.4"
Changes to packages/x86_64-linux/zstd-native (sysroot):
  /usr/lib/libzstd.so.1 changed symlink target from libzstd.so.1.5.2 to libzstd.so.1.5.4
  /usr/lib/libzstd.so changed symlink target from libzstd.so.1.5.2 to libzstd.so.1.5.4
  /usr/lib/libzstd.so.1.5.2 moved to /usr/lib/libzstd.so.1.5.4

--===============5344331526821736937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/zstd/libzstd: FILELIST: removed "/usr/lib/libzstd.so.1.5.2", added "/usr/lib/libzstd.so.1.5.4"
Changes to packages/core2-32-poky-linux/zstd (sysroot):
  /usr/lib/libzstd.so.1 changed symlink target from libzstd.so.1.5.2 to libzstd.so.1.5.4
  /usr/lib/libzstd.so changed symlink target from libzstd.so.1.5.2 to libzstd.so.1.5.4
  /usr/lib/libzstd.so.1.5.2 moved to /usr/lib/libzstd.so.1.5.4
packages/core2-32-poky-linux/zstd/zstd-dev: PKGSIZE changed from 178541 to 200334 (+12%)
packages/core2-32-poky-linux/zstd/zstd-doc: PKGSIZE changed from 31045 to 34326 (+11%)
Changes to packages/x86_64-linux/zstd-native (sysroot):
  /usr/lib/libzstd.so.1 changed symlink target from libzstd.so.1.5.2 to libzstd.so.1.5.4
  /usr/lib/libzstd.so changed symlink target from libzstd.so.1.5.2 to libzstd.so.1.5.4
  /usr/lib/libzstd.so.1.5.2 moved to /usr/lib/libzstd.so.1.5.4

--===============5344331526821736937==--

