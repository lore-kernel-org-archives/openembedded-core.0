Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E378C2FC20
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:30 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.801.1686887482325149953
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bijzH6G1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188c2544f36-fdf2ef2e-b688-46c1-9352-cdbb263ae934-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SJ1YkjjAM1nPmX3n5msn9a2nw2qrPTCWSrl8mHiHx3M=;
	b=bijzH6G1RW8NVEGv6Fw/4/wITg8P3hbZXNf1Pf0zONF2y3mQGgDZCIY7XCKaBPk0
	apPE+9uWRh17KlnnX8PCi3PLqZEpACIcoPm3Xx5MLYpD5GMxZgHmlhgI/N5636EkC8s
	LXlVyYHbto7hXzLiV15Hb9QLOFLa8KBEvanRw9sw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SJ1YkjjAM1nPmX3n5msn9a2nw2qrPTCWSrl8mHiHx3M=;
	b=Tok9ZTyiKh7ASzUpA2YcWj02/AF3MsX1jcJOOXpOpcxq0BpDlM2B3l+uwJEryGOp
	OCC2bkXwRqBxvOdb3OOvmhVyYJS9DFyuMGabeE+cfQBconib/ciw66qrVdbDHXo+Id3
	ekTljO0wpU0UbG8q8hYzO3PitCW5BWc22Sg/L8b0=
Content-Type: multipart/mixed; boundary="===============4665278355935263106=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] icu: upgrading to 73-2 FAILED
Message-ID: <01010188c2544f36-fdf2ef2e-b688-46c1-9352-cdbb263ae934-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182985

--===============4665278355935263106==
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
MEhhbmRsZXIKClJlZ2FyZHMsClRoZSBVcGdyYWRlIEhlbHBlcgoKLS0gPjggLS0KRnJvbSAwZjhk
MzIzODdmYzg2NTNmNzQ0NjlkZmZlMDUxMmQwMDkzMjI4ODk0IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+CkRhdGU6IFRo
dSwgMTUgSnVuIDIwMjMgMjM6NTA6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBpY3U6IHVwZ3Jh
ZGUgNzItMSAtPiA3My0yCgotLS0KIC4uLi9pY3Uve2ljdV83Mi0xLmJiID0+IGljdV83My0yLmJi
fSAgICAgICAgICB8IDI2ICsrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNCBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L2ljdS97aWN1XzcyLTEuYmIgPT4gaWN1XzczLTIuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdV83Mi0xLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
aWN1L2ljdV83My0yLmJiCnNpbWlsYXJpdHkgaW5kZXggODUlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2ljdS9pY3VfNzItMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBv
cnQvaWN1L2ljdV83My0yLmJiCmluZGV4IGMyZWFlNTI5OGYuLjA4ZmZjOGRjZjcgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3VfNzItMS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9pY3UvaWN1XzczLTIuYmIKQEAgLTEsMyArMSwyNSBAQAorIyBGSVhNRTogdGhl
IExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVw
Z3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9s
ZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0Ug
dmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21t
aXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vu
c2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoK
KyMKKyMgLS0tIC4uL0xJQ0VOU0UKKyMgKysrIC4uL0xJQ0VOU0UKKyMgQEAgLTEzLDcgKzEzLDcg
QEAKKyMgIAorIyAgQ09QWVJJR0hUIEFORCBQRVJNSVNTSU9OIE5PVElDRQorIyAgCisjIC1Db3B5
cmlnaHQgwqkgMTk5MS0yMDIyIFVuaWNvZGUsIEluYy4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMg
K0NvcHlyaWdodCDCqSAxOTkxLTIwMjMgVW5pY29kZSwgSW5jLiBBbGwgcmlnaHRzIHJlc2VydmVk
LgorIyAgRGlzdHJpYnV0ZWQgdW5kZXIgdGhlIFRlcm1zIG9mIFVzZSBpbiBodHRwczovL3d3dy51
bmljb2RlLm9yZy9jb3B5cmlnaHQuaHRtbC4KKyMgIAorIyAgUGVybWlzc2lvbiBpcyBoZXJlYnkg
Z3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nCisjIAorIwor
CiBTVU1NQVJZID0gIkludGVybmF0aW9uYWwgQ29tcG9uZW50IGZvciBVbmljb2RlIGxpYnJhcmll
cyIKIERFU0NSSVBUSU9OID0gIlRoZSBJbnRlcm5hdGlvbmFsIENvbXBvbmVudCBmb3IgVW5pY29k
ZSAoSUNVKSBpcyBhIG1hdHVyZSwgXAogcG9ydGFibGUgc2V0IG9mIEMvQysrIGFuZCBKYXZhIGxp
YnJhcmllcyBmb3IgVW5pY29kZSBzdXBwb3J0LCBzb2Z0d2FyZSBcCkBAIC03OCw3ICsxMDAsNyBA
QCBGSUxFUzpsaWJpY3VpbyA9ICIke2xpYmRpcn0vbGliaWN1aW8uc28uKiIKIAogQkJDTEFTU0VY
VEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgogCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly8u
Li9MSUNFTlNFO21kNT1hODlkMDMwNjBmZjljNDY1NTI0MzRkYmQxZmUzZWQxZiIKK0xJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovLy4uL0xJQ0VOU0U7bWQ1PTgwYzJjZjM5YWQ4YWUxMmI5Yjk0ODJh
MTczN2M2NjUwIgogCiBkZWYgaWN1X2Rvd25sb2FkX3ZlcnNpb24oZCk6CiAgICAgcHZzcGxpdCA9
IGQuZ2V0VmFyKCdQVicpLnNwbGl0KCctJykKQEAgLTExMSw3ICsxMzMsNyBAQCBTUkNfVVJJID0g
IiR7QkFTRV9TUkNfVVJJfTtuYW1lPWNvZGUgXAogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtdGFyZ2V0
ID0gIlwKICAgICAgICAgICAgZmlsZTovLzAwMDEtRGlzYWJsZS1MREZMQUdTSUNVRFQtZm9yLUxp
bnV4LnBhdGNoIFwKICAgICAgICAgICAiCi1TUkNfVVJJW2NvZGUuc2hhMjU2c3VtXSA9ICJhMmQy
ZDM4MjE3MDkyYTdlZDU2NjM1ZTM0NDY3ZjkyZjk3NmIzNzBlMjAxODJhZDMyNWVkZWE2NjgxYTcx
ZDY4IgorU1JDX1VSSVtjb2RlLnNoYTI1NnN1bV0gPSAiODE4YTgwNzEyZWQzY2FhY2Q5YjY1MjMw
NWUwMWFmYzdmYTE2N2U2ZjJlOTQ5OTZkYTQ0YjkwYzJhYjYwNGNlMSIKIFNSQ19VUklbZGF0YS5z
aGEyNTZzdW1dID0gImVlMTlmODc2NTA3ZDZjMjNkOWUwYTJiNjMxMDk2ZjZiMGVhYTZmYTYxNzI4
YzMzYTg5ZWZkYjU1ZTMzODVkZWEiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2Vz
L3RhZy9yZWxlYXNlLSg/UDxwdmVyPig/IS4rcmMpLispIgotLSAKMi4zOS4yCgo=

--===============4665278355935263106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:2555b09d389f27775c78d78fb6c655411eb097d5"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 42 Local 30 Mirrors 0 Missed 12 Current 164 (71% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 168 of 206 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 175 of 206 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 568 of 789 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_fetch)
NOTE: Running task 581 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-73-2-r0: task do_fetch: Started
NOTE: recipe icu-native-73-2-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 184 of 206 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 189 of 206 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.37-r1: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 196 of 206 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 198 of 206 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
WARNING: icu-73-2-r0 do_fetch: Checksum failure encountered with download of https://github.com/unicode-org/icu/releases/download/release-73-2/icu4c-73_2-data.zip;name=data - will attempt other sources if available
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_fetch: Failed
WARNING: icu-native-73-2-r0 do_fetch: Checksum failure encountered with download of https://github.com/unicode-org/icu/releases/download/release-73-2/icu4c-73_2-data.zip;name=data - will attempt other sources if available
NOTE: recipe icu-native-73-2-r0: task do_fetch: Failed
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Tasks Summary: Attempted 701 tasks of which 699 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/icu/73-2-r0/temp/log.do_fetch.1244215
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_fetch) failed with exit code '1'
ERROR: icu-native-73-2-r0 do_fetch: Fetcher failure for URL: 'https://github.com/unicode-org/icu/releases/download/release-73-2/icu4c-73_2-data.zip;name=data'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/icu4c-73_2-data.zip.tmp' has sha256 checksum 'ca1ee076163b438461e484421a7679fc33a64cd0a54f9d4b401893fa1eb42701' when 'ee19f876507d6c23d9e0a2b631096f6b0eaa6fa61728c33a89efdb55e3385dea' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[data.sha256sum] = "ca1ee076163b438461e484421a7679fc33a64cd0a54f9d4b401893fa1eb42701"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: icu-native-73-2-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://github.com/unicode-org/icu/releases/download/release-73-2/icu4c-73_2-data.zip;name=data')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/icu-native/73-2-r0/temp/log.do_fetch.1244213
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_fetch) failed with exit code '1'

--===============4665278355935263106==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-icu-upgrade-72-1-73-2.patch"

RnJvbSAwZjhkMzIzODdmYzg2NTNmNzQ0NjlkZmZlMDUxMmQwMDkzMjI4ODk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMjM6NTA6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
Y3U6IHVwZ3JhZGUgNzItMSAtPiA3My0yCgotLS0KIC4uLi9pY3Uve2ljdV83Mi0xLmJiID0+IGlj
dV83My0yLmJifSAgICAgICAgICB8IDI2ICsrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2ljdS97aWN1XzcyLTEuYmIgPT4gaWN1XzczLTIuYmJ9ICg4NSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdV83Mi0xLmJiIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvaWN1L2ljdV83My0yLmJiCnNpbWlsYXJpdHkgaW5kZXggODUlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3VfNzItMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvaWN1L2ljdV83My0yLmJiCmluZGV4IGMyZWFlNTI5OGYuLjA4ZmZjOGRjZjcg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3VfNzItMS5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1XzczLTIuYmIKQEAgLTEsMyArMSwyNSBAQAorIyBG
SVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdk
ZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdl
ZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhl
IExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisj
IHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBs
ZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUg
Y2hhbmdlczoKKyMKKyMgLS0tIC4uL0xJQ0VOU0UKKyMgKysrIC4uL0xJQ0VOU0UKKyMgQEAgLTEz
LDcgKzEzLDcgQEAKKyMgIAorIyAgQ09QWVJJR0hUIEFORCBQRVJNSVNTSU9OIE5PVElDRQorIyAg
CisjIC1Db3B5cmlnaHQgwqkgMTk5MS0yMDIyIFVuaWNvZGUsIEluYy4gQWxsIHJpZ2h0cyByZXNl
cnZlZC4KKyMgK0NvcHlyaWdodCDCqSAxOTkxLTIwMjMgVW5pY29kZSwgSW5jLiBBbGwgcmlnaHRz
IHJlc2VydmVkLgorIyAgRGlzdHJpYnV0ZWQgdW5kZXIgdGhlIFRlcm1zIG9mIFVzZSBpbiBodHRw
czovL3d3dy51bmljb2RlLm9yZy9jb3B5cmlnaHQuaHRtbC4KKyMgIAorIyAgUGVybWlzc2lvbiBp
cyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5n
CisjIAorIworCiBTVU1NQVJZID0gIkludGVybmF0aW9uYWwgQ29tcG9uZW50IGZvciBVbmljb2Rl
IGxpYnJhcmllcyIKIERFU0NSSVBUSU9OID0gIlRoZSBJbnRlcm5hdGlvbmFsIENvbXBvbmVudCBm
b3IgVW5pY29kZSAoSUNVKSBpcyBhIG1hdHVyZSwgXAogcG9ydGFibGUgc2V0IG9mIEMvQysrIGFu
ZCBKYXZhIGxpYnJhcmllcyBmb3IgVW5pY29kZSBzdXBwb3J0LCBzb2Z0d2FyZSBcCkBAIC03OCw3
ICsxMDAsNyBAQCBGSUxFUzpsaWJpY3VpbyA9ICIke2xpYmRpcn0vbGliaWN1aW8uc28uKiIKIAog
QkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgogCi1MSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly8uLi9MSUNFTlNFO21kNT1hODlkMDMwNjBmZjljNDY1NTI0MzRkYmQxZmUzZWQxZiIK
K0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovLy4uL0xJQ0VOU0U7bWQ1PTgwYzJjZjM5YWQ4YWUx
MmI5Yjk0ODJhMTczN2M2NjUwIgogCiBkZWYgaWN1X2Rvd25sb2FkX3ZlcnNpb24oZCk6CiAgICAg
cHZzcGxpdCA9IGQuZ2V0VmFyKCdQVicpLnNwbGl0KCctJykKQEAgLTExMSw3ICsxMzMsNyBAQCBT
UkNfVVJJID0gIiR7QkFTRV9TUkNfVVJJfTtuYW1lPWNvZGUgXAogU1JDX1VSSTphcHBlbmQ6Y2xh
c3MtdGFyZ2V0ID0gIlwKICAgICAgICAgICAgZmlsZTovLzAwMDEtRGlzYWJsZS1MREZMQUdTSUNV
RFQtZm9yLUxpbnV4LnBhdGNoIFwKICAgICAgICAgICAiCi1TUkNfVVJJW2NvZGUuc2hhMjU2c3Vt
XSA9ICJhMmQyZDM4MjE3MDkyYTdlZDU2NjM1ZTM0NDY3ZjkyZjk3NmIzNzBlMjAxODJhZDMyNWVk
ZWE2NjgxYTcxZDY4IgorU1JDX1VSSVtjb2RlLnNoYTI1NnN1bV0gPSAiODE4YTgwNzEyZWQzY2Fh
Y2Q5YjY1MjMwNWUwMWFmYzdmYTE2N2U2ZjJlOTQ5OTZkYTQ0YjkwYzJhYjYwNGNlMSIKIFNSQ19V
UklbZGF0YS5zaGEyNTZzdW1dID0gImVlMTlmODc2NTA3ZDZjMjNkOWUwYTJiNjMxMDk2ZjZiMGVh
YTZmYTYxNzI4YzMzYTg5ZWZkYjU1ZTMzODVkZWEiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0g
InJlbGVhc2VzL3RhZy9yZWxlYXNlLSg/UDxwdmVyPig/IS4rcmMpLispIgotLSAKMi4zOS4yCgo=

--===============4665278355935263106==--

