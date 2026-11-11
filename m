Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3800.1794377113394013615
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 22:05:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=F3ZnsEXD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EWPz4PqJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a1c935dc4a-c20a7392-e54f-4074-9907-764454c00c44-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794377112;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Z1Kiefm97xgigfu6mEbEKhdq7NLrzt1tzmaZcq0H4Nw=;
	b=F3ZnsEXDSbstw/iobnIH0aZalJGWjf3gaYkqiel/GCZBr4yILaueMHShcAzVMvzv
	t+1qxSuzkngJRbg3MU6U+40f0aMGtUrcrLu1PDWjhf1W4wCcaBcmIxnlBQkSqS/waAT
	LEwFF2FwkyXCGQ39MvD8j/G1ejapOImQ3fxgqwTc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794377112;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Z1Kiefm97xgigfu6mEbEKhdq7NLrzt1tzmaZcq0H4Nw=;
	b=EWPz4PqJnkTrqsoMtDZLScc+/jupAhlaQQmV3izY+zaHkVlJucitpFAC24ewwFXG
	AgGfCJn7367FOMxyzQYWRDz1heBwDChZGaCpbMh9WioglolV3JJLRGvO+wHGsARtvbA
	o9HPmseEr69kfrrCuDC1hU8xfTdE4/jvpgUHyoyg=
Content-Type: multipart/mixed; boundary="===============2894926456326513850=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xserver-xorg: upgrading to 21.1.26 SUCCEEDED
Message-ID: <010101a1c935dc4a-c20a7392-e54f-4074-9907-764454c00c44-000000@us-west-2.amazonses.com>
Date: Wed, 11 Nov 2026 06:05:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.11-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249962

--===============2894926456326513850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xserver-xorg* to *21.1.26* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xserver-xorg-upgrade-21.1.24-21.1.26.patch
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
From 2c258665ba26b3231e0cad12fc5c445cca10660b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 11 Nov 2026 05:50:43 +0000
Subject: [PATCH] xserver-xorg: upgrade 21.1.24 -> 21.1.26

xserver 21.1.26
Xv: reject negative image size in QueryImageAttributes
Xv: reject negative image size in PutImage
glamor: prevent overflow in Xv image size calculation
XRes: prevent overflow in resource bytes swap path
XRes: prevent overflow in client ID request size
XTest: validate valuator range before writing
Xv: prevent overflow in shared-memory bounds check
test: cover EDID DS_RANGES overflow of hsync/vrefresh arrays
xfree86: bound EDID DS_RANGES against hsync/vrefresh array size
meson: use the right cpu family name for 32-bit x86 in int10
xkb: fix typo in sizeof expression
Xi: fix event_id & time delta in generated barrier events
Xi: avoid memory leak when hitting bounds check for barrier events
meson: don't build the int10 helpers for the stub backend
Revert "damage: Unlink a damage from the list it was actually inserted on"
xserver 21.1.25
Xi: clean up gesture sprite traces in WindowGone
Xi: add bounds check for barrier events in input_constrain_cursor
dix: remove passive grabs referencing a device on removal
present: unlink notifies from window list in present_clear_window_notifies
glx: validate dataBytes against cmdlen in RenderLarge first request
Xi: validate modifier values in ProcXIPassiveUngrabDevice
randr: fix size and offset in RRChangeProviderProperty PrependMode
xkb: fix CheckKeySyms overwriting request-range symsPerKey entries
xkb: widen size_syms, num_syms, size_acts, num_acts to unsigned int
xkb: allocate names->keys to MAP_LENGTH in XkbAllocNames
xkb: NULL text pointer after free in _CheckSetDoodad error path
glamor: Set `need_free_region` immediately after pixman region allocation
xf86: mark wasset unused in xf86UnblockSIGIO() compatibility wrapper
xkb: Keep the group counts of a loaded keymap in range
xkb: Never recompute a keymap's group count down to zero
xkb: Default to one group whenever a keymap reports none
xkb: Guard XkbAdjustGroup() against a keymap with no groups
damage: Unlink a damage from the list it was actually inserted on
meson: check cpu_family() instead of cpu()
meson: Fix build on FreeBSD/powerpc*
RegionValidate: Fix double free of badreg->data on the error path
Xi: byte-swap XIQueryDevice ScrollClass flags
Xi: byte-swap DeviceChanged valuator and scroll data
meson: only install dri3.h if building dri3 support
Handle -Wimplicit-fallthrough warnings from gcc 16.1
xf86: handle malloc failure in DoSubstitution()
exa: silence -Wold-style-declaration warning from gcc 16
test: silence -Wanalyzer-null-argument warnings in strndup tests
xf86: silence -Wanalyzer-possible-null-dereference warning in parser
xf86: prevent passing NULL pointer as strcat() destination
xf86: prevent passing NULL pointer as strcpy destination
xkb: Fix -Wcalloc-transposed-args warning in _XkbCopyGeom()
enhance: popen-fdopen-error-handling
xorg.conf.man: Fix escape sequence typo
config/udev: guard against NULL subsystem in fallback bus id
xfree86: set GPU screen FB/DGA defaults on runtime hotplug
Fix use-after-free caused by duplicate glyphs in one glyphset
fb: Don't widen the planemask over padding bits when ROOTLESS_SAFEALPHA is set
xquartz/GL: Log failures on the indirect GLX make-current path
modesetting: Check for NULL mode_output before printing warning message
ci: Prevent duplicate pipelines for MRs
gitlab CI: add workflow rules
xquartz: Activate the app via xp_window_activate() in -set_front_process:
---
 ...1-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch | 2 +-
 .../{xserver-xorg_21.1.24.bb => xserver-xorg_21.1.26.bb}        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.24.bb => xserver-xorg_21.1.26.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
index 14831b1a9b..f5d6f18036 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
@@ -1,4 +1,4 @@
-From d387580194e91ad73f896a9669757612c8601c92 Mon Sep 17 00:00:00 2001
+From 459e3d9a30af905896bc9c42a32cd8dc54c4ecf4 Mon Sep 17 00:00:00 2001
 From: California Sullivan <california.l.sullivan@intel.com>
 Date: Fri, 16 Mar 2018 17:23:11 -0700
 Subject: [PATCH] xf86pciBus.c: use Intel ddx only for pre-gen4 hardware
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.26.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.26.bb
index 8d7f9ae14d..d5a0f65640 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.26.bb
@@ -1,7 +1,7 @@
 require xserver-xorg.inc
 
 SRC_URI += " file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch"
-SRC_URI[sha256sum] = "1a4eb36ca65cc3b1b936566d677a9786e13c11cd5806e951ac55f3f5ce3984af"
+SRC_URI[sha256sum] = "c8609f9cdafde14de7ec7cb406dac9507add1d536df8d3c3e3d3d9c1cd864066"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.47.1


--===============2894926456326513850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="xserver-xorg-changelog.txt"

xserver 21.1.26
Xv: reject negative image size in QueryImageAttributes
Xv: reject negative image size in PutImage
glamor: prevent overflow in Xv image size calculation
XRes: prevent overflow in resource bytes swap path
XRes: prevent overflow in client ID request size
XTest: validate valuator range before writing
Xv: prevent overflow in shared-memory bounds check
test: cover EDID DS_RANGES overflow of hsync/vrefresh arrays
xfree86: bound EDID DS_RANGES against hsync/vrefresh array size
meson: use the right cpu family name for 32-bit x86 in int10
xkb: fix typo in sizeof expression
Xi: fix event_id & time delta in generated barrier events
Xi: avoid memory leak when hitting bounds check for barrier events
meson: don't build the int10 helpers for the stub backend
Revert "damage: Unlink a damage from the list it was actually inserted on"
xserver 21.1.25
Xi: clean up gesture sprite traces in WindowGone
Xi: add bounds check for barrier events in input_constrain_cursor
dix: remove passive grabs referencing a device on removal
present: unlink notifies from window list in present_clear_window_notifies
glx: validate dataBytes against cmdlen in RenderLarge first request
Xi: validate modifier values in ProcXIPassiveUngrabDevice
randr: fix size and offset in RRChangeProviderProperty PrependMode
xkb: fix CheckKeySyms overwriting request-range symsPerKey entries
xkb: widen size_syms, num_syms, size_acts, num_acts to unsigned int
xkb: allocate names->keys to MAP_LENGTH in XkbAllocNames
xkb: NULL text pointer after free in _CheckSetDoodad error path
glamor: Set `need_free_region` immediately after pixman region allocation
xf86: mark wasset unused in xf86UnblockSIGIO() compatibility wrapper
xkb: Keep the group counts of a loaded keymap in range
xkb: Never recompute a keymap's group count down to zero
xkb: Default to one group whenever a keymap reports none
xkb: Guard XkbAdjustGroup() against a keymap with no groups
damage: Unlink a damage from the list it was actually inserted on
meson: check cpu_family() instead of cpu()
meson: Fix build on FreeBSD/powerpc*
RegionValidate: Fix double free of badreg->data on the error path
Xi: byte-swap XIQueryDevice ScrollClass flags
Xi: byte-swap DeviceChanged valuator and scroll data
meson: only install dri3.h if building dri3 support
Handle -Wimplicit-fallthrough warnings from gcc 16.1
xf86: handle malloc failure in DoSubstitution()
exa: silence -Wold-style-declaration warning from gcc 16
test: silence -Wanalyzer-null-argument warnings in strndup tests
xf86: silence -Wanalyzer-possible-null-dereference warning in parser
xf86: prevent passing NULL pointer as strcat() destination
xf86: prevent passing NULL pointer as strcpy destination
xkb: Fix -Wcalloc-transposed-args warning in _XkbCopyGeom()
enhance: popen-fdopen-error-handling
xorg.conf.man: Fix escape sequence typo
config/udev: guard against NULL subsystem in fallback bus id
xfree86: set GPU screen FB/DGA defaults on runtime hotplug
Fix use-after-free caused by duplicate glyphs in one glyphset
fb: Don't widen the planemask over padding bits when ROOTLESS_SAFEALPHA is set
xquartz/GL: Log failures on the indirect GLX make-current path
modesetting: Check for NULL mode_output before printing warning message
ci: Prevent duplicate pipelines for MRs
gitlab CI: add workflow rules
xquartz: Activate the app via xp_window_activate() in -set_front_process:

--===============2894926456326513850==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xserver-xorg-upgrade-21.1.24-21.1.26.patch"

RnJvbSAyYzI1ODY2NWJhMjZiMzIzMWUwY2FkMTJmYzVjNDQ1Y2NhMTA2NjBiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTEgTm92IDIwMjYgMDU6NTA6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
c2VydmVyLXhvcmc6IHVwZ3JhZGUgMjEuMS4yNCAtPiAyMS4xLjI2Cgp4c2VydmVyIDIxLjEuMjYK
WHY6IHJlamVjdCBuZWdhdGl2ZSBpbWFnZSBzaXplIGluIFF1ZXJ5SW1hZ2VBdHRyaWJ1dGVzClh2
OiByZWplY3QgbmVnYXRpdmUgaW1hZ2Ugc2l6ZSBpbiBQdXRJbWFnZQpnbGFtb3I6IHByZXZlbnQg
b3ZlcmZsb3cgaW4gWHYgaW1hZ2Ugc2l6ZSBjYWxjdWxhdGlvbgpYUmVzOiBwcmV2ZW50IG92ZXJm
bG93IGluIHJlc291cmNlIGJ5dGVzIHN3YXAgcGF0aApYUmVzOiBwcmV2ZW50IG92ZXJmbG93IGlu
IGNsaWVudCBJRCByZXF1ZXN0IHNpemUKWFRlc3Q6IHZhbGlkYXRlIHZhbHVhdG9yIHJhbmdlIGJl
Zm9yZSB3cml0aW5nClh2OiBwcmV2ZW50IG92ZXJmbG93IGluIHNoYXJlZC1tZW1vcnkgYm91bmRz
IGNoZWNrCnRlc3Q6IGNvdmVyIEVESUQgRFNfUkFOR0VTIG92ZXJmbG93IG9mIGhzeW5jL3ZyZWZy
ZXNoIGFycmF5cwp4ZnJlZTg2OiBib3VuZCBFRElEIERTX1JBTkdFUyBhZ2FpbnN0IGhzeW5jL3Zy
ZWZyZXNoIGFycmF5IHNpemUKbWVzb246IHVzZSB0aGUgcmlnaHQgY3B1IGZhbWlseSBuYW1lIGZv
ciAzMi1iaXQgeDg2IGluIGludDEwCnhrYjogZml4IHR5cG8gaW4gc2l6ZW9mIGV4cHJlc3Npb24K
WGk6IGZpeCBldmVudF9pZCAmIHRpbWUgZGVsdGEgaW4gZ2VuZXJhdGVkIGJhcnJpZXIgZXZlbnRz
ClhpOiBhdm9pZCBtZW1vcnkgbGVhayB3aGVuIGhpdHRpbmcgYm91bmRzIGNoZWNrIGZvciBiYXJy
aWVyIGV2ZW50cwptZXNvbjogZG9uJ3QgYnVpbGQgdGhlIGludDEwIGhlbHBlcnMgZm9yIHRoZSBz
dHViIGJhY2tlbmQKUmV2ZXJ0ICJkYW1hZ2U6IFVubGluayBhIGRhbWFnZSBmcm9tIHRoZSBsaXN0
IGl0IHdhcyBhY3R1YWxseSBpbnNlcnRlZCBvbiIKeHNlcnZlciAyMS4xLjI1ClhpOiBjbGVhbiB1
cCBnZXN0dXJlIHNwcml0ZSB0cmFjZXMgaW4gV2luZG93R29uZQpYaTogYWRkIGJvdW5kcyBjaGVj
ayBmb3IgYmFycmllciBldmVudHMgaW4gaW5wdXRfY29uc3RyYWluX2N1cnNvcgpkaXg6IHJlbW92
ZSBwYXNzaXZlIGdyYWJzIHJlZmVyZW5jaW5nIGEgZGV2aWNlIG9uIHJlbW92YWwKcHJlc2VudDog
dW5saW5rIG5vdGlmaWVzIGZyb20gd2luZG93IGxpc3QgaW4gcHJlc2VudF9jbGVhcl93aW5kb3df
bm90aWZpZXMKZ2x4OiB2YWxpZGF0ZSBkYXRhQnl0ZXMgYWdhaW5zdCBjbWRsZW4gaW4gUmVuZGVy
TGFyZ2UgZmlyc3QgcmVxdWVzdApYaTogdmFsaWRhdGUgbW9kaWZpZXIgdmFsdWVzIGluIFByb2NY
SVBhc3NpdmVVbmdyYWJEZXZpY2UKcmFuZHI6IGZpeCBzaXplIGFuZCBvZmZzZXQgaW4gUlJDaGFu
Z2VQcm92aWRlclByb3BlcnR5IFByZXBlbmRNb2RlCnhrYjogZml4IENoZWNrS2V5U3ltcyBvdmVy
d3JpdGluZyByZXF1ZXN0LXJhbmdlIHN5bXNQZXJLZXkgZW50cmllcwp4a2I6IHdpZGVuIHNpemVf
c3ltcywgbnVtX3N5bXMsIHNpemVfYWN0cywgbnVtX2FjdHMgdG8gdW5zaWduZWQgaW50CnhrYjog
YWxsb2NhdGUgbmFtZXMtPmtleXMgdG8gTUFQX0xFTkdUSCBpbiBYa2JBbGxvY05hbWVzCnhrYjog
TlVMTCB0ZXh0IHBvaW50ZXIgYWZ0ZXIgZnJlZSBpbiBfQ2hlY2tTZXREb29kYWQgZXJyb3IgcGF0
aApnbGFtb3I6IFNldCBgbmVlZF9mcmVlX3JlZ2lvbmAgaW1tZWRpYXRlbHkgYWZ0ZXIgcGl4bWFu
IHJlZ2lvbiBhbGxvY2F0aW9uCnhmODY6IG1hcmsgd2Fzc2V0IHVudXNlZCBpbiB4Zjg2VW5ibG9j
a1NJR0lPKCkgY29tcGF0aWJpbGl0eSB3cmFwcGVyCnhrYjogS2VlcCB0aGUgZ3JvdXAgY291bnRz
IG9mIGEgbG9hZGVkIGtleW1hcCBpbiByYW5nZQp4a2I6IE5ldmVyIHJlY29tcHV0ZSBhIGtleW1h
cCdzIGdyb3VwIGNvdW50IGRvd24gdG8gemVybwp4a2I6IERlZmF1bHQgdG8gb25lIGdyb3VwIHdo
ZW5ldmVyIGEga2V5bWFwIHJlcG9ydHMgbm9uZQp4a2I6IEd1YXJkIFhrYkFkanVzdEdyb3VwKCkg
YWdhaW5zdCBhIGtleW1hcCB3aXRoIG5vIGdyb3VwcwpkYW1hZ2U6IFVubGluayBhIGRhbWFnZSBm
cm9tIHRoZSBsaXN0IGl0IHdhcyBhY3R1YWxseSBpbnNlcnRlZCBvbgptZXNvbjogY2hlY2sgY3B1
X2ZhbWlseSgpIGluc3RlYWQgb2YgY3B1KCkKbWVzb246IEZpeCBidWlsZCBvbiBGcmVlQlNEL3Bv
d2VycGMqClJlZ2lvblZhbGlkYXRlOiBGaXggZG91YmxlIGZyZWUgb2YgYmFkcmVnLT5kYXRhIG9u
IHRoZSBlcnJvciBwYXRoClhpOiBieXRlLXN3YXAgWElRdWVyeURldmljZSBTY3JvbGxDbGFzcyBm
bGFncwpYaTogYnl0ZS1zd2FwIERldmljZUNoYW5nZWQgdmFsdWF0b3IgYW5kIHNjcm9sbCBkYXRh
Cm1lc29uOiBvbmx5IGluc3RhbGwgZHJpMy5oIGlmIGJ1aWxkaW5nIGRyaTMgc3VwcG9ydApIYW5k
bGUgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCB3YXJuaW5ncyBmcm9tIGdjYyAxNi4xCnhmODY6IGhh
bmRsZSBtYWxsb2MgZmFpbHVyZSBpbiBEb1N1YnN0aXR1dGlvbigpCmV4YTogc2lsZW5jZSAtV29s
ZC1zdHlsZS1kZWNsYXJhdGlvbiB3YXJuaW5nIGZyb20gZ2NjIDE2CnRlc3Q6IHNpbGVuY2UgLVdh
bmFseXplci1udWxsLWFyZ3VtZW50IHdhcm5pbmdzIGluIHN0cm5kdXAgdGVzdHMKeGY4Njogc2ls
ZW5jZSAtV2FuYWx5emVyLXBvc3NpYmxlLW51bGwtZGVyZWZlcmVuY2Ugd2FybmluZyBpbiBwYXJz
ZXIKeGY4NjogcHJldmVudCBwYXNzaW5nIE5VTEwgcG9pbnRlciBhcyBzdHJjYXQoKSBkZXN0aW5h
dGlvbgp4Zjg2OiBwcmV2ZW50IHBhc3NpbmcgTlVMTCBwb2ludGVyIGFzIHN0cmNweSBkZXN0aW5h
dGlvbgp4a2I6IEZpeCAtV2NhbGxvYy10cmFuc3Bvc2VkLWFyZ3Mgd2FybmluZyBpbiBfWGtiQ29w
eUdlb20oKQplbmhhbmNlOiBwb3Blbi1mZG9wZW4tZXJyb3ItaGFuZGxpbmcKeG9yZy5jb25mLm1h
bjogRml4IGVzY2FwZSBzZXF1ZW5jZSB0eXBvCmNvbmZpZy91ZGV2OiBndWFyZCBhZ2FpbnN0IE5V
TEwgc3Vic3lzdGVtIGluIGZhbGxiYWNrIGJ1cyBpZAp4ZnJlZTg2OiBzZXQgR1BVIHNjcmVlbiBG
Qi9ER0EgZGVmYXVsdHMgb24gcnVudGltZSBob3RwbHVnCkZpeCB1c2UtYWZ0ZXItZnJlZSBjYXVz
ZWQgYnkgZHVwbGljYXRlIGdseXBocyBpbiBvbmUgZ2x5cGhzZXQKZmI6IERvbid0IHdpZGVuIHRo
ZSBwbGFuZW1hc2sgb3ZlciBwYWRkaW5nIGJpdHMgd2hlbiBST09UTEVTU19TQUZFQUxQSEEgaXMg
c2V0CnhxdWFydHovR0w6IExvZyBmYWlsdXJlcyBvbiB0aGUgaW5kaXJlY3QgR0xYIG1ha2UtY3Vy
cmVudCBwYXRoCm1vZGVzZXR0aW5nOiBDaGVjayBmb3IgTlVMTCBtb2RlX291dHB1dCBiZWZvcmUg
cHJpbnRpbmcgd2FybmluZyBtZXNzYWdlCmNpOiBQcmV2ZW50IGR1cGxpY2F0ZSBwaXBlbGluZXMg
Zm9yIE1ScwpnaXRsYWIgQ0k6IGFkZCB3b3JrZmxvdyBydWxlcwp4cXVhcnR6OiBBY3RpdmF0ZSB0
aGUgYXBwIHZpYSB4cF93aW5kb3dfYWN0aXZhdGUoKSBpbiAtc2V0X2Zyb250X3Byb2Nlc3M6Ci0t
LQogLi4uMS14Zjg2cGNpQnVzLmMtdXNlLUludGVsLWRkeC1vbmx5LWZvci1wcmUtZ2VuNC1oYXJk
d2FyLnBhdGNoIHwgMiArLQogLi4uL3t4c2VydmVyLXhvcmdfMjEuMS4yNC5iYiA9PiB4c2VydmVy
LXhvcmdfMjEuMS4yNi5iYn0gICAgICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hv
cmcteHNlcnZlci97eHNlcnZlci14b3JnXzIxLjEuMjQuYmIgPT4geHNlcnZlci14b3JnXzIxLjEu
MjYuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNl
cnZlci94c2VydmVyLXhvcmcvMDAwMS14Zjg2cGNpQnVzLmMtdXNlLUludGVsLWRkeC1vbmx5LWZv
ci1wcmUtZ2VuNC1oYXJkd2FyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNl
cnZlci94c2VydmVyLXhvcmcvMDAwMS14Zjg2cGNpQnVzLmMtdXNlLUludGVsLWRkeC1vbmx5LWZv
ci1wcmUtZ2VuNC1oYXJkd2FyLnBhdGNoCmluZGV4IDE0ODMxYjFhOWIuLmY1ZDZmMTgwMzYgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3Jn
LzAwMDEteGY4NnBjaUJ1cy5jLXVzZS1JbnRlbC1kZHgtb25seS1mb3ItcHJlLWdlbjQtaGFyZHdh
ci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIt
eG9yZy8wMDAxLXhmODZwY2lCdXMuYy11c2UtSW50ZWwtZGR4LW9ubHktZm9yLXByZS1nZW40LWhh
cmR3YXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQzODc1ODAxOTRlOTFhZDczZjg5NmE5
NjY5NzU3NjEyYzg2MDFjOTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQ1OWUzZDlh
MzBhZjkwNTg5NmJjOWM0MmEzMmNkOGRjNTRjNGVjZjQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBDYWxpZm9ybmlhIFN1bGxpdmFuIDxjYWxpZm9ybmlhLmwuc3VsbGl2YW5AaW50ZWwu
Y29tPgogRGF0ZTogRnJpLCAxNiBNYXIgMjAxOCAxNzoyMzoxMSAtMDcwMAogU3ViamVjdDogW1BB
VENIXSB4Zjg2cGNpQnVzLmM6IHVzZSBJbnRlbCBkZHggb25seSBmb3IgcHJlLWdlbjQgaGFyZHdh
cmUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZl
ci14b3JnXzIxLjEuMjQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hz
ZXJ2ZXIteG9yZ18yMS4xLjI2LmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnXzIxLjEuMjQuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3Jn
XzIxLjEuMjYuYmIKaW5kZXggOGQ3ZjlhZTE0ZC4uZDVhMGY2NTY0MCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmdfMjEuMS4yNC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4x
LjI2LmJiCkBAIC0xLDcgKzEsNyBAQAogcmVxdWlyZSB4c2VydmVyLXhvcmcuaW5jCiAKIFNSQ19V
UkkgKz0gIiBmaWxlOi8vMDAwMS14Zjg2cGNpQnVzLmMtdXNlLUludGVsLWRkeC1vbmx5LWZvci1w
cmUtZ2VuNC1oYXJkd2FyLnBhdGNoIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFhNGViMzZjYTY1
Y2MzYjFiOTM2NTY2ZDY3N2E5Nzg2ZTEzYzExY2Q1ODA2ZTk1MWFjNTVmM2Y1Y2UzOTg0YWYiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYzg2MDlmOWNkYWZkZTE0ZGU3ZWM3Y2I0MDZkYWM5NTA3YWRk
MWQ1MzZkZjhkM2MzZTNkM2Q5YzFjZDg2NDA2NiIKIAogIyBUaGVzZSBleHRlbnNpb25zIGFyZSBu
b3cgaW50ZWdyYXRlZCBpbnRvIHRoZSBzZXJ2ZXIsIHNvIGRlY2xhcmUgdGhlIG1pZ3JhdGlvbgog
IyBwYXRoIGZvciBpbi1wbGFjZSB1cGdyYWRlcy4KLS0gCjIuNDcuMQoK

--===============2894926456326513850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xserver-xorg: SRC_URI changed from "https://www.x.org/releases//individual/xserver/xorg-server-21.1.24.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch" to "https://www.x.org/releases//individual/xserver/xorg-server-21.1.26.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch"
packages/x86-64-v3-poky-linux/xserver-xorg: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xf86-video-modesetting: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xf86-video-modesetting: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGSIZE changed from 18735664 to 18739936 (+0%)
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dbg: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dev: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dev: PKGSIZE changed from 1155696 to 1155719 (+0%)
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dev: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-doc: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-doc: PKGSIZE changed from 132739 to 132740 (+0%)
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-doc: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-record: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-record: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-fbdev: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-fbdev: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-locale: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-locale: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-exa: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-exa: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-sdl: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-sdl: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-src: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-src: FILELIST: directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/modes -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/modes, directory renamed /usr/src/debug/xserver-xorg/21.1.24/include -> /usr/src/debug/xserver-xorg/21.1.26/include, directory renamed /usr/src/debug/xserver-xorg/21.1.24/glx -> /usr/src/debug/xserver-xorg/21.1.26/glx, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/xkb -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/xkb, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/dri -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/dri, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/loader -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/loader, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/exa -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/exa, directory renamed /usr/src/debug/xserver-xorg/21.1.24/present -> /usr/src/debug/xserv
 er-xorg/21.1.26/present, directory renamed /usr/src/debug/xserver-xorg/21.1.24/dbe -> /usr/src/debug/xserver-xorg/21.1.26/dbe, directory renamed /usr/src/debug/xserver-xorg/21.1.24/record -> /usr/src/debug/xserver-xorg/21.1.26/record, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/drivers/inputtest -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/drivers/inputtest, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/dixmods -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/dixmods, directory renamed /usr/src/debug/xserver-xorg/21.1.24/randr -> /usr/src/debug/xserver-xorg/21.1.26/randr, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/os-support/shared -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/os-support/shared, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/os-support/bus -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/os-support/bus, directory renamed /usr/src/debug/xserver-xorg/21.1.24/miext/sync -> /usr/s
 rc/debug/xserver-xorg/21.1.26/miext/sync, directory renamed /usr/src/debug/xserver-xorg/21.1.24/composite -> /usr/src/debug/xserver-xorg/21.1.26/composite, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/common -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/common, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/ramdac -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/ramdac, directory renamed /usr/src/debug/xserver-xorg/21.1.24/os -> /usr/src/debug/xserver-xorg/21.1.26/os, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/utils/gtf -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/utils/gtf, directory renamed /usr/src/debug/xserver-xorg/21.1.24/render -> /usr/src/debug/xserver-xorg/21.1.26/render, directory renamed /usr/src/debug/xserver-xorg/21.1.24/xfixes -> /usr/src/debug/xserver-xorg/21.1.26/xfixes, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/parser -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/parser,
  directory renamed /usr/src/debug/xserver-xorg/21.1.24/mi -> /usr/src/debug/xserver-xorg/21.1.26/mi, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/dri2 -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/dri2, directory renamed /usr/src/debug/xserver-xorg/21.1.24/xkb -> /usr/src/debug/xserver-xorg/21.1.26/xkb, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/os-support/misc -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/os-support/misc, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/int10 -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/int10, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/fbdevhw -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/fbdevhw, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/i2c -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/i2c, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/shadowfb -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/shadowfb, di
 rectory renamed /usr/src/debug/xserver-xorg/21.1.24/config -> /usr/src/debug/xserver-xorg/21.1.26/config, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/os-support -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/os-support, directory renamed /usr/src/debug/xserver-xorg/21.1.24/exa -> /usr/src/debug/xserver-xorg/21.1.26/exa, directory renamed /usr/src/debug/xserver-xorg/21.1.24/glamor -> /usr/src/debug/xserver-xorg/21.1.26/glamor, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/glamor_egl -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/glamor_egl, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/vgahw -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/vgahw, directory renamed /usr/src/debug/xserver-xorg/21.1.24/Xext -> /usr/src/debug/xserver-xorg/21.1.26/Xext, directory renamed /usr/src/debug/xserver-xorg/21.1.24/damageext -> /usr/src/debug/xserver-xorg/21.1.26/damageext, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xf
 ree86/dri2/pci_ids -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/dri2/pci_ids, directory renamed /usr/src/debug/xserver-xorg/21.1.24/fb -> /usr/src/debug/xserver-xorg/21.1.26/fb, directory renamed /usr/src/debug/xserver-xorg/21.1.24/miext/damage -> /usr/src/debug/xserver-xorg/21.1.26/miext/damage, directory renamed /usr/src/debug/xserver-xorg/21.1.24/dri3 -> /usr/src/debug/xserver-xorg/21.1.26/dri3, directory renamed /usr/src/debug/xserver-xorg/21.1.24/Xi -> /usr/src/debug/xserver-xorg/21.1.26/Xi, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/drivers/modesetting -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/drivers/modesetting, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/os-support/linux -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/os-support/linux, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/x86emu/x86emu -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/x86emu/x86emu, directory renamed /usr/src/debug/xserver
 -xorg/21.1.24/miext/shadow -> /usr/src/debug/xserver-xorg/21.1.26/miext/shadow, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/ddc -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/ddc, directory renamed /usr/src/debug/xserver-xorg/21.1.24/dix -> /usr/src/debug/xserver-xorg/21.1.26/dix, directory renamed /usr/src/debug/xserver-xorg/21.1.24/hw/xfree86/x86emu -> /usr/src/debug/xserver-xorg/21.1.26/hw/xfree86/x86emu
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-src: PKGSIZE changed from 11908448 to 11917278 (+0%)
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-src: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-staticdev: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-staticdev: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-utils: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-utils: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xephyr: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xephyr: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xvfb: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xvfb: PV changed from "21.1.24" to "21.1.26"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg: PKGV changed from 21.1.24 [default] to 21.1.26 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg: PV changed from "21.1.24" to "21.1.26"

--===============2894926456326513850==--
