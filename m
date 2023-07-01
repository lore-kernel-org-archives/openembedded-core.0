Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18804C25B7A
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 16:02:08 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.10500.1688227323061373099
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 09:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MI2z5mhA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018912309990-3f82ba4e-43cf-43b7-91db-abda023944ff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1688227322;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qA2kz8bpKEYS8zAra7rdjdz5snvnaZ/ziSrFRi+OD5E=;
	b=MI2z5mhAWbcDdzZ1rMyH0aIdB9ERQdYeRuYmauAg1BPWQn7nTf32j0tBEBeJg+6Y
	gv1RHXf9cw9Ob5aFgmI+j3DPpFGXd8RCl/yos4Y6O5HCQwak1CGpomOhURZPFf1gRIt
	rUNng1NIQF7B5Zv8d7MyvYN939RFdABOV6kSxawI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1688227322;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qA2kz8bpKEYS8zAra7rdjdz5snvnaZ/ziSrFRi+OD5E=;
	b=DPRPOeNAixQ+fU8w4vIMNP/Jrp381qO5M6M2iYJPowYrnE9mjW1wMuaUBYhA2dBo
	wyNpg/HvEzP+32IVw/fhBGzoxPYqp1JryzKx0yhdBhkyK/KdPR6WEyZUVrbdqgNxoZ5
	vcSXJxtPmNeY6sJi7S3ZlGaYYGLWPQiUVXmdVGFA=
Content-Type: multipart/mixed; boundary="===============3035139113882340934=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] jquery: upgrading to 3.7.0 FAILED
Message-ID: <0101018912309990-3f82ba4e-43cf-43b7-91db-abda023944ff-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jul 2023 16:02:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183722

--===============3035139113882340934==
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
From c35ef00536af6360ba4aaa3823dda05f99d6eb69 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jul 2023 08:38:44 +0000
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


--===============3035139113882340934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1798 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (895 cached, 1 parsed). 1798 targets, 34 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f95482f75ffdbdad231717b74230ff65e3913ed3"
workspace            = "master:d221e59a5067266c3f620259a1e56a56823df1fb"

Initialising tasks...done.
Sstate summary: Wanted 16 Local 7 Mirrors 0 Missed 9 Current 115 (43% match, 93% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 389 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.7.0.bb:do_fetch)
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/jquery/3.7.0-r0/temp/log.do_fetch.1441975
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/jquery/jquery_3.7.0.bb:do_fetch) failed with exit code '1'

--===============3035139113882340934==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-jquery-upgrade-3.6.3-3.7.0.patch"

RnJvbSBjMzVlZjAwNTM2YWY2MzYwYmE0YWFhMzgyM2RkYTA1Zjk5ZDZlYjY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdWwgMjAyMyAwODozODo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGpx
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

--===============3035139113882340934==--

