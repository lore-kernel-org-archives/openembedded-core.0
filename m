Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF03C77B7D
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:28 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.13796.1681581683817668563
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WnsUGa+8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101878614414c-eafc9922-5c8d-429b-8bf7-6fc4a1cac7d8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vudqTwIKCn2IocsEysr+1UjFvJW3TETxX75ov6742hE=;
	b=WnsUGa+8DoyAeH6JGA6pMTzdSx5i9ZMu3XdA7CsMAhLNZl8pLrEsdKDJODj4g2Sg
	je+oSMqWeHo7lpixC5+6kV1q8kqVVWcYp2ds1indQ1+w+p4Yo2K+D56qoQSWx1wUs7M
	u8qknMhP2EzX0mLyoy4/RM9SnrKVsv/aN//Edg/I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vudqTwIKCn2IocsEysr+1UjFvJW3TETxX75ov6742hE=;
	b=WurwMYP1SikHNmLi4KAXQUjyXNZgKQCPztbfK/za3YB+c7xZKUO22GwHNk4UbqZJ
	lKkVEl8kSDm7ZDz2lFHXlYE957CCvMCRpHg0IhpEuq9mhS12pxxEEbaFwh4vhwFd87U
	Mt1l3gnW8ngHtH8rFZjRbLJZxT+688eSoF32i51k=
Content-Type: multipart/mixed; boundary="===============2729421606029120323=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] icu: upgrading to 73-1 FAILED
Message-ID: <010101878614414c-eafc9922-5c8d-429b-8bf7-6fc4a1cac7d8-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180105

--===============2729421606029120323==
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
--===============2729421606029120323==
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
meta-yocto-bsp       = "tmp-auh-upgrades:6b68b13c82ba66ff75242f4c7157aa8ff1690772"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 27 Local 18 Mirrors 0 Missed 9 Current 137 (66% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 158 of 164 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 586 of 678 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-1.bb:do_fetch)
NOTE: Running task 621 of 678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-1.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-73-1-r0: task do_fetch: Started
NOTE: recipe icu-native-73-1-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
WARNING: icu-73-1-r0 do_fetch: Checksum failure encountered with download of https://github.com/unicode-org/icu/releases/download/release-73-1/icu4c-73_1-data.zip;name=data - will attempt other sources if available
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/icu/73-1-r0/temp/log.do_fetch.3661008
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-1.bb:do_fetch) failed with exit code '1'
ERROR: icu-native-73-1-r0 do_fetch: Fetcher failure for URL: 'https://github.com/unicode-org/icu/releases/download/release-73-1/icu4c-73_1-data.zip;name=data'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/icu4c-73_1-data.zip.tmp' has sha256 checksum '07d7557efb30fc2e9b74652f1525603b3209a4539d2d345d704e3df3bf9b957e' when 'ee19f876507d6c23d9e0a2b631096f6b0eaa6fa61728c33a89efdb55e3385dea' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[data.sha256sum] = "07d7557efb30fc2e9b74652f1525603b3209a4539d2d345d704e3df3bf9b957e"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: icu-native-73-1-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://github.com/unicode-org/icu/releases/download/release-73-1/icu4c-73_1-data.zip;name=data')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/icu-native/73-1-r0/temp/log.do_fetch.3661007
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-1.bb:do_fetch) failed with exit code '1'

--===============2729421606029120323==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-icu-upgrade-72-1-73-1.patch"

RnJvbSBjODM0OTE4ZDMyMjQ4NGQ3ZjVlYjIxNzQzNzdmOGU5M2NmYWE1MjA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTc6NTM6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
Y3U6IHVwZ3JhZGUgNzItMSAtPiA3My0xCgotLS0KIC4uLi9pY3Uve2ljdV83Mi0xLmJiID0+IGlj
dV83My0xLmJifSAgICAgICAgICB8IDI2ICsrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2ljdS97aWN1XzcyLTEuYmIgPT4gaWN1XzczLTEuYmJ9ICg4NSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdV83Mi0xLmJiIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvaWN1L2ljdV83My0xLmJiCnNpbWlsYXJpdHkgaW5kZXggODUlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3VfNzItMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvaWN1L2ljdV83My0xLmJiCmluZGV4IDJiMjBiZGQ3YjIuLmFhODIwMDU2OGEg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3VfNzItMS5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1XzczLTEuYmIKQEAgLTEsMyArMSwyNSBAQAorIyBG
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
ZCBKYXZhIGxpYnJhcmllcyBmb3IgVW5pY29kZSBzdXBwb3J0LCBzb2Z0d2FyZSBcCkBAIC03OSw3
ICsxMDEsNyBAQCBGSUxFUzpsaWJpY3VpbyA9ICIke2xpYmRpcn0vbGliaWN1aW8uc28uKiIKIAog
QkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgogCi1MSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly8uLi9MSUNFTlNFO21kNT1hODlkMDMwNjBmZjljNDY1NTI0MzRkYmQxZmUzZWQxZiIK
K0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovLy4uL0xJQ0VOU0U7bWQ1PTgwYzJjZjM5YWQ4YWUx
MmI5Yjk0ODJhMTczN2M2NjUwIgogCiBkZWYgaWN1X2Rvd25sb2FkX3ZlcnNpb24oZCk6CiAgICAg
cHZzcGxpdCA9IGQuZ2V0VmFyKCdQVicpLnNwbGl0KCctJykKQEAgLTExMiw3ICsxMzQsNyBAQCBT
UkNfVVJJID0gIiR7QkFTRV9TUkNfVVJJfTtuYW1lPWNvZGUgXAogU1JDX1VSSTphcHBlbmQ6Y2xh
c3MtdGFyZ2V0ID0gIlwKICAgICAgICAgICAgZmlsZTovLzAwMDEtRGlzYWJsZS1MREZMQUdTSUNV
RFQtZm9yLUxpbnV4LnBhdGNoIFwKICAgICAgICAgICAiCi1TUkNfVVJJW2NvZGUuc2hhMjU2c3Vt
XSA9ICJhMmQyZDM4MjE3MDkyYTdlZDU2NjM1ZTM0NDY3ZjkyZjk3NmIzNzBlMjAxODJhZDMyNWVk
ZWE2NjgxYTcxZDY4IgorU1JDX1VSSVtjb2RlLnNoYTI1NnN1bV0gPSAiYTQ1NzQzMWRlMTY0YjRh
YTdlY2EwMGVkMTM0ZDAwZGZiZjg4YTc3YzY5ODZhMTBhZTc3NzRmYzA3NmJiOGM0NSIKIFNSQ19V
UklbZGF0YS5zaGEyNTZzdW1dID0gImVlMTlmODc2NTA3ZDZjMjNkOWUwYTJiNjMxMDk2ZjZiMGVh
YTZmYTYxNzI4YzMzYTg5ZWZkYjU1ZTMzODVkZWEiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0g
InJlbGVhc2VzL3RhZy9yZWxlYXNlLSg/UDxwdmVyPig/IS4rcmMpLispIgotLSAKMi4zOS4yCgo=

--===============2729421606029120323==--

