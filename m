Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72287EEE252
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:00 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.29677.1694804393933426027
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=G8mt7lOx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Jq8CJ3Zd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018a9a36bb13-1625df0b-91bf-4455-9ff1-0bab6062644d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pZNZQBEki97Qv6ki7jkzEtmLcJ6eacVam3cuNGCg7BQ=;
	b=G8mt7lOxUyxCR+4II4n8jvSa3P1djyuqVPaUIUug7Ukmmk2xiLd70v7V0aVL1EHi
	85ww9Wya7vmziTbANl+VtZRqdf4mn2UUnBK7BuBOG2/PcNwtWl3E3rJfWs0FSG1OT69
	YCsMR/ku+lkO+XA6uCdmrJv/9xI5UgqRby2gfHeY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pZNZQBEki97Qv6ki7jkzEtmLcJ6eacVam3cuNGCg7BQ=;
	b=Jq8CJ3ZdJnaNeLNK4naVQRTgSIWP0suaP1cDqQO8OnSVwXzi0FyJM6FQ+pJVCVhx
	O5VTaTlAriekV5dOtpT28xz5+JbwRLjampX2BMdHQ+MuIDTCARA4HXG5DDITi0rGnXk
	FRb0efcWYgzj2vBMEKL6k35XZ1ooT/XQKjXfAPj8=
Content-Type: multipart/mixed; boundary="===============3147694943444814775=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] jquery: upgrading to 3.7.1 FAILED
Message-ID: <0101018a9a36bb13-1625df0b-91bf-4455-9ff1-0bab6062644d-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187703

--===============3147694943444814775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *jquery* to *3.7.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-jquery-upgrade-3.7.0-3.7.1.patch
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
From ddbe08af28f24d363c0469b31217daf3461f4613 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 08:36:45 +0000
Subject: [PATCH] jquery: upgrade 3.7.0 -> 3.7.1

---
 .../jquery/{jquery_3.7.0.bb => jquery_3.7.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/jquery/{jquery_3.7.0.bb => jquery_3.7.1.bb} (93%)

diff --git a/meta/recipes-devtools/jquery/jquery_3.7.0.bb b/meta/recipes-devtools/jquery/jquery_3.7.1.bb
similarity index 93%
rename from meta/recipes-devtools/jquery/jquery_3.7.0.bb
rename to meta/recipes-devtools/jquery/jquery_3.7.1.bb
index eceed9c9dd..f92c99da2c 100644
--- a/meta/recipes-devtools/jquery/jquery_3.7.0.bb
+++ b/meta/recipes-devtools/jquery/jquery_3.7.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "\
     https://code.jquery.com/${BP}.min.map;name=map;subdir=${BP} \
     "
 
-SRC_URI[js.sha256sum] = "265a924c42de4784cba8fd0e1bd77133bc833ea5f5a31fc77e08922c18fcfa43"
+SRC_URI[js.sha256sum] = "78a85aca2f0b110c29e0d2b137e09f0a1fb7a8e554b499f740d6744dc8962cfe"
 SRC_URI[min.sha256sum] = "d8f9afbf492e4c139e9d2bcb9ba6ef7c14921eb509fb703bc7a3f911b774eff8"
 SRC_URI[map.sha256sum] = "cae47e834ee977975a48c851b165cc52ea916cc968ba7d280b1293f573cd1a48"
 
-- 
2.39.2


--===============3147694943444814775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1806 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-9da9cfca9c783a749ea48c5b2fa432ff8208701b"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9da9cfca9c783a749ea48c5b2fa432ff8208701b"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 16 Local 6 Mirrors 0 Missed 10 Current 180 (37% match, 94% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 448 of 640 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.7.1.bb:do_recipe_qa)
NOTE: recipe jquery-3.7.1-r0: task do_recipe_qa: Started
NOTE: recipe jquery-3.7.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 623 of 640 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.7.1.bb:do_fetch)
NOTE: recipe jquery-3.7.1-r0: task do_fetch: Started
WARNING: jquery-3.7.1-r0 do_fetch: Checksum failure encountered with download of https://code.jquery.com/jquery-3.7.1.min.js;name=min;subdir=jquery-3.7.1 - will attempt other sources if available
NOTE: recipe jquery-3.7.1-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 623 tasks of which 621 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.7.1.bb:do_fetch
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: jquery-3.7.1-r0 do_fetch: Fetcher failure for URL: 'https://code.jquery.com/jquery-3.7.1.min.js;name=min;subdir=jquery-3.7.1'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/jquery-3.7.1.min.js.tmp' has sha256 checksum 'fc9a93dd241f6b045cbff0481cf4e1901becd0e12fb45166a8f17f95823f0b1a' when 'd8f9afbf492e4c139e9d2bcb9ba6ef7c14921eb509fb703bc7a3f911b774eff8' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[min.sha256sum] = "fc9a93dd241f6b045cbff0481cf4e1901becd0e12fb45166a8f17f95823f0b1a"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: jquery-3.7.1-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://code.jquery.com/jquery-3.7.1.min.js;name=min;subdir=jquery-3.7.1')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/jquery/3.7.1/temp/log.do_fetch.4181250
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.7.1.bb:do_fetch) failed with exit code '1'

--===============3147694943444814775==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-jquery-upgrade-3.7.0-3.7.1.patch"

RnJvbSBkZGJlMDhhZjI4ZjI0ZDM2M2MwNDY5YjMxMjE3ZGFmMzQ2MWY0NjEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMDg6MzY6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBq
cXVlcnk6IHVwZ3JhZGUgMy43LjAgLT4gMy43LjEKCi0tLQogLi4uL2pxdWVyeS97anF1ZXJ5XzMu
Ny4wLmJiID0+IGpxdWVyeV8zLjcuMS5iYn0gICAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2pxdWVyeS97anF1ZXJ5XzMuNy4wLmJiID0+IGpxdWVyeV8zLjcuMS5iYn0g
KDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvanF1ZXJ5L2pxdWVyeV8z
LjcuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVlcnkvanF1ZXJ5XzMuNy4xLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVl
cnkvanF1ZXJ5XzMuNy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvanF1ZXJ5
L2pxdWVyeV8zLjcuMS5iYgppbmRleCBlY2VlZDljOWRkLi5mOTJjOTlkYTJjIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvanF1ZXJ5L2pxdWVyeV8zLjcuMC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvanF1ZXJ5L2pxdWVyeV8zLjcuMS5iYgpAQCAtMTMsNyArMTMsNyBA
QCBTUkNfVVJJID0gIlwKICAgICBodHRwczovL2NvZGUuanF1ZXJ5LmNvbS8ke0JQfS5taW4ubWFw
O25hbWU9bWFwO3N1YmRpcj0ke0JQfSBcCiAgICAgIgogCi1TUkNfVVJJW2pzLnNoYTI1NnN1bV0g
PSAiMjY1YTkyNGM0MmRlNDc4NGNiYThmZDBlMWJkNzcxMzNiYzgzM2VhNWY1YTMxZmM3N2UwODky
MmMxOGZjZmE0MyIKK1NSQ19VUklbanMuc2hhMjU2c3VtXSA9ICI3OGE4NWFjYTJmMGIxMTBjMjll
MGQyYjEzN2UwOWYwYTFmYjdhOGU1NTRiNDk5Zjc0MGQ2NzQ0ZGM4OTYyY2ZlIgogU1JDX1VSSVtt
aW4uc2hhMjU2c3VtXSA9ICJkOGY5YWZiZjQ5MmU0YzEzOWU5ZDJiY2I5YmE2ZWY3YzE0OTIxZWI1
MDlmYjcwM2JjN2EzZjkxMWI3NzRlZmY4IgogU1JDX1VSSVttYXAuc2hhMjU2c3VtXSA9ICJjYWU0
N2U4MzRlZTk3Nzk3NWE0OGM4NTFiMTY1Y2M1MmVhOTE2Y2M5NjhiYTdkMjgwYjEyOTNmNTczY2Qx
YTQ4IgogCi0tIAoyLjM5LjIKCg==

--===============3147694943444814775==--

