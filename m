Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85846C88CBB
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.32122.1680384534501442871
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jwGadyQj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101873eb92449-39dc853a-2d37-4288-8792-9bc580ed9f88-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=h1idqL9Jl6ptj6V5k3lUw0W8LSvfecz0lH+ePm2En6o=;
	b=jwGadyQj0PU8Po9d8HVn/2lrFd4voVIvd5HkMbUFhkfYC4ltFVQk4opzUA+xpO39
	eFJkNtNPmJKw3NBjUisft+lcpUI1bgCWRlX8DZVmU/w7fnNpfOhGhRX6zdNR7qmR4o5
	zRlmBWiXlcmyYop/cAsLaOW/9htC4jFKLJDEHKBk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=h1idqL9Jl6ptj6V5k3lUw0W8LSvfecz0lH+ePm2En6o=;
	b=E6bwMLI79sHWr45ZUBobzZHmP3AUuqcyVknQrxPUFQvJCx6wr9puZkx+w5sslX2o
	DNEvBF3Bv05Hnzu/5Rq9SNtDG44aomYvqEsw7ZpGyOBG66PnH08jUQa+yUe4Cuo8BIt
	fWx52PVsxooEL9jqlcgmGw5IipaPNdSq+0ED8W/Y=
Content-Type: multipart/mixed; boundary="===============7805790785750577062=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] jquery: upgrading to 3.6.4 FAILED
Message-ID: <010101873eb92449-39dc853a-2d37-4288-8792-9bc580ed9f88-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179496

--===============7805790785750577062==
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
--===============7805790785750577062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1796 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1796 targets, 39 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-a42b6872c18a6b1ec288fb07f93e7c6345d1bd28"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a42b6872c18a6b1ec288fb07f93e7c6345d1bd28"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/jquery/3.6.4-r0/temp/log.do_fetch.1415742
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.6.4.bb:do_fetch) failed with exit code '1'

--===============7805790785750577062==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-jquery-upgrade-3.6.3-3.6.4.patch"

RnJvbSAwM2E3ZWE2Y2NmMDI1NTI0MmJhMmU5YmIxMjY4ZTI3YjZkYjZmZmI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAwODoxMzowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGpx
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

--===============7805790785750577062==--

