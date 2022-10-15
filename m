Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D36C63706
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:19 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web12.24544.1665871395515438330
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GWA4M+pU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010183ddac380a-60da282b-5a8a-4160-962c-8b881e229ba6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871395;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=t5WiJnpoj6ILY00/I+8prqxxBz7TAP+F8t6jf9+iBEg=;
	b=GWA4M+pU0rrPCGeLetJizCuXffMwCBrKmg5B7u8ahqIkTbY2Lk8MkoLoEM+4bi6c
	TVsME7gSlJje9lXIq2fvzpNvSy/fjbbc7Ddh/h4Gq291UKahgmFJiZxaSKz9aCXnomh
	fK0zBTYFiYeUe/UV8OjA83XByhUMYSX8SdqZAACc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871395;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=t5WiJnpoj6ILY00/I+8prqxxBz7TAP+F8t6jf9+iBEg=;
	b=Ypnx31ef2nb9ze4Parp1ijGtBKOe9a6MU8Eik0O8XIF6iPFEMO8vuBwqSo/mdAKx
	o/QoryVt5YOxgCaRblSqpnT3JBwEAvMFpQbgRNRPHFBLFaDZ+9AiMq6qMWd939qIpxf
	G1pxaZpHbdl79V6w++T1/Gris8qZJaHKsDOcSPzs=
Content-Type: multipart/mixed; boundary="===============7250741599348550022=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] tzdata: upgrading to 2022e FAILED
Message-ID: <01010183ddac380a-60da282b-5a8a-4160-962c-8b881e229ba6-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171820

--===============7250741599348550022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *tzdata* to *2022e* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-tzdata-upgrade-2022d-2022e.patch
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
--===============7250741599348550022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (883 cached, 2 parsed). 1661 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86 sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4f6fc8aebef2f0147bdc2e7e5bbd937899d36201"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 13 Local 4 Mirrors 0 Missed 9 Current 102 (30% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 337 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_fetch)
NOTE: Running task 341 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch)
NOTE: recipe tzcode-native-2022e-r0: task do_fetch: Started
NOTE: recipe tzdata-2022e-r0: task do_fetch: Started
WARNING: tzcode-native-2022e-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2022e.tar.gz;name=tzdata - will attempt other sources if available
NOTE: recipe tzcode-native-2022e-r0: task do_fetch: Failed
WARNING: tzdata-2022e-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2022e.tar.gz;name=tzdata - will attempt other sources if available
NOTE: recipe tzdata-2022e-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 479 tasks of which 477 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_fetch
Summary: There were 3 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: tzcode-native-2022e-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2022e.tar.gz;name=tzdata'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022e.tar.gz.tmp' has sha256 checksum '8de4c2686dce3d1aae9030719e6814931c216a2d5e891ec3d332e6f6516aeccd' when '6ecdbee27fa43dcfa49f3d4fd8bb1dfef54c90da1abcd82c9abcf2dc4f321de0' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "8de4c2686dce3d1aae9030719e6814931c216a2d5e891ec3d332e6f6516aeccd"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzcode-native-2022e-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2022e.tar.gz;name=tzdata')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/tzcode-native/2022e-r0/temp/log.do_fetch.547374
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch) failed with exit code '1'
ERROR: tzdata-2022e-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2022e.tar.gz;name=tzdata'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022e.tar.gz.tmp' has sha256 checksum '8de4c2686dce3d1aae9030719e6814931c216a2d5e891ec3d332e6f6516aeccd' when '6ecdbee27fa43dcfa49f3d4fd8bb1dfef54c90da1abcd82c9abcf2dc4f321de0' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "8de4c2686dce3d1aae9030719e6814931c216a2d5e891ec3d332e6f6516aeccd"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzdata-2022e-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2022e.tar.gz;name=tzdata')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/tzdata/2022e-r0/temp/log.do_fetch.547373
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_fetch) failed with exit code '1'

--===============7250741599348550022==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tzdata-upgrade-2022d-2022e.patch"

RnJvbSBhYzVjMTc0ZDBmZmIzMTAzNzc4MDM2MTg4MjhiZWVjYWI3NGMxZmJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTM6NDI6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
emRhdGE6IHVwZ3JhZGUgMjAyMmQgLT4gMjAyMmUKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3RpbWV6b25lL3RpbWV6b25lLmluYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvdGltZXpvbmUvdGltZXpvbmUuaW5jIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RpbWV6b25l
L3RpbWV6b25lLmluYwppbmRleCBkM2M3OGU5MTU3Li5iZjQ2YTQxMzRhIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGltZXpvbmUvdGltZXpvbmUuaW5jCisrKyBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC90aW1lem9uZS90aW1lem9uZS5pbmMKQEAgLTYsNyArNiw3IEBAIFNFQ1RJ
T04gPSAiYmFzZSIKIExJQ0VOU0UgPSAiUEQgJiBCU0QtMy1DbGF1c2UiCiBMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1jNjc5YzlkNmIwMmJjMjc1N2IzZWFmOGY1M2M0M2Zi
YSIKIAotUFYgPSAiMjAyMmQiCitQViA9ICIyMDIyZSIKIAogU1JDX1VSSSA9IiBodHRwOi8vd3d3
LmlhbmEub3JnL3RpbWUtem9uZXMvcmVwb3NpdG9yeS9yZWxlYXNlcy90emNvZGUke1BWfS50YXIu
Z3o7bmFtZT10emNvZGUgXAogICAgICAgICAgICBodHRwOi8vd3d3LmlhbmEub3JnL3RpbWUtem9u
ZXMvcmVwb3NpdG9yeS9yZWxlYXNlcy90emRhdGEke1BWfS50YXIuZ3o7bmFtZT10emRhdGEgXApA
QCAtMTQsNiArMTQsNiBAQCBTUkNfVVJJID0iIGh0dHA6Ly93d3cuaWFuYS5vcmcvdGltZS16b25l
cy9yZXBvc2l0b3J5L3JlbGVhc2VzL3R6Y29kZSR7UFZ9LnRhci5negogCiBVUFNUUkVBTV9DSEVD
S19VUkkgPSAiaHR0cDovL3d3dy5pYW5hLm9yZy90aW1lLXpvbmVzIgogCi1TUkNfVVJJW3R6Y29k
ZS5zaGEyNTZzdW1dID0gImQ2NDRiYTBmOTM4ODk5Mzc0ZWE4Y2I1NTRlMzVmYjRhZmEwZjdiZDdi
NzE2YzYxNzc3Y2QwMDUwMGI4NzU5ZTAiCitTUkNfVVJJW3R6Y29kZS5zaGEyNTZzdW1dID0gImQ0
MDI4MDI1Mzk4MGU4OTE2OGU2YmU0Mjc1YTg1MmJmOTUyMTUyNGQ0NzY4NGRlMzEzNWI5YTVjYTM4
NzcxMGIiCiBTUkNfVVJJW3R6ZGF0YS5zaGEyNTZzdW1dID0gIjZlY2RiZWUyN2ZhNDNkY2ZhNDlm
M2Q0ZmQ4YmIxZGZlZjU0YzkwZGExYWJjZDgyYzlhYmNmMmRjNGYzMjFkZTAiCiAKLS0gCjIuMzEu
MQoK

--===============7250741599348550022==--

