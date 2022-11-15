Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93708C64E94
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:46 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web09.5194.1668517535893207063
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QUx5APbO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101847b652102-6866245f-6187-42f2-b6a4-8d086772e619-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517536;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=cCfuJqFcy39hu5UOTk3U4ltvpbqAJEoXRaHNgLW2qW4=;
	b=QUx5APbO3irZEZvY5O2oymqwfkMG65DniTJjG8mLKpo3mRahWr8uBJd3/jaqqQtu
	epIfoJDM4bPNBvW447UpwQQqjyu78V64fxAR9C8UkJ8bF6DzrSuZVxxPaErZ2MRtFGP
	xHtkv1ya5/viWLq5QG7he+2pGvExdPADMb2LuRFU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517536;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=cCfuJqFcy39hu5UOTk3U4ltvpbqAJEoXRaHNgLW2qW4=;
	b=VkAiihGim/lXLT65ATpfU0rx/zw6uNzNiy+GWRMXseNMNwdLaAM9AYPNgczNgITY
	xpE3mZ2jB/RkEYkygu046DYda/+1w0oRSa8qqMcJ9cVF3yyg97BGTM9GXdogv+388eU
	pjI9M3G3ubHc0yefpGV0GmAbE3qFXnwTzfITmyas=
Content-Type: multipart/mixed; boundary="===============8890275280005079849=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] tzdata: upgrading to 2022f FAILED
Message-ID: <010101847b652102-6866245f-6187-42f2-b6a4-8d086772e619-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173306

--===============8890275280005079849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *tzdata* to *2022f* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-tzdata-upgrade-2022d-2022f.patch
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
--===============8890275280005079849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1665 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (885 cached, 2 parsed). 1665 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:ce6507462d5ccdbf47ebcc1bcb1ff3532d4ecd57"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 13 Local 4 Mirrors 0 Missed 9 Current 102 (30% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 337 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_fetch)
NOTE: Running task 341 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch)
NOTE: recipe tzcode-native-2022f-r0: task do_fetch: Started
NOTE: recipe tzdata-2022f-r0: task do_fetch: Started
WARNING: tzcode-native-2022f-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2022f.tar.gz;name=tzdata - will attempt other sources if available
NOTE: recipe tzcode-native-2022f-r0: task do_fetch: Failed
WARNING: tzdata-2022f-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2022f.tar.gz;name=tzdata - will attempt other sources if available
NOTE: recipe tzdata-2022f-r0: task do_fetch: Failed
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
ERROR: tzcode-native-2022f-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2022f.tar.gz;name=tzdata'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022f.tar.gz.tmp' has sha256 checksum '9990d71f675d212567b931fe8aae1cab7027f89fefb8a79d808a6933a67af000' when '6ecdbee27fa43dcfa49f3d4fd8bb1dfef54c90da1abcd82c9abcf2dc4f321de0' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "9990d71f675d212567b931fe8aae1cab7027f89fefb8a79d808a6933a67af000"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzcode-native-2022f-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2022f.tar.gz;name=tzdata')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/tzcode-native/2022f-r0/temp/log.do_fetch.2975974
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch) failed with exit code '1'
ERROR: tzdata-2022f-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2022f.tar.gz;name=tzdata'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022f.tar.gz.tmp' has sha256 checksum '9990d71f675d212567b931fe8aae1cab7027f89fefb8a79d808a6933a67af000' when '6ecdbee27fa43dcfa49f3d4fd8bb1dfef54c90da1abcd82c9abcf2dc4f321de0' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "9990d71f675d212567b931fe8aae1cab7027f89fefb8a79d808a6933a67af000"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzdata-2022f-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2022f.tar.gz;name=tzdata')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/tzdata/2022f-r0/temp/log.do_fetch.2975973
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_fetch) failed with exit code '1'

--===============8890275280005079849==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tzdata-upgrade-2022d-2022f.patch"

RnJvbSAxMTUzMjYyNWRhMGIyMWQ4ODRkNzdhMTVkZDIxYjdkNDEyZDRlNmJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMDg6Mjc6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
emRhdGE6IHVwZ3JhZGUgMjAyMmQgLT4gMjAyMmYKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3RpbWV6b25lL3RpbWV6b25lLmluYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvdGltZXpvbmUvdGltZXpvbmUuaW5jIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RpbWV6b25l
L3RpbWV6b25lLmluYwppbmRleCBkM2M3OGU5MTU3Li4zODY0YzViZjk0IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGltZXpvbmUvdGltZXpvbmUuaW5jCisrKyBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC90aW1lem9uZS90aW1lem9uZS5pbmMKQEAgLTYsNyArNiw3IEBAIFNFQ1RJ
T04gPSAiYmFzZSIKIExJQ0VOU0UgPSAiUEQgJiBCU0QtMy1DbGF1c2UiCiBMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1jNjc5YzlkNmIwMmJjMjc1N2IzZWFmOGY1M2M0M2Zi
YSIKIAotUFYgPSAiMjAyMmQiCitQViA9ICIyMDIyZiIKIAogU1JDX1VSSSA9IiBodHRwOi8vd3d3
LmlhbmEub3JnL3RpbWUtem9uZXMvcmVwb3NpdG9yeS9yZWxlYXNlcy90emNvZGUke1BWfS50YXIu
Z3o7bmFtZT10emNvZGUgXAogICAgICAgICAgICBodHRwOi8vd3d3LmlhbmEub3JnL3RpbWUtem9u
ZXMvcmVwb3NpdG9yeS9yZWxlYXNlcy90emRhdGEke1BWfS50YXIuZ3o7bmFtZT10emRhdGEgXApA
QCAtMTQsNiArMTQsNiBAQCBTUkNfVVJJID0iIGh0dHA6Ly93d3cuaWFuYS5vcmcvdGltZS16b25l
cy9yZXBvc2l0b3J5L3JlbGVhc2VzL3R6Y29kZSR7UFZ9LnRhci5negogCiBVUFNUUkVBTV9DSEVD
S19VUkkgPSAiaHR0cDovL3d3dy5pYW5hLm9yZy90aW1lLXpvbmVzIgogCi1TUkNfVVJJW3R6Y29k
ZS5zaGEyNTZzdW1dID0gImQ2NDRiYTBmOTM4ODk5Mzc0ZWE4Y2I1NTRlMzVmYjRhZmEwZjdiZDdi
NzE2YzYxNzc3Y2QwMDUwMGI4NzU5ZTAiCitTUkNfVVJJW3R6Y29kZS5zaGEyNTZzdW1dID0gImU0
NTQzZTkwZjg0ZjkxZmE4MjgwOWVhOTg5MzAwNTJmZGJjMTM4ODBjOGE2MjNlZTNhNGVhYTQyZjhh
NjRjMTUiCiBTUkNfVVJJW3R6ZGF0YS5zaGEyNTZzdW1dID0gIjZlY2RiZWUyN2ZhNDNkY2ZhNDlm
M2Q0ZmQ4YmIxZGZlZjU0YzkwZGExYWJjZDgyYzlhYmNmMmRjNGYzMjFkZTAiCiAKLS0gCjIuMzEu
MQoK

--===============8890275280005079849==--

