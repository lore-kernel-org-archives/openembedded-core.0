Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1097.1792734602243502856
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 22:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CVrBrVxw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=28DeVGJA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a1674f1f93-0d5cda31-0932-4c02-af42-e3be635acc5a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792734601;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=u5Yh8Z+v8ifpc93mhUXM+oiOLofbcrvf37e4YHTYvpw=;
	b=CVrBrVxw2aY/M8Tmh6pLSqDMvg2Q+0BgWIQjOyJLWR4GAWHUYe0JoC0Oqeq+ijbu
	hq8zg1zWHaLEc1fu+NvNCxB9gRXaUtzVdzTjsI/p1RBAbei2r9/DuT5WYXLoZV66KP8
	nczqcR81NhJjdCHErifSXtpJW2Wnasda6G7C82m8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792734601;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=u5Yh8Z+v8ifpc93mhUXM+oiOLofbcrvf37e4YHTYvpw=;
	b=28DeVGJAlvzcNbzDMZoj5zYbDR6/aw31lLs1alJjeAa4U2uB2Jk+jbWPVh2c1yHI
	ZdZlx/YaI9a69sUseGyHB6Okrk2RGc58KFPEebJAsrRdmSGJYtD6TyxMZZ/h3GOGsA6
	6MSyB40dnHOr03gx/zDiWXflvoRjZnr18rDrIyOU=
Content-Type: multipart/mixed; boundary="===============4853050553193502359=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] usbutils: upgrading to 020 SUCCEEDED
Message-ID: <010101a1674f1f93-0d5cda31-0932-4c02-af42-e3be635acc5a-000000@us-west-2.amazonses.com>
Date: Fri, 23 Oct 2026 05:50:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.23-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 05:50:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248476

--===============4853050553193502359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *usbutils* to *020* has Succeeded.

Next steps:
    - apply the patch: git am 0001-usbutils-upgrade-019-020.patch
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
From 81393e622d2c194d5f293eb21f887f2072b87839 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 23 Oct 2026 05:15:29 +0000
Subject: [PATCH] usbutils: upgrade 019 -> 020

# Copyright (c) 2018-2026 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
usbutils 020
============

Armin Wolf (1):
      lsusb: Add support for FWStatus Capability decoding

Greg Kroah-Hartman (124):
      justfile: add 'make' target
      usb-spec.h: fix up spelling mistake for "Tone Enable" entry
      tests: vendor brat 0.10.1 as the test runner
      tests: compare built lsusb against the installed copy
      tests: lsusb -h: compare built against installed
      tests: lsusb -t: compare built against installed
      tests: lsusb -s: compare built against installed
      tests: lsusb -d: compare built against installed
      tests: lsusb -D: compare built against installed
      tests: usb-devices: compare built against installed
      tests: lsusb.py: compare built against installed
      tests: lsusb.py -h: compare built against installed
      tests: lsusb.py -i: compare built against installed
      tests: lsusb.py -I: compare built against installed
      tests: lsusb.py -u: compare built against installed
      tests: lsusb.py -U: compare built against installed
      tests: lsusb.py -c: compare built against installed
      tests: lsusb.py -C: compare built against installed
      tests: lsusb.py -e: compare built against installed
      tests: lsusb.py -w: compare built against installed
      tests: lsusb.py -f: compare built against installed
      justfile: add 'test' target
      desc-dump: fix operator precedence bug in bit-to-byte conversion
      usbmisc: fix NULL dereference on getcwd() failure in get_absolute_path()
      usbmisc: check malloc() return in get_dev_string_ascii()
      usbmisc: check malloc() return in usb_string_to_native()
      usbmisc: fix unbounded recursion and strncpy issues in
      readlink_recursive()
      names: replace sprintf() with snprintf() for modalias formatting
      lsusb-t: replace sprintf() with snprintf() in lanes_to_str()
      desc-dump: fix NULL pointer dereference for unknown audio terminal types
      desc-dump: fix integer underflow in get_array_entry_count()
      names: fix missing null termination in get_vendor_product_with_fallback()
      sysfs: fix buffer handling in read_sysfs_prop()
      sysfs: check initial snprintf() return value in get_sysfs_name()
      lsusb: fix out-of-bounds array access in dump_encryption_type()
      lsusb: fix out-of-bounds reads in video EXTENSION_UNIT descriptor parsing
      lsusb: fix unaligned memory access in dump_printer_device()
      lsusb: fix out-of-bounds read in video HEADER descriptor parsing
      lsusb: fix out-of-bounds read in HID report descriptor parsing
      lsusb: replace sprintf() with snprintf() in get_guid()
      lsusb: fix out-of-bounds read in MIDI streaming endpoint descriptor
      lsusb: fix out-of-bounds read in STILL_IMAGE_FRAME descriptor parsing
      lsusb-t: fix buffer handling in read_sysfs_file_string()
      lsusb: fix wrong variable in FORMAT_TYPE_II descriptor length calculation
      lsusb: fix out-of-bounds reads in video INPUT_HEADER and OUTPUT_HEADER
      lsusb: fix out-of-bounds reads in video PROCESSING_UNIT descriptor
      lsusb: fix out-of-bounds reads in video terminal and selector descriptors
      lsusb: fix undefined behavior in convert_le_u32() signed shift
      lsusb: fix OOB reads in UAC1 audio FORMAT_TYPE descriptor parsing
      lsusb: fix out-of-bounds read in SuperSpeedPlus capability descriptor
      lsusb: fix OOB reads in audio FORMAT_SPECIFIC descriptor parsing
      lsusb: fix out-of-bounds reads in IPP printer descriptor parsing
      lsusb: add missing length checks in dump_wire_adapter and
      dump_rc_interface
      lsusb: add missing length checks in dump_security and dump_encryption_type
      lsusb: fix OOB read in dump_dfu_interface on short descriptors
      lsusb: add missing length check in dump_association()
      lsusb: fix out-of-bounds reads in dump_hid_device() on short descriptors
      lsusb: fix OOB reads in UAC2 FORMAT_TYPE descriptor parsing
      lsusb: fix OOB reads in MIDI HEADER and MIDI_IN_JACK descriptor parsing
      lsusb: fix OOB read in dump_videocontrol_interrupt_endpoint()
      lsusb: fix OOB reads in video streaming format descriptors
      lsusb: fix OOB reads in video FRAME descriptor parsing
      lsusb: fix remaining OOB read in MIDI_OUT_JACK initial fields
      lsusb: fix remaining OOB reads in video descriptor warn-and-continue paths
      lsusb: fix OOB reads in video INPUT_HEADER and OUTPUT_HEADER data loops
      lsusb: fix OOB read in STILL_IMAGE_FRAME compression pattern loop
      lsusb: fix OOB read in FORMAT_MPEG2TS descriptor on short descriptors
      lsusb: zero hub descriptor buffer to prevent reading uninitialized data
      lsusb: fix OOB read in FORMAT_STREAM_BASED descriptor parsing
      lsusb: fix unsigned integer underflow in dump_bytes calls for short
      descriptors
      lsusb: fix wrong byte printed for CCID bClassEnvelope
      lsusb: bounds-check MIDI ELEMENT bNrInpu

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 meta/recipes-bsp/usbutils/{usbutils_019.bb => usbutils_020.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/usbutils/{usbutils_019.bb => usbutils_020.bb} (94%)

diff --git a/meta/recipes-bsp/usbutils/usbutils_019.bb b/meta/recipes-bsp/usbutils/usbutils_020.bb
similarity index 94%
rename from meta/recipes-bsp/usbutils/usbutils_019.bb
rename to meta/recipes-bsp/usbutils/usbutils_020.bb
index 164445ac4e..7ec808d5a2 100644
--- a/meta/recipes-bsp/usbutils/usbutils_019.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_020.bb
@@ -15,7 +15,7 @@ DEPENDS = "libusb1 virtual/libiconv udev"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
           "
-SRC_URI[sha256sum] = "347c52b65a6aeb22cfe3af8382192004f99725850e1dc5f705336e54cf6d59fc"
+SRC_URI[sha256sum] = "fed292b2a3dce83464ce9e96e7eaf301f58b3bf0104872b6a75edac14c907ff2"
 
 inherit meson pkgconfig update-alternatives
 
-- 
2.47.1


--===============4853050553193502359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/usbutils: PV changed from "019" to "020"
packages/x86-64-v3-poky-linux/usbutils: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/usb/usbutils/usbutils-019.tar.gz" to "https://cdn.kernel.org/pub/linux/utils/usb/usbutils/usbutils-020.tar.gz"
packages/x86-64-v3-poky-linux/usbutils: PKGV changed from 019 [default] to 020 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils-dbg: PV changed from "019" to "020"
packages/x86-64-v3-poky-linux/usbutils/usbutils-dbg: PKGSIZE changed from 452640 to 449440 (-1%)
packages/x86-64-v3-poky-linux/usbutils/usbutils-dbg: PKGV changed from 019 [default] to 020 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils-dev: PV changed from "019" to "020"
packages/x86-64-v3-poky-linux/usbutils/usbutils-dev: PKGV changed from 019 [default] to 020 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils-doc: PV changed from "019" to "020"
packages/x86-64-v3-poky-linux/usbutils/usbutils-doc: PKGV changed from 019 [default] to 020 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils-locale: PV changed from "019" to "020"
packages/x86-64-v3-poky-linux/usbutils/usbutils-locale: PKGV changed from 019 [default] to 020 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils-python: PV changed from "019" to "020"
packages/x86-64-v3-poky-linux/usbutils/usbutils-python: PKGSIZE changed from 14534 to 14594 (+0%)
packages/x86-64-v3-poky-linux/usbutils/usbutils-python: PKGV changed from 019 [default] to 020 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils-src: FILELIST: directory renamed /usr/src/debug/usbutils/019/usbhid-dump -> /usr/src/debug/usbutils/020/usbhid-dump, directory renamed /usr/src/debug/usbutils/019 -> /usr/src/debug/usbutils/020, directory renamed /usr/src/debug/usbutils/019/ccan/list -> /usr/src/debug/usbutils/020/ccan/list
packages/x86-64-v3-poky-linux/usbutils/usbutils-src: PV changed from "019" to "020"
packages/x86-64-v3-poky-linux/usbutils/usbutils-src: PKGSIZE changed from 373749 to 381530 (+2%)
packages/x86-64-v3-poky-linux/usbutils/usbutils-src: PKGV changed from 019 [default] to 020 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils-staticdev: PV changed from "019" to "020"
packages/x86-64-v3-poky-linux/usbutils/usbutils-staticdev: PKGV changed from 019 [default] to 020 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils: PV changed from "019" to "020"
packages/x86-64-v3-poky-linux/usbutils/usbutils: PKGSIZE changed from 283787 to 287917 (+1%)
packages/x86-64-v3-poky-linux/usbutils/usbutils: PKGV changed from 019 [default] to 020 [default]

--===============4853050553193502359==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-usbutils-upgrade-019-020.patch"

RnJvbSA4MTM5M2U2MjJkMmMxOTRkNWYyOTNlYjIxZjg4N2YyMDcyYjg3ODM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjMgT2N0IDIwMjYgMDU6MTU6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
c2J1dGlsczogdXBncmFkZSAwMTkgLT4gMDIwCgojIENvcHlyaWdodCAoYykgMjAxOC0yMDI2IEdy
ZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+CnVzYnV0aWxzIDAy
MAo9PT09PT09PT09PT0KCkFybWluIFdvbGYgKDEpOgogICAgICBsc3VzYjogQWRkIHN1cHBvcnQg
Zm9yIEZXU3RhdHVzIENhcGFiaWxpdHkgZGVjb2RpbmcKCkdyZWcgS3JvYWgtSGFydG1hbiAoMTI0
KToKICAgICAganVzdGZpbGU6IGFkZCAnbWFrZScgdGFyZ2V0CiAgICAgIHVzYi1zcGVjLmg6IGZp
eCB1cCBzcGVsbGluZyBtaXN0YWtlIGZvciAiVG9uZSBFbmFibGUiIGVudHJ5CiAgICAgIHRlc3Rz
OiB2ZW5kb3IgYnJhdCAwLjEwLjEgYXMgdGhlIHRlc3QgcnVubmVyCiAgICAgIHRlc3RzOiBjb21w
YXJlIGJ1aWx0IGxzdXNiIGFnYWluc3QgdGhlIGluc3RhbGxlZCBjb3B5CiAgICAgIHRlc3RzOiBs
c3VzYiAtaDogY29tcGFyZSBidWlsdCBhZ2FpbnN0IGluc3RhbGxlZAogICAgICB0ZXN0czogbHN1
c2IgLXQ6IGNvbXBhcmUgYnVpbHQgYWdhaW5zdCBpbnN0YWxsZWQKICAgICAgdGVzdHM6IGxzdXNi
IC1zOiBjb21wYXJlIGJ1aWx0IGFnYWluc3QgaW5zdGFsbGVkCiAgICAgIHRlc3RzOiBsc3VzYiAt
ZDogY29tcGFyZSBidWlsdCBhZ2FpbnN0IGluc3RhbGxlZAogICAgICB0ZXN0czogbHN1c2IgLUQ6
IGNvbXBhcmUgYnVpbHQgYWdhaW5zdCBpbnN0YWxsZWQKICAgICAgdGVzdHM6IHVzYi1kZXZpY2Vz
OiBjb21wYXJlIGJ1aWx0IGFnYWluc3QgaW5zdGFsbGVkCiAgICAgIHRlc3RzOiBsc3VzYi5weTog
Y29tcGFyZSBidWlsdCBhZ2FpbnN0IGluc3RhbGxlZAogICAgICB0ZXN0czogbHN1c2IucHkgLWg6
IGNvbXBhcmUgYnVpbHQgYWdhaW5zdCBpbnN0YWxsZWQKICAgICAgdGVzdHM6IGxzdXNiLnB5IC1p
OiBjb21wYXJlIGJ1aWx0IGFnYWluc3QgaW5zdGFsbGVkCiAgICAgIHRlc3RzOiBsc3VzYi5weSAt
STogY29tcGFyZSBidWlsdCBhZ2FpbnN0IGluc3RhbGxlZAogICAgICB0ZXN0czogbHN1c2IucHkg
LXU6IGNvbXBhcmUgYnVpbHQgYWdhaW5zdCBpbnN0YWxsZWQKICAgICAgdGVzdHM6IGxzdXNiLnB5
IC1VOiBjb21wYXJlIGJ1aWx0IGFnYWluc3QgaW5zdGFsbGVkCiAgICAgIHRlc3RzOiBsc3VzYi5w
eSAtYzogY29tcGFyZSBidWlsdCBhZ2FpbnN0IGluc3RhbGxlZAogICAgICB0ZXN0czogbHN1c2Iu
cHkgLUM6IGNvbXBhcmUgYnVpbHQgYWdhaW5zdCBpbnN0YWxsZWQKICAgICAgdGVzdHM6IGxzdXNi
LnB5IC1lOiBjb21wYXJlIGJ1aWx0IGFnYWluc3QgaW5zdGFsbGVkCiAgICAgIHRlc3RzOiBsc3Vz
Yi5weSAtdzogY29tcGFyZSBidWlsdCBhZ2FpbnN0IGluc3RhbGxlZAogICAgICB0ZXN0czogbHN1
c2IucHkgLWY6IGNvbXBhcmUgYnVpbHQgYWdhaW5zdCBpbnN0YWxsZWQKICAgICAganVzdGZpbGU6
IGFkZCAndGVzdCcgdGFyZ2V0CiAgICAgIGRlc2MtZHVtcDogZml4IG9wZXJhdG9yIHByZWNlZGVu
Y2UgYnVnIGluIGJpdC10by1ieXRlIGNvbnZlcnNpb24KICAgICAgdXNibWlzYzogZml4IE5VTEwg
ZGVyZWZlcmVuY2Ugb24gZ2V0Y3dkKCkgZmFpbHVyZSBpbiBnZXRfYWJzb2x1dGVfcGF0aCgpCiAg
ICAgIHVzYm1pc2M6IGNoZWNrIG1hbGxvYygpIHJldHVybiBpbiBnZXRfZGV2X3N0cmluZ19hc2Np
aSgpCiAgICAgIHVzYm1pc2M6IGNoZWNrIG1hbGxvYygpIHJldHVybiBpbiB1c2Jfc3RyaW5nX3Rv
X25hdGl2ZSgpCiAgICAgIHVzYm1pc2M6IGZpeCB1bmJvdW5kZWQgcmVjdXJzaW9uIGFuZCBzdHJu
Y3B5IGlzc3VlcyBpbgogICAgICByZWFkbGlua19yZWN1cnNpdmUoKQogICAgICBuYW1lczogcmVw
bGFjZSBzcHJpbnRmKCkgd2l0aCBzbnByaW50ZigpIGZvciBtb2RhbGlhcyBmb3JtYXR0aW5nCiAg
ICAgIGxzdXNiLXQ6IHJlcGxhY2Ugc3ByaW50ZigpIHdpdGggc25wcmludGYoKSBpbiBsYW5lc190
b19zdHIoKQogICAgICBkZXNjLWR1bXA6IGZpeCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgZm9y
IHVua25vd24gYXVkaW8gdGVybWluYWwgdHlwZXMKICAgICAgZGVzYy1kdW1wOiBmaXggaW50ZWdl
ciB1bmRlcmZsb3cgaW4gZ2V0X2FycmF5X2VudHJ5X2NvdW50KCkKICAgICAgbmFtZXM6IGZpeCBt
aXNzaW5nIG51bGwgdGVybWluYXRpb24gaW4gZ2V0X3ZlbmRvcl9wcm9kdWN0X3dpdGhfZmFsbGJh
Y2soKQogICAgICBzeXNmczogZml4IGJ1ZmZlciBoYW5kbGluZyBpbiByZWFkX3N5c2ZzX3Byb3Ao
KQogICAgICBzeXNmczogY2hlY2sgaW5pdGlhbCBzbnByaW50ZigpIHJldHVybiB2YWx1ZSBpbiBn
ZXRfc3lzZnNfbmFtZSgpCiAgICAgIGxzdXNiOiBmaXggb3V0LW9mLWJvdW5kcyBhcnJheSBhY2Nl
c3MgaW4gZHVtcF9lbmNyeXB0aW9uX3R5cGUoKQogICAgICBsc3VzYjogZml4IG91dC1vZi1ib3Vu
ZHMgcmVhZHMgaW4gdmlkZW8gRVhURU5TSU9OX1VOSVQgZGVzY3JpcHRvciBwYXJzaW5nCiAgICAg
IGxzdXNiOiBmaXggdW5hbGlnbmVkIG1lbW9yeSBhY2Nlc3MgaW4gZHVtcF9wcmludGVyX2Rldmlj
ZSgpCiAgICAgIGxzdXNiOiBmaXggb3V0LW9mLWJvdW5kcyByZWFkIGluIHZpZGVvIEhFQURFUiBk
ZXNjcmlwdG9yIHBhcnNpbmcKICAgICAgbHN1c2I6IGZpeCBvdXQtb2YtYm91bmRzIHJlYWQgaW4g
SElEIHJlcG9ydCBkZXNjcmlwdG9yIHBhcnNpbmcKICAgICAgbHN1c2I6IHJlcGxhY2Ugc3ByaW50
ZigpIHdpdGggc25wcmludGYoKSBpbiBnZXRfZ3VpZCgpCiAgICAgIGxzdXNiOiBmaXggb3V0LW9m
LWJvdW5kcyByZWFkIGluIE1JREkgc3RyZWFtaW5nIGVuZHBvaW50IGRlc2NyaXB0b3IKICAgICAg
bHN1c2I6IGZpeCBvdXQtb2YtYm91bmRzIHJlYWQgaW4gU1RJTExfSU1BR0VfRlJBTUUgZGVzY3Jp
cHRvciBwYXJzaW5nCiAgICAgIGxzdXNiLXQ6IGZpeCBidWZmZXIgaGFuZGxpbmcgaW4gcmVhZF9z
eXNmc19maWxlX3N0cmluZygpCiAgICAgIGxzdXNiOiBmaXggd3JvbmcgdmFyaWFibGUgaW4gRk9S
TUFUX1RZUEVfSUkgZGVzY3JpcHRvciBsZW5ndGggY2FsY3VsYXRpb24KICAgICAgbHN1c2I6IGZp
eCBvdXQtb2YtYm91bmRzIHJlYWRzIGluIHZpZGVvIElOUFVUX0hFQURFUiBhbmQgT1VUUFVUX0hF
QURFUgogICAgICBsc3VzYjogZml4IG91dC1vZi1ib3VuZHMgcmVhZHMgaW4gdmlkZW8gUFJPQ0VT
U0lOR19VTklUIGRlc2NyaXB0b3IKICAgICAgbHN1c2I6IGZpeCBvdXQtb2YtYm91bmRzIHJlYWRz
IGluIHZpZGVvIHRlcm1pbmFsIGFuZCBzZWxlY3RvciBkZXNjcmlwdG9ycwogICAgICBsc3VzYjog
Zml4IHVuZGVmaW5lZCBiZWhhdmlvciBpbiBjb252ZXJ0X2xlX3UzMigpIHNpZ25lZCBzaGlmdAog
ICAgICBsc3VzYjogZml4IE9PQiByZWFkcyBpbiBVQUMxIGF1ZGlvIEZPUk1BVF9UWVBFIGRlc2Ny
aXB0b3IgcGFyc2luZwogICAgICBsc3VzYjogZml4IG91dC1vZi1ib3VuZHMgcmVhZCBpbiBTdXBl
clNwZWVkUGx1cyBjYXBhYmlsaXR5IGRlc2NyaXB0b3IKICAgICAgbHN1c2I6IGZpeCBPT0IgcmVh
ZHMgaW4gYXVkaW8gRk9STUFUX1NQRUNJRklDIGRlc2NyaXB0b3IgcGFyc2luZwogICAgICBsc3Vz
YjogZml4IG91dC1vZi1ib3VuZHMgcmVhZHMgaW4gSVBQIHByaW50ZXIgZGVzY3JpcHRvciBwYXJz
aW5nCiAgICAgIGxzdXNiOiBhZGQgbWlzc2luZyBsZW5ndGggY2hlY2tzIGluIGR1bXBfd2lyZV9h
ZGFwdGVyIGFuZAogICAgICBkdW1wX3JjX2ludGVyZmFjZQogICAgICBsc3VzYjogYWRkIG1pc3Np
bmcgbGVuZ3RoIGNoZWNrcyBpbiBkdW1wX3NlY3VyaXR5IGFuZCBkdW1wX2VuY3J5cHRpb25fdHlw
ZQogICAgICBsc3VzYjogZml4IE9PQiByZWFkIGluIGR1bXBfZGZ1X2ludGVyZmFjZSBvbiBzaG9y
dCBkZXNjcmlwdG9ycwogICAgICBsc3VzYjogYWRkIG1pc3NpbmcgbGVuZ3RoIGNoZWNrIGluIGR1
bXBfYXNzb2NpYXRpb24oKQogICAgICBsc3VzYjogZml4IG91dC1vZi1ib3VuZHMgcmVhZHMgaW4g
ZHVtcF9oaWRfZGV2aWNlKCkgb24gc2hvcnQgZGVzY3JpcHRvcnMKICAgICAgbHN1c2I6IGZpeCBP
T0IgcmVhZHMgaW4gVUFDMiBGT1JNQVRfVFlQRSBkZXNjcmlwdG9yIHBhcnNpbmcKICAgICAgbHN1
c2I6IGZpeCBPT0IgcmVhZHMgaW4gTUlESSBIRUFERVIgYW5kIE1JRElfSU5fSkFDSyBkZXNjcmlw
dG9yIHBhcnNpbmcKICAgICAgbHN1c2I6IGZpeCBPT0IgcmVhZCBpbiBkdW1wX3ZpZGVvY29udHJv
bF9pbnRlcnJ1cHRfZW5kcG9pbnQoKQogICAgICBsc3VzYjogZml4IE9PQiByZWFkcyBpbiB2aWRl
byBzdHJlYW1pbmcgZm9ybWF0IGRlc2NyaXB0b3JzCiAgICAgIGxzdXNiOiBmaXggT09CIHJlYWRz
IGluIHZpZGVvIEZSQU1FIGRlc2NyaXB0b3IgcGFyc2luZwogICAgICBsc3VzYjogZml4IHJlbWFp
bmluZyBPT0IgcmVhZCBpbiBNSURJX09VVF9KQUNLIGluaXRpYWwgZmllbGRzCiAgICAgIGxzdXNi
OiBmaXggcmVtYWluaW5nIE9PQiByZWFkcyBpbiB2aWRlbyBkZXNjcmlwdG9yIHdhcm4tYW5kLWNv
bnRpbnVlIHBhdGhzCiAgICAgIGxzdXNiOiBmaXggT09CIHJlYWRzIGluIHZpZGVvIElOUFVUX0hF
QURFUiBhbmQgT1VUUFVUX0hFQURFUiBkYXRhIGxvb3BzCiAgICAgIGxzdXNiOiBmaXggT09CIHJl
YWQgaW4gU1RJTExfSU1BR0VfRlJBTUUgY29tcHJlc3Npb24gcGF0dGVybiBsb29wCiAgICAgIGxz
dXNiOiBmaXggT09CIHJlYWQgaW4gRk9STUFUX01QRUcyVFMgZGVzY3JpcHRvciBvbiBzaG9ydCBk
ZXNjcmlwdG9ycwogICAgICBsc3VzYjogemVybyBodWIgZGVzY3JpcHRvciBidWZmZXIgdG8gcHJl
dmVudCByZWFkaW5nIHVuaW5pdGlhbGl6ZWQgZGF0YQogICAgICBsc3VzYjogZml4IE9PQiByZWFk
IGluIEZPUk1BVF9TVFJFQU1fQkFTRUQgZGVzY3JpcHRvciBwYXJzaW5nCiAgICAgIGxzdXNiOiBm
aXggdW5zaWduZWQgaW50ZWdlciB1bmRlcmZsb3cgaW4gZHVtcF9ieXRlcyBjYWxscyBmb3Igc2hv
cnQKICAgICAgZGVzY3JpcHRvcnMKICAgICAgbHN1c2I6IGZpeCB3cm9uZyBieXRlIHByaW50ZWQg
Zm9yIENDSUQgYkNsYXNzRW52ZWxvcGUKICAgICAgbHN1c2I6IGJvdW5kcy1jaGVjayBNSURJIEVM
RU1FTlQgYk5ySW5wdQoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyA1MDAwIGNo
YXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0YWNobWVu
dCB0byB0aGUgQVVIIGVtYWlsXQotLS0KIG1ldGEvcmVjaXBlcy1ic3AvdXNidXRpbHMve3VzYnV0
aWxzXzAxOS5iYiA9PiB1c2J1dGlsc18wMjAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWJzcC91c2J1
dGlscy97dXNidXRpbHNfMDE5LmJiID0+IHVzYnV0aWxzXzAyMC5iYn0gKDk0JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtYnNwL3VzYnV0aWxzL3VzYnV0aWxzXzAxOS5iYiBiL21ldGEvcmVj
aXBlcy1ic3AvdXNidXRpbHMvdXNidXRpbHNfMDIwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ic3AvdXNidXRpbHMvdXNidXRpbHNfMDE5LmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtYnNwL3VzYnV0aWxzL3VzYnV0aWxzXzAyMC5iYgppbmRleCAxNjQ0
NDVhYzRlLi43ZWM4MDhkNWEyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtYnNwL3VzYnV0aWxz
L3VzYnV0aWxzXzAxOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtYnNwL3VzYnV0aWxzL3VzYnV0aWxz
XzAyMC5iYgpAQCAtMTUsNyArMTUsNyBAQCBERVBFTkRTID0gImxpYnVzYjEgdmlydHVhbC9saWJp
Y29udiB1ZGV2IgogCiBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvdXRpbHMv
dXNiL3VzYnV0aWxzL3VzYnV0aWxzLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIgotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjM0N2M1MmI2NWE2YWViMjJjZmUzYWY4MzgyMTkyMDA0Zjk5NzI1ODUw
ZTFkYzVmNzA1MzM2ZTU0Y2Y2ZDU5ZmMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmVkMjkyYjJh
M2RjZTgzNDY0Y2U5ZTk2ZTdlYWYzMDFmNThiM2JmMDEwNDg3MmI2YTc1ZWRhYzE0YzkwN2ZmMiIK
IAogaW5oZXJpdCBtZXNvbiBwa2djb25maWcgdXBkYXRlLWFsdGVybmF0aXZlcwogCi0tIAoyLjQ3
LjEKCg==

--===============4853050553193502359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="usbutils-changelog.txt"

# Copyright (c) 2018-2026 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
usbutils 020
============

Armin Wolf (1):
      lsusb: Add support for FWStatus Capability decoding

Greg Kroah-Hartman (124):
      justfile: add 'make' target
      usb-spec.h: fix up spelling mistake for "Tone Enable" entry
      tests: vendor brat 0.10.1 as the test runner
      tests: compare built lsusb against the installed copy
      tests: lsusb -h: compare built against installed
      tests: lsusb -t: compare built against installed
      tests: lsusb -s: compare built against installed
      tests: lsusb -d: compare built against installed
      tests: lsusb -D: compare built against installed
      tests: usb-devices: compare built against installed
      tests: lsusb.py: compare built against installed
      tests: lsusb.py -h: compare built against installed
      tests: lsusb.py -i: compare built against installed
      tests: lsusb.py -I: compare built against installed
      tests: lsusb.py -u: compare built against installed
      tests: lsusb.py -U: compare built against installed
      tests: lsusb.py -c: compare built against installed
      tests: lsusb.py -C: compare built against installed
      tests: lsusb.py -e: compare built against installed
      tests: lsusb.py -w: compare built against installed
      tests: lsusb.py -f: compare built against installed
      justfile: add 'test' target
      desc-dump: fix operator precedence bug in bit-to-byte conversion
      usbmisc: fix NULL dereference on getcwd() failure in get_absolute_path()
      usbmisc: check malloc() return in get_dev_string_ascii()
      usbmisc: check malloc() return in usb_string_to_native()
      usbmisc: fix unbounded recursion and strncpy issues in
      readlink_recursive()
      names: replace sprintf() with snprintf() for modalias formatting
      lsusb-t: replace sprintf() with snprintf() in lanes_to_str()
      desc-dump: fix NULL pointer dereference for unknown audio terminal types
      desc-dump: fix integer underflow in get_array_entry_count()
      names: fix missing null termination in get_vendor_product_with_fallback()
      sysfs: fix buffer handling in read_sysfs_prop()
      sysfs: check initial snprintf() return value in get_sysfs_name()
      lsusb: fix out-of-bounds array access in dump_encryption_type()
      lsusb: fix out-of-bounds reads in video EXTENSION_UNIT descriptor parsing
      lsusb: fix unaligned memory access in dump_printer_device()
      lsusb: fix out-of-bounds read in video HEADER descriptor parsing
      lsusb: fix out-of-bounds read in HID report descriptor parsing
      lsusb: replace sprintf() with snprintf() in get_guid()
      lsusb: fix out-of-bounds read in MIDI streaming endpoint descriptor
      lsusb: fix out-of-bounds read in STILL_IMAGE_FRAME descriptor parsing
      lsusb-t: fix buffer handling in read_sysfs_file_string()
      lsusb: fix wrong variable in FORMAT_TYPE_II descriptor length calculation
      lsusb: fix out-of-bounds reads in video INPUT_HEADER and OUTPUT_HEADER
      lsusb: fix out-of-bounds reads in video PROCESSING_UNIT descriptor
      lsusb: fix out-of-bounds reads in video terminal and selector descriptors
      lsusb: fix undefined behavior in convert_le_u32() signed shift
      lsusb: fix OOB reads in UAC1 audio FORMAT_TYPE descriptor parsing
      lsusb: fix out-of-bounds read in SuperSpeedPlus capability descriptor
      lsusb: fix OOB reads in audio FORMAT_SPECIFIC descriptor parsing
      lsusb: fix out-of-bounds reads in IPP printer descriptor parsing
      lsusb: add missing length checks in dump_wire_adapter and
      dump_rc_interface
      lsusb: add missing length checks in dump_security and dump_encryption_type
      lsusb: fix OOB read in dump_dfu_interface on short descriptors
      lsusb: add missing length check in dump_association()
      lsusb: fix out-of-bounds reads in dump_hid_device() on short descriptors
      lsusb: fix OOB reads in UAC2 FORMAT_TYPE descriptor parsing
      lsusb: fix OOB reads in MIDI HEADER and MIDI_IN_JACK descriptor parsing
      lsusb: fix OOB read in dump_videocontrol_interrupt_endpoint()
      lsusb: fix OOB reads in video streaming format descriptors
      lsusb: fix OOB reads in video FRAME descriptor parsing
      lsusb: fix remaining OOB read in MIDI_OUT_JACK initial fields
      lsusb: fix remaining OOB reads in video descriptor warn-and-continue paths
      lsusb: fix OOB reads in video INPUT_HEADER and OUTPUT_HEADER data loops
      lsusb: fix OOB read in STILL_IMAGE_FRAME compression pattern loop
      lsusb: fix OOB read in FORMAT_MPEG2TS descriptor on short descriptors
      lsusb: zero hub descriptor buffer to prevent reading uninitialized data
      lsusb: fix OOB read in FORMAT_STREAM_BASED descriptor parsing
      lsusb: fix unsigned integer underflow in dump_bytes calls for short
      descriptors
      lsusb: fix wrong byte printed for CCID bClassEnvelope
      lsusb: bounds-check MIDI ELEMENT bNrInputPins/bElCapsSize against bLength
      lsusb: bounds-check UVC INPUT_TERMINAL bControlSize against bLength
      lsusb.py: strip control characters from device-supplied sysfs strings
      usbreset: refuse ambiguous selectors that match more than one device
      usbmisc, usb-devices: strip control characters from device-supplied
      strings
      lsusb: don't loop forever in find_otg() on a zero-bLength sub-descriptor
      desc-defs: fix off-by-one in UAC1 wFormatTag string lookup
      lsusb: bounds-check the BOS device-capability walk
      usbhid-dump: skip interfaces with bInterfaceNumber 0xff
      usb-devices: use printf instead of echo for device-supplied strings
      usb-devices: fix default case in class_decode()
      lsusb: strip control characters from the WebUSB landing-page URL
      lsusb: bound the report-fetch loop in dump_hid_device() too
      lsusb: bounds-check MIDI OUT_JACK bNrInputPins against bLength
      lsusb: bounds-check IPP printer capability walk against bLength
      desc-dump: bound get_value_from_field() against descriptor length
      sysfs: strip control characters from device-supplied string attributes
      lsusb, usbmisc, usbhid-dump: zero-init buffers passed to libusb control
      transfers
      lsusb: migrate the MIDIStreaming parsers onto the desc-dump table engine
      desc-dump: don't exit() on a device-supplied size_field value
      lsusb: return on short bLength in the class-specific descriptor
      dispatchers
      lsusb: check FORMAT_TYPE bLength before reading bFormatType
      lsusb: avoid undefined behaviour when assembling u32s from descriptor
      bytes
      lsusb: bound the extra[] dispatch loops by remaining size
      lsusb: fix wHubDelay decoding in the USB3 hub descriptor dump
      usbhid-dump: bound the HID-descriptor-extra walk by entry end, not start
      lsusb: fix two -D path-resolution edge cases in usbmisc.c
      lsusb: don't pass NULL into %s for unknown HID report/usage tags
      tests: brat: fix some spelling issues
      usbutils.spdx: update with new files added
      lsusb: add expected length message for video descriptor endpoint
      meson.build: turn off -Wno-unused-function
      lsusb: fix up parsing for older uvc devices
      tests: usbhid-dump: compare built against installed
      tests: usbhid-dump -h: compare built against installed
      tests: usbhid-dump -s: compare built against installed
      tests: usbhid-dump -d: compare built against installed
      tests: usbhid-dump -i: compare built against installed
      tests: usbhid-dump -e: compare built against installed
      tests: add lsusb argument-combination brat tests
      tests: add lsusb.py argument-combination brat tests
      tests: add lsusb -h/-V interaction test
      tests: add lsusb -t precedence test (-s/-d/-D ignored under -t)
      tests: add lsusb -D precedence test (-s/-d ignored under -D)
      tests: add lsusb -V precedence test
      tests: add lsusb -h precedence test
      tests: add lsusb repeated -s/-d/-D test
      tests: add lsusb -d :pid product-only filter test
      tests: add lsusb -D error-path tests
      tests: add lsusb -P/-p vestigial-option test
      tests: add lsusb -- end-of-options test
      test/lsusb-vv.brat: send errors to /dev/null
      lsusb-t: fall back to the sysfs vendor/product strings

Jefferson Kline (1):
      usbreset: return failure when device reset fails

John Whittington (1):
      lsusb.c: fix typo dwMaxiumumClock

MingHao Chen (1):
      lsusb.py: fix parse_usb_ids

MoJl4yH (1):
      lsusb: fix shift UB and truncated-item reads in HID report dump

dependabot[bot] (8):
      ci: bump github/codeql-action in the all-actions group
      ci: bump the all-actions group with 5 updates
      ci: bump the all-actions group across 1 directory with 4 updates
      ci: bump github/codeql-action in the all-actions group
      ci: bump the all-actions group with 2 updates
      ci: bump the all-actions group with 5 updates
      ci: bump the all-actions group with 5 updates
      ci: bump the all-actions group across 1 directory with 3 updates

--===============4853050553193502359==--
