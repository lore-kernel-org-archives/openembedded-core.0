Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC7DCCF2E5
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 06:03:02 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28430.1792389779975616389
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 23:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=axeI4Ruq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=J3V95Bql;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a152c18e06-06e65f79-c740-4542-ab2a-c1f34fdf37b5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792389779;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=W0kxABES0e1sr6HucIaY7LKScU7DdkGDpNCeVQW+3Mc=;
	b=axeI4RuqWw0NOlQ9/QA3p27PO4QrLEdiYONscnngl+FCq/CPtUfRWltc5pnh4zT5
	Ssh8d1VAd2gZXos+eUY8x9ZVlO6lEatKUMyYIUitRSOccQmUwAKK8aXl3csjrBAkFrj
	l1jy0A7P3UNPkKruIlbFNWCVT82s1bAVP18UXKQc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792389779;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=W0kxABES0e1sr6HucIaY7LKScU7DdkGDpNCeVQW+3Mc=;
	b=J3V95BqlwK+krQpYP3Jsi/eDpxDHGFGxTNZCd95i9F/ELNEUuvrJ/Zwh/tlR1U3u
	FX0p+nDMAB6q7/WifORsAwLo7HzFvCmN6yvbUMV0/1AYvdXy5P1oMb2P/SbRnt6NAiG
	nQi4kTVxlEuYzXKaFewk3g4OZMu/pN6s6GS4IcMQ=
Content-Type: multipart/mixed; boundary="===============5605825038986239585=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libical: upgrading to 4.0.7 SUCCEEDED
Message-ID: <010101a152c18e06-06e65f79-c740-4542-ab2a-c1f34fdf37b5-000000@us-west-2.amazonses.com>
Date: Mon, 19 Oct 2026 06:02:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.19-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 06:03:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248128

--===============5605825038986239585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libical* to *4.0.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libical-upgrade-4.0.6-4.0.7.patch
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
From 8239133c9ebee31ccee9238bb0a797834d8ab3cb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 19 Oct 2026 05:51:53 +0000
Subject: [PATCH] libical: upgrade 4.0.6 -> 4.0.7

# Libical v4.0.6
## Overview

This is a patch release and is fully source and binary compatible with version
4.0.0.

[Note: the libicalvcard is a released as a *Technical Preview*. As such,
its API is not finalized and no source or binary compatibility is guaranteed
with that library in the 4.0.x series.]

## ReleaseNotes

- libicalvcard:
  - `vcardcomponent_clone()` and friends now deep-copy TEXTLIST values (e.g.
    NICKNAME, CATEGORIES)
    and structured parameters (JSCOMPS), and keep the property group. Previously
    the clone shared
    them with the original, so freeing both freed the same memory twice.
  - Fixed a use-after-free and a memory leak when converting a vCalendar
    procedure alarm (PALARM)
    whose attachment is a plain path name.
- libical:
  - Fix busy status of recurring events in `icalcomponent_foreach_recurrence()`.
  - Fix `icalvalue_decode_ical_string()` and
    `icallangbind_property_eval_string()` reading past
    the end of a string that ends in a backslash or a newline.
  - `icaltimezone_truncate_vtimezone()` no longer reads the RRULE after freeing
    it when the new
     DTSTART is within a year of UNTIL (RSCALE rules), and no longer uses an
     uninitialized onset
     when no RRULE occurrence falls before the window close.
  - Fix IMAGE and STRUCTURED-DATA given by URI (with or without VALUE=URI)
    parsing to a URI value,
    whose string `icalproperty_get_image()` and
    `icalproperty_get_structureddata()` then read as
    an icalattach pointer.
  - Fix use-after-free and double free in `icalcomponent_merge_component()` when
    both calendars
    have a VTIMEZONE with the same TZID. Every VTIMEZONE of the merged calendar
    is now merged,
    and a conflicting VTIMEZONE is added under a renamed TZID (e.g. "Zone1")
    that its events use.
  - Fix out-of-bounds access to the year days bitmask in the recurrence iterator
    when an RSCALE
    date falls outside the year (e.g. BYWEEKNO with a DTSTART before the
    calendar's epoch).
  - Fix `icalrecur_iterator_set_range()` for a reverse range on a rule without
    UNTIL, which
    started the iteration at year 0 instead of at 'from'.
  - Fix `icalparser_clean()` for proper reuse by resetting internal structure
    values and clearing
    the root component to avoid a use-after-free.
  - Behavior change: The typed icalvalue getters now check that the value type
    of the icalvalue
    uses the same union member as the expected value type of the getter, as the
    vcardvalue getters
    have done since version 4.0.6. If the type mismatches, then they return the
    zero value for the
    expected value type. The typed setters error with ICAL_BADARG_ERROR instead
    of overwriting a
    value held in another union member.
- libicalss:
  - Fix heap-buffer-overflow in `icalspanlist_as_freebusy_matrix()` for busy
    spans that start
    before or end after the spanlist. `icalspanlist_from_vfreebusy()` now sets
    the spanlist
    start/end from DTSTART/DTEND and marks FBTYPE=FREE periods as free (all
    others as busy).
- Buildsystem changes:
  - Fix CMake command target_link_libraries() to use all-keywords as required
    since CMake v4.4.4.
  - When cross-compiling, don't build/install ical-glib-src-generator w/o
    existing binary

Please see the
[CHANGELOG](https://github.com/libical/libical/blob/4.0/CHANGELOG.md) for more.
---
 .../libical/{libical_4.0.6.bb => libical_4.0.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libical/{libical_4.0.6.bb => libical_4.0.7.bb} (96%)

diff --git a/meta/recipes-support/libical/libical_4.0.6.bb b/meta/recipes-support/libical/libical_4.0.7.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_4.0.6.bb
rename to meta/recipes-support/libical/libical_4.0.7.bb
index 7b9185c374..cbfcb0675e 100644
--- a/meta/recipes-support/libical/libical_4.0.6.bb
+++ b/meta/recipes-support/libical/libical_4.0.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6d9294493d031c817783b0400a126c89 \
 SECTION = "libs"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "2e3729cb69c282d3bb17a8d2b198af6e4bc7502fd3621c9adf573921fe9dceb0"
+SRC_URI[sha256sum] = "47c05bc96e41416578cf1803bb2ba3f8d292cb17d5ac2fca539dee922bae8a94"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 
-- 
2.47.1


--===============5605825038986239585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libical/libical: FILELIST: removed "/usr/lib/libicalss.so.4.0.6 /usr/lib/libicalss_cxx.so.4.0.6 /usr/lib/libicalvcard.so.4.0.6 /usr/lib/libicalvcal.so.4.0.6 /usr/lib/libical_cxx.so.4.0.6 /usr/lib/libical.so.4.0.6 /usr/lib/libical-glib.so.4.0.6", added "/usr/lib/libicalss.so.4.0.7 /usr/lib/libicalvcard.so.4.0.7 /usr/lib/libicalss_cxx.so.4.0.7 /usr/lib/libicalvcal.so.4.0.7 /usr/lib/libical_cxx.so.4.0.7 /usr/lib/libical.so.4.0.7 /usr/lib/libical-glib.so.4.0.7"
Changes to packages/x86-64-v3-poky-linux/libical (sysroot):
  /usr/lib/libical_cxx.so.4.0 changed symlink target from libical_cxx.so.4.0.6 to libical_cxx.so.4.0.7
  /usr/lib/libical-glib.so.4.0 changed symlink target from libical-glib.so.4.0.6 to libical-glib.so.4.0.7
  /usr/lib/libical.so.4.0 changed symlink target from libical.so.4.0.6 to libical.so.4.0.7
  /usr/lib/libicalss_cxx.so.4.0 changed symlink target from libicalss_cxx.so.4.0.6 to libicalss_cxx.so.4.0.7
  /usr/lib/libicalss.so.4.0 changed symlink target from libicalss.so.4.0.6 to libicalss.so.4.0.7
  /usr/lib/libicalvcal.so.4.0 changed symlink target from libicalvcal.so.4.0.6 to libicalvcal.so.4.0.7
  /usr/lib/libicalvcard.so.4.0 changed symlink target from libicalvcard.so.4.0.6 to libicalvcard.so.4.0.7
  /usr/lib/libical_cxx.so.4.0.6 moved to /usr/lib/libical_cxx.so.4.0.7
  /usr/lib/libical-glib.so.4.0.6 moved to /usr/lib/libical-glib.so.4.0.7
  /usr/lib/libical.so.4.0.6 moved to /usr/lib/libical.so.4.0.7
  /usr/lib/libicalss_cxx.so.4.0.6 moved to /usr/lib/libicalss_cxx.so.4.0.7
  /usr/lib/libicalss.so.4.0.6 moved to /usr/lib/libicalss.so.4.0.7
  /usr/lib/libicalvcal.so.4.0.6 moved to /usr/lib/libicalvcal.so.4.0.7
  /usr/lib/libicalvcard.so.4.0.6 moved to /usr/lib/libicalvcard.so.4.0.7

--===============5605825038986239585==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libical-upgrade-4.0.6-4.0.7.patch"

RnJvbSA4MjM5MTMzYzllYmVlMzFjY2VlOTIzOGJiMGE3OTc4MzRkOGFiM2NiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTkgT2N0IDIwMjYgMDU6NTE6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJpY2FsOiB1cGdyYWRlIDQuMC42IC0+IDQuMC43CgojIExpYmljYWwgdjQuMC42CiMjIE92ZXJ2
aWV3CgpUaGlzIGlzIGEgcGF0Y2ggcmVsZWFzZSBhbmQgaXMgZnVsbHkgc291cmNlIGFuZCBiaW5h
cnkgY29tcGF0aWJsZSB3aXRoIHZlcnNpb24KNC4wLjAuCgpbTm90ZTogdGhlIGxpYmljYWx2Y2Fy
ZCBpcyBhIHJlbGVhc2VkIGFzIGEgKlRlY2huaWNhbCBQcmV2aWV3Ki4gQXMgc3VjaCwKaXRzIEFQ
SSBpcyBub3QgZmluYWxpemVkIGFuZCBubyBzb3VyY2Ugb3IgYmluYXJ5IGNvbXBhdGliaWxpdHkg
aXMgZ3VhcmFudGVlZAp3aXRoIHRoYXQgbGlicmFyeSBpbiB0aGUgNC4wLnggc2VyaWVzLl0KCiMj
IFJlbGVhc2VOb3RlcwoKLSBsaWJpY2FsdmNhcmQ6CiAgLSBgdmNhcmRjb21wb25lbnRfY2xvbmUo
KWAgYW5kIGZyaWVuZHMgbm93IGRlZXAtY29weSBURVhUTElTVCB2YWx1ZXMgKGUuZy4KICAgIE5J
Q0tOQU1FLCBDQVRFR09SSUVTKQogICAgYW5kIHN0cnVjdHVyZWQgcGFyYW1ldGVycyAoSlNDT01Q
UyksIGFuZCBrZWVwIHRoZSBwcm9wZXJ0eSBncm91cC4gUHJldmlvdXNseQogICAgdGhlIGNsb25l
IHNoYXJlZAogICAgdGhlbSB3aXRoIHRoZSBvcmlnaW5hbCwgc28gZnJlZWluZyBib3RoIGZyZWVk
IHRoZSBzYW1lIG1lbW9yeSB0d2ljZS4KICAtIEZpeGVkIGEgdXNlLWFmdGVyLWZyZWUgYW5kIGEg
bWVtb3J5IGxlYWsgd2hlbiBjb252ZXJ0aW5nIGEgdkNhbGVuZGFyCiAgICBwcm9jZWR1cmUgYWxh
cm0gKFBBTEFSTSkKICAgIHdob3NlIGF0dGFjaG1lbnQgaXMgYSBwbGFpbiBwYXRoIG5hbWUuCi0g
bGliaWNhbDoKICAtIEZpeCBidXN5IHN0YXR1cyBvZiByZWN1cnJpbmcgZXZlbnRzIGluIGBpY2Fs
Y29tcG9uZW50X2ZvcmVhY2hfcmVjdXJyZW5jZSgpYC4KICAtIEZpeCBgaWNhbHZhbHVlX2RlY29k
ZV9pY2FsX3N0cmluZygpYCBhbmQKICAgIGBpY2FsbGFuZ2JpbmRfcHJvcGVydHlfZXZhbF9zdHJp
bmcoKWAgcmVhZGluZyBwYXN0CiAgICB0aGUgZW5kIG9mIGEgc3RyaW5nIHRoYXQgZW5kcyBpbiBh
IGJhY2tzbGFzaCBvciBhIG5ld2xpbmUuCiAgLSBgaWNhbHRpbWV6b25lX3RydW5jYXRlX3Z0aW1l
em9uZSgpYCBubyBsb25nZXIgcmVhZHMgdGhlIFJSVUxFIGFmdGVyIGZyZWVpbmcKICAgIGl0IHdo
ZW4gdGhlIG5ldwogICAgIERUU1RBUlQgaXMgd2l0aGluIGEgeWVhciBvZiBVTlRJTCAoUlNDQUxF
IHJ1bGVzKSwgYW5kIG5vIGxvbmdlciB1c2VzIGFuCiAgICAgdW5pbml0aWFsaXplZCBvbnNldAog
ICAgIHdoZW4gbm8gUlJVTEUgb2NjdXJyZW5jZSBmYWxscyBiZWZvcmUgdGhlIHdpbmRvdyBjbG9z
ZS4KICAtIEZpeCBJTUFHRSBhbmQgU1RSVUNUVVJFRC1EQVRBIGdpdmVuIGJ5IFVSSSAod2l0aCBv
ciB3aXRob3V0IFZBTFVFPVVSSSkKICAgIHBhcnNpbmcgdG8gYSBVUkkgdmFsdWUsCiAgICB3aG9z
ZSBzdHJpbmcgYGljYWxwcm9wZXJ0eV9nZXRfaW1hZ2UoKWAgYW5kCiAgICBgaWNhbHByb3BlcnR5
X2dldF9zdHJ1Y3R1cmVkZGF0YSgpYCB0aGVuIHJlYWQgYXMKICAgIGFuIGljYWxhdHRhY2ggcG9p
bnRlci4KICAtIEZpeCB1c2UtYWZ0ZXItZnJlZSBhbmQgZG91YmxlIGZyZWUgaW4gYGljYWxjb21w
b25lbnRfbWVyZ2VfY29tcG9uZW50KClgIHdoZW4KICAgIGJvdGggY2FsZW5kYXJzCiAgICBoYXZl
IGEgVlRJTUVaT05FIHdpdGggdGhlIHNhbWUgVFpJRC4gRXZlcnkgVlRJTUVaT05FIG9mIHRoZSBt
ZXJnZWQgY2FsZW5kYXIKICAgIGlzIG5vdyBtZXJnZWQsCiAgICBhbmQgYSBjb25mbGljdGluZyBW
VElNRVpPTkUgaXMgYWRkZWQgdW5kZXIgYSByZW5hbWVkIFRaSUQgKGUuZy4gIlpvbmUxIikKICAg
IHRoYXQgaXRzIGV2ZW50cyB1c2UuCiAgLSBGaXggb3V0LW9mLWJvdW5kcyBhY2Nlc3MgdG8gdGhl
IHllYXIgZGF5cyBiaXRtYXNrIGluIHRoZSByZWN1cnJlbmNlIGl0ZXJhdG9yCiAgICB3aGVuIGFu
IFJTQ0FMRQogICAgZGF0ZSBmYWxscyBvdXRzaWRlIHRoZSB5ZWFyIChlLmcuIEJZV0VFS05PIHdp
dGggYSBEVFNUQVJUIGJlZm9yZSB0aGUKICAgIGNhbGVuZGFyJ3MgZXBvY2gpLgogIC0gRml4IGBp
Y2FscmVjdXJfaXRlcmF0b3Jfc2V0X3JhbmdlKClgIGZvciBhIHJldmVyc2UgcmFuZ2Ugb24gYSBy
dWxlIHdpdGhvdXQKICAgIFVOVElMLCB3aGljaAogICAgc3RhcnRlZCB0aGUgaXRlcmF0aW9uIGF0
IHllYXIgMCBpbnN0ZWFkIG9mIGF0ICdmcm9tJy4KICAtIEZpeCBgaWNhbHBhcnNlcl9jbGVhbigp
YCBmb3IgcHJvcGVyIHJldXNlIGJ5IHJlc2V0dGluZyBpbnRlcm5hbCBzdHJ1Y3R1cmUKICAgIHZh
bHVlcyBhbmQgY2xlYXJpbmcKICAgIHRoZSByb290IGNvbXBvbmVudCB0byBhdm9pZCBhIHVzZS1h
ZnRlci1mcmVlLgogIC0gQmVoYXZpb3IgY2hhbmdlOiBUaGUgdHlwZWQgaWNhbHZhbHVlIGdldHRl
cnMgbm93IGNoZWNrIHRoYXQgdGhlIHZhbHVlIHR5cGUKICAgIG9mIHRoZSBpY2FsdmFsdWUKICAg
IHVzZXMgdGhlIHNhbWUgdW5pb24gbWVtYmVyIGFzIHRoZSBleHBlY3RlZCB2YWx1ZSB0eXBlIG9m
IHRoZSBnZXR0ZXIsIGFzIHRoZQogICAgdmNhcmR2YWx1ZSBnZXR0ZXJzCiAgICBoYXZlIGRvbmUg
c2luY2UgdmVyc2lvbiA0LjAuNi4gSWYgdGhlIHR5cGUgbWlzbWF0Y2hlcywgdGhlbiB0aGV5IHJl
dHVybiB0aGUKICAgIHplcm8gdmFsdWUgZm9yIHRoZQogICAgZXhwZWN0ZWQgdmFsdWUgdHlwZS4g
VGhlIHR5cGVkIHNldHRlcnMgZXJyb3Igd2l0aCBJQ0FMX0JBREFSR19FUlJPUiBpbnN0ZWFkCiAg
ICBvZiBvdmVyd3JpdGluZyBhCiAgICB2YWx1ZSBoZWxkIGluIGFub3RoZXIgdW5pb24gbWVtYmVy
LgotIGxpYmljYWxzczoKICAtIEZpeCBoZWFwLWJ1ZmZlci1vdmVyZmxvdyBpbiBgaWNhbHNwYW5s
aXN0X2FzX2ZyZWVidXN5X21hdHJpeCgpYCBmb3IgYnVzeQogICAgc3BhbnMgdGhhdCBzdGFydAog
ICAgYmVmb3JlIG9yIGVuZCBhZnRlciB0aGUgc3Bhbmxpc3QuIGBpY2Fsc3Bhbmxpc3RfZnJvbV92
ZnJlZWJ1c3koKWAgbm93IHNldHMKICAgIHRoZSBzcGFubGlzdAogICAgc3RhcnQvZW5kIGZyb20g
RFRTVEFSVC9EVEVORCBhbmQgbWFya3MgRkJUWVBFPUZSRUUgcGVyaW9kcyBhcyBmcmVlIChhbGwK
ICAgIG90aGVycyBhcyBidXN5KS4KLSBCdWlsZHN5c3RlbSBjaGFuZ2VzOgogIC0gRml4IENNYWtl
IGNvbW1hbmQgdGFyZ2V0X2xpbmtfbGlicmFyaWVzKCkgdG8gdXNlIGFsbC1rZXl3b3JkcyBhcyBy
ZXF1aXJlZAogICAgc2luY2UgQ01ha2UgdjQuNC40LgogIC0gV2hlbiBjcm9zcy1jb21waWxpbmcs
IGRvbid0IGJ1aWxkL2luc3RhbGwgaWNhbC1nbGliLXNyYy1nZW5lcmF0b3Igdy9vCiAgICBleGlz
dGluZyBiaW5hcnkKClBsZWFzZSBzZWUgdGhlCltDSEFOR0VMT0ddKGh0dHBzOi8vZ2l0aHViLmNv
bS9saWJpY2FsL2xpYmljYWwvYmxvYi80LjAvQ0hBTkdFTE9HLm1kKSBmb3IgbW9yZS4KLS0tCiAu
Li4vbGliaWNhbC97bGliaWNhbF80LjAuNi5iYiA9PiBsaWJpY2FsXzQuMC43LmJifSAgICAgICAg
ICAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJpY2FsL3tsaWJpY2FsXzQuMC42LmJi
ID0+IGxpYmljYWxfNC4wLjcuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGliaWNhbC9saWJpY2FsXzQuMC42LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
aWNhbC9saWJpY2FsXzQuMC43LmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYmljYWwvbGliaWNhbF80LjAuNi5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGliaWNhbC9saWJpY2FsXzQuMC43LmJiCmluZGV4IDdiOTE4NWMz
NzQuLmNiZmNiMDY3NWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmljYWwv
bGliaWNhbF80LjAuNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJpY2FsL2xpYmlj
YWxfNC4wLjcuYmIKQEAgLTExLDcgKzExLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
TElDRU5TRS50eHQ7bWQ1PTZkOTI5NDQ5M2QwMzFjODE3NzgzYjA0MDBhMTI2Yzg5IFwKIFNFQ1RJ
T04gPSAibGlicyIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7
UFZ9LyR7QlB9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyZTM3MjljYjY5YzI4MmQz
YmIxN2E4ZDJiMTk4YWY2ZTRiYzc1MDJmZDM2MjFjOWFkZjU3MzkyMWZlOWRjZWIwIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjQ3YzA1YmM5NmU0MTQxNjU3OGNmMTgwM2JiMmJhM2Y4ZDI5MmNiMTdk
NWFjMmZjYTUzOWRlZTkyMmJhZThhOTQiCiAKIGluaGVyaXQgY21ha2UgcGtnY29uZmlnIGdvYmpl
Y3QtaW50cm9zcGVjdGlvbiB2YWxhIGdpdGh1Yi1yZWxlYXNlcwogCi0tIAoyLjQ3LjEKCg==

--===============5605825038986239585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libical: PKGV changed from 4.0.6 [default] to 4.0.7 [default]
packages/x86-64-v3-poky-linux/libical: SRC_URI changed from "https://github.com/libical/libical/releases//download/v4.0.6/libical-4.0.6.tar.gz" to "https://github.com/libical/libical/releases//download/v4.0.7/libical-4.0.7.tar.gz"
packages/x86-64-v3-poky-linux/libical: PV changed from "4.0.6" to "4.0.7"
packages/x86-64-v3-poky-linux/libical/libical-dbg: PKGV changed from 4.0.6 [default] to 4.0.7 [default]
packages/x86-64-v3-poky-linux/libical/libical-dbg: FILELIST: removed "/usr/lib/.debug/libicalvcal.so.4.0.6 /usr/lib/.debug/libicalss.so.4.0.6 /usr/lib/.debug/libical-glib.so.4.0.6 /usr/lib/.debug/libical_cxx.so.4.0.6 /usr/lib/.debug/libical.so.4.0.6 /usr/lib/.debug/libicalss_cxx.so.4.0.6 /usr/lib/.debug/libicalvcard.so.4.0.6", added "/usr/lib/.debug/libical_cxx.so.4.0.7 /usr/lib/.debug/libicalss.so.4.0.7 /usr/lib/.debug/libicalvcal.so.4.0.7 /usr/lib/.debug/libical-glib.so.4.0.7 /usr/lib/.debug/libical.so.4.0.7 /usr/lib/.debug/libicalss_cxx.so.4.0.7 /usr/lib/.debug/libicalvcard.so.4.0.7"
packages/x86-64-v3-poky-linux/libical/libical-dbg: PKGSIZE changed from 5052896 to 5057296 (+0%)
packages/x86-64-v3-poky-linux/libical/libical-dbg: PV changed from "4.0.6" to "4.0.7"
packages/x86-64-v3-poky-linux/libical/libical-dev: PKGV changed from 4.0.6 [default] to 4.0.7 [default]
packages/x86-64-v3-poky-linux/libical/libical-dev: PKGSIZE changed from 4522090 to 4524210 (+0%)
packages/x86-64-v3-poky-linux/libical/libical-dev: PV changed from "4.0.6" to "4.0.7"
packages/x86-64-v3-poky-linux/libical/libical-doc: PKGV changed from 4.0.6 [default] to 4.0.7 [default]
packages/x86-64-v3-poky-linux/libical/libical-doc: PV changed from "4.0.6" to "4.0.7"
packages/x86-64-v3-poky-linux/libical/libical-locale: PKGV changed from 4.0.6 [default] to 4.0.7 [default]
packages/x86-64-v3-poky-linux/libical/libical-locale: PV changed from "4.0.6" to "4.0.7"
packages/x86-64-v3-poky-linux/libical/libical-src: PKGV changed from 4.0.6 [default] to 4.0.7 [default]
packages/x86-64-v3-poky-linux/libical/libical-src: FILELIST: directory renamed /usr/src/debug/libical/4.0.6/src/libical -> /usr/src/debug/libical/4.0.7/src/libical, directory renamed /usr/src/debug/libical/4.0.6/src/libicalvcard -> /usr/src/debug/libical/4.0.7/src/libicalvcard, directory renamed /usr/src/debug/libical/4.0.6/src/libicalss -> /usr/src/debug/libical/4.0.7/src/libicalss, directory renamed /usr/src/debug/libical/4.0.6/src/libicalvcal -> /usr/src/debug/libical/4.0.7/src/libicalvcal, directory renamed /usr/src/debug/libical/4.0.6/src/libical-glib -> /usr/src/debug/libical/4.0.7/src/libical-glib, directory renamed /usr/src/debug/libical/4.0.6 -> /usr/src/debug/libical/4.0.7
packages/x86-64-v3-poky-linux/libical/libical-src: PKGSIZE changed from 4441032 to 4453467 (+0%)
packages/x86-64-v3-poky-linux/libical/libical-src: PV changed from "4.0.6" to "4.0.7"
packages/x86-64-v3-poky-linux/libical/libical-staticdev: PKGV changed from 4.0.6 [default] to 4.0.7 [default]
packages/x86-64-v3-poky-linux/libical/libical-staticdev: PV changed from "4.0.6" to "4.0.7"
packages/x86-64-v3-poky-linux/libical/libical: PKGV changed from 4.0.6 [default] to 4.0.7 [default]
packages/x86-64-v3-poky-linux/libical/libical: FILELIST: removed "/usr/lib/libicalss_cxx.so.4.0.6 /usr/lib/libicalss.so.4.0.6 /usr/lib/libicalvcal.so.4.0.6 /usr/lib/libicalvcard.so.4.0.6 /usr/lib/libical-glib.so.4.0.6 /usr/lib/libical_cxx.so.4.0.6 /usr/lib/libical.so.4.0.6", added "/usr/lib/libicalss_cxx.so.4.0.7 /usr/lib/libicalss.so.4.0.7 /usr/lib/libicalvcal.so.4.0.7 /usr/lib/libicalvcard.so.4.0.7 /usr/lib/libical-glib.so.4.0.7 /usr/lib/libical_cxx.so.4.0.7 /usr/lib/libical.so.4.0.7"
packages/x86-64-v3-poky-linux/libical/libical: PKGSIZE changed from 2284202 to 2288298 (+0%)
packages/x86-64-v3-poky-linux/libical/libical: PV changed from "4.0.6" to "4.0.7"
Changes to packages/x86-64-v3-poky-linux/libical (sysroot):
  /usr/lib/libical_cxx.so.4.0 changed symlink target from libical_cxx.so.4.0.6 to libical_cxx.so.4.0.7
  /usr/lib/libical-glib.so.4.0 changed symlink target from libical-glib.so.4.0.6 to libical-glib.so.4.0.7
  /usr/lib/libical.so.4.0 changed symlink target from libical.so.4.0.6 to libical.so.4.0.7
  /usr/lib/libicalss_cxx.so.4.0 changed symlink target from libicalss_cxx.so.4.0.6 to libicalss_cxx.so.4.0.7
  /usr/lib/libicalss.so.4.0 changed symlink target from libicalss.so.4.0.6 to libicalss.so.4.0.7
  /usr/lib/libicalvcal.so.4.0 changed symlink target from libicalvcal.so.4.0.6 to libicalvcal.so.4.0.7
  /usr/lib/libicalvcard.so.4.0 changed symlink target from libicalvcard.so.4.0.6 to libicalvcard.so.4.0.7
  /usr/lib/libical_cxx.so.4.0.6 moved to /usr/lib/libical_cxx.so.4.0.7
  /usr/lib/libical-glib.so.4.0.6 moved to /usr/lib/libical-glib.so.4.0.7
  /usr/lib/libical.so.4.0.6 moved to /usr/lib/libical.so.4.0.7
  /usr/lib/libicalss_cxx.so.4.0.6 moved to /usr/lib/libicalss_cxx.so.4.0.7
  /usr/lib/libicalss.so.4.0.6 moved to /usr/lib/libicalss.so.4.0.7
  /usr/lib/libicalvcal.so.4.0.6 moved to /usr/lib/libicalvcal.so.4.0.7
  /usr/lib/libicalvcard.so.4.0.6 moved to /usr/lib/libicalvcard.so.4.0.7

--===============5605825038986239585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libical-changelog.txt"

# Libical v4.0.6
## Overview

This is a patch release and is fully source and binary compatible with version
4.0.0.

[Note: the libicalvcard is a released as a *Technical Preview*. As such,
its API is not finalized and no source or binary compatibility is guaranteed
with that library in the 4.0.x series.]

## ReleaseNotes

- libicalvcard:
  - `vcardcomponent_clone()` and friends now deep-copy TEXTLIST values (e.g.
    NICKNAME, CATEGORIES)
    and structured parameters (JSCOMPS), and keep the property group. Previously
    the clone shared
    them with the original, so freeing both freed the same memory twice.
  - Fixed a use-after-free and a memory leak when converting a vCalendar
    procedure alarm (PALARM)
    whose attachment is a plain path name.
- libical:
  - Fix busy status of recurring events in `icalcomponent_foreach_recurrence()`.
  - Fix `icalvalue_decode_ical_string()` and
    `icallangbind_property_eval_string()` reading past
    the end of a string that ends in a backslash or a newline.
  - `icaltimezone_truncate_vtimezone()` no longer reads the RRULE after freeing
    it when the new
     DTSTART is within a year of UNTIL (RSCALE rules), and no longer uses an
     uninitialized onset
     when no RRULE occurrence falls before the window close.
  - Fix IMAGE and STRUCTURED-DATA given by URI (with or without VALUE=URI)
    parsing to a URI value,
    whose string `icalproperty_get_image()` and
    `icalproperty_get_structureddata()` then read as
    an icalattach pointer.
  - Fix use-after-free and double free in `icalcomponent_merge_component()` when
    both calendars
    have a VTIMEZONE with the same TZID. Every VTIMEZONE of the merged calendar
    is now merged,
    and a conflicting VTIMEZONE is added under a renamed TZID (e.g. "Zone1")
    that its events use.
  - Fix out-of-bounds access to the year days bitmask in the recurrence iterator
    when an RSCALE
    date falls outside the year (e.g. BYWEEKNO with a DTSTART before the
    calendar's epoch).
  - Fix `icalrecur_iterator_set_range()` for a reverse range on a rule without
    UNTIL, which
    started the iteration at year 0 instead of at 'from'.
  - Fix `icalparser_clean()` for proper reuse by resetting internal structure
    values and clearing
    the root component to avoid a use-after-free.
  - Behavior change: The typed icalvalue getters now check that the value type
    of the icalvalue
    uses the same union member as the expected value type of the getter, as the
    vcardvalue getters
    have done since version 4.0.6. If the type mismatches, then they return the
    zero value for the
    expected value type. The typed setters error with ICAL_BADARG_ERROR instead
    of overwriting a
    value held in another union member.
- libicalss:
  - Fix heap-buffer-overflow in `icalspanlist_as_freebusy_matrix()` for busy
    spans that start
    before or end after the spanlist. `icalspanlist_from_vfreebusy()` now sets
    the spanlist
    start/end from DTSTART/DTEND and marks FBTYPE=FREE periods as free (all
    others as busy).
- Buildsystem changes:
  - Fix CMake command target_link_libraries() to use all-keywords as required
    since CMake v4.4.4.
  - When cross-compiling, don't build/install ical-glib-src-generator w/o
    existing binary

Please see the
[CHANGELOG](https://github.com/libical/libical/blob/4.0/CHANGELOG.md) for more.

--===============5605825038986239585==--

