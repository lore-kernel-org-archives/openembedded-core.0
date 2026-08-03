Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AEDC55162
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 05:10:47 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36841.1785733838436177497
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 22:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DtVmRjkH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=q7DyqWvY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019fc607f254-8fb1dfbe-682e-464b-a5f6-f8c908f175e2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785733837;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=VdThTEXRjq05RAEI5QCBHOJo09a50+eSV1ieWXU7qZM=;
	b=DtVmRjkH2FYeXfrxP6FsNa20My1lAd7BDl48bryZBu+DdbNnKwvbvmhVSXUJRM6E
	xNQhfujvERD+irvsODxf1CBGnkyT4JarUX2MBYbCAERpTBQ2eUFzYYfuSln8Kcw91zH
	Oi+QtCEMVU6ksMWkDst0ulCk80Qutsh6M4DVJ6C0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785733837;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=VdThTEXRjq05RAEI5QCBHOJo09a50+eSV1ieWXU7qZM=;
	b=q7DyqWvYjhyJMYkRsq2EjOAquDlfnAFSFGUShcb1JEoTcZpKDCVKGugypRXCaGc4
	6NtayYYYEQ6VJUyXrULDsSR95S7c0s3VP7jbfDo8EIYYb3gTq+bb0YrlAUcIiIiJAPH
	AJhi7LbEgoqgT311HNDvKkBoc0EOMrdLgKdLE0co=
Content-Type: multipart/mixed; boundary="===============5251059944324051677=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] mpg123: upgrading to 1.33.7 SUCCEEDED
Message-ID: <0101019fc607f254-8fb1dfbe-682e-464b-a5f6-f8c908f175e2-000000@us-west-2.amazonses.com>
Date: Mon, 3 Aug 2026 05:10:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.03-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 05:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242602

--===============5251059944324051677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mpg123* to *1.33.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mpg123-upgrade-1.33.6-1.33.7.patch
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
From e70aa335817809b70b7b6291090e6135630af55b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 3 Aug 2026 05:10:34 +0000
Subject: [PATCH] mpg123: upgrade 1.33.6 -> 1.33.7

Source: NEWS

1.33.7
------
- mpg123:
-- Fix heap buffer overflows in unicode path conversion on Windows (bug 388,
   thanks to Alejandro Ramos).
-- Fix information disclosure of uninitialied memory for --auth-file without
   line endings. (bug 390, thanks to Alejandro Ramos)
-- Fix out-of-bounds read/write when combining --continue --random --listentry <n>
   where n is larger than the playlist size. (bug 391, thanks to Alejandro Ramos)
-- Fix a harmless valgrind memory leak report by not nulling playlist name.
-- Fix error handling of win32_net_writestring() (Windows only) by actually using
   a signed type, also preventing a OOB read on failure.
   (bug 392 by Alejandro Ramos)
-- Fix a mostly harmless OOB read of 1 byte when printing USLT lyrics.
   (bug 392)
-- Fix leaking file descriptor on read error from --equalizer file. (bug 392)
-- Hardening of loading HTTP(S) via curl or wget against funky URLs by including
   the -- separator. No actual vulnerability, tough, just extra care. (bug 392)
- out123:
-- Fix heap overrun on --endian conversion with differing input and output
   channel counts. (bug 391)
-- Fix parsing of filter specs with whitespace before commas, which resulted
   in out-of-bounds writes before. (bug 391)
- libmpg123, mpg123: Harden memory realloc calls against multiplication overflow
  of size_t in arguments. Specifically, this addresses part of bug 389 with possible
  application abuse of mpg123_set_index64(). (bug 389 by Alejandro Ramos)
- libmpg123:
-- Fix possible use of uninitialized values in layer III dequantization.
   III_dequantize_sample() for consistent output also for strange input. The new
   code seems to be slightly faster after some rearrangements.
   (thanks to He Huang, Swinburne University of Technology (discovered using
   NexusSan))
-- Fix a double free when deleting a handle after failed mpg123_decoder() call
   (possibly among others). (bug 389)
-- More strong wording in API that ID3 text convenience links are short-lived,
   but safeguard against ignorant use by nulling them early.
   (bug 389)
-- Prevent double free in mpg123_set_index() 32 bit wrapper being called with
   index size 0. (bug 392)
-- Harden against an application wielding a foot gun by handing in an undersized
   decoding buffer betwee seek and read (return error before trying to decode
   and discard frames in that case). (bug 392)
-- Do properly terminate ID3v2 texts coming in UTF16 encoding when they overwrite
   previous frames, like with other encodings. The symptom was a shorter second
   frame resulting in a combined text with the earlier longer frame.
   (bug 392)
-- Check and properly handle null source buffer and zero size in mpg123_store_utf8()
   instead of reading past (before) buffers. (bug 392)
-- Ensure clients get ID3v1 data with (unmotivated) mpg123_id3_raw()
   only if the parser decided that it is there, not possibly the last 128 bytes of
   a seekable stream without ID3v1 tag. (bug 392)
-- Prevent impossible N

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../mpg123/{mpg123_1.33.6.bb => mpg123_1.33.7.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.33.6.bb => mpg123_1.33.7.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.33.6.bb b/meta/recipes-multimedia/mpg123/mpg123_1.33.7.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.33.6.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.33.7.bb
index 7fa048c9fc..002c4f1cc6 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.33.6.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.33.7.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "929a7c18ba662b8927aed4de229ad9ae8ab2b4806dd0f30b90113eb1b4e2195a"
+SRC_URI[sha256sum] = "31d0e35a4ca567ec9b5ebda6c3062bb4435d6d3eacd6ef0d95cadd7854dc03ee"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.47.1


--===============5251059944324051677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="mpg123-changelog.txt"

Q2hhbmdlbG9nIGZvciBtcGcxMjM6IDEuMzMuNiAtPiAxLjMzLjcKU291cmNlOiBORVdTCgoxLjMz
LjcKLS0tLS0tCi0gbXBnMTIzOgotLSBGaXggaGVhcCBidWZmZXIgb3ZlcmZsb3dzIGluIHVuaWNv
ZGUgcGF0aCBjb252ZXJzaW9uIG9uIFdpbmRvd3MgKGJ1ZyAzODgsCiAgIHRoYW5rcyB0byBBbGVq
YW5kcm8gUmFtb3MpLgotLSBGaXggaW5mb3JtYXRpb24gZGlzY2xvc3VyZSBvZiB1bmluaXRpYWxp
ZWQgbWVtb3J5IGZvciAtLWF1dGgtZmlsZSB3aXRob3V0CiAgIGxpbmUgZW5kaW5ncy4gKGJ1ZyAz
OTAsIHRoYW5rcyB0byBBbGVqYW5kcm8gUmFtb3MpCi0tIEZpeCBvdXQtb2YtYm91bmRzIHJlYWQv
d3JpdGUgd2hlbiBjb21iaW5pbmcgLS1jb250aW51ZSAtLXJhbmRvbSAtLWxpc3RlbnRyeSA8bj4K
ICAgd2hlcmUgbiBpcyBsYXJnZXIgdGhhbiB0aGUgcGxheWxpc3Qgc2l6ZS4gKGJ1ZyAzOTEsIHRo
YW5rcyB0byBBbGVqYW5kcm8gUmFtb3MpCi0tIEZpeCBhIGhhcm1sZXNzIHZhbGdyaW5kIG1lbW9y
eSBsZWFrIHJlcG9ydCBieSBub3QgbnVsbGluZyBwbGF5bGlzdCBuYW1lLgotLSBGaXggZXJyb3Ig
aGFuZGxpbmcgb2Ygd2luMzJfbmV0X3dyaXRlc3RyaW5nKCkgKFdpbmRvd3Mgb25seSkgYnkgYWN0
dWFsbHkgdXNpbmcKICAgYSBzaWduZWQgdHlwZSwgYWxzbyBwcmV2ZW50aW5nIGEgT09CIHJlYWQg
b24gZmFpbHVyZS4KICAgKGJ1ZyAzOTIgYnkgQWxlamFuZHJvIFJhbW9zKQotLSBGaXggYSBtb3N0
bHkgaGFybWxlc3MgT09CIHJlYWQgb2YgMSBieXRlIHdoZW4gcHJpbnRpbmcgVVNMVCBseXJpY3Mu
CiAgIChidWcgMzkyKQotLSBGaXggbGVha2luZyBmaWxlIGRlc2NyaXB0b3Igb24gcmVhZCBlcnJv
ciBmcm9tIC0tZXF1YWxpemVyIGZpbGUuIChidWcgMzkyKQotLSBIYXJkZW5pbmcgb2YgbG9hZGlu
ZyBIVFRQKFMpIHZpYSBjdXJsIG9yIHdnZXQgYWdhaW5zdCBmdW5reSBVUkxzIGJ5IGluY2x1ZGlu
ZwogICB0aGUgLS0gc2VwYXJhdG9yLiBObyBhY3R1YWwgdnVsbmVyYWJpbGl0eSwgdG91Z2gsIGp1
c3QgZXh0cmEgY2FyZS4gKGJ1ZyAzOTIpCi0gb3V0MTIzOgotLSBGaXggaGVhcCBvdmVycnVuIG9u
IC0tZW5kaWFuIGNvbnZlcnNpb24gd2l0aCBkaWZmZXJpbmcgaW5wdXQgYW5kIG91dHB1dAogICBj
aGFubmVsIGNvdW50cy4gKGJ1ZyAzOTEpCi0tIEZpeCBwYXJzaW5nIG9mIGZpbHRlciBzcGVjcyB3
aXRoIHdoaXRlc3BhY2UgYmVmb3JlIGNvbW1hcywgd2hpY2ggcmVzdWx0ZWQKICAgaW4gb3V0LW9m
LWJvdW5kcyB3cml0ZXMgYmVmb3JlLiAoYnVnIDM5MSkKLSBsaWJtcGcxMjMsIG1wZzEyMzogSGFy
ZGVuIG1lbW9yeSByZWFsbG9jIGNhbGxzIGFnYWluc3QgbXVsdGlwbGljYXRpb24gb3ZlcmZsb3cK
ICBvZiBzaXplX3QgaW4gYXJndW1lbnRzLiBTcGVjaWZpY2FsbHksIHRoaXMgYWRkcmVzc2VzIHBh
cnQgb2YgYnVnIDM4OSB3aXRoIHBvc3NpYmxlCiAgYXBwbGljYXRpb24gYWJ1c2Ugb2YgbXBnMTIz
X3NldF9pbmRleDY0KCkuIChidWcgMzg5IGJ5IEFsZWphbmRybyBSYW1vcykKLSBsaWJtcGcxMjM6
Ci0tIEZpeCBwb3NzaWJsZSB1c2Ugb2YgdW5pbml0aWFsaXplZCB2YWx1ZXMgaW4gbGF5ZXIgSUlJ
IGRlcXVhbnRpemF0aW9uLgogICBJSUlfZGVxdWFudGl6ZV9zYW1wbGUoKSBmb3IgY29uc2lzdGVu
dCBvdXRwdXQgYWxzbyBmb3Igc3RyYW5nZSBpbnB1dC4gVGhlIG5ldwogICBjb2RlIHNlZW1zIHRv
IGJlIHNsaWdodGx5IGZhc3RlciBhZnRlciBzb21lIHJlYXJyYW5nZW1lbnRzLgogICAodGhhbmtz
IHRvIEhlIEh1YW5nLCBTd2luYnVybmUgVW5pdmVyc2l0eSBvZiBUZWNobm9sb2d5IChkaXNjb3Zl
cmVkIHVzaW5nCiAgIE5leHVzU2FuKSkKLS0gRml4IGEgZG91YmxlIGZyZWUgd2hlbiBkZWxldGlu
ZyBhIGhhbmRsZSBhZnRlciBmYWlsZWQgbXBnMTIzX2RlY29kZXIoKSBjYWxsCiAgIChwb3NzaWJs
eSBhbW9uZyBvdGhlcnMpLiAoYnVnIDM4OSkKLS0gTW9yZSBzdHJvbmcgd29yZGluZyBpbiBBUEkg
dGhhdCBJRDMgdGV4dCBjb252ZW5pZW5jZSBsaW5rcyBhcmUgc2hvcnQtbGl2ZWQsCiAgIGJ1dCBz
YWZlZ3VhcmQgYWdhaW5zdCBpZ25vcmFudCB1c2UgYnkgbnVsbGluZyB0aGVtIGVhcmx5LgogICAo
YnVnIDM4OSkKLS0gUHJldmVudCBkb3VibGUgZnJlZSBpbiBtcGcxMjNfc2V0X2luZGV4KCkgMzIg
Yml0IHdyYXBwZXIgYmVpbmcgY2FsbGVkIHdpdGgKICAgaW5kZXggc2l6ZSAwLiAoYnVnIDM5MikK
LS0gSGFyZGVuIGFnYWluc3QgYW4gYXBwbGljYXRpb24gd2llbGRpbmcgYSBmb290IGd1biBieSBo
YW5kaW5nIGluIGFuIHVuZGVyc2l6ZWQKICAgZGVjb2RpbmcgYnVmZmVyIGJldHdlZSBzZWVrIGFu
ZCByZWFkIChyZXR1cm4gZXJyb3IgYmVmb3JlIHRyeWluZyB0byBkZWNvZGUKICAgYW5kIGRpc2Nh
cmQgZnJhbWVzIGluIHRoYXQgY2FzZSkuIChidWcgMzkyKSAKLS0gRG8gcHJvcGVybHkgdGVybWlu
YXRlIElEM3YyIHRleHRzIGNvbWluZyBpbiBVVEYxNiBlbmNvZGluZyB3aGVuIHRoZXkgb3Zlcndy
aXRlCiAgIHByZXZpb3VzIGZyYW1lcywgbGlrZSB3aXRoIG90aGVyIGVuY29kaW5ncy4gVGhlIHN5
bXB0b20gd2FzIGEgc2hvcnRlciBzZWNvbmQKICAgZnJhbWUgcmVzdWx0aW5nIGluIGEgY29tYmlu
ZWQgdGV4dCB3aXRoIHRoZSBlYXJsaWVyIGxvbmdlciBmcmFtZS4KICAgKGJ1ZyAzOTIpCi0tIENo
ZWNrIGFuZCBwcm9wZXJseSBoYW5kbGUgbnVsbCBzb3VyY2UgYnVmZmVyIGFuZCB6ZXJvIHNpemUg
aW4gbXBnMTIzX3N0b3JlX3V0ZjgoKQogICBpbnN0ZWFkIG9mIHJlYWRpbmcgcGFzdCAoYmVmb3Jl
KSBidWZmZXJzLiAoYnVnIDM5MikKLS0gRW5zdXJlIGNsaWVudHMgZ2V0IElEM3YxIGRhdGEgd2l0
aCAodW5tb3RpdmF0ZWQpIG1wZzEyM19pZDNfcmF3KCkKICAgb25seSBpZiB0aGUgcGFyc2VyIGRl
Y2lkZWQgdGhhdCBpdCBpcyB0aGVyZSwgbm90IHBvc3NpYmx5IHRoZSBsYXN0IDEyOCBieXRlcyBv
ZgogICBhIHNlZWthYmxlIHN0cmVhbSB3aXRob3V0IElEM3YxIHRhZy4gKGJ1ZyAzOTIpCi0tIFBy
ZXZlbnQgaW1wb3NzaWJsZSBOdG9NIHJlc2FtcGxpbmcgd2l0aCB0b28gbG93IHRhcmdldCByYXRl
IChsaWtlIDEgSHopIHdoaWNoCiAgIHdvdWxkIHRyZ2dlciBlbmRsZXNzIGxvb3BpbmcuIChidWcg
MzkyKQotIGxpYm91dDEyMzoKLS0gRml4IGRlYWRsb2NrIGluIGJ1ZmZlciBtb2RlIHdoZW4gY29t
YmluZWQgd2l0aCAoc3RlcmVvKSAyNCBiaXQgb3V0cHV0LiBOb3cKICAgYWxzbyBtcGcxMjMgLS1i
dWZmZXIgNDA5NiAtZSBzMjQgc2hhbGwgYWN0dWFsbGx5IHdvcmsuIFNvcnJ5LiAoYnVnIDM5MikK
LS0gQWJvcnQgZWFybHkgb24gemVyby9uZWdhdGl2ZSByYXRlIGFuZCBjaGFubmVsIGNvdW50IGlu
IG91dDEyM19zdGFydCgpLgogICAoYnVnIDM5MikKLS0gRml4IGRpdmlkZSBieSB6ZXJvIGluIFdB
ViB3cml0aW5nIGJ5IGNhdGNoaW5nIGNoYW5uZWwgY291bnRzIHRoYXQgZ28gemVybyBpbiB0aGUK
ICAgMTYgYml0IFdBViBoZWFkZXIgZmllbGQuIChidWcgMzkyKQotIGxpYnN5bjEyMzoKLS0gRXhw
bGljdGx5IHJlamVjdCBtaXNtYXRjaGVkIGZvcm1hdCBmb3IgYXBwZW5kaW5nIGZpbHRlcnMgd2l0
aAogICBzeW4xMjNfc2V0dXBfZmlsdGVyKCksIHByZXZlbnRpbmcgbWVtb3J5IGVycm9ycyBmcm9t
IHRoYXQgQVBJLXZpb2xhdGluZyB1c2UuCiAgIChidWcgMzkyKQotLSBIYXJkZW4gdGhlIGRpcnR5
IHJlc2FtcGxpbmcgaW50ZXJwb2xhdG9yIGFnYWluc3QgZXh0cmVtZSByYXRlcyAoYXJvdW5kIDFl
MTggSHopCiAgIGJ5IGZpeGluZyBhIHNhbXBsZSBvZmZzZXQgY2hlY2sgdG8gbm90IGRvIHRoZSBl
eGFjdCBvdmVyZmxvd2luZyBhZGRpdGlvbgogICB0aGF0IGl0IGlzIHN1cHBvc2VkIHRvIGd1YXJk
IGFnYWluc3QuIFRoZSBmaW5lIHJlc2FtcGxlciB3YXMg4oCmIGZpbmUuIChidWcgMzkyKQotLSBF
cnJvciBvdXQgb24gdHJ5aW5nIHRvIGNyZWF0ZSBhIGZpbHRlciBvZiBvcmRlciAwIGluc3RlYWQg
b2YgZGl2aWRpbmcgYnkgemVybwogICBsYXRlci4gKGJ1ZyAzOTIpCg==

--===============5251059944324051677==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mpg123-upgrade-1.33.6-1.33.7.patch"

RnJvbSBlNzBhYTMzNTgxNzgwOWI3MGI3YjYyOTEwOTBlNjEzNTYzMGFmNTViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMyBBdWcgMjAyNiAwNToxMDozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1w
ZzEyMzogdXBncmFkZSAxLjMzLjYgLT4gMS4zMy43CgpTb3VyY2U6IE5FV1MKCjEuMzMuNwotLS0t
LS0KLSBtcGcxMjM6Ci0tIEZpeCBoZWFwIGJ1ZmZlciBvdmVyZmxvd3MgaW4gdW5pY29kZSBwYXRo
IGNvbnZlcnNpb24gb24gV2luZG93cyAoYnVnIDM4OCwKICAgdGhhbmtzIHRvIEFsZWphbmRybyBS
YW1vcykuCi0tIEZpeCBpbmZvcm1hdGlvbiBkaXNjbG9zdXJlIG9mIHVuaW5pdGlhbGllZCBtZW1v
cnkgZm9yIC0tYXV0aC1maWxlIHdpdGhvdXQKICAgbGluZSBlbmRpbmdzLiAoYnVnIDM5MCwgdGhh
bmtzIHRvIEFsZWphbmRybyBSYW1vcykKLS0gRml4IG91dC1vZi1ib3VuZHMgcmVhZC93cml0ZSB3
aGVuIGNvbWJpbmluZyAtLWNvbnRpbnVlIC0tcmFuZG9tIC0tbGlzdGVudHJ5IDxuPgogICB3aGVy
ZSBuIGlzIGxhcmdlciB0aGFuIHRoZSBwbGF5bGlzdCBzaXplLiAoYnVnIDM5MSwgdGhhbmtzIHRv
IEFsZWphbmRybyBSYW1vcykKLS0gRml4IGEgaGFybWxlc3MgdmFsZ3JpbmQgbWVtb3J5IGxlYWsg
cmVwb3J0IGJ5IG5vdCBudWxsaW5nIHBsYXlsaXN0IG5hbWUuCi0tIEZpeCBlcnJvciBoYW5kbGlu
ZyBvZiB3aW4zMl9uZXRfd3JpdGVzdHJpbmcoKSAoV2luZG93cyBvbmx5KSBieSBhY3R1YWxseSB1
c2luZwogICBhIHNpZ25lZCB0eXBlLCBhbHNvIHByZXZlbnRpbmcgYSBPT0IgcmVhZCBvbiBmYWls
dXJlLgogICAoYnVnIDM5MiBieSBBbGVqYW5kcm8gUmFtb3MpCi0tIEZpeCBhIG1vc3RseSBoYXJt
bGVzcyBPT0IgcmVhZCBvZiAxIGJ5dGUgd2hlbiBwcmludGluZyBVU0xUIGx5cmljcy4KICAgKGJ1
ZyAzOTIpCi0tIEZpeCBsZWFraW5nIGZpbGUgZGVzY3JpcHRvciBvbiByZWFkIGVycm9yIGZyb20g
LS1lcXVhbGl6ZXIgZmlsZS4gKGJ1ZyAzOTIpCi0tIEhhcmRlbmluZyBvZiBsb2FkaW5nIEhUVFAo
UykgdmlhIGN1cmwgb3Igd2dldCBhZ2FpbnN0IGZ1bmt5IFVSTHMgYnkgaW5jbHVkaW5nCiAgIHRo
ZSAtLSBzZXBhcmF0b3IuIE5vIGFjdHVhbCB2dWxuZXJhYmlsaXR5LCB0b3VnaCwganVzdCBleHRy
YSBjYXJlLiAoYnVnIDM5MikKLSBvdXQxMjM6Ci0tIEZpeCBoZWFwIG92ZXJydW4gb24gLS1lbmRp
YW4gY29udmVyc2lvbiB3aXRoIGRpZmZlcmluZyBpbnB1dCBhbmQgb3V0cHV0CiAgIGNoYW5uZWwg
Y291bnRzLiAoYnVnIDM5MSkKLS0gRml4IHBhcnNpbmcgb2YgZmlsdGVyIHNwZWNzIHdpdGggd2hp
dGVzcGFjZSBiZWZvcmUgY29tbWFzLCB3aGljaCByZXN1bHRlZAogICBpbiBvdXQtb2YtYm91bmRz
IHdyaXRlcyBiZWZvcmUuIChidWcgMzkxKQotIGxpYm1wZzEyMywgbXBnMTIzOiBIYXJkZW4gbWVt
b3J5IHJlYWxsb2MgY2FsbHMgYWdhaW5zdCBtdWx0aXBsaWNhdGlvbiBvdmVyZmxvdwogIG9mIHNp
emVfdCBpbiBhcmd1bWVudHMuIFNwZWNpZmljYWxseSwgdGhpcyBhZGRyZXNzZXMgcGFydCBvZiBi
dWcgMzg5IHdpdGggcG9zc2libGUKICBhcHBsaWNhdGlvbiBhYnVzZSBvZiBtcGcxMjNfc2V0X2lu
ZGV4NjQoKS4gKGJ1ZyAzODkgYnkgQWxlamFuZHJvIFJhbW9zKQotIGxpYm1wZzEyMzoKLS0gRml4
IHBvc3NpYmxlIHVzZSBvZiB1bmluaXRpYWxpemVkIHZhbHVlcyBpbiBsYXllciBJSUkgZGVxdWFu
dGl6YXRpb24uCiAgIElJSV9kZXF1YW50aXplX3NhbXBsZSgpIGZvciBjb25zaXN0ZW50IG91dHB1
dCBhbHNvIGZvciBzdHJhbmdlIGlucHV0LiBUaGUgbmV3CiAgIGNvZGUgc2VlbXMgdG8gYmUgc2xp
Z2h0bHkgZmFzdGVyIGFmdGVyIHNvbWUgcmVhcnJhbmdlbWVudHMuCiAgICh0aGFua3MgdG8gSGUg
SHVhbmcsIFN3aW5idXJuZSBVbml2ZXJzaXR5IG9mIFRlY2hub2xvZ3kgKGRpc2NvdmVyZWQgdXNp
bmcKICAgTmV4dXNTYW4pKQotLSBGaXggYSBkb3VibGUgZnJlZSB3aGVuIGRlbGV0aW5nIGEgaGFu
ZGxlIGFmdGVyIGZhaWxlZCBtcGcxMjNfZGVjb2RlcigpIGNhbGwKICAgKHBvc3NpYmx5IGFtb25n
IG90aGVycykuIChidWcgMzg5KQotLSBNb3JlIHN0cm9uZyB3b3JkaW5nIGluIEFQSSB0aGF0IElE
MyB0ZXh0IGNvbnZlbmllbmNlIGxpbmtzIGFyZSBzaG9ydC1saXZlZCwKICAgYnV0IHNhZmVndWFy
ZCBhZ2FpbnN0IGlnbm9yYW50IHVzZSBieSBudWxsaW5nIHRoZW0gZWFybHkuCiAgIChidWcgMzg5
KQotLSBQcmV2ZW50IGRvdWJsZSBmcmVlIGluIG1wZzEyM19zZXRfaW5kZXgoKSAzMiBiaXQgd3Jh
cHBlciBiZWluZyBjYWxsZWQgd2l0aAogICBpbmRleCBzaXplIDAuIChidWcgMzkyKQotLSBIYXJk
ZW4gYWdhaW5zdCBhbiBhcHBsaWNhdGlvbiB3aWVsZGluZyBhIGZvb3QgZ3VuIGJ5IGhhbmRpbmcg
aW4gYW4gdW5kZXJzaXplZAogICBkZWNvZGluZyBidWZmZXIgYmV0d2VlIHNlZWsgYW5kIHJlYWQg
KHJldHVybiBlcnJvciBiZWZvcmUgdHJ5aW5nIHRvIGRlY29kZQogICBhbmQgZGlzY2FyZCBmcmFt
ZXMgaW4gdGhhdCBjYXNlKS4gKGJ1ZyAzOTIpCi0tIERvIHByb3Blcmx5IHRlcm1pbmF0ZSBJRDN2
MiB0ZXh0cyBjb21pbmcgaW4gVVRGMTYgZW5jb2Rpbmcgd2hlbiB0aGV5IG92ZXJ3cml0ZQogICBw
cmV2aW91cyBmcmFtZXMsIGxpa2Ugd2l0aCBvdGhlciBlbmNvZGluZ3MuIFRoZSBzeW1wdG9tIHdh
cyBhIHNob3J0ZXIgc2Vjb25kCiAgIGZyYW1lIHJlc3VsdGluZyBpbiBhIGNvbWJpbmVkIHRleHQg
d2l0aCB0aGUgZWFybGllciBsb25nZXIgZnJhbWUuCiAgIChidWcgMzkyKQotLSBDaGVjayBhbmQg
cHJvcGVybHkgaGFuZGxlIG51bGwgc291cmNlIGJ1ZmZlciBhbmQgemVybyBzaXplIGluIG1wZzEy
M19zdG9yZV91dGY4KCkKICAgaW5zdGVhZCBvZiByZWFkaW5nIHBhc3QgKGJlZm9yZSkgYnVmZmVy
cy4gKGJ1ZyAzOTIpCi0tIEVuc3VyZSBjbGllbnRzIGdldCBJRDN2MSBkYXRhIHdpdGggKHVubW90
aXZhdGVkKSBtcGcxMjNfaWQzX3JhdygpCiAgIG9ubHkgaWYgdGhlIHBhcnNlciBkZWNpZGVkIHRo
YXQgaXQgaXMgdGhlcmUsIG5vdCBwb3NzaWJseSB0aGUgbGFzdCAxMjggYnl0ZXMgb2YKICAgYSBz
ZWVrYWJsZSBzdHJlYW0gd2l0aG91dCBJRDN2MSB0YWcuIChidWcgMzkyKQotLSBQcmV2ZW50IGlt
cG9zc2libGUgTgoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyAzMDAwIGNoYXJh
Y3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0YWNobWVudCB0
byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLi9tcGcxMjMve21wZzEyM18xLjMzLjYuYmIgPT4gbXBn
MTIzXzEuMzMuNy5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L21wZzEyMy97bXBnMTIzXzEuMzMuNi5iYiA9PiBtcGcxMjNfMS4zMy43LmJifSAoOTYlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcxMjNfMS4zMy42LmJi
IGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbXBnMTIzL21wZzEyM18xLjMzLjcuYmIKc2ltaWxh
cml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbXBnMTIz
L21wZzEyM18xLjMzLjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEy
My9tcGcxMjNfMS4zMy43LmJiCmluZGV4IDdmYTA0OGM5ZmMuLjAwMmM0ZjFjYzYgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcxMjNfMS4zMy42LmJiCisrKyBi
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcxMjNfMS4zMy43LmJiCkBAIC0xMCw3
ICsxMCw3IEBAIExJQ0VOU0UgPSAiTEdQTC0yLjEtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PWU3YjljMTVmY2ZiOTg2YWJiNGNjNWU4NDAwYTI0MTY5IgogCiBT
UkNfVVJJID0gImh0dHBzOi8vd3d3Lm1wZzEyMy5kZS9kb3dubG9hZC8ke0JQfS50YXIuYnoyIgot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjkyOWE3YzE4YmE2NjJiODkyN2FlZDRkZTIyOWFkOWFlOGFi
MmI0ODA2ZGQwZjMwYjkwMTEzZWIxYjRlMjE5NWEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzFk
MGUzNWE0Y2E1NjdlYzliNWViZGE2YzMwNjJiYjQ0MzVkNmQzZWFjZDZlZjBkOTVjYWRkNzg1NGRj
MDNlZSIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAibXBnMTIzLSg/UDxwdmVyPlxkKyhcLlxk
KykrKVwudGFyIgogCi0tIAoyLjQ3LjEKCg==

--===============5251059944324051677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mpg123: SRC_URI changed from "https://www.mpg123.de/download/mpg123-1.33.6.tar.bz2" to "https://www.mpg123.de/download/mpg123-1.33.7.tar.bz2"
packages/x86-64-v3-poky-linux/mpg123: PKGV changed from 1.33.6 [default] to 1.33.7 [default]
packages/x86-64-v3-poky-linux/mpg123: PV changed from "1.33.6" to "1.33.7"
packages/x86-64-v3-poky-linux/mpg123/mpg123-dbg: PKGSIZE changed from 2640648 to 2649672 (+0%)
packages/x86-64-v3-poky-linux/mpg123/mpg123-dbg: PKGV changed from 1.33.6 [default] to 1.33.7 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-dbg: PV changed from "1.33.6" to "1.33.7"
packages/x86-64-v3-poky-linux/mpg123/mpg123-dev: PKGSIZE changed from 197209 to 197706 (+0%)
packages/x86-64-v3-poky-linux/mpg123/mpg123-dev: PKGV changed from 1.33.6 [default] to 1.33.7 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-dev: PV changed from "1.33.6" to "1.33.7"
packages/x86-64-v3-poky-linux/mpg123/mpg123-doc: PKGV changed from 1.33.6 [default] to 1.33.7 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-doc: PV changed from "1.33.6" to "1.33.7"
packages/x86-64-v3-poky-linux/mpg123/mpg123-locale: PKGV changed from 1.33.6 [default] to 1.33.7 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-locale: PV changed from "1.33.6" to "1.33.7"
packages/x86-64-v3-poky-linux/mpg123/mpg123-src: PKGSIZE changed from 1918426 to 1922933 (+0%)
packages/x86-64-v3-poky-linux/mpg123/mpg123-src: PKGV changed from 1.33.6 [default] to 1.33.7 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-src: FILELIST: directory renamed /usr/src/debug/mpg123/1.33.6/src -> /usr/src/debug/mpg123/1.33.7/src, directory renamed /usr/src/debug/mpg123/1.33.6/src/compat -> /usr/src/debug/mpg123/1.33.7/src/compat, directory renamed /usr/src/debug/mpg123/1.33.6/src/libout123/modules -> /usr/src/debug/mpg123/1.33.7/src/libout123/modules, directory renamed /usr/src/debug/mpg123/1.33.6/src/include -> /usr/src/debug/mpg123/1.33.7/src/include, directory renamed /usr/src/debug/mpg123/1.33.6/src/libmpg123 -> /usr/src/debug/mpg123/1.33.7/src/libmpg123, directory renamed /usr/src/debug/mpg123/1.33.6/src/libout123 -> /usr/src/debug/mpg123/1.33.7/src/libout123, directory renamed /usr/src/debug/mpg123/1.33.6/src/libsyn123 -> /usr/src/debug/mpg123/1.33.7/src/libsyn123, directory renamed /usr/src/debug/mpg123/1.33.6/src/common -> /usr/src/debug/mpg123/1.33.7/src/common
packages/x86-64-v3-poky-linux/mpg123/mpg123-src: PV changed from "1.33.6" to "1.33.7"
packages/x86-64-v3-poky-linux/mpg123/mpg123-staticdev: PKGV changed from 1.33.6 [default] to 1.33.7 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-staticdev: PV changed from "1.33.6" to "1.33.7"
packages/x86-64-v3-poky-linux/mpg123/mpg123: PKGSIZE changed from 1034767 to 1042959 (+1%)
packages/x86-64-v3-poky-linux/mpg123/mpg123: PKGV changed from 1.33.6 [default] to 1.33.7 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123: PV changed from "1.33.6" to "1.33.7"

--===============5251059944324051677==--

