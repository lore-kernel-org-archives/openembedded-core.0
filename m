Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46092C54EEC
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:15 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1250.1710522012666851723
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bZ4i+cGa;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=zfjJnOpw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018e430e96d6-30f2ef5e-2468-4daf-822d-a340f62a44ed-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522013;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ltz77xcUCNEMn9nbKPAFBCdWh+ZPT9pZVhq3SnS5F6E=;
	b=bZ4i+cGao+2242y8uQbYnvTLGio/rXQB08flwosTefMM43Hu8tDt/DW18W6s7x40
	c251vkhH1gCFs0FrvG9+yPZ+G0RBBL73rBUQRnzTUjLUVqbJQcGhp/s3n6NklBje1HO
	9Hshh7DhaEGFohktP0Sr/qzl0Nd45XtFIvBCtG7E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522013;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ltz77xcUCNEMn9nbKPAFBCdWh+ZPT9pZVhq3SnS5F6E=;
	b=zfjJnOpwwtF7FsOOrmHIUKo7mxnCW+bw4Upum6IAPiRdXWJCRqtgg79GTtbn5kZw
	A+7aX78jm3b2RBT5yndqoejt74y5fcT4AwhllMdLF8I9A9dHRmgo24WFozWUJhpDIwx
	vovZPBWXYNDtwmQnyNHh3TISUBorB6o358NlXd24=
Content-Type: multipart/mixed; boundary="===============3564158852371577557=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gobject-introspection: upgrading to 1.80.0 FAILED
Message-ID: <0101018e430e96d6-30f2ef5e-2468-4daf-822d-a340f62a44ed-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197201

--===============3564158852371577557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gobject-introspection* to *1.80.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gobject-introspection-upgrade-1.78.1-1.80.0.patch
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
From 45702d00afcaf06fa7317ef138602325d6af730d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 11:50:13 +0000
Subject: [PATCH] gobject-introspection: upgrade 1.78.1 -> 1.80.0

---
 ...e-the-repository-directory-for-native-builds.patch | 11 +++++------
 ...tion_1.78.1.bb => gobject-introspection_1.80.0.bb} |  2 +-
 2 files changed, 6 insertions(+), 7 deletions(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.78.1.bb => gobject-introspection_1.80.0.bb} (99%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
index c9e1afffd0..eb2605f8fb 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -1,4 +1,4 @@
-From aeb5532f8be42d42f4e8725ca42e239b36983a4d Mon Sep 17 00:00:00 2001
+From 46f419fef5073bc385ce681c9e564ce0f648632b Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb
similarity index 99%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb
index 05a08a50e0..b1a94cb284 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "bd7babd99af7258e76819e45ba4a6bc399608fe762d83fde3cac033c50841bb4"
+SRC_URI[sha256sum] = "54a90b4a3cb82fd6a3e8b8a7775178ebc954af3c2bc726ed5961e6503ce62636"
 
 SRC_URI:append:class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.42.0


--===============3564158852371577557==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gobject-introspection-upgrade-1.78.1-1.80.0.patch"

RnJvbSA0NTcwMmQwMGFmY2FmMDZmYTczMTdlZjEzODYwMjMyNWQ2YWY3MzBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMTE6NTA6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
b2JqZWN0LWludHJvc3BlY3Rpb246IHVwZ3JhZGUgMS43OC4xIC0+IDEuODAuMAoKLS0tCiAuLi5l
LXRoZS1yZXBvc2l0b3J5LWRpcmVjdG9yeS1mb3ItbmF0aXZlLWJ1aWxkcy5wYXRjaCB8IDExICsr
KysrLS0tLS0tCiAuLi50aW9uXzEuNzguMS5iYiA9PiBnb2JqZWN0LWludHJvc3BlY3Rpb25fMS44
MC4wLmJifSB8ICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNyBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9u
L3tnb2JqZWN0LWludHJvc3BlY3Rpb25fMS43OC4xLmJiID0+IGdvYmplY3QtaW50cm9zcGVjdGlv
bl8xLjgwLjAuYmJ9ICg5OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2dvYmpl
Y3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWludHJvc3BlY3Rpb24vMDAwMS1SZWxvY2F0ZS10aGUt
cmVwb3NpdG9yeS1kaXJlY3RvcnktZm9yLW5hdGl2ZS1idWlsZHMucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50cm9zcGVjdGlvbi8wMDAx
LVJlbG9jYXRlLXRoZS1yZXBvc2l0b3J5LWRpcmVjdG9yeS1mb3ItbmF0aXZlLWJ1aWxkcy5wYXRj
aAppbmRleCBjOWUxYWZmZmQwLi5lYjI2MDVmOGZiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Z25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50cm9zcGVjdGlvbi8wMDAxLVJl
bG9jYXRlLXRoZS1yZXBvc2l0b3J5LWRpcmVjdG9yeS1mb3ItbmF0aXZlLWJ1aWxkcy5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50
cm9zcGVjdGlvbi8wMDAxLVJlbG9jYXRlLXRoZS1yZXBvc2l0b3J5LWRpcmVjdG9yeS1mb3ItbmF0
aXZlLWJ1aWxkcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYWViNTUzMmY4YmU0MmQ0MmY0
ZTg3MjVjYTQyZTIzOWIzNjk4M2E0ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDZm
NDE5ZmVmNTA3M2JjMzg1Y2U2ODFjOWU1NjRjZTBmNjQ4NjMyYiBNb24gU2VwIDE3IDAwOjAwOjAw
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
Y3Rpb24vZ29iamVjdC1pbnRyb3NwZWN0aW9uXzEuODAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk5
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dv
YmplY3QtaW50cm9zcGVjdGlvbl8xLjc4LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1nbm9t
ZS9nb2JqZWN0LWludHJvc3BlY3Rpb24vZ29iamVjdC1pbnRyb3NwZWN0aW9uXzEuODAuMC5iYgpp
bmRleCAwNWEwOGE1MGUwLi5iMWE5NGNiMjg0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25v
bWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50cm9zcGVjdGlvbl8xLjc4LjEuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWlu
dHJvc3BlY3Rpb25fMS44MC4wLmJiCkBAIC0xNiw3ICsxNiw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PWM0MzRlODEyOGE2OGJlZGQ1OWI4MGIyYWMxZWIxYzRhIFwK
IFNSQ19VUkkgPSAiJHtHTk9NRV9NSVJST1J9LyR7QlBOfS8ke0BvZS51dGlscy50cmltX3ZlcnNp
b24oIiR7UFZ9IiwgMil9LyR7QlBOfS0ke1BWfS50YXIueHogXAogICAgICAgICAgICAiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJiZDdiYWJkOTlhZjcyNThlNzY4MTllNDViYTRhNmJjMzk5NjA4
ZmU3NjJkODNmZGUzY2FjMDMzYzUwODQxYmI0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU0YTkw
YjRhM2NiODJmZDZhM2U4YjhhNzc3NTE3OGViYzk1NGFmM2MyYmM3MjZlZDU5NjFlNjUwM2NlNjI2
MzYiCiAKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmlsZTovLzAwMDEtUmVsb2Nh
dGUtdGhlLXJlcG9zaXRvcnktZGlyZWN0b3J5LWZvci1uYXRpdmUtYnVpbGRzLnBhdGNoIgogCi0t
IAoyLjQyLjAKCg==

--===============3564158852371577557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (921 cached, 1 parsed). 1877 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-e748a4d6b3cb0040bae264d851ba807abe123f36"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e748a4d6b3cb0040bae264d851ba807abe123f36"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 336 Local 319 Mirrors 0 Missed 17 Current 361 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 437 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_create_spdx_setscene)
NOTE: Running task 913 of 1965 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb:do_recipe_qa)
NOTE: Running task 914 of 1965 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb:do_recipe_qa)
NOTE: Running task 950 of 1965 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb:do_write_config)
NOTE: Running task 958 of 1965 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.80.0-r0: task do_recipe_qa: Started
NOTE: recipe gobject-introspection-1.80.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-native-1.80.0-r0: task do_recipe_qa: Started
NOTE: recipe gobject-introspection-native-1.80.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.0-r0: task do_write_config: Succeeded
NOTE: Running setscene task 648 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 650 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 652 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-native-1.80.0-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.80.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1118 of 1965 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb:do_fetch)
NOTE: recipe gobject-introspection-native-1.80.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1119 of 1965 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb:do_fetch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 662 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.80.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-native-1.80.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.80.0-r0: task do_fetch: Succeeded
NOTE: Running task 1137 of 1965 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb:do_unpack)
NOTE: recipe gobject-introspection-native-1.80.0-r0: task do_fetch: Succeeded
NOTE: Running task 1138 of 1965 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.80.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 671 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-native-1.80.0-r0: task do_unpack: Started
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.80.0-r0: task do_unpack: Succeeded
NOTE: Running task 1141 of 1965 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 678 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 680 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.80.0-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-native-1.80.0-r0: task do_unpack: Succeeded
NOTE: Running task 1148 of 1965 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.80.0-r0: task do_patch: Succeeded
NOTE: Running task 1149 of 1965 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1150 of 1965 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb:do_populate_lic)
NOTE: recipe gobject-introspection-native-1.80.0-r0: task do_patch: Started
NOTE: Running task 1366 of 1965 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1382 of 1965 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.80.0-r0: task do_populate_lic: Started
NOTE: recipe gobject-introspection-1.80.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-native-1.80.0-r0: task do_patch: Succeeded
NOTE: Running task 1383 of 1965 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-native-1.80.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-native-1.80.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-1.80.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gobject-introspection-1.80.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-native-1.80.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-native-1.80.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-native-1.80.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1384 of 1965 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-native-1.80.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1385 of 1965 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb:do_configure)
NOTE: recipe gobject-introspection-native-1.80.0-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-native-1.80.0-r0: task do_configure: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 697 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-native-1.80.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1940 of 1965 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.80.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-1.80.0-r0: task do_collect_spdx_deps: Succeeded
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:nat
 ive:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'cmake-native', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'bison-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'perl-native', 'pkgconfig-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'gtk-doc-native', 'gdbm-native', 'libcap-ng-native', 'libffi-native', 'libpcre2-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dgtk_doc=false -Ddoctool=disabled...
| The Meson build system
| Version: 1.3.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.0/gobject-introspection-1.80.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.0/build
| Build type: native build
| Project name: gobject-introspection
| Project version: 1.80.0
| C compiler for the host machine: gcc (gcc 13.2.0 "gcc (GCC) 13.2.0")
| C linker for the host machine: gcc ld.bfd 2.41.0.20230926
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Program python3 found: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.0/recipe-sysroot-native/usr/bin/python3-native/python3)
| Program python3 (setuptools) found: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.0/recipe-sysroot-native/usr/bin/python3-native/python3) modules: setuptools
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
| Found pkg-config: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.0/recipe-sysroot-native/usr/bin/pkg-config-native) 0.29.2
| Dependency glib-2.0 found: NO found 2.78.4 but need: '>=2.80.0'
| Found CMake: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.0/recipe-sysroot-native/usr/bin/cmake (3.28.3)
| Run-time dependency glib-2.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency glib-2.0
| 
| ../gobject-introspection-1.80.0/meson.build:134:11: ERROR: Automatic wrap-based subproject downloading is disabled
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.0/temp/run.do_configure.1286144:177 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.0/temp/run.do_configure.1286144, line 177
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.0/temp/run.do_configure.1286144, line 166
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.0/temp/run.do_configure.1286144, line 155
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.0/temp/run.do_configure.1286144, line 190
NOTE: recipe gobject-introspection-native-1.80.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1948 tasks of which 1930 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240315114949.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240315114949.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gobject-introspection-native-1.80.0-r0 do_configure: meson failed
ERROR: gobject-introspection-native-1.80.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.0/temp/run.do_configure.1286144', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.80.0/temp/log.do_configure.1286144
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.0.bb:do_configure) failed with exit code '1'

--===============3564158852371577557==--

