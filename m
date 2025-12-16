Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8424DD5E36E
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:51 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17405.1765872153735338759
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iagSe6n/;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Tts1dQN+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019b262ee110-474e12bc-e49d-45c5-a902-1eeb652b6803-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tee6knN5tfKdOerHwP/1lH8cMicYOhvw/mEzMbAO5mQ=;
	b=iagSe6n/ZsExpQKVvawf6rsvpEPc0xGPjOe8EzQLdv8EBGR8/u6fnm79UOvRUnDm
	EZbWb6MaQY12XxwBqq6TLJqwK71j88JfBqwoFHowN7v5h6FI1Mg5HIyE9S29t8ae3Le
	mlzAOcUyVgLa0MreQDfLzOUfu6x8ylqc3vzwzqHI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tee6knN5tfKdOerHwP/1lH8cMicYOhvw/mEzMbAO5mQ=;
	b=Tts1dQN+GWfQw+2ZhLnXEnULD2CX0b8GqiOZ+OxooIMVHRm0yjHSxuChefFWYGMt
	qbB8ldwADGFc56pCK8kgF79aeXdx2Mosc6LdHW1IlZifQg27zOr0KCaRa9XXS0ef5I7
	qV0S+jEMO4Nwm8BwJvVl4f6+ro/N6xiaQA7VDHVU=
Content-Type: multipart/mixed; boundary="===============2767793199978544136=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gst-devtools: upgrading to 1.26.9 SUCCEEDED
Message-ID: <0101019b262ee110-474e12bc-e49d-45c5-a902-1eeb652b6803-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227893

--===============2767793199978544136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gst-devtools* to *1.26.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gst-devtools-upgrade-1.26.7-1.26.9.patch
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
From c2242563fd1c60776c9ecd381784509517716662 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 05:59:20 +0000
Subject: [PATCH] gst-devtools: upgrade 1.26.7 -> 1.26.9

---
 .../0001-connect-has-a-different-signature-on-musl.patch        | 2 +-
 .../{gst-devtools_1.26.7.bb => gst-devtools_1.26.9.bb}          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.26.7.bb => gst-devtools_1.26.9.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index 34fcf6a30a..99b596479d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From 13b0d8e55ad490c8e867c740da2a00eb49319f8e Mon Sep 17 00:00:00 2001
+From f8b1a87eedc3e3824e29d63646650bacee7c4501 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.7.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.9.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.26.7.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.26.9.bb
index dab66c3c9c..44c579f2a4 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.9.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "6912330ecfaf4f4f1329defbe97b9daf92e9aeaf8375e327a0dd30524d79f0a0"
+SRC_URI[sha256sum] = "55c7adaf9eee7a5219d44b736c401a947ebb5d0130c78e900017a6812026b567"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.47.1


--===============2767793199978544136==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-devtools-upgrade-1.26.7-1.26.9.patch"

RnJvbSBjMjI0MjU2M2ZkMWM2MDc3NmM5ZWNkMzgxNzg0NTA5NTE3NzE2NjYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDU6NTk6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3QtZGV2dG9vbHM6IHVwZ3JhZGUgMS4yNi43IC0+IDEuMjYuOQoKLS0tCiAuLi4vMDAwMS1jb25u
ZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRjaCAgICAgICAgfCAyICst
CiAuLi4ve2dzdC1kZXZ0b29sc18xLjI2LjcuYmIgPT4gZ3N0LWRldnRvb2xzXzEuMjYuOS5iYn0g
ICAgICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdC1k
ZXZ0b29sc18xLjI2LjcuYmIgPT4gZ3N0LWRldnRvb2xzXzEuMjYuOS5iYn0gKDk1JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzLzAw
MDEtY29ubmVjdC1oYXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzLzAwMDEtY29ubmVjdC1o
YXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0Y2gKaW5kZXggMzRmY2Y2YTMwYS4u
OTliNTk2NDc5ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdC1kZXZ0b29scy8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1t
dXNsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2
dG9vbHMvMDAwMS1jb25uZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTNiMGQ4ZTU1YWQ0OTBjOGU4NjdjNzQwZGEyYTAwZWI0
OTMxOWY4ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjhiMWE4N2VlZGMzZTM4MjRl
MjlkNjM2NDY2NTBiYWNlZTdjNDUwMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTdW4sIDkgU2VwIDIwMTggMTc6Mzg6
MTAgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gY29ubmVjdCBoYXMgYSBkaWZmZXJlbnQgc2lnbmF0
dXJlIG9uIG11c2wKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3QtZGV2dG9vbHNfMS4yNi43LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdC1kZXZ0b29sc18xLjI2LjkuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29sc18xLjI2Ljcu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9v
bHNfMS4yNi45LmJiCmluZGV4IGRhYjY2YzNjOWMuLjQ0YzU3OWYyYTQgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yNi43LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yNi45
LmJiCkBAIC0xMiw3ICsxMiw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRl
c2t0b3Aub3JnL3NyYy9nc3QtZGV2dG9vbHMvZ3N0LWRldnRvb2xzLSR7UFZ9CiAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1tdXNsLnBh
dGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjkxMjMzMGVjZmFm
NGY0ZjEzMjlkZWZiZTk3YjlkYWY5MmU5YWVhZjgzNzVlMzI3YTBkZDMwNTI0ZDc5ZjBhMCIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICI1NWM3YWRhZjllZWU3YTUyMTlkNDRiNzM2YzQwMWE5NDdlYmI1
ZDAxMzBjNzhlOTAwMDE3YTY4MTIwMjZiNTY3IgogCiBERVBFTkRTID0gImpzb24tZ2xpYiBnbGli
LTIuMCBnbGliLTIuMC1uYXRpdmUgZ3N0cmVhbWVyMS4wIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
c2UiCiBSUkVDT01NRU5EUzoke1BOfSA9ICJnaXQiCi0tIAoyLjQ3LjEKCg==

--===============2767793199978544136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-1.0.so.0.2607.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2607.0", added "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2609.0 /usr/lib/libgstvalidate-1.0.so.0.2609.0"
Changes to packages/x86-64-v3-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2607.0 to libgstvalidate-1.0.so.0.2609.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2607.0 to libgstvalidate-default-overrides-1.0.so.0.2609.0
  /usr/lib/libgstvalidate-1.0.so.0.2607.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2609.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2607.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2609.0

--===============2767793199978544136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: FILELIST: removed "/usr/lib/.debug/libgstvalidate-1.0.so.0.2607.0 /usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2607.0", added "/usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2609.0 /usr/lib/.debug/libgstvalidate-1.0.so.0.2609.0"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dev: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dev: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dev: PKGSIZE changed from 401198 to 401215 (+0%)
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-doc: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-doc: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-locale: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-locale: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-src: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-src: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-src: FILELIST: directory renamed /usr/src/debug/gst-devtools/1.26.7/validate/gst/overrides -> /usr/src/debug/gst-devtools/1.26.9/validate/gst/overrides, directory renamed /usr/src/debug/gst-devtools/1.26.7/validate/gst/validate -> /usr/src/debug/gst-devtools/1.26.9/validate/gst/validate, directory renamed /usr/src/debug/gst-devtools/1.26.7/validate/tools -> /usr/src/debug/gst-devtools/1.26.9/validate/tools, directory renamed /usr/src/debug/gst-devtools/1.26.7/validate/plugins/fault_injection -> /usr/src/debug/gst-devtools/1.26.9/validate/plugins/fault_injection, directory renamed /usr/src/debug/gst-devtools/1.26.7/validate/plugins/gapplication -> /usr/src/debug/gst-devtools/1.26.9/validate/plugins/gapplication, directory renamed /usr/src/debug/gst-devtools/1.26.7/validate/gst/validate/flow -> /usr/src/debug/gst-devtools/1.26.9/validate/gst/validate/flow
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-src: PKGSIZE changed from 1004237 to 1004254 (+0%)
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-staticdev: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-staticdev: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2607.0 /usr/lib/libgstvalidate-1.0.so.0.2607.0", added "/usr/lib/libgstvalidate-1.0.so.0.2609.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2609.0"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: PKGSIZE changed from 1493613 to 1493546 (-0%)
packages/x86-64-v3-poky-linux/gst-devtools: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gst-devtools: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gst-devtools: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.26.7.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch" to "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.26.9.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch"
Changes to packages/x86-64-v3-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2607.0 to libgstvalidate-1.0.so.0.2609.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2607.0 to libgstvalidate-default-overrides-1.0.so.0.2609.0
  /usr/lib/libgstvalidate-1.0.so.0.2607.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2609.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2607.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2609.0

--===============2767793199978544136==--

