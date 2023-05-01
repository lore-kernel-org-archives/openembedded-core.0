Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C775C7EE2F
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:51 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.107888.1682976350143008190
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dpqDmW8i;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010187d9351c96-2a6056bb-b282-4b99-97da-6a16cf59d03c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YhzB7zKdmN5znYCiukizNTAYE2jl+9lPJ+pY9SK4Fwo=;
	b=dpqDmW8iluda/sOJWC2zOFW+5ex6xd7kfpLpdWCo/LIepLdkHDo6PbCjPNAWgTZK
	N8Gbjqpg0fpJg72X/9096QndXUjkIS2Tg1K7FK7ZhM5d+7/bd3KONthG8Ok89SP6/1o
	vZeJBxlWqzCN+4c1yn7oy2D4IpRTe/ptEAScm57w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YhzB7zKdmN5znYCiukizNTAYE2jl+9lPJ+pY9SK4Fwo=;
	b=Lw2EuT0ADY8ufffUUsE3w0AwCxGzWXyLfjiAt59J4ges6lNJz4uhOn2MoHT+CeAq
	8rwPI2a1xeceBh4o32CHCRuU1jU37fd4FvWRGB+ObSDDnw3CP219yjF7rfskPUpTwPv
	ZWd4VVCBT6sA6uIViGlsrMiM44OUQa/M0Lg68f8g=
Content-Type: multipart/mixed; boundary="===============5318810134393828757=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] jquery: upgrading to 3.6.4 FAILED
Message-ID: <01010187d9351c96-2a6056bb-b282-4b99-97da-6a16cf59d03c-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180610

--===============5318810134393828757==
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
--===============5318810134393828757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1798 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1798 targets, 40 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:b4f62ad9bdcc0c66faec8d2181d9f21cfd6add89"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 8 Local 1 Mirrors 0 Missed 7 Current 105 (12% match, 93% complete)
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/jquery/3.6.4-r0/temp/log.do_fetch.184611
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.6.4.bb:do_fetch) failed with exit code '1'

--===============5318810134393828757==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-jquery-upgrade-3.6.3-3.6.4.patch"

RnJvbSA2NzA0NzMzOWFiMGFmNTRiMjMyZThmNTI5Y2U5NDU4MDQxNjFiOWY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAwOTowMzoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGpx
dWVyeTogdXBncmFkZSAzLjYuMyAtPiAzLjYuNAoKLS0tCiAuLi4vanF1ZXJ5L3tqcXVlcnlfMy42
LjMuYmIgPT4ganF1ZXJ5XzMuNi40LmJifSAgICAgICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvanF1ZXJ5L3tqcXVlcnlfMy42LjMuYmIgPT4ganF1ZXJ5XzMuNi40LmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVlcnkvanF1ZXJ5XzMu
Ni4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2pxdWVyeS9qcXVlcnlfMy42LjQuYmIKc2lt
aWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2pxdWVy
eS9qcXVlcnlfMy42LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVlcnkv
anF1ZXJ5XzMuNi40LmJiCmluZGV4IDkzZjg3ZjczMGQuLmEzOTViZmUxNGYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVlcnkvanF1ZXJ5XzMuNi4zLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9qcXVlcnkvanF1ZXJ5XzMuNi40LmJiCkBAIC0xMyw3ICsxMyw3IEBA
IFNSQ19VUkkgPSAiXAogICAgIGh0dHBzOi8vY29kZS5qcXVlcnkuY29tLyR7QlB9Lm1pbi5tYXA7
bmFtZT1tYXA7c3ViZGlyPSR7QlB9IFwKICAgICAiCiAKLVNSQ19VUklbanMuc2hhMjU2c3VtXSA9
ICI5ZDAyZWUwMTkxOTE0NWMyMGIwM2VlOWQzMDEzYWY3MTE4NzkzZGVkZjVkMmMwNjk2YTc3M2Fm
OTAwNjZjOTUzIgorU1JDX1VSSVtqcy5zaGEyNTZzdW1dID0gIjZiZDhjMTA1MWNhMDVmNTA2MWU2
NWI3YzE5OThkNzBmM2M4ZTA3ZTZkNmJkZWY0NDg4ZWVlZDQ0ZTUyZDhmZjEiCiBTUkNfVVJJW21p
bi5zaGEyNTZzdW1dID0gImE2ZjNmMGZhZWE0YjNkNDhlMDMxNzYzNDFiZWYwZWQzMTUxZmZiZjIy
NmQ0YzY2MzVmMWM2MDM5YzA1MDA1NzUiCiBTUkNfVVJJW21hcC5zaGEyNTZzdW1dID0gIjE1NmI3
NDA5MzFhZGU2YzFhOThkOTk3MTNlZWIxODZmOTM4NDdmZmM1NjA1N2U5NzNiZWNhYjRkMDM3ZWQ1
M2EiCiAKLS0gCjIuMzkuMgoK

--===============5318810134393828757==--

