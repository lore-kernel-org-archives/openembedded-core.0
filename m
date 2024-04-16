Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCA3C41513
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:07 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.13423.1713248037148990084
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QWnC1YWe;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=QQ/TKlB2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018ee58a8201-bc3d50df-e113-4ca8-9bdb-8777be6bbaa5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QPEs1/SQVMtbVDA/Ir/yM78XnZzZL9kdXRxdIK8fYoo=;
	b=QWnC1YWe83DZ1x60l9y1AkyNVAThpp9kB6cpWZTl9YDD/ukq7bLqGS1U+qd/6GQ+
	TtIIlaJbZCxWQSMF/O3rvls8Novo6MmP+1HLX83JdUVMng+GldDDff2GXlhypfvTuXn
	fuGt3J/mTtaafXWrF+Bv8QulifkFnSlSY2mVQLf8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QPEs1/SQVMtbVDA/Ir/yM78XnZzZL9kdXRxdIK8fYoo=;
	b=QQ/TKlB2EhJIZ2QJt3g7n78LvniT6tLfGJsdO6lLeSbRZtR/rcpkG+VTVmDh4Agf
	egHELKoFi1ICSpokkpJusVBOuN+f6EbXhv5oVSAcMU+bBgQTbmyaQJefGJy7VzqR/PK
	K9UGZErgHCxn/PSUIIJWfIPXxfZTfTQf8mD10cbI=
Content-Type: multipart/mixed; boundary="===============2226574969489378419=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gobject-introspection: upgrading to 1.80.1 FAILED
Message-ID: <0101018ee58a8201-bc3d50df-e113-4ca8-9bdb-8777be6bbaa5-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198347

--===============2226574969489378419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gobject-introspection* to *1.80.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gobject-introspection-upgrade-1.78.1-1.80.1.patch
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
From 1a9b94d058dc217eeb964e81c8bb9033e56eae48 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 22:22:07 +0000
Subject: [PATCH] gobject-introspection: upgrade 1.78.1 -> 1.80.1

---
 ...e-the-repository-directory-for-native-builds.patch | 11 +++++------
 ...tion_1.78.1.bb => gobject-introspection_1.80.1.bb} |  2 +-
 2 files changed, 6 insertions(+), 7 deletions(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.78.1.bb => gobject-introspection_1.80.1.bb} (99%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
index c9e1afffd0..a8f194e84c 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -1,4 +1,4 @@
-From aeb5532f8be42d42f4e8725ca42e239b36983a4d Mon Sep 17 00:00:00 2001
+From 7c33ab90da23c3eeab26a10f69a4ee086a9ea988 Mon Sep 17 00:00:00 2001
 From: Sascha Silbe <x-yo17@se-silbe.de>
 Date: Fri, 8 Jun 2018 13:55:10 +0200
 Subject: [PATCH] Relocate the repository directory for native builds
@@ -14,14 +14,13 @@ cache or sstate mirror).
 
 Upstream-Status: Inappropriate
 Signed-off-by: Sascha Silbe <x-yo17@se-silbe.de>
-
 ---
  girepository/girepository.c | 15 +++++++++++++--
  girepository/meson.build    |  2 +-
  2 files changed, 14 insertions(+), 3 deletions(-)
 
 diff --git a/girepository/girepository.c b/girepository/girepository.c
-index a0754f4..2d456f9 100644
+index 12eaf36..876382c 100644
 --- a/girepository/girepository.c
 +++ b/girepository/girepository.c
 @@ -21,6 +21,8 @@
@@ -42,7 +41,7 @@ index a0754f4..2d456f9 100644
  /**
   * SECTION:girepository
   * @short_description: GObject Introspection repository manager
-@@ -215,9 +219,16 @@ init_globals (void)
+@@ -222,9 +226,16 @@ init_globals (void)
            g_free (custom_dirs);
          }
  
@@ -62,10 +61,10 @@ index a0754f4..2d456f9 100644
        typelib_search_path = g_slist_prepend (typelib_search_path, typelib_dir);
  
 diff --git a/girepository/meson.build b/girepository/meson.build
-index 786749a..15cf2a9 100644
+index 5ced59e..a580d9b 100644
 --- a/girepository/meson.build
 +++ b/girepository/meson.build
-@@ -45,7 +45,7 @@ girepo_internals_lib = static_library('girepository-internals',
+@@ -47,7 +47,7 @@ girepo_internals_lib = static_library('girepository-internals',
    ],
    c_args: gi_hidden_visibility_cflags + custom_c_args,
    include_directories : configinc,
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb
similarity index 99%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb
index 05a08a50e0..6c72d27379 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "bd7babd99af7258e76819e45ba4a6bc399608fe762d83fde3cac033c50841bb4"
+SRC_URI[sha256sum] = "a1df7c424e15bda1ab639c00e9051b9adf5cea1a9e512f8a603b53cd199bc6d8"
 
 SRC_URI:append:class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.42.0


--===============2226574969489378419==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gobject-introspection-upgrade-1.78.1-1.80.1.patch"

RnJvbSAxYTliOTRkMDU4ZGMyMTdlZWI5NjRlODFjOGJiOTAzM2U1NmVhZTQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMjI6MjI6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
b2JqZWN0LWludHJvc3BlY3Rpb246IHVwZ3JhZGUgMS43OC4xIC0+IDEuODAuMQoKLS0tCiAuLi5l
LXRoZS1yZXBvc2l0b3J5LWRpcmVjdG9yeS1mb3ItbmF0aXZlLWJ1aWxkcy5wYXRjaCB8IDExICsr
KysrLS0tLS0tCiAuLi50aW9uXzEuNzguMS5iYiA9PiBnb2JqZWN0LWludHJvc3BlY3Rpb25fMS44
MC4xLmJifSB8ICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNyBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9u
L3tnb2JqZWN0LWludHJvc3BlY3Rpb25fMS43OC4xLmJiID0+IGdvYmplY3QtaW50cm9zcGVjdGlv
bl8xLjgwLjEuYmJ9ICg5OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2dvYmpl
Y3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWludHJvc3BlY3Rpb24vMDAwMS1SZWxvY2F0ZS10aGUt
cmVwb3NpdG9yeS1kaXJlY3RvcnktZm9yLW5hdGl2ZS1idWlsZHMucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50cm9zcGVjdGlvbi8wMDAx
LVJlbG9jYXRlLXRoZS1yZXBvc2l0b3J5LWRpcmVjdG9yeS1mb3ItbmF0aXZlLWJ1aWxkcy5wYXRj
aAppbmRleCBjOWUxYWZmZmQwLi5hOGYxOTRlODRjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Z25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50cm9zcGVjdGlvbi8wMDAxLVJl
bG9jYXRlLXRoZS1yZXBvc2l0b3J5LWRpcmVjdG9yeS1mb3ItbmF0aXZlLWJ1aWxkcy5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50
cm9zcGVjdGlvbi8wMDAxLVJlbG9jYXRlLXRoZS1yZXBvc2l0b3J5LWRpcmVjdG9yeS1mb3ItbmF0
aXZlLWJ1aWxkcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYWViNTUzMmY4YmU0MmQ0MmY0
ZTg3MjVjYTQyZTIzOWIzNjk4M2E0ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gN2Mz
M2FiOTBkYTIzYzNlZWFiMjZhMTBmNjlhNGVlMDg2YTllYTk4OCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IFNhc2NoYSBTaWxiZSA8eC15bzE3QHNlLXNpbGJlLmRlPgogRGF0ZTogRnJp
LCA4IEp1biAyMDE4IDEzOjU1OjEwICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJlbG9jYXRlIHRo
ZSByZXBvc2l0b3J5IGRpcmVjdG9yeSBmb3IgbmF0aXZlIGJ1aWxkcwpAQCAtMTQsMTQgKzE0LDEz
IEBAIGNhY2hlIG9yIHNzdGF0ZSBtaXJyb3IpLgogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9w
cmlhdGUKIFNpZ25lZC1vZmYtYnk6IFNhc2NoYSBTaWxiZSA8eC15bzE3QHNlLXNpbGJlLmRlPgot
CiAtLS0KICBnaXJlcG9zaXRvcnkvZ2lyZXBvc2l0b3J5LmMgfCAxNSArKysrKysrKysrKysrLS0K
ICBnaXJlcG9zaXRvcnkvbWVzb24uYnVpbGQgICAgfCAgMiArLQogIDIgZmlsZXMgY2hhbmdlZCwg
MTQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2dpcmVwb3Np
dG9yeS9naXJlcG9zaXRvcnkuYyBiL2dpcmVwb3NpdG9yeS9naXJlcG9zaXRvcnkuYwotaW5kZXgg
YTA3NTRmNC4uMmQ0NTZmOSAxMDA2NDQKK2luZGV4IDEyZWFmMzYuLjg3NjM4MmMgMTAwNjQ0CiAt
LS0gYS9naXJlcG9zaXRvcnkvZ2lyZXBvc2l0b3J5LmMKICsrKyBiL2dpcmVwb3NpdG9yeS9naXJl
cG9zaXRvcnkuYwogQEAgLTIxLDYgKzIxLDggQEAKQEAgLTQyLDcgKzQxLDcgQEAgaW5kZXggYTA3
NTRmNC4uMmQ0NTZmOSAxMDA2NDQKICAvKioKICAgKiBTRUNUSU9OOmdpcmVwb3NpdG9yeQogICAq
IEBzaG9ydF9kZXNjcmlwdGlvbjogR09iamVjdCBJbnRyb3NwZWN0aW9uIHJlcG9zaXRvcnkgbWFu
YWdlcgotQEAgLTIxNSw5ICsyMTksMTYgQEAgaW5pdF9nbG9iYWxzICh2b2lkKQorQEAgLTIyMiw5
ICsyMjYsMTYgQEAgaW5pdF9nbG9iYWxzICh2b2lkKQogICAgICAgICAgICBnX2ZyZWUgKGN1c3Rv
bV9kaXJzKTsKICAgICAgICAgIH0KICAKQEAgLTYyLDEwICs2MSwxMCBAQCBpbmRleCBhMDc1NGY0
Li4yZDQ1NmY5IDEwMDY0NAogICAgICAgIHR5cGVsaWJfc2VhcmNoX3BhdGggPSBnX3NsaXN0X3By
ZXBlbmQgKHR5cGVsaWJfc2VhcmNoX3BhdGgsIHR5cGVsaWJfZGlyKTsKICAKIGRpZmYgLS1naXQg
YS9naXJlcG9zaXRvcnkvbWVzb24uYnVpbGQgYi9naXJlcG9zaXRvcnkvbWVzb24uYnVpbGQKLWlu
ZGV4IDc4Njc0OWEuLjE1Y2YyYTkgMTAwNjQ0CitpbmRleCA1Y2VkNTllLi5hNTgwZDliIDEwMDY0
NAogLS0tIGEvZ2lyZXBvc2l0b3J5L21lc29uLmJ1aWxkCiArKysgYi9naXJlcG9zaXRvcnkvbWVz
b24uYnVpbGQKLUBAIC00NSw3ICs0NSw3IEBAIGdpcmVwb19pbnRlcm5hbHNfbGliID0gc3RhdGlj
X2xpYnJhcnkoJ2dpcmVwb3NpdG9yeS1pbnRlcm5hbHMnLAorQEAgLTQ3LDcgKzQ3LDcgQEAgZ2ly
ZXBvX2ludGVybmFsc19saWIgPSBzdGF0aWNfbGlicmFyeSgnZ2lyZXBvc2l0b3J5LWludGVybmFs
cycsCiAgICBdLAogICAgY19hcmdzOiBnaV9oaWRkZW5fdmlzaWJpbGl0eV9jZmxhZ3MgKyBjdXN0
b21fY19hcmdzLAogICAgaW5jbHVkZV9kaXJlY3RvcmllcyA6IGNvbmZpZ2luYywKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1nbm9tZS9nb2JqZWN0LWludHJvc3BlY3Rpb24vZ29iamVjdC1pbnRy
b3NwZWN0aW9uXzEuNzguMS5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9nb2JqZWN0LWludHJvc3Bl
Y3Rpb24vZ29iamVjdC1pbnRyb3NwZWN0aW9uXzEuODAuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk5
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dv
YmplY3QtaW50cm9zcGVjdGlvbl8xLjc4LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1nbm9t
ZS9nb2JqZWN0LWludHJvc3BlY3Rpb24vZ29iamVjdC1pbnRyb3NwZWN0aW9uXzEuODAuMS5iYgpp
bmRleCAwNWEwOGE1MGUwLi42YzcyZDI3Mzc5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25v
bWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50cm9zcGVjdGlvbl8xLjc4LjEuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWlu
dHJvc3BlY3Rpb25fMS44MC4xLmJiCkBAIC0xNiw3ICsxNiw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PWM0MzRlODEyOGE2OGJlZGQ1OWI4MGIyYWMxZWIxYzRhIFwK
IFNSQ19VUkkgPSAiJHtHTk9NRV9NSVJST1J9LyR7QlBOfS8ke0BvZS51dGlscy50cmltX3ZlcnNp
b24oIiR7UFZ9IiwgMil9LyR7QlBOfS0ke1BWfS50YXIueHogXAogICAgICAgICAgICAiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJiZDdiYWJkOTlhZjcyNThlNzY4MTllNDViYTRhNmJjMzk5NjA4
ZmU3NjJkODNmZGUzY2FjMDMzYzUwODQxYmI0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImExZGY3
YzQyNGUxNWJkYTFhYjYzOWMwMGU5MDUxYjlhZGY1Y2VhMWE5ZTUxMmY4YTYwM2I1M2NkMTk5YmM2
ZDgiCiAKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmlsZTovLzAwMDEtUmVsb2Nh
dGUtdGhlLXJlcG9zaXRvcnktZGlyZWN0b3J5LWZvci1uYXRpdmUtYnVpbGRzLnBhdGNoIgogCi0t
IAoyLjQyLjAKCg==

--===============2226574969489378419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (921 cached, 1 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-278f65d8fc896e2ecf47324952f69e7b5cab7219"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:278f65d8fc896e2ecf47324952f69e7b5cab7219"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 328 Local 315 Mirrors 0 Missed 13 Current 369 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 419 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 421 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 428 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 430 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 567 of 697 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: Running task 493 of 1965 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_write_config)
NOTE: Running task 497 of 1965 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_write_config)
NOTE: recipe python3-setuptools-69.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_write_config: Succeeded
NOTE: recipe python3-setuptools-69.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 592 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 597 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 574 of 1965 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_fetch: Succeeded
NOTE: Running task 587 of 1965 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_fetch)
NOTE: recipe python3-3.12.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 630 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 649 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 655 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 664 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 673 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 680 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 682 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1253 of 1965 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_unpack)
NOTE: Running task 1256 of 1965 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_unpack)
NOTE: Running task 1275 of 1965 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_unpack: Succeeded
NOTE: Running task 1359 of 1965 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_patch: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_unpack: Succeeded
NOTE: Running task 1360 of 1965 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_patch)
NOTE: Running task 1361 of 1965 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_patch: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1364 of 1965 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_create_spdx)
NOTE: Running setscene task 692 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 694 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_patch: Succeeded
NOTE: Running task 1375 of 1965 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_create_spdx: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_create_spdx: Succeeded
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_deploy_source_date_epoch unihash changed to 4ff12d7df9fcc6bf3efb17434301f68ae231bd460d52ad0642f7db4896945bfa
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: Running task 1378 of 1965 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_configure)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_configure: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1940 of 1965 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_collect_spdx_deps: Succeeded
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:nat
 ive:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'cmake-native', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'bison-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'perl-native', 'pkgconfig-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'gtk-doc-native', 'gdbm-native', 'libcap-ng-native', 'libffi-native', 'libpcre2-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dgtk_doc=false -Ddoctool=disabled...
| The Meson build system
| Version: 1.3.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.1/gobject-introspection-1.80.1
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.1/build
| Build type: native build
| Project name: gobject-introspection
| Project version: 1.80.1
| C compiler for the host machine: gcc (gcc 13.2.0 "gcc (GCC) 13.2.0")
| C linker for the host machine: gcc ld.bfd 2.41.0.20230926
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Program python3 found: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.1/recipe-sysroot-native/usr/bin/python3-native/python3)
| Program python3 (setuptools) found: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.1/recipe-sysroot-native/usr/bin/python3-native/python3) modules: setuptools
| Compiler for C supports arguments -Warray-bounds: YES
| Compiler for C supports arguments -Wcast-align: YES
| Compiler for C supports arguments -Wduplicated-branches: YES
| Compiler for C supports arguments -Wformat=2: YES
| Compiler for C supports arguments -Wformat-nonliteral: YES
| Compiler for C supports arguments -Wformat-security: YES
| Compiler for C supports arguments -Wimplicit-function-declaration: YES
| Compiler for C supports arguments -Winit-self: YES
| Compiler for C supports arguments -Wjump-misses-init: YES
| Compiler for C supports arguments -Wlogical-op: YES
| Compiler for C supports arguments -Wmissing-declarations: YES
| Compiler for C supports arguments -Wmissing-format-attribute: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Wmissing-noreturn: YES
| Compiler for C supports arguments -Wmissing-prototypes: YES
| Compiler for C supports arguments -Wnested-externs: YES
| Compiler for C supports arguments -Wnull-dereference: YES
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C supports arguments -Wpacked: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Compiler for C supports arguments -Wrestrict: YES
| Compiler for C supports arguments -Wreturn-type: YES
| Compiler for C supports arguments -Wshadow: YES
| Compiler for C supports arguments -Wsign-compare: YES
| Compiler for C supports arguments -Wstrict-aliasing: YES
| Compiler for C supports arguments -Wstrict-prototypes: YES
| Compiler for C supports arguments -Wundef: YES
| Compiler for C supports arguments -Wunused-but-set-variable: YES
| Compiler for C supports arguments -Wwrite-strings: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Checking for size of "char" : 1
| Checking for size of "short" : 2
| Checking for size of "int" : 4
| Checking for size of "long" : 8
| Found pkg-config: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.1/recipe-sysroot-native/usr/bin/pkg-config-native) 0.29.2
| Dependency glib-2.0 found: NO found 2.78.4 but need: '>=2.80.0'
| Found CMake: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.1/recipe-sysroot-native/usr/bin/cmake (3.28.3)
| Run-time dependency glib-2.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency glib-2.0
| 
| ../gobject-introspection-1.80.1/meson.build:134:11: ERROR: Automatic wrap-based subproject downloading is disabled
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.1/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.1/temp/run.do_configure.369766:177 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.1/temp/run.do_configure.369766, line 177
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.1/temp/run.do_configure.369766, line 166
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.1/temp/run.do_configure.369766, line 155
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.1/temp/run.do_configure.369766, line 190
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1948 tasks of which 1934 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240415222147.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240415222147.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gobject-introspection-native-1.80.1-r0 do_configure: meson failed
ERROR: gobject-introspection-native-1.80.1-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.1/temp/run.do_configure.369766', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.1/temp/log.do_configure.369766
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_configure) failed with exit code '1'

--===============2226574969489378419==--

