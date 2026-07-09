Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF63C44509
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 06:12:00 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2991.1783577517416003255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 23:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Y+uU5m+K;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1rq2KBgw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019f458119b8-759b9b20-f7a5-4c5f-bdc5-06285e8de8f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783577516;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=FULmq9pi7s1lSrYupXyhbvK6uyn1PyY2pn6zx6pNA9E=;
	b=Y+uU5m+KwK0MXe3HTGr9tzMt51e+wA7RErKY1iwL/ZdSwW61s6Pfvx785nrrtO/6
	fpKmdFZ3H8+m3SG3R3TGe8o3wfF2Txtwkjo/h+RfbNPlIyWYojrka2rvIs4Hs7YaM5f
	Gt8qI+SFIDzjwPPdaCENoOLXvUoE+4e9cQbMAKdE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783577516;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=FULmq9pi7s1lSrYupXyhbvK6uyn1PyY2pn6zx6pNA9E=;
	b=1rq2KBgw+2f2iT4Vey2MFVn1cFhSVXFyol3wsWaLCzhYVmNvuASQb8FmH8O3CGRu
	4/Vvp8RckWLpOpSjl8PGlt1hnSEhO60e7NTcRqhn7gQrL6AY+/1BsX+raXoq3ttnUQE
	wdViKibbyxLSfGcXV46GDmg56DUtJOF40jr60g1g=
Content-Type: multipart/mixed; boundary="===============7912034712295917529=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] lighttpd: upgrading to 1.4.85 SUCCEEDED
Message-ID: <0101019f458119b8-759b9b20-f7a5-4c5f-bdc5-06285e8de8f5-000000@us-west-2.amazonses.com>
Date: Thu, 9 Jul 2026 06:11:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.09-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 06:12:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240532

--===============7912034712295917529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lighttpd* to *1.4.85* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lighttpd-upgrade-1.4.83-1.4.85.patch
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
From 3ccfce73063999f4fb3ea85a833792f8eb728f31 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 9 Jul 2026 05:39:09 +0000
Subject: [PATCH] lighttpd: upgrade 1.4.83 -> 1.4.85

---
 .../lighttpd/{lighttpd_1.4.83.bb => lighttpd_1.4.85.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.83.bb => lighttpd_1.4.85.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.83.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.85.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.83.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.85.bb
index a1a7bee227..54d8c91647 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.83.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.85.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "b3f878156480079f8a93903bd24d456074a0fbedb9b4d99fcd65df33b1f566f0"
+SRC_URI[sha256sum] = "18de51b393bac4a6827879e1a7ff377c169e414bae92cd245091d80fc2601d13"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.47.1


--===============7912034712295917529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/lighttpd: SRC_URI changed from "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.83.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd" to "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.85.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd"
packages/x86-64-v3-poky-linux/lighttpd: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dbg: PKGSIZE changed from 2981512 to 2979760 (-0%)
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dbg: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dbg: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dev: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dev: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-doc: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-doc: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-locale: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-locale: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-accesslog: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-accesslog: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-ajp13: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-ajp13: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-auth: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-auth: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-authn-file: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-authn-file: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-cgi: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-cgi: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-deflate: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-deflate: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-dirlisting: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-dirlisting: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-extforward: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-extforward: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-h2: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-h2: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-openssl: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-openssl: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-proxy: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-proxy: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-rrdtool: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-rrdtool: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-sockproxy: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-sockproxy: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-ssi: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-ssi: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-status: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-status: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-userdir: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-userdir: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-vhostdb: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-vhostdb: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-webdav: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-webdav: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-wstunnel: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-wstunnel: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-src: PKGSIZE changed from 3229831 to 3230371 (+0%)
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-src: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-src: FILELIST: directory renamed /usr/src/debug/lighttpd/1.4.83/src/compat -> /usr/src/debug/lighttpd/1.4.85/src/compat, directory renamed /usr/src/debug/lighttpd/1.4.83/src -> /usr/src/debug/lighttpd/1.4.85/src, directory renamed /usr/src/debug/lighttpd/1.4.83/src/ls-hpack -> /usr/src/debug/lighttpd/1.4.85/src/ls-hpack
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-src: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-staticdev: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-staticdev: PV changed from "1.4.83" to "1.4.85"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd: PKGV changed from 1.4.83 [default] to 1.4.85 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd: PV changed from "1.4.83" to "1.4.85"

--===============7912034712295917529==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.83-1.4.85.patch"

RnJvbSAzY2NmY2U3MzA2Mzk5OWY0ZmIzZWE4NWE4MzM3OTJmOGViNzI4ZjMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgOSBKdWwgMjAyNiAwNTozOTowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Z2h0dHBkOiB1cGdyYWRlIDEuNC44MyAtPiAxLjQuODUKCi0tLQogLi4uL2xpZ2h0dHBkL3tsaWdo
dHRwZF8xLjQuODMuYmIgPT4gbGlnaHR0cGRfMS40Ljg1LmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xpZ2h0dHBkL3tsaWdodHRwZF8xLjQuODMuYmIgPT4gbGlnaHR0cGRf
MS40Ljg1LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWdo
dHRwZC9saWdodHRwZF8xLjQuODMuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQv
bGlnaHR0cGRfMS40Ljg1LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC9saWdodHRwZF8xLjQuODMuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC9saWdodHRwZF8xLjQuODUuYmIKaW5kZXggYTFh
N2JlZTIyNy4uNTRkOGM5MTY0NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
Z2h0dHBkL2xpZ2h0dHBkXzEuNC44My5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGln
aHR0cGQvbGlnaHR0cGRfMS40Ljg1LmJiCkBAIC0xNiw3ICsxNiw3IEBAIFNSQ19VUkkgPSAiaHR0
cDovL2Rvd25sb2FkLmxpZ2h0dHBkLm5ldC9saWdodHRwZC9yZWxlYXNlcy0xLjQueC9saWdodHRw
ZC0ke1BWfS50CiAgICAgICAgICAgIGZpbGU6Ly9saWdodHRwZCBcCiAgICAgICAgICAgICIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImIzZjg3ODE1NjQ4MDA3OWY4YTkzOTAzYmQyNGQ0NTYwNzRh
MGZiZWRiOWI0ZDk5ZmNkNjVkZjMzYjFmNTY2ZjAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMThk
ZTUxYjM5M2JhYzRhNjgyNzg3OWUxYTdmZjM3N2MxNjllNDE0YmFlOTJjZDI0NTA5MWQ4MGZjMjYw
MWQxMyIKIAogREVQRU5EUyA9ICJ2aXJ0dWFsL2NyeXB0IgogCi0tIAoyLjQ3LjEKCg==

--===============7912034712295917529==--

