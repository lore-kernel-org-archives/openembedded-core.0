Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5562C61DD6
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 05:57:53 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.419.1787896671233220117
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 22:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UwxVJ1sR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Pxi+sPDo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a046f22949-e82f584e-78b9-4c7f-95c5-b9de194d993a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787896670;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EFV7z5kDPh7fqrmROYFI8/Jijd2ksZIy7rzsO3DUBX8=;
	b=UwxVJ1sRGzdPVqST2kCKgtqcDACIZWHp2i+gNwh3ccJZ+hLjFeeVYrBiewKajYv3
	ioKpa/4NBW50of4ILRZOaXLB12p7SmKYf1HPyErEitUniBSTfiEsM5yvn2tfQ9H5y9U
	Zi7kVFfbOrvBhLCN/ZQlWOiYEXug/8lGhhnJs+t4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787896670;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EFV7z5kDPh7fqrmROYFI8/Jijd2ksZIy7rzsO3DUBX8=;
	b=Pxi+sPDo+gbeXp2DNHnftjS4ZMlAH8t3RnjzIWs7iQm62oYwyilQBdkr1MmBxXmK
	r4mkyaN/ezx8tCBU8lH6hR94k2FrZFlEghmPXdYTL7ZxIqDTwoEm9XdlXkKSRBEFyGX
	upzqU2CyxkydUFqDHY7PkdjRHIvynYc0pzMdu2fQ=
Content-Type: multipart/mixed; boundary="===============2589027219426640099=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.12.7 SUCCEEDED
Message-ID: <010101a046f22949-e82f584e-78b9-4c7f-95c5-b9de194d993a-000000@us-west-2.amazonses.com>
Date: Fri, 28 Aug 2026 05:57:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.28-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 05:57:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244510

--===============2589027219426640099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.12.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.12.6-0.12.7.patch
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
From b9ce9aa5b413d29e5e2a94dca1d4f7b222418142 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 28 Aug 2026 05:52:27 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.12.6 -> 0.12.7

---
 .../python/python3-uv-build-crates.inc        | 20 +++++++++----------
 ...d_0.12.6.bb => python3-uv-build_0.12.7.bb} |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.12.6.bb => python3-uv-build_0.12.7.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 8d76d041f3..f6323e878f 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -12,7 +12,7 @@ SRC_URI += " \
     crate://crates.io/anstyle-query/1.1.5 \
     crate://crates.io/anstyle-wincon/3.0.11 \
     crate://crates.io/anyhow/1.0.104 \
-    crate://crates.io/archive-trait/0.0.13 \
+    crate://crates.io/archive-trait/0.0.14 \
     crate://crates.io/arcstr/1.2.0 \
     crate://crates.io/arrayvec/0.7.8 \
     crate://crates.io/astral-tokio-tar/0.6.4 \
@@ -32,8 +32,8 @@ SRC_URI += " \
     crate://crates.io/bytecheck/0.8.2 \
     crate://crates.io/bytecheck_derive/0.8.2 \
     crate://crates.io/bytes/1.12.1 \
-    crate://crates.io/cap-primitives/4.0.2 \
-    crate://crates.io/cap-std/4.0.2 \
+    crate://crates.io/cap-primitives/4.0.3 \
+    crate://crates.io/cap-std/4.0.3 \
     crate://crates.io/cc/1.2.57 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/charset/0.1.5 \
@@ -214,8 +214,8 @@ SRC_URI += " \
     crate://crates.io/syn/2.0.118 \
     crate://crates.io/syn/3.0.3 \
     crate://crates.io/synstructure/0.13.2 \
-    crate://crates.io/tar-codec/0.0.13 \
-    crate://crates.io/tar-framing/0.0.13 \
+    crate://crates.io/tar-codec/0.0.14 \
+    crate://crates.io/tar-framing/0.0.14 \
     crate://crates.io/temp-env/0.3.6 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/terminal_size/0.4.4 \
@@ -324,7 +324,7 @@ SRC_URI[anstyle-parse-1.0.0.sha256sum] = "52ce7f38b242319f7cabaa6813055467063ecd
 SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
 SRC_URI[anyhow-1.0.104.sha256sum] = "330a5ed07fa54e4702c9d6c4174f74427fc0ef6e214bbd677ae50a5099946470"
-SRC_URI[archive-trait-0.0.13.sha256sum] = "dc23b595ad4092163eaf9c0c7532dd5b6d82274c21560c97dc03fa4e4f09e645"
+SRC_URI[archive-trait-0.0.14.sha256sum] = "c6080ea14ccf9019d7ce572c319e581c20a805c9bdc6dbfb9b988da003cbd1a3"
 SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b4563841d0958c21d57e6d"
 SRC_URI[arrayvec-0.7.8.sha256sum] = "d3fb67a6e08acf24fdeccbac2cb6ac4305825bd1f117462e0e6f2f193345ad56"
 SRC_URI[astral-tokio-tar-0.6.4.sha256sum] = "b18457efd137254e016bbde5e1d88df61c4e1a5ae2223746e56123bac6af2463"
@@ -344,8 +344,8 @@ SRC_URI[bumpalo-3.20.2.sha256sum] = "5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702
 SRC_URI[bytecheck-0.8.2.sha256sum] = "0caa33a2c0edca0419d15ac723dff03f1956f7978329b1e3b5fdaaaed9d3ca8b"
 SRC_URI[bytecheck_derive-0.8.2.sha256sum] = "89385e82b5d1821d2219e0b095efa2cc1f246cbf99080f3be46a1a85c0d392d9"
 SRC_URI[bytes-1.12.1.sha256sum] = "fc652a48c352aef3ea3aed32080501cf3ef6ed5da78602a020c991775b0aff04"
-SRC_URI[cap-primitives-4.0.2.sha256sum] = "cdadbd7c002d3a484b35243669abdae85a0ebaded5a61117169dc3400f9a7ff0"
-SRC_URI[cap-std-4.0.2.sha256sum] = "7281235d6e96d3544ca18bba9049be92f4190f8d923e3caef1b5f66cfa752608"
+SRC_URI[cap-primitives-4.0.3.sha256sum] = "8b5f74729fd2f44701d1a8eb47e906cdb3ccd9ec0f02baad85a744b791940b18"
+SRC_URI[cap-std-4.0.3.sha256sum] = "c1ec78e242cfa2cfe276807ac2ecc00315a6c97786977414bcd1c3963b6c91b8"
 SRC_URI[cc-1.2.57.sha256sum] = "7a0dd1ca384932ff3641c8718a02769f1698e7563dc6974ffd03346116310423"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[charset-0.1.5.sha256sum] = "f1f927b07c74ba84c7e5fe4db2baeb3e996ab2688992e39ac68ce3220a677c7e"
@@ -526,8 +526,8 @@ SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70
 SRC_URI[syn-2.0.118.sha256sum] = "1b9ae57f904213ebb649ce6895b8a66c66f0203b9319718f69a5612a065b1422"
 SRC_URI[syn-3.0.3.sha256sum] = "53e9bae58849f64dfa4f5d5ae372c8341f7305f82a3868709269343628b659a3"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
-SRC_URI[tar-codec-0.0.13.sha256sum] = "f718b1f470b8ff575d12c85c33bdc8b33743009669c7a5e1923b6583235a2258"
-SRC_URI[tar-framing-0.0.13.sha256sum] = "5aca504a58616b04eb381819c4ddfdf87b6d35f6699090e68d8b40954fb42da7"
+SRC_URI[tar-codec-0.0.14.sha256sum] = "7ea42eb144d30fcbf32c26dfea8959175bb8335bfb7b18d20c6ed32edecf0551"
+SRC_URI[tar-framing-0.0.14.sha256sum] = "783223a7a6590be4227cb821e7ce80372575511f67c824921aba0752d8ad5573"
 SRC_URI[temp-env-0.3.6.sha256sum] = "96374855068f47402c3121c6eed88d29cb1de8f3ab27090e273e420bdabcf050"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[terminal_size-0.4.4.sha256sum] = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.6.bb b/meta/recipes-devtools/python/python3-uv-build_0.12.7.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.6.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.12.7.bb
index de84e8d5ad..00dcbc1ad1 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.6.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "4756f1771d342ff8ff50b529ae23c58d58f14f097c243ca50d3778d0a23d24f0"
+SRC_URI[sha256sum] = "e04fe07cc9b6207a41e4971e04d85100edcd1be7fd9a6c889692f5092a9bd7cf"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============2589027219426640099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.6.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.12.7.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.6.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.12.7.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.12.6.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.12.7.dist-info

--===============2589027219426640099==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.12.6-0.12.7.patch"

RnJvbSBiOWNlOWFhNWI0MTNkMjllNWUyYTk0ZGNhMWQ0ZjdiMjIyNDE4MTQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjggQXVnIDIwMjYgMDU6NTI6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuMTIuNiAtPiAwLjEyLjcKCi0tLQogLi4uL3B5dGhv
bi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMgICAgICAgIHwgMjAgKysrKysrKysrLS0tLS0t
LS0tLQogLi4uZF8wLjEyLjYuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjEyLjcuYmJ9IHwgIDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11di1idWlsZF8wLjEy
LjYuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjEyLjcuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmlu
YwppbmRleCA4ZDc2ZDA0MWYzLi5mNjMyM2U4NzhmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYworKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYwpAQCAtMTIs
NyArMTIsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Fuc3R5bGUt
cXVlcnkvMS4xLjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Fuc3R5bGUtd2luY29uLzMuMC4x
MSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYW55aG93LzEuMC4xMDQgXAotICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2FyY2hpdmUtdHJhaXQvMC4wLjEzIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9h
cmNoaXZlLXRyYWl0LzAuMC4xNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXJjc3RyLzEuMi4w
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hcnJheXZlYy8wLjcuOCBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vYXN0cmFsLXRva2lvLXRhci8wLjYuNCBcCkBAIC0zMiw4ICszMiw4IEBAIFNSQ19V
UkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYnl0ZWNoZWNrLzAuOC4yIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9ieXRlY2hlY2tfZGVyaXZlLzAuOC4yIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9ieXRlcy8xLjEyLjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NhcC1wcmltaXRp
dmVzLzQuMC4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9jYXAtc3RkLzQuMC4yIFwKKyAgICBj
cmF0ZTovL2NyYXRlcy5pby9jYXAtcHJpbWl0aXZlcy80LjAuMyBcCisgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vY2FwLXN0ZC80LjAuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2MvMS4yLjU3IFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9jZmctaWYvMS4wLjQgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2NoYXJzZXQvMC4xLjUgXApAQCAtMjE0LDggKzIxNCw4IEBAIFNSQ19VUkkgKz0gIiBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3luLzIuMC4xMTggXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3N5bi8zLjAuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3luc3RydWN0dXJlLzAuMTMuMiBc
Ci0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGFyLWNvZGVjLzAuMC4xMyBcCi0gICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vdGFyLWZyYW1pbmcvMC4wLjEzIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby90YXIt
Y29kZWMvMC4wLjE0IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby90YXItZnJhbWluZy8wLjAuMTQg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RlbXAtZW52LzAuMy42IFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby90ZW1wZmlsZS8zLjI3LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rlcm1pbmFs
X3NpemUvMC40LjQgXApAQCAtMzI0LDcgKzMyNCw3IEBAIFNSQ19VUklbYW5zdHlsZS1wYXJzZS0x
LjAuMC5zaGEyNTZzdW1dID0gIjUyY2U3ZjM4YjI0MjMxOWY3Y2FiYWE2ODEzMDU1NDY3MDYzZWNk
CiBTUkNfVVJJW2Fuc3R5bGUtcXVlcnktMS4xLjUuc2hhMjU2c3VtXSA9ICI0MGM0OGY3MmZkNTNj
ZDI4OTEwNGZjNjQwOTlhYmNhNzNkYjQxNjZhZDg2ZWEwYjQzNDFhYmU2NWFmODNkYWRjIgogU1JD
X1VSSVthbnN0eWxlLXdpbmNvbi0zLjAuMTEuc2hhMjU2c3VtXSA9ICIyOTFlNmEyNTBmZjg2Y2Q0
YTgyMDExMmZiODg5ODgwOGEzNjZkOGY5ZjU4Y2UxNmQxZjUzODM1M2FkNTU3NDdkIgogU1JDX1VS
SVthbnlob3ctMS4wLjEwNC5zaGEyNTZzdW1dID0gIjMzMGE1ZWQwN2ZhNTRlNDcwMmM5ZDZjNDE3
NGY3NDQyN2ZjMGVmNmUyMTRiYmQ2NzdhZTUwYTUwOTk5NDY0NzAiCi1TUkNfVVJJW2FyY2hpdmUt
dHJhaXQtMC4wLjEzLnNoYTI1NnN1bV0gPSAiZGMyM2I1OTVhZDQwOTIxNjNlYWY5YzBjNzUzMmRk
NWI2ZDgyMjc0YzIxNTYwYzk3ZGMwM2ZhNGU0ZjA5ZTY0NSIKK1NSQ19VUklbYXJjaGl2ZS10cmFp
dC0wLjAuMTQuc2hhMjU2c3VtXSA9ICJjNjA4MGVhMTRjY2Y5MDE5ZDdjZTU3MmMzMTllNTgxYzIw
YTgwNWM5YmRjNmRiZmI5Yjk4OGRhMDAzY2JkMWEzIgogU1JDX1VSSVthcmNzdHItMS4yLjAuc2hh
MjU2c3VtXSA9ICIwMzkxOGMzZGJkNzcwMWE4NWM2Yjk4ODc3MzJlMjkyMTE3NWYyNmMzNTBiNDU2
Mzg0MWQwOTU4YzIxZDU3ZTZkIgogU1JDX1VSSVthcnJheXZlYy0wLjcuOC5zaGEyNTZzdW1dID0g
ImQzZmI2N2E2ZTA4YWNmMjRmZGVjY2JhYzJjYjZhYzQzMDU4MjViZDFmMTE3NDYyZTBlNmYyZjE5
MzM0NWFkNTYiCiBTUkNfVVJJW2FzdHJhbC10b2tpby10YXItMC42LjQuc2hhMjU2c3VtXSA9ICJi
MTg0NTdlZmQxMzcyNTRlMDE2YmJkZTVlMWQ4OGRmNjFjNGUxYTVhZTIyMjM3NDZlNTYxMjNiYWM2
YWYyNDYzIgpAQCAtMzQ0LDggKzM0NCw4IEBAIFNSQ19VUklbYnVtcGFsby0zLjIwLjIuc2hhMjU2
c3VtXSA9ICI1ZDIwNzg5ODY4ZjRiMDFiMmYyY2FlYzlmNWM0ZTAyMTNiNDFlM2U1NzAyCiBTUkNf
VVJJW2J5dGVjaGVjay0wLjguMi5zaGEyNTZzdW1dID0gIjBjYWEzM2EyYzBlZGNhMDQxOWQxNWFj
NzIzZGZmMDNmMTk1NmY3OTc4MzI5YjFlM2I1ZmRhYWFlZDlkM2NhOGIiCiBTUkNfVVJJW2J5dGVj
aGVja19kZXJpdmUtMC44LjIuc2hhMjU2c3VtXSA9ICI4OTM4NWU4MmI1ZDE4MjFkMjIxOWUwYjA5
NWVmYTJjYzFmMjQ2Y2JmOTkwODBmM2JlNDZhMWE4NWMwZDM5MmQ5IgogU1JDX1VSSVtieXRlcy0x
LjEyLjEuc2hhMjU2c3VtXSA9ICJmYzY1MmE0OGMzNTJhZWYzZWEzYWVkMzIwODA1MDFjZjNlZjZl
ZDVkYTc4NjAyYTAyMGM5OTE3NzViMGFmZjA0IgotU1JDX1VSSVtjYXAtcHJpbWl0aXZlcy00LjAu
Mi5zaGEyNTZzdW1dID0gImNkYWRiZDdjMDAyZDNhNDg0YjM1MjQzNjY5YWJkYWU4NWEwZWJhZGVk
NWE2MTExNzE2OWRjMzQwMGY5YTdmZjAiCi1TUkNfVVJJW2NhcC1zdGQtNC4wLjIuc2hhMjU2c3Vt
XSA9ICI3MjgxMjM1ZDZlOTZkMzU0NGNhMThiYmE5MDQ5YmU5MmY0MTkwZjhkOTIzZTNjYWVmMWI1
ZjY2Y2ZhNzUyNjA4IgorU1JDX1VSSVtjYXAtcHJpbWl0aXZlcy00LjAuMy5zaGEyNTZzdW1dID0g
IjhiNWY3NDcyOWZkMmY0NDcwMWQxYThlYjQ3ZTkwNmNkYjNjY2Q5ZWMwZjAyYmFhZDg1YTc0NGI3
OTE5NDBiMTgiCitTUkNfVVJJW2NhcC1zdGQtNC4wLjMuc2hhMjU2c3VtXSA9ICJjMWVjNzhlMjQy
Y2ZhMmNmZTI3NjgwN2FjMmVjYzAwMzE1YTZjOTc3ODY5Nzc0MTRiY2QxYzM5NjNiNmM5MWI4Igog
U1JDX1VSSVtjYy0xLjIuNTcuc2hhMjU2c3VtXSA9ICI3YTBkZDFjYTM4NDkzMmZmMzY0MWM4NzE4
YTAyNzY5ZjE2OThlNzU2M2RjNjk3NGZmZDAzMzQ2MTE2MzEwNDIzIgogU1JDX1VSSVtjZmctaWYt
MS4wLjQuc2hhMjU2c3VtXSA9ICI5MzMwZjhiMmZmMTNmMzQ1NDBiNDRlOTQ2ZWYzNTExMTgyNTcy
N2IzOGQzMzI4NmVmOTg2MTQyNjE1MTIxODAxIgogU1JDX1VSSVtjaGFyc2V0LTAuMS41LnNoYTI1
NnN1bV0gPSAiZjFmOTI3YjA3Yzc0YmE4NGM3ZTVmZTRkYjJiYWViM2U5OTZhYjI2ODg5OTJlMzlh
YzY4Y2UzMjIwYTY3N2M3ZSIKQEAgLTUyNiw4ICs1MjYsOCBAQCBTUkNfVVJJW3N0cnNpbS0wLjEx
LjEuc2hhMjU2c3VtXSA9ICI3ZGE4YjU3MzY4NDVkOWYyZmNiODM3ZWE1ZDllMjYyODU2NGIzYjA0
M2E3MAogU1JDX1VSSVtzeW4tMi4wLjExOC5zaGEyNTZzdW1dID0gIjFiOWFlNTdmOTA0MjEzZWJi
NjQ5Y2U2ODk1YjhhNjZjNjZmMDIwM2I5MzE5NzE4ZjY5YTU2MTJhMDY1YjE0MjIiCiBTUkNfVVJJ
W3N5bi0zLjAuMy5zaGEyNTZzdW1dID0gIjUzZTliYWU1ODg0OWY2NGRmYTRmNWQ1YWUzNzJjODM0
MWY3MzA1ZjgyYTM4Njg3MDkyNjkzNDM2MjhiNjU5YTMiCiBTUkNfVVJJW3N5bnN0cnVjdHVyZS0w
LjEzLjIuc2hhMjU2c3VtXSA9ICI3MjhhNzBmM2RiYWY1YmFiN2YwYzRiMWFjOGQ3YWU1ZWE2MGE0
YjU1NDljOGE1OTE0MzYxYzk5MTQ3YTcwOWQyIgotU1JDX1VSSVt0YXItY29kZWMtMC4wLjEzLnNo
YTI1NnN1bV0gPSAiZjcxOGIxZjQ3MGI4ZmY1NzVkMTJjODVjMzNiZGM4YjMzNzQzMDA5NjY5Yzdh
NWUxOTIzYjY1ODMyMzVhMjI1OCIKLVNSQ19VUklbdGFyLWZyYW1pbmctMC4wLjEzLnNoYTI1NnN1
bV0gPSAiNWFjYTUwNGE1ODYxNmIwNGViMzgxODE5YzRkZGZkZjg3YjZkMzVmNjY5OTA5MGU2OGQ4
YjQwOTU0ZmI0MmRhNyIKK1NSQ19VUklbdGFyLWNvZGVjLTAuMC4xNC5zaGEyNTZzdW1dID0gIjdl
YTQyZWIxNDRkMzBmY2JmMzJjMjZkZmVhODk1OTE3NWJiODMzNWJmYjdiMThkMjBjNmVkMzJlZGVj
ZjA1NTEiCitTUkNfVVJJW3Rhci1mcmFtaW5nLTAuMC4xNC5zaGEyNTZzdW1dID0gIjc4MzIyM2E3
YTY1OTBiZTQyMjdjYjgyMWU3Y2U4MDM3MjU3NTUxMWY2N2M4MjQ5MjFhYmEwNzUyZDhhZDU1NzMi
CiBTUkNfVVJJW3RlbXAtZW52LTAuMy42LnNoYTI1NnN1bV0gPSAiOTYzNzQ4NTUwNjhmNDc0MDJj
MzEyMWM2ZWVkODhkMjljYjFkZThmM2FiMjcwOTBlMjczZTQyMGJkYWJjZjA1MCIKIFNSQ19VUklb
dGVtcGZpbGUtMy4yNy4wLnNoYTI1NnN1bV0gPSAiMzI0OTdlOWE0YzdiMzg1MzJlZmNkZWJlZWY4
Nzk3MDdhYTlmNzk0Mjk2YTRmMDI0NGY2ZjY5ZTliYzg1NzRiZCIKIFNSQ19VUklbdGVybWluYWxf
c2l6ZS0wLjQuNC5zaGEyNTZzdW1dID0gIjIzMGExYjgyMWNjYmQ3NWIxODU4MjBhMWYxZmY3YjE0
ZDIxZGExZTQ0MmUyMmMwODYzZWE1ZjA4NzcxYTg4NzQiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMi42LmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkXzAuMTIuNy5iYgpzaW1pbGFyaXR5
IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdXYtYnVpbGRfMC4xMi42LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMi43LmJiCmluZGV4IGRlODRlOGQ1YWQuLjAwZGNiYzFh
ZDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1i
dWlsZF8wLjEyLjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXV2LWJ1aWxkXzAuMTIuNy5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9MSUNFTlNFLUFQQUNIRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQz
MjcgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vY3JhdGVzL3V2LXBlcDUwOC9MaWNlbnNl
LUFwYWNoZTttZDU9ZTIzZmFkZDZjZWVmOGM2MThmYzFjNjUxOTFkODQ2ZmEgXAogICAgICAgICAg
ICAgICAgICAgICBmaWxlOi8vY3JhdGVzL3V2LXBlcDUwOC9MaWNlbnNlLUJTRDttZDU9ZWY3YTYw
MjdkYzRjMjM4OWI5YWZhZDdlNjkwMjc0YzciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0NzU2
ZjE3NzFkMzQyZmY4ZmY1MGI1MjlhZTIzYzU4ZDU4ZjE0ZjA5N2MyNDNjYTUwZDM3NzhkMGEyM2Qy
NGYwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImUwNGZlMDdjYzliNjIwN2E0MWU0OTcxZTA0ZDg1
MTAwZWRjZDFiZTdmZDlhNmM4ODk2OTJmNTA5MmE5YmQ3Y2YiCiAKIHJlcXVpcmUgJHtCUE59LWNy
YXRlcy5pbmMKIAotLSAKMi40Ny4xCgo=

--===============2589027219426640099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.12.6 [default] to 0.12.7 [default]
packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.12.6.tar.gz;downloadfilename=uv_build-0.12.6.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.13 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.6.4 crate://crates.io/astral-version-ranges/0.2.2 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.1 crate
 ://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.2 crate://crates.io/cap-std/4.0.2 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.5 crate://crates.io/clap_builder/4.6.5 crate://crates.io/clap_derive/4.6.4 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/const-oid/0.10.2 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/defmt/1.1.0 crate://cr
 ates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.17.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.33 crate://crates.io/futures-channel/0.3.33 crate://crates.io/futures-core/0.3.33 crate://crat
 es.io/futures-executor/0.3.33 crate://crates.io/futures-io/0.3.33 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.33 crate://crates.io/futures-sink/0.3.33 crate://crates.io/futures-task/0.3.33 crate://crates.io/futures-util/0.3.33 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.19 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/ins
 ta/1.48.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.35 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.35 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.35 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macr
 o/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/
 0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.26 crate://crates.io/ref-cast-impl/1.0.26 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.16 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.17 crate://crates.io/rkyv_derive/0.8.17 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.4 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.229 crate://
 crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.3 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.13 crate://crates.io/tar-framing/0.0.13 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/th
 iserror/2.0.19 crate://crates.io/thiserror-impl/2.0.19 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/tokio-util/0.7.19 crate://crates.io/toml/1.1.3+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.13+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/
 unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.24.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.i
 o/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/
 windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.12.7.tar.gz;downloadfilename=uv_build-0.12.7.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crat
 es.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.14 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.6.4 crate://crates.io/astral-version-ranges/0.2.2 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.5 crate://crates.io/clap_builder/
 4.6.5 crate://crates.io/clap_derive/4.6.4 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/const-oid/0.10.2 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.17.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate
 ://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.33 crate://crates.io/futures-channel/0.3.33 crate://crates.io/futures-core/0.3.33 crate://crates.io/futures-executor/0.3.33 crate://crates.io/futures-io/0.3.33 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.33 crate://crates.io/futures-sink/0.3.33 crate://crates.io/futures-task/0.3.33 crate://crates.io/futures-util/0.3.33 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.19 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5
 .0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.35 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.35 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.35 crate://crates.io/js
 -sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://c
 rates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.26 crate://crates.io/ref-cast-impl/1.0.26 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.16 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.17 crate://crates.io/rkyv_derive/0.8.17 
 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.4 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 cr
 ate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.3 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.14 crate://crates.io/tar-framing/0.0.14 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.19 crate://crates.io/thiserror-impl/2.0.19 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/tokio-util/0.7.19 crate://crates.io/toml/1.1.3+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.13+spec-1.1.0 crate://crates.io/to
 ml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.24.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crat
 e://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate:
 //crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate:
 //crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.12.6" to "0.12.7"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.12.6 [default] to 0.12.7 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.12.6" to "0.12.7"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.12.6 [default] to 0.12.7 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.12.6" to "0.12.7"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.12.6 [default] to 0.12.7 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.12.6" to "0.12.7"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.12.6 [default] to 0.12.7 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.12.6" to "0.12.7"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.12.6 [default] to 0.12.7 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.12.6" to "0.12.7"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.12.6 [default] to 0.12.7 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.12.6" to "0.12.7"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.6.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.12.7.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.6.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.12.7.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.12.6 [default] to 0.12.7 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 4466976 to 4458784 (-0%)
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.12.6" to "0.12.7"
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.12.6.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.12.7.dist-info

--===============2589027219426640099==--

