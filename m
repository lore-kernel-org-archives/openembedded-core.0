Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7DCCC6B3E
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:18 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33254.1792043053649161641
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SK8Yih1p;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1PMRxYEq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a13e16ee99-3f7c8b0b-9e47-4123-8b36-5b9295d4146f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792043052;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=umT32mcpPPNpUA6Ophr3EaVFIyysopTNNHY82Y1n44k=;
	b=SK8Yih1pQQ0X0laYej+M80p1X2TJVZv15N279fEtWSHEKRGi5W8KCx+p1l2dMaSW
	RY4AHxeo/cq/gXbcRiMI3b99bNJ8WZBLpiC0lPI6XBrWtUdkJotL1DbjaduOY1zQnJv
	fYjJC2Jo9PhHCYIjNyeRemVyvDG4Yvm7zLZN/uGY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792043052;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=umT32mcpPPNpUA6Ophr3EaVFIyysopTNNHY82Y1n44k=;
	b=1PMRxYEq7dgd+8482OlCB3Xh88I26lSAJwfJJsM2aem7galgwDp/M3NNQ6DmKr7Q
	GuSyLoEK1Bd/z1SrVONBmnlpF3GlZAYt5v7w7kqp16JyZhZk7PGshJgX5KDfuCVV9Fi
	ueAYsa4WVnGzbpi/Wlst9iEx7JB8yqcgslFvEeQo=
Content-Type: multipart/mixed; boundary="===============0728011982034595102=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] curl: upgrading to 8.23.0 FAILED
Message-ID: <010101a13e16ee99-3f7c8b0b-9e47-4123-8b36-5b9295d4146f-000000@us-west-2.amazonses.com>
Date: Thu, 15 Oct 2026 05:44:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247865

--===============0728011982034595102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *curl* to *8.23.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-curl-upgrade-8.22.0-8.23.0.patch
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
From b62ecb592023f7ee5ed69bee82b037ff98b64041 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Oct 2026 05:44:02 +0000
Subject: [PATCH] curl: upgrade 8.22.0 -> 8.23.0

August: security vulnerability: libcurl embedded zero byte in cert name
September: removed support for SMB
---
 meta/recipes-support/curl/curl/no-test-timeout.patch         | 4 ++--
 meta/recipes-support/curl/{curl_8.22.0.bb => curl_8.23.0.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/curl/{curl_8.22.0.bb => curl_8.23.0.bb} (98%)

diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/recipes-support/curl/curl/no-test-timeout.patch
index 93c2627bdd..c12f544ae4 100644
--- a/meta/recipes-support/curl/curl/no-test-timeout.patch
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -1,4 +1,4 @@
-From 4bc84380d2d0d85ed5a57cf9f78286531a19de48 Mon Sep 17 00:00:00 2001
+From 12ca1c846f3470e04e7c10a251c337022494aef7 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 15 Mar 2024 14:37:37 +0000
 Subject: [PATCH] Set the max-time timeout to 600 so the timeout is 10 minutes
@@ -12,7 +12,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/servers.pm b/tests/servers.pm
-index 99db988..81a7572 100644
+index ebcacba..18e106b 100644
 --- a/tests/servers.pm
 +++ b/tests/servers.pm
 @@ -123,7 +123,7 @@ my $sshdverstr;    # for socks server, ssh daemon version string
diff --git a/meta/recipes-support/curl/curl_8.22.0.bb b/meta/recipes-support/curl/curl_8.23.0.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.22.0.bb
rename to meta/recipes-support/curl/curl_8.23.0.bb
index 96f889165e..3b2cc2792a 100644
--- a/meta/recipes-support/curl/curl_8.22.0.bb
+++ b/meta/recipes-support/curl/curl_8.23.0.bb
@@ -20,7 +20,7 @@ SRC_URI:append:class-nativesdk = " \
     file://environment.d-curl.sh \
 "
 
-SRC_URI[sha256sum] = "f7ef3ae8a22e521f289803fe93543eb64c329b58aa73a9e224dfd915a2a5f4f7"
+SRC_URI[sha256sum] = "8dadd7d2536a314f982ad05a651b713f426bf7d02cc2c76cffb9796f2218e6c5"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.47.1


--===============0728011982034595102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="curl-changelog.txt"

August: security vulnerability: libcurl embedded zero byte in cert name
September: removed support for SMB

--===============0728011982034595102==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-curl-upgrade-8.22.0-8.23.0.patch"

RnJvbSBiNjJlY2I1OTIwMjNmN2VlNWVkNjliZWU4MmIwMzdmZjk4YjY0MDQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgT2N0IDIwMjYgMDU6NDQ6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
dXJsOiB1cGdyYWRlIDguMjIuMCAtPiA4LjIzLjAKCkF1Z3VzdDogc2VjdXJpdHkgdnVsbmVyYWJp
bGl0eTogbGliY3VybCBlbWJlZGRlZCB6ZXJvIGJ5dGUgaW4gY2VydCBuYW1lClNlcHRlbWJlcjog
cmVtb3ZlZCBzdXBwb3J0IGZvciBTTUIKLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1
cmwvbm8tdGVzdC10aW1lb3V0LnBhdGNoICAgICAgICAgfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2N1cmwve2N1cmxfOC4yMi4wLmJiID0+IGN1cmxfOC4yMy4wLmJifSB8IDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwve2N1cmxfOC4yMi4wLmJiID0+IGN1cmxfOC4yMy4wLmJi
fSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybC9uby10
ZXN0LXRpbWVvdXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmwvbm8tdGVz
dC10aW1lb3V0LnBhdGNoCmluZGV4IDkzYzI2MjdiZGQuLmMxMmY1NDRhZTQgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybC9uby10ZXN0LXRpbWVvdXQucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsL25vLXRlc3QtdGltZW91dC5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gNGJjODQzODBkMmQwZDg1ZWQ1YTU3Y2Y5Zjc4Mjg2NTMxYTE5
ZGU0OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMTJjYTFjODQ2ZjM0NzBlMDRlN2Mx
MGEyNTFjMzM3MDIyNDk0YWVmNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3Mg
QnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogRGF0ZTogRnJpLCAxNSBNYXIgMjAyNCAxNDoz
NzozNyArMDAwMAogU3ViamVjdDogW1BBVENIXSBTZXQgdGhlIG1heC10aW1lIHRpbWVvdXQgdG8g
NjAwIHNvIHRoZSB0aW1lb3V0IGlzIDEwIG1pbnV0ZXMKQEAgLTEyLDcgKzEyLDcgQEAgU2lnbmVk
LW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS90ZXN0cy9z
ZXJ2ZXJzLnBtIGIvdGVzdHMvc2VydmVycy5wbQotaW5kZXggOTlkYjk4OC4uODFhNzU3MiAxMDA2
NDQKK2luZGV4IGViY2FjYmEuLjE4ZTEwNmIgMTAwNjQ0CiAtLS0gYS90ZXN0cy9zZXJ2ZXJzLnBt
CiArKysgYi90ZXN0cy9zZXJ2ZXJzLnBtCiBAQCAtMTIzLDcgKzEyMyw3IEBAIG15ICRzc2hkdmVy
c3RyOyAgICAjIGZvciBzb2NrcyBzZXJ2ZXIsIHNzaCBkYWVtb24gdmVyc2lvbiBzdHJpbmcKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybF84LjIyLjAuYmIgYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfOC4yMy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTgl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybF84LjIyLjAuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybF84LjIzLjAuYmIKaW5kZXggOTZm
ODg5MTY1ZS4uM2IyY2MyNzkyYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3Vy
bC9jdXJsXzguMjIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfOC4y
My4wLmJiCkBAIC0yMCw3ICsyMCw3IEBAIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZXNkayA9
ICIgXAogICAgIGZpbGU6Ly9lbnZpcm9ubWVudC5kLWN1cmwuc2ggXAogIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiZjdlZjNhZThhMjJlNTIxZjI4OTgwM2ZlOTM1NDNlYjY0YzMyOWI1OGFhNzNh
OWUyMjRkZmQ5MTVhMmE1ZjRmNyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4ZGFkZDdkMjUzNmEz
MTRmOTgyYWQwNWE2NTFiNzEzZjQyNmJmN2QwMmNjMmM3NmNmZmI5Nzk2ZjIyMThlNmM1IgogCiAj
IEN1cmwgaGFzIHVzZWQgbWFueSBuYW1lcyBvdmVyIHRoZSB5ZWFycy4uLgogQ1ZFX1BST0RVQ1Qg
PSAiaGF4eDpjdXJsIGhheHg6bGliY3VybCBjdXJsOmN1cmwgY3VybDpsaWJjdXJsIGxpYmN1cmw6
bGliY3VybCBkYW5pZWxfc3RlbmJlcmc6Y3VybCIKLS0gCjIuNDcuMQoK

--===============0728011982034595102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1992 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-7d48c61ae7b4b6962deed26e74637c8b4deb3f26"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:7d48c61ae7b4b6962deed26e74637c8b4deb3f26"
meta-yocto-bsp       
meta-poky            = "master:49a2b44583968d321b3195bfd0cb2232dff13950"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 516 Local 341 Mirrors 0 Missed 175 Current 273 (66% match, 77% complete)
done.
Removing 3 stale sstate objects for arch x86_64...done.
Removing 58 stale sstate objects for arch qemux86_64...done.
Removing 4 stale sstate objects for arch allarch...done.
Removing 18 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 380 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 387 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 389 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 404 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 412 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 416 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 421 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 429 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl-cross/perlcross_1.6.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 433 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 436 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.44.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 443 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.44.bb:do_create_spdx_setscene)
NOTE: Running setscene task 444 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 456 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.37.0.bb:do_create_spdx_setscene)
NOTE: recipe ca-certificates-20260816-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20260816-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.44.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glibc-locale-2.44+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.44.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.44+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe perlcross-native-1.6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-native-4.20.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-native-4.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20260816-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 460 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 461 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe perl-5.44.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 464 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glibc-locale-2.44+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 465 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 467 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perlcross-native-1.6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 470 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 472 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 473 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ca-certificates-20260816-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 475 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 479 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_create_spdx_setscene)
NOTE: recipe shadow-native-4.20.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-native-4.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 481 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 482 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 483 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 485 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_create_spdx_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sed-4.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ca-certificates-20260816-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gawk-native-5.4.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 487 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 489 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.5.1.bb:do_create_spdx_setscene)
NOTE: recipe gperf-native-3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe procps-4.0.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 493 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 495 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 496 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 498 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 499 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe sed-4.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 500 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_262.bb:do_populate_sysroot_setscene)
NOTE: recipe ca-certificates-20260816-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 502 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 503 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_create_spdx_setscene)
NOTE: Running setscene task 506 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 513 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glibc-locale-2.44+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-native-5.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 514 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 519 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 520 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rsync-native-3.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 523 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_262-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-native-2.15.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 524 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe openssl-native-4.0.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 528 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rsync-native-3.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 530 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 531 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 532 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 535 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 538 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-native-2.15.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 552 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-native-4.0.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 565 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 582 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe procps-4.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 583 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 589 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 590 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.44.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 591 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe procps-4.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 594 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 598 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 600 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.26.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 603 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 604 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 608 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 612 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 615 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 617 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 630 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl-cross/perlcross_1.6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 631 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 637 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 639 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 640 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe wayland-protocols-1.49-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 641 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_262-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 643 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.44.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 644 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perlcross-native-1.6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 645 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-protocols-1.49-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 646 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 647 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.44.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 649 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 650 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 652 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 656 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 657 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 660 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 662 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 663 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 664 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 666 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 667 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_262.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 669 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 670 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 671 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 673 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_recipe_qa_setscene)
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 675 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 676 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-4.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perlcross-native-1.6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 679 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcrypt-4.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 681 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl-cross/perlcross_1.6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 682 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-4.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 686 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe systemd-1_262-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 688 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_stash_locale_setscene)
NOTE: Running setscene task 691 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 692 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 694 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perlcross-native-1.6.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 698 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 699 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 700 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_262-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 705 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 706 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perlcross-native-1.6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 707 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 708 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 711 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_262.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 712 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.44+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rsync-native-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-native-1_6.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 714 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.20.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 715 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 716 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-native-0.196-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-native-1_6.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_262-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 717 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe rsync-native-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-native-0.196-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 174 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_fetch)
NOTE: Running setscene task 719 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 720 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 721 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.20.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 723 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_recipe_qa_setscene)
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe systemd-1_262-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_fetch: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 724 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 725 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rsync-native-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running noexec task 418 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_fetch)
NOTE: Running noexec task 446 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_fetch)
NOTE: Running task 453 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_fetch)
NOTE: Running task 458 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: Running task 469 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe glibc-2.44+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 727 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 728 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 730 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 732 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rsync-native-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 548 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_recipe_qa)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 573 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_fetch)
NOTE: recipe util-linux-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe libgcc-initial-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 574 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_unpack)
NOTE: recipe gperf-native-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 735 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_recipe_qa_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-native-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-native-8.23.0-r0: task do_recipe_qa: Started
NOTE: recipe glibc-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 575 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_fetch)
NOTE: Running task 577 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_fetch)
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Started
NOTE: recipe util-linux-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 737 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 738 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-initial-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gperf-native-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 740 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 742 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-native-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.9.0-r0: task do_fetch: Started
NOTE: recipe glibc-2.44+git-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-native-8.23.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.9.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 747 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 748 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 750 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.44+git-r0: task do_fetch: Succeeded
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: Running setscene task 751 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 752 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-native-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_recipe_qa_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 754 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 755 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 757 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gperf-native-3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 760 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 763 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-native-5.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.49-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 584 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_unpack)
NOTE: recipe libcap-ng-0.9.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 764 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_recipe_qa_setscene)
NOTE: recipe gawk-native-5.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 765 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 601 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_patch)
NOTE: Running task 602 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 603 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_fetch)
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 627 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_fetch)
NOTE: recipe libpcre2-10.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 769 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_patch: Started
NOTE: recipe libpam-1.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 770 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 772 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_recipe_qa_setscene)
NOTE: recipe curl-native-8.23.0-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 629 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_fetch)
NOTE: recipe util-linux-native-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.49-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-native-8.23.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 775 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 776 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.37.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 631 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_unpack)
NOTE: recipe bash-completion-2.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 777 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.49-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_fetch: Succeeded
NOTE: Running setscene task 778 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_recipe_qa_setscene)
NOTE: Running task 635 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_fetch)
NOTE: recipe libpam-1.7.3-r0: task do_fetch: Started
NOTE: recipe libcap-ng-native-0.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_fetch: Succeeded
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 636 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_unpack)
NOTE: Running task 638 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_fetch)
NOTE: recipe util-linux-native-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-native-8.23.0-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.49-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 779 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 642 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_fetch)
NOTE: recipe elfutils-native-0.196-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 648 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_fetch)
NOTE: recipe libpcre2-10.49-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.9.0-r0: task do_unpack: Started
NOTE: recipe openssl-4.0.3-r0: task do_fetch: Started
NOTE: recipe libcap-ng-native-0.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 650 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_fetch)
NOTE: Running setscene task 781 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.37.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 784 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.4-r0: task do_fetch: Started
NOTE: recipe gdbm-1.26-r0: task do_fetch: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_fetch: Started
NOTE: Running setscene task 785 of 789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-native-0.196-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-native-0.9.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 653 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: recipe expat-2.9.0-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_fetch: Succeeded
NOTE: Running task 654 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_patch)
NOTE: recipe libpcre2-10.49-r0: task do_fetch: Succeeded
NOTE: Running task 656 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_unpack)
NOTE: Running task 657 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_unpack)
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-native-0.9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 665 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_fetch)
NOTE: recipe libxslt-native-1.1.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: Running task 686 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_unpack)
NOTE: recipe expat-2.9.0-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_unpack: Started
NOTE: Running task 688 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_fetch)
NOTE: recipe libpam-1.7.3-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_fetch: Succeeded
NOTE: recipe curl-native-8.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 689 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_unpack)
NOTE: Running task 690 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_patch)
NOTE: recipe libtool-cross-2.6.2-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe rpm-native-1_6.0.2-r0: task do_fetch: Started
NOTE: Running task 691 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe libxslt-native-1.1.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 789 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_unpack: Started
NOTE: recipe expat-2.9.0-r0: task do_patch: Succeeded
NOTE: Running task 692 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcrypt-4.5.2-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 693 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_unpack)
NOTE: recipe libpam-1.7.3-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_fetch: Succeeded
NOTE: Running task 694 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_patch)
NOTE: Running task 695 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe curl-native-8.23.0-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_unpack: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-native-8.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.3-r0: task do_patch: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-native-8.23.0-r0: task do_patch: Succeeded
NOTE: Running task 696 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 717 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 718 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_patch)
NOTE: recipe openssl-4.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 719 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 722 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_unpack)
NOTE: Running task 723 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_patch)
NOTE: recipe libpcre2-10.49-r0: task do_unpack: Succeeded
NOTE: Running task 724 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_patch)
NOTE: recipe libpam-1.7.3-r0: task do_patch: Succeeded
NOTE: Running task 725 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_unpack)
NOTE: recipe linux-libc-headers-7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_patch: Started
NOTE: recipe curl-native-8.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-4.0.3-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.196-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.49-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_unpack: Started
NOTE: Running task 726 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_unpack)
NOTE: recipe linux-libc-headers-7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 774 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_fetch)
NOTE: recipe gdbm-1.26-r0: task do_unpack: Succeeded
NOTE: recipe curl-native-8.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 775 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_patch)
NOTE: Running task 784 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_write_config)
NOTE: recipe libpcre2-10.49-r0: task do_patch: Succeeded
NOTE: Running task 787 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_fetch)
NOTE: recipe xz-5.8.4-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 789 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_fetch)
NOTE: recipe gdbm-1.26-r0: task do_patch: Started
NOTE: recipe curl-native-8.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_write_config: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 790 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_configure)
NOTE: Running task 791 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe attr-2.6.0-r0: task do_fetch: Started
NOTE: recipe xz-5.8.4-r0: task do_unpack: Succeeded
NOTE: Running task 792 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_patch)
NOTE: recipe attr-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_write_config: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_fetch: Started
NOTE: Running task 848 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_fetch)
NOTE: Running task 849 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_generate_toolchain_file)
NOTE: recipe libffi-3.8.0-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running task 851 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_unpack)
NOTE: recipe libxcrypt-4.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 852 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_patch)
NOTE: recipe curl-native-8.23.0-r0: task do_configure: Started
NOTE: recipe xz-5.8.4-r0: task do_patch: Started
NOTE: recipe gdbm-1.26-r0: task do_patch: Succeeded
NOTE: Running task 856 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_unpack)
NOTE: recipe ncurses-6.6-r0: task do_fetch: Started
NOTE: recipe expat-2.9.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_patch: Started
NOTE: recipe expat-2.9.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 857 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_unpack)
NOTE: recipe xz-5.8.4-r0: task do_patch: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_unpack: Started
NOTE: Running task 861 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_fetch)
NOTE: recipe attr-2.6.0-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_patch: Succeeded
NOTE: Running task 862 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_patch)
NOTE: recipe bash-completion-2.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 864 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_fetch)
NOTE: Running task 865 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_patch)
NOTE: recipe libffi-3.8.0-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_fetch: Started
NOTE: Setscene tasks completed
NOTE: Running task 866 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-source_16.2.bb:do_fetch)
NOTE: recipe libxcrypt-4.5.2-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_patch: Started
NOTE: recipe libffi-3.8.0-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_patch: Started
NOTE: Running task 923 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_fetch)
NOTE: Running task 924 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_patch)
NOTE: recipe gcc-source-16.2.0-16.2.0-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_fetch: Succeeded
NOTE: Running task 925 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_fetch: Succeeded
NOTE: Running task 926 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_unpack)
NOTE: recipe libffi-3.8.0-r0: task do_patch: Started
NOTE: recipe libxml2-2.15.4-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_patch: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_patch: Succeeded
NOTE: Running task 932 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_fetch)
NOTE: Running task 934 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_fetch)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_fetch: Started
NOTE: recipe libxml2-2.15.4-r0: task do_fetch: Succeeded
NOTE: Running task 938 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_fetch)
NOTE: recipe util-linux-2.42.4-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_unpack: Succeeded
NOTE: Running task 939 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libffi-3.8.0-r0: task do_patch: Succeeded
NOTE: Running task 940 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_patch)
NOTE: recipe util-linux-2.42.4-r0: task do_fetch: Succeeded
NOTE: Running task 943 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_fetch)
NOTE: Running task 946 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_unpack)
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_patch: Started
NOTE: Running task 949 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe libxml2-2.15.4-r0: task do_unpack: Started
NOTE: recipe python3-3.14.7-r0: task do_fetch: Started
NOTE: recipe elfutils-native-0.196-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_unpack: Started
NOTE: Running task 950 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_patch)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_patch: Succeeded
NOTE: Running task 954 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_unpack)
NOTE: recipe libcap-ng-0.9.6-r0: task do_fetch: Succeeded
NOTE: Running task 955 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_unpack)
NOTE: recipe openssl-4.0.3-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 956 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_patch)
NOTE: recipe elfutils-native-0.196-r0: task do_patch: Started
NOTE: Running task 975 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_fetch)
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_unpack: Started
NOTE: Running task 976 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_patch)
NOTE: recipe python3-3.14.7-r0: task do_fetch: Succeeded
NOTE: Running task 977 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_unpack)
NOTE: recipe openssl-4.0.3-r0: task do_patch: Started
NOTE: recipe acl-2.4.0-r0: task do_fetch: Started
NOTE: recipe acl-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 980 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_unpack)
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Started
NOTE: recipe acl-2.4.0-r0: task do_unpack: Started
NOTE: recipe python3-3.14.7-r0: task do_unpack: Started
NOTE: recipe acl-2.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 981 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_patch)
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Succeeded
NOTE: Running task 990 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_fetch)
NOTE: recipe libxml2-2.15.4-r0: task do_unpack: Succeeded
NOTE: Running task 991 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_patch)
NOTE: recipe acl-2.4.0-r0: task do_patch: Started
NOTE: recipe openssl-4.0.3-r0: task do_patch: Succeeded
NOTE: Running task 1007 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_fetch)
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Started
NOTE: recipe libxml2-2.15.4-r0: task do_patch: Started
NOTE: recipe gcc-source-16.2.0-16.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1008 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-source_16.2.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_unpack: Succeeded
NOTE: Running task 1009 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_patch)
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1010 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_unpack)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Started
NOTE: Running task 1014 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_fetch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Succeeded
NOTE: Running task 1015 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_fetch)
NOTE: recipe gcc-source-16.2.0-16.2.0-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.196-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_patch: Started
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Started
NOTE: Running task 1022 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_fetch)
NOTE: recipe wayland-1.26.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.26.0-r0: task do_fetch: Succeeded
NOTE: Running task 1023 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Started
NOTE: recipe libxml2-2.15.4-r0: task do_patch: Succeeded
NOTE: Running task 1028 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe libcap-ng-0.9.6-r0: task do_unpack: Succeeded
NOTE: Running task 1029 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_patch)
NOTE: recipe libcap-2.78-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_fetch: Succeeded
NOTE: Running task 1038 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_unpack)
NOTE: recipe libcap-2.78-r0: task do_fetch: Succeeded
NOTE: Running task 1046 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_unpack)
NOTE: recipe util-linux-2.42.4-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: Running task 1047 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_patch)
NOTE: recipe libcap-ng-0.9.6-r0: task do_patch: Started
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1048 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_patch)
NOTE: Running task 1049 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Started
NOTE: recipe wayland-1.26.0-r0: task do_unpack: Started
NOTE: recipe util-linux-2.42.4-r0: task do_patch: Started
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_patch: Succeeded
NOTE: Running task 1052 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_unpack: Started
NOTE: recipe wayland-1.26.0-r0: task do_unpack: Succeeded
NOTE: Running task 1053 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_patch)
NOTE: recipe libcap-2.78-r0: task do_unpack: Started
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Succeeded
NOTE: Running task 1054 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Succeeded
NOTE: Running task 1055 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_patch)
NOTE: recipe wayland-1.26.0-r0: task do_patch: Started
NOTE: recipe libcap-2.78-r0: task do_unpack: Succeeded
NOTE: Running task 1056 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_patch: Succeeded
NOTE: Running task 1060 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_fetch)
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Started
NOTE: recipe libcap-2.78-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Succeeded
NOTE: Running task 1076 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_fetch)
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Succeeded
NOTE: Running task 1077 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: Running task 1088 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_fetch)
NOTE: recipe libcap-2.78-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_patch: Succeeded
NOTE: Running task 1090 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_recipe_qa)
NOTE: Running task 1091 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_write_config)
NOTE: recipe xorgproto-2025.1-r0: task do_fetch: Started
NOTE: recipe xorgproto-2025.1-r0: task do_fetch: Succeeded
NOTE: Running task 1093 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_write_config)
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Started
NOTE: recipe curl-8.23.0-r0: task do_recipe_qa: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Started
NOTE: recipe util-linux-2.42.4-r0: task do_patch: Succeeded
NOTE: Running task 1096 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_write_config)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Succeeded
NOTE: Running task 1098 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_fetch)
NOTE: recipe wayland-1.26.0-r0: task do_write_config: Started
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: Running task 1099 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_unpack)
NOTE: Running task 1100 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_patch)
NOTE: Running task 1106 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_unpack)
NOTE: recipe wayland-1.26.0-r0: task do_write_config: Succeeded
NOTE: Running task 1109 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_write_config: Started
NOTE: recipe perl-5.44.0-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Started
NOTE: recipe curl-8.23.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_unpack: Started
NOTE: Running task 1110 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_patch: Started
NOTE: Running task 1116 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_fetch)
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Succeeded
NOTE: Running task 1117 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_patch)
NOTE: recipe xorgproto-2025.1-r0: task do_unpack: Succeeded
NOTE: Running task 1118 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_patch)
NOTE: recipe curl-8.23.0-r0: task do_fetch: Started
NOTE: recipe shadow-4.20.3-r0: task do_fetch: Started
NOTE: recipe curl-8.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 1122 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_unpack)
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Started
NOTE: recipe xorgproto-2025.1-r0: task do_patch: Started
NOTE: recipe perl-5.44.0-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_fetch: Succeeded
NOTE: Running task 1124 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_unpack)
NOTE: recipe curl-8.23.0-r0: task do_unpack: Started
NOTE: Running task 1132 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_patch: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_unpack: Succeeded
NOTE: Running task 1133 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_unpack)
NOTE: Running task 1134 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_patch)
NOTE: recipe perl-5.44.0-r0: task do_unpack: Started
NOTE: Running task 1151 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_write_config)
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1152 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_unpack)
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Succeeded
NOTE: Running task 1153 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_patch)
NOTE: recipe shadow-4.20.3-r0: task do_unpack: Started
NOTE: recipe xorgproto-2025.1-r0: task do_write_config: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Started
NOTE: recipe python3-3.14.7-r0: task do_patch: Started
NOTE: recipe xorgproto-2025.1-r0: task do_write_config: Succeeded
NOTE: Running task 1159 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 1160 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_fetch)
NOTE: Running task 1161 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_patch)
NOTE: Running task 1162 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Started
NOTE: Running task 1164 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Started
NOTE: recipe curl-8.23.0-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1172 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_write_config)
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Succeeded
NOTE: Running task 1176 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_fetch)
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Started
NOTE: Running task 1178 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1179 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: recipe libpsl-0.23.3-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_fetch: Succeeded
NOTE: recipe wayland-protocols-1.49-r0: task do_fetch: Started
NOTE: recipe libpsl-0.23.3-r0: task do_write_config: Succeeded
NOTE: Running task 1186 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_fetch)
NOTE: recipe curl-8.23.0-r0: task do_patch: Succeeded
NOTE: Running task 1187 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_fetch)
NOTE: Running task 1188 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe wayland-protocols-1.49-r0: task do_fetch: Succeeded
NOTE: Running task 1189 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_fetch)
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1192 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_fetch: Started
NOTE: recipe curl-8.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_fetch: Started
NOTE: recipe kmod-34.2-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe kmod-34.2-r0: task do_fetch: Succeeded
NOTE: Running task 1193 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: Running task 1199 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_262.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1200 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_patch)
NOTE: recipe systemd-1_262-r0: task do_fetch: Started
NOTE: recipe perl-5.44.0-r0: task do_unpack: Succeeded
NOTE: Running task 1201 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_patch)
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Succeeded
NOTE: Running task 1203 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: recipe curl-8.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1204 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_unpack)
NOTE: recipe shadow-4.20.3-r0: task do_unpack: Succeeded
NOTE: Running task 1205 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_patch)
NOTE: recipe python3-3.14.7-r0: task do_patch: Succeeded
NOTE: Running task 1207 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_unpack)
NOTE: recipe perl-5.44.0-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1209 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_patch: Started
NOTE: Running task 1210 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1211 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Started
NOTE: Running task 1212 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1213 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_patch)
NOTE: recipe shadow-4.20.3-r0: task do_patch: Succeeded
NOTE: Running task 1218 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Started
NOTE: Running task 1219 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1220 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_fetch)
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 1221 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_unpack)
NOTE: recipe procps-4.0.7-r0: task do_fetch: Started
NOTE: recipe sed-4.10-r0: task do_fetch: Started
NOTE: recipe sed-4.10-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_unpack: Started
NOTE: Running task 1222 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_unpack)
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1223 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: recipe perl-5.44.0-r0: task do_patch: Succeeded
NOTE: Running task 1237 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_unpack)
NOTE: recipe wayland-protocols-1.49-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_unpack: Succeeded
NOTE: Running task 1238 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_patch)
NOTE: recipe wayland-protocols-1.49-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: Running task 1239 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_patch)
NOTE: recipe kmod-34.2-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_patch: Started
NOTE: Running task 1240 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe wayland-protocols-1.49-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_fetch: Succeeded
NOTE: Running task 1241 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_unpack: Succeeded
NOTE: Running task 1243 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_patch)
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_patch: Succeeded
NOTE: Running task 1250 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_unpack)
NOTE: recipe wayland-protocols-1.49-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_unpack: Started
NOTE: Running task 1253 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_fetch)
NOTE: Running task 1254 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_patch: Started
NOTE: recipe sed-4.10-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe kmod-34.2-r0: task do_patch: Succeeded
NOTE: Running task 1262 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe sed-4.10-r0: task do_unpack: Succeeded
NOTE: Running task 1263 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_patch)
NOTE: recipe sed-4.10-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1269 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_write_config)
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1272 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_fetch)
NOTE: recipe sed-4.10-r0: task do_patch: Succeeded
NOTE: Running task 1274 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_write_config)
NOTE: recipe ca-certificates-20260816-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_write_config: Started
NOTE: recipe ca-certificates-20260816-r0: task do_fetch: Succeeded
NOTE: Running task 1276 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.48-r0: task do_write_config: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_write_config: Succeeded
NOTE: Running task 1278 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.48-r0: task do_write_config: Succeeded
NOTE: recipe wayland-protocols-1.49-r0: task do_write_config: Started
NOTE: Running task 1280 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_unpack)
NOTE: recipe wayland-protocols-1.49-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_unpack: Succeeded
NOTE: recipe wayland-protocols-1.49-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1292 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_write_config)
NOTE: Running task 1293 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_patch)
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: Running task 1294 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_write_config: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to d271222bf7330447951935332cc7a202dd1e0e0ee5a20708aee02681b2ddc042
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: Running task 1295 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_write_config)
NOTE: Running task 1296 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_write_config)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_write_config: Started
NOTE: Running task 1311 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_262.bb:do_warn_musl)
NOTE: recipe kmod-34.2-r0: task do_write_config: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: Running task 1312 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_262.bb:do_write_config)
NOTE: recipe wayland-protocols-1.49-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_write_config: Succeeded
NOTE: recipe kmod-34.2-r0: task do_write_config: Succeeded
NOTE: Running task 1313 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_configure)
NOTE: Running task 1315 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_unpack)
NOTE: Running task 1341 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_262-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_262-r0: task do_warn_musl: Succeeded
NOTE: recipe systemd-1_262-r0: task do_write_config: Started
NOTE: recipe ca-certificates-20260816-r0: task do_unpack: Started
NOTE: recipe ca-certificates-20260816-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-protocols-1.49-r0: task do_configure: Started
NOTE: Running task 1397 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_create_recipe_spdx)
NOTE: recipe systemd-1_262-r0: task do_write_config: Succeeded
NOTE: recipe ca-certificates-20260816-r0: task do_unpack: Succeeded
NOTE: Running task 1405 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_populate_lic)
NOTE: Running task 1406 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_patch)
NOTE: recipe ca-certificates-20260816-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe ca-certificates-20260816-r0: task do_patch: Started
NOTE: recipe curl-8.23.0-r0: task do_populate_lic: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1407 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_patch)
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 1408 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_unpack)
NOTE: recipe ca-certificates-20260816-r0: task do_patch: Succeeded
NOTE: Running task 1410 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_configure)
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_unpack: Started
NOTE: recipe ca-certificates-20260816-r0: task do_configure: Started
NOTE: recipe curl-8.23.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe ca-certificates-20260816-r0: task do_configure: Succeeded
NOTE: Running task 1412 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_compile)
NOTE: recipe ca-certificates-20260816-r0: task do_compile: Started
NOTE: recipe procps-4.0.7-r0: task do_fetch: Succeeded
NOTE: Running task 1413 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_unpack)
NOTE: recipe procps-4.0.7-r0: task do_unpack: Started
NOTE: recipe ca-certificates-20260816-r0: task do_compile: Succeeded
NOTE: Running task 1414 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_install)
NOTE: recipe glibc-2.44+git-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 1415 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_patch)
NOTE: Running task 1416 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_unpack)
NOTE: Running task 1417 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_patch)
NOTE: recipe procps-4.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 1418 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_patch)
NOTE: recipe ca-certificates-20260816-r0: task do_install: Started
NOTE: recipe ncurses-6.6-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.49-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_patch: Started
NOTE: recipe glibc-2.44+git-r0: task do_patch: Started
NOTE: Running task 1419 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_compile)
NOTE: recipe procps-4.0.7-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe wayland-protocols-1.49-r0: task do_compile: Started
NOTE: recipe wayland-protocols-1.49-r0: task do_compile: Succeeded
NOTE: Running task 1421 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_install)
NOTE: recipe procps-4.0.7-r0: task do_patch: Succeeded
NOTE: recipe wayland-protocols-1.49-r0: task do_install: Started
NOTE: recipe ca-certificates-20260816-r0: task do_install: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_unpack: Succeeded
NOTE: Running task 1424 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_patch)
NOTE: recipe glibc-2.44+git-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: Running task 1426 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe ncurses-6.6-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.49-r0: task do_install: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe ncurses-6.6-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: Running task 1429 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1431 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_patch)
NOTE: recipe linux-libc-headers-7.2-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_patch: Succeeded
NOTE: Running noexec task 1433 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_configure)
NOTE: Running noexec task 1434 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_compile)
NOTE: Running task 1435 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_install)
NOTE: recipe linux-libc-headers-7.2-r0: task do_install: Started
NOTE: recipe rpm-native-1_6.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1436 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_unpack)
NOTE: recipe rpm-native-1_6.0.2-r0: task do_unpack: Started
NOTE: recipe rpm-native-1_6.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1437 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_patch)
NOTE: recipe rpm-native-1_6.0.2-r0: task do_patch: Started
NOTE: recipe gcc-source-16.2.0-16.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1438 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-source_16.2.bb:do_patch)
NOTE: recipe gcc-source-16.2.0-16.2.0-r0: task do_patch: Started
NOTE: recipe rpm-native-1_6.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1439 of 2004 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_generate_toolchain_file)
NOTE: recipe rpm-native-1_6.0.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe rpm-native-1_6.0.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_install: Succeeded
NOTE: recipe gcc-source-16.2.0-16.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1444 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-source_16.2.bb:do_preconfigure)
NOTE: recipe gcc-source-16.2.0-16.2.0-r0: task do_preconfigure: Started
NOTE: recipe gcc-source-16.2.0-16.2.0-r0: task do_preconfigure: Succeeded
NOTE: Running task 1461 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.44+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.44+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1462 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_configure)
NOTE: recipe glibc-2.44+git-r0: task do_configure: Started
NOTE: recipe glibc-2.44+git-r0: task do_configure: Succeeded
NOTE: Running task 1463 of 2004 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_compile)
NOTE: recipe glibc-2.44+git-r0: task do_compile: Started
NOTE: recipe curl-native-8.23.0-r0: task do_configure: Failed
NOTE: recipe systemd-1_262-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1463 tasks of which 1239 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261015054247.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261015054247.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/curl-native/8.23.0/temp/log.do_configure.1463469
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: curl-native-8.23.0-r0 do_configure: QA Issue: curl-native: configure was passed unrecognised options: --disable-smb [unknown-configure-option]
ERROR: curl-native-8.23.0-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/curl-native/8.23.0/temp/log.do_configure.1463469
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_configure) failed with exit code '1'

--===============0728011982034595102==--

