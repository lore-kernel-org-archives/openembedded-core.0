Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD72CC64EC8
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web12.24535.1665871393716352491
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GMIG6UTY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010183ddac3035-bd8573cf-888f-41c3-9abd-afd275a25a24-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=f5U0yRNCRabxV7V3fLK1xwcsOQ188dBS2vMJ5pJYHRg=;
	b=GMIG6UTY7pddCCvpjosUE/Ghd4xRPusukr9cCh5MFrrBgs+j+RwpeSVngPu5e4CY
	BTAq6z2KKbctBiZnNtVsBrPa/egeHoX1CiuoHzu50s/5zFV1y1RazFjfajkky7pxios
	KbfX1FLHIH55dh2RB7k13jJsGNHvDk8Unlc5io4k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=f5U0yRNCRabxV7V3fLK1xwcsOQ188dBS2vMJ5pJYHRg=;
	b=KsdvJxa5eg+jIIAJXGtcbJEZCmnvwuIgunTeY8yerusJ8by/sWy5NSDP6D7xZQuy
	tqwyo9PljVI3clkq2NfrZScBcvXcVHGn5wl6PAaSglnoUQtpVnEGwsK6vXO8nzWP4Q9
	dxhZ3fJv6GkUrJNOOd3cjqaJ/HYYFeQBsomPLpII=
Content-Type: multipart/mixed; boundary="===============7204305908220455205=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] jquery: upgrading to 3.6.1 FAILED
Message-ID: <01010183ddac3035-bd8573cf-888f-41c3-9abd-afd275a25a24-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171767

--===============7204305908220455205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *jquery* to *3.6.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-jquery-upgrade-3.6.0-3.6.1.patch
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
--===============7204305908220455205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:5564e8a3c9d073c4b2bde8626826f1460a251806"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 12 Local 5 Mirrors 0 Missed 7 Current 101 (41% match, 93% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 337 of 492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.6.1.bb:do_fetch)
NOTE: recipe jquery-3.6.1-r0: task do_fetch: Started
WARNING: jquery-3.6.1-r0 do_fetch: Checksum failure encountered with download of https://code.jquery.com/jquery-3.6.1.min.js;name=min;subdir=jquery-3.6.1 - will attempt other sources if available
WARNING: jquery-3.6.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/jquery-3.6.1.min.js
Cleaning and trying again.
WARNING: jquery-3.6.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/jquery-3.6.1.min.js to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/jquery-3.6.1.min.js_bad-checksum_a3cf00c109d907e543bc4f6dbc85eb31068f94515251347e9e57509b52ee3d74
NOTE: recipe jquery-3.6.1-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 478 tasks of which 477 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.6.1.bb:do_fetch
Summary: There were 4 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: jquery-3.6.1-r0 do_fetch: Checksum failure fetching https://code.jquery.com/jquery-3.6.1.min.js;name=min;subdir=jquery-3.6.1
ERROR: jquery-3.6.1-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/jquery-3.6.1.min.js\' has sha256 checksum \'a3cf00c109d907e543bc4f6dbc85eb31068f94515251347e9e57509b52ee3d74\' when \'ff1523fb7389539c84c65aba19260648793bb4f5e29329d2ee8804bc37a3fe6e\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[min.sha256sum] = "a3cf00c109d907e543bc4f6dbc85eb31068f94515251347e9e57509b52ee3d74"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://code.jquery.com/jquery-3.6.1.min.js;name=min;subdir=jquery-3.6.1')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/jquery/3.6.1-r0/temp/log.do_fetch.48949
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.6.1.bb:do_fetch) failed with exit code '1'

--===============7204305908220455205==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-jquery-upgrade-3.6.0-3.6.1.patch"

RnJvbSAwNjgxOGZkZDViZThmMDdhZmYwNmJiMjQzNmFmNmYyZjJjZjM4NjY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMDg6NTE6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBq
cXVlcnk6IHVwZ3JhZGUgMy42LjAgLT4gMy42LjEKCi0tLQogLi4uL2pxdWVyeS97anF1ZXJ5XzMu
Ni4wLmJiID0+IGpxdWVyeV8zLjYuMS5iYn0gICAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2pxdWVyeS97anF1ZXJ5XzMuNi4wLmJiID0+IGpxdWVyeV8zLjYuMS5iYn0g
KDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvanF1ZXJ5L2pxdWVyeV8z
LjYuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVlcnkvanF1ZXJ5XzMuNi4xLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVl
cnkvanF1ZXJ5XzMuNi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvanF1ZXJ5
L2pxdWVyeV8zLjYuMS5iYgppbmRleCAzOWZmZDM4MTE0Li41ZWQwYmEzYjc0IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvanF1ZXJ5L2pxdWVyeV8zLjYuMC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvanF1ZXJ5L2pxdWVyeV8zLjYuMS5iYgpAQCAtMTMsNyArMTMsNyBA
QCBTUkNfVVJJID0gIlwKICAgICBodHRwczovL2NvZGUuanF1ZXJ5LmNvbS8ke0JQfS5taW4ubWFw
O25hbWU9bWFwO3N1YmRpcj0ke0JQfSBcCiAgICAgIgogCi1TUkNfVVJJW2pzLnNoYTI1NnN1bV0g
PSAiMWZlMmJiNTM5MGE3NWU1ZDYxZTcyYzEwN2NhYjUyOGZjM2MyOWE4MzdkNjlhYWI3ZDIwMGUx
ZGJiNWRjZDIzOSIKK1NSQ19VUklbanMuc2hhMjU2c3VtXSA9ICJkZjM5NDFlNmNkYWVjMjg1MzNh
ZDcyYjcwNTNlYzA1ZjcxNzJiZTg4ZWNhZGEzNDVjNDI3MzZiYzJmZmJhNGQyIgogU1JDX1VSSVtt
aW4uc2hhMjU2c3VtXSA9ICJmZjE1MjNmYjczODk1MzljODRjNjVhYmExOTI2MDY0ODc5M2JiNGY1
ZTI5MzI5ZDJlZTg4MDRiYzM3YTNmZTZlIgogU1JDX1VSSVttYXAuc2hhMjU2c3VtXSA9ICIzOTk1
NDhmYjBlN2IxNDZjMTJmNWJhMTgwOTlhNDdkNTk0YTk3MGZlZTk2MjEyZWVlMGFiNDg1MmYzZTU2
NzgyIgogCi0tIAoyLjMxLjEKCg==

--===============7204305908220455205==--

