Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381B1C2FC14
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:40 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.6022.1689456454379554280
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NuwNaJrV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101895b73a808-93d22430-0035-4a20-8af7-663139011f9e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456453;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RA9zpBrMvdQHO3TDnCwFw/eQkte1wjukz/0jc2f3FZ0=;
	b=NuwNaJrVNZXEM+FKvZUCIkFRPGvd13Ivw8QMkVIu8d5IFde6YWP5XfhDZioI4hJw
	lOxDkKTSIY+nsF1ly7riVUH8KhUb/ACi22KMIYtoltMmpY08MmslmoVUo1knaY+hJOx
	SSwq4lySDDn66hNUTfqcV469g9+3g3Ji+Lui0mh4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456453;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RA9zpBrMvdQHO3TDnCwFw/eQkte1wjukz/0jc2f3FZ0=;
	b=DVnQ4sOxXeLZrodrNOGCd1lGMvo4b9PQJyIR1FBCjRAg6FKPavRAfIPH510vZx1T
	37mgpuU2G+yRlB5UinXKQKXEJryj344vUgCHPtTiMGNcb7YWQpn6WXWQv08dUL/EWsH
	OL7Gd6ExAfro+Zrb2/lvo8b/1Lt4qSLlcoXlSfgg=
Content-Type: multipart/mixed; boundary="===============2154575569791148468=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] jquery: upgrading to 3.7.0 FAILED
Message-ID: <010101895b73a808-93d22430-0035-4a20-8af7-663139011f9e-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184331

--===============2154575569791148468==
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

-- >8 --
From 78b42edc3bc77b92832bfc14c5504a575122dd9a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 10:56:09 +0000
Subject: [PATCH] jquery: upgrade 3.6.3 -> 3.7.0

---
 .../jquery/{jquery_3.6.3.bb => jquery_3.7.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/jquery/{jquery_3.6.3.bb => jquery_3.7.0.bb} (93%)

diff --git a/meta/recipes-devtools/jquery/jquery_3.6.3.bb b/meta/recipes-devtools/jquery/jquery_3.7.0.bb
similarity index 93%
rename from meta/recipes-devtools/jquery/jquery_3.6.3.bb
rename to meta/recipes-devtools/jquery/jquery_3.7.0.bb
index 93f87f730d..de09eac2df 100644
--- a/meta/recipes-devtools/jquery/jquery_3.6.3.bb
+++ b/meta/recipes-devtools/jquery/jquery_3.7.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "\
     https://code.jquery.com/${BP}.min.map;name=map;subdir=${BP} \
     "
 
-SRC_URI[js.sha256sum] = "9d02ee01919145c20b03ee9d3013af7118793dedf5d2c0696a773af90066c953"
+SRC_URI[js.sha256sum] = "265a924c42de4784cba8fd0e1bd77133bc833ea5f5a31fc77e08922c18fcfa43"
 SRC_URI[min.sha256sum] = "a6f3f0faea4b3d48e03176341bef0ed3151ffbf226d4c6635f1c6039c0500575"
 SRC_URI[map.sha256sum] = "156b740931ade6c1a98d99713eeb186f93847ffc56057e973becab4d037ed53a"
 
-- 
2.39.2


--===============2154575569791148468==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-jquery-upgrade-3.6.3-3.7.0.patch"

RnJvbSA3OGI0MmVkYzNiYzc3YjkyODMyYmZjMTRjNTUwNGE1NzUxMjJkZDlhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTA6NTY6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBq
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

--===============2154575569791148468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1803 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:a1e4903a336cfdfa74f5cce0149e05a5133cf57f"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 16 Local 7 Mirrors 0 Missed 9 Current 115 (43% match, 93% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 389 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.7.0.bb:do_fetch)
NOTE: recipe jquery-3.7.0-r0: task do_fetch: Started
WARNING: jquery-3.7.0-r0 do_fetch: Checksum failure encountered with download of https://code.jquery.com/jquery-3.7.0.min.js;name=min;subdir=jquery-3.7.0 - will attempt other sources if available
WARNING: jquery-3.7.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/jquery-3.7.0.min.js
Cleaning and trying again.
WARNING: jquery-3.7.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/jquery-3.7.0.min.js to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/jquery-3.7.0.min.js_bad-checksum_d8f9afbf492e4c139e9d2bcb9ba6ef7c14921eb509fb703bc7a3f911b774eff8
NOTE: recipe jquery-3.7.0-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 551 tasks of which 550 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.7.0.bb:do_fetch
Summary: There were 4 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: jquery-3.7.0-r0 do_fetch: Checksum failure fetching https://code.jquery.com/jquery-3.7.0.min.js;name=min;subdir=jquery-3.7.0
ERROR: jquery-3.7.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/jquery-3.7.0.min.js\' has sha256 checksum \'d8f9afbf492e4c139e9d2bcb9ba6ef7c14921eb509fb703bc7a3f911b774eff8\' when \'a6f3f0faea4b3d48e03176341bef0ed3151ffbf226d4c6635f1c6039c0500575\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[min.sha256sum] = "d8f9afbf492e4c139e9d2bcb9ba6ef7c14921eb509fb703bc7a3f911b774eff8"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://code.jquery.com/jquery-3.7.0.min.js;name=min;subdir=jquery-3.7.0')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/jquery/3.7.0-r0/temp/log.do_fetch.615921
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.7.0.bb:do_fetch) failed with exit code '1'

--===============2154575569791148468==--

