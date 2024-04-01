Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F322CD12B8
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:28 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.2014.1711994602812286467
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZGtuSqmU;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=PRswjYyT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018e9ad48254-308087c9-f352-47e8-8fd6-92f4dd1d152e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nFMl8w3NmkExcDAskQtuXPHKbi14KOsZ/zxJGKL7InE=;
	b=ZGtuSqmU4SXCaD0gZWeexK28L0NT3yPzhRrI5tg7UobvJlWsof6BAv8K9x9u/9Fg
	NIZ24f6mqnM+wZ/pyDc/PukUztuJYvB4aUX2nVnuLHiEEy+FMsikKfOaGdauK56DBTK
	pP2qVsZsCH33pmN1DPXYS2j8Mhqz5Kql1xwHL9rQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nFMl8w3NmkExcDAskQtuXPHKbi14KOsZ/zxJGKL7InE=;
	b=PRswjYyTbsyGpwqjc31YOZvhVOQWFAjbhzjPAPAl9dmOBtWdi9zF7BFL31nSdlti
	8O0zeQ1c3SsJ0CTIteFhcDlfEVxOqrfgB8mQ/GxMSnUkkaVOw70ApK9WcPH9VMIb4G7
	r2eAXvtfmlcgUo78dC7e2COJfTV3NvgHVd6wTrPU=
Content-Type: multipart/mixed; boundary="===============4370199956586968730=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lighttpd: upgrading to 1.4.75 SUCCEEDED
Message-ID: <0101018e9ad48254-308087c9-f352-47e8-8fd6-92f4dd1d152e-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197782

--===============4370199956586968730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lighttpd* to *1.4.75* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lighttpd-upgrade-1.4.74-1.4.75.patch
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
From 19e1dc0ab16451fa4f4181525fd5b5312ae1d9c4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 11:09:21 +0000
Subject: [PATCH] lighttpd: upgrade 1.4.74 -> 1.4.75

---
 .../lighttpd/{lighttpd_1.4.74.bb => lighttpd_1.4.75.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.74.bb => lighttpd_1.4.75.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.75.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.75.bb
index 7460d3d716..fc3b7e005d 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.75.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "5c08736e83088f7e019797159f306e88ec729abe976dc98fb3bed71b9d3e53b5"
+SRC_URI[sha256sum] = "8b721ca939d312afaa6ef31dcbd6afb5161ed385ac828e6fccd4c5b76be189d6"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.42.0


--===============4370199956586968730==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.74-1.4.75.patch"

RnJvbSAxOWUxZGMwYWIxNjQ1MWZhNGY0MTgxNTI1ZmQ1YjUzMTJhZTFkOWM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxMTowOToyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Z2h0dHBkOiB1cGdyYWRlIDEuNC43NCAtPiAxLjQuNzUKCi0tLQogLi4uL2xpZ2h0dHBkL3tsaWdo
dHRwZF8xLjQuNzQuYmIgPT4gbGlnaHR0cGRfMS40Ljc1LmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xpZ2h0dHBkL3tsaWdodHRwZF8xLjQuNzQuYmIgPT4gbGlnaHR0cGRf
MS40Ljc1LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWdo
dHRwZC9saWdodHRwZF8xLjQuNzQuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQv
bGlnaHR0cGRfMS40Ljc1LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC9saWdodHRwZF8xLjQuNzQuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC9saWdodHRwZF8xLjQuNzUuYmIKaW5kZXggNzQ2
MGQzZDcxNi4uZmMzYjdlMDA1ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
Z2h0dHBkL2xpZ2h0dHBkXzEuNC43NC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGln
aHR0cGQvbGlnaHR0cGRfMS40Ljc1LmJiCkBAIC0xNiw3ICsxNiw3IEBAIFNSQ19VUkkgPSAiaHR0
cDovL2Rvd25sb2FkLmxpZ2h0dHBkLm5ldC9saWdodHRwZC9yZWxlYXNlcy0xLjQueC9saWdodHRw
ZC0ke1BWfS50CiAgICAgICAgICAgIGZpbGU6Ly9saWdodHRwZCBcCiAgICAgICAgICAgICIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjVjMDg3MzZlODMwODhmN2UwMTk3OTcxNTlmMzA2ZTg4ZWM3
MjlhYmU5NzZkYzk4ZmIzYmVkNzFiOWQzZTUzYjUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGI3
MjFjYTkzOWQzMTJhZmFhNmVmMzFkY2JkNmFmYjUxNjFlZDM4NWFjODI4ZTZmY2NkNGM1Yjc2YmUx
ODlkNiIKIAogREVQRU5EUyA9ICJ2aXJ0dWFsL2NyeXB0IgogCi0tIAoyLjQyLjAKCg==

--===============4370199956586968730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/lighttpd: SRC_URI changed from "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.74.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd" to "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.75.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd"
packages/core2-64-poky-linux/lighttpd: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-dbg: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-dbg: PKGSIZE changed from 2639936 to 2641912 (+0%)
packages/core2-64-poky-linux/lighttpd/lighttpd-dbg: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-dev: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-dev: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-doc: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-doc: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-locale: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-locale: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-accesslog: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-accesslog: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-ajp13: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-ajp13: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-auth: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-auth: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-authn-file: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-authn-file: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-cgi: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-cgi: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-deflate: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-deflate: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-dirlisting: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-dirlisting: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-extforward: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-extforward: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-h2: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-h2: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-openssl: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-openssl: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-proxy: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-proxy: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-rrdtool: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-rrdtool: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-sockproxy: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-sockproxy: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-ssi: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-ssi: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-status: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-status: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-userdir: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-userdir: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-vhostdb: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-vhostdb: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-webdav: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-webdav: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-wstunnel: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-wstunnel: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-src: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-src: PKGSIZE changed from 3067749 to 3070380 (+0%)
packages/core2-64-poky-linux/lighttpd/lighttpd-src: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-staticdev: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-staticdev: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd: PV changed from "1.4.74" to "1.4.75"

--===============4370199956586968730==--

