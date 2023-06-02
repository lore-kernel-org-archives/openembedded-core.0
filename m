Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DCFCCA9ED9
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:45 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.7532.1685693432763827582
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bb76+Spc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101887b287e2a-d131d1a3-b665-4868-a8f4-1a7771770b2e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693431;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rbMkzo2c6xz/6YSJSibtfurvYv6u2rZw7Hh2YGvPNdg=;
	b=bb76+SpcG3HxiDg/9FMXkrS8ka2ABUKIrGbKIG7NYOblRMhrVfdepDXkTx65D+iC
	reOWPb0u0ylz0YMJBhyFgsac6dVMpc+veBkNnlEAZ49pfVj59wMyQxU27hf/S0fcOv6
	DsBVsk3H8BRfDq4vJkNNor+SnzVUE2sXcXVe+n8A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693431;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rbMkzo2c6xz/6YSJSibtfurvYv6u2rZw7Hh2YGvPNdg=;
	b=h9sIUw6VdILb690pSitJdD8VQdGGqgoe6pUur6CzNxkpb/4v+PHaIrLUxWb3zvZs
	Xf1hGxgY1UXPeVJW99X79Q3+rxWHAm+LhZb11MKIvuMxISPo78lnKEFjqFMOD/VPzh+
	NR+XpdCwMtx9B+udD7JNoi++rGKCOANSwaB9/R94=
Content-Type: multipart/mixed; boundary="===============8601890514149059534=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] jquery: upgrading to 3.7.0 FAILED
Message-ID: <010101887b287e2a-d131d1a3-b665-4868-a8f4-1a7771770b2e-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182186

--===============8601890514149059534==
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
--===============8601890514149059534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1800 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1800 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:b8096465a2feada6352c4e1c8bd90709ca1fd9c2"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 11 Local 4 Mirrors 0 Missed 7 Current 118 (36% match, 94% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 390 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.7.0.bb:do_fetch)
NOTE: recipe jquery-3.7.0-r0: task do_fetch: Started
WARNING: jquery-3.7.0-r0 do_fetch: Checksum failure encountered with download of https://code.jquery.com/jquery-3.7.0.min.js;name=min;subdir=jquery-3.7.0 - will attempt other sources if available
NOTE: recipe jquery-3.7.0-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 551 tasks of which 550 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.7.0.bb:do_fetch
Summary: There were 2 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: jquery-3.7.0-r0 do_fetch: Fetcher failure for URL: 'https://code.jquery.com/jquery-3.7.0.min.js;name=min;subdir=jquery-3.7.0'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/jquery-3.7.0.min.js.tmp' has sha256 checksum 'd8f9afbf492e4c139e9d2bcb9ba6ef7c14921eb509fb703bc7a3f911b774eff8' when 'a6f3f0faea4b3d48e03176341bef0ed3151ffbf226d4c6635f1c6039c0500575' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[min.sha256sum] = "d8f9afbf492e4c139e9d2bcb9ba6ef7c14921eb509fb703bc7a3f911b774eff8"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: jquery-3.7.0-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://code.jquery.com/jquery-3.7.0.min.js;name=min;subdir=jquery-3.7.0')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/jquery/3.7.0-r0/temp/log.do_fetch.3763261
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.7.0.bb:do_fetch) failed with exit code '1'

--===============8601890514149059534==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-jquery-upgrade-3.6.3-3.7.0.patch"

RnJvbSBlYWFjYTRmN2NiYzBkNWY0YTdjMDQ5ZjEwMmY3NzJlMzEzZWE1NzUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxMDoyMTo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGpx
dWVyeTogdXBncmFkZSAzLjYuMyAtPiAzLjcuMAoKLS0tCiAuLi4vanF1ZXJ5L3tqcXVlcnlfMy42
LjMuYmIgPT4ganF1ZXJ5XzMuNy4wLmJifSAgICAgICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvanF1ZXJ5L3tqcXVlcnlfMy42LjMuYmIgPT4ganF1ZXJ5XzMuNy4wLmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVlcnkvanF1ZXJ5XzMu
Ni4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2pxdWVyeS9qcXVlcnlfMy43LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2pxdWVy
eS9qcXVlcnlfMy42LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVlcnkv
anF1ZXJ5XzMuNy4wLmJiCmluZGV4IDkzZjg3ZjczMGQuLmRlMDllYWMyZGYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVlcnkvanF1ZXJ5XzMuNi4zLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9qcXVlcnkvanF1ZXJ5XzMuNy4wLmJiCkBAIC0xMyw3ICsxMyw3IEBA
IFNSQ19VUkkgPSAiXAogICAgIGh0dHBzOi8vY29kZS5qcXVlcnkuY29tLyR7QlB9Lm1pbi5tYXA7
bmFtZT1tYXA7c3ViZGlyPSR7QlB9IFwKICAgICAiCiAKLVNSQ19VUklbanMuc2hhMjU2c3VtXSA9
ICI5ZDAyZWUwMTkxOTE0NWMyMGIwM2VlOWQzMDEzYWY3MTE4NzkzZGVkZjVkMmMwNjk2YTc3M2Fm
OTAwNjZjOTUzIgorU1JDX1VSSVtqcy5zaGEyNTZzdW1dID0gIjI2NWE5MjRjNDJkZTQ3ODRjYmE4
ZmQwZTFiZDc3MTMzYmM4MzNlYTVmNWEzMWZjNzdlMDg5MjJjMThmY2ZhNDMiCiBTUkNfVVJJW21p
bi5zaGEyNTZzdW1dID0gImE2ZjNmMGZhZWE0YjNkNDhlMDMxNzYzNDFiZWYwZWQzMTUxZmZiZjIy
NmQ0YzY2MzVmMWM2MDM5YzA1MDA1NzUiCiBTUkNfVVJJW21hcC5zaGEyNTZzdW1dID0gIjE1NmI3
NDA5MzFhZGU2YzFhOThkOTk3MTNlZWIxODZmOTM4NDdmZmM1NjA1N2U5NzNiZWNhYjRkMDM3ZWQ1
M2EiCiAKLS0gCjIuMzkuMgoK

--===============8601890514149059534==--

