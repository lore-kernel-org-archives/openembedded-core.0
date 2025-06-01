Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022A1C83027
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:57 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.27795.1748786153764330310
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=0QShzYnB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=VR4/sQED;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101972bc70511-2b0aaff0-f13f-4b44-bc05-be0db87a35ae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786153;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=K6Nlkonw/sFJg3NXhIV85VrknlEwr+8AqBrpQfTUoM8=;
	b=0QShzYnBxUVeqIJkz7KiHdeh4WOicOHnBvbRh3C3Ia1St7EKPEYqnHvIj9FWdpxh
	U31qak02nCmPLLelBsfQq2Q1k1DsXnoVFSJWy9kEiemYw/bSK0FV69Atl826oonzBCs
	p4zd65b3/rBQM/Tu0sIAk3AvIwYRYa8UVKpSEKkM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786153;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=K6Nlkonw/sFJg3NXhIV85VrknlEwr+8AqBrpQfTUoM8=;
	b=VR4/sQED60qWwy7i+93E2N3M1xujus1LWgxrUO43VlXysKXllBhBfFfb6Vzmdivo
	zNKYwYrZBdiLJqL/CvXG2EDmJqKzbIsW/KoOJwtNLaGpooNnsgnXubPMgq8YEyaSEDK
	SBFfK36TePpa3yNGHHZ49asPN+xYTDz2SMD7fVtY=
Content-Type: multipart/mixed; boundary="===============5539625843868390972=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] curl: upgrading to 8.14.0 FAILED
Message-ID: <010101972bc70511-2b0aaff0-f13f-4b44-bc05-be0db87a35ae-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217666

--===============5539625843868390972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *curl* to *8.14.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-curl-upgrade-8.12.1-8.14.0.patch
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
From bd1382c49bb2be22933a7b396d24413ad26acd5d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 13:29:21 +0000
Subject: [PATCH] curl: upgrade 8.12.1 -> 8.14.0

---
 meta/recipes-support/curl/curl/no-test-timeout.patch        | 6 +++---
 .../recipes-support/curl/{curl_8.12.1.bb => curl_8.14.0.bb} | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/curl/{curl_8.12.1.bb => curl_8.14.0.bb} (98%)

diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/recipes-support/curl/curl/no-test-timeout.patch
index 677d177302..4996f2d129 100644
--- a/meta/recipes-support/curl/curl/no-test-timeout.patch
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -1,4 +1,4 @@
-From 42cddb52e821cfc2f09f1974742714e5f2f1856e Mon Sep 17 00:00:00 2001
+From 89ef44903e19b3ffebcdc1117443fee39e5a53a1 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 15 Mar 2024 14:37:37 +0000
 Subject: [PATCH] Set the max-time timeout to 600 so the timeout is 10 minutes
@@ -11,10 +11,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/servers.pm b/tests/servers.pm
-index d4472d5..9999938 100644
+index 9389c6f..7f23763 100644
 --- a/tests/servers.pm
 +++ b/tests/servers.pm
-@@ -123,7 +123,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
+@@ -124,7 +124,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
  my $sshderror;   # for socks server, ssh daemon version error
  my %doesntrun;    # servers that don't work, identified by pidfile
  my %PORT = (nolisten => 47); # port we use for a local non-listening service
diff --git a/meta/recipes-support/curl/curl_8.12.1.bb b/meta/recipes-support/curl/curl_8.14.0.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.12.1.bb
rename to meta/recipes-support/curl/curl_8.14.0.bb
index 4192693da8..e4788e7790 100644
--- a/meta/recipes-support/curl/curl_8.12.1.bb
+++ b/meta/recipes-support/curl/curl_8.14.0.bb
@@ -20,7 +20,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-curl.sh \
 "
 
-SRC_URI[sha256sum] = "0341f1ed97a26c811abaebd37d62b833956792b7607ea3f15d001613c76de202"
+SRC_URI[sha256sum] = "b3634cfc538c72c9c6ca794ef4c73d7fdbd171e8dee2db837d83a5e45231002a"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.47.1


--===============5539625843868390972==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-curl-upgrade-8.12.1-8.14.0.patch"

RnJvbSBiZDEzODJjNDliYjJiZTIyOTMzYTdiMzk2ZDI0NDEzYWQyNmFjZDVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAxMzoyOToyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGN1
cmw6IHVwZ3JhZGUgOC4xMi4xIC0+IDguMTQuMAoKLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9j
dXJsL2N1cmwvbm8tdGVzdC10aW1lb3V0LnBhdGNoICAgICAgICB8IDYgKysrLS0tCiAuLi4vcmVj
aXBlcy1zdXBwb3J0L2N1cmwve2N1cmxfOC4xMi4xLmJiID0+IGN1cmxfOC4xNC4wLmJifSB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwve2N1cmxfOC4xMi4xLmJiID0+IGN1cmxfOC4x
NC4wLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3Vy
bC9uby10ZXN0LXRpbWVvdXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmwv
bm8tdGVzdC10aW1lb3V0LnBhdGNoCmluZGV4IDY3N2QxNzczMDIuLjQ5OTZmMmQxMjkgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybC9uby10ZXN0LXRpbWVvdXQucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsL25vLXRlc3QtdGltZW91dC5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDJjZGRiNTJlODIxY2ZjMmYwOWYxOTc0NzQyNzE0
ZTVmMmYxODU2ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODllZjQ0OTAzZTE5YjNm
ZmViY2RjMTExNzQ0M2ZlZTM5ZTVhNTNhMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogRGF0ZTogRnJpLCAxNSBNYXIgMjAy
NCAxNDozNzozNyArMDAwMAogU3ViamVjdDogW1BBVENIXSBTZXQgdGhlIG1heC10aW1lIHRpbWVv
dXQgdG8gNjAwIHNvIHRoZSB0aW1lb3V0IGlzIDEwIG1pbnV0ZXMKQEAgLTExLDEwICsxMSwxMCBA
QCBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBh
L3Rlc3RzL3NlcnZlcnMucG0gYi90ZXN0cy9zZXJ2ZXJzLnBtCi1pbmRleCBkNDQ3MmQ1Li45OTk5
OTM4IDEwMDY0NAoraW5kZXggOTM4OWM2Zi4uN2YyMzc2MyAxMDA2NDQKIC0tLSBhL3Rlc3RzL3Nl
cnZlcnMucG0KICsrKyBiL3Rlc3RzL3NlcnZlcnMucG0KLUBAIC0xMjMsNyArMTIzLDcgQEAgbXkg
JHNzaGR2ZXJzdHI7ICAjIGZvciBzb2NrcyBzZXJ2ZXIsIHNzaCBkYWVtb24gdmVyc2lvbiBzdHJp
bmcKK0BAIC0xMjQsNyArMTI0LDcgQEAgbXkgJHNzaGR2ZXJzdHI7ICAjIGZvciBzb2NrcyBzZXJ2
ZXIsIHNzaCBkYWVtb24gdmVyc2lvbiBzdHJpbmcKICBteSAkc3NoZGVycm9yOyAgICMgZm9yIHNv
Y2tzIHNlcnZlciwgc3NoIGRhZW1vbiB2ZXJzaW9uIGVycm9yCiAgbXkgJWRvZXNudHJ1bjsgICAg
IyBzZXJ2ZXJzIHRoYXQgZG9uJ3Qgd29yaywgaWRlbnRpZmllZCBieSBwaWRmaWxlCiAgbXkgJVBP
UlQgPSAobm9saXN0ZW4gPT4gNDcpOyAjIHBvcnQgd2UgdXNlIGZvciBhIGxvY2FsIG5vbi1saXN0
ZW5pbmcgc2VydmljZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJs
XzguMTIuMS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybF84LjE0LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9j
dXJsXzguMTIuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzgu
MTQuMC5iYgppbmRleCA0MTkyNjkzZGE4Li5lNDc4OGU3NzkwIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfOC4xMi4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2N1cmwvY3VybF84LjE0LjAuYmIKQEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSTphcHBlbmQ6
Y2xhc3MtbmF0aXZlc2RrID0gIiBcCiAgICAgICAgICAgIGZpbGU6Ly9lbnZpcm9ubWVudC5kLWN1
cmwuc2ggXAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDM0MWYxZWQ5N2EyNmM4MTFhYmFl
YmQzN2Q2MmI4MzM5NTY3OTJiNzYwN2VhM2YxNWQwMDE2MTNjNzZkZTIwMiIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICJiMzYzNGNmYzUzOGM3MmM5YzZjYTc5NGVmNGM3M2Q3ZmRiZDE3MWU4ZGVlMmRi
ODM3ZDgzYTVlNDUyMzEwMDJhIgogCiAjIEN1cmwgaGFzIHVzZWQgbWFueSBuYW1lcyBvdmVyIHRo
ZSB5ZWFycy4uLgogQ1ZFX1BST0RVQ1QgPSAiaGF4eDpjdXJsIGhheHg6bGliY3VybCBjdXJsOmN1
cmwgY3VybDpsaWJjdXJsIGxpYmN1cmw6bGliY3VybCBkYW5pZWxfc3RlbmJlcmc6Y3VybCIKLS0g
CjIuNDcuMQoK

--===============5539625843868390972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1917 entries from dependency cache.
Parsing recipes...done.
Parsing of 936 .bb files complete (935 cached, 1 parsed). 1915 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:30b7b03f08bdb96b698ce481da495527c1d7332e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 464 Local 283 Mirrors 0 Missed 181 Current 279 (60% match, 75% complete)
Removing 4 stale sstate objects for arch x86_64...done.
Removing 62 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch allarch...done.
Removing 12 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 401 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 428 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 436 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 441 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 442 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 445 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 450 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 453 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 454 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cross-localedef-native-2.41+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cross-localedef-native-2.41+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 456 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 457 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 458 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-initial-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 459 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 460 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 461 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 494 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 556 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 560 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 564 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 568 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 570 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 573 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 574 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_stash_locale_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 575 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 576 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_257.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 586 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 593 of 743 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 597 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 598 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 599 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_257.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 600 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 601 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.9.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 608 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 609 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 610 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.40.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.9.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 414 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_fetch)
NOTE: Running setscene task 611 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 612 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_257.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 613 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Succeeded
NOTE: Running setscene task 614 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 615 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_257.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 616 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 617 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.9.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 618 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 485 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_unpack)
NOTE: Running setscene task 619 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 620 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 621 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 622 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 623 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 624 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 625 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 626 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 627 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 628 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_257.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 630 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 631 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 632 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 633 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 634 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 635 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 636 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_257.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 637 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.9.2.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 638 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 639 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 640 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 641 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 642 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.9.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 643 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 644 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 645 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 646 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 648 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 649 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 486 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.9.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 650 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 652 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 653 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 654 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 655 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 656 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 657 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 658 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 659 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 660 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 662 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 663 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 664 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_recipe_qa_setscene)
NOTE: Running task 550 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 665 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 668 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 669 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.14.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 671 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 672 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 673 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 674 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Started
NOTE: Running setscene task 675 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 676 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 569 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 677 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 678 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 679 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Started
NOTE: Running noexec task 626 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 681 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 685 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: Running noexec task 632 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_fetch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 640 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 686 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 648 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: recipe python3-setuptools-80.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 650 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_fetch)
NOTE: recipe util-linux-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 687 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 689 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 690 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 661 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_recipe_qa)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-80.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 675 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 684 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_unpack)
NOTE: recipe python3-3.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 695 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-80.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 691 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 692 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 693 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 694 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe curl-native-8.14.0-r0: task do_recipe_qa: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 715 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe openssl-3.5.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-80.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 755 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 768 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-80.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 695 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 696 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running task 801 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 879 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_write_config)
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Started
NOTE: Running task 907 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: Running task 915 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_fetch)
NOTE: Running task 917 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 919 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_fetch)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 920 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_unpack)
NOTE: Running setscene task 697 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-native-8.14.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 698 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 702 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Started
NOTE: recipe libxml2-2.14.3-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 703 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_fetch: Started
NOTE: Running setscene task 704 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 705 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 706 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 709 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 710 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 921 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: Running setscene task 711 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 712 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 714 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 715 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 717 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 718 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 719 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_recipe_qa_setscene)
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 720 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 721 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 722 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 724 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe libxcrypt-4.4.38-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 725 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 726 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 727 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 729 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 730 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 731 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 732 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 923 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_fetch)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: Running task 926 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_fetch)
NOTE: recipe python3-3.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 927 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_patch)
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 733 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 929 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_fetch)
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 931 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 734 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 735 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe curl-native-8.14.0-r0: task do_fetch: Started
NOTE: Running task 933 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 936 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_patch: Started
NOTE: recipe curl-native-8.14.0-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 736 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_fetch: Started
NOTE: Running setscene task 737 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 938 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_fetch)
NOTE: Running task 939 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_unpack)
NOTE: recipe libffi-3.4.8-r0: task do_fetch: Started
NOTE: recipe gdbm-1.24-r0: task do_fetch: Succeeded
NOTE: Running task 940 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_unpack)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 941 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 942 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_fetch)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Started
NOTE: Running task 944 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 947 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_unpack: Started
NOTE: Running task 948 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_unpack)
NOTE: recipe curl-native-8.14.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_fetch: Started
NOTE: Running setscene task 738 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running task 950 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_fetch: Started
NOTE: Running task 952 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_fetch)
NOTE: Running task 953 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_unpack)
NOTE: Running task 954 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_fetch)
NOTE: recipe curl-native-8.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Started
NOTE: recipe xz-5.8.1-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_unpack: Succeeded
NOTE: Running task 955 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_unpack)
NOTE: recipe openssl-3.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 956 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_patch)
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Succeeded
NOTE: Running task 957 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_patch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 959 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_fetch)
NOTE: recipe expat-2.7.1-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 960 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 962 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: recipe xz-5.8.1-r0: task do_unpack: Started
NOTE: Running task 963 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_unpack)
NOTE: recipe gdbm-1.24-r0: task do_patch: Started
NOTE: recipe openssl-3.5.0-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe expat-2.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 964 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_patch)
NOTE: recipe python3-3.13.3-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 965 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe xz-5.8.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.13.3-r0: task do_fetch: Succeeded
NOTE: Running task 966 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_patch)
NOTE: Running task 967 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: Running task 969 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_unpack)
NOTE: recipe curl-native-8.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 970 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: Running task 971 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_unpack)
NOTE: recipe expat-2.7.1-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe curl-native-8.14.0-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_patch: Succeeded
NOTE: Running task 972 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_patch)
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Succeeded
NOTE: Running task 974 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_unpack)
NOTE: Running task 975 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_patch)
NOTE: recipe libffi-3.4.8-r0: task do_unpack: Started
NOTE: recipe xz-5.8.1-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_unpack: Started
NOTE: recipe expat-2.7.1-r0: task do_patch: Succeeded
NOTE: Running task 976 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_generate_toolchain_file)
NOTE: recipe libffi-3.4.8-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Started
NOTE: Running task 978 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_patch)
NOTE: recipe xz-5.8.1-r0: task do_patch: Succeeded
NOTE: recipe curl-native-8.14.0-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_patch: Succeeded
NOTE: Running task 980 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_unpack)
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Succeeded
NOTE: Running task 984 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_patch)
NOTE: Running task 985 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_patch)
NOTE: Running task 986 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_unpack)
NOTE: Running task 987 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_patch)
NOTE: recipe expat-2.7.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_patch: Started
NOTE: Running task 988 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: recipe expat-2.7.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Started
NOTE: Running task 990 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_fetch)
NOTE: recipe curl-native-8.14.0-r0: task do_patch: Succeeded
NOTE: Running task 991 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpam-1.7.0-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Started
NOTE: recipe python3-3.13.3-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 994 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 995 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_fetch)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Succeeded
NOTE: Running task 997 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_unpack)
NOTE: Running task 998 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: recipe libffi-3.4.8-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe curl-native-8.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Succeeded
NOTE: Running task 1001 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_unpack)
NOTE: Running task 1002 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_unpack)
NOTE: Running task 1004 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_unpack)
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.45-r0: task do_fetch: Succeeded
NOTE: Running task 1012 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_unpack)
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Started
NOTE: recipe libxml2-2.14.3-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1030 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: recipe util-linux-2.41-r0: task do_unpack: Started
NOTE: Running task 1041 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_unpack: Succeeded
NOTE: Running task 1042 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_patch)
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Succeeded
NOTE: Running task 1043 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_patch)
NOTE: recipe libpcre2-10.45-r0: task do_unpack: Started
NOTE: recipe curl-native-8.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1044 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_configure)
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe libunistring-1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1046 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_patch)
NOTE: Running task 1047 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_patch: Started
NOTE: Running task 1053 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.8.0.bb:do_fetch)
NOTE: Running task 1055 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_fetch)
NOTE: recipe glibc-2.41+git-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: Running task 1056 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-80.8.0-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-80.8.0-r0: task do_fetch: Succeeded
NOTE: recipe curl-native-8.14.0-r0: task do_configure: Started
NOTE: Running task 1060 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Succeeded
NOTE: Running task 1062 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_fetch)
NOTE: Running task 1063 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: Running task 1065 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_recipe_qa)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1069 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_fetch)
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.45-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1070 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_patch)
NOTE: Running task 1071 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Succeeded
NOTE: Running task 1072 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_patch)
NOTE: recipe curl-8.14.0-r0: task do_recipe_qa: Started
NOTE: Running task 1075 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_fetch: Succeeded
NOTE: Running task 1080 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_fetch)
NOTE: Running task 1081 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe libpcre2-10.45-r0: task do_patch: Started
NOTE: recipe perl-5.40.2-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Started
NOTE: recipe libunistring-1.3-r0: task do_unpack: Started
NOTE: recipe perl-5.40.2-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.14.3-r0: task do_unpack: Succeeded
NOTE: Running task 1082 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.8.0.bb:do_unpack)
NOTE: Running task 1083 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_patch)
NOTE: recipe util-linux-2.41-r0: task do_unpack: Succeeded
NOTE: Running task 1084 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_patch)
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_patch: Succeeded
NOTE: Running task 1086 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_unpack)
NOTE: recipe libpcre2-10.45-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.14.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1095 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: Running task 1096 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_unpack)
NOTE: Running task 1097 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_fetch)
NOTE: recipe python3-setuptools-80.8.0-r0: task do_unpack: Started
NOTE: recipe libxml2-2.14.3-r0: task do_patch: Started
NOTE: recipe util-linux-2.41-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Succeeded
NOTE: Running task 1099 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: Running task 1101 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_unpack)
NOTE: recipe python3-setuptools-80.8.0-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Started
NOTE: Running task 1102 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.8.0.bb:do_patch)
NOTE: recipe curl-8.14.0-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.14.0-r0: task do_fetch: Succeeded
NOTE: Running task 1103 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_unpack)
NOTE: recipe libunistring-1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1104 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_unpack)
NOTE: Running task 1105 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_patch)
NOTE: recipe base-passwd-3.6.7-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-80.8.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_unpack: Started
NOTE: recipe libxml2-2.14.3-r0: task do_patch: Succeeded
NOTE: Running task 1109 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_fetch)
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_unpack: Started
NOTE: recipe curl-8.14.0-r0: task do_unpack: Started
NOTE: Running task 1110 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_patch)
NOTE: recipe libunistring-1.3-r0: task do_patch: Started
NOTE: Running task 1111 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.13.3-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Succeeded
NOTE: Running task 1112 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: recipe base-passwd-3.6.7-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: recipe wayland-1.23.1-r0: task do_patch: Started
NOTE: Running task 1113 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_patch)
NOTE: Running task 1114 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_patch)
NOTE: Running task 1115 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_patch)
NOTE: recipe python3-setuptools-80.8.0-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_patch: Succeeded
NOTE: Running task 1118 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_unpack)
NOTE: Running task 1119 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Started
NOTE: recipe wayland-1.23.1-r0: task do_patch: Succeeded
NOTE: Running task 1130 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_fetch)
NOTE: Running task 1131 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe python3-3.13.3-r0: task do_patch: Started
NOTE: recipe util-linux-2.41-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Succeeded
NOTE: Running task 1154 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_unpack)
NOTE: Running task 1156 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: Running task 1158 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_write_config)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running task 1159 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe shadow-4.17.4-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1164 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_write_config)
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Started
NOTE: recipe shadow-4.17.4-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.14.0-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: Running task 1166 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_patch)
NOTE: Running task 1167 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_write_config)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 1168 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_unpack: Succeeded
NOTE: Running task 1169 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_patch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Succeeded
NOTE: Running task 1172 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_unpack)
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Started
NOTE: recipe curl-8.14.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_write_config: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Started
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: Running task 1173 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: Running task 1174 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_patch: Started
NOTE: recipe shadow-4.17.4-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_write_config: Succeeded
NOTE: Running task 1184 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe glibc-2.41+git-r0: task do_patch: Succeeded
NOTE: recipe curl-8.14.0-r0: task do_patch: Succeeded
NOTE: Running task 1187 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running task 1188 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1194 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: Running task 1195 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_patch: Succeeded
NOTE: recipe curl-8.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1209 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_fetch)
NOTE: Running task 1210 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_fetch)
NOTE: Running task 1211 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_fetch)
NOTE: Running task 1212 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: Running task 1216 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1217 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Started
NOTE: Running task 1220 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe perl-5.40.2-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1221 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_patch)
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1222 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: Running task 1223 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1241 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_fetch)
NOTE: Running task 1243 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1248 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1250 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_unpack)
NOTE: Running task 1252 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_unpack)
NOTE: Running task 1253 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Started
NOTE: Running task 1254 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe ca-certificates-20250419-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1255 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: Running task 1272 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Started
NOTE: recipe ca-certificates-20250419-r0: task do_fetch: Succeeded
NOTE: Running task 1273 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Started
NOTE: Running task 1274 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.9.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1275 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1278 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 1279 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.9.2-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1280 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_patch)
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: Running task 1281 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1282 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_patch)
NOTE: Running task 1283 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: Running task 1284 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: Running task 1285 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Started
NOTE: Running task 1286 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Started
NOTE: recipe kmod-34.2-r0: task do_fetch: Started
NOTE: recipe libcap-2.76-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.76-r0: task do_fetch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.9.2-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.13.3-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 740 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running task 1299 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_patch)
NOTE: Running task 1300 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: Running task 1301 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running task 1305 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_unpack)
NOTE: Running task 1307 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: Running task 1311 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_unpack)
NOTE: Running task 1338 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: Running task 1339 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.9.2.bb:do_unpack)
NOTE: Running task 1341 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: Running task 1342 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_unpack)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1343 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_unpack)
NOTE: Running task 1346 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_fetch)
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe ca-certificates-20250419-r0: task do_unpack: Started
NOTE: recipe shadow-4.17.4-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_unpack: Started
NOTE: recipe libcap-2.76-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.9.2-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Succeeded
NOTE: Running task 1347 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_patch)
NOTE: recipe kmod-34.2-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1348 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_collect_spdx_deps)
NOTE: recipe systemd-1_257.5-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_unpack: Succeeded
NOTE: Running task 1349 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: Running task 1350 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_patch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Succeeded
NOTE: Running task 1351 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: Running task 1352 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_patch)
NOTE: recipe libcap-2.76-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_patch: Succeeded
NOTE: Running task 1353 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_patch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Succeeded
NOTE: Running task 1361 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_write_config)
NOTE: Running noexec task 1363 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_configure)
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running noexec task 1364 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_compile)
NOTE: Running task 1365 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_install)
NOTE: recipe kmod-34.2-r0: task do_unpack: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: Running task 1369 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: Running task 1374 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe libcap-2.76-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Started
NOTE: Running task 1382 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Started
NOTE: recipe libcap-2.76-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_257.5-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_install: Started
NOTE: Running task 1416 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1417 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.9.2.bb:do_write_config)
NOTE: Running task 1419 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_unpack)
NOTE: recipe initscripts-1.0-r0: task do_patch: Started
NOTE: Running task 1421 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe kmod-34.2-r0: task do_patch: Started
NOTE: Running task 1422 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_write_config)
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ca-certificates-20250419-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmod-34.2-r0: task do_patch: Succeeded
NOTE: Running task 1430 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: Running task 1431 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_fetch)
NOTE: Running task 1440 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_warn_musl)
NOTE: Running task 1441 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_write_config)
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.9.2-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmod-34.2-r0: task do_write_config: Started
NOTE: recipe initscripts-1.0-r0: task do_patch: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_patch: Succeeded
NOTE: Running task 1444 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_configure)
NOTE: Running task 1446 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe systemd-1_257.5-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.9.2-r0: task do_write_config: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe procps-4.0.5-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe kmod-34.2-r0: task do_write_config: Succeeded
NOTE: Running task 1470 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: Running task 1475 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_collect_spdx_deps)
NOTE: Running task 1477 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_populate_lic)
NOTE: recipe systemd-1_257.5-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_257.5-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.9.2-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_257.5-r0: task do_warn_musl: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_configure: Started
NOTE: Running task 1478 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.9.2.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe ca-certificates-20250419-r0: task do_collect_spdx_deps: Started
NOTE: recipe systemd-1_257.5-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_configure: Succeeded
NOTE: recipe curl-8.14.0-r0: task do_populate_lic: Started
NOTE: Running task 1479 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_compile)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1480 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: Running task 1481 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.9.2-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1482 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: Running task 1483 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_unpack)
NOTE: recipe ca-certificates-20250419-r0: task do_compile: Started
NOTE: recipe initscripts-1.0-r0: task do_compile: Started
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: Running task 1484 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.9.2-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1486 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_install: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: recipe curl-8.14.0-r0: task do_populate_lic: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_compile: Succeeded
NOTE: Running task 1489 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_install)
NOTE: recipe ca-certificates-20250419-r0: task do_install: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: Running task 1490 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe procps-4.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1491 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_patch)
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe procps-4.0.5-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_257.5-r0: task do_unpack: Succeeded
NOTE: Running task 1494 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_patch)
NOTE: recipe systemd-1_257.5-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_install: Succeeded
NOTE: recipe systemd-1_257.5-r0: task do_patch: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_install: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_install: Succeeded
NOTE: Running task 1512 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.41+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.41+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1513 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_configure)
NOTE: recipe glibc-2.41+git-r0: task do_configure: Started
NOTE: recipe glibc-2.41+git-r0: task do_configure: Succeeded
NOTE: Running task 1514 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_compile)
NOTE: recipe glibc-2.41+git-r0: task do_compile: Started
NOTE: recipe curl-native-8.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1515 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_compile)
NOTE: recipe curl-native-8.14.0-r0: task do_compile: Started
NOTE: recipe curl-native-8.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1516 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_install)
NOTE: recipe curl-native-8.14.0-r0: task do_install: Started
NOTE: recipe curl-native-8.14.0-r0: task do_install: Succeeded
NOTE: Running task 1517 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_populate_sysroot)
NOTE: recipe curl-native-8.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-native-8.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1518 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1519 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_configure)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1520 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_compile)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1521 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_install)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_install: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 1522 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1523 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-native-0.192-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-native-0.192-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1524 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_configure)
NOTE: recipe elfutils-native-0.192-r0: task do_configure: Started
NOTE: recipe elfutils-native-0.192-r0: task do_configure: Succeeded
NOTE: Running task 1525 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_compile)
NOTE: recipe elfutils-native-0.192-r0: task do_compile: Started
NOTE: recipe elfutils-native-0.192-r0: task do_compile: Succeeded
NOTE: Running task 1526 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_install)
NOTE: recipe elfutils-native-0.192-r0: task do_install: Started
NOTE: recipe elfutils-native-0.192-r0: task do_install: Succeeded
NOTE: Running task 1527 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_populate_sysroot)
NOTE: recipe elfutils-native-0.192-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-native-0.192-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1528 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1529 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_prepare_recipe_sysroot)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-native-1_4.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1530 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_configure)
NOTE: recipe rpm-native-1_4.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1531 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_configure)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_configure: Started
NOTE: recipe rpm-native-1_4.20.0-r0: task do_configure: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1532 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_compile)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_compile: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1533 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_install)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_install: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_install: Succeeded
NOTE: Running task 1534 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-native-1_4.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1535 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_compile)
NOTE: recipe rpm-native-1_4.20.0-r0: task do_compile: Started
NOTE: recipe glibc-2.41+git-r0: task do_compile: Succeeded
NOTE: Running task 1536 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_install)
NOTE: recipe glibc-2.41+git-r0: task do_install: Started
NOTE: recipe rpm-native-1_4.20.0-r0: task do_compile: Succeeded
NOTE: Running task 1537 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_install)
NOTE: recipe rpm-native-1_4.20.0-r0: task do_install: Started
NOTE: recipe rpm-native-1_4.20.0-r0: task do_install: Succeeded
NOTE: Running task 1538 of 2086 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_populate_sysroot)
NOTE: recipe rpm-native-1_4.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-native-1_4.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1539 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_package)
NOTE: Running task 1540 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1541 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_package)
NOTE: Running task 1542 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.44.bb:do_package)
NOTE: Running task 1543 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: Running task 1544 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_package: Started
NOTE: recipe ca-certificates-20250419-r0: task do_package: Started
NOTE: recipe wayland-protocols-1.44-r0: task do_package: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_package: Started
NOTE: recipe initscripts-1.0-r0: task do_package: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_package unihash changed to 31b98198f0cd11b406bbb3d999554fcf59e70c7143cc08ad43561266c4119609
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata became valid
NOTE: recipe wayland-protocols-1.44-r0: task do_package: Succeeded
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.44.bb:do_package unihash changed to d62f5b24de8cd28cb21e9960b324f330798184475e6266572b34f96a6a32134e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.44.bb:do_packagedata became valid
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.44.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.44-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package unihash changed to 66aebf965282c6bff97cafd21dbd3d2bfc98190d807903761378c37e6e88fb6e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata became valid
NOTE: Running setscene task 742 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_package unihash changed to e0d5e006957901a6096e8c785e43be912471d88336dc5bff7774ba21f6a32269
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_package_write_ipk became valid
NOTE: Running setscene task 737 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_package_qa_setscene)
NOTE: Running setscene task 738 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 739 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 741 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 742 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_create_spdx_setscene)
NOTE: recipe ca-certificates-20250419-r0: task do_package_qa_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_package_write_deb_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_package: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package unihash changed to 5905b40c1527609cb0fe44e61252861e2254e6c9959157cbbca4732d1ff135a3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata became valid
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe linux-libc-headers-6.12-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_package unihash changed to 9514955c58367f6c13b9065d84c4ab04b40e2bfbe25001d93131cbc431be7660
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata became valid
NOTE: Running setscene task 667 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1558 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_collect_spdx_deps)
NOTE: recipe glibc-2.41+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe glibc-2.41+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1561 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1562 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_package)
NOTE: recipe libgcc-15.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.41+git-r0: task do_package: Started
NOTE: recipe libgcc-15.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1563 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_configure)
NOTE: recipe libgcc-15.1.0-r0: task do_configure: Started
NOTE: recipe libgcc-15.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1564 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_compile)
NOTE: recipe libgcc-15.1.0-r0: task do_compile: Started
NOTE: recipe libgcc-15.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1565 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_install)
NOTE: recipe libgcc-15.1.0-r0: task do_install: Started
NOTE: recipe libgcc-15.1.0-r0: task do_install: Succeeded
NOTE: Running task 1566 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_multilib_install)
NOTE: recipe libgcc-15.1.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-15.1.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 1567 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_extra_symlinks)
NOTE: recipe libgcc-15.1.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-15.1.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1569 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1570 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_configure)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_configure: Started
NOTE: recipe glibc-2.41+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_package unihash changed to 4dc86d5b0e4d5fcd44acd27aa82741dec0929dd26e0a41d8ed63f6caa9836eb1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_spdx became valid
NOTE: Running setscene task 667 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1572 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_package)
NOTE: Running task 1574 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_collect_spdx_deps)
NOTE: recipe libgcc-15.1.0-r0: task do_package: Started
NOTE: recipe libgcc-15.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcc-15.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_package unihash changed to c8ff754747871eb46674a6a58fe7e1bd3dabb478632bb01a9a7bb3dab40539b3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_create_spdx became valid
NOTE: Running setscene task 669 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1577 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_collect_spdx_deps)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1578 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_compile)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_compile: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1579 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_install)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_install: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_install: Succeeded
NOTE: Running task 1586 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1587 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1588 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1589 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1590 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1591 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1592 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1593 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1594 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1595 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1596 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_package)
NOTE: recipe expat-2.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1597 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1598 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcrypt-4.4.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1599 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1600 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1601 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_package: Started
NOTE: recipe libunistring-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1602 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_configure: Started
NOTE: Running task 1603 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_configure)
NOTE: recipe libtirpc-1.3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1604 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_configure)
NOTE: recipe expat-2.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1605 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_configure)
NOTE: recipe libffi-3.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1606 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_configure)
NOTE: recipe bash-completion-2.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Started
NOTE: Running task 1607 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_configure)
NOTE: Running task 1608 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_configure)
NOTE: recipe libcap-ng-0.8.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1609 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_configure)
NOTE: recipe libunistring-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1610 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_configure)
NOTE: recipe base-passwd-3.6.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_configure: Started
NOTE: Running task 1611 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_configure)
NOTE: recipe libseccomp-2.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1612 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_configure)
NOTE: recipe util-macros-1_1.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_configure: Started
NOTE: Running task 1613 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_configure)
NOTE: recipe libxcrypt-4.4.38-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1614 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_configure)
NOTE: recipe expat-2.7.1-r0: task do_configure: Started
NOTE: recipe libffi-3.4.8-r0: task do_configure: Started
NOTE: Running task 1615 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_compile)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_configure: Started
NOTE: Running task 1616 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_configure: Started
NOTE: Running task 1617 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.16.0-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_configure: Started
NOTE: recipe libunistring-1.3-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_configure: Started
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1618 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_install)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1619 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure_ptest_base)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 1621 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1622 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1623 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1624 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe openssl-3.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1625 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_configure)
NOTE: recipe xz-5.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1626 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe openssl-3.5.0-r0: task do_configure: Started
NOTE: recipe xz-5.8.1-r0: task do_configure: Started
NOTE: recipe expat-2.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1627 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile)
NOTE: recipe zlib-1.3.1-r0: task do_compile: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_configure: Succeeded
NOTE: Running task 1628 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_configure_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1629 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile_ptest_base)
NOTE: recipe expat-2.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1630 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_compile)
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1631 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install)
NOTE: recipe expat-2.7.1-r0: task do_compile: Started
NOTE: recipe zlib-1.3.1-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_configure: Succeeded
NOTE: Running task 1632 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 1633 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1635 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_compile)
NOTE: Running task 1636 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_configure)
NOTE: recipe bash-completion-2.16.0-r0: task do_compile: Started
NOTE: recipe ncurses-6.5-r0: task do_configure: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1637 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_install)
NOTE: recipe expat-2.7.1-r0: task do_compile: Succeeded
NOTE: Running task 1638 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_compile_ptest_base)
NOTE: recipe bash-completion-2.16.0-r0: task do_install: Started
NOTE: recipe expat-2.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1639 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_install)
NOTE: recipe expat-2.7.1-r0: task do_install: Started
NOTE: recipe expat-2.7.1-r0: task do_install: Succeeded
NOTE: Running task 1640 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_install_ptest_base)
NOTE: recipe expat-2.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1642 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_package unihash changed to d8c08deed1b198e41d52a66572d1b5164e517426844cb98fbd8d07e7ab0ab61e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata became valid
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_configure: Succeeded
NOTE: Running setscene task 641 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running task 1643 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: Running task 1644 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_compile)
NOTE: Running task 1645 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_configure)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 739 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.2-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1646 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 742 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_configure: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Setscene tasks completed
NOTE: Running task 1648 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_compile)
NOTE: Running task 1649 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package)
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_compile: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1650 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_compile)
NOTE: recipe base-passwd-3.6.7-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1651 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe base-passwd-3.6.7-r0: task do_compile: Succeeded
NOTE: Running task 1652 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_install)
NOTE: recipe libtirpc-1.3.6-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: Running task 1653 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1654 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe base-passwd-3.6.7-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_install: Succeeded
NOTE: Running task 1655 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package)
NOTE: recipe libcap-ng-0.8.5-r0: task do_compile: Succeeded
NOTE: Running task 1656 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_install)
NOTE: recipe zlib-1.3.1-r0: task do_package: Started
NOTE: recipe libffi-3.4.8-r0: task do_configure: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 1657 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_compile: Started
NOTE: Running task 1658 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe gdbm-1.24-r0: task do_configure: Succeeded
NOTE: Running task 1659 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_configure_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe gdbm-1.24-r0: task do_configure_ptest_base: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package unihash changed to 39c614053e07fb4533ba3a5aa8e282f3122d77047b492df7b3687e5bc167b426
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata became valid
NOTE: Running setscene task 741 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running task 1660 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_configure_ptest_base)
NOTE: Running task 1661 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1663 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.24-r0: task do_compile: Started
NOTE: recipe libpcre2-10.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running task 1664 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_compile)
NOTE: recipe libcap-ng-0.8.5-r0: task do_install: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1667 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_configure)
NOTE: recipe openssl-3.5.0-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe util-macros-1_1.20.2-r0: task do_configure: Started
NOTE: Running task 1669 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_configure)
NOTE: recipe libpcre2-10.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1670 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_configure)
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Started
NOTE: recipe libpcre2-10.45-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_compile: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_compile: Succeeded
NOTE: Running task 1671 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_install)
NOTE: Running task 1672 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_install)
NOTE: recipe libtirpc-1.3.6-r0: task do_install: Started
NOTE: recipe libffi-3.4.8-r0: task do_install: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1673 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_compile)
NOTE: recipe libxcrypt-4.4.38-r0: task do_compile: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_install: Succeeded
NOTE: Running task 1675 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.4.8-r0: task do_install: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1678 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_configure_ptest_base)
NOTE: recipe libseccomp-2.6.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1679 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_compile)
NOTE: recipe libnsl2-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1680 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_configure)
NOTE: recipe libseccomp-2.6.0-r0: task do_compile: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_configure: Started
NOTE: recipe zlib-1.3.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package unihash changed to 97f9059f5dae3561c074fe02532a1186a50d9ea9880266f930facf0bd45d774f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata became valid
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Succeeded
NOTE: Running setscene task 714 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running task 1681 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_compile)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1683 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_package)
NOTE: recipe gdbm-1.24-r0: task do_compile: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_compile: Succeeded
NOTE: Running task 1684 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_install)
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Succeeded
NOTE: Running task 1685 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_compile_ptest_base)
NOTE: Running task 1686 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_install)
NOTE: recipe libtirpc-1.3.6-r0: task do_package: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_install: Started
NOTE: recipe gdbm-1.24-r0: task do_compile_ptest_base: Started
NOTE: recipe xorgproto-2024.1-r0: task do_install: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_install: Succeeded
NOTE: Running task 1688 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.24-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1689 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_install)
NOTE: recipe util-macros-1_1.20.2-r0: task do_configure: Succeeded
NOTE: Running task 1690 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_package)
NOTE: recipe bash-completion-2.16.0-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1692 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_compile)
NOTE: recipe gdbm-1.24-r0: task do_install: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_package: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_compile: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_install: Succeeded
NOTE: Running task 1693 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_install)
NOTE: Running task 1695 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_package)
NOTE: recipe util-macros-1_1.20.2-r0: task do_install: Started
NOTE: recipe libpam-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1696 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_configure)
NOTE: recipe libffi-3.4.8-r0: task do_package: Started
NOTE: recipe libpam-1.7.0-r0: task do_configure: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_install: Succeeded
NOTE: Running task 1698 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1699 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: recipe gdbm-1.24-r0: task do_install: Succeeded
NOTE: Running task 1700 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_install_ptest_base)
NOTE: recipe gdbm-1.24-r0: task do_install_ptest_base: Started
NOTE: recipe gdbm-1.24-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1702 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.3.6-r0: task do_package: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_package unihash changed to 93cf6ac9b84203ff4a2f6c4c9d1d5c71eda73b2b10a33e867da10ad36c1a84cc
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata became valid
NOTE: Running setscene task 742 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe perl-5.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1703 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_configure)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1705 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_package)
NOTE: recipe gdbm-1.24-r0: task do_package: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_package unihash changed to ec6190620fb4944c07e37015445f3794165891e8a87c6cb74e947ee7f9a22038
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_packagedata became valid
NOTE: recipe attr-2.5.2-r0: task do_configure: Succeeded
NOTE: Running setscene task 716 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_create_spdx_setscene)
NOTE: Running task 1706 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_configure_ptest_base)
NOTE: recipe libffi-3.4.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_package unihash changed to 974d83639c931e2be0eff22473010261754fbe6ce639603d2d76651af816762e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_packagedata became valid
NOTE: recipe libxcrypt-4.4.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 742 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_packagedata_setscene)
NOTE: Running task 1707 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_compile)
NOTE: recipe xz-5.8.1-r0: task do_configure: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_packagedata_setscene: Started
NOTE: Running task 1708 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_configure_ptest_base)
NOTE: recipe attr-2.5.2-r0: task do_compile: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_configure_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: Running task 1711 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_package)
NOTE: Running task 1717 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe xz-5.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1718 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_compile)
NOTE: recipe base-passwd-3.6.7-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe xz-5.8.1-r0: task do_compile: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_compile: Succeeded
NOTE: Running task 1719 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_package)
NOTE: recipe expat-2.7.1-r0: task do_package: Started
NOTE: recipe attr-2.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1720 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_compile_ptest_base)
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1721 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_install)
NOTE: recipe attr-2.5.2-r0: task do_install: Started
NOTE: recipe attr-2.5.2-r0: task do_install: Succeeded
NOTE: Running task 1722 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_install_ptest_base)
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1724 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1725 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_package: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1726 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_compile)
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_package unihash changed to 059e2d0f4c9665e546385cddc883661f6487d0f0522c9d6e73843e18a64ceb19
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata became valid
NOTE: Running setscene task 742 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.7.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_package unihash changed to 2c30d66a9b1cd51360f2e705d6cda3972a534ede407b49acd9c3ddd044bf971b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata became valid
NOTE: recipe libpam-1.7.0-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 742 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: Running task 1727 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_configure)
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_configure: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1728 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package)
NOTE: Running task 1731 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_compile_ptest_base)
NOTE: recipe gdbm-1.24-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_package unihash changed to a1ff40f2bfbfe599a95ec7d9c608432be1c6cdfc1047d5ed0a5483137fe29e19
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_create_spdx became valid
NOTE: recipe libseccomp-2.6.0-r0: task do_compile_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_package: Started
NOTE: Running setscene task 722 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_create_spdx_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to d38e5fc19f40e5f8d3ed99736db094c92fff6925e28229bfb9c8a086e9d6b531
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: recipe gdbm-1.24-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 742 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1732 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1734 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package)
NOTE: recipe xz-5.8.1-r0: task do_compile: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_compile: Started
NOTE: Running task 1735 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_compile_ptest_base)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1737 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.16.0-r0: task do_package: Started
NOTE: recipe xz-5.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.45-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1738 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_compile)
NOTE: recipe libpcre2-10.45-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1739 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-proto-1.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1740 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_install)
NOTE: Running task 1741 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_install)
NOTE: recipe libseccomp-2.6.0-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_install: Started
NOTE: recipe libpam-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1742 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_compile_ptest_base)
NOTE: recipe xcb-proto-1.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1743 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1744 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_install)
NOTE: recipe libxau-1_1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1746 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.0-r0: task do_install: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1747 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_configure)
NOTE: recipe libpthread-stubs-0.5-r0: task do_configure: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_install: Succeeded
NOTE: Running task 1748 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_configure)
NOTE: recipe xcb-proto-1.17.0-r0: task do_configure: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1749 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_configure)
NOTE: recipe xz-5.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1750 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_install)
NOTE: recipe libxau-1_1.0.12-r0: task do_configure: Started
NOTE: recipe xz-5.8.1-r0: task do_install: Started
NOTE: recipe libpam-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1751 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_install_ptest_base)
NOTE: recipe libpam-1.7.0-r0: task do_install_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_package: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_install_ptest_base: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package unihash changed to 883e009b979ce08d3366307ebfd619b7116f310deefdaa8921d8b9b0690ad568
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata became valid
NOTE: Running setscene task 731 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running task 1753 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1754 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_configure)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1755 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_package)
NOTE: recipe shadow-4.17.4-r0: task do_configure: Started
NOTE: recipe libpam-1.7.0-r0: task do_package: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_configure: Succeeded
NOTE: Running task 1757 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_configure: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package unihash changed to 2cb515fb78d1d05f01c0ac0389820695c67c49415f3134582cd0140b731e35e3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata became valid
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_configure: Succeeded
NOTE: Running task 1758 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_compile)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1760 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_compile)
NOTE: recipe libpthread-stubs-0.5-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_compile: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_compile: Started
NOTE: Running task 1761 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_install)
NOTE: recipe xcb-proto-1.17.0-r0: task do_compile: Succeeded
NOTE: Running task 1762 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_install)
NOTE: recipe libpthread-stubs-0.5-r0: task do_install: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_install: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_install: Succeeded
NOTE: Running task 1763 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_package)
NOTE: recipe xz-5.8.1-r0: task do_install: Succeeded
NOTE: Running task 1764 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_install_ptest_base)
NOTE: recipe libnsl2-2.0.1-r0: task do_package: Started
NOTE: recipe xz-5.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe xz-5.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1766 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_package)
NOTE: recipe xz-5.8.1-r0: task do_package: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_install: Succeeded
NOTE: Running task 1769 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1770 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_configure)
NOTE: recipe libpcre2-10.45-r0: task do_compile: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1771 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_install)
NOTE: Setscene tasks completed
NOTE: Running task 1772 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_configure_ptest_base)
NOTE: recipe xkeyboard-config-2.44-r0: task do_configure: Started
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libpcre2-10.45-r0: task do_install: Started
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1773 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_compile)
NOTE: recipe acl-2.3.2-r0: task do_compile: Started
NOTE: recipe libpcre2-10.45-r0: task do_install: Succeeded
NOTE: Running task 1785 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-locale-2.41+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_package unihash changed to e546a64886e754144979e974e0556e4d91b0f9250f6a26a56766bc09876f3e11
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata became valid
NOTE: recipe glibc-locale-2.41+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running noexec task 1786 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_configure)
NOTE: Running noexec task 1787 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_compile)
NOTE: Running task 1788 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_install)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1790 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_package)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_configure: Succeeded
NOTE: Running task 1791 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_compile)
NOTE: Setscene tasks completed
NOTE: Running task 1792 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_compile)
NOTE: recipe util-macros-1_1.20.2-r0: task do_package: Started
NOTE: recipe acl-2.3.2-r0: task do_compile: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_compile: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_compile: Started
NOTE: Running task 1793 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_compile_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1794 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_install)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_compile: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_install: Started
NOTE: Running task 1795 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_install)
NOTE: recipe xkeyboard-config-2.44-r0: task do_compile: Succeeded
NOTE: Running task 1796 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_install)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_install: Started
NOTE: recipe acl-2.3.2-r0: task do_install: Succeeded
NOTE: Running task 1797 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package)
NOTE: recipe xorgproto-2024.1-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_install: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_install: Succeeded
NOTE: Running task 1799 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_package)
NOTE: Running task 1801 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_package: Started
NOTE: recipe libcap-2.76-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_package unihash changed to a5fa5e2b6fa96c519d4694584faa3db4510abeae009f35028c8a5142d932b573
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata became valid
NOTE: Running setscene task 740 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1802 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1804 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_configure)
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-2.76-r0: task do_configure: Started
NOTE: Running task 1805 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_configure)
NOTE: recipe libcap-2.76-r0: task do_configure: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_configure: Started
NOTE: Running task 1806 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_compile)
NOTE: recipe xz-5.8.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_package unihash changed to e6f5ed4c7b02e12fddf67cf7c60734f02692dff04c7843b0a467ed80190afa5a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata became valid
NOTE: recipe zstd-1.5.7-r0: task do_configure: Succeeded
NOTE: recipe libcap-2.76-r0: task do_compile: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_configure: Succeeded
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running task 1807 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_compile)
NOTE: Running task 1808 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_compile)
NOTE: recipe zstd-1.5.7-r0: task do_compile: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_compile: Started
NOTE: recipe xorgproto-2024.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package unihash changed to a8aebcc0fd5210cbe27afefc3c3ff56d5f22ef0b5e56f7dfb4efee1f7e4aadac
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata became valid
NOTE: recipe libpam-1.7.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_package unihash changed to e149ee9ec05f3496a45702457c12a7f82d8363025048f6c115923465ff5b1289
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata became valid
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 741 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running task 1810 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_install_ptest_base)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_compile: Succeeded
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1811 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_install)
NOTE: Running task 1813 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_install_ptest_base)
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_install: Started
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_install: Succeeded
NOTE: Running task 1815 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_package)
NOTE: Running task 1819 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_package)
NOTE: recipe libcap-ng-0.8.5-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_package: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1821 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_package)
NOTE: recipe xcb-proto-1.17.0-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_package unihash changed to afe58f35f0f69ccd297ab11725f2f9fd3270a6f9b5506b989bd7cfa8744eb63e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata became valid
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1823 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package)
NOTE: recipe libxau-1_1.0.12-r0: task do_package: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libcap-2.76-r0: task do_compile: Succeeded
NOTE: Running task 1825 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_package)
NOTE: Setscene tasks completed
NOTE: Running task 1826 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_install)
NOTE: recipe libpcre2-10.45-r0: task do_package: Started
NOTE: recipe libcap-2.76-r0: task do_install: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_package unihash changed to 503ed1396b257a40b8bc5f6db4305fd68edb71fc64f527e903bfe8d5fb3fa0fd
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata became valid
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1828 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package)
NOTE: recipe xkeyboard-config-2.44-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_package: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_package unihash changed to ccad5fb0ab5c929c477cb07243e27a9667729b6fc8d16e8c2b65a2ff29940ae7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata became valid
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running task 1829 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_compile)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1831 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_package)
NOTE: recipe libcap-ng-0.8.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_package unihash changed to 56d94d6364c88127006c16f6d8db0ffd58e5b3fd42e17ac3704aa367302e2f56
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata became valid
NOTE: recipe libseccomp-2.6.0-r0: task do_package: Started
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_install: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1833 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package)
NOTE: Running task 1834 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_install)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1836 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_package)
NOTE: recipe acl-2.3.2-r0: task do_package: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_install: Started
NOTE: recipe libcap-2.76-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package unihash changed to 5211f0dab92e610ca33a3b2426c91ac745fc799d59bec7067d96f9442811ec4a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata became valid
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1838 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_install: Succeeded
NOTE: Running task 1839 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_package)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1840 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package)
NOTE: recipe glibc-locale-2.41+git-r0: task do_package: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxcb-1.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1841 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_configure)
NOTE: recipe libxcb-1.17.0-r0: task do_configure: Started
NOTE: recipe libpcre2-10.45-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_package unihash changed to c4a32420136d30a2ae08b6a80a976f4435332e9df9b2b0f55fffc94e9c1fbe03
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata became valid
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_configure: Succeeded
NOTE: Running task 1842 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_compile)
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1851 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.17.4-r0: task do_compile: Started
NOTE: recipe libunistring-1.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libunistring-1.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1852 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_collect_spdx_deps)
NOTE: recipe openssl-3.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe openssl-3.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1857 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.17.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.17.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1862 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_collect_spdx_deps)
NOTE: recipe glibc-locale-2.41+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1864 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_collect_spdx_deps)
NOTE: recipe libcap-2.76-r0: task do_package: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_package unihash changed to a1a9ed6de2990c62bde567fb9137131758dc773db47e3e8bfa29e195ea0843af
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata became valid
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package unihash changed to 3b3db72efedc6eeb88b9693c9f68b4c282b49ce9ecec071f401e8dd3b87c74ba
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata became valid
NOTE: recipe perl-5.40.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running setscene task 734 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package unihash changed to bbafb76aeaf6af9d4afb137abff5bacaba977939fc27812ffa10b10c7aa76845
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata became valid
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_package unihash changed to c3e7aac9ce510b6287db32ad816611b845395329a10d9c21f62b9e53e56a1ba9
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata became valid
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_configure: Succeeded
NOTE: Running task 1868 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_compile)
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe ncurses-6.5-r0: task do_compile: Started
NOTE: recipe libunistring-1.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1870 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_compile)
NOTE: recipe libunistring-1.3-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_package: Succeeded
NOTE: Running task 1871 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_package unihash changed to 66c0a27a2e5cf854a13f30110cf63a3737279f3f486280f34886c31a9469a7dc
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata became valid
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1872 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe shadow-4.17.4-r0: task do_compile: Succeeded
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1874 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_install)
NOTE: recipe shadow-4.17.4-r0: task do_install: Started
NOTE: recipe shadow-4.17.4-r0: task do_install: Succeeded
NOTE: Running task 1876 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_package)
NOTE: Running task 1877 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.17.4-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1878 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_configure)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1879 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_compile)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1880 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_install)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1881 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_install: Succeeded
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1883 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: Running task 1884 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1885 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe libxcb-1.17.0-r0: task do_configure: Succeeded
NOTE: Running task 1886 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_compile)
NOTE: recipe libxcb-1.17.0-r0: task do_compile: Started
NOTE: recipe shadow-4.17.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_package unihash changed to 23e5ae4c132032a2782966f93ebdf946aad2d293966de3a58ba4e6254c178888
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_packagedata became valid
NOTE: Running setscene task 742 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.17.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.17.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1888 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package)
NOTE: Running task 1890 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_collect_spdx_deps)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package unihash changed to fd6656f267dab283996fe110397dfc7dfcb9452863dc3cc22821770f660e136d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata became valid
NOTE: recipe libxcb-1.17.0-r0: task do_compile: Succeeded
NOTE: Running setscene task 742 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running task 1891 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_install)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_install: Started
NOTE: recipe ncurses-6.5-r0: task do_compile: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running task 1892 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_install)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to e90877a25343b733b95e50c6eb315a5ba3722711b60588f45ae489db0ef311a5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sqlite3-3_3.48.0-r0: task do_compile: Succeeded
NOTE: Running task 1896 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_install)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_install: Succeeded
NOTE: Running task 1898 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_package)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_package: Started
NOTE: recipe libxcb-1.17.0-r0: task do_install: Succeeded
NOTE: Running task 1900 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package)
NOTE: recipe libxcb-1.17.0-r0: task do_package: Started
NOTE: recipe zstd-1.5.7-r0: task do_compile: Succeeded
NOTE: Running task 1901 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_install)
NOTE: recipe zstd-1.5.7-r0: task do_install: Started
NOTE: recipe openssl-3.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1902 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.5.0-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.5.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1903 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_install)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_package unihash changed to 0b4d121ed53511b24a195fb983ba639035b372f708c8cad6b133b701d23adb37
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata became valid
NOTE: recipe openssl-3.5.0-r0: task do_install: Started
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe openssl-3.5.0-r0: task do_install: Succeeded
NOTE: Running task 1905 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_install_ptest_base)
NOTE: recipe openssl-3.5.0-r0: task do_install_ptest_base: Started
NOTE: recipe libxcb-1.17.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package unihash changed to 81f05597991cc3c1c41fb2fa6d651e184aeca18949222235c8fa4febd58dc0e0
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata became valid
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe zstd-1.5.7-r0: task do_install: Succeeded
NOTE: Running task 1908 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_package)
NOTE: recipe zstd-1.5.7-r0: task do_package: Started
NOTE: recipe zstd-1.5.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_package unihash changed to 3dfc1837a591f2a79adab5046d43fba0f408fbbd72cd1088c79bd503d9e1b1aa
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata became valid
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe ncurses-6.5-r0: task do_install: Succeeded
NOTE: Running task 1911 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1912 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1913 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package)
NOTE: Running task 1914 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libedit-20250104-3.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.5-r0: task do_package: Started
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1915 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_configure)
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1916 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_configure)
NOTE: recipe libedit-20250104-3.1-r1: task do_configure: Started
NOTE: recipe psmisc-23.7-r0: task do_configure: Started
NOTE: recipe util-linux-2.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1917 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_configure)
NOTE: recipe util-linux-2.41-r0: task do_configure: Started
NOTE: recipe openssl-3.5.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1919 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_package)
NOTE: Running task 1920 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.5.0-r0: task do_package: Started
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1921 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_configure)
NOTE: recipe kmod-34.2-r0: task do_configure: Started
NOTE: recipe ncurses-6.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package unihash changed to 27c8fb7123ef6d61863861d32be9dd110ef40ce3fe075f6c253ecaef44819623
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata became valid
NOTE: recipe libedit-20250104-3.1-r1: task do_configure: Succeeded
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running task 1922 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_compile)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_compile: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe kmod-34.2-r0: task do_configure: Succeeded
NOTE: Running task 1924 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_compile)
NOTE: recipe kmod-34.2-r0: task do_compile: Started
NOTE: recipe kmod-34.2-r0: task do_compile: Succeeded
NOTE: Running task 1925 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_install)
NOTE: recipe libedit-20250104-3.1-r1: task do_compile: Succeeded
NOTE: Running task 1926 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_install)
NOTE: recipe kmod-34.2-r0: task do_install: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_install: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_install: Succeeded
NOTE: Running task 1928 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1929 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_package)
NOTE: recipe libedit-20250104-3.1-r1: task do_package: Started
NOTE: recipe kmod-34.2-r0: task do_install: Succeeded
NOTE: recipe python3-3.13.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.13.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1931 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_configure)
NOTE: recipe python3-3.13.3-r0: task do_configure: Started
NOTE: recipe perl-5.40.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1932 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_configure_ptest_base)
NOTE: recipe perl-5.40.2-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.40.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1933 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_compile)
NOTE: recipe perl-5.40.2-r0: task do_compile: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_package unihash changed to 002ef75a046e020f9509e8127a609f473827e5eda35387dfe478f30311a8e86f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata became valid
NOTE: Running setscene task 720 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe psmisc-23.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1935 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_compile)
NOTE: recipe psmisc-23.7-r0: task do_compile: Started
NOTE: recipe psmisc-23.7-r0: task do_compile: Succeeded
NOTE: Running task 1936 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_install)
NOTE: recipe psmisc-23.7-r0: task do_install: Started
NOTE: recipe psmisc-23.7-r0: task do_install: Succeeded
NOTE: Running task 1937 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package)
NOTE: recipe psmisc-23.7-r0: task do_package: Started
NOTE: recipe openssl-3.5.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_package unihash changed to 74a7302a65be8506f63695789bb47dce2a063a014f7ddaef6b980ff3715fb598
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_create_spdx became valid
NOTE: Running setscene task 716 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1939 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package)
NOTE: Running task 1943 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_package_write_rpm)
NOTE: recipe ca-certificates-20250419-r0: task do_package_write_rpm: Started
NOTE: recipe kmod-34.2-r0: task do_package: Started
NOTE: recipe ca-certificates-20250419-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_package_write_rpm unihash changed to 0461e61146b413d3c2b060bb422d747a85ed1ef971263b4e35593126f433680d
NOTE: recipe kmod-34.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package unihash changed to 82ab497dc7a810467d1c389e01ea6a00482acb2ed2841ded7e5b5bfa6920bdb8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata became valid
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_package: Succeeded
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package unihash changed to f3d121a0161be4fa87f1864627e0a3d26b0e8c3755a01bd7a00dbd006c198ccf
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb became valid
NOTE: Running setscene task 739 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 740 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 742 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1949 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm unihash changed to bd44c049853281fbda62b8028178ed1252802014805b623b26c7a23a7226ce33
NOTE: recipe libunistring-1.3-r0: task do_compile: Succeeded
NOTE: Running task 1951 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_install)
NOTE: recipe libunistring-1.3-r0: task do_install: Started
NOTE: recipe libunistring-1.3-r0: task do_install: Succeeded
NOTE: Running task 1953 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1954 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_package)
NOTE: recipe libidn2-2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.3-r0: task do_package: Started
NOTE: recipe util-linux-2.41-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1955 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_configure_ptest_base)
NOTE: recipe libidn2-2.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1956 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_configure)
NOTE: recipe util-linux-2.41-r0: task do_configure_ptest_base: Started
NOTE: recipe libidn2-2.3.8-r0: task do_configure: Started
NOTE: recipe util-linux-2.41-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1957 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_compile)
NOTE: recipe util-linux-2.41-r0: task do_compile: Started
NOTE: recipe libunistring-1.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_package unihash changed to 90faee62904733a37a8666a9a73c3274492f0b0e2deec759c4b9f58276d569f5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_create_spdx became valid
NOTE: Running setscene task 740 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1960 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe libidn2-2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libidn2-2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_compile: Succeeded
NOTE: Running task 1961 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.41-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-2.41-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1962 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_install)
NOTE: recipe util-linux-2.41-r0: task do_install: Started
NOTE: recipe util-linux-2.41-r0: task do_install: Succeeded
NOTE: Running task 1963 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.41-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.41-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1965 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_package)
NOTE: recipe util-linux-2.41-r0: task do_package: Started
NOTE: recipe libidn2-2.3.8-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1966 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_compile)
NOTE: recipe libidn2-2.3.8-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.8-r0: task do_compile: Succeeded
NOTE: Running task 1967 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_install)
NOTE: recipe libidn2-2.3.8-r0: task do_install: Started
NOTE: recipe libidn2-2.3.8-r0: task do_install: Succeeded
NOTE: Running task 1969 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1970 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_package)
NOTE: recipe curl-8.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.8-r0: task do_package: Started
NOTE: recipe curl-8.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1971 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_configure)
NOTE: recipe curl-8.14.0-r0: task do_configure: Started
NOTE: recipe python3-3.13.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1972 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_configure_ptest_base)
NOTE: recipe python3-3.13.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.13.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1973 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_compile)
NOTE: recipe python3-3.13.3-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_package unihash changed to 761f3ca3873bac02eff5ecdc531d8d5f7747600189ed786c843cd1482b830e7e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_spdx became valid
NOTE: Running setscene task 741 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1976 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_collect_spdx_deps)
NOTE: recipe curl-8.14.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe curl-8.14.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_package unihash changed to 5edb4796aa592265566cd9ed23f103474309ca94306dda361419984e3d0968a6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_packagedata became valid
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_compile: Succeeded
NOTE: Running task 1978 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_compile_ptest_base)
NOTE: recipe perl-5.40.2-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.40.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1979 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_install)
NOTE: recipe perl-5.40.2-r0: task do_install: Started
NOTE: recipe python3-3.13.3-r0: task do_compile: Succeeded
NOTE: Running task 1980 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_compile_ptest_base)
NOTE: recipe python3-3.13.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.13.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1981 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_install)
NOTE: recipe python3-3.13.3-r0: task do_install: Started
NOTE: recipe curl-8.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1982 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_configure_ptest_base)
NOTE: recipe curl-8.14.0-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.14.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1983 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_compile)
NOTE: recipe curl-8.14.0-r0: task do_compile: Started
NOTE: recipe curl-8.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1984 of 2086 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_compile_ptest_base)
NOTE: recipe curl-8.14.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_package unihash changed to 20c18da843f8637384055eb833f5bf0053265518e039cc48a5a15970ae21357b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_package_write_ipk became valid
NOTE: Running setscene task 736 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 738 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_package_qa_setscene)
NOTE: Running setscene task 740 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 742 of 743 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_create_spdx_setscene)
NOTE: recipe glibc-locale-2.41+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_package_qa_setscene: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_create_spdx_setscene: Started
Log data follows:
| DEBUG: Executing shell function do_compile_ptest_base
| NOTE: make -j 16 -l 75 -C /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.14.0/build/tests
| make: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.14.0/build/tests'
| Making all in certs
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.14.0/build/tests/certs'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/perl ../../../curl-8.14.0/tests/certs/genserv.pl test test-localhost.prm test-localhost.nn.prm test-localhost0h.prm test-localhost-san-first.prm test-localhost-san-last.prm test-client-cert.prm
| Missing or broken 'openssl' tool. openssl 1.0.2+ is required. Without it, this script cannot generate the necessary certificates the curl test suite needs for all its TLS related tests. at ../../../curl-8.14.0/tests/certs/genserv.pl line 33.
| make[1]: *** [Makefile:626: test-ca.cacert] Error 2
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.14.0/build/tests/certs'
| make: *** [Makefile:552: all-recursive] Error 1
| make: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.14.0/build/tests'
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.14.0/temp/run.do_compile_ptest_base.3762958:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.14.0/temp/run.do_compile_ptest_base.3762958, line 180
| 	#2: die, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.14.0/temp/run.do_compile_ptest_base.3762958, line 164
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.14.0/temp/run.do_compile_ptest_base.3762958, line 159
| 	#4: do_compile_ptest, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.14.0/temp/run.do_compile_ptest_base.3762958, line 154
| 	#5: do_compile_ptest_base, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.14.0/temp/run.do_compile_ptest_base.3762958, line 149
| 	#6: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.14.0/temp/run.do_compile_ptest_base.3762958, line 193
NOTE: recipe curl-8.14.0-r0: task do_compile_ptest_base: Failed
NOTE: recipe glibc-locale-2.41+git-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe glibc-locale-2.41+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-locale-2.41+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe glibc-locale-2.41+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_install: Succeeded
NOTE: recipe python3-3.13.3-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 1984 tasks of which 1438 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250601132310.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250601132310.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_compile_ptest_base
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.14.0/temp/log.do_compile_ptest_base.3762958
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: curl-8.14.0-r0 do_compile_ptest_base: oe_runmake failed
ERROR: curl-8.14.0-r0 do_compile_ptest_base: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.14.0/temp/run.do_compile_ptest_base.3762958' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.14.0/temp/log.do_compile_ptest_base.3762958
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.0.bb:do_compile_ptest_base) failed with exit code '1'

--===============5539625843868390972==--

