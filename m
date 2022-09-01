Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8B5C6FA84
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:55 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.12568.1662040786313161843
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QVIzenAS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010182f959c9db-007615c8-d175-450d-83e0-de8f70cfd358-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=C+xXOxeQgQ58izUYo2M37StxGOYWLiXfyecN60ZkCiM=;
	b=QVIzenASBwC3zyaZDEHydYXADKahYx9x/mpFCm3vA3idDPW9sbPdNZMstAN/wg/S
	dg6atGXktZsZwbNMBuTo35is2NWHNV3nwcZ/XKOpd+eIF591psarEyMBhRnlmAXkxfX
	3wy2s0prPV6+9EDqZ0Y9e0sdqRuGtwUBUkvlbhWo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=C+xXOxeQgQ58izUYo2M37StxGOYWLiXfyecN60ZkCiM=;
	b=AfnPqFKYxqKDdqd5C7/sVMmIzHlp0yKc9oiIPjry9T2ApIIuw4O6jNXC/ejUeaiE
	0oYm1qhH8IDPBmOyN7lvDKhkU4KaSAY/s2po+IeeOaKHb1mJlOA066pAvwygdfyQWn5
	lYK1m5NkeQXx9KKgZnp5hzIbi/oaIT1D/ucjPe3M=
Content-Type: multipart/mixed; boundary="===============0218214734493759215=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lz4: upgrading to 1.9.4 SUCCEEDED
Message-ID: 
 <01010182f959c9db-007615c8-d175-450d-83e0-de8f70cfd358-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170210

--===============0218214734493759215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lz4* to *1.9.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lz4-upgrade-1.9.3-1.9.4.patch
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
--===============0218214734493759215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lz4: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/core2-32-poky-linux/lz4: PV changed from "1.9.3" to "1.9.4"
packages/core2-32-poky-linux/lz4: SRC_URI changed from "git://github.com/lz4/lz4.git;branch=release;protocol=https file://CVE-2021-3520.patch" to "git://github.com/lz4/lz4.git;branch=release;protocol=https"
packages/core2-32-poky-linux/lz4/lz4-dbg: FILELIST: removed "/usr/lib/.debug/liblz4.so.1.9.3", added "/usr/lib/.debug/liblz4.so.1.9.4"
packages/core2-32-poky-linux/lz4/lz4-dbg: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/core2-32-poky-linux/lz4/lz4-dbg: PV changed from "1.9.3" to "1.9.4"
packages/core2-32-poky-linux/lz4/lz4-dbg: PKGSIZE changed from 1865220 to 1949408 (+5%)
packages/core2-32-poky-linux/lz4/lz4-dev: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/core2-32-poky-linux/lz4/lz4-dev: PV changed from "1.9.3" to "1.9.4"
packages/core2-32-poky-linux/lz4/lz4-dev: PKGSIZE changed from 90317 to 96595 (+7%)
packages/core2-32-poky-linux/lz4/lz4-doc: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/core2-32-poky-linux/lz4/lz4-doc: PV changed from "1.9.3" to "1.9.4"
packages/core2-32-poky-linux/lz4/lz4-doc: PKGSIZE changed from 9092 to 9277 (+2%)
packages/core2-32-poky-linux/lz4/lz4-locale: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/core2-32-poky-linux/lz4/lz4-locale: PV changed from "1.9.3" to "1.9.4"
packages/core2-32-poky-linux/lz4/lz4-src: FILELIST: directory renamed /usr/src/debug/lz4/1_1.9.3-r0/programs -> /usr/src/debug/lz4/1_1.9.4-r0/programs, removed "/usr/src/debug/lz4/1_1.9.3-r0/lib/lz4frame.h /usr/src/debug/lz4/1_1.9.3-r0/lib/lz4.c /usr/src/debug/lz4/1_1.9.3-r0/lib/lz4hc.c /usr/src/debug/lz4/1_1.9.3-r0/lib/lz4hc.h /usr/src/debug/lz4/1_1.9.3-r0/lib/lz4frame.c /usr/src/debug/lz4/1_1.9.3-r0/lib/xxhash.h /usr/src/debug/lz4/1_1.9.3-r0/lib/lz4.h /usr/src/debug/lz4/1_1.9.3-r0/lib/xxhash.c", added "/usr/src/debug/lz4/1_1.9.4-r0/lib/lz4.h /usr/src/debug/lz4/1_1.9.4-r0/lib/xxhash.h /usr/src/debug/lz4/1_1.9.4-r0/lib/lz4.c /usr/src/debug/lz4/1_1.9.4-r0/lib/lz4file.c /usr/src/debug/lz4/1_1.9.4-r0/lib/lz4hc.h /usr/src/debug/lz4/1_1.9.4-r0/lib/lz4hc.c /usr/src/debug/lz4/1_1.9.4-r0/lib/lz4frame.h /usr/src/debug/lz4/1_1.9.4-r0/lib/xxhash.c /usr/src/debug/lz4/1_1.9.4-r0/lib/lz4frame.c /usr/src/debug/lz4/1_1.9.4-r0/lib/lz4file.h"
packages/core2-32-poky-linux/lz4/lz4-src: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/core2-32-poky-linux/lz4/lz4-src: PV changed from "1.9.3" to "1.9.4"
packages/core2-32-poky-linux/lz4/lz4-src: PKGSIZE changed from 555348 to 601695 (+8%)
packages/core2-32-poky-linux/lz4/lz4-staticdev: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/core2-32-poky-linux/lz4/lz4-staticdev: PV changed from "1.9.3" to "1.9.4"
packages/core2-32-poky-linux/lz4/lz4: FILELIST: removed "/usr/lib/liblz4.so.1.9.3", added "/usr/lib/liblz4.so.1.9.4"
packages/core2-32-poky-linux/lz4/lz4: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/core2-32-poky-linux/lz4/lz4: PV changed from "1.9.3" to "1.9.4"
packages/core2-32-poky-linux/lz4/lz4: PKGSIZE changed from 355100 to 383772 (+8%)
Changes to packages/core2-32-poky-linux/lz4 (sysroot):
  /usr/lib/liblz4.so.1 changed symlink target from liblz4.so.1.9.3 to liblz4.so.1.9.4
  /usr/lib/liblz4.so changed symlink target from liblz4.so.1.9.3 to liblz4.so.1.9.4
  /usr/lib/liblz4.so.1.9.3 moved to /usr/lib/liblz4.so.1.9.4

--===============0218214734493759215==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-lz4-upgrade-1.9.3-1.9.4.patch"

RnJvbSA4NjM5ZWZhNDZkNTMxNDBmMzBjZjQ5MTFjYzc3OWZiNGFhMjBiOGM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAxMzo1MDoyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGx6
NDogdXBncmFkZSAxLjkuMyAtPiAxLjkuNAoKLS0tCiAuLi4vbHo0L2ZpbGVzL0NWRS0yMDIxLTM1
MjAucGF0Y2ggICAgICAgICAgICAgfCAyNyAtLS0tLS0tLS0tLS0tCiAuLi4vbHo0L3tsejRfMS45
LjMuYmIgPT4gbHo0XzEuOS40LmJifSAgICAgICAgfCAzOSArKysrKysrKysrKysrKysrLS0tCiAy
IGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQogZGVsZXRl
IG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2x6NC9maWxlcy9DVkUtMjAyMS0zNTIw
LnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbHo0L3tsejRfMS45LjMuYmIgPT4g
bHo0XzEuOS40LmJifSAoNDMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2x6
NC9maWxlcy9DVkUtMjAyMS0zNTIwLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbHo0L2Zp
bGVzL0NWRS0yMDIxLTM1MjAucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDVh
YzhmNjY5MWYuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbHo0L2ZpbGVz
L0NWRS0yMDIxLTM1MjAucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwyNyArMCwwIEBACi1Gcm9t
IDgzMDFhMjE3NzNlZjYxNjU2MjI1ZTI2NGY0ZjA2YWUxNDQ2MmJjYTcgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCi1Gcm9tOiBKYXNwZXIgTGlldmlzc2UgQWRyaWFhbnNlIDxqQGphc3Blci5sYT4K
LURhdGU6IEZyaSwgMjYgRmViIDIwMjEgMTU6MjE6MjAgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSF0g
Rml4IHBvdGVudGlhbCBtZW1vcnkgY29ycnVwdGlvbiB3aXRoIG5lZ2F0aXZlIG1lbW1vdmUoKSBz
aXplCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQKLWh0dHBzOi8vZ2l0aHViLmNvbS9sejQv
bHo0L2NvbW1pdC84MzAxYTIxNzczZWY2MTY1NjIyNWUyNjRmNGYwNmFlMTQ0NjJiY2E3I2RpZmYt
NzA1NWU5Y2YxNGM0ODhhZWE5ODM3YWFmOWY1MjhiNThlZTNjMjI5ODhkN2QwZDgxZDE3MmVjNjJk
OTRhODhhNwotQ1ZFOiBDVkUtMjAyMS0zNTIwCi1TaWduZWQtb2ZmLWJ5OiBBcm1pbiBLdXN0ZXIg
PGFrdXN0ZXJAbXZpc3RhLmNvbT4KLQotLS0tCi0gbGliL2x6NC5jIHwgMiArLQotIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQotCi1JbmRleDogZ2l0L2xpYi9s
ejQuYwotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQotLS0tIGdpdC5vcmlnL2xpYi9sejQuYwotKysrIGdpdC9saWIvbHo0
LmMKLUBAIC0xNjY1LDcgKzE2NjUsNyBAQCBMWjRfZGVjb21wcmVzc19nZW5lcmljKAotICAgICAg
ICAgICAgICAgICAgY29uc3Qgc2l6ZV90IGRpY3RTaXplICAgICAgICAgLyogbm90ZSA6ID0gMCBp
ZiBub0RpY3QgKi8KLSAgICAgICAgICAgICAgICAgICkKLSB7Ci0tICAgIGlmIChzcmMgPT0gTlVM
TCkgeyByZXR1cm4gLTE7IH0KLSsgICAgaWYgKChzcmMgPT0gTlVMTCkgfHwgKG91dHB1dFNpemUg
PCAwKSkgeyByZXR1cm4gLTE7IH0KLSAKLSAgICAgeyAgIGNvbnN0IEJZVEUqIGlwID0gKGNvbnN0
IEJZVEUqKSBzcmM7Ci0gICAgICAgICBjb25zdCBCWVRFKiBjb25zdCBpZW5kID0gaXAgKyBzcmNT
aXplOwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbHo0L2x6NF8xLjkuMy5iYiBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2x6NC9sejRfMS45LjQuYmIKc2ltaWxhcml0eSBpbmRleCA0
MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbHo0L2x6NF8xLjkuMy5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbHo0L2x6NF8xLjkuNC5iYgppbmRleCAxMjlhODZi
NjgxLi5kNjc0NjFlYjg5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9sejQvbHo0
XzEuOS4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2x6NC9sejRfMS45LjQuYmIKQEAg
LTEsMjAgKzEsNDcgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZl
IGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0
aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0Lgor
IyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6
ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0
ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVw
ZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBsaWIvTElDRU5TRQorIyArKysg
bGliL0xJQ0VOU0UKKyMgQEAgLTEsNSArMSw1IEBACisjICBMWjQgTGlicmFyeQorIyAtQ29weXJp
Z2h0IChjKSAyMDExLTIwMTYsIFlhbm4gQ29sbGV0CisjICtDb3B5cmlnaHQgKGMpIDIwMTEtMjAy
MCwgWWFubiBDb2xsZXQKKyMgIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisjICAKKyMgIFJlZGlzdHJp
YnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91
dCBtb2RpZmljYXRpb24sCisjIC0tLSBMSUNFTlNFCisjICsrKyBMSUNFTlNFCisjIEBAIC04LDQg
KzgsNSBAQAorIyAgVGhpcyBtb2RlbCBpcyBzZWxlY3RlZCB0byBlbXBoYXNpemUgdGhhdAorIyAg
ZmlsZXMgaW4gdGhlIGBsaWJgIGRpcmVjdG9yeSBhcmUgZGVzaWduZWQgdG8gYmUgaW5jbHVkZWQg
aW50byAzcmQgcGFydHkgYXBwbGljYXRpb25zLAorIyAgd2hpbGUgYWxsIG90aGVyIGZpbGVzLCBp
biBgcHJvZ3JhbXNgLCBgdGVzdHNgIG9yIGBleGFtcGxlc2AsCisjIC1yZWNlaXZlIG1vcmUgbGlt
aXRlZCBhdHRlbnRpb24gYW5kIHN1cHBvcnQgZm9yIHN1Y2ggc2NlbmFyaW8uCisjICthcmUgaW50
ZW5kZWQgdG8gYmUgdXNlZCAiYXMgaXMiLCBhcyBwYXJ0IG9mIHRoZWlyIGludGVuZGVkIHNjZW5h
cmlvcywKKyMgK3dpdGggbm8gaW50ZW50aW9uIHRvIHN1cHBvcnQgM3JkIHBhcnR5IGludGVncmF0
aW9uIHVzZSBjYXNlcy4KKyMgCisjCisKIFNVTU1BUlkgPSAiRXh0cmVtZWx5IEZhc3QgQ29tcHJl
c3Npb24gYWxnb3JpdGhtIgogREVTQ1JJUFRJT04gPSAiTFo0IGlzIGEgdmVyeSBmYXN0IGxvc3Ns
ZXNzIGNvbXByZXNzaW9uIGFsZ29yaXRobSwgcHJvdmlkaW5nIGNvbXByZXNzaW9uIHNwZWVkIGF0
IDQwMCBNQi9zIHBlciBjb3JlLCBzY2FsYWJsZSB3aXRoIG11bHRpLWNvcmVzIENQVS4gSXQgYWxz
byBmZWF0dXJlcyBhbiBleHRyZW1lbHkgZmFzdCBkZWNvZGVyLCB3aXRoIHNwZWVkIGluIG11bHRp
cGxlIEdCL3MgcGVyIGNvcmUsIHR5cGljYWxseSByZWFjaGluZyBSQU0gc3BlZWQgbGltaXRzIG9u
IG11bHRpLWNvcmUgc3lzdGVtcy4iCiBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vbHo0
L2x6NCIKIAogTElDRU5TRSA9ICJCU0QtMi1DbGF1c2UgfCBHUEwtMi4wLW9ubHkiCi1MSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9saWIvTElDRU5TRTttZDU9ZWJjMmVhNDgxNGE2NGRlNzcwOGYx
NTcxOTA0YjMyY2MgXAorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vbGliL0xJQ0VOU0U7bWQ1
PTVjZDVmODUxYjUyZWM4MzJiMTBlZWRiM2YwMWY4ODVhIFwKICAgICAgICAgICAgICAgICAgICAg
ZmlsZTovL3Byb2dyYW1zL0NPUFlJTkc7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0
MjYzIFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0U7bWQ1PWQ1N2MwZDIxY2I5
MTdmYjRlMGFmMjQ1NGFhNDhiOTU2IFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VO
U0U7bWQ1PWM1Y2MzY2Q2ZjkyNzRiNGQzMjk4ODA5NmRmOWMzZWMzIFwKICAgICAgICAgICAgICAg
ICAgICAgIgogCiBQRSA9ICIxIgogCi1TUkNSRVYgPSAiZDQ0MzcxODQxYTJmMTcyOGEzZjM2ODM5
ZmQ0YjdlODcyZDA5MjdkMyIKK1NSQ1JFViA9ICI1ZmY4Mzk2ODAxMzQ0MzdkYmY0Njc4ZjNkMGM3
YjM3MWQ4NGY0OTY0IgogCi1TUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbHo0L2x6NC5naXQ7
YnJhbmNoPXJlbGVhc2U7cHJvdG9jb2w9aHR0cHMgXAotICAgICAgICAgICBmaWxlOi8vQ1ZFLTIw
MjEtMzUyMC5wYXRjaCBcCi0gICAgICAgICAgICIKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNv
bS9sejQvbHo0LmdpdDticmFuY2g9cmVsZWFzZTtwcm90b2NvbD1odHRwcyIKIFVQU1RSRUFNX0NI
RUNLX0dJVFRBR1JFR0VYID0gInYoP1A8cHZlcj4uKikiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQi
Ci0tIAoyLjMxLjEKCg==

--===============0218214734493759215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/lz4/lz4: FILELIST: removed "/usr/lib/liblz4.so.1.9.3", added "/usr/lib/liblz4.so.1.9.4"
Changes to packages/core2-32-poky-linux/lz4 (sysroot):
  /usr/lib/liblz4.so.1 changed symlink target from liblz4.so.1.9.3 to liblz4.so.1.9.4
  /usr/lib/liblz4.so changed symlink target from liblz4.so.1.9.3 to liblz4.so.1.9.4
  /usr/lib/liblz4.so.1.9.3 moved to /usr/lib/liblz4.so.1.9.4

--===============0218214734493759215==--

