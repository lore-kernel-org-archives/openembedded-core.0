Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E88C7EE2A
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:29 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.13518.1681581684817597427
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lIwakQNn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010187861435c7-ec8929fe-8bc4-4d42-9e0e-b590f284ba11-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581684;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nVXS/YvOKsk3adGKA1Mw1EWksqEy9ffL+MexodIrtcM=;
	b=lIwakQNnVRTT2jAThQ08sRVRVo+wRExlzrxBP5gMZaycGd7nE+eIOuOBm1Fj21rM
	EMtVwXkcUPh5P4WW27NlbSrvmonCR5sW2LkjFLEALqoN1FzO1nSYyQ3/rB+H3BP3bOE
	o00ES98S/8VrfhBEvS4uZJpOAth/T9ATkNdAesxg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581684;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nVXS/YvOKsk3adGKA1Mw1EWksqEy9ffL+MexodIrtcM=;
	b=NVsru+ySq7kjxOQprPeIgPwWOSGFYU9Q3m5ChOrbL2+ZinWGokhcTHskBMYc1aoh
	3ddKtguMTvLOxZkdi/aVz5L3VR7Z+sWg8k5g3C+U2WFNXo0JKPybIiARZ9FtNGPWP44
	c7FEH+Q1Jl29ZKN1rl1D7xlrVGwnIXsGqGbyaF8Q=
Content-Type: multipart/mixed; boundary="===============2857270770398644401=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Pascal Bach <pascal.bach@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.26.3 FAILED
Message-ID: <01010187861435c7-ec8929fe-8bc4-4d42-9e0e-b590f284ba11-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180031

--===============2857270770398644401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.26.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-upgrade-3.25.2-3.26.3.patch
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
--===============2857270770398644401==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.25.2-3.26.3.patch"

RnJvbSA2MjAyYzVkMmUxNTk0ZTVjM2M3MDRkZTkyMzRkZjA3NGI4Mzg0YzUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMDg6MjA6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
bWFrZTogdXBncmFkZSAzLjI1LjIgLT4gMy4yNi4zCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jbWFrZS9jbWFrZS5pbmMgICAgICAgICB8ICAyICstCiAuLi5zdGVtLXVzZS1vZS1lbnZpcm9u
bWVudC12YXJzLXRvLWxvYWQucGF0Y2ggfCAgNiArKy0tCiAuLi4ve2NtYWtlXzMuMjUuMi5iYiA9
PiBjbWFrZV8zLjI2LjMuYmJ9ICAgICAgfCAzMSArKysrKysrKysrKysrKysrLS0tCiAzIGZpbGVz
IGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFrZV8zLjI1LjIuYmIgPT4gY21ha2VfMy4yNi4zLmJi
fSAoNjQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5p
bmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCmluZGV4IGI3ZTY3NGM0
YzQuLmE2MTM4MzZkNjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9j
bWFrZS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYwpAQCAt
MTksNyArMTksNyBAQCBDTUFLRV9NQUpPUl9WRVJTSU9OID0gIiR7QCcuJy5qb2luKGQuZ2V0VmFy
KCdQVicpLnNwbGl0KCcuJylbMDoyXSl9IgogU1JDX1VSSSA9ICJodHRwczovL2NtYWtlLm9yZy9m
aWxlcy92JHtDTUFLRV9NQUpPUl9WRVJTSU9OfS9jbWFrZS0ke1BWfS50YXIuZ3ogXAogIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYzAyNmYyMmNiOTMxZGQ1MzJmNjQ4ZjA4N2Q1ODdmMDdhMTg0
M2M2ZTY2YTNkZmNhNGZiMGVhMjE5NDRlZDMzYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiYmQ4
ZDM5MjE3NTA5ZDE2M2NiNTQ0YTQwZDY0MjhhYzY2NmRkYzgzZTIyOTA1ZDNlNTJjOTI1NzgxZjBm
NjU5IgogCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJjbWFrZS0oP1A8cHZlcj5cZCsoXC5cZCsp
KylcLnRhciIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtl
LzAwMDEtQ01ha2VEZXRlcm1pbmVTeXN0ZW0tdXNlLW9lLWVudmlyb25tZW50LXZhcnMtdG8tbG9h
ZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLUNNYWtlRGV0
ZXJtaW5lU3lzdGVtLXVzZS1vZS1lbnZpcm9ubWVudC12YXJzLXRvLWxvYWQucGF0Y2gKaW5kZXgg
ZDEzYzM2N2U3OC4uMDM1MmM3MTNiMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL2NtYWtlLzAwMDEtQ01ha2VEZXRlcm1pbmVTeXN0ZW0tdXNlLW9lLWVudmlyb25tZW50
LXZhcnMtdG8tbG9hZC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21h
a2UvMDAwMS1DTWFrZURldGVybWluZVN5c3RlbS11c2Utb2UtZW52aXJvbm1lbnQtdmFycy10by1s
b2FkLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1YWNmY2IyYWJhMWE1NjQxZDM5MDU1OGZk
ZjI4ODM3M2Y1ZTM5Y2I1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3ODg1YTVjZDFj
Y2IwMTlkOTYzNzAyMjM1N2VkYzYwMWYwYTBlMDI2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogQ29keSBQIFNjaGFmZXIgPGRldkBjb2R5cHMuY29tPgogRGF0ZTogVGh1LCAyNyBBcHIg
MjAxNyAxMTozNTowNSAtMDQwMAogU3ViamVjdDogW1BBVENIXSBDTWFrZURldGVybWluZVN5c3Rl
bTogdXNlIG9lIGVudmlyb25tZW50IHZhcnMgdG8gbG9hZCBkZWZhdWx0CkBAIC0yNSwxMCArMjUs
MTAgQEAgU2lnbmVkLW9mZi1ieTogT3RhdmlvIFNhbHZhZG9yIDxvdGF2aW9Ab3NzeXN0ZW1zLmNv
bS5icj4KICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9N
b2R1bGVzL0NNYWtlRGV0ZXJtaW5lU3lzdGVtLmNtYWtlIGIvTW9kdWxlcy9DTWFrZURldGVybWlu
ZVN5c3RlbS5jbWFrZQotaW5kZXggMmMyYzJhYzMuLmZhZTRmOTdmIDEwMDY0NAoraW5kZXggZDRk
Y2M2MmYuLmIyYTkyOGNhIDEwMDY0NAogLS0tIGEvTW9kdWxlcy9DTWFrZURldGVybWluZVN5c3Rl
bS5jbWFrZQogKysrIGIvTW9kdWxlcy9DTWFrZURldGVybWluZVN5c3RlbS5jbWFrZQotQEAgLTEx
Miw2ICsxMTIsMTMgQEAgZWxzZSgpCitAQCAtMTM2LDYgKzEzNiwxMyBAQCBlbHNlKCkKICAgIGVu
ZGlmKCkKICBlbmRpZigpCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21h
a2UvY21ha2VfMy4yNS4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzMu
MjYuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDY0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvY21ha2UvY21ha2VfMy4yNS4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvY21ha2UvY21ha2VfMy4yNi4zLmJiCmluZGV4IGJiN2VkODNlMzAuLmUxNzBlZTQ0Y2EgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZV8zLjI1LjIuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzMuMjYuMy5iYgpAQCAtMSw3ICsx
LDMzIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVw
ZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZl
cmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNl
IHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNo
YW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcu
CisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicp
CisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ29weXJpZ2h0LnR4dAorIyArKysgQ29weXJp
Z2h0LnR4dAorIyBAQCAtMSw1ICsxLDUgQEAKKyMgIENNYWtlIC0gQ3Jvc3MgUGxhdGZvcm0gTWFr
ZWZpbGUgR2VuZXJhdG9yCisjIC1Db3B5cmlnaHQgMjAwMC0yMDIyIEtpdHdhcmUsIEluYy4gYW5k
IENvbnRyaWJ1dG9ycworIyArQ29weXJpZ2h0IDIwMDAtMjAyMyBLaXR3YXJlLCBJbmMuIGFuZCBD
b250cmlidXRvcnMKKyMgIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisjICAKKyMgIFJlZGlzdHJpYnV0
aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dAor
IyAKKyMKKwogcmVxdWlyZSBjbWFrZS5pbmMKIAogaW5oZXJpdCBjbWFrZSBiYXNoLWNvbXBsZXRp
b24KIAorTElDX0ZJTEVTX0NIS1NVTSArPSAiZmlsZTovL0NvcHlyaWdodC50eHQ7bWQ1PTlkM2Qx
MmM1ZjNiNGMxZjgzNjUwYWRjYzY1YjU5YzA2IFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTov
L1NvdXJjZS9jbWFrZS5oO2JlZ2lubGluZT0xO2VuZGxpbmU9MjttZDU9YTVmNzBlMWZlZjg2MTQ3
MzRlYWUwZDYyYjRmNTg5MWIgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vVXRpbGl0aWVz
L2NtanNvbmNwcC9MSUNFTlNFO21kNT01ZDczYzE2NWEwZjllODZhMTM0MmYzMmQxOWVjNTkyNiBc
CisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9VdGlsaXRpZXMvY21saWJyaGFzaC9DT1BZSU5H
O21kNT1hOGMyYTU1N2E1YzUzYjFjMTJjZGRiZWU5OGMwOTlhZiBcCisgICAgICAgICAgICAgICAg
ICAgIGZpbGU6Ly9VdGlsaXRpZXMvY21saWJ1di9MSUNFTlNFO21kNT1hZDkzY2ExZmZmZTkzMTUz
N2ZjZjY0ZjZmY2NlMDg0ZCBcCisgICAgICAgICAgICAgICAgICAgICIKIERFUEVORFMgKz0gImN1
cmwgZXhwYXQgemxpYiBsaWJhcmNoaXZlIHh6IG5jdXJzZXMgYnppcDIiCiAKIFNSQ19VUkk6YXBw
ZW5kOmNsYXNzLW5hdGl2ZXNkayA9ICIgXApAQCAtMTMsMTEgKzM5LDYgQEAgU1JDX1VSSTphcHBl
bmQ6Y2xhc3MtbmF0aXZlc2RrID0gIiBcCiAiCiAKIExJQ0VOU0U6YXBwZW5kID0gIiAmIEJTRC0x
LUNsYXVzZSAmIE1JVCIKLUxJQ19GSUxFU19DSEtTVU06YXBwZW5kID0gIiBcCi0gICAgZmlsZTov
L1V0aWxpdGllcy9jbWpzb25jcHAvTElDRU5TRTttZDU9NWQ3M2MxNjVhMGY5ZTg2YTEzNDJmMzJk
MTllYzU5MjYgXAotICAgIGZpbGU6Ly9VdGlsaXRpZXMvY21saWJyaGFzaC9DT1BZSU5HO21kNT1h
OGMyYTU1N2E1YzUzYjFjMTJjZGRiZWU5OGMwOTlhZiBcCi0gICAgZmlsZTovL1V0aWxpdGllcy9j
bWxpYnV2L0xJQ0VOU0U7bWQ1PWFkOTNjYTFmZmZlOTMxNTM3ZmNmNjRmNmZjY2UwODRkIFwKLSIK
IAogIyBTdHJpcCAke3ByZWZpeH0gZnJvbSAke2RvY2Rpcn0sIHNldCByZXN1bHQgaW50byBkb2Nk
aXJfc3RyaXBwZWQKIHB5dGhvbiAoKSB7Ci0tIAoyLjM5LjIKCg==

--===============2857270770398644401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1798 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (897 cached, 2 parsed). 1798 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a00dc9748135e47d10bfc020338cb5910bf2a3fb"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 59 Local 47 Mirrors 0 Missed 12 Current 169 (79% match, 94% complete)
Removing 2 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch core2-32...done.
Removing 1 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 189 of 228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 680 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.25.2.bb:do_fetch)
NOTE: Running task 774 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.26.3.bb:do_fetch)
NOTE: recipe cmake-native-3.25.2-r0: task do_fetch: Started
WARNING: cmake-native-3.25.2-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.25.2.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.25.2-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.25.2.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.25.2.tar.gz_bad-checksum_c026f22cb931dd532f648f087d587f07a1843c6e66a3dfca4fb0ea21944ed33c
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-3.26.3-r0: task do_fetch: Started
NOTE: recipe cmake-3.26.3-r0: task do_fetch: Succeeded
NOTE: Running task 848 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.26.3.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 849 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: recipe cmake-3.26.3-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 850 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 851 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: Running task 852 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe cmake-3.26.3-r0: task do_unpack: Succeeded
NOTE: Running task 854 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.26.3.bb:do_patch)
NOTE: recipe cmake-3.26.3-r0: task do_patch: Started
NOTE: recipe cmake-3.26.3-r0: task do_patch: Succeeded
NOTE: Running task 855 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.26.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 856 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.26.3.bb:do_generate_toolchain_file)
NOTE: Running task 857 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.26.3.bb:do_populate_lic)
WARNING: cmake-native-3.25.2-r0 do_fetch: Checksum failure encountered with download of https://cmake.org/files/v3.25/cmake-3.25.2.tar.gz - will attempt other sources if available
NOTE: recipe cmake-3.26.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cmake-3.26.3-r0: task do_populate_lic: Started
NOTE: recipe cmake-3.26.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe cmake-3.26.3-r0: task do_populate_lic: Failed
NOTE: recipe cmake-3.26.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe cmake-3.26.3-r0: task do_deploy_source_date_epoch: Succeeded
WARNING: cmake-native-3.25.2-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.25.2.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.25.2-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.25.2.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.25.2.tar.gz_bad-checksum_c026f22cb931dd532f648f087d587f07a1843c6e66a3dfca4fb0ea21944ed33c
NOTE: recipe cmake-native-3.25.2-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 857 tasks of which 846 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.26.3.bb:do_populate_lic
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.25.2.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: cmake-3.26.3-r0 do_populate_lic: QA Issue: cmake: The LIC_FILES_CHKSUM does not match for file://Copyright.txt;md5=09069e0fffe4e5eaf6dde04c3b1932e5
cmake: The new md5 checksum is 9d3d12c5f3b4c1f83650adcc65b59c06
cmake: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
CMake - Cross Platform Makefile Generator
Copyright 2000-2023 Kitware, Inc. and Contributors
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

* Redistributions of source code must retain the above copyright
  notice, this list of conditions and the following disclaimer.
...
   as part of the Insight Segmentation and Registration Toolkit (ITK).

 * US National Labs (Los Alamos, Livermore, Sandia) ASC Parallel
   Visualization Initiative.

 * National Alliance for Medical Image Computing (NAMIC) is funded by the
   National Institutes of Health through the NIH Roadmap for Medical Research,
   Grant U54 EB005149.

 * Kitware, Inc.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
cmake: Check if the license information has changed in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cmake/3.26.3-r0/cmake-3.26.3/Copyright.txt to verify that the LICENSE value "BSD-3-Clause & BSD-1-Clause & MIT" remains valid [license-checksum]
ERROR: cmake-3.26.3-r0 do_populate_lic: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cmake/3.26.3-r0/temp/log.do_populate_lic.2599870
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.26.3.bb:do_populate_lic) failed with exit code '1'
ERROR: cmake-native-3.25.2-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.25/cmake-3.25.2.tar.gz
ERROR: cmake-native-3.25.2-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.25.2.tar.gz\' has sha256 checksum \'c026f22cb931dd532f648f087d587f07a1843c6e66a3dfca4fb0ea21944ed33c\' when \'bbd8d39217509d163cb544a40d6428ac666ddc83e22905d3e52c925781f0f659\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "c026f22cb931dd532f648f087d587f07a1843c6e66a3dfca4fb0ea21944ed33c"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cmake.org/files/v3.25/cmake-3.25.2.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/cmake-native/3.25.2-r0/temp/log.do_fetch.2599728
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.25.2.bb:do_fetch) failed with exit code '1'

--===============2857270770398644401==--

