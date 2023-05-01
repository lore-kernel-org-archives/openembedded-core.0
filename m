Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B0DC7EE33
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:03 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.107415.1682976348196991899
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gYMZaIh0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010187d9352f29-93546878-942f-4f2c-977c-1f66e65c8987-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KmVzDWnBvFuUqwYE1XPOmxTORCbCYX1XRM3zd/1ilng=;
	b=gYMZaIh0Zihdr42CA8Uh2uWgsrLmwqlrKMVoYj8nwtd5jtBugYOLOE4Y20zRkp1D
	nrQEgouxejew1ilI4tZRJat8dwAU6juS2xAy9mEa991m8wE5X6X5QnxX4+HTsurJZyH
	cucOQOwUCCH4HcLhvCcMapO4ajQnZXl5ym7u4bBc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KmVzDWnBvFuUqwYE1XPOmxTORCbCYX1XRM3zd/1ilng=;
	b=HEwiw49Zv0bFlcNi49vLHiaB6FX9db6RJsKM2ELM5XywAK87CizaLMLg4uvrRNsb
	jgvt9VPNHL5pdoWbxgZ3a+75C3X2QHrGKIx6oSqB/CqM9TzH+pEFarZIjh17m7ZDUz+
	s56xJtQFKxzx121F41o3w+r+yh60VIef/YoOBHr4=
Content-Type: multipart/mixed; boundary="===============5607068008311528529=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] icu: upgrading to 73-1 FAILED
Message-ID: <01010187d9352f29-93546878-942f-4f2c-977c-1f66e65c8987-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180698

--===============5607068008311528529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *icu* to *73-1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-icu-upgrade-72-1-73-1.patch
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
--===============5607068008311528529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1798 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1798 targets, 40 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:78b0986a99be9cc72deee61c497da0f1326fbf06"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 21 Mirrors 0 Missed 9 Current 134 (70% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 153 of 164 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 553 of 678 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-1.bb:do_fetch)
NOTE: Running task 587 of 678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-1.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-73-1-r0: task do_fetch: Started
NOTE: recipe icu-native-73-1-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 161 of 164 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
WARNING: icu-73-1-r0 do_fetch: Checksum failure encountered with download of https://github.com/unicode-org/icu/releases/download/release-73-1/icu4c-73_1-data.zip;name=data - will attempt other sources if available
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe icu-73-1-r0: task do_fetch: Failed
WARNING: icu-native-73-1-r0 do_fetch: Checksum failure encountered with download of https://github.com/unicode-org/icu/releases/download/release-73-1/icu4c-73_1-data.zip;name=data - will attempt other sources if available
NOTE: recipe icu-native-73-1-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 654 tasks of which 652 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-1.bb:do_fetch
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-1.bb:do_fetch
Summary: There were 2 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: icu-73-1-r0 do_fetch: Fetcher failure for URL: 'https://github.com/unicode-org/icu/releases/download/release-73-1/icu4c-73_1-data.zip;name=data'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/icu4c-73_1-data.zip.tmp' has sha256 checksum '07d7557efb30fc2e9b74652f1525603b3209a4539d2d345d704e3df3bf9b957e' when 'ee19f876507d6c23d9e0a2b631096f6b0eaa6fa61728c33a89efdb55e3385dea' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[data.sha256sum] = "07d7557efb30fc2e9b74652f1525603b3209a4539d2d345d704e3df3bf9b957e"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: icu-73-1-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://github.com/unicode-org/icu/releases/download/release-73-1/icu4c-73_1-data.zip;name=data')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/icu/73-1-r0/temp/log.do_fetch.1222486
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-1.bb:do_fetch) failed with exit code '1'
ERROR: icu-native-73-1-r0 do_fetch: Fetcher failure for URL: 'https://github.com/unicode-org/icu/releases/download/release-73-1/icu4c-73_1-data.zip;name=data'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/icu4c-73_1-data.zip.tmp' has sha256 checksum '07d7557efb30fc2e9b74652f1525603b3209a4539d2d345d704e3df3bf9b957e' when 'ee19f876507d6c23d9e0a2b631096f6b0eaa6fa61728c33a89efdb55e3385dea' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[data.sha256sum] = "07d7557efb30fc2e9b74652f1525603b3209a4539d2d345d704e3df3bf9b957e"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: icu-native-73-1-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://github.com/unicode-org/icu/releases/download/release-73-1/icu4c-73_1-data.zip;name=data')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/icu-native/73-1-r0/temp/log.do_fetch.1222485
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-1.bb:do_fetch) failed with exit code '1'

--===============5607068008311528529==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-icu-upgrade-72-1-73-1.patch"

RnJvbSA1NDgxNzBiNTM0YjcwYWVmYzMwNzFlZDBmYjAyZjgwM2ZlODcxMGFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAyMTowOTowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGlj
dTogdXBncmFkZSA3Mi0xIC0+IDczLTEKCi0tLQogLi4uL2ljdS97aWN1XzcyLTEuYmIgPT4gaWN1
XzczLTEuYmJ9ICAgICAgICAgIHwgMjYgKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5n
ZWQsIDI0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LXN1cHBvcnQvaWN1L3tpY3VfNzItMS5iYiA9PiBpY3VfNzMtMS5iYn0gKDg1JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1XzcyLTEuYmIgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9pY3UvaWN1XzczLTEuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdV83Mi0xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9pY3UvaWN1XzczLTEuYmIKaW5kZXggMmIyMGJkZDdiMi4uYWE4MjAwNTY4YSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdV83Mi0xLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3VfNzMtMS5iYgpAQCAtMSwzICsxLDI1IEBACisjIEZJ
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
IEphdmEgbGlicmFyaWVzIGZvciBVbmljb2RlIHN1cHBvcnQsIHNvZnR3YXJlIFwKQEAgLTc5LDcg
KzEwMSw3IEBAIEZJTEVTOmxpYmljdWlvID0gIiR7bGliZGlyfS9saWJpY3Vpby5zby4qIgogCiBC
QkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCiAKLUxJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovLy4uL0xJQ0VOU0U7bWQ1PWE4OWQwMzA2MGZmOWM0NjU1MjQzNGRiZDFmZTNlZDFmIgor
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vLi4vTElDRU5TRTttZDU9ODBjMmNmMzlhZDhhZTEy
YjliOTQ4MmExNzM3YzY2NTAiCiAKIGRlZiBpY3VfZG93bmxvYWRfdmVyc2lvbihkKToKICAgICBw
dnNwbGl0ID0gZC5nZXRWYXIoJ1BWJykuc3BsaXQoJy0nKQpAQCAtMTEyLDcgKzEzNCw3IEBAIFNS
Q19VUkkgPSAiJHtCQVNFX1NSQ19VUkl9O25hbWU9Y29kZSBcCiBTUkNfVVJJOmFwcGVuZDpjbGFz
cy10YXJnZXQgPSAiXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1EaXNhYmxlLUxERkxBR1NJQ1VE
VC1mb3ItTGludXgucGF0Y2ggXAogICAgICAgICAgICIKLVNSQ19VUklbY29kZS5zaGEyNTZzdW1d
ID0gImEyZDJkMzgyMTcwOTJhN2VkNTY2MzVlMzQ0NjdmOTJmOTc2YjM3MGUyMDE4MmFkMzI1ZWRl
YTY2ODFhNzFkNjgiCitTUkNfVVJJW2NvZGUuc2hhMjU2c3VtXSA9ICJhNDU3NDMxZGUxNjRiNGFh
N2VjYTAwZWQxMzRkMDBkZmJmODhhNzdjNjk4NmExMGFlNzc3NGZjMDc2YmI4YzQ1IgogU1JDX1VS
SVtkYXRhLnNoYTI1NnN1bV0gPSAiZWUxOWY4NzY1MDdkNmMyM2Q5ZTBhMmI2MzEwOTZmNmIwZWFh
NmZhNjE3MjhjMzNhODllZmRiNTVlMzM4NWRlYSIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAi
cmVsZWFzZXMvdGFnL3JlbGVhc2UtKD9QPHB2ZXI+KD8hLityYykuKykiCi0tIAoyLjM5LjIKCg==

--===============5607068008311528529==--

