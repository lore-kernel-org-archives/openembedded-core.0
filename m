Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E349CD5BC2
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:50 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34829.1778851231040779576
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LQnMVl3E;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cQttZav1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019e2bcbd8e6-16461988-2f90-403a-8c91-15265730e957-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851240;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xNZBGGPzZdng5WsSJerw1SAmzRka4crEfxGTlPsDBz8=;
	b=LQnMVl3EfEzdKY0TIqCZLNdGZnSkO/MizKtip/UcemRK4pppphSaoHytrRlk73VJ
	aEsuzIdjPkVvmCWmltV0y3cCB1d9R53XILFRieDRfaqMToJ1g7xFoEWw6YaZHN4oeFd
	wpCdyCbnwJbtef0lELSfAtvnm1iSEARzNHth7IBY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851240;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xNZBGGPzZdng5WsSJerw1SAmzRka4crEfxGTlPsDBz8=;
	b=cQttZav17lmcbAGq8zBD9BUVdalVF4rst7t5wJkl/XWIFb/qQKFXbgzlxQR1EQmL
	DmLqhZ0kYee1H28Tut+ExIEW8jOEB1E/7sTIlOI45wHge+VrZxkzUAMMBMUNI0oHWgJ
	MIILINsq2HYPQUCyGwF0q0htTdE2VU8P2a0ypoAQ=
Content-Type: multipart/mixed; boundary="===============4468326156692361109=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gst-examples: upgrading to 1.28.3 FAILED
Message-ID: <0101019e2bcbd8e6-16461988-2f90-403a-8c91-15265730e957-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237154

--===============4468326156692361109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gst-examples* to *1.28.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gst-examples-upgrade-1.28.2-1.28.3.patch
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
From c943aebbff3629a549d43d294b491e43aa0b5bda Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 11:05:48 +0000
Subject: [PATCH] gst-examples: upgrade 1.28.2 -> 1.28.3

---
 ...001-Make-player-examples-installable.patch | 25 +++++++++----------
 ...mples_1.28.2.bb => gst-examples_1.28.3.bb} |  2 +-
 2 files changed, 13 insertions(+), 14 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.28.2.bb => gst-examples_1.28.3.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
index e12ca0b613..034464e591 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
@@ -1,4 +1,4 @@
-From 7924016fce2d0b435891a335cdae52fc939c7e3b Mon Sep 17 00:00:00 2001
+From b27264cd949db14d24b416eabdd0268b211828a4 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Thu, 17 Aug 2017 11:07:02 +0300
 Subject: [PATCH] Make player examples installable
@@ -7,16 +7,15 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Upstream-Status: Denied [Upstream considers these code examples, for now a least]
 
 https://bugzilla.gnome.org/show_bug.cgi?id=777827
-
 ---
- playback/player/gst-play/meson.build | 1 +
- playback/player/gtk/meson.build      | 1 +
+ subprojects/gst-examples/playback/player/gst-play/meson.build | 1 +
+ subprojects/gst-examples/playback/player/gtk/meson.build      | 1 +
  2 files changed, 2 insertions(+)
 
-Index: gst-examples/playback/player/gst-play/meson.build
-===================================================================
---- gst-examples.orig/playback/player/gst-play/meson.build
-+++ gst-examples/playback/player/gst-play/meson.build
+diff --git a/subprojects/gst-examples/playback/player/gst-play/meson.build b/subprojects/gst-examples/playback/player/gst-play/meson.build
+index 5e80ca8dd4..129e5bdcbe 100644
+--- a/subprojects/gst-examples/playback/player/gst-play/meson.build
++++ b/subprojects/gst-examples/playback/player/gst-play/meson.build
 @@ -2,5 +2,6 @@ executable('gst-play',
      ['gst-play.c',
       'gst-play-kb.c',
@@ -24,11 +23,11 @@ Index: gst-examples/playback/player/gst-play/meson.build
 +    install: true,
      dependencies : [gst_dep, dependency('gstreamer-play-1.0'), m_dep])
  
-Index: gst-examples/playback/player/gtk/meson.build
-===================================================================
---- gst-examples.orig/playback/player/gtk/meson.build
-+++ gst-examples/playback/player/gtk/meson.build
-@@ -20,5 +20,6 @@ if gtk_dep.found()
+diff --git a/subprojects/gst-examples/playback/player/gtk/meson.build b/subprojects/gst-examples/playback/player/gtk/meson.build
+index 6892f15254..20d7505877 100644
+--- a/subprojects/gst-examples/playback/player/gtk/meson.build
++++ b/subprojects/gst-examples/playback/player/gtk/meson.build
+@@ -21,5 +21,6 @@ if gtk_dep.found()
         'gtk-video-renderer.h',
         'gtk-video-renderer.c'],
        c_args :  extra_c_args,
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.3.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.28.3.bb
index 304d71b637..4bedbdedd6 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;b
            file://gst-player.desktop \
            "
 
-SRCREV = "43421c2a5b8ac5cceb52b11749df40301e1de5c0"
+SRCREV = "62d8936e70b11a2e21ea3c68b7672b675e142945"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 
-- 
2.47.1


--===============4468326156692361109==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-examples-upgrade-1.28.2-1.28.3.patch"

RnJvbSBjOTQzYWViYmZmMzYyOWE1NDlkNDNkMjk0YjQ5MWU0M2FhMGI1YmRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMTE6MDU6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3QtZXhhbXBsZXM6IHVwZ3JhZGUgMS4yOC4yIC0+IDEuMjguMwoKLS0tCiAuLi4wMDEtTWFrZS1w
bGF5ZXItZXhhbXBsZXMtaW5zdGFsbGFibGUucGF0Y2ggfCAyNSArKysrKysrKystLS0tLS0tLS0t
CiAuLi5tcGxlc18xLjI4LjIuYmIgPT4gZ3N0LWV4YW1wbGVzXzEuMjguMy5iYn0gfCAgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdC1leGFtcGxlc18xLjI4LjIu
YmIgPT4gZ3N0LWV4YW1wbGVzXzEuMjguMy5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWV4YW1wbGVzLzAwMDEtTWFrZS1wbGF5ZXIt
ZXhhbXBsZXMtaW5zdGFsbGFibGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0LWV4YW1wbGVzLzAwMDEtTWFrZS1wbGF5ZXItZXhhbXBsZXMtaW5zdGFsbGFibGUu
cGF0Y2gKaW5kZXggZTEyY2EwYjYxMy4uMDM0NDY0ZTU5MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1leGFtcGxlcy8wMDAxLU1ha2UtcGxheWVyLWV4
YW1wbGVzLWluc3RhbGxhYmxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3QtZXhhbXBsZXMvMDAwMS1NYWtlLXBsYXllci1leGFtcGxlcy1pbnN0YWxsYWJs
ZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzkyNDAxNmZjZTJkMGI0MzU4OTFhMzM1Y2Rh
ZTUyZmM5MzljN2UzYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjI3MjY0Y2Q5NDlk
YjE0ZDI0YjQxNmVhYmRkMDI2OGIyMTE4MjhhNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEp1c3NpIEt1a2tvbmVuIDxqdXNzaS5rdWtrb25lbkBpbnRlbC5jb20+CiBEYXRlOiBUaHUs
IDE3IEF1ZyAyMDE3IDExOjA3OjAyICswMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIE1ha2UgcGxheWVy
IGV4YW1wbGVzIGluc3RhbGxhYmxlCkBAIC03LDE2ICs3LDE1IEBAIFNpZ25lZC1vZmYtYnk6IEp1
c3NpIEt1a2tvbmVuIDxqdXNzaS5rdWtrb25lbkBpbnRlbC5jb20+CiBVcHN0cmVhbS1TdGF0dXM6
IERlbmllZCBbVXBzdHJlYW0gY29uc2lkZXJzIHRoZXNlIGNvZGUgZXhhbXBsZXMsIGZvciBub3cg
YSBsZWFzdF0KIAogaHR0cHM6Ly9idWd6aWxsYS5nbm9tZS5vcmcvc2hvd19idWcuY2dpP2lkPTc3
NzgyNwotCiAtLS0KLSBwbGF5YmFjay9wbGF5ZXIvZ3N0LXBsYXkvbWVzb24uYnVpbGQgfCAxICsK
LSBwbGF5YmFjay9wbGF5ZXIvZ3RrL21lc29uLmJ1aWxkICAgICAgfCAxICsKKyBzdWJwcm9qZWN0
cy9nc3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVyL2dzdC1wbGF5L21lc29uLmJ1aWxkIHwgMSAr
Cisgc3VicHJvamVjdHMvZ3N0LWV4YW1wbGVzL3BsYXliYWNrL3BsYXllci9ndGsvbWVzb24uYnVp
bGQgICAgICB8IDEgKwogIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCiAKLUluZGV4
OiBnc3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVyL2dzdC1wbGF5L21lc29uLmJ1aWxkCi09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09Ci0tLS0gZ3N0LWV4YW1wbGVzLm9yaWcvcGxheWJhY2svcGxheWVyL2dzdC1wbGF5L21l
c29uLmJ1aWxkCi0rKysgZ3N0LWV4YW1wbGVzL3BsYXliYWNrL3BsYXllci9nc3QtcGxheS9tZXNv
bi5idWlsZAorZGlmZiAtLWdpdCBhL3N1YnByb2plY3RzL2dzdC1leGFtcGxlcy9wbGF5YmFjay9w
bGF5ZXIvZ3N0LXBsYXkvbWVzb24uYnVpbGQgYi9zdWJwcm9qZWN0cy9nc3QtZXhhbXBsZXMvcGxh
eWJhY2svcGxheWVyL2dzdC1wbGF5L21lc29uLmJ1aWxkCitpbmRleCA1ZTgwY2E4ZGQ0Li4xMjll
NWJkY2JlIDEwMDY0NAorLS0tIGEvc3VicHJvamVjdHMvZ3N0LWV4YW1wbGVzL3BsYXliYWNrL3Bs
YXllci9nc3QtcGxheS9tZXNvbi5idWlsZAorKysrIGIvc3VicHJvamVjdHMvZ3N0LWV4YW1wbGVz
L3BsYXliYWNrL3BsYXllci9nc3QtcGxheS9tZXNvbi5idWlsZAogQEAgLTIsNSArMiw2IEBAIGV4
ZWN1dGFibGUoJ2dzdC1wbGF5JywKICAgICAgWydnc3QtcGxheS5jJywKICAgICAgICdnc3QtcGxh
eS1rYi5jJywKQEAgLTI0LDExICsyMywxMSBAQCBJbmRleDogZ3N0LWV4YW1wbGVzL3BsYXliYWNr
L3BsYXllci9nc3QtcGxheS9tZXNvbi5idWlsZAogKyAgICBpbnN0YWxsOiB0cnVlLAogICAgICBk
ZXBlbmRlbmNpZXMgOiBbZ3N0X2RlcCwgZGVwZW5kZW5jeSgnZ3N0cmVhbWVyLXBsYXktMS4wJyks
IG1fZGVwXSkKICAKLUluZGV4OiBnc3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVyL2d0ay9tZXNv
bi5idWlsZAotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQotLS0tIGdzdC1leGFtcGxlcy5vcmlnL3BsYXliYWNrL3BsYXll
ci9ndGsvbWVzb24uYnVpbGQKLSsrKyBnc3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVyL2d0ay9t
ZXNvbi5idWlsZAotQEAgLTIwLDUgKzIwLDYgQEAgaWYgZ3RrX2RlcC5mb3VuZCgpCitkaWZmIC0t
Z2l0IGEvc3VicHJvamVjdHMvZ3N0LWV4YW1wbGVzL3BsYXliYWNrL3BsYXllci9ndGsvbWVzb24u
YnVpbGQgYi9zdWJwcm9qZWN0cy9nc3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVyL2d0ay9tZXNv
bi5idWlsZAoraW5kZXggNjg5MmYxNTI1NC4uMjBkNzUwNTg3NyAxMDA2NDQKKy0tLSBhL3N1YnBy
b2plY3RzL2dzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3RrL21lc29uLmJ1aWxkCisrKysg
Yi9zdWJwcm9qZWN0cy9nc3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVyL2d0ay9tZXNvbi5idWls
ZAorQEAgLTIxLDUgKzIxLDYgQEAgaWYgZ3RrX2RlcC5mb3VuZCgpCiAgICAgICAgICdndGstdmlk
ZW8tcmVuZGVyZXIuaCcsCiAgICAgICAgICdndGstdmlkZW8tcmVuZGVyZXIuYyddLAogICAgICAg
IGNfYXJncyA6ICBleHRyYV9jX2FyZ3MsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9nc3RyZWFtZXIvZ3N0LWV4YW1wbGVzXzEuMjguMi5iYiBiL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3QtZXhhbXBsZXNfMS4yOC4zLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZXhh
bXBsZXNfMS4yOC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0LWV4YW1wbGVzXzEuMjguMy5iYgppbmRleCAzMDRkNzFiNjM3Li40YmVkYmRlZGQ2IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWV4YW1wbGVz
XzEuMjguMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWV4
YW1wbGVzXzEuMjguMy5iYgpAQCAtMTIsNyArMTIsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGxh
Yi5mcmVlZGVza3RvcC5vcmcvZ3N0cmVhbWVyL2dzdHJlYW1lci5naXQ7cHJvdG9jb2w9aHR0cHM7
YgogICAgICAgICAgICBmaWxlOi8vZ3N0LXBsYXllci5kZXNrdG9wIFwKICAgICAgICAgICAgIgog
Ci1TUkNSRVYgPSAiNDM0MjFjMmE1YjhhYzVjY2ViNTJiMTE3NDlkZjQwMzAxZTFkZTVjMCIKK1NS
Q1JFViA9ICI2MmQ4OTM2ZTcwYjExYTJlMjFlYTNjNjhiNzY3MmI2NzVlMTQyOTQ1IgogCiBTID0g
IiR7VU5QQUNLRElSfS8ke0JQfS9zdWJwcm9qZWN0cy9nc3QtZXhhbXBsZXMiCiAKLS0gCjIuNDcu
MQoK

--===============4468326156692361109==
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
DISTRO_VERSION       = "6.0.99+snapshot-ee602c8944903dd4f1e6b7e38553efd4d39f14f0"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:ee602c8944903dd4f1e6b7e38553efd4d39f14f0"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 533 Local 519 Mirrors 0 Missed 14 Current 1313 (97% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 1806 of 1846 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3801 of 4239 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.3.bb:do_recipe_qa)
NOTE: Running task 4063 of 4239 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.3.bb:do_write_config)
NOTE: recipe gst-examples-1.28.3-r0: task do_recipe_qa: Started
NOTE: Running task 4182 of 4239 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.3.bb:do_create_recipe_spdx)
NOTE: recipe gst-examples-1.28.3-r0: task do_write_config: Started
NOTE: recipe gst-examples-1.28.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe gst-examples-1.28.3-r0: task do_write_config: Succeeded
NOTE: recipe gst-examples-1.28.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 4221 of 4239 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.3.bb:do_fetch)
NOTE: recipe gst-examples-1.28.3-r0: task do_fetch: Started
NOTE: recipe gst-examples-1.28.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gst-examples-1.28.3-r0: task do_fetch: Succeeded
NOTE: Running task 4222 of 4239 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.3.bb:do_unpack)
NOTE: Running task 4223 of 4239 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-examples-1.28.3-r0: task do_unpack: Started
NOTE: recipe gst-examples-1.28.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-examples-1.28.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gst-examples-1.28.3-r0: task do_unpack: Succeeded
NOTE: Running task 4224 of 4239 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.3.bb:do_patch)
NOTE: recipe gst-examples-1.28.3-r0: task do_patch: Started
NOTE: recipe gst-examples-1.28.3-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 4224 tasks of which 4217 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515110532.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515110532.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.3.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.28.3/temp/log.do_patch.2739448
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: gst-examples-1.28.3-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.28.3/sources/gst-examples-1.28.3/subprojects/gst-examples'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.28.3/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch 0001-Make-player-examples-installable.patch
can't find file to patch at input line 19
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From b27264cd949db14d24b416eabdd0268b211828a4 Mon Sep 17 00:00:00 2001
|From: Jussi Kukkonen <jussi.kukkonen@intel.com>
|Date: Thu, 17 Aug 2017 11:07:02 +0300
|Subject: [PATCH] Make player examples installable
|
|Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
|Upstream-Status: Denied [Upstream considers these code examples, for now a least]
|
|https://bugzilla.gnome.org/show_bug.cgi?id=777827
|---
| subprojects/gst-examples/playback/player/gst-play/meson.build | 1 +
| subprojects/gst-examples/playback/player/gtk/meson.build      | 1 +
| 2 files changed, 2 insertions(+)
|
|diff --git a/subprojects/gst-examples/playback/player/gst-play/meson.build b/subprojects/gst-examples/playback/player/gst-play/meson.build
|index 5e80ca8dd4..129e5bdcbe 100644
|--- a/subprojects/gst-examples/playback/player/gst-play/meson.build
|+++ b/subprojects/gst-examples/playback/player/gst-play/meson.build
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
can't find file to patch at input line 30
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|diff --git a/subprojects/gst-examples/playback/player/gtk/meson.build b/subprojects/gst-examples/playback/player/gtk/meson.build
|index 6892f15254..20d7505877 100644
|--- a/subprojects/gst-examples/playback/player/gtk/meson.build
|+++ b/subprojects/gst-examples/playback/player/gtk/meson.build
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch 0001-Make-player-examples-installable.patch does not apply (enforce with -f)

stderr: ")
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.28.3/temp/log.do_patch.2739448
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.3.bb:do_patch) failed with exit code '1'

--===============4468326156692361109==--

