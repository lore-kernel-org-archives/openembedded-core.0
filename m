Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BADFCA101D
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:14 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.5675.1693650553030104846
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eetTtXue;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Zx1o+ffv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018a557085f7-9c028e40-02ed-40f3-982e-adad444af2b8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cale8R2ieJErtWcPXHaKojNrhoTwun6uyPi0a0ZiYEE=;
	b=eetTtXuegpzTkds4nfzgjlE4f5JZgsC19zE7AdPr8I6B7hOc6Yo5jFIWZD8NAolM
	nUhGorylyxYuTGxvkE4HulVYJ/zXxjBLmQb1G1vxs6iMyJ0VcB/IQo3MPNYrNVlCs64
	MEe0B40RJhJCHZm+fnuYh1ENF1htFFUr7Y9Uf5yI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cale8R2ieJErtWcPXHaKojNrhoTwun6uyPi0a0ZiYEE=;
	b=Zx1o+ffvwiYKftKyttLGXjZY76kmpwzbeTRRKMEulWHZutRsojJQcA7ZDrk389TL
	nUDRjzIOCgmr/DzcTAouYBVWDYQ6M9rDC51xH6SAEctwW7A4GxP8KZj7tiKwkty4fxj
	+hXb0UjpYAzWDpQjexgY6mYH3zS8vc/Azxx82HZs=
Content-Type: multipart/mixed; boundary="===============8572665336478516523=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] jquery: upgrading to 3.7.1 FAILED
Message-ID: <0101018a557085f7-9c028e40-02ed-40f3-982e-adad444af2b8-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187053

--===============8572665336478516523==
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
From cdd82455c9f1b4b5b904ce2102f73af7eadeef06 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 12:08:57 +0000
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


--===============8572665336478516523==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-jquery-upgrade-3.7.0-3.7.1.patch"

RnJvbSBjZGQ4MjQ1NWM5ZjFiNGI1YjkwNGNlMjEwMmY3M2FmN2VhZGVlZjA2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAxMjowODo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGpx
dWVyeTogdXBncmFkZSAzLjcuMCAtPiAzLjcuMQoKLS0tCiAuLi4vanF1ZXJ5L3tqcXVlcnlfMy43
LjAuYmIgPT4ganF1ZXJ5XzMuNy4xLmJifSAgICAgICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvanF1ZXJ5L3tqcXVlcnlfMy43LjAuYmIgPT4ganF1ZXJ5XzMuNy4xLmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVlcnkvanF1ZXJ5XzMu
Ny4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2pxdWVyeS9qcXVlcnlfMy43LjEuYmIKc2lt
aWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2pxdWVy
eS9qcXVlcnlfMy43LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVlcnkv
anF1ZXJ5XzMuNy4xLmJiCmluZGV4IGVjZWVkOWM5ZGQuLmY5MmM5OWRhMmMgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVlcnkvanF1ZXJ5XzMuNy4wLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9qcXVlcnkvanF1ZXJ5XzMuNy4xLmJiCkBAIC0xMyw3ICsxMyw3IEBA
IFNSQ19VUkkgPSAiXAogICAgIGh0dHBzOi8vY29kZS5qcXVlcnkuY29tLyR7QlB9Lm1pbi5tYXA7
bmFtZT1tYXA7c3ViZGlyPSR7QlB9IFwKICAgICAiCiAKLVNSQ19VUklbanMuc2hhMjU2c3VtXSA9
ICIyNjVhOTI0YzQyZGU0Nzg0Y2JhOGZkMGUxYmQ3NzEzM2JjODMzZWE1ZjVhMzFmYzc3ZTA4OTIy
YzE4ZmNmYTQzIgorU1JDX1VSSVtqcy5zaGEyNTZzdW1dID0gIjc4YTg1YWNhMmYwYjExMGMyOWUw
ZDJiMTM3ZTA5ZjBhMWZiN2E4ZTU1NGI0OTlmNzQwZDY3NDRkYzg5NjJjZmUiCiBTUkNfVVJJW21p
bi5zaGEyNTZzdW1dID0gImQ4ZjlhZmJmNDkyZTRjMTM5ZTlkMmJjYjliYTZlZjdjMTQ5MjFlYjUw
OWZiNzAzYmM3YTNmOTExYjc3NGVmZjgiCiBTUkNfVVJJW21hcC5zaGEyNTZzdW1dID0gImNhZTQ3
ZTgzNGVlOTc3OTc1YTQ4Yzg1MWIxNjVjYzUyZWE5MTZjYzk2OGJhN2QyODBiMTI5M2Y1NzNjZDFh
NDgiCiAKLS0gCjIuMzkuMgoK

--===============8572665336478516523==
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
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-ab8b5ccd6f409c690b56f88b3c9b58cad9fee4fe"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ab8b5ccd6f409c690b56f88b3c9b58cad9fee4fe"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

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
NOTE: Writing buildhistory took: 2 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/jquery/3.7.1/temp/log.do_fetch.947099
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.7.1.bb:do_fetch) failed with exit code '1'

--===============8572665336478516523==--

