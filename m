Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F586D60CFA
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:18:15 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.4887.1731964679134906313
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:18:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=X7ztQNw4;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=4l9MsJva;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101934123d218-beecd961-efe6-4765-9c72-6b03df05a06e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uRAhvjgBRZKVMB777mIKdasb1GNmSTUcVxnr6onmFc4=;
	b=X7ztQNw4OaWDaSMxrvvk1WzvQlhpY6x+JWYM9peddUenPwQiEg5QUX1PNf1b/if1
	0BDqzU3l9TMyeZkB8d6ot8Vhhv6wlVJ2VGD7PEkdQQzhQA2aoy7u+wCQZMYWoHpc+uh
	97tGdJIehEmj5pCAiO0X+FDJ+7+wjPIu6i4o6xxM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uRAhvjgBRZKVMB777mIKdasb1GNmSTUcVxnr6onmFc4=;
	b=4l9MsJvaDUH2AQtSRSXMZRBPFKSbTrGKkLZbnr7STsNd86f7F6tlgoPrpht2NXuH
	Jpw/MKAcNhHWY46OSrl3wqiMkzWGGk/rPnVa7h4uX3HN4Ysed4mecLmqrU8u3pyrde4
	gSz43GDENCyAXqoFF0Kj6eM7LKzyeZ9IYXJdST+c=
Content-Type: multipart/mixed; boundary="===============2714354314675987101=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] curl: upgrading to 8.11.0 FAILED
Message-ID: <010101934123d218-beecd961-efe6-4765-9c72-6b03df05a06e-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:18:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207358

--===============2714354314675987101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *curl* to *8.11.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-curl-upgrade-8.10.1-8.11.0.patch
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
From 95da400a8fbfb60f4bc26b1840c320a1fbf5ef49 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 18 Nov 2024 11:13:57 +0000
Subject: [PATCH] curl: upgrade 8.10.1 -> 8.11.0

---
 meta/recipes-support/curl/curl/no-test-timeout.patch        | 6 +++---
 .../recipes-support/curl/{curl_8.10.1.bb => curl_8.11.0.bb} | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/curl/{curl_8.10.1.bb => curl_8.11.0.bb} (98%)

diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/recipes-support/curl/curl/no-test-timeout.patch
index 7122b6f043..86761b9bcf 100644
--- a/meta/recipes-support/curl/curl/no-test-timeout.patch
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -1,4 +1,4 @@
-From 42cddb52e821cfc2f09f1974742714e5f2f1856e Mon Sep 17 00:00:00 2001
+From 5a45325ff8d204b6e9603affdd3a2f4153c9a7c7 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 15 Mar 2024 14:37:37 +0000
 Subject: [PATCH] Set the max-time timeout to 600 so the timeout is 10 minutes
@@ -11,10 +11,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/servers.pm b/tests/servers.pm
-index d4472d5..9999938 100644
+index 37519ee..8524349 100644
 --- a/tests/servers.pm
 +++ b/tests/servers.pm
-@@ -120,7 +120,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
+@@ -122,7 +122,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
  my $sshderror;   # for socks server, ssh daemon version error
  my %doesntrun;    # servers that don't work, identified by pidfile
  my %PORT = (nolisten => 47); # port we use for a local non-listening service
diff --git a/meta/recipes-support/curl/curl_8.10.1.bb b/meta/recipes-support/curl/curl_8.11.0.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.10.1.bb
rename to meta/recipes-support/curl/curl_8.11.0.bb
index 0252d4475e..87cab8e1a7 100644
--- a/meta/recipes-support/curl/curl_8.10.1.bb
+++ b/meta/recipes-support/curl/curl_8.11.0.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
     file://disable-tests \
     file://no-test-timeout.patch \
 "
-SRC_URI[sha256sum] = "73a4b0e99596a09fa5924a4fb7e4b995a85fda0d18a2c02ab9cf134bebce04ee"
+SRC_URI[sha256sum] = "db59cf0d671ca6e7f5c2c5ec177084a33a79e04c97e71cf183a5cdea235054eb"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.44.1


--===============2714354314675987101==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-curl-upgrade-8.10.1-8.11.0.patch"

RnJvbSA5NWRhNDAwYThmYmZiNjBmNGJjMjZiMTg0MGMzMjBhMWZiZjVlZjQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTggTm92IDIwMjQgMTE6MTM6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
dXJsOiB1cGdyYWRlIDguMTAuMSAtPiA4LjExLjAKCi0tLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Y3VybC9jdXJsL25vLXRlc3QtdGltZW91dC5wYXRjaCAgICAgICAgfCA2ICsrKy0tLQogLi4uL3Jl
Y2lwZXMtc3VwcG9ydC9jdXJsL3tjdXJsXzguMTAuMS5iYiA9PiBjdXJsXzguMTEuMC5iYn0gfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL3tjdXJsXzguMTAuMS5iYiA9PiBjdXJsXzgu
MTEuMC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1
cmwvbm8tdGVzdC10aW1lb3V0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJs
L25vLXRlc3QtdGltZW91dC5wYXRjaAppbmRleCA3MTIyYjZmMDQzLi44Njc2MWI5YmNmIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmwvbm8tdGVzdC10aW1lb3V0LnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybC9uby10ZXN0LXRpbWVvdXQu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQyY2RkYjUyZTgyMWNmYzJmMDlmMTk3NDc0Mjcx
NGU1ZjJmMTg1NmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDVhNDUzMjVmZjhkMjA0
YjZlOTYwM2FmZmRkM2EyZjQxNTNjOWE3YzcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERhdGU6IEZyaSwgMTUgTWFyIDIw
MjQgMTQ6Mzc6MzcgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gU2V0IHRoZSBtYXgtdGltZSB0aW1l
b3V0IHRvIDYwMCBzbyB0aGUgdGltZW91dCBpcyAxMCBtaW51dGVzCkBAIC0xMSwxMCArMTEsMTAg
QEAgU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQg
YS90ZXN0cy9zZXJ2ZXJzLnBtIGIvdGVzdHMvc2VydmVycy5wbQotaW5kZXggZDQ0NzJkNS4uOTk5
OTkzOCAxMDA2NDQKK2luZGV4IDM3NTE5ZWUuLjg1MjQzNDkgMTAwNjQ0CiAtLS0gYS90ZXN0cy9z
ZXJ2ZXJzLnBtCiArKysgYi90ZXN0cy9zZXJ2ZXJzLnBtCi1AQCAtMTIwLDcgKzEyMCw3IEBAIG15
ICRzc2hkdmVyc3RyOyAgIyBmb3Igc29ja3Mgc2VydmVyLCBzc2ggZGFlbW9uIHZlcnNpb24gc3Ry
aW5nCitAQCAtMTIyLDcgKzEyMiw3IEBAIG15ICRzc2hkdmVyc3RyOyAgIyBmb3Igc29ja3Mgc2Vy
dmVyLCBzc2ggZGFlbW9uIHZlcnNpb24gc3RyaW5nCiAgbXkgJHNzaGRlcnJvcjsgICAjIGZvciBz
b2NrcyBzZXJ2ZXIsIHNzaCBkYWVtb24gdmVyc2lvbiBlcnJvcgogIG15ICVkb2VzbnRydW47ICAg
ICMgc2VydmVycyB0aGF0IGRvbid0IHdvcmssIGlkZW50aWZpZWQgYnkgcGlkZmlsZQogIG15ICVQ
T1JUID0gKG5vbGlzdGVuID0+IDQ3KTsgIyBwb3J0IHdlIHVzZSBmb3IgYSBsb2NhbCBub24tbGlz
dGVuaW5nIHNlcnZpY2UKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3Vy
bF84LjEwLjEuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfOC4xMS4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwv
Y3VybF84LjEwLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybF84
LjExLjAuYmIKaW5kZXggMDI1MmQ0NDc1ZS4uODdjYWI4ZTFhNyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzguMTAuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9jdXJsL2N1cmxfOC4xMS4wLmJiCkBAIC0xNSw3ICsxNSw3IEBAIFNSQ19VUkkgPSAiIFwK
ICAgICBmaWxlOi8vZGlzYWJsZS10ZXN0cyBcCiAgICAgZmlsZTovL25vLXRlc3QtdGltZW91dC5w
YXRjaCBcCiAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzNhNGIwZTk5NTk2YTA5ZmE1OTI0YTRm
YjdlNGI5OTVhODVmZGEwZDE4YTJjMDJhYjljZjEzNGJlYmNlMDRlZSIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJkYjU5Y2YwZDY3MWNhNmU3ZjVjMmM1ZWMxNzcwODRhMzNhNzllMDRjOTdlNzFjZjE4
M2E1Y2RlYTIzNTA1NGViIgogCiAjIEN1cmwgaGFzIHVzZWQgbWFueSBuYW1lcyBvdmVyIHRoZSB5
ZWFycy4uLgogQ1ZFX1BST0RVQ1QgPSAiaGF4eDpjdXJsIGhheHg6bGliY3VybCBjdXJsOmN1cmwg
Y3VybDpsaWJjdXJsIGxpYmN1cmw6bGliY3VybCBkYW5pZWxfc3RlbmJlcmc6Y3VybCIKLS0gCjIu
NDQuMQoK

--===============2714354314675987101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1880 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:0409fa79a02bc8d47acf6cb67f526ac7ef124ce2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 368 Local 184 Mirrors 0 Missed 184 Current 376 (50% match, 75% complete)
Removing 4 stale sstate objects for arch x86_64...done.
Removing 63 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch allarch...done.
Removing 12 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 398 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 399 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 402 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 403 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 406 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 410 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 417 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 422 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 425 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 426 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 429 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 430 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 433 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 436 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 439 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 442 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 445 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 448 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 449 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 456 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.40.bb:do_create_spdx_setscene)
NOTE: Running setscene task 457 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 459 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 479 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 487 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_256.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 490 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-33-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 491 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 495 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 500 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-locale-2.40+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 512 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 519 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-33-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 524 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_256.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 527 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 530 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 533 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 534 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 539 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 543 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 546 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 551 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 552 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 555 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 558 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 563 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 566 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 569 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-locale-2.40+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 572 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 573 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 574 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 579 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 580 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.13.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 581 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 584 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 587 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 588 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 591 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 592 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 595 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.13.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 598 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 601 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 604 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-locale-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 605 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 610 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 615 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 616 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 617 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 618 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 620 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 621 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 626 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 631 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_stash_locale_setscene)
NOTE: Running setscene task 632 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 634 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 635 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 638 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 639 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 665 of 744 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 670 of 744 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.82.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perlcross-native-1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 190 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_fetch)
NOTE: recipe perlcross-native-1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running noexec task 361 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.10-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_fetch: Succeeded
NOTE: Running noexec task 474 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_fetch)
NOTE: Running task 480 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: Running task 486 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 488 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_unpack)
NOTE: Running task 489 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 506 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_fetch)
NOTE: Running task 512 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 520 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_fetch)
NOTE: Running task 522 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_fetch)
NOTE: Running task 524 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 736 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running task 541 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_recipe_qa)
NOTE: Running task 601 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: Running task 603 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_fetch)
NOTE: Running task 605 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 654 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: Running task 660 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_fetch)
NOTE: recipe gdbm-1.24-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe xz-5.6.3-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_unpack: Started
NOTE: recipe glibc-2.40+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_fetch: Succeeded
NOTE: Running setscene task 737 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 738 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.6.3-r0: task do_fetch: Succeeded
NOTE: Running task 661 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_unpack)
NOTE: recipe expat-2.6.4-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_fetch: Succeeded
NOTE: Running task 662 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_unpack)
NOTE: Running task 664 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: Running task 665 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_unpack)
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Started
NOTE: Running task 666 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe openssl-3.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 667 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_unpack)
NOTE: recipe curl-native-8.11.0-r0: task do_recipe_qa: Started
NOTE: Running task 702 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_fetch: Started
NOTE: Running task 703 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe libtirpc-1.3.5-r0: task do_unpack: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 704 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 705 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe gdbm-1.24-r0: task do_unpack: Started
NOTE: recipe openssl-3.3.1-r0: task do_unpack: Started
NOTE: recipe glibc-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_fetch: Started
NOTE: Running task 706 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_unpack)
NOTE: Running task 707 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: Running task 708 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_fetch)
NOTE: recipe expat-2.6.4-r0: task do_unpack: Started
NOTE: recipe curl-native-8.11.0-r0: task do_recipe_qa: Succeeded
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_recipe_qa unihash changed to 672cb4c4bf32514b9706dde63d8a4cb8e1c9fe0973838595ef83fc8938cafc06
NOTE: recipe glibc-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe expat-2.6.4-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 575 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 734 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 709 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 710 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_patch)
NOTE: Running task 712 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_patch)
NOTE: Running task 713 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_patch)
NOTE: Running task 714 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_fetch)
NOTE: Running task 715 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: Running task 716 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_patch)
NOTE: Running task 721 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 722 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_fetch)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_patch: Started
NOTE: recipe glibc-2.40+git-r0: task do_fetch: Started
NOTE: recipe curl-native-8.11.0-r0: task do_fetch: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 726 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_fetch)
NOTE: recipe glibc-2.40+git-r0: task do_fetch: Succeeded
NOTE: recipe curl-native-8.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 727 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_unpack)
NOTE: Running task 728 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_unpack)
NOTE: recipe expat-2.6.4-r0: task do_patch: Started
NOTE: recipe xz-5.6.3-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe gdbm-1.24-r0: task do_patch: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 729 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 746 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_unpack)
NOTE: recipe glibc-2.40+git-r0: task do_unpack: Started
NOTE: recipe curl-native-8.11.0-r0: task do_unpack: Started
NOTE: recipe python3-3.13.0-r0: task do_fetch: Started
NOTE: recipe xz-5.6.3-r0: task do_patch: Succeeded
NOTE: Running task 751 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_fetch)
NOTE: recipe python3-3.13.0-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Started
NOTE: recipe expat-2.6.4-r0: task do_patch: Succeeded
NOTE: Running task 796 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_generate_toolchain_file)
NOTE: Running task 815 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 816 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_patch)
NOTE: recipe cracklib-2.10.2-r0: task do_fetch: Started
NOTE: Running task 819 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_unpack)
NOTE: recipe openssl-3.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 820 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_patch)
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe curl-native-8.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.24-r0: task do_patch: Succeeded
NOTE: Running task 821 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_patch)
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Started
NOTE: Running task 823 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_unpack: Started
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 824 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: Running task 826 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe expat-2.6.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_patch: Started
NOTE: Running task 827 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 828 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_unpack)
NOTE: recipe cracklib-2.10.2-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: Running task 829 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_unpack)
NOTE: recipe libffi-3.4.6-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: Running task 830 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_unpack: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_patch: Started
NOTE: recipe curl-native-8.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 831 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_patch)
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_unpack: Started
NOTE: Running task 845 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_unpack)
NOTE: recipe curl-native-8.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_unpack: Succeeded
NOTE: Running task 846 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_patch)
NOTE: Running task 847 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 895 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_fetch)
NOTE: recipe cracklib-2.10.2-r0: task do_unpack: Started
NOTE: recipe curl-native-8.11.0-r0: task do_patch: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_patch: Started
NOTE: recipe openssl-3.3.1-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_patch: Succeeded
NOTE: Running task 906 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_fetch)
NOTE: Running task 921 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: Running task 925 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.4.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 928 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_fetch)
NOTE: recipe libpcre2-10.44-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Started
NOTE: recipe curl-native-8.11.0-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: Running task 929 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 930 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_unpack)
NOTE: Running task 931 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: Running task 933 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_fetch)
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 934 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe libedit-20240808-3.1-r1: task do_patch: Succeeded
NOTE: recipe libxml2-2.13.4-r0: task do_fetch: Started
NOTE: Running task 936 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Started
NOTE: recipe libxml2-2.13.4-r0: task do_fetch: Succeeded
NOTE: Running task 937 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.4.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe curl-native-8.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: recipe libpcre2-10.44-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_fetch: Started
NOTE: Running task 938 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 939 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: recipe curl-native-8.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.13.4-r0: task do_unpack: Started
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_deploy_source_date_epoch unihash changed to 92f4af1007ed1a35108202c4322ee79e9b12405bb35b091309c995df0f7adada
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe cracklib-2.10.2-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 737 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running task 940 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_configure)
NOTE: Running task 941 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_patch)
NOTE: Running task 942 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_patch)
NOTE: Running task 943 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_patch)
NOTE: Running task 945 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_patch)
NOTE: Running task 954 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_unpack)
NOTE: Running task 955 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_unpack)
NOTE: Running task 993 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_fetch)
NOTE: recipe cracklib-2.10.2-r0: task do_patch: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Started
NOTE: recipe libunistring-1.3-r0: task do_fetch: Started
NOTE: recipe curl-native-8.11.0-r0: task do_configure: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: Running task 995 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_fetch)
NOTE: Running task 998 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_fetch)
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_patch: Started
NOTE: Running task 1003 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: Running task 1005 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_fetch)
NOTE: recipe libpam-1.6.1-r0: task do_patch: Started
NOTE: recipe util-linux-2.40.2-r0: task do_unpack: Started
NOTE: recipe cracklib-2.10.2-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_fetch: Started
NOTE: Running task 1007 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_fetch)
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_fetch: Succeeded
NOTE: Running task 1008 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_recipe_qa)
NOTE: Running task 1011 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_fetch)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1012 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_fetch)
NOTE: recipe libpam-1.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1016 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_unpack)
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.44-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.11.0-r0: task do_recipe_qa: Started
NOTE: Running task 1017 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_patch)
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Succeeded
NOTE: Running task 1020 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_fetch)
NOTE: recipe libunistring-1.3-r0: task do_unpack: Started
NOTE: recipe perl-5.40.0-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_fetch: Started
NOTE: recipe curl-8.11.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_fetch: Started
NOTE: recipe perl-5.40.0-r0: task do_fetch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_recipe_qa unihash changed to da86f17d9ba8b5f222929921847a3dcadc66dc0a1961f126eb9fa5cb8243a2cd
NOTE: Running task 1021 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_fetch)
NOTE: Running task 1022 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe libpcre2-10.44-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_fetch: Succeeded
NOTE: Running task 1023 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_fetch: Succeeded
NOTE: Running task 1024 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_unpack)
NOTE: recipe curl-8.11.0-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.44-r0: task do_patch: Succeeded
NOTE: Running task 1033 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_unpack)
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Succeeded
NOTE: Running task 1034 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_patch)
NOTE: recipe curl-8.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 1035 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe libxml2-2.13.4-r0: task do_unpack: Succeeded
NOTE: Running task 1036 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.4.bb:do_patch)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_unpack: Started
NOTE: Running task 1037 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_unpack)
NOTE: recipe libunistring-1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1038 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_patch: Succeeded
NOTE: Running task 1040 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_unpack)
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Started
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Started
NOTE: recipe libxml2-2.13.4-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Started
NOTE: recipe libunistring-1.3-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1041 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_patch)
NOTE: recipe curl-8.11.0-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Succeeded
NOTE: Running task 1042 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_unpack)
NOTE: recipe util-linux-2.40.2-r0: task do_unpack: Succeeded
NOTE: Running task 1043 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_patch)
NOTE: recipe libxml2-2.13.4-r0: task do_patch: Succeeded
NOTE: Running task 1045 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_unpack)
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 1046 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_patch)
NOTE: recipe libunistring-1.3-r0: task do_patch: Succeeded
NOTE: Running task 1049 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_fetch)
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Succeeded
NOTE: Running task 1050 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_patch)
NOTE: recipe base-passwd-3.6.4-r0: task do_unpack: Started
NOTE: recipe util-linux-2.40.2-r0: task do_patch: Started
NOTE: recipe perl-5.40.0-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_fetch: Succeeded
NOTE: Running task 1052 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: Running task 1055 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_unpack)
NOTE: recipe wayland-1.23.1-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_unpack: Succeeded
NOTE: Running task 1056 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_patch)
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Succeeded
NOTE: Running task 1057 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe libseccomp-2.5.5-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_unpack: Succeeded
NOTE: Running task 1058 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_patch)
NOTE: recipe wayland-1.23.1-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: Running task 1073 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: Running task 1074 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1079 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1080 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe shadow-4.16.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_patch: Started
NOTE: recipe shadow-4.16.0-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_patch: Started
NOTE: Running task 1081 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: recipe util-macros-1_1.20.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-3.13.0-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_patch: Succeeded
NOTE: Running task 1082 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_patch)
NOTE: recipe util-macros-1_1.20.1-r0: task do_unpack: Succeeded
NOTE: Running task 1084 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_write_config)
NOTE: recipe curl-8.11.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1085 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_patch)
NOTE: Running task 1086 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_patch)
NOTE: Running task 1087 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_patch)
NOTE: Running task 1092 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_write_config)
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe util-linux-2.40.2-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_patch: Started
NOTE: Running task 1095 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_write_config)
NOTE: recipe util-macros-1_1.20.1-r0: task do_patch: Started
NOTE: recipe python3-3.13.0-r0: task do_patch: Started
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Started
NOTE: recipe curl-8.11.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_write_config: Started
NOTE: Running task 1096 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_patch)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_write_config: Started
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Succeeded
NOTE: Running task 1097 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: Running task 1100 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_write_config: Succeeded
NOTE: Running task 1101 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libseccomp-2.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 1102 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_patch)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_write_config: Succeeded
NOTE: Running task 1112 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe curl-8.11.0-r0: task do_patch: Succeeded
NOTE: Running task 1113 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.16.0-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_patch: Succeeded
NOTE: Running task 1115 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1124 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_patch: Started
NOTE: Running task 1135 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: Running task 1137 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 1138 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_fetch)
NOTE: Running task 1139 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: recipe curl-8.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1140 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe base-passwd-3.6.4-r0: task do_patch: Succeeded
NOTE: Running task 1142 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: recipe libseccomp-2.5.5-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Started
NOTE: Running task 1147 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: Running task 1150 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe perl-5.40.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: Running task 1151 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe curl-8.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_deploy_source_date_epoch unihash changed to eab57a9486144d1a7c43dfc83cfa28325e5f690a427e2034ea191881180ee2b2
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 1153 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: Running task 1175 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: Running task 1177 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1182 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1183 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1184 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 1185 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_unpack)
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_fetch: Started
NOTE: Running task 1186 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe ca-certificates-20240203-r0: task do_fetch: Succeeded
NOTE: Running task 1187 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.43-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1204 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: Running task 1205 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running task 1206 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1207 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1208 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_fetch)
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 1209 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1210 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1211 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_patch: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1226 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_patch)
NOTE: Running task 1227 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_patch)
NOTE: Running task 1228 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_patch)
NOTE: Running task 1229 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: Running task 1230 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_fetch)
NOTE: Running task 1231 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 1232 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_fetch)
NOTE: Running task 1233 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_fetch)
NOTE: Running task 1234 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_fetch)
NOTE: Running task 1241 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: Running task 1242 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_unpack)
NOTE: Running task 1246 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_unpack)
NOTE: Running task 1285 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Started
NOTE: recipe libcap-2.70-r0: task do_fetch: Started
NOTE: recipe kmod-33-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_unpack: Started
NOTE: recipe libcap-2.70-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_unpack: Started
NOTE: Running task 1286 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_unpack)
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: Running task 1287 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_unpack)
NOTE: recipe shadow-4.16.0-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Started
NOTE: recipe ca-certificates-20240203-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe libcap-2.70-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1289 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.7.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.43-r0: task do_unpack: Succeeded
NOTE: Running task 1290 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_patch)
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1291 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_unpack)
NOTE: Running task 1292 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe ca-certificates-20240203-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1293 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1296 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: Running task 1303 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: Running task 1319 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_write_config)
NOTE: recipe shadow-4.16.0-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.70-r0: task do_unpack: Succeeded
NOTE: Running task 1322 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1323 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_patch)
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Started
NOTE: recipe ca-certificates-20240203-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1324 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_patch)
NOTE: recipe wayland-protocols-1.38-r0: task do_write_config: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_256.7-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_write_config: Succeeded
NOTE: Running task 1325 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.43-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.70-r0: task do_patch: Started
NOTE: Running task 1338 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_prepare_recipe_sysroot)
NOTE: recipe update-rc.d-0.8+git-r0: task do_fetch: Succeeded
NOTE: Running task 1339 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_unpack)
NOTE: recipe wayland-protocols-1.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1340 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_write_config: Started
NOTE: Running task 1361 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe ca-certificates-20240203-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe initscripts-1.0-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_patch: Started
NOTE: Running task 1363 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_write_config)
NOTE: Running task 1365 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe ca-certificates-20240203-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1366 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.43-r0: task do_write_config: Succeeded
NOTE: Running task 1369 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: recipe update-rc.d-0.8+git-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1371 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_fetch)
NOTE: recipe wayland-protocols-1.38-r0: task do_configure: Started
NOTE: Running task 1372 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_write_config: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_256.7-r0: task do_fetch: Succeeded
NOTE: Running task 1373 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.7.bb:do_unpack)
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe libcap-2.70-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe procps-4.0.4-r0: task do_fetch: Started
NOTE: Running task 1401 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.7.bb:do_warn_musl)
NOTE: Running task 1402 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.7.bb:do_write_config)
NOTE: recipe initscripts-1.0-r0: task do_configure: Started
NOTE: recipe ca-certificates-20240203-r0: task do_patch: Succeeded
NOTE: Running task 1404 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-1_256.7-r0: task do_unpack: Started
NOTE: Running task 1458 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: Running task 1462 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_collect_spdx_deps)
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1463 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch)
NOTE: recipe systemd-1_256.7-r0: task do_write_config: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: Running task 1464 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe linux-libc-headers-6.10-r0: task do_unpack: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_collect_spdx_deps: Started
NOTE: recipe ca-certificates-20240203-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: Running task 1465 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_patch)
NOTE: recipe procps-4.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1466 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_collect_spdx_deps)
NOTE: recipe ca-certificates-20240203-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1467 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: Running task 1468 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_unpack)
NOTE: recipe systemd-1_256.7-r0: task do_write_config: Succeeded
NOTE: Running task 1470 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe systemd-1_256.7-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_256.7-r0: task do_warn_musl: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe ca-certificates-20240203-r0: task do_configure: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1471 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_compile)
NOTE: Running task 1472 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe linux-libc-headers-6.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_patch: Succeeded
NOTE: Running noexec task 1474 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_configure)
NOTE: Running noexec task 1475 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_compile)
NOTE: Running task 1476 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_install)
NOTE: recipe update-rc.d-0.8+git-r0: task do_unpack: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_unpack: Started
NOTE: Running task 1477 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_patch)
NOTE: recipe curl-8.11.0-r0: task do_populate_lic: Started
NOTE: recipe ca-certificates-20240203-r0: task do_compile: Started
NOTE: recipe initscripts-1.0-r0: task do_install: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_patch: Started
NOTE: recipe zstd-1.5.6-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_patch: Succeeded
NOTE: recipe curl-8.11.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 1479 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: Running task 1481 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_configure)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_populate_lic unihash changed to e72c971c43ddf87238c02dc814f20b89017b0db85c48e34fa5252701f27fc9d7
NOTE: recipe kmod-33-r0: task do_fetch: Succeeded
NOTE: Running task 1482 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_unpack)
NOTE: recipe update-rc.d-0.8+git-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe kmod-33-r0: task do_unpack: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_configure: Succeeded
NOTE: Running task 1483 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_compile)
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: recipe wayland-protocols-1.38-r0: task do_configure: Succeeded
NOTE: Running task 1484 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: Running task 1485 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_compile)
NOTE: recipe update-rc.d-0.8+git-r0: task do_compile: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_compile: Succeeded
NOTE: Running task 1486 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_install)
NOTE: recipe ca-certificates-20240203-r0: task do_compile: Succeeded
NOTE: Running task 1487 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_install)
NOTE: recipe update-rc.d-0.8+git-r0: task do_install: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_unpack: Succeeded
NOTE: recipe wayland-protocols-1.38-r0: task do_compile: Started
NOTE: Running task 1489 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_patch)
NOTE: recipe ca-certificates-20240203-r0: task do_install: Started
NOTE: recipe procps-4.0.4-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_install: Succeeded
NOTE: recipe kmod-33-r0: task do_unpack: Succeeded
NOTE: Running task 1492 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_patch)
NOTE: recipe procps-4.0.4-r0: task do_patch: Succeeded
NOTE: recipe kmod-33-r0: task do_patch: Started
NOTE: recipe systemd-1_256.7-r0: task do_unpack: Succeeded
NOTE: Running task 1494 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.7.bb:do_patch)
NOTE: recipe wayland-protocols-1.38-r0: task do_compile: Succeeded
NOTE: Running task 1495 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_install)
NOTE: recipe systemd-1_256.7-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_install: Started
NOTE: recipe kmod-33-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_install: Succeeded
NOTE: recipe systemd-1_256.7-r0: task do_patch: Succeeded
NOTE: recipe wayland-protocols-1.38-r0: task do_install: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_install: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_install: Succeeded
NOTE: Running task 1515 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.40+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.40+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1516 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_configure)
NOTE: recipe glibc-2.40+git-r0: task do_configure: Started
NOTE: recipe glibc-2.40+git-r0: task do_configure: Succeeded
NOTE: Running task 1517 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_compile)
NOTE: recipe glibc-2.40+git-r0: task do_compile: Started
NOTE: recipe curl-native-8.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1518 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_compile)
NOTE: recipe curl-native-8.11.0-r0: task do_compile: Started
NOTE: recipe curl-native-8.11.0-r0: task do_compile: Succeeded
NOTE: Running task 1519 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_install)
NOTE: recipe curl-native-8.11.0-r0: task do_install: Started
NOTE: recipe curl-native-8.11.0-r0: task do_install: Succeeded
NOTE: Running task 1520 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_populate_sysroot)
NOTE: recipe curl-native-8.11.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-native-8.11.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1521 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1522 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_configure)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1523 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_compile)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1524 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_install)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_install: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 1525 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1526 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-native-0.191-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-native-0.191-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1527 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_configure)
NOTE: recipe elfutils-native-0.191-r0: task do_configure: Started
NOTE: recipe elfutils-native-0.191-r0: task do_configure: Succeeded
NOTE: Running task 1528 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_compile)
NOTE: recipe elfutils-native-0.191-r0: task do_compile: Started
NOTE: recipe elfutils-native-0.191-r0: task do_compile: Succeeded
NOTE: Running task 1529 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_install)
NOTE: recipe elfutils-native-0.191-r0: task do_install: Started
NOTE: recipe elfutils-native-0.191-r0: task do_install: Succeeded
NOTE: Running task 1530 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_populate_sysroot)
NOTE: recipe elfutils-native-0.191-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-native-0.191-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1531 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1532 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_prepare_recipe_sysroot)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1533 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_configure)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_configure: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1534 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_configure)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1535 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_compile)
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_configure: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_compile: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1536 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_install)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_install: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_install: Succeeded
NOTE: Running task 1537 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1538 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_compile)
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_compile: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1539 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_install)
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_install: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_install: Succeeded
NOTE: Running task 1540 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_populate_sysroot)
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1541 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_package)
NOTE: Running task 1542 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1543 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_package)
NOTE: Running task 1544 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_package)
NOTE: Running task 1545 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: Running task 1546 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_package)
NOTE: recipe ca-certificates-20240203-r0: task do_package: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_package: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_package: Started
NOTE: recipe initscripts-1.0-r0: task do_package: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_package unihash changed to cd8e8ca47211f426d23aae0eb4b31eb3d41e1d19ab5c47f4cf1f79f34104e49b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.38-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe update-rc.d-0.8+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_package unihash changed to 31b98198f0cd11b406bbb3d999554fcf59e70c7143cc08ad43561266c4119609
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata became valid
NOTE: recipe ca-certificates-20240203-r0: task do_package: Succeeded
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_package unihash changed to 1572f3f7fcf651358e74fce9070447d3c35c47d8a2fa2b3c22f7c7a2a6cbcd38
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_package_write_deb became valid
NOTE: Running setscene task 739 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_create_spdx_setscene)
NOTE: Running setscene task 740 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_package_qa_setscene)
NOTE: Running setscene task 741 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 742 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_package_write_ipk_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_package_qa_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_package_write_deb_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package unihash changed to cca3242b3e025ae639454c4dc1ec455653d9f6c08e58d3644ab5e6abc19c3f2b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata became valid
NOTE: Running setscene task 743 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package unihash changed to f14b4cba8995efdba7c0c76674148e200a7470b465bd5ceac2b57da81d269f8a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glibc-2.40+git-r0: task do_compile: Succeeded
NOTE: Running task 1554 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_install)
NOTE: recipe glibc-2.40+git-r0: task do_install: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_package unihash changed to 9fc570bdc3ccb2d75cf002eb70cf266c7cf78339bbfe020627b71e4a824135d4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_create_spdx became valid
NOTE: Running setscene task 670 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1561 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_collect_spdx_deps)
NOTE: recipe glibc-2.40+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe glibc-2.40+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1564 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1565 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_package)
NOTE: recipe libgcc-14.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.40+git-r0: task do_package: Started
NOTE: recipe libgcc-14.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1566 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_configure)
NOTE: recipe libgcc-14.2.0-r0: task do_configure: Started
NOTE: recipe libgcc-14.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1567 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_compile)
NOTE: recipe libgcc-14.2.0-r0: task do_compile: Started
NOTE: recipe libgcc-14.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1568 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_install)
NOTE: recipe libgcc-14.2.0-r0: task do_install: Started
NOTE: recipe libgcc-14.2.0-r0: task do_install: Succeeded
NOTE: Running task 1569 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_multilib_install)
NOTE: recipe libgcc-14.2.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-14.2.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 1570 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_extra_symlinks)
NOTE: recipe libgcc-14.2.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-14.2.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1572 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1573 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_configure)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_configure: Started
NOTE: recipe glibc-2.40+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_package unihash changed to b3653c481df7f705d7aae20ac2dbce1f00d54ff8d01c68a02014c7ac14fc6b95
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_create_spdx became valid
NOTE: Running setscene task 672 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.40+git-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1575 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_package)
NOTE: Running task 1577 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_collect_spdx_deps)
NOTE: recipe libgcc-14.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcc-14.2.0-r0: task do_package: Started
NOTE: recipe libgcc-14.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_package unihash changed to 71d021c679118cf36abf48a973384668f480dee0e2b1c89a55f352ada3501934
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata became valid
NOTE: Running setscene task 674 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1580 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_collect_spdx_deps)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1581 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_compile)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_compile: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1582 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_install)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_install: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_install: Succeeded
NOTE: Running task 1589 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1590 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1591 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1592 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1593 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1594 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1595 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1596 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1597 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1598 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1599 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_package)
NOTE: Running task 1600 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1601 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1602 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1603 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1604 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1605 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure)
NOTE: recipe base-passwd-3.6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1606 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_configure)
NOTE: Running task 1607 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1608 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1609 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_configure)
NOTE: Running task 1610 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_configure)
NOTE: recipe libtirpc-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1611 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_configure)
NOTE: recipe libseccomp-2.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1612 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_configure)
NOTE: recipe util-macros-1_1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1613 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_configure: Started
NOTE: Running task 1614 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_configure)
NOTE: recipe expat-2.6.4-r0: task do_configure: Started
NOTE: recipe libffi-3.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1615 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_configure)
NOTE: recipe libunistring-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_configure: Started
NOTE: Running task 1616 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_configure)
NOTE: recipe libtirpc-1.3.5-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1617 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_configure)
NOTE: recipe base-passwd-3.6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Started
NOTE: Running task 1618 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_configure)
NOTE: recipe gdbm-1.24-r0: task do_configure: Started
NOTE: Running task 1619 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_configure)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_configure: Started
NOTE: recipe libffi-3.4.6-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_configure: Started
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_configure: Started
NOTE: Running task 1620 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_compile)
NOTE: recipe libunistring-1.3-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1621 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_install)
NOTE: recipe zlib-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1622 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure_ptest_base)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1623 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile)
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1624 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_configure)
NOTE: recipe zlib-1.3.1-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 1626 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1627 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1628 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1629 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1630 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_configure)
NOTE: recipe openssl-3.3.1-r0: task do_configure: Started
NOTE: recipe xz-5.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1631 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_configure)
NOTE: recipe expat-2.6.4-r0: task do_configure: Succeeded
NOTE: Running task 1632 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile_ptest_base)
NOTE: recipe xz-5.6.3-r0: task do_configure: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1633 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install)
NOTE: recipe util-macros-1_1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 1634 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_configure_ptest_base)
NOTE: recipe expat-2.6.4-r0: task do_configure_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_configure: Succeeded
NOTE: Running task 1635 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.6.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1636 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_compile)
NOTE: recipe expat-2.6.4-r0: task do_compile: Started
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 1637 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install_ptest_base)
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1638 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_configure)
NOTE: recipe ncurses-6.5-r0: task do_configure: Started
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1640 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe cracklib-2.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cracklib-2.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1641 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_configure)
NOTE: recipe cracklib-2.10.2-r0: task do_configure: Started
NOTE: recipe expat-2.6.4-r0: task do_compile: Succeeded
NOTE: Running task 1642 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_compile_ptest_base)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_configure: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_compile_ptest_base: Started
NOTE: Running task 1643 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_compile)
NOTE: recipe expat-2.6.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1644 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_install)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1645 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe expat-2.6.4-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1646 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe expat-2.6.4-r0: task do_install: Succeeded
NOTE: Running task 1647 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_install_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe expat-2.6.4-r0: task do_install_ptest_base: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_package: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1649 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_compile)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_package unihash changed to b0b9f4689b37178d1029847fff5e0e643390d7755fffc30a0e84addff031dc59
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata became valid
NOTE: Running setscene task 686 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_compile: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 688 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 742 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1651 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1652 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_compile)
NOTE: recipe libcap-ng-0.8.5-r0: task do_configure: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1653 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_compile)
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1654 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_configure)
NOTE: Running task 1655 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1656 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe libtirpc-1.3.5-r0: task do_compile: Started
NOTE: recipe attr-2.5.2-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1657 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1658 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_install)
NOTE: recipe bash-completion-2.14.0-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1659 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1661 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.24-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1662 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_configure_ptest_base)
NOTE: recipe libpcre2-10.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.24-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.24-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1663 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_compile)
NOTE: recipe libtirpc-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1664 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_install)
NOTE: recipe libcap-ng-0.8.5-r0: task do_compile: Succeeded
NOTE: Running task 1665 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_install)
NOTE: recipe libffi-3.4.6-r0: task do_configure: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_compile: Started
NOTE: Running task 1666 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_compile)
NOTE: recipe libcap-ng-0.8.5-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_install: Started
NOTE: recipe libffi-3.4.6-r0: task do_compile: Started
NOTE: recipe libpcre2-10.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1667 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package unihash changed to b6a453da196407546c733f7a7bea0db9275c40f1f7aaa7d6582535e8d2872c08
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx became valid
NOTE: Running setscene task 743 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1669 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package)
NOTE: recipe libtirpc-1.3.5-r0: task do_install: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_package: Started
NOTE: Running task 1671 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_install: Succeeded
NOTE: Running task 1673 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_compile)
NOTE: recipe base-passwd-3.6.4-r0: task do_compile: Started
NOTE: recipe libffi-3.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1674 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_install)
NOTE: recipe libnsl2-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1675 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_configure)
NOTE: recipe libxcrypt-4.4.36-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1676 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_compile)
NOTE: recipe libffi-3.4.6-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_compile: Succeeded
NOTE: Running task 1677 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_install)
NOTE: recipe base-passwd-3.6.4-r0: task do_install: Started
NOTE: recipe openssl-3.3.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1678 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_configure_ptest_base)
NOTE: recipe base-passwd-3.6.4-r0: task do_install: Succeeded
NOTE: Running task 1680 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_configure)
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Started
NOTE: recipe openssl-3.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1681 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_compile)
NOTE: recipe libffi-3.4.6-r0: task do_install: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_configure: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 1682 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_compile)
NOTE: Running task 1684 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_compile)
NOTE: recipe cracklib-2.10.2-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 1685 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_install)
NOTE: recipe util-macros-1_1.20.1-r0: task do_install: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_install: Succeeded
NOTE: Running task 1688 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_configure_ptest_base)
NOTE: recipe libxcrypt-4.4.36-r0: task do_compile: Succeeded
NOTE: Running task 1689 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_install)
NOTE: recipe libseccomp-2.5.5-r0: task do_configure_ptest_base: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_install: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1690 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_compile)
NOTE: recipe gdbm-1.24-r0: task do_compile: Succeeded
NOTE: Running task 1691 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_compile_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_package: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_compile: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package unihash changed to 7394dfd315d255d56745f7fc79d1f45c3fd645fab2e5ebdeb3fc75e5b6952e07
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx became valid
NOTE: recipe gdbm-1.24-r0: task do_compile_ptest_base: Started
NOTE: Running setscene task 715 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_install: Succeeded
NOTE: Running task 1693 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_package)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_package: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1694 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_compile)
NOTE: recipe gdbm-1.24-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_compile: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Started
NOTE: Running task 1695 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_install)
NOTE: Running task 1696 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_install)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1698 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_package)
NOTE: recipe cracklib-2.10.2-r0: task do_install: Started
NOTE: recipe gdbm-1.24-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_package: Started
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Succeeded
NOTE: Running task 1699 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_install)
NOTE: recipe xorgproto-2024.1-r0: task do_install: Started
NOTE: recipe xorgproto-2024.1-r0: task do_install: Succeeded
NOTE: Running task 1701 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_package)
NOTE: recipe libffi-3.4.6-r0: task do_package: Started
NOTE: recipe gdbm-1.24-r0: task do_install: Succeeded
NOTE: Running task 1702 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_install_ptest_base)
NOTE: recipe gdbm-1.24-r0: task do_install_ptest_base: Started
NOTE: recipe gdbm-1.24-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1704 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcrypt-4.4.36-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_package unihash changed to 252206234ffb374e7d3cf77a5917fcc0b6e3295c229b75259a0707dd60c92354
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_packagedata became valid
NOTE: recipe cracklib-2.10.2-r0: task do_install: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_packagedata_setscene)
NOTE: Running task 1706 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcrypt-4.4.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1708 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_package)
NOTE: recipe perl-5.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1709 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_configure)
NOTE: recipe perl-5.40.0-r0: task do_configure: Started
NOTE: recipe cracklib-2.10.2-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_package unihash changed to 7d1e2191aa636ee662355d9b75aac7fd4b64cb54c01f964cf4dac039eef497e8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1710 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_configure)
NOTE: recipe bash-completion-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1712 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_package)
NOTE: recipe libpam-1.6.1-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1714 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.4.6-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_package unihash changed to 8df8daf4345982fd193908df8012f34f856171cf4b24cc4a2580acdaf7aef40d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata became valid
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.2-r0: task do_configure: Succeeded
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running task 1715 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_configure_ptest_base)
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1716 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_compile)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_compile: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1718 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package)
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1719 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_compile: Succeeded
NOTE: Running task 1725 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe attr-2.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1726 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_compile_ptest_base)
NOTE: recipe libnsl2-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: Running task 1727 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_compile)
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1728 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_install)
NOTE: recipe libnsl2-2.0.1-r0: task do_compile: Started
NOTE: recipe attr-2.5.2-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1729 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_install)
NOTE: recipe libpcre2-10.44-r0: task do_configure: Succeeded
NOTE: Running task 1730 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_compile)
NOTE: recipe libnsl2-2.0.1-r0: task do_install: Started
NOTE: recipe libpcre2-10.44-r0: task do_compile: Started
NOTE: recipe xz-5.6.3-r0: task do_configure: Succeeded
NOTE: Running task 1731 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_configure_ptest_base)
NOTE: recipe attr-2.5.2-r0: task do_install: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_configure_ptest_base: Started
NOTE: Running task 1732 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_install_ptest_base)
NOTE: recipe xz-5.6.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1733 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_compile)
NOTE: recipe base-passwd-3.6.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package unihash changed to b89ab0163cc669bb260039672afccfa50655efe939e8917356806c66b36bf5e2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1734 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_package)
NOTE: recipe libnsl2-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1737 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_compile_ptest_base)
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1739 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.6.4-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_compile_ptest_base: Started
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1740 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_configure)
NOTE: recipe acl-2.3.2-r0: task do_configure: Started
NOTE: recipe gdbm-1.24-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_package unihash changed to 5e6de4763a7aaf0da8f754e8b3a5c4ff46156aa2f7a9dbd7a4a70184226aae42
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1742 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package)
NOTE: recipe attr-2.5.2-r0: task do_package: Started
NOTE: recipe cracklib-2.10.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_package unihash changed to 621f030c67967d43441170ce277a038c49f9b6c676e1194c3b5ec6bf0e87b064
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata became valid
NOTE: Running setscene task 733 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to 06058d6e4c2a1a47c8037d5d8060b7477cd1dc6c8dfdffc023c6870d312fff60
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 743 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1744 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package)
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1746 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.6.4-r0: task do_package: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_package unihash changed to 6b11adf1eba2b7406fc1a7930f25f922f6cebcb6114c908fe857429d5187f1e2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata became valid
NOTE: recipe xcb-proto-1.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1748 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1749 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1750 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1751 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_install)
NOTE: recipe libpthread-stubs-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1752 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_configure)
NOTE: recipe xcb-proto-1.17.0-r0: task do_configure: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1753 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_configure)
NOTE: recipe libseccomp-2.5.5-r0: task do_install: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_install: Succeeded
NOTE: Running task 1754 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_configure)
NOTE: recipe libpthread-stubs-0.5-r0: task do_configure: Started
NOTE: recipe attr-2.5.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package unihash changed to 6347ed9e24a0d8a244873ba9b7d25cc68f06ed0e808af28cbdea4f6d1ce7ced5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx became valid
NOTE: Running setscene task 743 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.6.3-r0: task do_compile: Succeeded
NOTE: Running task 1755 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_compile_ptest_base)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_compile_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1757 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_configure: Succeeded
NOTE: Running task 1758 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_compile)
NOTE: recipe xcb-proto-1.17.0-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_compile: Succeeded
NOTE: Running task 1759 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_install)
NOTE: recipe xcb-proto-1.17.0-r0: task do_install: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package unihash changed to 6df1cf26f3d8a990d49c1ba587686e3bf6f5591d0d4b63b460008a9f1ac40ff7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_compile: Succeeded
NOTE: Running task 1760 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_install)
NOTE: recipe libpcre2-10.44-r0: task do_install: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1762 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: recipe libnsl2-2.0.1-r0: task do_package: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_install: Succeeded
NOTE: Running task 1766 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.44-r0: task do_install: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1776 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1777 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_install)
NOTE: recipe glibc-locale-2.40+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.6.3-r0: task do_install: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1778 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_configure)
NOTE: Running noexec task 1779 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_compile)
NOTE: Running task 1780 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_install)
NOTE: recipe xkeyboard-config-2.43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1781 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_configure)
NOTE: recipe glibc-locale-2.40+git-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_configure: Succeeded
NOTE: Running task 1782 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_compile)
NOTE: recipe libpthread-stubs-0.5-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_compile: Succeeded
NOTE: Running task 1783 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_install)
NOTE: recipe libpthread-stubs-0.5-r0: task do_install: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_install: Succeeded
NOTE: Running task 1785 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_package)
NOTE: recipe util-macros-1_1.20.1-r0: task do_package: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package unihash changed to fd31de10fd97ee4ca1608530c2d598e3faa014fd04a83d75c82e971fcbb79fcb
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1787 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package)
NOTE: recipe xorgproto-2024.1-r0: task do_package: Started
NOTE: recipe acl-2.3.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1788 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_configure_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1789 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_compile)
NOTE: recipe acl-2.3.2-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_configure: Succeeded
NOTE: Running task 1790 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_compile)
NOTE: recipe xkeyboard-config-2.43-r0: task do_compile: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1791 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_compile)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_compile: Started
NOTE: recipe xorgproto-2024.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package unihash changed to ebf4b2786726352d72cb2a6d2f653164a09f8a6588e71d19da614ce94b7b79d2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_compile: Succeeded
NOTE: Running task 1792 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_install)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_install: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1794 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe zstd-1.5.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1795 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_configure)
NOTE: recipe acl-2.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1796 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_compile_ptest_base)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_compile: Succeeded
NOTE: Running task 1797 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_install)
NOTE: recipe zstd-1.5.6-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_install: Started
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe zstd-1.5.6-r0: task do_configure: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_package: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_install: Succeeded
NOTE: Running task 1798 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_compile)
NOTE: Running task 1799 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_install_ptest_base)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_package unihash changed to 683a12e4f74e1457e08cf788d00139b1e9850b52244537047f9f5ea1fa26d8b7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_install_ptest_base: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1801 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_install_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1802 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_install)
NOTE: recipe xkeyboard-config-2.43-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1804 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_package)
NOTE: recipe xz-5.6.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_install_ptest_base: Started
NOTE: Running task 1806 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_package)
NOTE: recipe libcap-ng-0.8.5-r0: task do_package: Started
NOTE: recipe xz-5.6.3-r0: task do_package: Started
NOTE: recipe acl-2.3.2-r0: task do_install: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1807 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_compile)
NOTE: recipe libxau-1_1.0.11-r0: task do_compile: Started
NOTE: recipe ncurses-6.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1808 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_compile)
NOTE: recipe ncurses-6.5-r0: task do_compile: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_install: Succeeded
NOTE: Running task 1810 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_package)
NOTE: recipe acl-2.3.2-r0: task do_install: Succeeded
NOTE: Running task 1811 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_install_ptest_base)
NOTE: recipe libxau-1_1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 1812 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_install)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package: Started
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_install: Started
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1818 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_package)
NOTE: recipe xcb-proto-1.17.0-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_install: Succeeded
NOTE: Running task 1820 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package)
NOTE: recipe libseccomp-2.5.5-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_package: Started
NOTE: Running task 1822 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_package)
NOTE: recipe libpthread-stubs-0.5-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_package unihash changed to 9933630844694e57c6c65cd61bb73cc5b958038f71898dd95a352f7d8ce3d539
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_install: Succeeded
NOTE: Running task 1823 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_package)
NOTE: recipe xcb-proto-1.17.0-r0: task do_package: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_package unihash changed to dc2b70ea6a3392856e93a142fbbdd8297f73d85f6fc9cb00413a4bbe8a9d58fd
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running task 1825 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_package)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_package: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_package: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1827 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_package)
NOTE: recipe xkeyboard-config-2.43-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_package: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1828 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_compile)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_package unihash changed to 0d2d6a6f21d40cf32c8a277591d51584083423d5beddd0dcee82ee3db084015d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata became valid
NOTE: recipe libpam-1.6.1-r0: task do_configure: Succeeded
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running task 1829 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_configure_ptest_base)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_package: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1830 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_compile)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package unihash changed to 5afb6b7485a2492cd51a4f64656ee4778bae56c444266ba5dfa038b9b944fe5a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_compile: Started
NOTE: Running task 1832 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_package)
NOTE: recipe libseccomp-2.5.5-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1834 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_package unihash changed to 3a68263abd6e7abacac8954f18205cecc2f82d6865ad3f1beddd2f654c2f68c2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1835 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_install)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_install: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1837 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_collect_spdx_deps)
NOTE: recipe libxcrypt-4.4.36-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1838 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_create_spdx)
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx: Started
NOTE: recipe xz-5.6.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_package unihash changed to 8bbf4f63a90b9003779977b85ebd19bc8f22cdd2ceec825c42a52ee4cb9a1d48
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata became valid
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: Running task 1840 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx: Succeeded
NOTE: Running task 1841 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package)
NOTE: recipe libxcb-1.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1842 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_package: Succeeded
NOTE: Running task 1844 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_collect_spdx_deps)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_package unihash changed to eb5a94d3b2e2259660988f126a7bca2cb709769ecc94529ef7a6c6b991c92c88
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata became valid
NOTE: recipe libxcb-1.17.0-r0: task do_configure: Started
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1845 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_create_spdx)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_create_spdx: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1847 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_collect_spdx_deps)
NOTE: recipe libunistring-1.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libunistring-1.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1848 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_collect_spdx_deps)
NOTE: recipe openssl-3.3.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_create_spdx: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1849 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_collect_spdx_deps)
NOTE: Running task 1852 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_collect_spdx_deps)
NOTE: recipe cracklib-2.10.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe cracklib-2.10.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1853 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_create_spdx)
NOTE: recipe shadow-sysroot-4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe cracklib-2.10.2-r0: task do_create_spdx: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_package unihash changed to b185d40a4ea91f0de19bfdc54f19a40559e1d6a4c8dcb3f8e8c43ec3f1e6df83
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1854 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_collect_spdx_deps)
NOTE: recipe xkeyboard-config-2.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1856 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx)
NOTE: recipe gdbm-1.24-r0: task do_collect_spdx_deps: Started
NOTE: recipe cracklib-2.10.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1857 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_collect_spdx_deps)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx: Started
NOTE: recipe gdbm-1.24-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1858 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_create_spdx)
NOTE: recipe gdbm-1.24-r0: task do_create_spdx: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1859 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_collect_spdx_deps)
NOTE: recipe glibc-locale-2.40+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_package: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package unihash changed to 8e39e7aa93c6f869a7911847720d40edacbbc3eabfdfd3531ce2a0f6b80a6abd
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata became valid
NOTE: recipe gdbm-1.24-r0: task do_create_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package unihash changed to 7d2ee2c82a27d00561e33349092c030d4620d97158a119c1ba5295caa6f3e605
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata became valid
NOTE: Running setscene task 740 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running task 1861 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_collect_spdx_deps)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libseccomp-2.5.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_package unihash changed to 83056cecb6b00ffc0a517bf4f1bfee88a9132d9b46499f47d28a4f3590e9402c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libunistring-1.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1865 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_compile)
NOTE: recipe libunistring-1.3-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: Running task 1866 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1867 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe ncurses-6.5-r0: task do_compile: Succeeded
NOTE: Running task 1868 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_install)
NOTE: recipe ncurses-6.5-r0: task do_install: Started
NOTE: recipe libxcb-1.17.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1869 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_compile)
NOTE: recipe libxcb-1.17.0-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1870 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1871 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_install: Started
NOTE: Running task 1872 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_install: Succeeded
NOTE: Running task 1874 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_package)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_package: Started
NOTE: recipe libxcb-1.17.0-r0: task do_compile: Succeeded
NOTE: Running task 1875 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_install)
NOTE: recipe libxcb-1.17.0-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: Running task 1876 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1877 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_package unihash changed to f33872ddf83ec7c6297ca38e9d53851ee8f601f0e21ea955b9beca8317a3dce1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe openssl-3.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1879 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1880 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_install)
NOTE: recipe zstd-1.5.6-r0: task do_compile: Succeeded
NOTE: Running task 1881 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_install)
NOTE: recipe zstd-1.5.6-r0: task do_install: Started
NOTE: recipe openssl-3.3.1-r0: task do_install: Started
NOTE: recipe libxcb-1.17.0-r0: task do_install: Succeeded
NOTE: Running task 1883 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package)
NOTE: recipe libxcb-1.17.0-r0: task do_package: Started
NOTE: recipe libpam-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1884 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.6.1-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.3.1-r0: task do_install: Succeeded
NOTE: Running task 1885 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_install_ptest_base)
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to 4e396c03d41af622fed5d98a27646669daaa42bce2b0049b927fcc12b9e69acf
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1886 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_install)
NOTE: recipe libpam-1.6.1-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe zstd-1.5.6-r0: task do_install: Succeeded
NOTE: Running task 1889 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_package)
NOTE: recipe zstd-1.5.6-r0: task do_package: Started
NOTE: recipe libxcb-1.17.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package unihash changed to be1a4705cdd0d6cf49d748a2f8a195b610ce44e19c6ebb469adc62630581f0eb
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 1890 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_install_ptest_base)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.6.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1893 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1894 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package)
NOTE: Running task 1895 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.70-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.6.1-r0: task do_package: Started
NOTE: recipe libcap-2.70-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1896 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_configure)
NOTE: recipe libcap-2.70-r0: task do_configure: Started
NOTE: recipe shadow-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1897 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_configure)
NOTE: recipe libcap-2.70-r0: task do_configure: Succeeded
NOTE: Running task 1898 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_compile)
NOTE: recipe shadow-4.16.0-r0: task do_configure: Started
NOTE: recipe libcap-2.70-r0: task do_compile: Started
NOTE: recipe zstd-1.5.6-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_package unihash changed to 1eced8ef60f17ed3093c8fd9759e6976ef0c1152d299376c372488c6cae4cac5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libcap-2.70-r0: task do_compile: Succeeded
NOTE: Running task 1900 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_install)
NOTE: recipe libcap-2.70-r0: task do_install: Started
NOTE: recipe ncurses-6.5-r0: task do_install: Succeeded
NOTE: Running task 1902 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1903 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1904 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package)
NOTE: Running task 1905 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.70-r0: task do_install: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.5-r0: task do_package: Started
NOTE: recipe util-linux-2.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1907 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_configure)
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1908 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_configure)
NOTE: recipe libedit-20240808-3.1-r1: task do_configure: Started
NOTE: recipe psmisc-23.7-r0: task do_configure: Started
NOTE: recipe util-linux-2.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1909 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_configure)
NOTE: recipe util-linux-2.40.2-r0: task do_configure: Started
NOTE: recipe libpam-1.6.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package unihash changed to d6b9e2fcc51bff9d1694b286769f3fa062812281b3e3214305f9f7f01572ca5c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata became valid
NOTE: Running setscene task 739 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1911 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_package)
NOTE: Running task 1912 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_create_spdx)
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.70-r0: task do_package: Started
NOTE: recipe openssl-3.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1914 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_package)
NOTE: Running task 1915 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.3.1-r0: task do_package: Started
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1916 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_collect_spdx_deps)
NOTE: recipe kmod-33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1917 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_configure)
NOTE: recipe shadow-4.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmod-33-r0: task do_configure: Started
NOTE: recipe shadow-4.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcap-2.70-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_package unihash changed to c94f1be649fb7b611372b24b7a67b29aeeab8b336079fc3e1d80dbd609c86e6e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-4.16.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1919 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_compile)
NOTE: recipe libedit-20240808-3.1-r1: task do_configure: Succeeded
NOTE: Running task 1920 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_compile)
NOTE: recipe shadow-4.16.0-r0: task do_compile: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_compile: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_compile: Succeeded
NOTE: Running task 1921 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_install)
NOTE: recipe libedit-20240808-3.1-r1: task do_install: Started
NOTE: recipe ncurses-6.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package unihash changed to 068ba413f278d2b7c7799349b87b57f3d6fd717301fe976fb3146c98b753e491
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata became valid
NOTE: Running setscene task 743 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_install: Succeeded
NOTE: Running task 1923 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1925 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_package)
NOTE: recipe python3-3.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_package: Started
NOTE: recipe python3-3.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1926 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_configure)
NOTE: recipe python3-3.13.0-r0: task do_configure: Started
NOTE: recipe shadow-4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1927 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_install)
NOTE: recipe shadow-4.16.0-r0: task do_install: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_package unihash changed to 4560cc6252c523ada4c969110b4a508278afb31323a3412b486bda433b299b49
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata became valid
NOTE: Running setscene task 721 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-4.16.0-r0: task do_install: Succeeded
NOTE: Running task 1930 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_package)
NOTE: Running task 1931 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.16.0-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1932 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_configure)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1933 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_compile)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1934 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_install)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_install: Started
NOTE: recipe perl-5.40.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1935 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_configure_ptest_base)
NOTE: recipe perl-5.40.0-r0: task do_configure_ptest_base: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_install: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1936 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_compile)
NOTE: recipe perl-5.40.0-r0: task do_compile: Started
NOTE: recipe psmisc-23.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1938 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_compile)
NOTE: recipe kmod-33-r0: task do_configure: Succeeded
NOTE: Running task 1939 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_compile)
NOTE: recipe psmisc-23.7-r0: task do_compile: Started
NOTE: recipe kmod-33-r0: task do_compile: Started
NOTE: recipe psmisc-23.7-r0: task do_compile: Succeeded
NOTE: Running task 1940 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_install)
NOTE: recipe psmisc-23.7-r0: task do_install: Started
NOTE: recipe psmisc-23.7-r0: task do_install: Succeeded
NOTE: Running task 1941 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package)
NOTE: recipe psmisc-23.7-r0: task do_package: Started
NOTE: recipe kmod-33-r0: task do_compile: Succeeded
NOTE: Running task 1942 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_install)
NOTE: recipe kmod-33-r0: task do_install: Started
NOTE: recipe shadow-4.16.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_package unihash changed to ab93611f3efca9a1d99a2b482206a5bb3d1f4157657f7c5249e9da14ea574578
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1944 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package)
NOTE: Running task 1945 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_create_spdx)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package: Started
NOTE: recipe kmod-33-r0: task do_install: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_create_spdx: Started
NOTE: recipe shadow-4.16.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1947 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_collect_spdx_deps)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_package unihash changed to b15e613ee74bfd2d09a18ea4f80d47b1aa904e76d910474e1bbf3bf052006bce
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata became valid
NOTE: Running setscene task 726 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1949 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_package)
NOTE: Running task 1953 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package: Succeeded
NOTE: Running task 1955 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata)
NOTE: recipe ca-certificates-20240203-r0: task do_package_write_rpm: Started
NOTE: recipe kmod-33-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata unihash changed to b14e1561009e6f066fdb2c07b13e8622e4da126ee04ffed81d5aa15b16821307
NOTE: Running task 1956 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx: Started
NOTE: recipe psmisc-23.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package unihash changed to 6c0729a794368d945c2f412e185e86e6c1ffb629700ae457c3ebd27f0b544d8d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1958 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk)
NOTE: Running task 1959 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb)
NOTE: Running task 1960 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm)
NOTE: Running task 1961 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa)
NOTE: recipe ca-certificates-20240203-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_package_write_rpm unihash changed to 40e4d5a7c7713ddb19ffd53c1ff9629f6f5c6e0155dfd47e17da51f080a339aa
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa unihash changed to 7fd7e827140c7c25ea3ec4e1fefa55188b64961a1f51593c14251484b91edf41
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb unihash changed to 366de3c9cb09391d5102483f60ff6b60c35489890b006be95ca0d678ba6d9e2e
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe kmod-33-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm unihash changed to a6b838705b54cdafa2200a3244db1b803e327b03fa768f37aeba7c67d7f5ec33
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_package unihash changed to ce17e525c466fd387b8987da9544fd9c0552939618942323e30f29d26e605bcc
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk unihash changed to b2dcb5fa99dbcb93d602716567a6e8d199bc430aa2ad6e35e1f2d70098817bea
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libunistring-1.3-r0: task do_compile: Succeeded
NOTE: Running task 1963 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_install)
NOTE: recipe libunistring-1.3-r0: task do_install: Started
NOTE: recipe libunistring-1.3-r0: task do_install: Succeeded
NOTE: Running task 1965 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1966 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_package)
NOTE: recipe libunistring-1.3-r0: task do_package: Started
NOTE: recipe libidn2-2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1967 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_configure)
NOTE: recipe libidn2-2.3.7-r0: task do_configure: Started
NOTE: recipe util-linux-2.40.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1968 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_configure_ptest_base)
NOTE: recipe util-linux-2.40.2-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.40.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1969 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_compile)
NOTE: recipe util-linux-2.40.2-r0: task do_compile: Started
NOTE: recipe libunistring-1.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_package unihash changed to 3d17fe9b120150723eab37c8d04f9cac09dfa228463e4487ede2e8b250882212
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata became valid
NOTE: Running setscene task 743 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1972 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_collect_spdx_deps)
NOTE: recipe libidn2-2.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libidn2-2.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_compile: Succeeded
NOTE: Running task 1973 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.40.2-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-2.40.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1974 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_install)
NOTE: recipe util-linux-2.40.2-r0: task do_install: Started
NOTE: recipe util-linux-2.40.2-r0: task do_install: Succeeded
NOTE: Running task 1975 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.40.2-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.40.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1977 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_package)
NOTE: recipe util-linux-2.40.2-r0: task do_package: Started
NOTE: recipe libidn2-2.3.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1978 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_compile)
NOTE: recipe libidn2-2.3.7-r0: task do_compile: Started
NOTE: recipe python3-3.13.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1979 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_configure_ptest_base)
NOTE: recipe python3-3.13.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libidn2-2.3.7-r0: task do_compile: Succeeded
NOTE: Running task 1980 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_install)
NOTE: recipe python3-3.13.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1981 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_compile)
NOTE: recipe libidn2-2.3.7-r0: task do_install: Started
NOTE: recipe python3-3.13.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.7-r0: task do_install: Succeeded
NOTE: Running task 1983 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1984 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_package)
NOTE: recipe curl-8.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.7-r0: task do_package: Started
NOTE: recipe curl-8.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1985 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_configure)
NOTE: recipe curl-8.11.0-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_package unihash changed to 2cddebd5c45617dda733348940f08e763f7c7807be117d5bd234a9498c035435
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata became valid
NOTE: Running setscene task 743 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1987 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_create_spdx)
NOTE: recipe libidn2-2.3.7-r0: task do_create_spdx: Started
NOTE: recipe libidn2-2.3.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 1988 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_collect_spdx_deps)
NOTE: recipe curl-8.11.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe curl-8.11.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_package unihash changed to 32815db985385fd7acc3a73de3c57436d93dd93ab4ae34d12a407b3846106de6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata became valid
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-3.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1990 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_compile_ptest_base)
NOTE: recipe python3-3.13.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.13.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1991 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_install)
NOTE: recipe python3-3.13.0-r0: task do_install: Started
NOTE: recipe perl-5.40.0-r0: task do_compile: Succeeded
NOTE: Running task 1992 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_compile_ptest_base)
NOTE: recipe perl-5.40.0-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.40.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1993 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_install)
NOTE: recipe perl-5.40.0-r0: task do_install: Started
NOTE: recipe curl-8.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1994 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_configure_ptest_base)
NOTE: recipe curl-8.11.0-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.11.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1995 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_compile)
NOTE: recipe curl-8.11.0-r0: task do_compile: Started
NOTE: recipe curl-8.11.0-r0: task do_compile: Succeeded
NOTE: Running task 1996 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_compile_ptest_base)
NOTE: recipe curl-8.11.0-r0: task do_compile_ptest_base: Started
NOTE: recipe curl-8.11.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1997 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_install)
NOTE: recipe curl-8.11.0-r0: task do_install: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_package unihash changed to c41e34c2122218b5b02c7952662af47bf65c58167e2b43ff6233e325a3195a23
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_packagedata became valid
NOTE: Running setscene task 734 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_package_qa_setscene)
NOTE: recipe glibc-locale-2.40+git-r0: task do_package_qa_setscene: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe curl-8.11.0-r0: task do_install: Succeeded
NOTE: Running setscene task 744 of 744 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_packagedata_setscene)
NOTE: Running task 1998 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_install_ptest_base)
NOTE: recipe glibc-locale-2.40+git-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.11.0-r0: task do_install_ptest_base: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2000 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_create_spdx)
NOTE: Running task 2001 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_package_write_ipk)
NOTE: Running task 2002 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_package_write_deb)
NOTE: Running task 2003 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_package_write_rpm)
NOTE: recipe glibc-locale-2.40+git-r0: task do_create_spdx: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_package_write_rpm: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_package_write_deb: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_package_write_ipk: Started
NOTE: recipe python3-3.13.0-r0: task do_install: Succeeded
NOTE: Running task 2005 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_install_ptest_base)
NOTE: recipe python3-3.13.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.13.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2007 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2008 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2009 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_package)
NOTE: recipe libxml2-2.13.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.13.0-r0: task do_package: Started
NOTE: recipe libxml2-2.13.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2010 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.4.bb:do_configure)
NOTE: recipe libxml2-2.13.4-r0: task do_configure: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2011 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_configure)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2012 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_compile)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_compile: Started
NOTE: recipe perl-5.40.0-r0: task do_install: Succeeded
NOTE: Running task 2013 of 2098 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_install_ptest_base)
NOTE: recipe perl-5.40.0-r0: task do_install_ptest_base: Started
Log data follows:
| DEBUG: Executing shell function do_install_ptest_base
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/libauthretry /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/libauthretry
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/libntlmconnect /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/libntlmconnect
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/libprereq /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/libprereq
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib500 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib500
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib501 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib501
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib502 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib502
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib503 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib503
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib504 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib504
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib505 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib505
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib506 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib506
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib507 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib507
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib508 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib508
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib509 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib509
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib510 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib510
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib511 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib511
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib512 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib512
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib513 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib513
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib514 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib514
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib515 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib515
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib516 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib516
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib517 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib517
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib518 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib518
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib519 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib519
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib520 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib520
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib521 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib521
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib523 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib523
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib524 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib524
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib525 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib525
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib526 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib526
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib527 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib527
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib529 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib529
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib530 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib530
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib532 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib532
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib533 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib533
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib536 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib536
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib537 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib537
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib539 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib539
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib540 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib540
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib541 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib541
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib542 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib542
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib543 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib543
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib544 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib544
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib545 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib545
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib547 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib547
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib548 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib548
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib549 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib549
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib552 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib552
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib553 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib553
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib554 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib554
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib555 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib555
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib556 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib556
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib557 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib557
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib558 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib558
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib559 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib559
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib560 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib560
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib562 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib562
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib564 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib564
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib565 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib565
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib566 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib566
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib567 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib567
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib568 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib568
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib569 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib569
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib570 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib570
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib571 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib571
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib572 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib572
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib573 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib573
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib574 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib574
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib575 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib575
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib576 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib576
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib578 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib578
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib579 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib579
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib582 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib582
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib583 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib583
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib584 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib584
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib585 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib585
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib586 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib586
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib587 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib587
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib589 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib589
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib590 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib590
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib591 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib591
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib597 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib597
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib598 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib598
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib599 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib599
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib643 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib643
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib645 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib645
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib650 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib650
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib651 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib651
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib652 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib652
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib653 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib653
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib654 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib654
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib655 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib655
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib658 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib658
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib659 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib659
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib661 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib661
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib666 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib666
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib667 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib667
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib668 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib668
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib670 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib670
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib671 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib671
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib672 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib672
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib673 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib673
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib674 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib674
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib676 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib676
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib677 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib677
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib678 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib678
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1156 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1156
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1301 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1301
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1485 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1485
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1500 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1500
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1501 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1501
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1502 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1502
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1503 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1503
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1504 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1504
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1505 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1505
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1506 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1506
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1507 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1507
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1508 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1508
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1509 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1509
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1510 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1510
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1511 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1511
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1512 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1512
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1513 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1513
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1514 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1514
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1515 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1515
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1517 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1517
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1518 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1518
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1520 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1520
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1521 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1521
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1522 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1522
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1523 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1523
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1525 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1525
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1526 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1526
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1527 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1527
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1528 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1528
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1529 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1529
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1530 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1530
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1531 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1531
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1532 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1532
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1533 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1533
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1534 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1534
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1535 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1535
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1536 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1536
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1537 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1537
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1538 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1538
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1539 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1539
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1540 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1540
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1541 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1541
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1542 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1542
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1543 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1543
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1545 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1545
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1550 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1550
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1551 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1551
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1552 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1552
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1553 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1553
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1554 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1554
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1555 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1555
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1556 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1556
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1557 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1557
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1558 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1558
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1559 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1559
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1560 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1560
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1564 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1564
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1565 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1565
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1567 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1567
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1568 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1568
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1569 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1569
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1591 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1591
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1592 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1592
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1593 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1593
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1594 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1594
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1596 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1596
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1597 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1597
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1598 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1598
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1662 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1662
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1900 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1900
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1901 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1901
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1903 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1903
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1905 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1905
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1906 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1906
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1907 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1907
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1908 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1908
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1910 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1910
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1911 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1911
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1912 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1912
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1913 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1913
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1915 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1915
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1916 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1916
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1917 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1917
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1918 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1918
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1919 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1919
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1933 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1933
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1934 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1934
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1935 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1935
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1936 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1936
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1937 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1937
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1938 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1938
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1939 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1939
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1940 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1940
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1945 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1945
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1946 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1946
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1947 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1947
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1948 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1948
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1955 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1955
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1956 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1956
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1957 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1957
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1958 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1958
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1959 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1959
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1960 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1960
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1964 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1964
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1970 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1970
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1971 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1971
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1972 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1972
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1973 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1973
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1974 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1974
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1975 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1975
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib2301 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib2301
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib2302 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib2302
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib2304 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib2304
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib2305 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib2305
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib2306 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib2306
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib2308 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib2308
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib2402 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib2402
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib2404 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib2404
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib2405 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib2405
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib2502 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib2502
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib3010 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib3010
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib3025 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib3025
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib3026 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib3026
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib3027 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib3027
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib3100 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib3100
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib3101 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib3101
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib3102 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib3102
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib3103 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib3103
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib3207 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib3207
| cp: cannot stat '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/curl-8.11.0/tests/libtest/notexists.pl': No such file or directory
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/temp/run.do_install_ptest_base.370587:196 exit 1 from 'cp /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/curl-8.11.0/tests/libtest/notexists.pl /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install_ptest, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/temp/run.do_install_ptest_base.370587, line 196
| 	#2: do_install_ptest_base, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/temp/run.do_install_ptest_base.370587, line 159
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/temp/run.do_install_ptest_base.370587, line 237
NOTE: recipe curl-8.11.0-r0: task do_install_ptest_base: Failed
NOTE: recipe glibc-locale-2.40+git-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_compile: Succeeded
NOTE: recipe libxml2-2.13.4-r0: task do_configure: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_package: Succeeded
NOTE: recipe glibc-locale-2.40+git-r0: task do_package_write_ipk: Succeeded
NOTE: recipe glibc-locale-2.40+git-r0: task do_package_write_deb: Succeeded
NOTE: recipe glibc-locale-2.40+git-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 2013 tasks of which 1419 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 15 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241118095535.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241118095535.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_install_ptest_base
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/temp/log.do_install_ptest_base.370587
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: curl-8.11.0-r0 do_install_ptest_base: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/temp/run.do_install_ptest_base.370587' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/temp/log.do_install_ptest_base.370587
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_install_ptest_base) failed with exit code '1'

--===============2714354314675987101==--

