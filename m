Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5505CCF2D1
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 05:33:58 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9658.1792301632380556751
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 22:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OEkqf0Zd;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=wMXZ8JGi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a14d8088c2-6896181b-8f28-4127-94c5-4daa847665ed-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792301631;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=RdggFAs34HiazP/aaAcE9vXFvUQvcSl2rB4C3//5cj0=;
	b=OEkqf0Zd5uNilIPnHPqR6XCfbrfeABSD2lp9AJpVA8UMwJby6BoWTdWyWXLjTy1N
	gOf6b5QPYQflbEBXVGlLMU7hCkji0h0tzgYZBZeCuxwYuWp2tbwx3CjU7Lf89xF4g7I
	9k1nukxuUyeQCfjBnmZDLTGgkQdHjFlxK8KvkWJw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792301631;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=RdggFAs34HiazP/aaAcE9vXFvUQvcSl2rB4C3//5cj0=;
	b=wMXZ8JGikt5Mw0cwm2ODy+dUauy0fPliQzX3M3wQOq9DXzY58Ndx4E4FZawnKYGX
	R36QtSzi4KWF8BDT9wizazEe7zdKL5/QcugQTVOhxvuh7dJvd4349vklVsMtZXqI7tK
	T0CNsuZhXRfcZoNc0Y6IPyyaLo3QPXbzJ5OkqG58=
Content-Type: multipart/mixed; boundary="===============1992011326163145552=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libnotify: upgrading to 0.8.9 SUCCEEDED
Message-ID: <010101a14d8088c2-6896181b-8f28-4127-94c5-4daa847665ed-000000@us-west-2.amazonses.com>
Date: Sun, 18 Oct 2026 05:33:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2026 05:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248105

--===============1992011326163145552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libnotify* to *0.8.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libnotify-upgrade-0.8.8-0.8.9.patch
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
From 9c0dffff823b7ed648d7856da5a32faa22e2fe7c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 18 Oct 2026 05:33:44 +0000
Subject: [PATCH] libnotify: upgrade 0.8.8 -> 0.8.9

New in 0.8.9
============

This is a maintenance release, mostly with bug fixes around notify-send
behaviors and portal notifications, together with more tests coverage for
hints edge cases, and some library cleanups.

Contributors:
  Cajus Pollmeier, Logan Rathbone, Marco Trevisan
---
 .../libnotify/{libnotify_0.8.8.bb => libnotify_0.8.9.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.8.8.bb => libnotify_0.8.9.bb} (93%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb b/meta/recipes-gnome/libnotify/libnotify_0.8.9.bb
similarity index 93%
rename from meta/recipes-gnome/libnotify/libnotify_0.8.8.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.8.9.bb
index c3f71dec4a..1f0653d2ed 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.8.9.bb
@@ -20,7 +20,7 @@ inherit gnomebase gi-docgen features_check gobject-introspection
 # depends on gtk+3 if tests are enabled
 ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
 
-SRC_URI[archive.sha256sum] = "23420ef619dc2cb5aebad613f4823a2fa41c07e5a1d05628d40f6ec4b35bfddd"
+SRC_URI[archive.sha256sum] = "c906bb084027ea512f94a60fbfc0cc8d4f17e4b4d525bed370d07a6d8714c923"
 
 EXTRA_OEMESON = "-Dman=false"
 
-- 
2.47.1


--===============1992011326163145552==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libnotify-upgrade-0.8.8-0.8.9.patch"

RnJvbSA5YzBkZmZmZjgyM2I3ZWQ2NDhkNzg1NmRhNWEzMmZhYTIyZTJmZTdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTggT2N0IDIwMjYgMDU6MzM6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJub3RpZnk6IHVwZ3JhZGUgMC44LjggLT4gMC44LjkKCk5ldyBpbiAwLjguOQo9PT09PT09PT09
PT0KClRoaXMgaXMgYSBtYWludGVuYW5jZSByZWxlYXNlLCBtb3N0bHkgd2l0aCBidWcgZml4ZXMg
YXJvdW5kIG5vdGlmeS1zZW5kCmJlaGF2aW9ycyBhbmQgcG9ydGFsIG5vdGlmaWNhdGlvbnMsIHRv
Z2V0aGVyIHdpdGggbW9yZSB0ZXN0cyBjb3ZlcmFnZSBmb3IKaGludHMgZWRnZSBjYXNlcywgYW5k
IHNvbWUgbGlicmFyeSBjbGVhbnVwcy4KCkNvbnRyaWJ1dG9yczoKICBDYWp1cyBQb2xsbWVpZXIs
IExvZ2FuIFJhdGhib25lLCBNYXJjbyBUcmV2aXNhbgotLS0KIC4uLi9saWJub3RpZnkve2xpYm5v
dGlmeV8wLjguOC5iYiA9PiBsaWJub3RpZnlfMC44LjkuYmJ9ICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1nbm9tZS9saWJub3RpZnkve2xpYm5vdGlmeV8wLjguOC5iYiA9PiBsaWJub3RpZnlfMC44
LjkuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYm5vdGlmeS9s
aWJub3RpZnlfMC44LjguYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGlibm90aWZ5L2xpYm5vdGlm
eV8wLjguOS5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
Z25vbWUvbGlibm90aWZ5L2xpYm5vdGlmeV8wLjguOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWdub21lL2xpYm5vdGlmeS9saWJub3RpZnlfMC44LjkuYmIKaW5kZXggYzNmNzFkZWM0YS4uMWYw
NjUzZDJlZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYm5vdGlmeS9saWJub3Rp
ZnlfMC44LjguYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYm5vdGlmeS9saWJub3RpZnlf
MC44LjkuYmIKQEAgLTIwLDcgKzIwLDcgQEAgaW5oZXJpdCBnbm9tZWJhc2UgZ2ktZG9jZ2VuIGZl
YXR1cmVzX2NoZWNrIGdvYmplY3QtaW50cm9zcGVjdGlvbgogIyBkZXBlbmRzIG9uIGd0ayszIGlm
IHRlc3RzIGFyZSBlbmFibGVkCiBBTllfT0ZfRElTVFJPX0ZFQVRVUkVTID0gIiR7QGJiLnV0aWxz
LmNvbnRhaW5zKCdQQUNLQUdFQ09ORklHJywgJ3Rlc3RzJywgJyR7R1RLM0RJU1RST0ZFQVRVUkVT
fScsICcnLCBkKX0iCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjIzNDIwZWY2MTlk
YzJjYjVhZWJhZDYxM2Y0ODIzYTJmYTQxYzA3ZTVhMWQwNTYyOGQ0MGY2ZWM0YjM1YmZkZGQiCitT
UkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJjOTA2YmIwODQwMjdlYTUxMmY5NGE2MGZiZmMw
Y2M4ZDRmMTdlNGI0ZDUyNWJlZDM3MGQwN2E2ZDg3MTRjOTIzIgogCiBFWFRSQV9PRU1FU09OID0g
Ii1EbWFuPWZhbHNlIgogCi0tIAoyLjQ3LjEKCg==

--===============1992011326163145552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libnotify-changelog.txt"

New in 0.8.9
============

This is a maintenance release, mostly with bug fixes around notify-send
behaviors and portal notifications, together with more tests coverage for
hints edge cases, and some library cleanups.

Contributors:
  Cajus Pollmeier, Logan Rathbone, Marco Trevisan

--===============1992011326163145552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libnotify: PV changed from "0.8.8" to "0.8.9"
packages/x86-64-v3-poky-linux/libnotify: SRC_URI changed from "https://download.gnome.org/sources//libnotify/0.8/libnotify-0.8.8.tar.xz;name=archive" to "https://download.gnome.org/sources//libnotify/0.8/libnotify-0.8.9.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/libnotify: PKGV changed from 0.8.8 [default] to 0.8.9 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-dbg: PKGSIZE changed from 194432 to 194128 (-0%)
packages/x86-64-v3-poky-linux/libnotify/libnotify-dbg: PV changed from "0.8.8" to "0.8.9"
packages/x86-64-v3-poky-linux/libnotify/libnotify-dbg: PKGV changed from 0.8.8 [default] to 0.8.9 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-dev: PV changed from "0.8.8" to "0.8.9"
packages/x86-64-v3-poky-linux/libnotify/libnotify-dev: PKGV changed from 0.8.8 [default] to 0.8.9 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-doc: PV changed from "0.8.8" to "0.8.9"
packages/x86-64-v3-poky-linux/libnotify/libnotify-doc: PKGV changed from 0.8.8 [default] to 0.8.9 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-locale: PV changed from "0.8.8" to "0.8.9"
packages/x86-64-v3-poky-linux/libnotify/libnotify-locale: PKGV changed from 0.8.8 [default] to 0.8.9 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-src: PKGSIZE changed from 134278 to 133579 (-1%)
packages/x86-64-v3-poky-linux/libnotify/libnotify-src: PV changed from "0.8.8" to "0.8.9"
packages/x86-64-v3-poky-linux/libnotify/libnotify-src: PKGV changed from 0.8.8 [default] to 0.8.9 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-src: FILELIST: directory renamed /usr/src/debug/libnotify/0.8.8/libnotify -> /usr/src/debug/libnotify/0.8.9/libnotify, directory renamed /usr/src/debug/libnotify/0.8.8/tools -> /usr/src/debug/libnotify/0.8.9/tools
packages/x86-64-v3-poky-linux/libnotify/libnotify-staticdev: PV changed from "0.8.8" to "0.8.9"
packages/x86-64-v3-poky-linux/libnotify/libnotify-staticdev: PKGV changed from 0.8.8 [default] to 0.8.9 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify: PV changed from "0.8.8" to "0.8.9"
packages/x86-64-v3-poky-linux/libnotify/libnotify: PKGV changed from 0.8.8 [default] to 0.8.9 [default]

--===============1992011326163145552==--

