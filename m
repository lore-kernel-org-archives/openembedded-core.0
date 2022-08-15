Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7685EC28B2C
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:02 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web12.6333.1660589819989571958
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HQ7COC/X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 01010182a2ddcc6b-611e584a-7e8b-4391-8d7a-fbd3085e09af-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589821;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=N0191dKaOyyG/K66xX0vrtHN+rTYkVsqI8FAfuhNDyY=;
	b=HQ7COC/X9hvlBx3ysnFN+HNyqOzwrDaKW9o4HreFVHpyTHXwR4EVCHMGoVxDWyet
	WAZC5gqeixltV1dw2+MUXH77xWshHLJX5U74kEouKErDYG7+fW3TwVIVqhLZqsKE/h4
	ZmS+1U+wQIHw969gh84FDScqymB1/fk1IinP0/ZE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589821;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=N0191dKaOyyG/K66xX0vrtHN+rTYkVsqI8FAfuhNDyY=;
	b=ENfWpuQ9JpT8tRsltLyYyJ3CAy5DuZ9Zs0gtQ++BRwrnc2qKE4jD9Ee2bSIKCatQ
	945tPliRGZCv0XxSWXePOajVu1mmrgYpW7fq/wnR0MdM6h0gAr34yuO3W8h1eSoDFRo
	GwqKGlR78XjiiMwLr60MjsdqieA4xka66SBFGw4A=
Content-Type: multipart/mixed; boundary="===============6075586779614382858=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] tzdata: upgrading to 2022b FAILED
Message-ID: 
 <01010182a2ddcc6b-611e584a-7e8b-4391-8d7a-fbd3085e09af-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:57:01 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169389

--===============6075586779614382858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *tzdata* to *2022b* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-tzdata-upgrade-2022a-2022b.patch
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
--===============6075586779614382858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1658 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (882 cached, 2 parsed). 1658 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86 sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-0de37953b162ad20c9f1455dd21504212b2f759d"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0de37953b162ad20c9f1455dd21504212b2f759d"
workspace            = "master:21cfb871f7da604f1fab957d7747cb03b113b971"

Initialising tasks...done.
Sstate summary: Wanted 10 Local 1 Mirrors 0 Missed 9 Current 105 (10% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 337 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_fetch)
NOTE: Running task 341 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch)
NOTE: recipe tzcode-native-2022b-r0: task do_fetch: Started
NOTE: recipe tzdata-2022b-r0: task do_fetch: Started
WARNING: tzcode-native-2022b-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022b.tar.gz
Cleaning and trying again.
WARNING: tzcode-native-2022b-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022b.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022b.tar.gz_bad-checksum_f590eaf04a395245426c2be4fae71c143aea5cebc11088b7a0a5704461df397d
WARNING: tzcode-native-2022b-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2022b.tar.gz;name=tzdata - will attempt other sources if available
NOTE: recipe tzcode-native-2022b-r0: task do_fetch: Failed
WARNING: tzdata-2022b-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022b.tar.gz
Cleaning and trying again.
WARNING: tzdata-2022b-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022b.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022b.tar.gz_bad-checksum_f590eaf04a395245426c2be4fae71c143aea5cebc11088b7a0a5704461df397d
WARNING: tzdata-2022b-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2022b.tar.gz;name=tzdata - will attempt other sources if available
NOTE: recipe tzdata-2022b-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 479 tasks of which 477 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_fetch
Summary: There were 7 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: tzcode-native-2022b-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2022b.tar.gz;name=tzdata'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022b.tar.gz' has sha256 checksum 'f590eaf04a395245426c2be4fae71c143aea5cebc11088b7a0a5704461df397d' when 'ef7fffd9f4f50f4f58328b35022a32a5a056b245c5cb3d6791dddb342f871664' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "f590eaf04a395245426c2be4fae71c143aea5cebc11088b7a0a5704461df397d"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzcode-native-2022b-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2022b.tar.gz;name=tzdata')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/tzcode-native/2022b-r0/temp/log.do_fetch.2550703
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch) failed with exit code '1'
ERROR: tzdata-2022b-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2022b.tar.gz;name=tzdata'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022b.tar.gz' has sha256 checksum 'f590eaf04a395245426c2be4fae71c143aea5cebc11088b7a0a5704461df397d' when 'ef7fffd9f4f50f4f58328b35022a32a5a056b245c5cb3d6791dddb342f871664' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "f590eaf04a395245426c2be4fae71c143aea5cebc11088b7a0a5704461df397d"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzdata-2022b-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2022b.tar.gz;name=tzdata')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/tzdata/2022b-r0/temp/log.do_fetch.2550702
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_fetch) failed with exit code '1'

--===============6075586779614382858==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tzdata-upgrade-2022a-2022b.patch"

RnJvbSA2NDI3NzMyZGNmODJkMjEwYTk5OWExOWM0MTk0MjI2NGQzZjhlOWEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMTA6Mzk6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
emRhdGE6IHVwZ3JhZGUgMjAyMmEgLT4gMjAyMmIKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3RpbWV6b25lL3RpbWV6b25lLmluYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvdGltZXpvbmUvdGltZXpvbmUuaW5jIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RpbWV6b25l
L3RpbWV6b25lLmluYwppbmRleCBjZGQxYTJhYzNjLi5mYWI3ZGM4YjJkIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGltZXpvbmUvdGltZXpvbmUuaW5jCisrKyBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC90aW1lem9uZS90aW1lem9uZS5pbmMKQEAgLTYsNyArNiw3IEBAIFNFQ1RJ
T04gPSAiYmFzZSIKIExJQ0VOU0UgPSAiUEQgJiBCU0QtMy1DbGF1c2UiCiBMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1jNjc5YzlkNmIwMmJjMjc1N2IzZWFmOGY1M2M0M2Zi
YSIKIAotUFYgPSAiMjAyMmEiCitQViA9ICIyMDIyYiIKIAogU1JDX1VSSSA9IiBodHRwOi8vd3d3
LmlhbmEub3JnL3RpbWUtem9uZXMvcmVwb3NpdG9yeS9yZWxlYXNlcy90emNvZGUke1BWfS50YXIu
Z3o7bmFtZT10emNvZGUgXAogICAgICAgICAgICBodHRwOi8vd3d3LmlhbmEub3JnL3RpbWUtem9u
ZXMvcmVwb3NpdG9yeS9yZWxlYXNlcy90emRhdGEke1BWfS50YXIuZ3o7bmFtZT10emRhdGEgXApA
QCAtMTQsNiArMTQsNiBAQCBTUkNfVVJJID0iIGh0dHA6Ly93d3cuaWFuYS5vcmcvdGltZS16b25l
cy9yZXBvc2l0b3J5L3JlbGVhc2VzL3R6Y29kZSR7UFZ9LnRhci5negogCiBVUFNUUkVBTV9DSEVD
S19VUkkgPSAiaHR0cDovL3d3dy5pYW5hLm9yZy90aW1lLXpvbmVzIgogCi1TUkNfVVJJW3R6Y29k
ZS5zaGEyNTZzdW1dID0gImY4NTc1ZTdlMzNiZTllZTI2NWRmMjA4MTA5MjUyNmI4MWM4MGFiYWMz
ZjRhMDQzOTlhZTlkNGQ5MWNkYWRhYzciCitTUkNfVVJJW3R6Y29kZS5zaGEyNTZzdW1dID0gImJh
YjIwZDk0M2U1OWEzMjE4NDM1ZjQ4ZDg2OGE0ZTU1MmYxOGQ2ZDdmM2RkMTI4NjYwYzU2NjBjODBi
OGEwNWYiCiBTUkNfVVJJW3R6ZGF0YS5zaGEyNTZzdW1dID0gImVmN2ZmZmQ5ZjRmNTBmNGY1ODMy
OGIzNTAyMmEzMmE1YTA1NmIyNDVjNWNiM2Q2NzkxZGRkYjM0MmY4NzE2NjQiCiAKLS0gCjIuMzEu
MQoK

--===============6075586779614382858==--

