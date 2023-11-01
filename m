Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD9EC07EBB
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:13 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.8499.1698848705544152698
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ad7mI0h0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pER3q4LS;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.30, mailfrom: 0101018b8b4609ec-3d21a438-1f64-48a8-b880-7045c9b90647-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aVOX8Nr+a8gqB07sXB4Xp5APkx3OZUWAmBUTkVszc3g=;
	b=ad7mI0h0kbu4M/6UfHuTqEm5BPLLRKfVuYn4GoeL+GcQvkovQ1f49kaCiO0xLrES
	h/Dnk9H0xvIiedI1XO2lrzzqxoeTso+/QJ2p6giZoaf93GqS7dSElEbGpmvJWSGPKss
	FJw+WXViupcVk3Oy9CXbTWyTRI2CwhRpYcKXbuV8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aVOX8Nr+a8gqB07sXB4Xp5APkx3OZUWAmBUTkVszc3g=;
	b=pER3q4LSy6QxDXYiCKlkZsBFdbyG1utm2hzegCeEPCrnEb8Q8NOKac6KSLUo4UXy
	V6GOKAum2x2mG1mRwF3Dd0ZOG0rY5qpSkuYzRgnOib+siohS7na9R1HfqjUd6lvj4yQ
	EdQqj8jX0Gb5KwzXL6tQICed2QtTR6BEsIIQFapE=
Content-Type: multipart/mixed; boundary="===============8592722523929293108=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lighttpd: upgrading to 1.4.73 SUCCEEDED
Message-ID: <0101018b8b4609ec-3d21a438-1f64-48a8-b880-7045c9b90647-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189992

--===============8592722523929293108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lighttpd* to *1.4.73* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lighttpd-upgrade-1.4.72-1.4.73.patch
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
From 78da77a0a2a2acf795bdd8f6a10a1d905f3c2c1b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 11:28:51 +0000
Subject: [PATCH] lighttpd: upgrade 1.4.72 -> 1.4.73

---
 .../lighttpd/{lighttpd_1.4.72.bb => lighttpd_1.4.73.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.72.bb => lighttpd_1.4.73.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.72.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.73.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.72.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.73.bb
index 87058719f9..ea83a4b507 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.72.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.73.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "f7cade4d69b754a0748c01463c33cd8b456ca9cc03bb09e85a71bcbcd54e55ec"
+SRC_URI[sha256sum] = "818816d0b314b0aa8728a7076513435f6d5eb227f3b61323468e1f10dbe84ca8"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.39.2


--===============8592722523929293108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/lighttpd: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd: SRC_URI changed from "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.72.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd" to "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.73.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd"
packages/core2-64-poky-linux/lighttpd: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-dbg: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-dbg: PKGSIZE changed from 2631000 to 2632112 (+0%)
packages/core2-64-poky-linux/lighttpd/lighttpd-dbg: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-dev: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-dev: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-doc: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-doc: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-locale: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-locale: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-accesslog: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-accesslog: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-ajp13: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-ajp13: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-auth: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-auth: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-authn-file: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-authn-file: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-cgi: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-cgi: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-deflate: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-deflate: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-dirlisting: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-dirlisting: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-extforward: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-extforward: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-h2: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-h2: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-openssl: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-openssl: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-proxy: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-proxy: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-rrdtool: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-rrdtool: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-sockproxy: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-sockproxy: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-ssi: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-ssi: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-status: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-status: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-userdir: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-userdir: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-vhostdb: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-vhostdb: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-webdav: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-webdav: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-wstunnel: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-wstunnel: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-src: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-src: PKGSIZE changed from 3024777 to 3040363 (+1%)
packages/core2-64-poky-linux/lighttpd/lighttpd-src: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd-staticdev: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-staticdev: PV changed from "1.4.72" to "1.4.73"
packages/core2-64-poky-linux/lighttpd/lighttpd: PKGV changed from 1.4.72 [default] to 1.4.73 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd: PV changed from "1.4.72" to "1.4.73"

--===============8592722523929293108==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.72-1.4.73.patch"

RnJvbSA3OGRhNzdhMGEyYTJhY2Y3OTViZGQ4ZjZhMTBhMWQ5MDVmM2MyYzFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMToyODo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Z2h0dHBkOiB1cGdyYWRlIDEuNC43MiAtPiAxLjQuNzMKCi0tLQogLi4uL2xpZ2h0dHBkL3tsaWdo
dHRwZF8xLjQuNzIuYmIgPT4gbGlnaHR0cGRfMS40LjczLmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xpZ2h0dHBkL3tsaWdodHRwZF8xLjQuNzIuYmIgPT4gbGlnaHR0cGRf
MS40LjczLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWdo
dHRwZC9saWdodHRwZF8xLjQuNzIuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQv
bGlnaHR0cGRfMS40LjczLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC9saWdodHRwZF8xLjQuNzIuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC9saWdodHRwZF8xLjQuNzMuYmIKaW5kZXggODcw
NTg3MTlmOS4uZWE4M2E0YjUwNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
Z2h0dHBkL2xpZ2h0dHBkXzEuNC43Mi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGln
aHR0cGQvbGlnaHR0cGRfMS40LjczLmJiCkBAIC0xNiw3ICsxNiw3IEBAIFNSQ19VUkkgPSAiaHR0
cDovL2Rvd25sb2FkLmxpZ2h0dHBkLm5ldC9saWdodHRwZC9yZWxlYXNlcy0xLjQueC9saWdodHRw
ZC0ke1BWfS50CiAgICAgICAgICAgIGZpbGU6Ly9saWdodHRwZCBcCiAgICAgICAgICAgICIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImY3Y2FkZTRkNjliNzU0YTA3NDhjMDE0NjNjMzNjZDhiNDU2
Y2E5Y2MwM2JiMDllODVhNzFiY2JjZDU0ZTU1ZWMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODE4
ODE2ZDBiMzE0YjBhYTg3MjhhNzA3NjUxMzQzNWY2ZDVlYjIyN2YzYjYxMzIzNDY4ZTFmMTBkYmU4
NGNhOCIKIAogREVQRU5EUyA9ICJ2aXJ0dWFsL2NyeXB0IgogCi0tIAoyLjM5LjIKCg==

--===============8592722523929293108==--

