Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 012F5C282D5
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:35 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.8052.1739623332341286779
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hA3CIYn7;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JGLfEf65;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019509a1a811-bdc9f534-3e1d-4f38-8781-ea807296b7a1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6UK4z3Wk9Jj9pJm+VJi+2T6Zv8q2x521jOJQjisdcbc=;
	b=hA3CIYn7HRVetzreCgOPOx5845kZFXtz5XyeD3ZAlpP5E6jWxdvgh/8wtPnRZZt/
	674xWuNOrchMGIsbjP28fSjPp9D1T5pFznafIH9s/IcfKU+3TcB98PfzzKX3J/Re0Mg
	SNcF8adTmGEpwN8kc1tTbBSy4g6onxUGq2hOW0Jo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6UK4z3Wk9Jj9pJm+VJi+2T6Zv8q2x521jOJQjisdcbc=;
	b=JGLfEf65i8AJdie5RBdtibToz0nyqvRYMNTKDXFA6ooNtQkxMcfr35jMa4FMvq68
	ge+/PTCTI7j0O5sdhDnIzJXRsXM7zzyyCXTZJYrQzYFCvyfotEIvQtjjwjIQ8C9QQIx
	tHk0y5TW5zjcNqW324B9WvZWmGA3bfK1JB2Q+f3A=
Content-Type: multipart/mixed; boundary="===============7418821341065250331=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gcr: upgrading to 4.3.91 SUCCEEDED
Message-ID: <0101019509a1a811-bdc9f534-3e1d-4f38-8781-ea807296b7a1-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211447

--===============7418821341065250331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gcr* to *4.3.91* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gcr-upgrade-4.3.0-4.3.91.patch
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
From 140f4ed83e67e3386fcc648c7be73decd509a419 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 09:22:05 +0000
Subject: [PATCH] gcr: upgrade 4.3.0 -> 4.3.91

---
 meta/recipes-gnome/gcr/{gcr_4.3.0.bb => gcr_4.3.91.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gcr/{gcr_4.3.0.bb => gcr_4.3.91.bb} (95%)

diff --git a/meta/recipes-gnome/gcr/gcr_4.3.0.bb b/meta/recipes-gnome/gcr/gcr_4.3.91.bb
similarity index 95%
rename from meta/recipes-gnome/gcr/gcr_4.3.0.bb
rename to meta/recipes-gnome/gcr/gcr_4.3.91.bb
index dcd8658d9c..a76e8d486a 100644
--- a/meta/recipes-gnome/gcr/gcr_4.3.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.3.91.bb
@@ -18,7 +18,7 @@ inherit gnomebase gtk-icon-cache gi-docgen features_check vala gobject-introspec
 
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)}"
 
-SRC_URI[archive.sha256sum] = "c3ee8728e4364b0397f435fa20f92f901ab139d2b264f4e059d67b3c0f43cd36"
+SRC_URI[archive.sha256sum] = "9d326ed3d78ad0eafb0848395a068adbefdeb6cff04ec5615cb3ef767d933990"
 
 PACKAGECONFIG ??= " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
-- 
2.44.1


--===============7418821341065250331==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gcr-upgrade-4.3.0-4.3.91.patch"

RnJvbSAxNDBmNGVkODNlNjdlMzM4NmZjYzY0OGM3YmU3M2RlY2Q1MDlhNDE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDk6MjI6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
Y3I6IHVwZ3JhZGUgNC4zLjAgLT4gNC4zLjkxCgotLS0KIG1ldGEvcmVjaXBlcy1nbm9tZS9nY3Iv
e2djcl80LjMuMC5iYiA9PiBnY3JfNC4zLjkxLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1nbm9tZS9n
Y3Ive2djcl80LjMuMC5iYiA9PiBnY3JfNC4zLjkxLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1nbm9tZS9nY3IvZ2NyXzQuMy4wLmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2dj
ci9nY3JfNC4zLjkxLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1nbm9tZS9nY3IvZ2NyXzQuMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUv
Z2NyL2djcl80LjMuOTEuYmIKaW5kZXggZGNkODY1OGQ5Yy4uYTc2ZThkNDg2YSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdub21lL2djci9nY3JfNC4zLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWdub21lL2djci9nY3JfNC4zLjkxLmJiCkBAIC0xOCw3ICsxOCw3IEBAIGluaGVyaXQgZ25vbWVi
YXNlIGd0ay1pY29uLWNhY2hlIGdpLWRvY2dlbiBmZWF0dXJlc19jaGVjayB2YWxhIGdvYmplY3Qt
aW50cm9zcGVjCiAKIFJFUVVJUkVEX0RJU1RST19GRUFUVVJFUyA9ICIke0BiYi51dGlscy5jb250
YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3gxMScsICdvcGVuZ2wnLCAnJywgZCl9IgogCi1TUkNf
VVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJjM2VlODcyOGU0MzY0YjAzOTdmNDM1ZmEyMGY5MmY5
MDFhYjEzOWQyYjI2NGY0ZTA1OWQ2N2IzYzBmNDNjZDM2IgorU1JDX1VSSVthcmNoaXZlLnNoYTI1
NnN1bV0gPSAiOWQzMjZlZDNkNzhhZDBlYWZiMDg0ODM5NWEwNjhhZGJlZmRlYjZjZmYwNGVjNTYx
NWNiM2VmNzY3ZDkzMzk5MCIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiBcCiAJJHtAYmIudXRpbHMu
ZmlsdGVyKCdESVNUUk9fRkVBVFVSRVMnLCAnc3lzdGVtZCcsIGQpfSBcCi0tIAoyLjQ0LjEKCg==

--===============7418821341065250331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gcr/gcr-dbg: FILELIST: removed "/usr/lib/.debug/libgck-2.so.2.3.0 /usr/lib/.debug/libgcr-4.so.4.3.0", added "/usr/lib/.debug/libgck-2.so.2.3.91 /usr/lib/.debug/libgcr-4.so.4.3.91"
packages/core2-64-poky-linux/gcr/gcr-dbg: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-dbg: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-dbg: PKGSIZE changed from 2617696 to 2812208 (+7%)
packages/core2-64-poky-linux/gcr/gcr-dev: FILELIST: added "/usr/include/gcr-4/gcr/gcr-certificate-extension-list.h /usr/include/gcr-4/gcr/gcr-certificate-extensions.h /usr/include/gcr-4/gcr/gcr-certificate-extension.h /usr/include/gcr-4/gcr/gcr-subject-public-key-info.h"
packages/core2-64-poky-linux/gcr/gcr-dev: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-dev: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-dev: PKGSIZE changed from 1164540 to 1256063 (+8%)
packages/core2-64-poky-linux/gcr/gcr-doc: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-doc: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ab: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ab: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-af: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-af: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ar: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ar: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-as: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-as: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ast: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ast: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-az: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-az: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-be+latin: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-be+latin: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-be: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-be: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-bg: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-bg: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-bg: PKGSIZE changed from 14442 to 14546 (+1%)
packages/core2-64-poky-linux/gcr/gcr-locale-bn-in: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-bn-in: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-bn: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-bn: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-bs: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-bs: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ca+valencia: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ca+valencia: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ca: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ca: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ckb: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ckb: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-cs: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-cs: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-cs: PKGSIZE changed from 11674 to 11912 (+2%)
packages/core2-64-poky-linux/gcr/gcr-locale-cy: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-cy: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-da: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-da: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-de: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-de: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-dz: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-dz: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-el: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-el: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-el: PKGSIZE changed from 21945 to 14731 (-33%)
packages/core2-64-poky-linux/gcr/gcr-locale-en+shaw: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-en+shaw: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-en-ca: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-en-ca: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-en-gb: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-en-gb: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-en-gb: PKGSIZE changed from 11224 to 11218 (-0%)
packages/core2-64-poky-linux/gcr/gcr-locale-eo: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-eo: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-es: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-es: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-et: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-et: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-eu: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-eu: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-fa: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-fa: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-fa: PKGSIZE changed from 13251 to 13517 (+2%)
packages/core2-64-poky-linux/gcr/gcr-locale-fi: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-fi: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-fr: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-fr: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-fur: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-fur: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ga: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ga: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-gl: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-gl: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-gu: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-gu: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-he: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-he: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-hi: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-hi: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-hi: PKGSIZE changed from 22002 to 15935 (-28%)
packages/core2-64-poky-linux/gcr/gcr-locale-hr: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-hr: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-hu: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-hu: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-id: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-id: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ie: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ie: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-is: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-is: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-it: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-it: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ja: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ja: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ka: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ka: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ka: PKGSIZE changed from 17109 to 17519 (+2%)
packages/core2-64-poky-linux/gcr/gcr-locale-kab: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-kab: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-kab: PKGSIZE changed from 4213 to 6402 (+52%)
packages/core2-64-poky-linux/gcr/gcr-locale-kk: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-kk: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-kn: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-kn: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ko: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ko: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-lt: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-lt: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-lv: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-lv: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-mai: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-mai: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-mg: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-mg: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-mk: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-mk: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ml: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ml: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-mn: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-mn: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-mr: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-mr: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ms: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ms: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-nb: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-nb: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ne: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ne: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ne: PKGSIZE changed from 13348 to 16449 (+23%)
packages/core2-64-poky-linux/gcr/gcr-locale-nl: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-nl: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-nn: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-nn: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-oc: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-oc: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-or: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-or: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-pa: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-pa: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-pl: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-pl: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-pt-br: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-pt-br: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-pt: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-pt: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ro: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ro: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ru: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ru: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ru: PKGSIZE changed from 14540 to 14846 (+2%)
packages/core2-64-poky-linux/gcr/gcr-locale-rw: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-rw: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-si: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-si: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-sk: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-sk: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-sk: PKGSIZE changed from 18051 to 11805 (-35%)
packages/core2-64-poky-linux/gcr/gcr-locale-sl: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-sl: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-sl: PKGSIZE changed from 11467 to 12012 (+5%)
packages/core2-64-poky-linux/gcr/gcr-locale-sq: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-sq: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-sr+latin: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-sr+latin: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-sr+latin: PKGSIZE changed from 15805 to 11493 (-27%)
packages/core2-64-poky-linux/gcr/gcr-locale-sr: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-sr: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-sr: PKGSIZE changed from 11507 to 14045 (+22%)
packages/core2-64-poky-linux/gcr/gcr-locale-sv: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-sv: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ta: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ta: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-te: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-te: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-tg: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-tg: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-th: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-th: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-tr: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-tr: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-ug: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-ug: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-uk: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-uk: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-uk: PKGSIZE changed from 14304 to 14620 (+2%)
packages/core2-64-poky-linux/gcr/gcr-locale-vi: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-vi: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-xh: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-xh: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-zh-cn: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-zh-cn: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-zh-cn: PKGSIZE changed from 10946 to 11155 (+2%)
packages/core2-64-poky-linux/gcr/gcr-locale-zh-hk: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-zh-hk: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-locale-zh-tw: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-locale-zh-tw: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-src: FILELIST: directory renamed /usr/src/debug/gcr/4.3.0/tools/viewer -> /usr/src/debug/gcr/4.3.91/tools/viewer, directory renamed /usr/src/debug/gcr/4.3.0/gck -> /usr/src/debug/gcr/4.3.91/gck, removed "/usr/src/debug/gcr/4.3.0/egg/egg-asn1-defs.h /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate-chain.c /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate-chain.h /usr/src/debug/gcr/4.3.0/gcr/gcr-trust.h /usr/src/debug/gcr/4.3.0/gcr/gcr-types.h /usr/src/debug/gcr/4.3.0/gcr/gcr-trust.c /usr/src/debug/gcr/4.3.0/egg/egg-hkdf.h /usr/src/debug/gcr/4.3.0/gcr/gcr-dbus-generated.h /usr/src/debug/gcr/4.3.0/gcr/gcr-dbus-generated.c /usr/src/debug/gcr/4.3.0/gcr/gcr-import-interaction.c /usr/src/debug/gcr/4.3.0/egg/egg-secure-memory.h /usr/src/debug/gcr/4.3.0/gcr/gcr-pkcs11-certificate.h /usr/src/debug/gcr/4.3.0/egg/egg-secure-memory.c /usr/src/debug/gcr/4.3.0/gcr/gcr-secure-memory.c /usr/src/debug/gcr/4.3.0/gcr/gcr-import-interaction.h /usr/src/debug/gcr/4.3.0/gcr/gcr-p
 kcs11-certificate.c /usr/src/debug/gcr/4.3.0/egg/egg-dn.h /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate.c /usr/src/debug/gcr/4.3.0/gcr/gcr-system-prompter.c /usr/src/debug/gcr/4.3.0/egg/egg-dn.c /usr/src/debug/gcr/4.3.0/gcr/gcr-system-prompter.h /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate.h /usr/src/debug/gcr/4.3.0/egg/egg-crypto-libgcrypt.c /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate-request.h /usr/src/debug/gcr/4.3.0/gcr/gcr-ssh-askpass.c /usr/src/debug/gcr/4.3.0/egg/egg-openssl.c /usr/src/debug/gcr/4.3.0/gcr/gcr-openpgp.c /usr/src/debug/gcr/4.3.0/gcr/gcr-marshal.c /usr/src/debug/gcr/4.3.0/gcr/gcr-openssh.c /usr/src/debug/gcr/4.3.0/egg/egg-openssl.h /usr/src/debug/gcr/4.3.0/gcr/gcr-marshal.h /usr/src/debug/gcr/4.3.0/gcr/gcr-openpgp.h /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate-request.c /usr/src/debug/gcr/4.3.0/gcr/gcr-openssh.h /usr/src/debug/gcr/4.3.0/gcr/gcr-ssh-askpass.h /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate-field-private.h /usr/src/debug/gcr/4.3.0/egg/egg-asn1x.h /us
 r/src/debug/gcr/4.3.0/egg/egg-crypto.h /usr/src/debug/gcr/4.3.0/egg/egg-symkey.h /usr/src/debug/gcr/4.3.0/egg/egg-asn1x.c /usr/src/debug/gcr/4.3.0/egg/egg-symkey.c /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate-field.h /usr/src/debug/gcr/4.3.0/egg/egg-armor.h /usr/src/debug/gcr/4.3.0/egg/egg-armor.c /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate-field.c /usr/src/debug/gcr/4.3.0/egg/egg-oid.h /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate-extensions.h /usr/src/debug/gcr/4.3.0/gcr/gcr-fingerprint.c /usr/src/debug/gcr/4.3.0/gcr/gcr-pkcs11-importer.h /usr/src/debug/gcr/4.3.0/gcr/gcr-fingerprint.h /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate-extensions.c /usr/src/debug/gcr/4.3.0/egg/egg-oid.c /usr/src/debug/gcr/4.3.0/egg/pkix.asn.h /usr/src/debug/gcr/4.3.0/gcr/gcr-pkcs11-importer.c /usr/src/debug/gcr/4.3.0/gcr/gcr-gnupg-process.h /usr/src/debug/gcr/4.3.0/gcr/gcr-gnupg-process.c /usr/src/debug/gcr/4.3.0/gcr/gcr-internal.h /usr/src/debug/gcr/4.3.0/egg/egg-dh.c /usr/src/debug/gcr/4.3.0/gcr/gcr-im
 porter.h /usr/src/debug/gcr/4.3.0/gcr/gcr-importer.c /usr/src/debug/gcr/4.3.0/egg/egg-dh.h /usr/src/debug/gcr/4.3.0/gcr/gcr-util.c /usr/src/debug/gcr/4.3.0/gcr/gcr-util.h /usr/src/debug/gcr/4.3.0/gcr/gcr-gnupg-records.c /usr/src/debug/gcr/4.3.0/gcr/gcr-secret-exchange.c /usr/src/debug/gcr/4.3.0/gcr/gcr-secret-exchange.h /usr/src/debug/gcr/4.3.0/egg/egg-hkdf-libgcrypt.c /usr/src/debug/gcr/4.3.0/gcr/gcr-simple-certificate.h /usr/src/debug/gcr/4.3.0/gcr/gcr-simple-certificate.c /usr/src/debug/gcr/4.3.0/gcr/gcr-parser-libgcrypt.c /usr/src/debug/gcr/4.3.0/gcr/gcr-callback-output-stream.h /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate-section.h /usr/src/debug/gcr/4.3.0/egg/egg-decimal.c /usr/src/debug/gcr/4.3.0/gcr/gcr-library.c /usr/src/debug/gcr/4.3.0/egg/egg-padding.c /usr/src/debug/gcr/4.3.0/gcr/gcr-callback-output-stream.c /usr/src/debug/gcr/4.3.0/egg/egg-decimal.h /usr/src/debug/gcr/4.3.0/egg/egg-padding.h /usr/src/debug/gcr/4.3.0/gcr/gcr-certificate-section.c /usr/src/debug/gcr/4.3.0
 /gcr/gcr-library.h /usr/src/debug/gcr/4.3.0/gcr/gcr-gnupg-importer.h /usr/src/debug/gcr/4.3.0/egg/egg-error.h /usr/src/debug/gcr/4.3.0/gcr/gcr-gnupg-importer.c /usr/src/debug/gcr/4.3.0/egg/egg-buffer.h /usr/src/debug/gcr/4.3.0/egg/egg-libgcrypt.h /usr/src/debug/gcr/4.3.0/gcr/gcr-parser.h /usr/src/debug/gcr/4.3.0/gcr/gcr-prompt.h /usr/src/debug/gcr/4.3.0/gcr/gcr-record.h /usr/src/debug/gcr/4.3.0/egg/pk.asn.h /usr/src/debug/gcr/4.3.0/egg/egg-libgcrypt.c /usr/src/debug/gcr/4.3.0/egg/egg-dh-libgcrypt.c /usr/src/debug/gcr/4.3.0/egg/egg-buffer.c /usr/src/debug/gcr/4.3.0/gcr/gcr-parser.c /usr/src/debug/gcr/4.3.0/gcr/gcr-prompt.c /usr/src/debug/gcr/4.3.0/gcr/gcr-record.c /usr/src/debug/gcr/4.3.0/egg/egg-hex.h /usr/src/debug/gcr/4.3.0/gcr/gcr-enum-types.h /usr/src/debug/gcr/4.3.0/egg/egg-hex.c /usr/src/debug/gcr/4.3.0/gcr/gcr-enum-types.c /usr/src/debug/gcr/4.3.0/gcr/gcr-subject-public-key.c /usr/src/debug/gcr/4.3.0/gcr/gcr-subject-public-key.h /usr/src/debug/gcr/4.3.0/gcr/gcr-mock-prompter.
 c /usr/src/debug/gcr/4.3.0/gcr/gcr-oids.c /usr/src/debug/gcr/4.3.0/gcr/gcr-key-mechanisms.c /usr/src/debug/gcr/4.3.0/gcr/gcr-system-prompt.c /usr/src/debug/gcr/4.3.0/gcr/gcr-system-prompt.h /usr/src/debug/gcr/4.3.0/gcr/gcr-key-mechanisms.h /usr/src/debug/gcr/4.3.0/gcr/gcr-oids.h", added "/usr/src/debug/gcr/4.3.91/gcr/gcr-library.c /usr/src/debug/gcr/4.3.91/gcr/gcr-library.h /usr/src/debug/gcr/4.3.91/gcr/gcr-secret-exchange.h /usr/src/debug/gcr/4.3.91/egg/egg-hex.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension-subject-alt-name.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extensions-private.h /usr/src/debug/gcr/4.3.91/gcr/gcr-secret-exchange.c /usr/src/debug/gcr/4.3.91/egg/egg-hex.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension-basic-constraints.c /usr/src/debug/gcr/4.3.91/egg/egg-padding.c /usr/src/debug/gcr/4.3.91/gcr/gcr-pkcs11-certificate.c /usr/src/debug/gcr/4.3.91/gcr/gcr-simple-certificate.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-field-private.h /u
 sr/src/debug/gcr/4.3.91/egg/egg-padding.h /usr/src/debug/gcr/4.3.91/gcr/gcr-pkcs11-certificate.h /usr/src/debug/gcr/4.3.91/gcr/gcr-simple-certificate.h /usr/src/debug/gcr/4.3.91/gcr/gcr-ssh-askpass.c /usr/src/debug/gcr/4.3.91/gcr/gcr-gnupg-importer.h /usr/src/debug/gcr/4.3.91/egg/pkix.asn.h /usr/src/debug/gcr/4.3.91/gcr/gcr-gnupg-importer.c /usr/src/debug/gcr/4.3.91/gcr/gcr-ssh-askpass.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-request.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension-extended-key-usage.c /usr/src/debug/gcr/4.3.91/egg/egg-dn.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-request.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate.h /usr/src/debug/gcr/4.3.91/egg/egg-dn.c /usr/src/debug/gcr/4.3.91/egg/egg-buffer.h /usr/src/debug/gcr/4.3.91/egg/egg-crypto.h /usr/src/debug/gcr/4.3.91/egg/egg-symkey.h /usr/src/debug/gcr/4.3.91/gcr/gcr-fingerprint.h /usr/src/debug/gcr/4.3.91/egg/egg-buffer.c /usr/src/debug/gcr/4.3.
 91/egg/egg-symkey.c /usr/src/debug/gcr/4.3.91/gcr/gcr-fingerprint.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension-list.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension-list.h /usr/src/debug/gcr/4.3.91/gcr/gcr-importer.h /usr/src/debug/gcr/4.3.91/egg/egg-oid.h /usr/src/debug/gcr/4.3.91/gcr/gcr-subject-public-key-info.h /usr/src/debug/gcr/4.3.91/egg/egg-dh-libgcrypt.c /usr/src/debug/gcr/4.3.91/gcr/gcr-importer.c /usr/src/debug/gcr/4.3.91/egg/egg-oid.c /usr/src/debug/gcr/4.3.91/gcr/gcr-subject-public-key-info.c /usr/src/debug/gcr/4.3.91/gcr/gcr-callback-output-stream.h /usr/src/debug/gcr/4.3.91/egg/egg-armor.c /usr/src/debug/gcr/4.3.91/egg/egg-asn1x.c /usr/src/debug/gcr/4.3.91/gcr/gcr-openpgp.h /usr/src/debug/gcr/4.3.91/egg/egg-decimal.h /usr/src/debug/gcr/4.3.91/egg/egg-openssl.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-field.c /usr/src/debug/gcr/4.3.91/gcr/gcr-util.c /usr/src/debug/gcr/4.3.91/egg/egg-asn1x.h /usr/src/debug/gcr/4.3.91/egg/egg-error.h /usr/src/d
 ebug/gcr/4.3.91/egg/egg-armor.h /usr/src/debug/gcr/4.3.91/gcr/gcr-util.h /usr/src/debug/gcr/4.3.91/gcr/gcr-secure-memory.c /usr/src/debug/gcr/4.3.91/gcr/gcr-callback-output-stream.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-field.h /usr/src/debug/gcr/4.3.91/egg/egg-decimal.c /usr/src/debug/gcr/4.3.91/egg/egg-openssl.c /usr/src/debug/gcr/4.3.91/gcr/gcr-openpgp.c /usr/src/debug/gcr/4.3.91/egg/egg-secure-memory.h /usr/src/debug/gcr/4.3.91/egg/egg-secure-memory.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension-certificate-policies.c /usr/src/debug/gcr/4.3.91/gcr/gcr-system-prompter.h /usr/src/debug/gcr/4.3.91/gcr/gcr-gnupg-records.c /usr/src/debug/gcr/4.3.91/gcr/gcr-mock-prompter.c /usr/src/debug/gcr/4.3.91/gcr/gcr-system-prompter.c /usr/src/debug/gcr/4.3.91/egg/egg-dh.h /usr/src/debug/gcr/4.3.91/gcr/gcr-gnupg-process.c /usr/src/debug/gcr/4.3.91/egg/egg-dh.c /usr/src/debug/gcr/4.3.91/gcr/gcr-gnupg-process.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension.c /usr/src/d
 ebug/gcr/4.3.91/gcr/gcr-certificate-extensions-common.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension-list-private.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension-authority-key-identifier.c /usr/src/debug/gcr/4.3.91/egg/egg-libgcrypt.c /usr/src/debug/gcr/4.3.91/egg/egg-libgcrypt.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension-private.h /usr/src/debug/gcr/4.3.91/egg/egg-fips-libgcrypt.c /usr/src/debug/gcr/4.3.91/egg/egg-hkdf-libgcrypt.c /usr/src/debug/gcr/4.3.91/gcr/gcr-internal.h /usr/src/debug/gcr/4.3.91/gcr/gcr-key-mechanisms.c /usr/src/debug/gcr/4.3.91/gcr/gcr-key-mechanisms.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension-subject-key-identifier.c /usr/src/debug/gcr/4.3.91/gcr/gcr-dbus-generated.h /usr/src/debug/gcr/4.3.91/egg/pk.asn.h /usr/src/debug/gcr/4.3.91/gcr/gcr-dbus-generated.c /usr/src/debug/gcr/4.3.91/gcr/gcr-enum-types.c /usr/src/debug/gcr/4.3.91/gcr/gcr-enum-types.h /usr/s
 rc/debug/gcr/4.3.91/gcr/gcr-certificate-extension-key-usage.c /usr/src/debug/gcr/4.3.91/egg/egg-hkdf.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extensions.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-chain.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-chain.h /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension-crl-distribution-points.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-section.c /usr/src/debug/gcr/4.3.91/egg/egg-fips.h /usr/src/debug/gcr/4.3.91/gcr/gcr-system-prompt.h /usr/src/debug/gcr/4.3.91/gcr/gcr-system-prompt.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-section.h /usr/src/debug/gcr/4.3.91/gcr/gcr-oids.c /usr/src/debug/gcr/4.3.91/gcr/gcr-subject-public-key.h /usr/src/debug/gcr/4.3.91/gcr/gcr-subject-public-key.c /usr/src/debug/gcr/4.3.91/gcr/gcr-oids.h /usr/src/debug/gcr/4.3.91/gcr/gcr-pkcs11-importer.h /usr/src/debug/gcr/4.3.91/gcr/gcr-trust.h /usr/src/debug/gcr/4.3.91/gcr/gcr-types.h /usr/src/debug/gcr/4.3.91/gcr/gcr-parser-libgcrypt.c /usr/src/de
 bug/gcr/4.3.91/gcr/gcr-trust.c /usr/src/debug/gcr/4.3.91/gcr/gcr-pkcs11-importer.c /usr/src/debug/gcr/4.3.91/gcr/gcr-parser.c /usr/src/debug/gcr/4.3.91/gcr/gcr-prompt.c /usr/src/debug/gcr/4.3.91/gcr/gcr-record.c /usr/src/debug/gcr/4.3.91/gcr/gcr-certificate-extension-authority-info-access.c /usr/src/debug/gcr/4.3.91/gcr/gcr-parser.h /usr/src/debug/gcr/4.3.91/gcr/gcr-prompt.h /usr/src/debug/gcr/4.3.91/gcr/gcr-record.h /usr/src/debug/gcr/4.3.91/egg/egg-asn1-defs.h /usr/src/debug/gcr/4.3.91/gcr/gcr-openssh.c /usr/src/debug/gcr/4.3.91/gcr/gcr-import-interaction.h /usr/src/debug/gcr/4.3.91/gcr/gcr-subject-public-key-info-private.h /usr/src/debug/gcr/4.3.91/gcr/gcr-openssh.h /usr/src/debug/gcr/4.3.91/gcr/gcr-import-interaction.c /usr/src/debug/gcr/4.3.91/gcr/gcr-marshal.c /usr/src/debug/gcr/4.3.91/egg/egg-crypto-libgcrypt.c /usr/src/debug/gcr/4.3.91/gcr/gcr-marshal.h"
packages/core2-64-poky-linux/gcr/gcr-src: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-src: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr-src: PKGSIZE changed from 1828826 to 1955317 (+7%)
packages/core2-64-poky-linux/gcr/gcr-staticdev: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr-staticdev: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr: FILELIST: removed "/usr/lib/libgck-2.so.2.3.0 /usr/lib/libgcr-4.so.4.3.0", added "/usr/lib/libgck-2.so.2.3.91 /usr/lib/libgcr-4.so.4.3.91"
packages/core2-64-poky-linux/gcr/gcr: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr/gcr: PV changed from "4.3.0" to "4.3.91"
packages/core2-64-poky-linux/gcr/gcr: PKGSIZE changed from 979726 to 1034100 (+6%)
packages/core2-64-poky-linux/gcr: SRC_URI changed from "https://download.gnome.org/sources//gcr/4.3/gcr-4.3.0.tar.xz;name=archive" to "https://download.gnome.org/sources//gcr/4.3/gcr-4.3.91.tar.xz;name=archive"
packages/core2-64-poky-linux/gcr: PKGV changed from 4.3.0 [default] to 4.3.91 [default]
packages/core2-64-poky-linux/gcr: PV changed from "4.3.0" to "4.3.91"
Changes to packages/core2-64-poky-linux/gcr (sysroot):
  /usr/lib/libgck-2.so.2 changed symlink target from libgck-2.so.2.3.0 to libgck-2.so.2.3.91
  /usr/lib/libgcr-4.so.4 changed symlink target from libgcr-4.so.4.3.0 to libgcr-4.so.4.3.91
  /usr/include/gcr-4/gcr/gcr-certificate-extension.h was added
  /usr/include/gcr-4/gcr/gcr-certificate-extension-list.h was added
  /usr/include/gcr-4/gcr/gcr-certificate-extensions.h was added
  /usr/include/gcr-4/gcr/gcr-subject-public-key-info.h was added
  /usr/lib/libgck-2.so.2.3.91 was added
  /usr/lib/libgcr-4.so.4.3.91 was added
  /usr/lib/libgck-2.so.2.3.0 was removed
  /usr/lib/libgcr-4.so.4.3.0 was removed

--===============7418821341065250331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gcr/gcr-dev: FILELIST: added "/usr/include/gcr-4/gcr/gcr-certificate-extension.h /usr/include/gcr-4/gcr/gcr-subject-public-key-info.h /usr/include/gcr-4/gcr/gcr-certificate-extension-list.h /usr/include/gcr-4/gcr/gcr-certificate-extensions.h"
packages/core2-64-poky-linux/gcr/gcr-locale-el: PKGSIZE changed from 21945 to 14731 (-33%)
packages/core2-64-poky-linux/gcr/gcr-locale-hi: PKGSIZE changed from 22002 to 15935 (-28%)
packages/core2-64-poky-linux/gcr/gcr-locale-kab: PKGSIZE changed from 4213 to 6402 (+52%)
packages/core2-64-poky-linux/gcr/gcr-locale-ne: PKGSIZE changed from 13348 to 16449 (+23%)
packages/core2-64-poky-linux/gcr/gcr-locale-sk: PKGSIZE changed from 18051 to 11805 (-35%)
packages/core2-64-poky-linux/gcr/gcr-locale-sr+latin: PKGSIZE changed from 15805 to 11493 (-27%)
packages/core2-64-poky-linux/gcr/gcr-locale-sr: PKGSIZE changed from 11507 to 14045 (+22%)
packages/core2-64-poky-linux/gcr/gcr: FILELIST: removed "/usr/lib/libgcr-4.so.4.3.0 /usr/lib/libgck-2.so.2.3.0", added "/usr/lib/libgcr-4.so.4.3.91 /usr/lib/libgck-2.so.2.3.91"
Changes to packages/core2-64-poky-linux/gcr (sysroot):
  /usr/lib/libgck-2.so.2 changed symlink target from libgck-2.so.2.3.0 to libgck-2.so.2.3.91
  /usr/lib/libgcr-4.so.4 changed symlink target from libgcr-4.so.4.3.0 to libgcr-4.so.4.3.91
  /usr/include/gcr-4/gcr/gcr-certificate-extension.h was added
  /usr/include/gcr-4/gcr/gcr-certificate-extension-list.h was added
  /usr/include/gcr-4/gcr/gcr-certificate-extensions.h was added
  /usr/include/gcr-4/gcr/gcr-subject-public-key-info.h was added
  /usr/lib/libgck-2.so.2.3.91 was added
  /usr/lib/libgcr-4.so.4.3.91 was added
  /usr/lib/libgck-2.so.2.3.0 was removed
  /usr/lib/libgcr-4.so.4.3.0 was removed

--===============7418821341065250331==--

