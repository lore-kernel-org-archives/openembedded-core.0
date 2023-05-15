Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA85DCA9ED2
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.3761.1684186747381259209
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=V2cU7UTc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010188215a4ec3-da3fc43f-75e9-4bfa-906e-136fef06dfab-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IGmIUoazCKQAHPe5INzSgQ7EysTr/IdIbD82J1OhIp4=;
	b=V2cU7UTcGQGpjnb2LzXiq6+Qz8GSjccDRpwseXjFuSILA/4yuvejVXOutXoJbB7p
	SmqNXYwyEhCwdYbr4h1B+3VDiFbODkPUEjR6CEcqeRT9SwnwouDGnblNLaabnXhuy2c
	V+rNqbnGNjbhiZpH4MmG8tBeOIhEk7QXONHCFZuo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IGmIUoazCKQAHPe5INzSgQ7EysTr/IdIbD82J1OhIp4=;
	b=DCboGJemjZNiNoeSPhHAqOh5Ej9GgGrdS67nhTDBA8vhN0OskqFXyHMiFDJU+VMQ
	6XvZsKw2wq3EYrRy8TjpVgWnb2jEFCaEg0q0+tbXo6Y1lSvtIJhQ9cRuu5PmLtsv4fD
	Xi6puqE4Uucw8wbIkhreDuG2R2LkFCLeARfyNT1k=
Content-Type: multipart/mixed; boundary="===============8701912989665910626=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] jquery: upgrading to 3.7.0 FAILED
Message-ID: <01010188215a4ec3-da3fc43f-75e9-4bfa-906e-136fef06dfab-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181296

--===============8701912989665910626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *jquery* to *3.7.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-jquery-upgrade-3.6.3-3.7.0.patch
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
--===============8701912989665910626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (899 cached, 1 parsed). 1803 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:e459edd3f9cea6b1857352c9364a23306ca8f9d3"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 7 Local 0 Mirrors 0 Missed 7 Current 116 (0% match, 94% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 381 of 538 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.7.0.bb:do_fetch)
NOTE: recipe jquery-3.7.0-r0: task do_fetch: Started
WARNING: jquery-3.7.0-r0 do_fetch: Checksum failure encountered with download of https://code.jquery.com/jquery-3.7.0.min.js;name=min;subdir=jquery-3.7.0 - will attempt other sources if available
NOTE: recipe jquery-3.7.0-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 524 tasks of which 523 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.7.0.bb:do_fetch
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: jquery-3.7.0-r0 do_fetch: Fetcher failure for URL: 'https://code.jquery.com/jquery-3.7.0.min.js;name=min;subdir=jquery-3.7.0'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/jquery-3.7.0.min.js.tmp' has sha256 checksum 'd8f9afbf492e4c139e9d2bcb9ba6ef7c14921eb509fb703bc7a3f911b774eff8' when 'a6f3f0faea4b3d48e03176341bef0ed3151ffbf226d4c6635f1c6039c0500575' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[min.sha256sum] = "d8f9afbf492e4c139e9d2bcb9ba6ef7c14921eb509fb703bc7a3f911b774eff8"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: jquery-3.7.0-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://code.jquery.com/jquery-3.7.0.min.js;name=min;subdir=jquery-3.7.0')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/jquery/3.7.0-r0/temp/log.do_fetch.3533100
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.7.0.bb:do_fetch) failed with exit code '1'

--===============8701912989665910626==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-jquery-upgrade-3.6.3-3.7.0.patch"

RnJvbSA3NzkzNWZhN2IxNWRmZDQyZjc0NTI5MGJiMzQyYzZiYjI3MzdiZmU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMDk6MTk6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBq
cXVlcnk6IHVwZ3JhZGUgMy42LjMgLT4gMy43LjAKCi0tLQogLi4uL2pxdWVyeS97anF1ZXJ5XzMu
Ni4zLmJiID0+IGpxdWVyeV8zLjcuMC5iYn0gICAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2pxdWVyeS97anF1ZXJ5XzMuNi4zLmJiID0+IGpxdWVyeV8zLjcuMC5iYn0g
KDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvanF1ZXJ5L2pxdWVyeV8z
LjYuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVlcnkvanF1ZXJ5XzMuNy4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVl
cnkvanF1ZXJ5XzMuNi4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvanF1ZXJ5
L2pxdWVyeV8zLjcuMC5iYgppbmRleCA5M2Y4N2Y3MzBkLi5kZTA5ZWFjMmRmIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvanF1ZXJ5L2pxdWVyeV8zLjYuMy5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvanF1ZXJ5L2pxdWVyeV8zLjcuMC5iYgpAQCAtMTMsNyArMTMsNyBA
QCBTUkNfVVJJID0gIlwKICAgICBodHRwczovL2NvZGUuanF1ZXJ5LmNvbS8ke0JQfS5taW4ubWFw
O25hbWU9bWFwO3N1YmRpcj0ke0JQfSBcCiAgICAgIgogCi1TUkNfVVJJW2pzLnNoYTI1NnN1bV0g
PSAiOWQwMmVlMDE5MTkxNDVjMjBiMDNlZTlkMzAxM2FmNzExODc5M2RlZGY1ZDJjMDY5NmE3NzNh
ZjkwMDY2Yzk1MyIKK1NSQ19VUklbanMuc2hhMjU2c3VtXSA9ICIyNjVhOTI0YzQyZGU0Nzg0Y2Jh
OGZkMGUxYmQ3NzEzM2JjODMzZWE1ZjVhMzFmYzc3ZTA4OTIyYzE4ZmNmYTQzIgogU1JDX1VSSVtt
aW4uc2hhMjU2c3VtXSA9ICJhNmYzZjBmYWVhNGIzZDQ4ZTAzMTc2MzQxYmVmMGVkMzE1MWZmYmYy
MjZkNGM2NjM1ZjFjNjAzOWMwNTAwNTc1IgogU1JDX1VSSVttYXAuc2hhMjU2c3VtXSA9ICIxNTZi
NzQwOTMxYWRlNmMxYTk4ZDk5NzEzZWViMTg2ZjkzODQ3ZmZjNTYwNTdlOTczYmVjYWI0ZDAzN2Vk
NTNhIgogCi0tIAoyLjM5LjIKCg==

--===============8701912989665910626==--

