Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE6FC49EA4
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:53 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web09.343.1664643226842995504
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Wf2+Mbhl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 010101839477d8d1-1bc83ed1-d904-4c38-bfe5-e930a5a35782-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GuAj6iKUJnXXTqdVsmLYon1Y5JI34hihZO3IFFWmlVo=;
	b=Wf2+MbhlAu75GMJxkwZqPoqkfpcXUVvcHDoEeKXkonc4dHBRchNsAxGD9bVr6FJ4
	plMLi3YXJOksMKtju8HxJg5lAKaMSzIIvF04G8s5OACONMcOCTmA65xttW34TkItWZu
	juiUnjCyemeJ7o++3GzY8ro4RVdrKWScluf5TSFg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GuAj6iKUJnXXTqdVsmLYon1Y5JI34hihZO3IFFWmlVo=;
	b=BSORf0hDunDhw731yTNbKAKOuZOUaL11xbQ5MPrIuqUSExFmyGJRXSe6xnGuoHos
	ISgdC1nPK+2RY2l49XIt6WHlLxw/qDllprKWDObN0K16YUQZ/xNLTeOI13x64MplheX
	a2jOmIdRCNz57jS4CHPWFIU/KfqkefF+dQNKV+Ik=
Content-Type: multipart/mixed; boundary="===============7599145551898496157=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] jquery: upgrading to 3.6.1 FAILED
Message-ID: 
 <010101839477d8d1-1bc83ed1-d904-4c38-bfe5-e930a5a35782-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:45 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171264

--===============7599145551898496157==
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
--===============7599145551898496157==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-jquery-upgrade-3.6.0-3.6.1.patch"

RnJvbSAyOTdiNDU4ZmE3YzEwNjMzNGI0OGQ0YWFiMmE5OTA5N2VlNWJiNmZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAwNzoxOToxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGpx
dWVyeTogdXBncmFkZSAzLjYuMCAtPiAzLjYuMQoKLS0tCiAuLi4vanF1ZXJ5L3tqcXVlcnlfMy42
LjAuYmIgPT4ganF1ZXJ5XzMuNi4xLmJifSAgICAgICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvanF1ZXJ5L3tqcXVlcnlfMy42LjAuYmIgPT4ganF1ZXJ5XzMuNi4xLmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVlcnkvanF1ZXJ5XzMu
Ni4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2pxdWVyeS9qcXVlcnlfMy42LjEuYmIKc2lt
aWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2pxdWVy
eS9qcXVlcnlfMy42LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVlcnkv
anF1ZXJ5XzMuNi4xLmJiCmluZGV4IDM5ZmZkMzgxMTQuLjVlZDBiYTNiNzQgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVlcnkvanF1ZXJ5XzMuNi4wLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9qcXVlcnkvanF1ZXJ5XzMuNi4xLmJiCkBAIC0xMyw3ICsxMyw3IEBA
IFNSQ19VUkkgPSAiXAogICAgIGh0dHBzOi8vY29kZS5qcXVlcnkuY29tLyR7QlB9Lm1pbi5tYXA7
bmFtZT1tYXA7c3ViZGlyPSR7QlB9IFwKICAgICAiCiAKLVNSQ19VUklbanMuc2hhMjU2c3VtXSA9
ICIxZmUyYmI1MzkwYTc1ZTVkNjFlNzJjMTA3Y2FiNTI4ZmMzYzI5YTgzN2Q2OWFhYjdkMjAwZTFk
YmI1ZGNkMjM5IgorU1JDX1VSSVtqcy5zaGEyNTZzdW1dID0gImRmMzk0MWU2Y2RhZWMyODUzM2Fk
NzJiNzA1M2VjMDVmNzE3MmJlODhlY2FkYTM0NWM0MjczNmJjMmZmYmE0ZDIiCiBTUkNfVVJJW21p
bi5zaGEyNTZzdW1dID0gImZmMTUyM2ZiNzM4OTUzOWM4NGM2NWFiYTE5MjYwNjQ4NzkzYmI0ZjVl
MjkzMjlkMmVlODgwNGJjMzdhM2ZlNmUiCiBTUkNfVVJJW21hcC5zaGEyNTZzdW1dID0gIjM5OTU0
OGZiMGU3YjE0NmMxMmY1YmExODA5OWE0N2Q1OTRhOTcwZmVlOTYyMTJlZWUwYWI0ODUyZjNlNTY3
ODIiCiAKLS0gCjIuMzEuMQoK

--===============7599145551898496157==
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
meta-yocto-bsp       = "tmp-auh-upgrades:d78e4b853d14306b8022f3b808440c636efea733"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 11 Local 4 Mirrors 0 Missed 7 Current 102 (36% match, 93% complete)
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/jquery/3.6.1-r0/temp/log.do_fetch.3123231
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.6.1.bb:do_fetch) failed with exit code '1'

--===============7599145551898496157==--

