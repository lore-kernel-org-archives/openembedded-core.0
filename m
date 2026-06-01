Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8716CD98DC
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:04 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1561.1780328133183049099
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Bv+LR3il;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mOa7EyqI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019e83d3c016-529c7f62-dedc-475a-a94d-2dd1185c2296-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328153;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PXbjkviQHQGS5bl8p20eKG2mxUKrg7GTkXxWmuQ68Qw=;
	b=Bv+LR3ilJOppDrzKGo6sFnJdcM9vWHj7Kg647baTNGRRAFq4IqbanKF/LFAXCIbe
	Q9hC61CxQyHBrRvOr7tOrxERom9B/9alsPL5+C6+DWCReTIZEroQqSbc5eVteMHoqSG
	nZcHCsZ6asAfcWxXs5qhXN3TBpChWB01Fo6MOYwE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328153;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PXbjkviQHQGS5bl8p20eKG2mxUKrg7GTkXxWmuQ68Qw=;
	b=mOa7EyqIOov6Y0qtMJ1W1x7sLygFOTy/PvlRA4hsYczdY6lemzTJe+S7AMicYrV1
	uPCAVQrQD59aFUU31BX+9vN/o5t3mZB6mgzvgPwIgcOKmL4xKakkutOpOfU1BtBV07C
	mmxZmkzTo7TsOaMHvcop9yuyfrACRV0v/jZV7irI=
Content-Type: multipart/mixed; boundary="===============4424332820465872595=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gst-examples: upgrading to 1.28.3 FAILED
Message-ID: <0101019e83d3c016-529c7f62-dedc-475a-a94d-2dd1185c2296-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237940

--===============4424332820465872595==
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
From 184bc52b793df8cb238c6791687996f7a1061fd0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 12:32:35 +0000
Subject: [PATCH] gst-examples: upgrade 1.28.2 -> 1.28.3

---
 ...001-Make-player-examples-installable.patch | 25 +++++++++----------
 ...mples_1.28.2.bb => gst-examples_1.28.3.bb} |  2 +-
 2 files changed, 13 insertions(+), 14 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.28.2.bb => gst-examples_1.28.3.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
index e12ca0b613..c5f05d6f0f 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
@@ -1,4 +1,4 @@
-From 7924016fce2d0b435891a335cdae52fc939c7e3b Mon Sep 17 00:00:00 2001
+From a7ac3d57e85cb234409aa2abbd86750c7875743d Mon Sep 17 00:00:00 2001
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


--===============4424332820465872595==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-examples-upgrade-1.28.2-1.28.3.patch"

RnJvbSAxODRiYzUyYjc5M2RmOGNiMjM4YzY3OTE2ODc5OTZmN2ExMDYxZmQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMjozMjozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dC1leGFtcGxlczogdXBncmFkZSAxLjI4LjIgLT4gMS4yOC4zCgotLS0KIC4uLjAwMS1NYWtlLXBs
YXllci1leGFtcGxlcy1pbnN0YWxsYWJsZS5wYXRjaCB8IDI1ICsrKysrKysrKy0tLS0tLS0tLS0K
IC4uLm1wbGVzXzEuMjguMi5iYiA9PiBnc3QtZXhhbXBsZXNfMS4yOC4zLmJifSB8ICAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0LWV4YW1wbGVzXzEuMjguMi5i
YiA9PiBnc3QtZXhhbXBsZXNfMS4yOC4zLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZXhhbXBsZXMvMDAwMS1NYWtlLXBsYXllci1l
eGFtcGxlcy1pbnN0YWxsYWJsZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3QtZXhhbXBsZXMvMDAwMS1NYWtlLXBsYXllci1leGFtcGxlcy1pbnN0YWxsYWJsZS5w
YXRjaAppbmRleCBlMTJjYTBiNjEzLi5jNWYwNWQ2ZjBmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWV4YW1wbGVzLzAwMDEtTWFrZS1wbGF5ZXItZXhh
bXBsZXMtaW5zdGFsbGFibGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdC1leGFtcGxlcy8wMDAxLU1ha2UtcGxheWVyLWV4YW1wbGVzLWluc3RhbGxhYmxl
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3OTI0MDE2ZmNlMmQwYjQzNTg5MWEzMzVjZGFl
NTJmYzkzOWM3ZTNiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhN2FjM2Q1N2U4NWNi
MjM0NDA5YWEyYWJiZDg2NzUwYzc4NzU3NDNkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogSnVzc2kgS3Vra29uZW4gPGp1c3NpLmt1a2tvbmVuQGludGVsLmNvbT4KIERhdGU6IFRodSwg
MTcgQXVnIDIwMTcgMTE6MDc6MDIgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gTWFrZSBwbGF5ZXIg
ZXhhbXBsZXMgaW5zdGFsbGFibGUKQEAgLTcsMTYgKzcsMTUgQEAgU2lnbmVkLW9mZi1ieTogSnVz
c2kgS3Vra29uZW4gPGp1c3NpLmt1a2tvbmVuQGludGVsLmNvbT4KIFVwc3RyZWFtLVN0YXR1czog
RGVuaWVkIFtVcHN0cmVhbSBjb25zaWRlcnMgdGhlc2UgY29kZSBleGFtcGxlcywgZm9yIG5vdyBh
IGxlYXN0XQogCiBodHRwczovL2J1Z3ppbGxhLmdub21lLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9Nzc3
ODI3Ci0KIC0tLQotIHBsYXliYWNrL3BsYXllci9nc3QtcGxheS9tZXNvbi5idWlsZCB8IDEgKwot
IHBsYXliYWNrL3BsYXllci9ndGsvbWVzb24uYnVpbGQgICAgICB8IDEgKworIHN1YnByb2plY3Rz
L2dzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3N0LXBsYXkvbWVzb24uYnVpbGQgfCAxICsK
KyBzdWJwcm9qZWN0cy9nc3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVyL2d0ay9tZXNvbi5idWls
ZCAgICAgIHwgMSArCiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKIAotSW5kZXg6
IGdzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3N0LXBsYXkvbWVzb24uYnVpbGQKLT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0KLS0tLSBnc3QtZXhhbXBsZXMub3JpZy9wbGF5YmFjay9wbGF5ZXIvZ3N0LXBsYXkvbWVz
b24uYnVpbGQKLSsrKyBnc3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVyL2dzdC1wbGF5L21lc29u
LmJ1aWxkCitkaWZmIC0tZ2l0IGEvc3VicHJvamVjdHMvZ3N0LWV4YW1wbGVzL3BsYXliYWNrL3Bs
YXllci9nc3QtcGxheS9tZXNvbi5idWlsZCBiL3N1YnByb2plY3RzL2dzdC1leGFtcGxlcy9wbGF5
YmFjay9wbGF5ZXIvZ3N0LXBsYXkvbWVzb24uYnVpbGQKK2luZGV4IDVlODBjYThkZDQuLjEyOWU1
YmRjYmUgMTAwNjQ0CistLS0gYS9zdWJwcm9qZWN0cy9nc3QtZXhhbXBsZXMvcGxheWJhY2svcGxh
eWVyL2dzdC1wbGF5L21lc29uLmJ1aWxkCisrKysgYi9zdWJwcm9qZWN0cy9nc3QtZXhhbXBsZXMv
cGxheWJhY2svcGxheWVyL2dzdC1wbGF5L21lc29uLmJ1aWxkCiBAQCAtMiw1ICsyLDYgQEAgZXhl
Y3V0YWJsZSgnZ3N0LXBsYXknLAogICAgICBbJ2dzdC1wbGF5LmMnLAogICAgICAgJ2dzdC1wbGF5
LWtiLmMnLApAQCAtMjQsMTEgKzIzLDExIEBAIEluZGV4OiBnc3QtZXhhbXBsZXMvcGxheWJhY2sv
cGxheWVyL2dzdC1wbGF5L21lc29uLmJ1aWxkCiArICAgIGluc3RhbGw6IHRydWUsCiAgICAgIGRl
cGVuZGVuY2llcyA6IFtnc3RfZGVwLCBkZXBlbmRlbmN5KCdnc3RyZWFtZXItcGxheS0xLjAnKSwg
bV9kZXBdKQogIAotSW5kZXg6IGdzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3RrL21lc29u
LmJ1aWxkCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09Ci0tLS0gZ3N0LWV4YW1wbGVzLm9yaWcvcGxheWJhY2svcGxheWVy
L2d0ay9tZXNvbi5idWlsZAotKysrIGdzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3RrL21l
c29uLmJ1aWxkCi1AQCAtMjAsNSArMjAsNiBAQCBpZiBndGtfZGVwLmZvdW5kKCkKK2RpZmYgLS1n
aXQgYS9zdWJwcm9qZWN0cy9nc3QtZXhhbXBsZXMvcGxheWJhY2svcGxheWVyL2d0ay9tZXNvbi5i
dWlsZCBiL3N1YnByb2plY3RzL2dzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3RrL21lc29u
LmJ1aWxkCitpbmRleCA2ODkyZjE1MjU0Li4yMGQ3NTA1ODc3IDEwMDY0NAorLS0tIGEvc3VicHJv
amVjdHMvZ3N0LWV4YW1wbGVzL3BsYXliYWNrL3BsYXllci9ndGsvbWVzb24uYnVpbGQKKysrKyBi
L3N1YnByb2plY3RzL2dzdC1leGFtcGxlcy9wbGF5YmFjay9wbGF5ZXIvZ3RrL21lc29uLmJ1aWxk
CitAQCAtMjEsNSArMjEsNiBAQCBpZiBndGtfZGVwLmZvdW5kKCkKICAgICAgICAgJ2d0ay12aWRl
by1yZW5kZXJlci5oJywKICAgICAgICAgJ2d0ay12aWRlby1yZW5kZXJlci5jJ10sCiAgICAgICAg
Y19hcmdzIDogIGV4dHJhX2NfYXJncywKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2dzdHJlYW1lci9nc3QtZXhhbXBsZXNfMS4yOC4yLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyL2dzdC1leGFtcGxlc18xLjI4LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5
NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1leGFt
cGxlc18xLjI4LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3QtZXhhbXBsZXNfMS4yOC4zLmJiCmluZGV4IDMwNGQ3MWI2MzcuLjRiZWRiZGVkZDYgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZXhhbXBsZXNf
MS4yOC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZXhh
bXBsZXNfMS4yOC4zLmJiCkBAIC0xMiw3ICsxMiw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9nc3RyZWFtZXIvZ3N0cmVhbWVyLmdpdDtwcm90b2NvbD1odHRwczti
CiAgICAgICAgICAgIGZpbGU6Ly9nc3QtcGxheWVyLmRlc2t0b3AgXAogICAgICAgICAgICAiCiAK
LVNSQ1JFViA9ICI0MzQyMWMyYTViOGFjNWNjZWI1MmIxMTc0OWRmNDAzMDFlMWRlNWMwIgorU1JD
UkVWID0gIjYyZDg5MzZlNzBiMTFhMmUyMWVhM2M2OGI3NjcyYjY3NWUxNDI5NDUiCiAKIFMgPSAi
JHtVTlBBQ0tESVJ9LyR7QlB9L3N1YnByb2plY3RzL2dzdC1leGFtcGxlcyIKIAotLSAKMi40Ny4x
Cgo=

--===============4424332820465872595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-4c17095fab2586e4f17565d8b964fb929914624f"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:4c17095fab2586e4f17565d8b964fb929914624f"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 473 Local 460 Mirrors 0 Missed 13 Current 1368 (97% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 1663 of 1841 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1829 of 1841 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.3.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gst-examples-1.28.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gst-examples-1.28.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3793 of 4227 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.3.bb:do_fetch)
NOTE: Running task 4052 of 4227 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.3.bb:do_write_config)
NOTE: recipe gst-examples-1.28.3-r0: task do_fetch: Started
NOTE: Running task 4171 of 4227 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.3.bb:do_create_recipe_spdx)
NOTE: recipe gst-examples-1.28.3-r0: task do_write_config: Started
NOTE: recipe gst-examples-1.28.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe gst-examples-1.28.3-r0: task do_write_config: Succeeded
NOTE: recipe gst-examples-1.28.3-r0: task do_fetch: Succeeded
NOTE: Running task 4210 of 4227 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.3.bb:do_unpack)
NOTE: Running task 4211 of 4227 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-examples-1.28.3-r0: task do_unpack: Started
NOTE: recipe gst-examples-1.28.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-examples-1.28.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gst-examples-1.28.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gst-examples-1.28.3-r0: task do_unpack: Succeeded
NOTE: Running task 4212 of 4227 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.3.bb:do_patch)
NOTE: recipe gst-examples-1.28.3-r0: task do_patch: Started
NOTE: recipe gst-examples-1.28.3-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 4212 tasks of which 4206 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601123219.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601123219.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.3.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.28.3/temp/log.do_patch.3637704
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: gst-examples-1.28.3-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.28.3/sources/gst-examples-1.28.3/subprojects/gst-examples'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.28.3/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch 0001-Make-player-examples-installable.patch
can't find file to patch at input line 19
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From a7ac3d57e85cb234409aa2abbd86750c7875743d Mon Sep 17 00:00:00 2001
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
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gst-examples/1.28.3/temp/log.do_patch.3637704
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-examples_1.28.3.bb:do_patch) failed with exit code '1'

--===============4424332820465872595==--

