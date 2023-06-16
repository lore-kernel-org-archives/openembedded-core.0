Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6653CC27C6D
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.806.1686887482816850072
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XAZo4RS2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010188c2544316-071ac7d5-e502-4082-b6c2-7a3e498e2df2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=V3TZfICHGkyaS/VTIWZNElvzhcMMV6bA4VWq8D6vH/k=;
	b=XAZo4RS2iuMj69DrZMkKJnX6EyYkuIF48A+IeEuuHyCXj8MvKfiZCaQYggs0J/jW
	5jzh44+F5Hukw73pWqedFbdtwBq8UX5Bu3OL5Cy1gkZskrmJvwvQfkSNEX5I5YiHFSj
	L+SD3zLk45N/I+vtmHJUrNnedXM9pT2sS6g0U2TY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=V3TZfICHGkyaS/VTIWZNElvzhcMMV6bA4VWq8D6vH/k=;
	b=Bsj++UE0K1tWwofB03WucbkjBHCJt9Fi4TCT663aTVl2BsfWE6KWNvxh0pdlZSFL
	keGbU84VDZLWuWCHb5GCgibaSZmlNLa/mvvaDi2Cg/SSM/2xz79h5WaW4cvYA9sOZ3U
	FkrPt811qbGdwUxFfgObE/vAkLkrArF8ASrPLBAk=
Content-Type: multipart/mixed; boundary="===============0409889547613865650=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] jquery: upgrading to 3.7.0 FAILED
Message-ID: <01010188c2544316-071ac7d5-e502-4082-b6c2-7a3e498e2df2-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182907

--===============0409889547613865650==
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
From 6a2013ef5ddd416660824e4623b4f89df66f8d11 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 09:16:25 +0000
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


--===============0409889547613865650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:be2776aa86d5f03c97132527aa02764bedc13b6b"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 11 Local 2 Mirrors 0 Missed 9 Current 120 (18% match, 93% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 389 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.7.0.bb:do_fetch)
NOTE: recipe jquery-3.7.0-r0: task do_fetch: Started
WARNING: jquery-3.7.0-r0 do_fetch: Checksum failure encountered with download of https://code.jquery.com/jquery-3.7.0.min.js;name=min;subdir=jquery-3.7.0 - will attempt other sources if available
NOTE: recipe jquery-3.7.0-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 551 tasks of which 550 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/jquery/3.7.0-r0/temp/log.do_fetch.2551682
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.7.0.bb:do_fetch) failed with exit code '1'

--===============0409889547613865650==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-jquery-upgrade-3.6.3-3.7.0.patch"

RnJvbSA2YTIwMTNlZjVkZGQ0MTY2NjA4MjRlNDYyM2I0Zjg5ZGY2NmY4ZDExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMDk6MTY6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBq
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

--===============0409889547613865650==--

