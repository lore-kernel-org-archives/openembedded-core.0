Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 986DAC7112A
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:13 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.11258.1747312308696674317
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=u7eZjP8H;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=dB9ToGPX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010196d3ee2e2c-44449f74-45eb-4540-aab6-c8ce2241e386-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sj4N01wq80B6f1g0YOuDcXrVZKm4fVgmbTqicuuA/sk=;
	b=u7eZjP8HF24hVZp1CCGueNTExPbQcRuLLmdH0wlBiQhW27c6BXG9KyxejaEbnHUe
	IL/8hOlBSFFzCD9JKkeSfdNGs2nw3fKPDz4ed5ZWqB1/XOneSInxjW8yOzbouTVoFeR
	Er32mxSb8sQjPLRLtMSIX/8UzTmTeAflXRgZQIl4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sj4N01wq80B6f1g0YOuDcXrVZKm4fVgmbTqicuuA/sk=;
	b=dB9ToGPXP7BCoemzLnxyJXQ1BsqkNt+m7fqtcds3pK0ZirIqI+78DpD+d4t5MPqN
	U2h/tbvsf8PoMM0BLtP2zyfKhNf4DcK4T264yz8sRe9MDJ+4TZnz1mxrClsHhqbRRse
	1qaKL3q5mZ3dFEr6nvX8NDpalnKiBaGCEpDIurs8=
Content-Type: multipart/mixed; boundary="===============1881927744107959678=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 11.2.1 SUCCEEDED
Message-ID: <01010196d3ee2e2c-44449f74-45eb-4540-aab6-c8ce2241e386-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:32:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216644

--===============1881927744107959678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *harfbuzz* to *11.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-11.2.0-11.2.1.patch
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
From 85da4c56281a08ba0ab2a8d2330a2cea86763481 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 10:07:12 +0000
Subject: [PATCH] harfbuzz: upgrade 11.2.0 -> 11.2.1

---
 ...se-Os-to-compile-hb-subset-plan-layout.cc.patch | 14 +++++++-------
 .../{harfbuzz_11.2.0.bb => harfbuzz_11.2.1.bb}     |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_11.2.0.bb => harfbuzz_11.2.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch
index 299843797b..58d2db765d 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch
@@ -1,4 +1,4 @@
-From 8d876ea19579ee6b687668921c17be423cf7d6c2 Mon Sep 17 00:00:00 2001
+From 234965d0f4ee5ab5905306fc755703ba267aba5e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 Apr 2025 15:26:09 -0700
 Subject: [PATCH] Use -Os to compile hb-subset-plan-layout.cc
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+), 3 deletions(-)
 
 diff --git a/src/meson.build b/src/meson.build
-index 3d1c00d..fded728 100644
+index cbe5d9e..d7fc764 100644
 --- a/src/meson.build
 +++ b/src/meson.build
-@@ -393,7 +393,6 @@ hb_subset_sources = files(
+@@ -398,7 +398,6 @@ hb_subset_sources = files(
    'hb-subset-instancer-solver.hh',
    'hb-subset-instancer-solver.cc',
    'hb-subset-plan.cc',
@@ -28,7 +28,7 @@ index 3d1c00d..fded728 100644
    'hb-subset-plan-var.cc',
    'hb-subset-plan.hh',
    'hb-subset-plan-member-list.hh',
-@@ -410,6 +409,10 @@ hb_subset_sources = files(
+@@ -415,6 +414,10 @@ hb_subset_sources = files(
    'hb-subset.hh',
  )
  
@@ -39,7 +39,7 @@ index 3d1c00d..fded728 100644
  hb_subset_headers = files(
    'hb-subset.h',
    'hb-subset-serialize.h'
-@@ -618,6 +621,12 @@ endif
+@@ -629,6 +632,12 @@ endif
  
  darwin_versions = [hb_version_int, '@0@.0.0'.format(hb_version_int)]
  
@@ -52,7 +52,7 @@ index 3d1c00d..fded728 100644
  libharfbuzz = library('harfbuzz', hb_sources,
    include_directories: incconfig,
    dependencies: harfbuzz_deps,
-@@ -645,7 +654,7 @@ defs_list += [harfbuzz_subset_def]
+@@ -656,7 +665,7 @@ defs_list += [harfbuzz_subset_def]
  libharfbuzz_subset = library('harfbuzz-subset', hb_subset_sources,
    include_directories: incconfig,
    dependencies: [m_dep],
@@ -61,7 +61,7 @@ index 3d1c00d..fded728 100644
    cpp_args: cpp_args + extra_hb_cpp_args,
    soversion: hb_so_version,
    version: version,
-@@ -657,7 +666,7 @@ libharfbuzz_subset = library('harfbuzz-subset', hb_subset_sources,
+@@ -668,7 +677,7 @@ libharfbuzz_subset = library('harfbuzz-subset', hb_subset_sources,
  custom_target('harfbuzz-subset.cc',
    build_by_default: true,
    output: 'harfbuzz-subset.cc',
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_11.2.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb
index db5a04486c..71eada7f28 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 SRC_URI += "file://0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch"
-SRC_URI[sha256sum] = "50f7d0a208367e606dbf6eecc5cfbecc01a47be6ee837ae7aff2787e24b09b45"
+SRC_URI[sha256sum] = "093714c8548a285094685f0bdc999e202d666b59eeb3df2ff921ab68b8336a49"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.47.1


--===============1881927744107959678==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-11.2.0-11.2.1.patch"

RnJvbSA4NWRhNGM1NjI4MWEwOGJhMGFiMmE4ZDIzMzBhMmNlYTg2NzYzNDgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMTA6MDc6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
YXJmYnV6ejogdXBncmFkZSAxMS4yLjAgLT4gMTEuMi4xCgotLS0KIC4uLnNlLU9zLXRvLWNvbXBp
bGUtaGItc3Vic2V0LXBsYW4tbGF5b3V0LmNjLnBhdGNoIHwgMTQgKysrKysrKy0tLS0tLS0KIC4u
Li97aGFyZmJ1enpfMTEuMi4wLmJiID0+IGhhcmZidXp6XzExLjIuMS5iYn0gICAgIHwgIDIgKy0K
IDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei97aGFyZmJ1enpfMTEuMi4wLmJiID0+IGhh
cmZidXp6XzExLjIuMS5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvaGFyZmJ1enovaGFyZmJ1enovMDAwMS1Vc2UtT3MtdG8tY29tcGlsZS1oYi1zdWJzZXQtcGxh
bi1sYXlvdXQuY2MucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1
enovMDAwMS1Vc2UtT3MtdG8tY29tcGlsZS1oYi1zdWJzZXQtcGxhbi1sYXlvdXQuY2MucGF0Y2gK
aW5kZXggMjk5ODQzNzk3Yi4uNThkMmRiNzY1ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL2hhcmZidXp6L2hhcmZidXp6LzAwMDEtVXNlLU9zLXRvLWNvbXBpbGUtaGItc3Vic2V0
LXBsYW4tbGF5b3V0LmNjLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6
ei9oYXJmYnV6ei8wMDAxLVVzZS1Pcy10by1jb21waWxlLWhiLXN1YnNldC1wbGFuLWxheW91dC5j
Yy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOGQ4NzZlYTE5NTc5ZWU2YjY4NzY2ODkyMWMx
N2JlNDIzY2Y3ZDZjMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjM0OTY1ZDBmNGVl
NWFiNTkwNTMwNmZjNzU1NzAzYmEyNjdhYmE1ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTdW4sIDI3IEFwciAyMDI1
IDE1OjI2OjA5IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIFVzZSAtT3MgdG8gY29tcGlsZSBoYi1z
dWJzZXQtcGxhbi1sYXlvdXQuY2MKQEAgLTE3LDEwICsxNywxMCBAQCBTaWduZWQtb2ZmLWJ5OiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL21lc29uLmJ1aWxkIGIv
c3JjL21lc29uLmJ1aWxkCi1pbmRleCAzZDFjMDBkLi5mZGVkNzI4IDEwMDY0NAoraW5kZXggY2Jl
NWQ5ZS4uZDdmYzc2NCAxMDA2NDQKIC0tLSBhL3NyYy9tZXNvbi5idWlsZAogKysrIGIvc3JjL21l
c29uLmJ1aWxkCi1AQCAtMzkzLDcgKzM5Myw2IEBAIGhiX3N1YnNldF9zb3VyY2VzID0gZmlsZXMo
CitAQCAtMzk4LDcgKzM5OCw2IEBAIGhiX3N1YnNldF9zb3VyY2VzID0gZmlsZXMoCiAgICAnaGIt
c3Vic2V0LWluc3RhbmNlci1zb2x2ZXIuaGgnLAogICAgJ2hiLXN1YnNldC1pbnN0YW5jZXItc29s
dmVyLmNjJywKICAgICdoYi1zdWJzZXQtcGxhbi5jYycsCkBAIC0yOCw3ICsyOCw3IEBAIGluZGV4
IDNkMWMwMGQuLmZkZWQ3MjggMTAwNjQ0CiAgICAnaGItc3Vic2V0LXBsYW4tdmFyLmNjJywKICAg
ICdoYi1zdWJzZXQtcGxhbi5oaCcsCiAgICAnaGItc3Vic2V0LXBsYW4tbWVtYmVyLWxpc3QuaGgn
LAotQEAgLTQxMCw2ICs0MDksMTAgQEAgaGJfc3Vic2V0X3NvdXJjZXMgPSBmaWxlcygKK0BAIC00
MTUsNiArNDE0LDEwIEBAIGhiX3N1YnNldF9zb3VyY2VzID0gZmlsZXMoCiAgICAnaGItc3Vic2V0
LmhoJywKICApCiAgCkBAIC0zOSw3ICszOSw3IEBAIGluZGV4IDNkMWMwMGQuLmZkZWQ3MjggMTAw
NjQ0CiAgaGJfc3Vic2V0X2hlYWRlcnMgPSBmaWxlcygKICAgICdoYi1zdWJzZXQuaCcsCiAgICAn
aGItc3Vic2V0LXNlcmlhbGl6ZS5oJwotQEAgLTYxOCw2ICs2MjEsMTIgQEAgZW5kaWYKK0BAIC02
MjksNiArNjMyLDEyIEBAIGVuZGlmCiAgCiAgZGFyd2luX3ZlcnNpb25zID0gW2hiX3ZlcnNpb25f
aW50LCAnQDBALjAuMCcuZm9ybWF0KGhiX3ZlcnNpb25faW50KV0KICAKQEAgLTUyLDcgKzUyLDcg
QEAgaW5kZXggM2QxYzAwZC4uZmRlZDcyOCAxMDA2NDQKICBsaWJoYXJmYnV6eiA9IGxpYnJhcnko
J2hhcmZidXp6JywgaGJfc291cmNlcywKICAgIGluY2x1ZGVfZGlyZWN0b3JpZXM6IGluY2NvbmZp
ZywKICAgIGRlcGVuZGVuY2llczogaGFyZmJ1enpfZGVwcywKLUBAIC02NDUsNyArNjU0LDcgQEAg
ZGVmc19saXN0ICs9IFtoYXJmYnV6el9zdWJzZXRfZGVmXQorQEAgLTY1Niw3ICs2NjUsNyBAQCBk
ZWZzX2xpc3QgKz0gW2hhcmZidXp6X3N1YnNldF9kZWZdCiAgbGliaGFyZmJ1enpfc3Vic2V0ID0g
bGlicmFyeSgnaGFyZmJ1enotc3Vic2V0JywgaGJfc3Vic2V0X3NvdXJjZXMsCiAgICBpbmNsdWRl
X2RpcmVjdG9yaWVzOiBpbmNjb25maWcsCiAgICBkZXBlbmRlbmNpZXM6IFttX2RlcF0sCkBAIC02
MSw3ICs2MSw3IEBAIGluZGV4IDNkMWMwMGQuLmZkZWQ3MjggMTAwNjQ0CiAgICBjcHBfYXJnczog
Y3BwX2FyZ3MgKyBleHRyYV9oYl9jcHBfYXJncywKICAgIHNvdmVyc2lvbjogaGJfc29fdmVyc2lv
biwKICAgIHZlcnNpb246IHZlcnNpb24sCi1AQCAtNjU3LDcgKzY2Niw3IEBAIGxpYmhhcmZidXp6
X3N1YnNldCA9IGxpYnJhcnkoJ2hhcmZidXp6LXN1YnNldCcsIGhiX3N1YnNldF9zb3VyY2VzLAor
QEAgLTY2OCw3ICs2NzcsNyBAQCBsaWJoYXJmYnV6el9zdWJzZXQgPSBsaWJyYXJ5KCdoYXJmYnV6
ei1zdWJzZXQnLCBoYl9zdWJzZXRfc291cmNlcywKICBjdXN0b21fdGFyZ2V0KCdoYXJmYnV6ei1z
dWJzZXQuY2MnLAogICAgYnVpbGRfYnlfZGVmYXVsdDogdHJ1ZSwKICAgIG91dHB1dDogJ2hhcmZi
dXp6LXN1YnNldC5jYycsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1
enovaGFyZmJ1enpfMTEuMi4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hh
cmZidXp6XzExLjIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMTEuMi4wLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMTEuMi4xLmJiCmluZGV4IGRiNWEw
NDQ4NmMuLjcxZWFkYTdmMjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJm
YnV6ei9oYXJmYnV6el8xMS4yLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZi
dXp6L2hhcmZidXp6XzExLjIuMS5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iOTg0MjliOGU4ZTNjMmE2N2NmZWYwMWU5OWU0ODkzZCBc
CiAKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9LyR7QlBOfS0k
e1BWfS50YXIueHoiCiBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1Vc2UtT3MtdG8tY29tcGlsZS1o
Yi1zdWJzZXQtcGxhbi1sYXlvdXQuY2MucGF0Y2giCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTBm
N2QwYTIwODM2N2U2MDZkYmY2ZWVjYzVjZmJlY2MwMWE0N2JlNmVlODM3YWU3YWZmMjc4N2UyNGIw
OWI0NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwOTM3MTRjODU0OGEyODUwOTQ2ODVmMGJkYzk5
OWUyMDJkNjY2YjU5ZWViM2RmMmZmOTIxYWI2OGI4MzM2YTQ5IgogCiBERVBFTkRTICs9ICJnbGli
LTIuMC1uYXRpdmUiCiAKLS0gCjIuNDcuMQoK

--===============1881927744107959678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 84050016 to 84026880 (-0%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz-subset.so.0.61120.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61120.0 /usr/lib/.debug/libharfbuzz.so.0.61120.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61120.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61120.0", added "/usr/lib/.debug/libharfbuzz-icu.so.0.61121.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61121.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61121.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61121.0 /usr/lib/.debug/libharfbuzz.so.0.61121.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu-dev: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu-dev: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61120.0", added "/usr/lib/libharfbuzz-icu.so.0.61121.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61120.0", added "/usr/lib/libharfbuzz-subset.so.0.61121.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1761166 to 1765262 (+0%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61120.0 /usr/lib/libharfbuzz-gobject.so.0.61120.0 /usr/lib/libharfbuzz-cairo.so.0.61120.0", added "/usr/lib/libharfbuzz.so.0.61121.0 /usr/lib/libharfbuzz-gobject.so.0.61121.0 /usr/lib/libharfbuzz-cairo.so.0.61121.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
packages/core2-64-poky-linux/harfbuzz: PV changed from "11.2.0" to "11.2.1"
packages/core2-64-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/11.2.0/harfbuzz-11.2.0.tar.xz file://0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch" to "https://github.com/harfbuzz/harfbuzz/releases//download/11.2.1/harfbuzz-11.2.1.tar.xz file://0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch"
packages/core2-64-poky-linux/harfbuzz: PKGV changed from 11.2.0 [default] to 11.2.1 [default]
Changes to packages/core2-64-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61120.0 to libharfbuzz-cairo.so.0.61121.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61120.0 to libharfbuzz-gobject.so.0.61121.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61120.0 to libharfbuzz-icu.so.0.61121.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61120.0 to libharfbuzz.so.0.61121.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61120.0 to libharfbuzz-subset.so.0.61121.0
  /usr/lib/libharfbuzz-cairo.so.0.61120.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61121.0
  /usr/lib/libharfbuzz-gobject.so.0.61120.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61121.0
  /usr/lib/libharfbuzz-icu.so.0.61120.0 moved to /usr/lib/libharfbuzz-icu.so.0.61121.0
  /usr/lib/libharfbuzz.so.0.61120.0 moved to /usr/lib/libharfbuzz.so.0.61121.0
  /usr/lib/libharfbuzz-subset.so.0.61120.0 moved to /usr/lib/libharfbuzz-subset.so.0.61121.0

--===============1881927744107959678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61120.0", added "/usr/lib/libharfbuzz-icu.so.0.61121.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61120.0", added "/usr/lib/libharfbuzz-subset.so.0.61121.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61120.0 /usr/lib/libharfbuzz.so.0.61120.0 /usr/lib/libharfbuzz-cairo.so.0.61120.0", added "/usr/lib/libharfbuzz-gobject.so.0.61121.0 /usr/lib/libharfbuzz.so.0.61121.0 /usr/lib/libharfbuzz-cairo.so.0.61121.0"
Changes to packages/core2-64-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61120.0 to libharfbuzz-cairo.so.0.61121.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61120.0 to libharfbuzz-gobject.so.0.61121.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61120.0 to libharfbuzz-icu.so.0.61121.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61120.0 to libharfbuzz.so.0.61121.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61120.0 to libharfbuzz-subset.so.0.61121.0
  /usr/lib/libharfbuzz-cairo.so.0.61120.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61121.0
  /usr/lib/libharfbuzz-gobject.so.0.61120.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61121.0
  /usr/lib/libharfbuzz-icu.so.0.61120.0 moved to /usr/lib/libharfbuzz-icu.so.0.61121.0
  /usr/lib/libharfbuzz.so.0.61120.0 moved to /usr/lib/libharfbuzz.so.0.61121.0
  /usr/lib/libharfbuzz-subset.so.0.61120.0 moved to /usr/lib/libharfbuzz-subset.so.0.61121.0

--===============1881927744107959678==--

