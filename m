Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC49C54FA7
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:06 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.131418.1723748333857409325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=UXfviQRx;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=qBzJeqMp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019157683cfd-0abdb31c-b0dd-4aef-858b-5b43954eecad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=S/KR0kVJwh9u9GRFPSkJCgejYdG9kZfkxh/hzg/sr1I=;
	b=UXfviQRx6eGaPOE+6BgtNlJQkuK5rSDCuJ6TPMBfL7PszzqKII29W66cT0fae7ca
	5esIpLUe/E9IcBodJxEUhlbQPt0UbdDK5Ja2An8SHSHFpZ1h7RJIdF7JfF3AvTWtYdo
	KJKgnHMjYuiXwtfW+G4lKNbcahu/g4vgZB6HCPNM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=S/KR0kVJwh9u9GRFPSkJCgejYdG9kZfkxh/hzg/sr1I=;
	b=qBzJeqMptOmaa3nyupk7tCRujRXbCb0i2/RaDmy8a8pSaOmvlvH0hSFKAo+d/X05
	m0nGYZAJAdFgZtkmwz+anm+eW35hvKCQqreXI1nZn1HpPH0iXxWGddzJR/IFEk9Zexc
	ztOzrPUUjo2xK/0js97t6vM3oIqw5cw/yg7Fjs9E=
Content-Type: multipart/mixed; boundary="===============1157457268129031479=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.16.0 FAILED
Message-ID: <0101019157683cfd-0abdb31c-b0dd-4aef-858b-5b43954eecad-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203404

--===============1157457268129031479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shadow* to *4.16.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-shadow-upgrade-4.15.1-4.16.0.patch
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
From 3b23aaad6cc131174f916b0ac89ac990dd43036a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 13:22:40 +0000
Subject: [PATCH] shadow: upgrade 4.15.1 -> 4.16.0

---
 ...commonio.c-fix-unexpected-open-failure-in-chroot-env.patch | 2 +-
 .../shadow/files/shadow-update-pam-conf.patch                 | 2 +-
 meta/recipes-extended/shadow/shadow.inc                       | 4 +++-
 .../shadow/{shadow_4.15.1.bb => shadow_4.16.0.bb}             | 0
 4 files changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/shadow/{shadow_4.15.1.bb => shadow_4.16.0.bb} (100%)

diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index cd99aad135..a8f874d603 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,4 +1,4 @@
-From f512071dd3a4c29d4bf048c5a89c4ba9160e37b1 Mon Sep 17 00:00:00 2001
+From ddc4201deaa091396b4be6182d51fbaa48d24aa6 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 17 Jul 2014 15:53:34 +0800
 Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
diff --git a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
index 1eacb8a53f..c501b9f4ec 100644
--- a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
+++ b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
@@ -1,4 +1,4 @@
-From 38882ab288fd4d2cc2e45dff222ae3412c8fe357 Mon Sep 17 00:00:00 2001
+From 59b7a05dc79d0bd48bc7d4d01209faca15a96ed7 Mon Sep 17 00:00:00 2001
 From: Kang Kai <kai.kang@windriver.com>
 Date: Wed, 20 Jul 2011 19:18:14 +0800
 Subject: [PATCH] shadow: update pam related configure files
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 3991006b43..464ad8de68 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -14,6 +14,8 @@ GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
+           file://login_defs_pam.sed \
+           file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            "
 
 SRC_URI:append:class-target = " \
@@ -24,7 +26,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            "
-SRC_URI[sha256sum] = "b34686b89b279887ffbf1f33128902ccc0fa1a998a3add44213bb12d7385b218"
+SRC_URI[sha256sum] = "1744f339e07a2b41056347ddd612839762ff565d7e9494fb049428002fa2e7e0"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
diff --git a/meta/recipes-extended/shadow/shadow_4.15.1.bb b/meta/recipes-extended/shadow/shadow_4.16.0.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.15.1.bb
rename to meta/recipes-extended/shadow/shadow_4.16.0.bb
-- 
2.44.0


--===============1157457268129031479==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shadow-upgrade-4.15.1-4.16.0.patch"

RnJvbSAzYjIzYWFhZDZjYzEzMTE3NGY5MTZiMGFjODlhYzk5MGRkNDMwMzZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTM6MjI6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFkb3c6IHVwZ3JhZGUgNC4xNS4xIC0+IDQuMTYuMAoKLS0tCiAuLi5jb21tb25pby5jLWZpeC11
bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1pbi1jaHJvb3QtZW52LnBhdGNoIHwgMiArLQogLi4uL3No
YWRvdy9maWxlcy9zaGFkb3ctdXBkYXRlLXBhbS1jb25mLnBhdGNoICAgICAgICAgICAgICAgICB8
IDIgKy0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93LmluYyAgICAgICAgICAg
ICAgICAgICAgICAgfCA0ICsrKy0KIC4uLi9zaGFkb3cve3NoYWRvd180LjE1LjEuYmIgPT4gc2hh
ZG93XzQuMTYuMC5iYn0gICAgICAgICAgICAgfCAwCiA0IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hh
ZG93L3tzaGFkb3dfNC4xNS4xLmJiID0+IHNoYWRvd180LjE2LjAuYmJ9ICgxMDAlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvY29tbW9uaW8uYy1maXgt
dW5leHBlY3RlZC1vcGVuLWZhaWx1cmUtaW4tY2hyb290LWVudi5wYXRjaCBiL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvY29tbW9uaW8uYy1maXgtdW5leHBlY3RlZC1vcGVuLWZh
aWx1cmUtaW4tY2hyb290LWVudi5wYXRjaAppbmRleCBjZDk5YWFkMTM1Li5hOGY4NzRkNjAzIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL2NvbW1vbmlvLmMt
Zml4LXVuZXhwZWN0ZWQtb3Blbi1mYWlsdXJlLWluLWNocm9vdC1lbnYucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy9jb21tb25pby5jLWZpeC11bmV4cGVjdGVk
LW9wZW4tZmFpbHVyZS1pbi1jaHJvb3QtZW52LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBm
NTEyMDcxZGQzYTRjMjlkNGJmMDQ4YzVhODljNGJhOTE2MGUzN2IxIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBkZGM0MjAxZGVhYTA5MTM5NmI0YmU2MTgyZDUxZmJhYTQ4ZDI0YWE2IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIu
Y29tPgogRGF0ZTogVGh1LCAxNyBKdWwgMjAxNCAxNTo1MzozNCArMDgwMAogU3ViamVjdDogW1BB
VENIXSBjb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1pbi1jaHJvb3QtZW52
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL3NoYWRvdy11
cGRhdGUtcGFtLWNvbmYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVz
L3NoYWRvdy11cGRhdGUtcGFtLWNvbmYucGF0Y2gKaW5kZXggMWVhY2I4YTUzZi4uYzUwMWI5ZjRl
YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy9zaGFkb3ct
dXBkYXRlLXBhbS1jb25mLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cv
ZmlsZXMvc2hhZG93LXVwZGF0ZS1wYW0tY29uZi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
Mzg4ODJhYjI4OGZkNGQyY2MyZTQ1ZGZmMjIyYWUzNDEyYzhmZTM1NyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gNTliN2EwNWRjNzlkMGJkNDhiYzdkNGQwMTIwOWZhY2ExNWE5NmVkNyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEthbmcgS2FpIDxrYWkua2FuZ0B3aW5kcml2
ZXIuY29tPgogRGF0ZTogV2VkLCAyMCBKdWwgMjAxMSAxOToxODoxNCArMDgwMAogU3ViamVjdDog
W1BBVENIXSBzaGFkb3c6IHVwZGF0ZSBwYW0gcmVsYXRlZCBjb25maWd1cmUgZmlsZXMKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93LmluYyBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93LmluYwppbmRleCAzOTkxMDA2YjQzLi40NjRhZDhk
ZTY4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvdy5pbmMK
KysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3cuaW5jCkBAIC0xNCw2ICsx
NCw4IEBAIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vc2hhZG93LW1haW50
L3NoYWRvdy9yZWxlYXNlcyIKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2Fk
LyR7UFZ9LyR7QlB9LnRhci5neiBcCiAgICAgICAgICAgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQ
QUNLQUdFQ09ORklHJywgJ3BhbScsICcke1BBTV9TUkNfVVJJfScsICcnLCBkKX0gXAogICAgICAg
ICAgICBmaWxlOi8vdXNlcmFkZCBcCisgICAgICAgICAgIGZpbGU6Ly9sb2dpbl9kZWZzX3BhbS5z
ZWQgXAorICAgICAgICAgICBmaWxlOi8vY29tbW9uaW8uYy1maXgtdW5leHBlY3RlZC1vcGVuLWZh
aWx1cmUtaW4tY2hyb290LWVudi5wYXRjaCBcCiAgICAgICAgICAgICIKIAogU1JDX1VSSTphcHBl
bmQ6Y2xhc3MtdGFyZ2V0ID0gIiBcCkBAIC0yNCw3ICsyNiw3IEBAIFNSQ19VUkk6YXBwZW5kOmNs
YXNzLXRhcmdldCA9ICIgXAogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBcCiAgICAg
ICAgICAgIGZpbGU6Ly9jb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1pbi1j
aHJvb3QtZW52LnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImIz
NDY4NmI4OWIyNzk4ODdmZmJmMWYzMzEyODkwMmNjYzBmYTFhOTk4YTNhZGQ0NDIxM2JiMTJkNzM4
NWIyMTgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTc0NGYzMzllMDdhMmI0MTA1NjM0N2RkZDYx
MjgzOTc2MmZmNTY1ZDdlOTQ5NGZiMDQ5NDI4MDAyZmEyZTdlMCIKIAogIyBBZGRpdGlvbmFsIFBv
bGljeSBmaWxlcyBmb3IgUEFNCiBQQU1fU1JDX1VSSSA9ICJmaWxlOi8vcGFtLmQvY2hmbiBcCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvd180LjE1LjEuYmIg
Yi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvd180LjE2LjAuYmIKc2ltaWxhcml0
eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hh
ZG93XzQuMTUuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFk
b3dfNC4xNi4wLmJiCi0tIAoyLjQ0LjAKCg==

--===============1157457268129031479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1869 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1867 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-46a146e0183d74841888f346183ac265c5449665"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:46a146e0183d74841888f346183ac265c5449665"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 353 Local 326 Mirrors 0 Missed 27 Current 509 (92% match, 96% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 7 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 546 of 862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_package_setscene)
NOTE: Running setscene task 629 of 862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package_setscene)
NOTE: Running setscene task 633 of 862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 644 of 862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_create_spdx_setscene)
NOTE: Running setscene task 700 of 862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 817 of 862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 822 of 862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 823 of 862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 825 of 862 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-native-4.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe systemd-1_256-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 855 of 862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 856 of 862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-native-4.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe systemd-1_256-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_package_setscene: Started
NOTE: Running task 1511 of 2464 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_fetch)
NOTE: Running task 1659 of 2464 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_fetch)
NOTE: recipe shadow-4.16.0-r0: task do_fetch: Started
NOTE: recipe shadow-4.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1832 of 2464 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_unpack)
NOTE: Running task 1835 of 2464 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.bb:do_fetch)
NOTE: Running task 1861 of 2464 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_fetch)
NOTE: recipe shadow-native-4.16.0-r0: task do_fetch: Started
NOTE: recipe shadow-native-4.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1995 of 2464 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_unpack)
NOTE: Running task 1996 of 2464 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2026 of 2464 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_fetch: Started
NOTE: recipe shadow-4.16.0-r0: task do_unpack: Started
NOTE: Running task 2062 of 2464 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.bb:do_warn_musl)
NOTE: Running task 2063 of 2464 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.bb:do_write_config)
NOTE: recipe systemd-1_256-r0: task do_fetch: Started
NOTE: recipe shadow-native-4.16.0-r0: task do_unpack: Started
NOTE: recipe shadow-native-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-4.0.4-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_fetch: Succeeded
NOTE: Running task 2293 of 2464 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_unpack)
NOTE: recipe systemd-1_256-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_256-r0: task do_write_config: Started
NOTE: recipe systemd-1_256-r0: task do_warn_musl: Succeeded
NOTE: recipe systemd-1_256-r0: task do_write_config: Succeeded
NOTE: recipe systemd-1_256-r0: task do_fetch: Succeeded
NOTE: Running task 2294 of 2464 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.bb:do_unpack)
NOTE: recipe shadow-native-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_unpack: Started
NOTE: recipe procps-4.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 2295 of 2464 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_unpack)
NOTE: recipe systemd-1_256-r0: task do_unpack: Started
NOTE: recipe procps-4.0.4-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_unpack: Succeeded
NOTE: Running task 2296 of 2464 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_patch)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 2298 of 2464 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_patch)
NOTE: recipe shadow-4.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2299 of 2464 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_patch)
NOTE: recipe procps-4.0.4-r0: task do_patch: Started
NOTE: recipe shadow-4.16.0-r0: task do_patch: Started
NOTE: recipe procps-4.0.4-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2301 of 2464 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2302 of 2464 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_populate_lic)
NOTE: recipe shadow-4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.16.0-r0: task do_populate_lic: Started
NOTE: recipe shadow-native-4.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2303 of 2464 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_patch)
NOTE: recipe shadow-native-4.16.0-r0: task do_patch: Started
NOTE: recipe shadow-4.16.0-r0: task do_populate_lic: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_populate_lic unihash changed to 4d146bc47eda2cbad643b3a75760745a3d5097c3008d2a5c6f6bc30f87e7d4d4
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_deploy_source_date_epoch unihash changed to b8cb161d8436a4ae6c391385b2fbff188ebc379f7982abb937db6ab4ae2a592b
NOTE: recipe systemd-1_256-r0: task do_unpack: Succeeded
NOTE: Running task 2304 of 2464 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.bb:do_patch)
NOTE: recipe systemd-1_256-r0: task do_patch: Started
NOTE: recipe systemd-1_256-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 861 of 862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 2342 of 2464 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2372 of 2464 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2373 of 2464 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_configure)
NOTE: recipe shadow-4.16.0-r0: task do_configure: Started
NOTE: recipe util-linux-2.40.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 862 of 862 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-native-4.16.0-r0: task do_patch: Failed
NOTE: recipe shadow-4.16.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2422 tasks of which 2399 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815132213.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815132213.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: shadow-native-4.16.0-r0 do_patch: Applying patch 'commonio.c-fix-unexpected-open-failure-in-chroot-env.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.16.0/shadow-4.16.0'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.16.0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch commonio.c-fix-unexpected-open-failure-in-chroot-env.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.16.0/temp/log.do_patch.2472411
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_patch) failed with exit code '1'

--===============1157457268129031479==--

