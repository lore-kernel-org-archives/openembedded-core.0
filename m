Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0829DCCA463
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 05:59:44 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1662.1792216782121356876
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 22:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=mcbPsBo7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=x6NKHXGL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a14871d144-5f7d3bcc-4347-491f-bcbe-39933507f02d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792216781;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=7EmKjmP0oPuYCm8KpZZb5baCWLNeknOU6Vx4iimOJmg=;
	b=mcbPsBo7709pMDDARJArrZLn4c0m9TaNL2E9BVPbKUKK1WmUzo9VtREq/1qNhGFW
	1kIv51m9DKh+obDqDyWe4zEzw17nXgYvof68FtehA6BsZTk8qUEBhTLFKGm7PTblhdM
	l5k12b3F1hnRY+Y2yqsnboNRpaL89BNtxhqso7Fk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792216781;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=7EmKjmP0oPuYCm8KpZZb5baCWLNeknOU6Vx4iimOJmg=;
	b=x6NKHXGLIZPgJA8oSDmQ5ApjzAYGJALkrHX3fnObTsdc2kxGXaKVew1pzMDrErHc
	TKmnfpPrdC2sXXYMR1t9rQv9WKimDVtgAKvLq5HBuBu6tibkAZt2iUS4bqUEg5HaoyH
	/VOU5Vd9rwH2b3w+UIRqTK4BRyaoaKosIu+gdB30=
Content-Type: multipart/mixed; boundary="===============4423960199022506285=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libx11,libxi,libxrender,libxpm,libxtst: upgrading to
 1.8.14,1.8.4,0.9.13,3.5.20,1.2.6 SUCCEEDED
Message-ID: <010101a14871d144-5f7d3bcc-4347-491f-bcbe-39933507f02d-000000@us-west-2.amazonses.com>
Date: Sat, 17 Oct 2026 05:59:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.17-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 05:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248070

--===============4423960199022506285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libx11,libxi,libxrender,libxpm,libxtst* to *1.8.14,1.8.4,0.9.13,3.5.20,1.2.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libx11-libxi-libxrender-libxpm-libxtst-upgrade-1.8.1.patch
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
From 1f62a713036a167df4524fbc0481c2891c11c01e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 17 Oct 2026 05:23:37 +0000
Subject: [PATCH] libx11,libxi,libxrender,libxpm,libxtst: upgrade 1.8.13 ->
 1.8.14,1.8.3 -> 1.8.4,0.9.12 -> 0.9.13,3.5.19 -> 3.5.20,1.2.5 -> 1.2.6

libX11 1.8.14
Revert "XGetSubImage: improve efficiency by reducing number of temporary
allocations"
lcGenConv: bound byteM_parse_codeset() reads to remaining input length
ximcp: bound XIM_REGISTER_TRIGGERKEYS keylist lengths to the packet
ximcp: bound XIM_OPEN_REPLY attribute lengths to the received packet
xkb: Check the keysym range in _XkbReadKeyActions (CVE-2026-88806)
XOpenDisplay: avoid NULL dereference in out-of-memory error path
XSetFontPath: zero-initialize packed font path buffer
_XSend: treat xcb_writev returning 0 as failure
_XSend: discard the output buffer after an I/O error
XkbSetIndicatorMap: avoid undefined behavior due to left shift overflow
nls: Add ca_ES.UTF-8@valencia locale
Xutil.h: add include of Xresource.h
XGetSubImage: improve efficiency by reducing number of temporary allocations
xkb: fix incorrect size check when growing doodads in a section
XlibInt.c: use correct type for Win32 in SocketBytesReadable()
XlibInt.h: prevent Win32 CreateWindow macro from leaking into our code

libXi 1.8.4
XGetDeviceControl: set DEVICE_ENABLE length to the struct size
XGetDeviceControl: size DEVICE_ENABLE replies for XDeviceEnableState
XGetDeviceControl: require reply control to match the request
Set num_classes to number of copied classes in copyDeviceChangedEvent
Track XIValuatorClass correctly during copyDeviceChangedEvent
Track unknown classes correctly during copyDeviceChangedEvent
Add missing touch and gesture class handling to copyDeviceChangedEvent
XListInputDevices: make sure we have enough bytes for the info
Fix potential for class size mismatches
Actually copy the full keycodes in copy_classes
wireToEnterLeave: validate the valuator count to avoid OOB writes
wireToEnterLeave: validate buttons_len against the received event size
XListInputDevices: validate class lengths cumulatively in SizeClassInfo
XListInputDevices: validate device name lengths against reply buffer
XIQueryDevice: keep padded name and class bytes within the reply
size_classes/copy_classes: enforce XI2 per-type class payload sizes
size_classes/copy_classes: bound XI2 class lengths to the received buffer
XQueryDeviceState: check ValuatorClass num_valuators against class length
Strip trailing whitespace from source files

libXrender 0.9.13
Check numSubpixel against numScreens to avoid OOB writes (CVE-2026-88807)
gitlab CI: drop the ci-fairy check-mr job
meson: Add option to build with meson

libXpm 3.5.20
ParsePixels: reject zero-dimension XPM images
Revert "ParsePixels: reject zero-dimension XPM images"
ParsePixels: reject zero-dimension XPM images

libXtst 1.2.6
parse_reply_call_callback: reject zero-progress RECORD reply elements
parse_reply_call_callback: check element size against remaining reply buffer
gitlab CI: drop the ci-fairy check-mr job
---
 meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch       | 2 +-
 .../xorg-lib/{libx11_1.8.13.bb => libx11_1.8.14.bb}             | 2 +-
 .../xorg-lib/{libxi_1.8.3.bb => libxi_1.8.4.bb}                 | 2 +-
 .../xorg-lib/{libxpm_3.5.19.bb => libxpm_3.5.20.bb}             | 2 +-
 .../xorg-lib/{libxrender_0.9.12.bb => libxrender_0.9.13.bb}     | 2 +-
 .../xorg-lib/{libxtst_1.2.5.bb => libxtst_1.2.6.bb}             | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.13.bb => libx11_1.8.14.bb} (92%)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.8.3.bb => libxi_1.8.4.bb} (88%)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.19.bb => libxpm_3.5.20.bb} (88%)
 rename meta/recipes-graphics/xorg-lib/{libxrender_0.9.12.bb => libxrender_0.9.13.bb} (87%)
 rename meta/recipes-graphics/xorg-lib/{libxtst_1.2.5.bb => libxtst_1.2.6.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch b/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
index d2c5f5f142..6d358b1f43 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
@@ -1,4 +1,4 @@
-From 37debe301336cfb61e7f81e9e47e5e1019177d8c Mon Sep 17 00:00:00 2001
+From 26c415e836439d2212cea437e11cfb6396436fbc Mon Sep 17 00:00:00 2001
 From: Marko Lindqvist <cazfi74@gmail.com>
 Date: Tue, 8 Jan 2013 09:16:37 +0200
 Subject: [PATCH] libx11: disable tests
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb
index 42f52f3de2..25fcd6d8b9 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb
@@ -23,7 +23,7 @@ XORG_PN = "libX11"
 
 SRC_URI += "file://disable_tests.patch"
 
-SRC_URI[sha256sum] = "69606f485c2c07c14ef64f75b7bb326d48587af33795d9ab3e607c0b5f94f11c"
+SRC_URI[sha256sum] = "bbc78c46217174655c2b32b138ad119f3ac15f50808b4d0b3a2677a4b1afc950"
 
 inherit gettext
 
diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb b/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb
index 240215379f..fb89e3e526 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb
@@ -18,6 +18,6 @@ PE = "1"
 XORG_PN = "libXi"
 XORG_EXT = "tar.xz"
 
-SRC_URI[sha256sum] = "7ad60056f01af4f786cfe93b3a7707447711626fc8da2637bec71a90409babe5"
+SRC_URI[sha256sum] = "ddd6057b89a91903bc2f884d55c8467440906945e482c36547260dff28661afc"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.20.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.20.bb
index fe465af4fe..16854aa1f3 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.20.bb
@@ -22,6 +22,6 @@ PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
-SRC_URI[sha256sum] = "ad3576d689221a39dc728f0e0dc02ca7bb6a0d724c9a77fd1bfa1e9af83be900"
+SRC_URI[sha256sum] = "c064ead03e4dde78afdeb121fe0b644d25c550444cf903fbdc537f1a78f3ef74"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb b/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb
rename to meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb
index e946d9dd41..667f469e69 100644
--- a/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb
@@ -18,5 +18,5 @@ PE = "1"
 XORG_PN = "libXrender"
 
 BBCLASSEXTEND = "native nativesdk"
-SRC_URI[sha256sum] = "b832128da48b39c8d608224481743403ad1691bf4e554e4be9c174df171d1b97"
+SRC_URI[sha256sum] = "3fe88c609df6782e1e7af2e4de36b2563d70cd70ff7dcb1cda561ad64912bb64"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb b/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb
rename to meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb
index df381b7d65..a59c5c6996 100644
--- a/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb
@@ -15,6 +15,6 @@ PROVIDES = "xtst"
 PE = "1"
 
 XORG_PN = "libXtst"
-SRC_URI[sha256sum] = "b50d4c25b97009a744706c1039c598f4d8e64910c9fde381994e1cae235d9242"
+SRC_URI[sha256sum] = "f94f0b37c07d80d877f3eda2c2405cc7e62aa9842f6310354aa349e3d66a4fe5"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============4423960199022506285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libxi-changelog.txt"

libXi 1.8.4
XGetDeviceControl: set DEVICE_ENABLE length to the struct size
XGetDeviceControl: size DEVICE_ENABLE replies for XDeviceEnableState
XGetDeviceControl: require reply control to match the request
Set num_classes to number of copied classes in copyDeviceChangedEvent
Track XIValuatorClass correctly during copyDeviceChangedEvent
Track unknown classes correctly during copyDeviceChangedEvent
Add missing touch and gesture class handling to copyDeviceChangedEvent
XListInputDevices: make sure we have enough bytes for the info
Fix potential for class size mismatches
Actually copy the full keycodes in copy_classes
wireToEnterLeave: validate the valuator count to avoid OOB writes
wireToEnterLeave: validate buttons_len against the received event size
XListInputDevices: validate class lengths cumulatively in SizeClassInfo
XListInputDevices: validate device name lengths against reply buffer
XIQueryDevice: keep padded name and class bytes within the reply
size_classes/copy_classes: enforce XI2 per-type class payload sizes
size_classes/copy_classes: bound XI2 class lengths to the received buffer
XQueryDeviceState: check ValuatorClass num_valuators against class length
Strip trailing whitespace from source files

--===============4423960199022506285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libxtst/libxtst: PKGSIZE changed from 30848 to 26752 (-13%)

--===============4423960199022506285==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libx11-libxi-libxrender-libxpm-libxtst-upgrade-1.8.1.patch"

RnJvbSAxZjYyYTcxMzAzNmExNjdkZjQ1MjRmYmMwNDgxYzI4OTFjMTFjMDFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTcgT2N0IDIwMjYgMDU6MjM6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4MTEsbGlieGksbGlieHJlbmRlcixsaWJ4cG0sbGlieHRzdDogdXBncmFkZSAxLjguMTMgLT4K
IDEuOC4xNCwxLjguMyAtPiAxLjguNCwwLjkuMTIgLT4gMC45LjEzLDMuNS4xOSAtPiAzLjUuMjAs
MS4yLjUgLT4gMS4yLjYKCmxpYlgxMSAxLjguMTQKUmV2ZXJ0ICJYR2V0U3ViSW1hZ2U6IGltcHJv
dmUgZWZmaWNpZW5jeSBieSByZWR1Y2luZyBudW1iZXIgb2YgdGVtcG9yYXJ5CmFsbG9jYXRpb25z
IgpsY0dlbkNvbnY6IGJvdW5kIGJ5dGVNX3BhcnNlX2NvZGVzZXQoKSByZWFkcyB0byByZW1haW5p
bmcgaW5wdXQgbGVuZ3RoCnhpbWNwOiBib3VuZCBYSU1fUkVHSVNURVJfVFJJR0dFUktFWVMga2V5
bGlzdCBsZW5ndGhzIHRvIHRoZSBwYWNrZXQKeGltY3A6IGJvdW5kIFhJTV9PUEVOX1JFUExZIGF0
dHJpYnV0ZSBsZW5ndGhzIHRvIHRoZSByZWNlaXZlZCBwYWNrZXQKeGtiOiBDaGVjayB0aGUga2V5
c3ltIHJhbmdlIGluIF9Ya2JSZWFkS2V5QWN0aW9ucyAoQ1ZFLTIwMjYtODg4MDYpClhPcGVuRGlz
cGxheTogYXZvaWQgTlVMTCBkZXJlZmVyZW5jZSBpbiBvdXQtb2YtbWVtb3J5IGVycm9yIHBhdGgK
WFNldEZvbnRQYXRoOiB6ZXJvLWluaXRpYWxpemUgcGFja2VkIGZvbnQgcGF0aCBidWZmZXIKX1hT
ZW5kOiB0cmVhdCB4Y2Jfd3JpdGV2IHJldHVybmluZyAwIGFzIGZhaWx1cmUKX1hTZW5kOiBkaXNj
YXJkIHRoZSBvdXRwdXQgYnVmZmVyIGFmdGVyIGFuIEkvTyBlcnJvcgpYa2JTZXRJbmRpY2F0b3JN
YXA6IGF2b2lkIHVuZGVmaW5lZCBiZWhhdmlvciBkdWUgdG8gbGVmdCBzaGlmdCBvdmVyZmxvdwpu
bHM6IEFkZCBjYV9FUy5VVEYtOEB2YWxlbmNpYSBsb2NhbGUKWHV0aWwuaDogYWRkIGluY2x1ZGUg
b2YgWHJlc291cmNlLmgKWEdldFN1YkltYWdlOiBpbXByb3ZlIGVmZmljaWVuY3kgYnkgcmVkdWNp
bmcgbnVtYmVyIG9mIHRlbXBvcmFyeSBhbGxvY2F0aW9ucwp4a2I6IGZpeCBpbmNvcnJlY3Qgc2l6
ZSBjaGVjayB3aGVuIGdyb3dpbmcgZG9vZGFkcyBpbiBhIHNlY3Rpb24KWGxpYkludC5jOiB1c2Ug
Y29ycmVjdCB0eXBlIGZvciBXaW4zMiBpbiBTb2NrZXRCeXRlc1JlYWRhYmxlKCkKWGxpYkludC5o
OiBwcmV2ZW50IFdpbjMyIENyZWF0ZVdpbmRvdyBtYWNybyBmcm9tIGxlYWtpbmcgaW50byBvdXIg
Y29kZQoKbGliWGkgMS44LjQKWEdldERldmljZUNvbnRyb2w6IHNldCBERVZJQ0VfRU5BQkxFIGxl
bmd0aCB0byB0aGUgc3RydWN0IHNpemUKWEdldERldmljZUNvbnRyb2w6IHNpemUgREVWSUNFX0VO
QUJMRSByZXBsaWVzIGZvciBYRGV2aWNlRW5hYmxlU3RhdGUKWEdldERldmljZUNvbnRyb2w6IHJl
cXVpcmUgcmVwbHkgY29udHJvbCB0byBtYXRjaCB0aGUgcmVxdWVzdApTZXQgbnVtX2NsYXNzZXMg
dG8gbnVtYmVyIG9mIGNvcGllZCBjbGFzc2VzIGluIGNvcHlEZXZpY2VDaGFuZ2VkRXZlbnQKVHJh
Y2sgWElWYWx1YXRvckNsYXNzIGNvcnJlY3RseSBkdXJpbmcgY29weURldmljZUNoYW5nZWRFdmVu
dApUcmFjayB1bmtub3duIGNsYXNzZXMgY29ycmVjdGx5IGR1cmluZyBjb3B5RGV2aWNlQ2hhbmdl
ZEV2ZW50CkFkZCBtaXNzaW5nIHRvdWNoIGFuZCBnZXN0dXJlIGNsYXNzIGhhbmRsaW5nIHRvIGNv
cHlEZXZpY2VDaGFuZ2VkRXZlbnQKWExpc3RJbnB1dERldmljZXM6IG1ha2Ugc3VyZSB3ZSBoYXZl
IGVub3VnaCBieXRlcyBmb3IgdGhlIGluZm8KRml4IHBvdGVudGlhbCBmb3IgY2xhc3Mgc2l6ZSBt
aXNtYXRjaGVzCkFjdHVhbGx5IGNvcHkgdGhlIGZ1bGwga2V5Y29kZXMgaW4gY29weV9jbGFzc2Vz
CndpcmVUb0VudGVyTGVhdmU6IHZhbGlkYXRlIHRoZSB2YWx1YXRvciBjb3VudCB0byBhdm9pZCBP
T0Igd3JpdGVzCndpcmVUb0VudGVyTGVhdmU6IHZhbGlkYXRlIGJ1dHRvbnNfbGVuIGFnYWluc3Qg
dGhlIHJlY2VpdmVkIGV2ZW50IHNpemUKWExpc3RJbnB1dERldmljZXM6IHZhbGlkYXRlIGNsYXNz
IGxlbmd0aHMgY3VtdWxhdGl2ZWx5IGluIFNpemVDbGFzc0luZm8KWExpc3RJbnB1dERldmljZXM6
IHZhbGlkYXRlIGRldmljZSBuYW1lIGxlbmd0aHMgYWdhaW5zdCByZXBseSBidWZmZXIKWElRdWVy
eURldmljZToga2VlcCBwYWRkZWQgbmFtZSBhbmQgY2xhc3MgYnl0ZXMgd2l0aGluIHRoZSByZXBs
eQpzaXplX2NsYXNzZXMvY29weV9jbGFzc2VzOiBlbmZvcmNlIFhJMiBwZXItdHlwZSBjbGFzcyBw
YXlsb2FkIHNpemVzCnNpemVfY2xhc3Nlcy9jb3B5X2NsYXNzZXM6IGJvdW5kIFhJMiBjbGFzcyBs
ZW5ndGhzIHRvIHRoZSByZWNlaXZlZCBidWZmZXIKWFF1ZXJ5RGV2aWNlU3RhdGU6IGNoZWNrIFZh
bHVhdG9yQ2xhc3MgbnVtX3ZhbHVhdG9ycyBhZ2FpbnN0IGNsYXNzIGxlbmd0aApTdHJpcCB0cmFp
bGluZyB3aGl0ZXNwYWNlIGZyb20gc291cmNlIGZpbGVzCgpsaWJYcmVuZGVyIDAuOS4xMwpDaGVj
ayBudW1TdWJwaXhlbCBhZ2FpbnN0IG51bVNjcmVlbnMgdG8gYXZvaWQgT09CIHdyaXRlcyAoQ1ZF
LTIwMjYtODg4MDcpCmdpdGxhYiBDSTogZHJvcCB0aGUgY2ktZmFpcnkgY2hlY2stbXIgam9iCm1l
c29uOiBBZGQgb3B0aW9uIHRvIGJ1aWxkIHdpdGggbWVzb24KCmxpYlhwbSAzLjUuMjAKUGFyc2VQ
aXhlbHM6IHJlamVjdCB6ZXJvLWRpbWVuc2lvbiBYUE0gaW1hZ2VzClJldmVydCAiUGFyc2VQaXhl
bHM6IHJlamVjdCB6ZXJvLWRpbWVuc2lvbiBYUE0gaW1hZ2VzIgpQYXJzZVBpeGVsczogcmVqZWN0
IHplcm8tZGltZW5zaW9uIFhQTSBpbWFnZXMKCmxpYlh0c3QgMS4yLjYKcGFyc2VfcmVwbHlfY2Fs
bF9jYWxsYmFjazogcmVqZWN0IHplcm8tcHJvZ3Jlc3MgUkVDT1JEIHJlcGx5IGVsZW1lbnRzCnBh
cnNlX3JlcGx5X2NhbGxfY2FsbGJhY2s6IGNoZWNrIGVsZW1lbnQgc2l6ZSBhZ2FpbnN0IHJlbWFp
bmluZyByZXBseSBidWZmZXIKZ2l0bGFiIENJOiBkcm9wIHRoZSBjaS1mYWlyeSBjaGVjay1tciBq
b2IKLS0tCiBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieDExL2Rpc2FibGVfdGVz
dHMucGF0Y2ggICAgICAgfCAyICstCiAuLi4veG9yZy1saWIve2xpYngxMV8xLjguMTMuYmIgPT4g
bGlieDExXzEuOC4xNC5iYn0gICAgICAgICAgICAgfCAyICstCiAuLi4veG9yZy1saWIve2xpYnhp
XzEuOC4zLmJiID0+IGxpYnhpXzEuOC40LmJifSAgICAgICAgICAgICAgICAgfCAyICstCiAuLi4v
eG9yZy1saWIve2xpYnhwbV8zLjUuMTkuYmIgPT4gbGlieHBtXzMuNS4yMC5iYn0gICAgICAgICAg
ICAgfCAyICstCiAuLi4veG9yZy1saWIve2xpYnhyZW5kZXJfMC45LjEyLmJiID0+IGxpYnhyZW5k
ZXJfMC45LjEzLmJifSAgICAgfCAyICstCiAuLi4veG9yZy1saWIve2xpYnh0c3RfMS4yLjUuYmIg
PT4gbGlieHRzdF8xLjIuNi5iYn0gICAgICAgICAgICAgfCAyICstCiA2IGZpbGVzIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MveG9yZy1saWIve2xpYngxMV8xLjguMTMuYmIgPT4gbGlieDExXzEuOC4xNC5iYn0gKDky
JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIve2xpYnhpXzEuOC4zLmJi
ID0+IGxpYnhpXzEuOC40LmJifSAoODglKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLWxpYi97bGlieHBtXzMuNS4xOS5iYiA9PiBsaWJ4cG1fMy41LjIwLmJifSAoODglKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi97bGlieHJlbmRlcl8wLjkuMTIuYmIg
PT4gbGlieHJlbmRlcl8wLjkuMTMuYmJ9ICg4NyUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmctbGliL3tsaWJ4dHN0XzEuMi41LmJiID0+IGxpYnh0c3RfMS4yLjYuYmJ9ICg4NiUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYngxMS9kaXNh
YmxlX3Rlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYngxMS9k
aXNhYmxlX3Rlc3RzLnBhdGNoCmluZGV4IGQyYzVmNWYxNDIuLjZkMzU4YjFmNDMgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4MTEvZGlzYWJsZV90ZXN0cy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieDExL2Rpc2FibGVf
dGVzdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDM3ZGViZTMwMTMzNmNmYjYxZTdmODFl
OWU0N2U1ZTEwMTkxNzdkOGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDI2YzQxNWU4
MzY0MzlkMjIxMmNlYTQzN2UxMWNmYjYzOTY0MzZmYmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBNYXJrbyBMaW5kcXZpc3QgPGNhemZpNzRAZ21haWwuY29tPgogRGF0ZTogVHVlLCA4
IEphbiAyMDEzIDA5OjE2OjM3ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxpYngxMTogZGlzYWJs
ZSB0ZXN0cwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYngx
MV8xLjguMTMuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieDExXzEuOC4x
NC5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy1saWIvbGlieDExXzEuOC4xMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmctbGliL2xpYngxMV8xLjguMTQuYmIKaW5kZXggNDJmNTJmM2RlMi4uMjVmY2Q2ZDhi
OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYngxMV8xLjgu
MTMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYngxMV8xLjguMTQu
YmIKQEAgLTIzLDcgKzIzLDcgQEAgWE9SR19QTiA9ICJsaWJYMTEiCiAKIFNSQ19VUkkgKz0gImZp
bGU6Ly9kaXNhYmxlX3Rlc3RzLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjk2MDZm
NDg1YzJjMDdjMTRlZjY0Zjc1YjdiYjMyNmQ0ODU4N2FmMzM3OTVkOWFiM2U2MDdjMGI1Zjk0ZjEx
YyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiYmM3OGM0NjIxNzE3NDY1NWMyYjMyYjEzOGFkMTE5
ZjNhYzE1ZjUwODA4YjRkMGIzYTI2NzdhNGIxYWZjOTUwIgogCiBpbmhlcml0IGdldHRleHQKIApk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhpXzEuOC4zLmJi
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhpXzEuOC40LmJiCnNpbWlsYXJp
dHkgaW5kZXggODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9s
aWJ4aV8xLjguMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xp
YnhpXzEuOC40LmJiCmluZGV4IDI0MDIxNTM3OWYuLmZiODllM2U1MjYgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4aV8xLjguMy5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieGlfMS44LjQuYmIKQEAgLTE4LDYgKzE4LDYgQEAg
UEUgPSAiMSIKIFhPUkdfUE4gPSAibGliWGkiCiBYT1JHX0VYVCA9ICJ0YXIueHoiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI3YWQ2MDA1NmYwMWFmNGY3ODZjZmU5M2IzYTc3MDc0NDc3MTE2MjZm
YzhkYTI2MzdiZWM3MWE5MDQwOWJhYmU1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImRkZDYwNTdi
ODlhOTE5MDNiYzJmODg0ZDU1Yzg0Njc0NDA5MDY5NDVlNDgyYzM2NTQ3MjYwZGZmMjg2NjFhZmMi
CiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4cG1fMy41LjE5LmJiIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmctbGliL2xpYnhwbV8zLjUuMjAuYmIKc2ltaWxhcml0eSBpbmRleCA4OCUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhwbV8zLjUuMTku
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4cG1fMy41LjIw
LmJiCmluZGV4IGZlNDY1YWY0ZmUuLjE2ODU0YWExZjMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLWxpYi9saWJ4cG1fMy41LjE5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy94b3JnLWxpYi9saWJ4cG1fMy41LjIwLmJiCkBAIC0yMiw2ICsyMiw2IEBAIFBBQ0tB
R0VTID0rICJzeHBtIGN4cG0iCiBGSUxFUzpjeHBtID0gIiR7YmluZGlyfS9jeHBtIgogRklMRVM6
c3hwbSA9ICIke2JpbmRpcn0vc3hwbSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImFkMzU3NmQ2
ODkyMjFhMzlkYzcyOGYwZTBkYzAyY2E3YmI2YTBkNzI0YzlhNzdmZDFiZmExZTlhZjgzYmU5MDAi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzA2NGVhZDAzZTRkZGU3OGFmZGViMTIxZmUwYjY0NGQy
NWM1NTA0NDRjZjkwM2ZiZGM1MzdmMWE3OGYzZWY3NCIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRp
dmUiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieHJlbmRl
cl8wLjkuMTIuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieHJlbmRlcl8w
LjkuMTMuYmIKc2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3hvcmctbGliL2xpYnhyZW5kZXJfMC45LjEyLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieHJlbmRlcl8wLjkuMTMuYmIKaW5kZXggZTk0NmQ5ZGQ0
MS4uNjY3ZjQ2OWU2OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGli
L2xpYnhyZW5kZXJfMC45LjEyLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxp
Yi9saWJ4cmVuZGVyXzAuOS4xMy5iYgpAQCAtMTgsNSArMTgsNSBAQCBQRSA9ICIxIgogWE9SR19Q
TiA9ICJsaWJYcmVuZGVyIgogCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYjgzMjEyOGRhNDhiMzljOGQ2MDgyMjQ0ODE3NDM0MDNhZDE2
OTFiZjRlNTU0ZTRiZTljMTc0ZGYxNzFkMWI5NyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzZmU4
OGM2MDlkZjY3ODJlMWU3YWYyZTRkZTM2YjI1NjNkNzBjZDcwZmY3ZGNiMWNkYTU2MWFkNjQ5MTJi
YjY0IgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieHRz
dF8xLjIuNS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4dHN0XzEuMi42
LmJiCnNpbWlsYXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLWxpYi9saWJ4dHN0XzEuMi41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy1saWIvbGlieHRzdF8xLjIuNi5iYgppbmRleCBkZjM4MWI3ZDY1Li5hNTljNWM2OTk2
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieHRzdF8xLjIu
NS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieHRzdF8xLjIuNi5i
YgpAQCAtMTUsNiArMTUsNiBAQCBQUk9WSURFUyA9ICJ4dHN0IgogUEUgPSAiMSIKIAogWE9SR19Q
TiA9ICJsaWJYdHN0IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImI1MGQ0YzI1Yjk3MDA5YTc0NDcw
NmMxMDM5YzU5OGY0ZDhlNjQ5MTBjOWZkZTM4MTk5NGUxY2FlMjM1ZDkyNDIiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiZjk0ZjBiMzdjMDdkODBkODc3ZjNlZGEyYzI0MDVjYzdlNjJhYTk4NDJmNjMx
MDM1NGFhMzQ5ZTNkNjZhNGZlNSIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2Rr
IgotLSAKMi40Ny4xCgo=

--===============4423960199022506285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libxpm-changelog.txt"

libXpm 3.5.20
ParsePixels: reject zero-dimension XPM images
Revert "ParsePixels: reject zero-dimension XPM images"
ParsePixels: reject zero-dimension XPM images

--===============4423960199022506285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libx11-changelog.txt"

libX11 1.8.14
Revert "XGetSubImage: improve efficiency by reducing number of temporary
allocations"
lcGenConv: bound byteM_parse_codeset() reads to remaining input length
ximcp: bound XIM_REGISTER_TRIGGERKEYS keylist lengths to the packet
ximcp: bound XIM_OPEN_REPLY attribute lengths to the received packet
xkb: Check the keysym range in _XkbReadKeyActions (CVE-2026-88806)
XOpenDisplay: avoid NULL dereference in out-of-memory error path
XSetFontPath: zero-initialize packed font path buffer
_XSend: treat xcb_writev returning 0 as failure
_XSend: discard the output buffer after an I/O error
XkbSetIndicatorMap: avoid undefined behavior due to left shift overflow
nls: Add ca_ES.UTF-8@valencia locale
Xutil.h: add include of Xresource.h
XGetSubImage: improve efficiency by reducing number of temporary allocations
xkb: fix incorrect size check when growing doodads in a section
XlibInt.c: use correct type for Win32 in SocketBytesReadable()
XlibInt.h: prevent Win32 CreateWindow macro from leaking into our code

--===============4423960199022506285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libxtst-changelog.txt"

libXtst 1.2.6
parse_reply_call_callback: reject zero-progress RECORD reply elements
parse_reply_call_callback: check element size against remaining reply buffer
gitlab CI: drop the ci-fairy check-mr job

--===============4423960199022506285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libx11: PKGV changed from 1.8.13 [default] to 1.8.14 [default]
packages/x86-64-v3-poky-linux/libx11: SRC_URI changed from "https://www.x.org/releases//individual/lib/libX11-1.8.13.tar.xz file://disable_tests.patch" to "https://www.x.org/releases//individual/lib/libX11-1.8.14.tar.xz file://disable_tests.patch"
packages/x86-64-v3-poky-linux/libx11: PV changed from "1.8.13" to "1.8.14"
packages/x86-64-v3-poky-linux/libx11/libx11-dbg: PKGSIZE changed from 12126008 to 12127080 (+0%)
packages/x86-64-v3-poky-linux/libx11/libx11-dbg: PV changed from "1.8.13" to "1.8.14"
packages/x86-64-v3-poky-linux/libx11/libx11-dbg: PKGV changed from 1.8.13 [default] to 1.8.14 [default]
packages/x86-64-v3-poky-linux/libx11/libx11-dev: PKGSIZE changed from 251844 to 251849 (+0%)
packages/x86-64-v3-poky-linux/libx11/libx11-dev: PV changed from "1.8.13" to "1.8.14"
packages/x86-64-v3-poky-linux/libx11/libx11-dev: PKGV changed from 1.8.13 [default] to 1.8.14 [default]
packages/x86-64-v3-poky-linux/libx11/libx11-doc: PV changed from "1.8.13" to "1.8.14"
packages/x86-64-v3-poky-linux/libx11/libx11-doc: PKGV changed from 1.8.13 [default] to 1.8.14 [default]
packages/x86-64-v3-poky-linux/libx11/libx11-locale: PKGSIZE changed from 1106701 to 1106859 (+0%)
packages/x86-64-v3-poky-linux/libx11/libx11-locale: PV changed from "1.8.13" to "1.8.14"
packages/x86-64-v3-poky-linux/libx11/libx11-locale: PKGV changed from 1.8.13 [default] to 1.8.14 [default]
packages/x86-64-v3-poky-linux/libx11/libx11-src: FILELIST: directory renamed /usr/src/debug/libx11/1.8.13/src/xlibi18n/lcUniConv -> /usr/src/debug/libx11/1.8.14/src/xlibi18n/lcUniConv, directory renamed /usr/src/debug/libx11/1.8.13/include/X11/extensions -> /usr/src/debug/libx11/1.8.14/include/X11/extensions, directory renamed /usr/src/debug/libx11/1.8.13/include/X11 -> /usr/src/debug/libx11/1.8.14/include/X11, directory renamed /usr/src/debug/libx11/1.8.13/src/xkb -> /usr/src/debug/libx11/1.8.14/src/xkb, directory renamed /usr/src/debug/libx11/1.8.13/modules/om/generic -> /usr/src/debug/libx11/1.8.14/modules/om/generic, directory renamed /usr/src/debug/libx11/1.8.13/modules/im/ximcp -> /usr/src/debug/libx11/1.8.14/modules/im/ximcp, directory renamed /usr/src/debug/libx11/1.8.13/modules/lc/Utf8 -> /usr/src/debug/libx11/1.8.14/modules/lc/Utf8, directory renamed /usr/src/debug/libx11/1.8.13/src/xcms -> /usr/src/debug/libx11/1.8.14/src/xcms, directory renamed /usr/src/debug/libx11/1.8.1
 3/modules/lc/gen -> /usr/src/debug/libx11/1.8.14/modules/lc/gen, directory renamed /usr/src/debug/libx11/1.8.13/modules/lc/def -> /usr/src/debug/libx11/1.8.14/modules/lc/def, directory renamed /usr/src/debug/libx11/1.8.13/src -> /usr/src/debug/libx11/1.8.14/src, directory renamed /usr/src/debug/libx11/1.8.13/src/xlibi18n -> /usr/src/debug/libx11/1.8.14/src/xlibi18n
packages/x86-64-v3-poky-linux/libx11/libx11-src: PKGSIZE changed from 5453471 to 5455510 (+0%)
packages/x86-64-v3-poky-linux/libx11/libx11-src: PV changed from "1.8.13" to "1.8.14"
packages/x86-64-v3-poky-linux/libx11/libx11-src: PKGV changed from 1.8.13 [default] to 1.8.14 [default]
packages/x86-64-v3-poky-linux/libx11/libx11-staticdev: PV changed from "1.8.13" to "1.8.14"
packages/x86-64-v3-poky-linux/libx11/libx11-staticdev: PKGV changed from 1.8.13 [default] to 1.8.14 [default]
packages/x86-64-v3-poky-linux/libx11/libx11-xcb: PV changed from "1.8.13" to "1.8.14"
packages/x86-64-v3-poky-linux/libx11/libx11-xcb: PKGV changed from 1.8.13 [default] to 1.8.14 [default]
packages/x86-64-v3-poky-linux/libx11/libx11: PV changed from "1.8.13" to "1.8.14"
packages/x86-64-v3-poky-linux/libx11/libx11: PKGV changed from 1.8.13 [default] to 1.8.14 [default]
packages/x86-64-v3-poky-linux/libxi: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/x86-64-v3-poky-linux/libxi: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXi-1.8.3.tar.xz" to "https://www.x.org/releases//individual/lib/libXi-1.8.4.tar.xz"
packages/x86-64-v3-poky-linux/libxi: PV changed from "1.8.3" to "1.8.4"
packages/x86-64-v3-poky-linux/libxi/libxi-dbg: PKGSIZE changed from 1525856 to 1533584 (+1%)
packages/x86-64-v3-poky-linux/libxi/libxi-dbg: PV changed from "1.8.3" to "1.8.4"
packages/x86-64-v3-poky-linux/libxi/libxi-dbg: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/x86-64-v3-poky-linux/libxi/libxi-dev: PKGSIZE changed from 58235 to 58136 (-0%)
packages/x86-64-v3-poky-linux/libxi/libxi-dev: PV changed from "1.8.3" to "1.8.4"
packages/x86-64-v3-poky-linux/libxi/libxi-dev: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/x86-64-v3-poky-linux/libxi/libxi-doc: PKGSIZE changed from 248519 to 248273 (-0%)
packages/x86-64-v3-poky-linux/libxi/libxi-doc: PV changed from "1.8.3" to "1.8.4"
packages/x86-64-v3-poky-linux/libxi/libxi-doc: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/x86-64-v3-poky-linux/libxi/libxi-locale: PV changed from "1.8.3" to "1.8.4"
packages/x86-64-v3-poky-linux/libxi/libxi-locale: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/x86-64-v3-poky-linux/libxi/libxi-src: FILELIST: directory renamed /usr/src/debug/libxi/1.8.3/include/X11/extensions -> /usr/src/debug/libxi/1.8.4/include/X11/extensions, directory renamed /usr/src/debug/libxi/1.8.3/src -> /usr/src/debug/libxi/1.8.4/src
packages/x86-64-v3-poky-linux/libxi/libxi-src: PKGSIZE changed from 383772 to 394925 (+3%)
packages/x86-64-v3-poky-linux/libxi/libxi-src: PV changed from "1.8.3" to "1.8.4"
packages/x86-64-v3-poky-linux/libxi/libxi-src: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/x86-64-v3-poky-linux/libxi/libxi-staticdev: PV changed from "1.8.3" to "1.8.4"
packages/x86-64-v3-poky-linux/libxi/libxi-staticdev: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/x86-64-v3-poky-linux/libxi/libxi: PV changed from "1.8.3" to "1.8.4"
packages/x86-64-v3-poky-linux/libxi/libxi: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/x86-64-v3-poky-linux/libxpm/cxpm: PV changed from "3.5.19" to "3.5.20"
packages/x86-64-v3-poky-linux/libxpm/cxpm: PKGV changed from 3.5.19 [default] to 3.5.20 [default]
packages/x86-64-v3-poky-linux/libxpm: PKGV changed from 3.5.19 [default] to 3.5.20 [default]
packages/x86-64-v3-poky-linux/libxpm: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXpm-3.5.19.tar.xz" to "https://www.x.org/releases//individual/lib/libXpm-3.5.20.tar.xz"
packages/x86-64-v3-poky-linux/libxpm: PV changed from "3.5.19" to "3.5.20"
packages/x86-64-v3-poky-linux/libxpm/libxpm-dbg: PKGSIZE changed from 399520 to 399192 (-0%)
packages/x86-64-v3-poky-linux/libxpm/libxpm-dbg: PV changed from "3.5.19" to "3.5.20"
packages/x86-64-v3-poky-linux/libxpm/libxpm-dbg: PKGV changed from 3.5.19 [default] to 3.5.20 [default]
packages/x86-64-v3-poky-linux/libxpm/libxpm-dev: PV changed from "3.5.19" to "3.5.20"
packages/x86-64-v3-poky-linux/libxpm/libxpm-dev: PKGV changed from 3.5.19 [default] to 3.5.20 [default]
packages/x86-64-v3-poky-linux/libxpm/libxpm-doc: PV changed from "3.5.19" to "3.5.20"
packages/x86-64-v3-poky-linux/libxpm/libxpm-doc: PKGV changed from 3.5.19 [default] to 3.5.20 [default]
packages/x86-64-v3-poky-linux/libxpm/libxpm-locale: PV changed from "3.5.19" to "3.5.20"
packages/x86-64-v3-poky-linux/libxpm/libxpm-locale: PKGV changed from 3.5.19 [default] to 3.5.20 [default]
packages/x86-64-v3-poky-linux/libxpm/libxpm-src: FILELIST: directory renamed /usr/src/debug/libxpm/3.5.19/src -> /usr/src/debug/libxpm/3.5.20/src, directory renamed /usr/src/debug/libxpm/3.5.19/cxpm -> /usr/src/debug/libxpm/3.5.20/cxpm, directory renamed /usr/src/debug/libxpm/3.5.19/include/X11 -> /usr/src/debug/libxpm/3.5.20/include/X11, directory renamed /usr/src/debug/libxpm/3.5.19/sxpm -> /usr/src/debug/libxpm/3.5.20/sxpm
packages/x86-64-v3-poky-linux/libxpm/libxpm-src: PKGSIZE changed from 285905 to 285835 (-0%)
packages/x86-64-v3-poky-linux/libxpm/libxpm-src: PV changed from "3.5.19" to "3.5.20"
packages/x86-64-v3-poky-linux/libxpm/libxpm-src: PKGV changed from 3.5.19 [default] to 3.5.20 [default]
packages/x86-64-v3-poky-linux/libxpm/libxpm-staticdev: PV changed from "3.5.19" to "3.5.20"
packages/x86-64-v3-poky-linux/libxpm/libxpm-staticdev: PKGV changed from 3.5.19 [default] to 3.5.20 [default]
packages/x86-64-v3-poky-linux/libxpm/libxpm: PV changed from "3.5.19" to "3.5.20"
packages/x86-64-v3-poky-linux/libxpm/libxpm: PKGV changed from 3.5.19 [default] to 3.5.20 [default]
packages/x86-64-v3-poky-linux/libxpm/sxpm: PV changed from "3.5.19" to "3.5.20"
packages/x86-64-v3-poky-linux/libxpm/sxpm: PKGV changed from 3.5.19 [default] to 3.5.20 [default]
packages/x86-64-v3-poky-linux/libxrender: PKGV changed from 0.9.12 [default] to 0.9.13 [default]
packages/x86-64-v3-poky-linux/libxrender: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXrender-0.9.12.tar.xz" to "https://www.x.org/releases//individual/lib/libXrender-0.9.13.tar.xz"
packages/x86-64-v3-poky-linux/libxrender: PV changed from "0.9.12" to "0.9.13"
packages/x86-64-v3-poky-linux/libxrender/libxrender-dbg: PKGSIZE changed from 419752 to 419672 (-0%)
packages/x86-64-v3-poky-linux/libxrender/libxrender-dbg: PV changed from "0.9.12" to "0.9.13"
packages/x86-64-v3-poky-linux/libxrender/libxrender-dbg: PKGV changed from 0.9.12 [default] to 0.9.13 [default]
packages/x86-64-v3-poky-linux/libxrender/libxrender-dev: PKGSIZE changed from 34089 to 34124 (+0%)
packages/x86-64-v3-poky-linux/libxrender/libxrender-dev: PV changed from "0.9.12" to "0.9.13"
packages/x86-64-v3-poky-linux/libxrender/libxrender-dev: PKGV changed from 0.9.12 [default] to 0.9.13 [default]
packages/x86-64-v3-poky-linux/libxrender/libxrender-doc: PV changed from "0.9.12" to "0.9.13"
packages/x86-64-v3-poky-linux/libxrender/libxrender-doc: PKGV changed from 0.9.12 [default] to 0.9.13 [default]
packages/x86-64-v3-poky-linux/libxrender/libxrender-locale: PV changed from "0.9.12" to "0.9.13"
packages/x86-64-v3-poky-linux/libxrender/libxrender-locale: PKGV changed from 0.9.12 [default] to 0.9.13 [default]
packages/x86-64-v3-poky-linux/libxrender/libxrender-src: FILELIST: directory renamed /usr/src/debug/libxrender/0.9.12/include/X11/extensions -> /usr/src/debug/libxrender/0.9.13/include/X11/extensions, directory renamed /usr/src/debug/libxrender/0.9.12/src -> /usr/src/debug/libxrender/0.9.13/src
packages/x86-64-v3-poky-linux/libxrender/libxrender-src: PKGSIZE changed from 128891 to 128931 (+0%)
packages/x86-64-v3-poky-linux/libxrender/libxrender-src: PV changed from "0.9.12" to "0.9.13"
packages/x86-64-v3-poky-linux/libxrender/libxrender-src: PKGV changed from 0.9.12 [default] to 0.9.13 [default]
packages/x86-64-v3-poky-linux/libxrender/libxrender-staticdev: PV changed from "0.9.12" to "0.9.13"
packages/x86-64-v3-poky-linux/libxrender/libxrender-staticdev: PKGV changed from 0.9.12 [default] to 0.9.13 [default]
packages/x86-64-v3-poky-linux/libxrender/libxrender: PV changed from "0.9.12" to "0.9.13"
packages/x86-64-v3-poky-linux/libxrender/libxrender: PKGV changed from 0.9.12 [default] to 0.9.13 [default]
packages/x86-64-v3-poky-linux/libxtst: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/libxtst: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXtst-1.2.5.tar.xz" to "https://www.x.org/releases//individual/lib/libXtst-1.2.6.tar.xz"
packages/x86-64-v3-poky-linux/libxtst: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/libxtst/libxtst-dbg: PKGSIZE changed from 110168 to 110448 (+0%)
packages/x86-64-v3-poky-linux/libxtst/libxtst-dbg: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/libxtst/libxtst-dbg: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/libxtst/libxtst-dev: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/libxtst/libxtst-dev: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/libxtst/libxtst-doc: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/libxtst/libxtst-doc: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/libxtst/libxtst-locale: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/libxtst/libxtst-locale: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/libxtst/libxtst-src: FILELIST: directory renamed /usr/src/debug/libxtst/1.2.5/src -> /usr/src/debug/libxtst/1.2.6/src, directory renamed /usr/src/debug/libxtst/1.2.5/include/X11/extensions -> /usr/src/debug/libxtst/1.2.6/include/X11/extensions
packages/x86-64-v3-poky-linux/libxtst/libxtst-src: PKGSIZE changed from 49856 to 50491 (+1%)
packages/x86-64-v3-poky-linux/libxtst/libxtst-src: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/libxtst/libxtst-src: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/libxtst/libxtst-staticdev: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/libxtst/libxtst-staticdev: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/libxtst/libxtst: PKGSIZE changed from 30848 to 26752 (-13%)
packages/x86-64-v3-poky-linux/libxtst/libxtst: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/libxtst/libxtst: PKGV changed from 1.2.5 [default] to 1.2.6 [default]

--===============4423960199022506285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libxrender-changelog.txt"

libXrender 0.9.13
Check numSubpixel against numScreens to avoid OOB writes (CVE-2026-88807)
gitlab CI: drop the ci-fairy check-mr job
meson: Add option to build with meson

--===============4423960199022506285==--

