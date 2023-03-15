Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1430C7EE45
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.12144.1678895725895848613
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lRcflKg7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010186e5fbb9f1-89303de1-0b0c-4a78-89b7-5ceb2b9251a0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OkUTOXomG0qLjgu/oM05mYdiUHtp0ZN54Q9xXx6TuJY=;
	b=lRcflKg74PcG3ugnBPm6xHPSUook2WEYq9CRi/vofV0LRU87WQbPXPCsTVVudD/b
	+bKFGTPxoiJCFCnuWwNrfnoW5/IGOPUXqCJl9iy1ejb5im5Hr6rVbRrIYH206VV81Ai
	CeIgQRYDFW7i7Rto+eN1sjfQ+l7IYwUd6BFHZuoc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OkUTOXomG0qLjgu/oM05mYdiUHtp0ZN54Q9xXx6TuJY=;
	b=k/xaQNsPketbHBb/mrOxUv1G60W3FcR/vqTU0pwRr8AvQqewt7pWLzuLBqZh8+7P
	nFFpL9AzNrQtHA2qX59lL5CVvic1wS5pCiQXbNERg9/fF+u6AM1nXZg/XtBkvCHXOn1
	Y0G4g0UtqDo9h14UFigbARLakWD7b61igcFoSvRU=
Content-Type: multipart/mixed; boundary="===============2390283430458652267=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] jquery: upgrading to 3.6.4 FAILED
Message-ID: <01010186e5fbb9f1-89303de1-0b0c-4a78-89b7-5ceb2b9251a0-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178593

--===============2390283430458652267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *jquery* to *3.6.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-jquery-upgrade-3.6.3-3.6.4.patch
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
--===============2390283430458652267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1790 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (895 cached, 1 parsed). 1790 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-242d40476cdf76e67bd3760d64bfb6f621712ed1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:242d40476cdf76e67bd3760d64bfb6f621712ed1"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 9 Local 2 Mirrors 0 Missed 7 Current 104 (22% match, 93% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 337 of 492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.6.4.bb:do_fetch)
NOTE: recipe jquery-3.6.4-r0: task do_fetch: Started
WARNING: jquery-3.6.4-r0 do_fetch: Checksum failure encountered with download of https://code.jquery.com/jquery-3.6.4.min.js;name=min;subdir=jquery-3.6.4 - will attempt other sources if available
NOTE: recipe jquery-3.6.4-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 478 tasks of which 477 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.6.4.bb:do_fetch
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: jquery-3.6.4-r0 do_fetch: Fetcher failure for URL: 'https://code.jquery.com/jquery-3.6.4.min.js;name=min;subdir=jquery-3.6.4'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/jquery-3.6.4.min.js.tmp' has sha256 checksum 'a0fe8723dcf55da64d06b25446d0a8513e52527c45afcb37073465f9c6f352af' when 'a6f3f0faea4b3d48e03176341bef0ed3151ffbf226d4c6635f1c6039c0500575' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[min.sha256sum] = "a0fe8723dcf55da64d06b25446d0a8513e52527c45afcb37073465f9c6f352af"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: jquery-3.6.4-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://code.jquery.com/jquery-3.6.4.min.js;name=min;subdir=jquery-3.6.4')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/jquery/3.6.4-r0/temp/log.do_fetch.3458427
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.6.4.bb:do_fetch) failed with exit code '1'

--===============2390283430458652267==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-jquery-upgrade-3.6.3-3.6.4.patch"

RnJvbSA2MWUyNmUzNTdkNjYxOGI0NWJhOTg2OTQ5MGI5NmE5NGQwN2IzYzk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMDc6NDk6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBq
cXVlcnk6IHVwZ3JhZGUgMy42LjMgLT4gMy42LjQKCi0tLQogLi4uL2pxdWVyeS97anF1ZXJ5XzMu
Ni4zLmJiID0+IGpxdWVyeV8zLjYuNC5iYn0gICAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2pxdWVyeS97anF1ZXJ5XzMuNi4zLmJiID0+IGpxdWVyeV8zLjYuNC5iYn0g
KDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvanF1ZXJ5L2pxdWVyeV8z
LjYuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVlcnkvanF1ZXJ5XzMuNi40LmJiCnNp
bWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVl
cnkvanF1ZXJ5XzMuNi4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvanF1ZXJ5
L2pxdWVyeV8zLjYuNC5iYgppbmRleCA5M2Y4N2Y3MzBkLi5hMzk1YmZlMTRmIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvanF1ZXJ5L2pxdWVyeV8zLjYuMy5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvanF1ZXJ5L2pxdWVyeV8zLjYuNC5iYgpAQCAtMTMsNyArMTMsNyBA
QCBTUkNfVVJJID0gIlwKICAgICBodHRwczovL2NvZGUuanF1ZXJ5LmNvbS8ke0JQfS5taW4ubWFw
O25hbWU9bWFwO3N1YmRpcj0ke0JQfSBcCiAgICAgIgogCi1TUkNfVVJJW2pzLnNoYTI1NnN1bV0g
PSAiOWQwMmVlMDE5MTkxNDVjMjBiMDNlZTlkMzAxM2FmNzExODc5M2RlZGY1ZDJjMDY5NmE3NzNh
ZjkwMDY2Yzk1MyIKK1NSQ19VUklbanMuc2hhMjU2c3VtXSA9ICI2YmQ4YzEwNTFjYTA1ZjUwNjFl
NjViN2MxOTk4ZDcwZjNjOGUwN2U2ZDZiZGVmNDQ4OGVlZWQ0NGU1MmQ4ZmYxIgogU1JDX1VSSVtt
aW4uc2hhMjU2c3VtXSA9ICJhNmYzZjBmYWVhNGIzZDQ4ZTAzMTc2MzQxYmVmMGVkMzE1MWZmYmYy
MjZkNGM2NjM1ZjFjNjAzOWMwNTAwNTc1IgogU1JDX1VSSVttYXAuc2hhMjU2c3VtXSA9ICIxNTZi
NzQwOTMxYWRlNmMxYTk4ZDk5NzEzZWViMTg2ZjkzODQ3ZmZjNTYwNTdlOTczYmVjYWI0ZDAzN2Vk
NTNhIgogCi0tIAoyLjM5LjIKCg==

--===============2390283430458652267==--

