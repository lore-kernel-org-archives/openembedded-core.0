Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9337.1795068807003887066
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 22:13:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KPfckyAV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oVlVbiad;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1f270430b-2f2f7a15-6301-49a4-8e5d-b883d797bb2c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795068806;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UGYg2MjRmlUUlTAUZK1R8iCxdAqTjwm1sbJ0NxVZlcs=;
	b=KPfckyAVmQbnRAvh8JYmUObLSZZoyXjZBvsEsidjLn860RD6OrleygV60vsXZ/AN
	5rIq75h8vjyPpCaUnjf9Duz/uKo9pCT9I8JEKMah9Y+irJDn0GjhAEKy/ZPrWWKR5+W
	kXeIp7psCQMC5Fd+1pYRRcPYWwExyhidKCFR3B5w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795068806;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UGYg2MjRmlUUlTAUZK1R8iCxdAqTjwm1sbJ0NxVZlcs=;
	b=oVlVbiadrNC3W1e3RDFLFpRmbUfMF2v0ZFOp2f/eBmE/J9i7R+eUD0GhO7pgk2bZ
	R6X333fS42OnUINe/WP90f+aWHNw+5hG51hpU/7LJHhQFtBAjdU9aug/LVLI0tEXNvY
	hrTgzEE0DINdKhiDJ0xJAcqiGO9vYctAVLuOIH1Y=
Content-Type: multipart/mixed; boundary="===============2029261962096245804=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Peyman Jahangirlou <peyman.jahangirlou@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nfs-utils: upgrading to 3.2.1 FAILED
Message-ID: <010101a1f270430b-2f2f7a15-6301-49a4-8e5d-b883d797bb2c-000000@us-west-2.amazonses.com>
Date: Thu, 19 Nov 2026 06:13:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.19-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 06:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250642

--===============2029261962096245804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *nfs-utils* to *3.2.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-nfs-utils-upgrade-3.1.1-3.2.1.patch
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
From 3bcc2a9dc30e50a3a1f456c001864a31fa4b07e9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 19 Nov 2026 05:17:05 +0000
Subject: [PATCH] nfs-utils: upgrade 3.1.1 -> 3.2.1

---
 .../nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch | 2 +-
 .../nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch    | 2 +-
 .../nfs-utils/{nfs-utils_3.1.1.bb => nfs-utils_3.2.1.bb}        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_3.1.1.bb => nfs-utils_3.2.1.bb} (98%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
index 1bc3fc832b..4264606ba9 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
@@ -1,4 +1,4 @@
-From f8407c33b26641c08ad76422ba2ff78214364b19 Mon Sep 17 00:00:00 2001
+From 82d21e18c40fc1f7a2869a5224a177eeaf70a887 Mon Sep 17 00:00:00 2001
 From: Daniel McGregor <daniel.mcgregor@vecima.com>
 Date: Tue, 6 Jun 2023 16:07:53 -0600
 Subject: [PATCH] Use "nogroup" for nobody group
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
index e88608bd37..03ab710804 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
@@ -1,4 +1,4 @@
-From 43a992e7bb491fd6e7e50861c9eaf0c549e98293 Mon Sep 17 00:00:00 2001
+From d763f11e44f2d1b834fbcf3d805915b0a7dba720 Mon Sep 17 00:00:00 2001
 From: Daniel McGregor <daniel.mcgregor@vecima.com>
 Date: Wed, 8 Nov 2023 16:24:20 -0600
 Subject: [PATCH] find OE provided Kerberos
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_3.1.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb
similarity index 98%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_3.1.1.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb
index 89a69ca72c..a35a7272a6 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_3.1.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb
@@ -25,7 +25,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0005-find-OE-provided-Kerberos.patch \
            "
 
-SRC_URI[sha256sum] = "7dbc05eb8b32828b322872b759a62cb3979cb4118f344dd8616813d1390e84e0"
+SRC_URI[sha256sum] = "a54163d8dd589fc87048c6029011bda101a580c27770a377558be2422a976afb"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.47.1


--===============2029261962096245804==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nfs-utils-upgrade-3.1.1-3.2.1.patch"

RnJvbSAzYmNjMmE5ZGMzMGU1MGEzYTFmNDU2YzAwMTg2NGEzMWZhNGIwN2U5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTkgTm92IDIwMjYgMDU6MTc6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
ZnMtdXRpbHM6IHVwZ3JhZGUgMy4xLjEgLT4gMy4yLjEKCi0tLQogLi4uL25mcy11dGlscy9uZnMt
dXRpbHMvMDAwNC1Vc2Utbm9ncm91cC1mb3Itbm9ib2R5LWdyb3VwLnBhdGNoIHwgMiArLQogLi4u
L25mcy11dGlscy9uZnMtdXRpbHMvMDAwNS1maW5kLU9FLXByb3ZpZGVkLUtlcmJlcm9zLnBhdGNo
ICAgIHwgMiArLQogLi4uL25mcy11dGlscy97bmZzLXV0aWxzXzMuMS4xLmJiID0+IG5mcy11dGls
c18zLjIuMS5iYn0gICAgICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMt
dXRpbHMve25mcy11dGlsc18zLjEuMS5iYiA9PiBuZnMtdXRpbHNfMy4yLjEuYmJ9ICg5OCUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxz
LzAwMDQtVXNlLW5vZ3JvdXAtZm9yLW5vYm9keS1ncm91cC5wYXRjaCBiL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlscy8wMDA0LVVzZS1ub2dyb3VwLWZvci1ub2Jv
ZHktZ3JvdXAucGF0Y2gKaW5kZXggMWJjM2ZjODMyYi4uNDI2NDYwNmJhOSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDQtVXNlLW5v
Z3JvdXAtZm9yLW5vYm9keS1ncm91cC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L25mcy11dGlscy9uZnMtdXRpbHMvMDAwNC1Vc2Utbm9ncm91cC1mb3Itbm9ib2R5LWdyb3Vw
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmODQwN2MzM2IyNjY0MWMwOGFkNzY0MjJiYTJm
Zjc4MjE0MzY0YjE5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4MmQyMWUxOGM0MGZj
MWY3YTI4NjlhNTIyNGExNzdlZWFmNzBhODg3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogRGFuaWVsIE1jR3JlZ29yIDxkYW5pZWwubWNncmVnb3JAdmVjaW1hLmNvbT4KIERhdGU6IFR1
ZSwgNiBKdW4gMjAyMyAxNjowNzo1MyAtMDYwMAogU3ViamVjdDogW1BBVENIXSBVc2UgIm5vZ3Jv
dXAiIGZvciBub2JvZHkgZ3JvdXAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvbmZzLXV0aWxzL25mcy11dGlscy8wMDA1LWZpbmQtT0UtcHJvdmlkZWQtS2VyYmVyb3MucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHMvMDAwNS1m
aW5kLU9FLXByb3ZpZGVkLUtlcmJlcm9zLnBhdGNoCmluZGV4IGU4ODYwOGJkMzcuLjAzYWI3MTA4
MDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11
dGlscy8wMDA1LWZpbmQtT0UtcHJvdmlkZWQtS2VyYmVyb3MucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDUtZmluZC1PRS1wcm92aWRl
ZC1LZXJiZXJvcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDNhOTkyZTdiYjQ5MWZkNmU3
ZTUwODYxYzllYWYwYzU0OWU5ODI5MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDc2
M2YxMWU0NGYyZDFiODM0ZmJjZjNkODA1OTE1YjBhN2RiYTcyMCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IERhbmllbCBNY0dyZWdvciA8ZGFuaWVsLm1jZ3JlZ29yQHZlY2ltYS5jb20+
CiBEYXRlOiBXZWQsIDggTm92IDIwMjMgMTY6MjQ6MjAgLTA2MDAKIFN1YmplY3Q6IFtQQVRDSF0g
ZmluZCBPRSBwcm92aWRlZCBLZXJiZXJvcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzXzMuMS4xLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzXzMuMi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTgl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGls
c18zLjEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMv
bmZzLXV0aWxzXzMuMi4xLmJiCmluZGV4IDg5YTY5Y2E3MmMuLmEzNWE3MjcyYTYgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlsc18zLjEuMS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHNfMy4y
LjEuYmIKQEAgLTI1LDcgKzI1LDcgQEAgU1JDX1VSSSA9ICIke0tFUk5FTE9SR19NSVJST1J9L2xp
bnV4L3V0aWxzL25mcy11dGlscy8ke1BWfS9uZnMtdXRpbHMtJHtQVn0udGFyLngKICAgICAgICAg
ICAgZmlsZTovLzAwMDUtZmluZC1PRS1wcm92aWRlZC1LZXJiZXJvcy5wYXRjaCBcCiAgICAgICAg
ICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdkYmMwNWViOGIzMjgyOGIzMjI4NzJiNzU5
YTYyY2IzOTc5Y2I0MTE4ZjM0NGRkODYxNjgxM2QxMzkwZTg0ZTAiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYTU0MTYzZDhkZDU4OWZjODcwNDhjNjAyOTAxMWJkYTEwMWE1ODBjMjc3NzBhMzc3NTU4
YmUyNDIyYTk3NmFmYiIKIAogIyBPbmx5IGtlcm5lbC1tb2R1bGUtbmZzZCBpcyByZXF1aXJlZCBo
ZXJlIChidXQgY2FuIGJlIGJ1aWx0LWluKSAgLSB0aGUgbmZzZCBtb2R1bGUgd2lsbAogIyBwdWxs
IGluIHRoZSByZW1haW5kZXIgb2YgdGhlIGRlcGVuZGVuY2llcy4KLS0gCjIuNDcuMQoK

--===============2029261962096245804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 961 .bb files complete (0 cached, 961 parsed). 2010 targets, 43 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.1.99+snapshot-7ad02a3797c9cfc2a3aa1c0c9d9a76104ff261cf"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:7ad02a3797c9cfc2a3aa1c0c9d9a76104ff261cf"
meta-yocto-bsp       
meta-poky            = "master:8becfabefdf5df564aafe2d07d10e4b05fbaedb1"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 369 Local 355 Mirrors 0 Missed 14 Current 666 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1966 of 2497 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb:do_recipe_qa)
NOTE: Running task 2436 of 2497 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb:do_create_recipe_spdx)
NOTE: recipe nfs-utils-3.2.1-r0: task do_recipe_qa: Started
NOTE: recipe nfs-utils-3.2.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe nfs-utils-3.2.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2479 of 2497 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb:do_fetch)
NOTE: recipe nfs-utils-3.2.1-r0: task do_fetch: Started
NOTE: recipe nfs-utils-3.2.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe nfs-utils-3.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2480 of 2497 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb:do_unpack)
NOTE: Running task 2481 of 2497 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe nfs-utils-3.2.1-r0: task do_unpack: Started
NOTE: recipe nfs-utils-3.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nfs-utils-3.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2482 of 2497 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb:do_patch)
NOTE: recipe nfs-utils-3.2.1-r0: task do_patch: Started
NOTE: recipe nfs-utils-3.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2483 of 2497 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2484 of 2497 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb:do_populate_lic)
NOTE: recipe nfs-utils-3.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nfs-utils-3.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nfs-utils-3.2.1-r0: task do_populate_lic: Started
NOTE: recipe nfs-utils-3.2.1-r0: task do_populate_lic: Succeeded
NOTE: recipe nfs-utils-3.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2485 of 2497 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb:do_configure)
NOTE: recipe nfs-utils-3.2.1-r0: task do_configure: Started
NOTE: recipe nfs-utils-3.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2486 of 2497 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb:do_compile)
NOTE: recipe nfs-utils-3.2.1-r0: task do_compile: Started
NOTE: recipe nfs-utils-3.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2487 of 2497 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb:do_install)
NOTE: recipe nfs-utils-3.2.1-r0: task do_install: Started
NOTE: recipe nfs-utils-3.2.1-r0: task do_install: Succeeded
NOTE: Running task 2488 of 2497 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb:do_package)
NOTE: Running task 2489 of 2497 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb:do_populate_sysroot)
NOTE: recipe nfs-utils-3.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe nfs-utils-3.2.1-r0: task do_package: Started
NOTE: recipe nfs-utils-3.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nfs-utils-3.2.1-r0: task do_package: Succeeded
NOTE: Running task 2490 of 2497 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb:do_packagedata)
NOTE: recipe nfs-utils-3.2.1-r0: task do_packagedata: Started
NOTE: recipe nfs-utils-3.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2491 of 2497 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb:do_create_spdx)
NOTE: Running task 2492 of 2497 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb:do_package_write_ipk)
NOTE: Running task 2493 of 2497 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb:do_package_write_deb)
NOTE: Running task 2494 of 2497 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb:do_package_write_rpm)
NOTE: Running task 2495 of 2497 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb:do_package_qa)
NOTE: recipe nfs-utils-3.2.1-r0: task do_create_spdx: Started
NOTE: recipe nfs-utils-3.2.1-r0: task do_package_write_ipk: Started
NOTE: recipe nfs-utils-3.2.1-r0: task do_package_write_deb: Started
NOTE: recipe nfs-utils-3.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe nfs-utils-3.2.1-r0: task do_package_qa: Started
NOTE: recipe nfs-utils-3.2.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2496 of 2497 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb:do_create_package_spdx)
NOTE: recipe nfs-utils-3.2.1-r0: task do_create_package_spdx: Started
NOTE: recipe nfs-utils-3.2.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe nfs-utils-3.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe nfs-utils-3.2.1-r0: task do_create_package_spdx: Succeeded
NOTE: recipe nfs-utils-3.2.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe nfs-utils-3.2.1-r0: task do_package_qa: Failed
NOTE: Tasks Summary: Attempted 2496 tasks of which 2476 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261119051620.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261119051620.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb:do_package_qa
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/3.2.1/temp/log.do_package_qa.2263611
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: nfs-utils-3.2.1-r0 do_package_qa: QA Issue: /usr/sbin/nfsd-iomode-advisor contained in package nfs-utils requires /usr/bin/python3, but no providers found in RDEPENDS:nfs-utils? [file-rdeps]
ERROR: nfs-utils-3.2.1-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/3.2.1/temp/log.do_package_qa.2263611
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_3.2.1.bb:do_package_qa) failed with exit code '1'

--===============2029261962096245804==--
