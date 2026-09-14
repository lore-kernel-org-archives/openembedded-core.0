Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E279C88E6E
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 05:40:46 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13724.1789364445168761078
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 22:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aZRCdtqy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Y4kSdB1F;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a09e6e9cdf-6bb80328-cec3-4952-a525-9f86144eb042-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789364444;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=iG+shAPlNPuxxG1PQCEbeWzU1YbYyOPsbPbGtXfcwHI=;
	b=aZRCdtqyFdJfc4rJwGlVr47PZUDnvOjhWXBSW9NJD1YQuMeVEsXqibUetJ3K7KcH
	5avc7z4OXDDbjSQp8GgubiX9UCZkoev7u3wJ6r7OvPs/1kTsOeR06hYqZsJ5S9YHyWN
	QBZ91rMD0GX/b2sbvU3nN+pbNKLIfh1ry5RbhxsY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789364444;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=iG+shAPlNPuxxG1PQCEbeWzU1YbYyOPsbPbGtXfcwHI=;
	b=Y4kSdB1FLgCuBtEuvaO4mGrHRFolqQ3pxrhLgGcaL9G9IWolWGG/LQQcztBFOJ8K
	S9Xag1AX8TDzvEuNfjUBX6mh01qum4fI1VbkTeP3myLM1UrCINOA+4erano1+dkfACw
	x62u74AnlGvLx1jFdDHcNiR12ossAgoa0oNLHxtU=
Content-Type: multipart/mixed; boundary="===============4241746844100500320=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] gsettings-desktop-schemas: upgrading to 51.0 SUCCEEDED
Message-ID: <010101a09e6e9cdf-6bb80328-cec3-4952-a525-9f86144eb042-000000@us-west-2.amazonses.com>
Date: Mon, 14 Sep 2026 05:40:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.14-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 05:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245754

--===============4241746844100500320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gsettings-desktop-schemas* to *51.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gsettings-desktop-schemas-upgrade-50.1-51.0.patch
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
From 7d725bb2c317652ced045eba87bdeb7a0a62c4e2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 14 Sep 2026 05:40:15 +0000
Subject: [PATCH] gsettings-desktop-schemas: upgrade 50.1 -> 51.0

Source: NEWS

Major changes in 51.0
=====================
- Translation updates

Major changes in 51.rc
======================
- Added setting for custom pointer acceleration profile
- Remove gconf schema migration files
- Translation updates

Major changes in 51.beta
========================
- Add setting to configure the focus ring visibility timeout
- Add 'orientation-lock' setting to take over the g-s-d setting
- Translation updates

Major changes in 51.alpha
=========================
- Translation updates
- Add scroll speed setting for touchpads
- Add the ability to enable button scrolling on a mouse
- Increase default maximum thumbnail cache from 512MB to 2GB
---
 ...esktop-schemas_50.1.bb => gsettings-desktop-schemas_51.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_50.1.bb => gsettings-desktop-schemas_51.0.bb} (84%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb
similarity index 84%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb
index 1edb548ad6..e02c082b00 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb
@@ -11,4 +11,4 @@ DEPENDS = "glib-2.0"
 
 inherit gnomebase gsettings gobject-introspection gettext
 
-SRC_URI[archive.sha256sum] = "0a2aa25082672585d16fcdab61c7b0e33f035fb87476505c794f29565afa485b"
+SRC_URI[archive.sha256sum] = "1e2419a5f21d26c324b28ae1c00e29e9175e8b596fff385a04c2172b36652226"
-- 
2.47.1


--===============4241746844100500320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="gsettings-desktop-schemas-changelog.txt"

Changelog for gsettings-desktop-schemas: 50.1 -> 51.0
Source: NEWS

Major changes in 51.0
=====================
- Translation updates

Major changes in 51.rc
======================
- Added setting for custom pointer acceleration profile
- Remove gconf schema migration files
- Translation updates

Major changes in 51.beta
========================
- Add setting to configure the focus ring visibility timeout
- Add 'orientation-lock' setting to take over the g-s-d setting
- Translation updates

Major changes in 51.alpha
=========================
- Translation updates
- Add scroll speed setting for touchpads
- Add the ability to enable button scrolling on a mouse
- Increase default maximum thumbnail cache from 512MB to 2GB

--===============4241746844100500320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-be: PKGSIZE changed from 26476 to 48500 (+83%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas: FILELIST: removed "/usr/share/GConf/gsettings/wm-schemas.convert /usr/share/GConf/gsettings/gsettings-desktop-schemas.convert"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas: PACKAGES: added "gsettings-desktop-schemas-locale-lo gsettings-desktop-schemas-locale-th gsettings-desktop-schemas-locale-sat"
Changes to packages/x86-64-v3-poky-linux/gsettings-desktop-schemas (sysroot):
  /usr/share/GConf was removed
  /usr/share/GConf/gsettings was removed
  /usr/share/GConf/gsettings/gsettings-desktop-schemas.convert was removed
  /usr/share/GConf/gsettings/wm-schemas.convert was removed

--===============4241746844100500320==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gsettings-desktop-schemas-upgrade-50.1-51.0.patch"

RnJvbSA3ZDcyNWJiMmMzMTc2NTJjZWQwNDVlYmE4N2JkZWI3YTBhNjJjNGUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTQgU2VwIDIwMjYgMDU6NDA6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzOiB1cGdyYWRlIDUwLjEgLT4gNTEuMAoKU291cmNlOiBO
RVdTCgpNYWpvciBjaGFuZ2VzIGluIDUxLjAKPT09PT09PT09PT09PT09PT09PT09Ci0gVHJhbnNs
YXRpb24gdXBkYXRlcwoKTWFqb3IgY2hhbmdlcyBpbiA1MS5yYwo9PT09PT09PT09PT09PT09PT09
PT09Ci0gQWRkZWQgc2V0dGluZyBmb3IgY3VzdG9tIHBvaW50ZXIgYWNjZWxlcmF0aW9uIHByb2Zp
bGUKLSBSZW1vdmUgZ2NvbmYgc2NoZW1hIG1pZ3JhdGlvbiBmaWxlcwotIFRyYW5zbGF0aW9uIHVw
ZGF0ZXMKCk1ham9yIGNoYW5nZXMgaW4gNTEuYmV0YQo9PT09PT09PT09PT09PT09PT09PT09PT0K
LSBBZGQgc2V0dGluZyB0byBjb25maWd1cmUgdGhlIGZvY3VzIHJpbmcgdmlzaWJpbGl0eSB0aW1l
b3V0Ci0gQWRkICdvcmllbnRhdGlvbi1sb2NrJyBzZXR0aW5nIHRvIHRha2Ugb3ZlciB0aGUgZy1z
LWQgc2V0dGluZwotIFRyYW5zbGF0aW9uIHVwZGF0ZXMKCk1ham9yIGNoYW5nZXMgaW4gNTEuYWxw
aGEKPT09PT09PT09PT09PT09PT09PT09PT09PQotIFRyYW5zbGF0aW9uIHVwZGF0ZXMKLSBBZGQg
c2Nyb2xsIHNwZWVkIHNldHRpbmcgZm9yIHRvdWNocGFkcwotIEFkZCB0aGUgYWJpbGl0eSB0byBl
bmFibGUgYnV0dG9uIHNjcm9sbGluZyBvbiBhIG1vdXNlCi0gSW5jcmVhc2UgZGVmYXVsdCBtYXhp
bXVtIHRodW1ibmFpbCBjYWNoZSBmcm9tIDUxMk1CIHRvIDJHQgotLS0KIC4uLmVza3RvcC1zY2hl
bWFzXzUwLjEuYmIgPT4gZ3NldHRpbmdzLWRlc2t0b3Atc2NoZW1hc181MS4wLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1nbm9tZS9nc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzL3tnc2V0dGluZ3MtZGVz
a3RvcC1zY2hlbWFzXzUwLjEuYmIgPT4gZ3NldHRpbmdzLWRlc2t0b3Atc2NoZW1hc181MS4wLmJi
fSAoODQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9nc2V0dGluZ3MtZGVza3Rv
cC1zY2hlbWFzL2dzZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXNfNTAuMS5iYiBiL21ldGEvcmVjaXBl
cy1nbm9tZS9nc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzL2dzZXR0aW5ncy1kZXNrdG9wLXNjaGVt
YXNfNTEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
Z25vbWUvZ3NldHRpbmdzLWRlc2t0b3Atc2NoZW1hcy9nc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFz
XzUwLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1nbm9tZS9nc2V0dGluZ3MtZGVza3RvcC1z
Y2hlbWFzL2dzZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXNfNTEuMC5iYgppbmRleCAxZWRiNTQ4YWQ2
Li5lMDJjMDgyYjAwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3NldHRpbmdzLWRl
c2t0b3Atc2NoZW1hcy9nc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzXzUwLjEuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdub21lL2dzZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXMvZ3NldHRpbmdzLWRlc2t0
b3Atc2NoZW1hc181MS4wLmJiCkBAIC0xMSw0ICsxMSw0IEBAIERFUEVORFMgPSAiZ2xpYi0yLjAi
CiAKIGluaGVyaXQgZ25vbWViYXNlIGdzZXR0aW5ncyBnb2JqZWN0LWludHJvc3BlY3Rpb24gZ2V0
dGV4dAogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICIwYTJhYTI1MDgyNjcyNTg1ZDE2
ZmNkYWI2MWM3YjBlMzNmMDM1ZmI4NzQ3NjUwNWM3OTRmMjk1NjVhZmE0ODViIgorU1JDX1VSSVth
cmNoaXZlLnNoYTI1NnN1bV0gPSAiMWUyNDE5YTVmMjFkMjZjMzI0YjI4YWUxYzAwZTI5ZTkxNzVl
OGI1OTZmZmYzODVhMDRjMjE3MmIzNjY1MjIyNiIKLS0gCjIuNDcuMQoK

--===============4241746844100500320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dbg: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dbg: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dev: PKGSIZE changed from 34011 to 34939 (+3%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dev: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dev: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-doc: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-doc: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ab: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ab: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-as: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-as: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-be: PKGSIZE changed from 26476 to 48500 (+83%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-be: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-be: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bg: PKGSIZE changed from 161652 to 162134 (+0%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bg: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bg: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bs: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bs: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca+valencia: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca+valencia: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca: PKGSIZE changed from 124245 to 124858 (+0%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-cs: PKGSIZE changed from 121575 to 121873 (+0%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-cs: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-cs: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-da: PKGSIZE changed from 116086 to 116578 (+0%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-da: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-da: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-de: PKGSIZE changed from 122999 to 124153 (+1%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-de: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-de: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-el: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-el: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-en-gb: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-en-gb: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-en-us: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-en-us: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eo: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eo: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-es: PKGSIZE changed from 123448 to 123983 (+0%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-es: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-es: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eu: PKGSIZE changed from 121007 to 120915 (-0%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eu: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eu: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fa: PKGSIZE changed from 118562 to 119441 (+1%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fa: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fa: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fi: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fi: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fr: PKGSIZE changed from 131004 to 131742 (+1%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fr: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fr: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fur: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fur: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gl: PKGSIZE changed from 121857 to 123025 (+1%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gl: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gl: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gu: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gu: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-he: PKGSIZE changed from 114099 to 114927 (+1%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-he: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-he: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hi: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hi: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hr: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hr: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hu: PKGSIZE changed from 125762 to 126232 (+0%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hu: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hu: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-id: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-id: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-is: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-is: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-it: PKGSIZE changed from 111153 to 122121 (+10%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-it: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-it: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ja: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ja: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ka: PKGSIZE changed from 199650 to 199864 (+0%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ka: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ka: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-kab: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-kab: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-kk: PKGSIZE changed from 156862 to 157469 (+0%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-kk: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-kk: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lt: PKGSIZE changed from 116925 to 117272 (+0%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lt: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lt: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lv: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lv: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ml: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ml: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ms: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ms: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nb: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nb: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ne: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ne: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nl: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nl: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-oc: PKGSIZE changed from 126394 to 126838 (+0%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-oc: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-oc: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-or: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-or: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pa: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pa: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pl: PKGSIZE changed from 123593 to 124612 (+1%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pl: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pl: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt-br: PKGSIZE changed from 121749 to 122264 (+0%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt-br: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt-br: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ro: PKGSIZE changed from 123964 to 124471 (+0%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ro: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ro: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ru: PKGSIZE changed from 161849 to 162202 (+0%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ru: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ru: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sk: PKGSIZE changed from 120343 to 120040 (-0%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sk: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sk: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sl: PKGSIZE changed from 115370 to 115728 (+0%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sl: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sl: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr+latin: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr+latin: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr: PKGSIZE changed from 156353 to 156808 (+0%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sv: PKGSIZE changed from 118921 to 119240 (+0%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sv: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sv: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tg: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tg: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tr: PKGSIZE changed from 123145 to 123438 (+0%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tr: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tr: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ug: PKGSIZE changed from 161720 to 158604 (-2%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ug: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ug: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-uk: PKGSIZE changed from 161916 to 162077 (+0%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-uk: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-uk: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-uz: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-uz: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-vi: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-vi: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-cn: PKGSIZE changed from 106739 to 107073 (+0%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-cn: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-cn: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-hk: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-hk: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-tw: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-tw: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-src: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-src: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-staticdev: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-staticdev: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas: PKGSIZE changed from 165407 to 158755 (-4%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas: FILELIST: removed "/usr/share/GConf/gsettings/gsettings-desktop-schemas.convert /usr/share/GConf/gsettings/wm-schemas.convert"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas: PKGV changed from 50.1 [default] to 51.0 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas: PACKAGES: added "gsettings-desktop-schemas-locale-th gsettings-desktop-schemas-locale-lo gsettings-desktop-schemas-locale-sat"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas: SRC_URI changed from "https://download.gnome.org/sources//gsettings-desktop-schemas/50/gsettings-desktop-schemas-50.1.tar.xz;name=archive" to "https://download.gnome.org/sources//gsettings-desktop-schemas/51/gsettings-desktop-schemas-51.0.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas: PV changed from "50.1" to "51.0"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas: PKGV changed from 50.1 [default] to 51.0 [default]
Changes to packages/x86-64-v3-poky-linux/gsettings-desktop-schemas (sysroot):
  /usr/share/GConf was removed
  /usr/share/GConf/gsettings was removed
  /usr/share/GConf/gsettings/gsettings-desktop-schemas.convert was removed
  /usr/share/GConf/gsettings/wm-schemas.convert was removed

--===============4241746844100500320==--

