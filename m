Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB84C87FE1
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:51 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.107416.1682976348797068934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PKmp3Z7L;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010187d9351a71-2b23e407-d293-408b-8030-54bb308f008c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jQ83oNggRKFCu7cL9+hQ+eAcyFLK0dL58u5UoSAJs8g=;
	b=PKmp3Z7LJRQC083N7eAM9m37YxrW1wUz9rkoOIriKYu7E8PVcrVSfA0lAYD4/HxC
	oSYPkFyYSNNZsEju8uAZ+s+diseey2nqUX+f5CEaCIY1PA2d79W9VEODqAfSuPCFfHN
	Zuq9xMVgsQZVvMZR0aXi6mBJjiz6E0ODcga9n5iU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jQ83oNggRKFCu7cL9+hQ+eAcyFLK0dL58u5UoSAJs8g=;
	b=lWIrZDSRxHNCofZDg0ZBDeHBdxN+Wf1CRFtiIvwwWpluV9LSsgUohrULZl0Fu/D1
	raUB/24fOLZW6+/lLZZ/aiKgFhEmFXARBilrrbBtFVPBTlWTmXRFz/ddUUbvL12LuIK
	uObXSrNv+BMMU+znr1JRPmm+jzMIjXo7+N8el3JI=
Content-Type: multipart/mixed; boundary="===============8856530541991539947=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Pascal Bach <pascal.bach@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.26.3 FAILED
Message-ID: <01010187d9351a71-2b23e407-d293-408b-8030-54bb308f008c-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180595

--===============8856530541991539947==
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
--===============8856530541991539947==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.25.2-3.26.3.patch"

RnJvbSBhMDEwN2UyMTZlMDBjYWZhMTZhNWY5YzdhMTc1ZWExYjY0OGEwM2E3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAwODoxMjo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlOiB1cGdyYWRlIDMuMjUuMiAtPiAzLjI2LjMKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL2NtYWtlLmluYyAgICAgICAgIHwgIDIgKy0KIC4uLnN0ZW0tdXNlLW9lLWVudmlyb25t
ZW50LXZhcnMtdG8tbG9hZC5wYXRjaCB8ICA2ICsrLS0KIC4uLi97Y21ha2VfMy4yNS4yLmJiID0+
IGNtYWtlXzMuMjYuMy5iYn0gICAgICB8IDMxICsrKysrKysrKysrKysrKystLS0KIDMgZmlsZXMg
Y2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlXzMuMjUuMi5iYiA9PiBjbWFrZV8zLjI2LjMuYmJ9
ICg2NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmlu
YyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKaW5kZXggYjdlNjc0YzRj
NC4uYTYxMzgzNmQ2MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2Nt
YWtlLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCkBAIC0x
OSw3ICsxOSw3IEBAIENNQUtFX01BSk9SX1ZFUlNJT04gPSAiJHtAJy4nLmpvaW4oZC5nZXRWYXIo
J1BWJykuc3BsaXQoJy4nKVswOjJdKX0iCiBTUkNfVVJJID0gImh0dHBzOi8vY21ha2Uub3JnL2Zp
bGVzL3Yke0NNQUtFX01BSk9SX1ZFUlNJT059L2NtYWtlLSR7UFZ9LnRhci5neiBcCiAiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJjMDI2ZjIyY2I5MzFkZDUzMmY2NDhmMDg3ZDU4N2YwN2ExODQz
YzZlNjZhM2RmY2E0ZmIwZWEyMTk0NGVkMzNjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImJiZDhk
MzkyMTc1MDlkMTYzY2I1NDRhNDBkNjQyOGFjNjY2ZGRjODNlMjI5MDVkM2U1MmM5MjU3ODFmMGY2
NTkiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImNtYWtlLSg/UDxwdmVyPlxkKyhcLlxkKykr
KVwudGFyIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2Uv
MDAwMS1DTWFrZURldGVybWluZVN5c3RlbS11c2Utb2UtZW52aXJvbm1lbnQtdmFycy10by1sb2Fk
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtQ01ha2VEZXRl
cm1pbmVTeXN0ZW0tdXNlLW9lLWVudmlyb25tZW50LXZhcnMtdG8tbG9hZC5wYXRjaAppbmRleCBk
MTNjMzY3ZTc4Li4zNDA2Nzk1MDQ5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Y21ha2UvY21ha2UvMDAwMS1DTWFrZURldGVybWluZVN5c3RlbS11c2Utb2UtZW52aXJvbm1lbnQt
dmFycy10by1sb2FkLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFr
ZS8wMDAxLUNNYWtlRGV0ZXJtaW5lU3lzdGVtLXVzZS1vZS1lbnZpcm9ubWVudC12YXJzLXRvLWxv
YWQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVhY2ZjYjJhYmExYTU2NDFkMzkwNTU4ZmRm
Mjg4MzczZjVlMzljYjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGYzNDBhN2ViYTA2
ZDFiNWEwNTFkZWQxZmRkYzdkZmVjZjQzMmNkMzYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBDb2R5IFAgU2NoYWZlciA8ZGV2QGNvZHlwcy5jb20+CiBEYXRlOiBUaHUsIDI3IEFwciAy
MDE3IDExOjM1OjA1IC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIENNYWtlRGV0ZXJtaW5lU3lzdGVt
OiB1c2Ugb2UgZW52aXJvbm1lbnQgdmFycyB0byBsb2FkIGRlZmF1bHQKQEAgLTI1LDEwICsyNSwx
MCBAQCBTaWduZWQtb2ZmLWJ5OiBPdGF2aW8gU2FsdmFkb3IgPG90YXZpb0Bvc3N5c3RlbXMuY29t
LmJyPgogIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL01v
ZHVsZXMvQ01ha2VEZXRlcm1pbmVTeXN0ZW0uY21ha2UgYi9Nb2R1bGVzL0NNYWtlRGV0ZXJtaW5l
U3lzdGVtLmNtYWtlCi1pbmRleCAyYzJjMmFjMy4uZmFlNGY5N2YgMTAwNjQ0CitpbmRleCBkNGRj
YzYyZi4uYjJhOTI4Y2EgMTAwNjQ0CiAtLS0gYS9Nb2R1bGVzL0NNYWtlRGV0ZXJtaW5lU3lzdGVt
LmNtYWtlCiArKysgYi9Nb2R1bGVzL0NNYWtlRGV0ZXJtaW5lU3lzdGVtLmNtYWtlCi1AQCAtMTEy
LDYgKzExMiwxMyBAQCBlbHNlKCkKK0BAIC0xMzYsNiArMTM2LDEzIEBAIGVsc2UoKQogICAgZW5k
aWYoKQogIGVuZGlmKCkKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFr
ZS9jbWFrZV8zLjI1LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfMy4y
Ni4zLmJiCnNpbWlsYXJpdHkgaW5kZXggNjQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9jbWFrZS9jbWFrZV8zLjI1LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jbWFrZS9jbWFrZV8zLjI2LjMuYmIKaW5kZXggYmI3ZWQ4M2UzMC4uZTE3MGVlNDRjYSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzMuMjUuMi5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfMy4yNi4zLmJiCkBAIC0xLDcgKzEs
MzMgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBk
YXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVy
ZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2Ug
dXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hh
bmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4K
KyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykK
KyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBDb3B5cmlnaHQudHh0CisjICsrKyBDb3B5cmln
aHQudHh0CisjIEBAIC0xLDUgKzEsNSBAQAorIyAgQ01ha2UgLSBDcm9zcyBQbGF0Zm9ybSBNYWtl
ZmlsZSBHZW5lcmF0b3IKKyMgLUNvcHlyaWdodCAyMDAwLTIwMjIgS2l0d2FyZSwgSW5jLiBhbmQg
Q29udHJpYnV0b3JzCisjICtDb3B5cmlnaHQgMjAwMC0yMDIzIEtpdHdhcmUsIEluYy4gYW5kIENv
bnRyaWJ1dG9ycworIyAgQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgIAorIyAgUmVkaXN0cmlidXRp
b24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0Cisj
IAorIworCiByZXF1aXJlIGNtYWtlLmluYwogCiBpbmhlcml0IGNtYWtlIGJhc2gtY29tcGxldGlv
bgogCitMSUNfRklMRVNfQ0hLU1VNICs9ICJmaWxlOi8vQ29weXJpZ2h0LnR4dDttZDU9OWQzZDEy
YzVmM2I0YzFmODM2NTBhZGNjNjViNTljMDYgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
U291cmNlL2NtYWtlLmg7YmVnaW5saW5lPTE7ZW5kbGluZT0yO21kNT1hNWY3MGUxZmVmODYxNDcz
NGVhZTBkNjJiNGY1ODkxYiBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9VdGlsaXRpZXMv
Y21qc29uY3BwL0xJQ0VOU0U7bWQ1PTVkNzNjMTY1YTBmOWU4NmExMzQyZjMyZDE5ZWM1OTI2IFwK
KyAgICAgICAgICAgICAgICAgICAgZmlsZTovL1V0aWxpdGllcy9jbWxpYnJoYXNoL0NPUFlJTkc7
bWQ1PWE4YzJhNTU3YTVjNTNiMWMxMmNkZGJlZTk4YzA5OWFmIFwKKyAgICAgICAgICAgICAgICAg
ICAgZmlsZTovL1V0aWxpdGllcy9jbWxpYnV2L0xJQ0VOU0U7bWQ1PWFkOTNjYTFmZmZlOTMxNTM3
ZmNmNjRmNmZjY2UwODRkIFwKKyAgICAgICAgICAgICAgICAgICAgIgogREVQRU5EUyArPSAiY3Vy
bCBleHBhdCB6bGliIGxpYmFyY2hpdmUgeHogbmN1cnNlcyBiemlwMiIKIAogU1JDX1VSSTphcHBl
bmQ6Y2xhc3MtbmF0aXZlc2RrID0gIiBcCkBAIC0xMywxMSArMzksNiBAQCBTUkNfVVJJOmFwcGVu
ZDpjbGFzcy1uYXRpdmVzZGsgPSAiIFwKICIKIAogTElDRU5TRTphcHBlbmQgPSAiICYgQlNELTEt
Q2xhdXNlICYgTUlUIgotTElDX0ZJTEVTX0NIS1NVTTphcHBlbmQgPSAiIFwKLSAgICBmaWxlOi8v
VXRpbGl0aWVzL2NtanNvbmNwcC9MSUNFTlNFO21kNT01ZDczYzE2NWEwZjllODZhMTM0MmYzMmQx
OWVjNTkyNiBcCi0gICAgZmlsZTovL1V0aWxpdGllcy9jbWxpYnJoYXNoL0NPUFlJTkc7bWQ1PWE4
YzJhNTU3YTVjNTNiMWMxMmNkZGJlZTk4YzA5OWFmIFwKLSAgICBmaWxlOi8vVXRpbGl0aWVzL2Nt
bGlidXYvTElDRU5TRTttZDU9YWQ5M2NhMWZmZmU5MzE1MzdmY2Y2NGY2ZmNjZTA4NGQgXAotIgog
CiAjIFN0cmlwICR7cHJlZml4fSBmcm9tICR7ZG9jZGlyfSwgc2V0IHJlc3VsdCBpbnRvIGRvY2Rp
cl9zdHJpcHBlZAogcHl0aG9uICgpIHsKLS0gCjIuMzkuMgoK

--===============8856530541991539947==
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
meta-yocto-bsp       = "tmp-auh-upgrades:07fd493ed806833359268c6cac4fcf64e730f8cb"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 58 Local 46 Mirrors 0 Missed 12 Current 170 (79% match, 94% complete)
Removing 1 stale sstate objects for arch qemux86...done.
Removing 2 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch core2-32...done.
NOTE: Executing Tasks
NOTE: Running setscene task 190 of 228 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
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
WARNING: cmake-native-3.25.2-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.25.2.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.25.2-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.25.2.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.25.2.tar.gz_bad-checksum_c026f22cb931dd532f648f087d587f07a1843c6e66a3dfca4fb0ea21944ed33c
NOTE: recipe cmake-native-3.25.2-r0: task do_fetch: Failed
NOTE: recipe cmake-3.26.3-r0: task do_deploy_source_date_epoch: Succeeded
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cmake/3.26.3-r0/temp/log.do_populate_lic.3007814
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.26.3.bb:do_populate_lic) failed with exit code '1'
ERROR: cmake-native-3.25.2-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.25/cmake-3.25.2.tar.gz
ERROR: cmake-native-3.25.2-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.25.2.tar.gz\' has sha256 checksum \'c026f22cb931dd532f648f087d587f07a1843c6e66a3dfca4fb0ea21944ed33c\' when \'bbd8d39217509d163cb544a40d6428ac666ddc83e22905d3e52c925781f0f659\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "c026f22cb931dd532f648f087d587f07a1843c6e66a3dfca4fb0ea21944ed33c"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cmake.org/files/v3.25/cmake-3.25.2.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/cmake-native/3.25.2-r0/temp/log.do_fetch.3007672
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.25.2.bb:do_fetch) failed with exit code '1'

--===============8856530541991539947==--

