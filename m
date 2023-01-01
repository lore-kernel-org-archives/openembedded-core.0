Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CC2C46467
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:07 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.20171.1672605966563178217
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LFVfzaSW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101856f159b47-83bb671c-8e51-4364-9ae2-346ef761994e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605965;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FjjRgy5z44/i4+WA945G7zlxDsIj+gT2TJ9Wq7YTXSc=;
	b=LFVfzaSW063A0+GYgH+F7HUP0AtVGivrsEyKO1zTRVLY/n5WEH9y8zKDmOC37nxj
	sHa/1TBk1nvA8B+wUjSjR1Hq/GvJ6Svl3YmOvRNJYMEzkjPejD17V8EiIvC7j/l+/kJ
	jle9uXKFaweDK593JrXXEDf9ZQHMgzMGEolLOscQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605965;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FjjRgy5z44/i4+WA945G7zlxDsIj+gT2TJ9Wq7YTXSc=;
	b=fSClE5cxFT0AtHQqcIjXOy0YE7iv2scAjqz2K1Ji3/WxPiC2q5Vx7xifTEk3/zLJ
	IV5/lj82RpZx5MsF03v0CFve8/D2HEGGNuXR/N98/qwWw6PFKkg+vbUyzPjpIls9V68
	J5a1H/mpFFLBasDFTQq5c7t6bw7Ny5jGLLiAXI+Y=
Content-Type: multipart/mixed; boundary="===============8466107569254168708=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] jquery: upgrading to 3.6.3 FAILED
Message-ID: <010101856f159b47-83bb671c-8e51-4364-9ae2-346ef761994e-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175244

--===============8466107569254168708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *jquery* to *3.6.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-jquery-upgrade-3.6.2-3.6.3.patch
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
--===============8466107569254168708==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-jquery-upgrade-3.6.2-3.6.3.patch"

RnJvbSBlMTJiYjJhNGE4Yjc5ODE4YWY1NDBkYmZhMjAxYTMzMDNiMWQ0ODdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAwNzoxMTo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGpx
dWVyeTogdXBncmFkZSAzLjYuMiAtPiAzLjYuMwoKLS0tCiAuLi4vanF1ZXJ5L3tqcXVlcnlfMy42
LjIuYmIgPT4ganF1ZXJ5XzMuNi4zLmJifSAgICAgICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvanF1ZXJ5L3tqcXVlcnlfMy42LjIuYmIgPT4ganF1ZXJ5XzMuNi4zLmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVlcnkvanF1ZXJ5XzMu
Ni4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2pxdWVyeS9qcXVlcnlfMy42LjMuYmIKc2lt
aWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2pxdWVy
eS9qcXVlcnlfMy42LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVlcnkv
anF1ZXJ5XzMuNi4zLmJiCmluZGV4IGZlNmM1N2QyMDYuLjQ4NWY4ZjZhNTEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVlcnkvanF1ZXJ5XzMuNi4yLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9qcXVlcnkvanF1ZXJ5XzMuNi4zLmJiCkBAIC0xMyw3ICsxMyw3IEBA
IFNSQ19VUkkgPSAiXAogICAgIGh0dHBzOi8vY29kZS5qcXVlcnkuY29tLyR7QlB9Lm1pbi5tYXA7
bmFtZT1tYXA7c3ViZGlyPSR7QlB9IFwKICAgICAiCiAKLVNSQ19VUklbanMuc2hhMjU2c3VtXSA9
ICJhNjQ5ZjYwOTQ2NjY4NWU0OWVjYWNiMThjMzdiY2NhNzVmYjFjYWU2Zjg5YmU3YmU0MGFlMmM0
MmM5MmZiYThlIgorU1JDX1VSSVtqcy5zaGEyNTZzdW1dID0gIjlkMDJlZTAxOTE5MTQ1YzIwYjAz
ZWU5ZDMwMTNhZjcxMTg3OTNkZWRmNWQyYzA2OTZhNzczYWY5MDA2NmM5NTMiCiBTUkNfVVJJW21p
bi5zaGEyNTZzdW1dID0gImRhNGFkODY0YTg3ZmZjZjcxYzg1MWI1ZGY4N2Y5NWNiMjQyODY3Zjdi
NzExY2FlNGM2MTMzY2M5Y2MwMDQ4ZjAiCiBTUkNfVVJJW21hcC5zaGEyNTZzdW1dID0gImY0Njkw
MmZjMWI4MWMyODZlNTFmNGViNDgxMjM4MmVlOWVlZGJhMGU5ZmM4NTVlNGRjM2FmNTllMGM1N2Y0
MDQiCiAKLS0gCjIuMzcuMwoK

--===============8466107569254168708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1690 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (892 cached, 1 parsed). 1690 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:3538fcaed724d28ed6e9f7c8789a47a9d5fe2429"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 8 Local 1 Mirrors 0 Missed 7 Current 105 (12% match, 93% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 337 of 492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.6.3.bb:do_fetch)
NOTE: recipe jquery-3.6.3-r0: task do_fetch: Started
WARNING: jquery-3.6.3-r0 do_fetch: Checksum failure encountered with download of https://code.jquery.com/jquery-3.6.3.min.js;name=min;subdir=jquery-3.6.3 - will attempt other sources if available
NOTE: recipe jquery-3.6.3-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 478 tasks of which 477 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.6.3.bb:do_fetch
Summary: There were 2 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: jquery-3.6.3-r0 do_fetch: Fetcher failure for URL: 'https://code.jquery.com/jquery-3.6.3.min.js;name=min;subdir=jquery-3.6.3'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/jquery-3.6.3.min.js.tmp' has sha256 checksum 'a6f3f0faea4b3d48e03176341bef0ed3151ffbf226d4c6635f1c6039c0500575' when 'da4ad864a87ffcf71c851b5df87f95cb242867f7b711cae4c6133cc9cc0048f0' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[min.sha256sum] = "a6f3f0faea4b3d48e03176341bef0ed3151ffbf226d4c6635f1c6039c0500575"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: jquery-3.6.3-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://code.jquery.com/jquery-3.6.3.min.js;name=min;subdir=jquery-3.6.3')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/jquery/3.6.3-r0/temp/log.do_fetch.2925976
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.6.3.bb:do_fetch) failed with exit code '1'

--===============8466107569254168708==--

