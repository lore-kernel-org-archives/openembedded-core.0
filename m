Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D9DCD5BBD
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:49 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34830.1778851231454480199
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=P/TDYFRH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=uL36KTcs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019e2bcbdd05-ef8f4e70-2588-4f3c-86fa-8075bd4449fa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851241;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dcaRc5xsI35hctDciWgQwrdN5Dm7kXWcQHs0YQhl7CY=;
	b=P/TDYFRH2Ifsv6iSbjhnHe4fxAEQURPFxUsn66ZEb++J5iXcPuCMUMCyikg62jQW
	k17TkqzMZH96hLetNJcQQek+f3gdCRwO+jNv/Wc+ynvjVdNGrvzK0F3aUmRY6a6h+Jq
	ASgOg5EIuVGje++vzM0wzPOGRDi4tF3rW1aCqrZU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851241;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dcaRc5xsI35hctDciWgQwrdN5Dm7kXWcQHs0YQhl7CY=;
	b=uL36KTcsMiJ0pe3JvXaD29Fm3ZLpdN05CyxpVFkm2ZAEjgdpdFW7O4zJ4hTEDhbj
	CvNKMh1H1SwHcCcvI3OzVgjacsEEWTfgUNBAxipk0Fft8XHXBNebXVNgPjAVBX1uuw/
	C4YMkL5BUuFa13jPgA2Lpi6mLJjh12utjBVf2uNQ=
Content-Type: multipart/mixed; boundary="===============7095926343946791229=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] curl: upgrading to 8.20.0 FAILED
Message-ID: <0101019e2bcbdd05-ef8f4e70-2588-4f3c-86fa-8075bd4449fa-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237160

--===============7095926343946791229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *curl* to *8.20.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-curl-upgrade-8.19.0-8.20.0.patch
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
From b80a993da0669a900cd76e03997431185fa617e3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 12:01:26 +0000
Subject: [PATCH] curl: upgrade 8.19.0 -> 8.20.0

---
 meta/recipes-support/curl/curl/no-test-timeout.patch         | 4 ++--
 meta/recipes-support/curl/{curl_8.19.0.bb => curl_8.20.0.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/curl/{curl_8.19.0.bb => curl_8.20.0.bb} (98%)

diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/recipes-support/curl/curl/no-test-timeout.patch
index 3ece55cab6..8cc5555bb1 100644
--- a/meta/recipes-support/curl/curl/no-test-timeout.patch
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -1,4 +1,4 @@
-From 30fb6d1ce4cc721feef5665934f2b7f83fb50efb Mon Sep 17 00:00:00 2001
+From 7e6072697ddb1157bc6288452b8b497461b8d7ed Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 15 Mar 2024 14:37:37 +0000
 Subject: [PATCH] Set the max-time timeout to 600 so the timeout is 10 minutes
@@ -12,7 +12,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/servers.pm b/tests/servers.pm
-index 5d5d98b..442cfaf 100644
+index dba3c3e..198d4a8 100644
 --- a/tests/servers.pm
 +++ b/tests/servers.pm
 @@ -124,7 +124,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.20.0.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.19.0.bb
rename to meta/recipes-support/curl/curl_8.20.0.bb
index b9251336b8..1e1ee980b4 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.20.0.bb
@@ -20,7 +20,7 @@ SRC_URI:append:class-nativesdk = " \
     file://environment.d-curl.sh \
 "
 
-SRC_URI[sha256sum] = "4eb41489790d19e190d7ac7e18e82857cdd68af8f4e66b292ced562d333f11df"
+SRC_URI[sha256sum] = "63fe2dc148ba0ceae89922ef838f7e5c946272c2e78b7c59fab4b79d3ce2b896"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.47.1


--===============7095926343946791229==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-curl-upgrade-8.19.0-8.20.0.patch"

RnJvbSBiODBhOTkzZGEwNjY5YTkwMGNkNzZlMDM5OTc0MzExODVmYTYxN2UzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMTI6MDE6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
dXJsOiB1cGdyYWRlIDguMTkuMCAtPiA4LjIwLjAKCi0tLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Y3VybC9jdXJsL25vLXRlc3QtdGltZW91dC5wYXRjaCAgICAgICAgIHwgNCArKy0tCiBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9jdXJsL3tjdXJsXzguMTkuMC5iYiA9PiBjdXJsXzguMjAuMC5iYn0gfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL3tjdXJsXzguMTkuMC5iYiA9PiBjdXJsXzgu
MjAuMC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1
cmwvbm8tdGVzdC10aW1lb3V0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJs
L25vLXRlc3QtdGltZW91dC5wYXRjaAppbmRleCAzZWNlNTVjYWI2Li44Y2M1NTU1YmIxIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmwvbm8tdGVzdC10aW1lb3V0LnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybC9uby10ZXN0LXRpbWVvdXQu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDMwZmI2ZDFjZTRjYzcyMWZlZWY1NjY1OTM0ZjJi
N2Y4M2ZiNTBlZmIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDdlNjA3MjY5N2RkYjEx
NTdiYzYyODg0NTJiOGI0OTc0NjFiOGQ3ZWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERhdGU6IEZyaSwgMTUgTWFyIDIw
MjQgMTQ6Mzc6MzcgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gU2V0IHRoZSBtYXgtdGltZSB0aW1l
b3V0IHRvIDYwMCBzbyB0aGUgdGltZW91dCBpcyAxMCBtaW51dGVzCkBAIC0xMiw3ICsxMiw3IEBA
IFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEv
dGVzdHMvc2VydmVycy5wbSBiL3Rlc3RzL3NlcnZlcnMucG0KLWluZGV4IDVkNWQ5OGIuLjQ0MmNm
YWYgMTAwNjQ0CitpbmRleCBkYmEzYzNlLi4xOThkNGE4IDEwMDY0NAogLS0tIGEvdGVzdHMvc2Vy
dmVycy5wbQogKysrIGIvdGVzdHMvc2VydmVycy5wbQogQEAgLTEyNCw3ICsxMjQsNyBAQCBteSAk
c3NoZHZlcnN0cjsgICMgZm9yIHNvY2tzIHNlcnZlciwgc3NoIGRhZW1vbiB2ZXJzaW9uIHN0cmlu
ZwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzguMTkuMC5iYiBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybF84LjIwLjAuYmIKc2ltaWxhcml0eSBpbmRl
eCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzguMTkuMC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzguMjAuMC5iYgppbmRl
eCBiOTI1MTMzNmI4Li4xZTFlZTk4MGI0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9jdXJsL2N1cmxfOC4xOS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3Vy
bF84LjIwLjAuYmIKQEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZl
c2RrID0gIiBcCiAgICAgZmlsZTovL2Vudmlyb25tZW50LmQtY3VybC5zaCBcCiAiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI0ZWI0MTQ4OTc5MGQxOWUxOTBkN2FjN2UxOGU4Mjg1N2NkZDY4YWY4
ZjRlNjZiMjkyY2VkNTYyZDMzM2YxMWRmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjYzZmUyZGMx
NDhiYTBjZWFlODk5MjJlZjgzOGY3ZTVjOTQ2MjcyYzJlNzhiN2M1OWZhYjRiNzlkM2NlMmI4OTYi
CiAKICMgQ3VybCBoYXMgdXNlZCBtYW55IG5hbWVzIG92ZXIgdGhlIHllYXJzLi4uCiBDVkVfUFJP
RFVDVCA9ICJoYXh4OmN1cmwgaGF4eDpsaWJjdXJsIGN1cmw6Y3VybCBjdXJsOmxpYmN1cmwgbGli
Y3VybDpsaWJjdXJsIGRhbmllbF9zdGVuYmVyZzpjdXJsIgotLSAKMi40Ny4xCgo=

--===============7095926343946791229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1974 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-85337c6dd4a53b53884ba17677b6e1b985675b19"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:85337c6dd4a53b53884ba17677b6e1b985675b19"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 279 Local 106 Mirrors 0 Missed 173 Current 526 (37% match, 78% complete)
done.
Removing 4 stale sstate objects for arch x86_64...done.
Removing 5 stale sstate objects for arch allarch...done.
Removing 58 stale sstate objects for arch qemux86_64...done.
Removing 56 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 627 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.43.bb:do_create_spdx_setscene)
NOTE: Running setscene task 640 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.43.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 652 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 671 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 680 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 736 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 794 of 805 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 708 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_recipe_qa)
NOTE: recipe cross-localedef-native-2.43+git-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1148 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_recipe_qa)
NOTE: recipe glibc-locale-2.43+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glibc-locale-2.43+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cross-localedef-native-2.43+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-native-8.20.0-r0: task do_recipe_qa: Started
NOTE: recipe glibc-locale-2.43+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 1343 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.20.0-r0: task do_recipe_qa: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 1389 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb:do_configure)
NOTE: Running setscene task 803 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1413 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_fetch)
NOTE: recipe wayland-protocols-1.48-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ca-certificates-20260223-r0: task do_configure: Started
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-locale-2.43+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-native-8.20.0-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 804 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_stash_locale_setscene)
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_recipe_qa unihash changed to 84f43f14ce7f27e1538751d947ef28805763bc0132e77a76ccf767003ad8daf0
NOTE: recipe rpm-native-1_4.20.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe curl-8.20.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe ca-certificates-20260223-r0: task do_configure: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_stash_locale_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_recipe_qa unihash changed to 6444b15b5658500db2a742f1dfa372bb132cfe12ce407b8aa0afff675c63b249
NOTE: recipe rpm-native-1_4.20.1-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-protocols-1.48-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 698 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1456 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_fetch)
NOTE: Running task 1457 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_unpack)
NOTE: Running task 1458 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_fetch)
NOTE: Running task 1459 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_configure)
NOTE: recipe glibc-2.43+git-r1: task do_stash_locale_setscene: Succeeded
NOTE: Running task 1464 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1465 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb:do_compile)
NOTE: Running task 1468 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_create_recipe_spdx)
NOTE: recipe perl-5.42.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_configure: Started
NOTE: recipe curl-8.20.0-r0: task do_fetch: Started
NOTE: recipe ca-certificates-20260223-r0: task do_compile: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_unpack: Started
NOTE: recipe curl-native-8.20.0-r0: task do_fetch: Started
NOTE: recipe curl-8.20.0-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.20.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1469 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_unpack)
NOTE: recipe glibc-2.43+git-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.42.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-native-8.20.0-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1470 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_fetch)
NOTE: Running task 1471 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_unpack)
NOTE: Running task 1472 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.20.0-r0: task do_unpack: Started
NOTE: recipe perl-5.42.0-r0: task do_fetch: Started
NOTE: recipe perl-5.42.0-r0: task do_fetch: Succeeded
NOTE: Running task 1473 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_unpack)
NOTE: recipe curl-native-8.20.0-r0: task do_unpack: Started
NOTE: recipe curl-native-8.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.43+git-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1474 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_configure)
NOTE: recipe curl-8.20.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_unpack: Started
NOTE: recipe ca-certificates-20260223-r0: task do_compile: Succeeded
NOTE: Running task 1475 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb:do_install)
NOTE: recipe glibc-2.43+git-r1: task do_configure: Started
NOTE: recipe curl-native-8.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-8.20.0-r0: task do_unpack: Succeeded
NOTE: recipe curl-native-8.20.0-r0: task do_unpack: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_unpack: Succeeded
NOTE: Running task 1476 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_patch)
NOTE: Running task 1477 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_patch)
NOTE: Running task 1478 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_patch)
NOTE: recipe ca-certificates-20260223-r0: task do_install: Started
NOTE: recipe curl-8.20.0-r0: task do_patch: Started
NOTE: recipe curl-native-8.20.0-r0: task do_patch: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_patch: Started
NOTE: recipe perl-5.42.0-r0: task do_unpack: Succeeded
NOTE: Running task 1479 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch)
NOTE: recipe curl-8.20.0-r0: task do_patch: Succeeded
NOTE: Running task 1480 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1481 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_populate_lic)
NOTE: recipe curl-native-8.20.0-r0: task do_patch: Succeeded
NOTE: Running task 1482 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe perl-5.42.0-r0: task do_patch: Started
NOTE: recipe curl-8.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-8.20.0-r0: task do_populate_lic: Started
NOTE: recipe curl-native-8.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_configure: Succeeded
NOTE: Running task 1483 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_compile)
NOTE: recipe curl-8.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_deploy_source_date_epoch unihash changed to eb738835ccb61b75a36cad17e830aa49ed3e1900252270a9b1c2653d06019b97
NOTE: recipe curl-8.20.0-r0: task do_populate_lic: Succeeded
NOTE: recipe curl-native-8.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_populate_lic unihash changed to 7349f00f87fcb7790d43763a5d3deb745e34bdacb796e838b4579784cb06d273
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_deploy_source_date_epoch unihash changed to 71873bb982da568f480ac961e0be14b74bea0c60d0495223b1b46868024e10b0
NOTE: recipe wayland-protocols-1.48-r0: task do_compile: Started
NOTE: recipe perl-5.42.0-r0: task do_patch: Succeeded
NOTE: recipe wayland-protocols-1.48-r0: task do_compile: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1484 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_configure)
NOTE: Running task 1485 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_generate_toolchain_file)
NOTE: Running task 1488 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_install)
NOTE: recipe ca-certificates-20260223-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe wayland-protocols-1.48-r0: task do_install: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe curl-native-8.20.0-r0: task do_configure: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe wayland-protocols-1.48-r0: task do_install: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1491 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_compile)
NOTE: recipe glibc-2.43+git-r1: task do_compile: Started
NOTE: recipe curl-native-8.20.0-r0: task do_configure: Failed
NOTE: recipe glibc-2.43+git-r1: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1491 tasks of which 1460 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515120002.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515120002.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/curl-native/8.20.0/temp/log.do_configure.3051550
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: curl-native-8.20.0-r0 do_configure: QA Issue: curl-native: configure was passed unrecognised options: --without-librtmp [unknown-configure-option]
ERROR: curl-native-8.20.0-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/curl-native/8.20.0/temp/log.do_configure.3051550
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_configure) failed with exit code '1'

--===============7095926343946791229==--

