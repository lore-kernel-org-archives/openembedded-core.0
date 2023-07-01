Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCDBC04FDF
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 16:02:06 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.10780.1688227324633987408
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 09:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RyaIuBDj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101891230a05f-6f900e27-fb7a-4ede-a7c1-f838cfee47bf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1688227324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=W0+0bKhUxtxzuufWXitUlN7ks0BFtZUP4KJjTEZingI=;
	b=RyaIuBDjEagPfFBncXdCT5WbAHCfWSnc6y9tnl+LJCPkYlNo2ze5iyAkILFMyrYp
	7DERbS3qEmhbKL+FPtcTajvBJgD8PdmSJvUyc+HxpEF0LDF8uBhghQ3MXiurYVTBRd+
	xNDEClnly1e3peeJ66j8uqEvOF7jND7cfvlKB1u8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1688227324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=W0+0bKhUxtxzuufWXitUlN7ks0BFtZUP4KJjTEZingI=;
	b=XCN18TOCVtNFzzXEIV6XEbZ2OeuDfF2BJ1HznKLJSvZawYE/Y9IG2TgxxMwoMh31
	rmyANK+g7KkVcYv1b4z2Ek8UoDXjWdnDGQyVMgNMlYIyoo4263HdINNMqmguC7JHXeR
	NivHh0VkOe3Uu9RJD3kLSHCGnQ+e0NI9liq/OM2k=
Content-Type: multipart/mixed; boundary="===============3812966828273182309=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] icu: upgrading to 73-2 FAILED
Message-ID: <010101891230a05f-6f900e27-fb7a-4ede-a7c1-f838cfee47bf-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jul 2023 16:02:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183757

--===============3812966828273182309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
ICppY3UqIHRvICo3My0yKiBoYXMgRmFpbGVkKGRvX2NvbXBpbGUpLgoKRGV0YWlsZWQgZXJyb3Ig
aW5mb3JtYXRpb246Cgpkb19jb21waWxlIGZhaWxlZAoKCgpOZXh0IHN0ZXBzOgogICAgLSBhcHBs
eSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLWljdS11cGdyYWRlLTcyLTEtNzMtMi5wYXRjaAogICAg
LSBjaGVjayB0aGUgY2hhbmdlcyB0byB1cHN0cmVhbSBwYXRjaGVzIGFuZCBzdW1tYXJpemUgdGhl
bSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsCiAgICAtIGNvbXBpbGUgYW4gaW1hZ2UgdGhhdCBjb250
YWlucyB0aGUgcGFja2FnZQogICAgLSBwZXJmb3JtIHNvbWUgYmFzaWMgc2FuaXR5IHRlc3RzCiAg
ICAtIGFtZW5kIHRoZSBwYXRjaCBhbmQgc2lnbiBpdCBvZmY6IGdpdCBjb21taXQgLXMgLS1yZXNl
dC1hdXRob3IgLS1hbWVuZAogICAgLSBzZW5kIGl0IHRvIHRoZSBhcHByb3ByaWF0ZSBtYWlsaW5n
IGxpc3QKCkFsdGVybmF0aXZlbHksIGlmIHlvdSBiZWxpZXZlIHRoZSByZWNpcGUgc2hvdWxkIG5v
dCBiZSB1cGdyYWRlZCBhdCB0aGlzIHRpbWUsCnlvdSBjYW4gZmlsbCBSRUNJUEVfTk9fVVBEQVRF
X1JFQVNPTiBpbiByZXNwZWN0aXZlIHJlY2lwZSBmaWxlIHNvIHRoYXQKYXV0b21hdGljIHVwZ3Jh
ZGVzIHdvdWxkIG5vIGxvbmdlciBiZSBhdHRlbXB0ZWQuCgpQbGVhc2UgcmV2aWV3IHRoZSBhdHRh
Y2hlZCBmaWxlcyBmb3IgZnVydGhlciBpbmZvcm1hdGlvbiBhbmQgYnVpbGQvdXBkYXRlIGZhaWx1
cmVzLgpBbnkgcHJvYmxlbSBwbGVhc2UgZmlsZSBhIGJ1ZyBhdCBodHRwczovL2J1Z3ppbGxhLnlv
Y3RvcHJvamVjdC5vcmcvZW50ZXJfYnVnLmNnaT9wcm9kdWN0PUF1dG9tYXRlZCUyMFVwZGF0ZSUy
MEhhbmRsZXIKClJlZ2FyZHMsClRoZSBVcGdyYWRlIEhlbHBlcgoKLS0gPjggLS0KRnJvbSBhZjk3
MDJiNWQ2NTI4OTQxNDRjNTY1ZDc2NDAzM2NjZWQwYWEyZjYxIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+CkRhdGU6IFNh
dCwgMSBKdWwgMjAyMyAxNToxNDozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGljdTogdXBncmFk
ZSA3Mi0xIC0+IDczLTIKCi0tLQogLi4uL2ljdS97aWN1XzcyLTEuYmIgPT4gaWN1XzczLTIuYmJ9
ICAgICAgICAgIHwgMjYgKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDI0IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQv
aWN1L3tpY3VfNzItMS5iYiA9PiBpY3VfNzMtMi5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1XzcyLTEuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9p
Y3UvaWN1XzczLTIuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvaWN1L2ljdV83Mi0xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9pY3UvaWN1XzczLTIuYmIKaW5kZXggYzJlYWU1Mjk4Zi4uMDhmZmM4ZGNmNyAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdV83Mi0xLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2ljdS9pY3VfNzMtMi5iYgpAQCAtMSwzICsxLDI1IEBACisjIEZJWE1FOiB0aGUg
TElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBn
cmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xk
IGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2
YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1p
dCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5z
ZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgor
IworIyAtLS0gLi4vTElDRU5TRQorIyArKysgLi4vTElDRU5TRQorIyBAQCAtMTMsNyArMTMsNyBA
QAorIyAgCisjICBDT1BZUklHSFQgQU5EIFBFUk1JU1NJT04gTk9USUNFCisjICAKKyMgLUNvcHly
aWdodCDCqSAxOTkxLTIwMjIgVW5pY29kZSwgSW5jLiBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyAr
Q29weXJpZ2h0IMKpIDE5OTEtMjAyMyBVbmljb2RlLCBJbmMuIEFsbCByaWdodHMgcmVzZXJ2ZWQu
CisjICBEaXN0cmlidXRlZCB1bmRlciB0aGUgVGVybXMgb2YgVXNlIGluIGh0dHBzOi8vd3d3LnVu
aWNvZGUub3JnL2NvcHlyaWdodC5odG1sLgorIyAgCisjICBQZXJtaXNzaW9uIGlzIGhlcmVieSBn
cmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcKKyMgCisjCisK
IFNVTU1BUlkgPSAiSW50ZXJuYXRpb25hbCBDb21wb25lbnQgZm9yIFVuaWNvZGUgbGlicmFyaWVz
IgogREVTQ1JJUFRJT04gPSAiVGhlIEludGVybmF0aW9uYWwgQ29tcG9uZW50IGZvciBVbmljb2Rl
IChJQ1UpIGlzIGEgbWF0dXJlLCBcCiBwb3J0YWJsZSBzZXQgb2YgQy9DKysgYW5kIEphdmEgbGli
cmFyaWVzIGZvciBVbmljb2RlIHN1cHBvcnQsIHNvZnR3YXJlIFwKQEAgLTc4LDcgKzEwMCw3IEBA
IEZJTEVTOmxpYmljdWlvID0gIiR7bGliZGlyfS9saWJpY3Vpby5zby4qIgogCiBCQkNMQVNTRVhU
RU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCiAKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovLy4u
L0xJQ0VOU0U7bWQ1PWE4OWQwMzA2MGZmOWM0NjU1MjQzNGRiZDFmZTNlZDFmIgorTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vLi4vTElDRU5TRTttZDU9ODBjMmNmMzlhZDhhZTEyYjliOTQ4MmEx
NzM3YzY2NTAiCiAKIGRlZiBpY3VfZG93bmxvYWRfdmVyc2lvbihkKToKICAgICBwdnNwbGl0ID0g
ZC5nZXRWYXIoJ1BWJykuc3BsaXQoJy0nKQpAQCAtMTExLDcgKzEzMyw3IEBAIFNSQ19VUkkgPSAi
JHtCQVNFX1NSQ19VUkl9O25hbWU9Y29kZSBcCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy10YXJnZXQg
PSAiXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1EaXNhYmxlLUxERkxBR1NJQ1VEVC1mb3ItTGlu
dXgucGF0Y2ggXAogICAgICAgICAgICIKLVNSQ19VUklbY29kZS5zaGEyNTZzdW1dID0gImEyZDJk
MzgyMTcwOTJhN2VkNTY2MzVlMzQ0NjdmOTJmOTc2YjM3MGUyMDE4MmFkMzI1ZWRlYTY2ODFhNzFk
NjgiCitTUkNfVVJJW2NvZGUuc2hhMjU2c3VtXSA9ICI4MThhODA3MTJlZDNjYWFjZDliNjUyMzA1
ZTAxYWZjN2ZhMTY3ZTZmMmU5NDk5NmRhNDRiOTBjMmFiNjA0Y2UxIgogU1JDX1VSSVtkYXRhLnNo
YTI1NnN1bV0gPSAiZWUxOWY4NzY1MDdkNmMyM2Q5ZTBhMmI2MzEwOTZmNmIwZWFhNmZhNjE3Mjhj
MzNhODllZmRiNTVlMzM4NWRlYSIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicmVsZWFzZXMv
dGFnL3JlbGVhc2UtKD9QPHB2ZXI+KD8hLityYykuKykiCi0tIAoyLjM5LjIKCg==

--===============3812966828273182309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1798 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (895 cached, 1 parsed). 1798 targets, 34 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:b91674065d7c8180d476a4dedd1bf3532700fdeb"
workspace            = "master:d221e59a5067266c3f620259a1e56a56823df1fb"

Initialising tasks...done.
Sstate summary: Wanted 39 Local 27 Mirrors 0 Missed 12 Current 167 (69% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 171 of 206 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 178 of 206 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 632 of 789 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_fetch)
NOTE: Running task 645 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-73-2-r0: task do_fetch: Started
NOTE: recipe icu-native-73-2-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 187 of 206 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 192 of 206 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.37-r1: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
WARNING: icu-73-2-r0 do_fetch: Checksum failure encountered with download of https://github.com/unicode-org/icu/releases/download/release-73-2/icu4c-73_2-data.zip;name=data - will attempt other sources if available
NOTE: recipe icu-73-2-r0: task do_fetch: Failed
WARNING: icu-native-73-2-r0 do_fetch: Checksum failure encountered with download of https://github.com/unicode-org/icu/releases/download/release-73-2/icu4c-73_2-data.zip;name=data - will attempt other sources if available
NOTE: recipe icu-native-73-2-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 760 tasks of which 758 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_fetch
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_fetch
Summary: There were 3 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: icu-73-2-r0 do_fetch: Fetcher failure for URL: 'https://github.com/unicode-org/icu/releases/download/release-73-2/icu4c-73_2-data.zip;name=data'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/icu4c-73_2-data.zip.tmp' has sha256 checksum 'ca1ee076163b438461e484421a7679fc33a64cd0a54f9d4b401893fa1eb42701' when 'ee19f876507d6c23d9e0a2b631096f6b0eaa6fa61728c33a89efdb55e3385dea' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[data.sha256sum] = "ca1ee076163b438461e484421a7679fc33a64cd0a54f9d4b401893fa1eb42701"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: icu-73-2-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://github.com/unicode-org/icu/releases/download/release-73-2/icu4c-73_2-data.zip;name=data')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/icu/73-2-r0/temp/log.do_fetch.1090113
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_fetch) failed with exit code '1'
ERROR: icu-native-73-2-r0 do_fetch: Fetcher failure for URL: 'https://github.com/unicode-org/icu/releases/download/release-73-2/icu4c-73_2-data.zip;name=data'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/icu4c-73_2-data.zip.tmp' has sha256 checksum 'ca1ee076163b438461e484421a7679fc33a64cd0a54f9d4b401893fa1eb42701' when 'ee19f876507d6c23d9e0a2b631096f6b0eaa6fa61728c33a89efdb55e3385dea' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[data.sha256sum] = "ca1ee076163b438461e484421a7679fc33a64cd0a54f9d4b401893fa1eb42701"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: icu-native-73-2-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://github.com/unicode-org/icu/releases/download/release-73-2/icu4c-73_2-data.zip;name=data')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/icu-native/73-2-r0/temp/log.do_fetch.1090112
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_fetch) failed with exit code '1'

--===============3812966828273182309==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-icu-upgrade-72-1-73-2.patch"

RnJvbSBhZjk3MDJiNWQ2NTI4OTQxNDRjNTY1ZDc2NDAzM2NjZWQwYWEyZjYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdWwgMjAyMyAxNToxNDozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGlj
dTogdXBncmFkZSA3Mi0xIC0+IDczLTIKCi0tLQogLi4uL2ljdS97aWN1XzcyLTEuYmIgPT4gaWN1
XzczLTIuYmJ9ICAgICAgICAgIHwgMjYgKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5n
ZWQsIDI0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LXN1cHBvcnQvaWN1L3tpY3VfNzItMS5iYiA9PiBpY3VfNzMtMi5iYn0gKDg1JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1XzcyLTEuYmIgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9pY3UvaWN1XzczLTIuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdV83Mi0xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9pY3UvaWN1XzczLTIuYmIKaW5kZXggYzJlYWU1Mjk4Zi4uMDhmZmM4ZGNmNyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdV83Mi0xLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3VfNzMtMi5iYgpAQCAtMSwzICsxLDI1IEBACisjIEZJ
WE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2Rl
dnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2Vl
biB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUg
TElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMg
dGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxl
OiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBj
aGFuZ2VzOgorIworIyAtLS0gLi4vTElDRU5TRQorIyArKysgLi4vTElDRU5TRQorIyBAQCAtMTMs
NyArMTMsNyBAQAorIyAgCisjICBDT1BZUklHSFQgQU5EIFBFUk1JU1NJT04gTk9USUNFCisjICAK
KyMgLUNvcHlyaWdodCDCqSAxOTkxLTIwMjIgVW5pY29kZSwgSW5jLiBBbGwgcmlnaHRzIHJlc2Vy
dmVkLgorIyArQ29weXJpZ2h0IMKpIDE5OTEtMjAyMyBVbmljb2RlLCBJbmMuIEFsbCByaWdodHMg
cmVzZXJ2ZWQuCisjICBEaXN0cmlidXRlZCB1bmRlciB0aGUgVGVybXMgb2YgVXNlIGluIGh0dHBz
Oi8vd3d3LnVuaWNvZGUub3JnL2NvcHlyaWdodC5odG1sLgorIyAgCisjICBQZXJtaXNzaW9uIGlz
IGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcK
KyMgCisjCisKIFNVTU1BUlkgPSAiSW50ZXJuYXRpb25hbCBDb21wb25lbnQgZm9yIFVuaWNvZGUg
bGlicmFyaWVzIgogREVTQ1JJUFRJT04gPSAiVGhlIEludGVybmF0aW9uYWwgQ29tcG9uZW50IGZv
ciBVbmljb2RlIChJQ1UpIGlzIGEgbWF0dXJlLCBcCiBwb3J0YWJsZSBzZXQgb2YgQy9DKysgYW5k
IEphdmEgbGlicmFyaWVzIGZvciBVbmljb2RlIHN1cHBvcnQsIHNvZnR3YXJlIFwKQEAgLTc4LDcg
KzEwMCw3IEBAIEZJTEVTOmxpYmljdWlvID0gIiR7bGliZGlyfS9saWJpY3Vpby5zby4qIgogCiBC
QkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCiAKLUxJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovLy4uL0xJQ0VOU0U7bWQ1PWE4OWQwMzA2MGZmOWM0NjU1MjQzNGRiZDFmZTNlZDFmIgor
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vLi4vTElDRU5TRTttZDU9ODBjMmNmMzlhZDhhZTEy
YjliOTQ4MmExNzM3YzY2NTAiCiAKIGRlZiBpY3VfZG93bmxvYWRfdmVyc2lvbihkKToKICAgICBw
dnNwbGl0ID0gZC5nZXRWYXIoJ1BWJykuc3BsaXQoJy0nKQpAQCAtMTExLDcgKzEzMyw3IEBAIFNS
Q19VUkkgPSAiJHtCQVNFX1NSQ19VUkl9O25hbWU9Y29kZSBcCiBTUkNfVVJJOmFwcGVuZDpjbGFz
cy10YXJnZXQgPSAiXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1EaXNhYmxlLUxERkxBR1NJQ1VE
VC1mb3ItTGludXgucGF0Y2ggXAogICAgICAgICAgICIKLVNSQ19VUklbY29kZS5zaGEyNTZzdW1d
ID0gImEyZDJkMzgyMTcwOTJhN2VkNTY2MzVlMzQ0NjdmOTJmOTc2YjM3MGUyMDE4MmFkMzI1ZWRl
YTY2ODFhNzFkNjgiCitTUkNfVVJJW2NvZGUuc2hhMjU2c3VtXSA9ICI4MThhODA3MTJlZDNjYWFj
ZDliNjUyMzA1ZTAxYWZjN2ZhMTY3ZTZmMmU5NDk5NmRhNDRiOTBjMmFiNjA0Y2UxIgogU1JDX1VS
SVtkYXRhLnNoYTI1NnN1bV0gPSAiZWUxOWY4NzY1MDdkNmMyM2Q5ZTBhMmI2MzEwOTZmNmIwZWFh
NmZhNjE3MjhjMzNhODllZmRiNTVlMzM4NWRlYSIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAi
cmVsZWFzZXMvdGFnL3JlbGVhc2UtKD9QPHB2ZXI+KD8hLityYykuKykiCi0tIAoyLjM5LjIKCg==

--===============3812966828273182309==--

