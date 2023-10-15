Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB41C00523
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:22 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.102716.1697399115354406953
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SAUxr0hk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MTZvJ/Qa;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.193, mailfrom: 0101018b34df0c36-7c146002-c755-40ec-90be-3617b3bb1046-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=R7i24OSs70vhYoJ3GcQ6VKoIFaPjtvtd2eq6W5GA9b0=;
	b=SAUxr0hkWEzjAGcVNaKSVYK5QdM0NDCv1AaFy3hyqLSCLFfbm1UCMuZ860QFZbWX
	F7Mx/A+Q1kdncRo1he7Mqqlpf7M6sXKW5tjLMoL/ZGO3kHopScEjW9kCAuL/zpVG8jK
	wtT8loHp8UYQRkISogFwqGsmY5DHrvofMgquIsww=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=R7i24OSs70vhYoJ3GcQ6VKoIFaPjtvtd2eq6W5GA9b0=;
	b=MTZvJ/QaLA7Nh88TbYPBzemXcoNyM4aEuGjUdYQ79fcNQt7+H/Gf0lIBotl84R1c
	4z5JAQsmGJy7wJSXp+Pf++niF/ZD7p7wwWFRpxEuQKCeiuqU/3WXnAZ+RsmWMPeaN8p
	ask3F6yp52t7tDNjKwW6Om9UyZ9s6gaF/RYxA2dg=
Content-Type: multipart/mixed; boundary="===============3046664218334734021=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lighttpd: upgrading to 1.4.72 SUCCEEDED
Message-ID: <0101018b34df0c36-7c146002-c755-40ec-90be-3617b3bb1046-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189211

--===============3046664218334734021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lighttpd* to *1.4.72* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lighttpd-upgrade-1.4.71-1.4.72.patch
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
From 009859a7f6655bb3f064689473438309966bf707 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 14:43:28 +0000
Subject: [PATCH] lighttpd: upgrade 1.4.71 -> 1.4.72

---
 .../lighttpd/{lighttpd_1.4.71.bb => lighttpd_1.4.72.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.71.bb => lighttpd_1.4.72.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.71.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.72.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.71.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.72.bb
index 3959f88b98..87058719f9 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.71.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.72.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "b8b6915da20396fdc354df3324d5e440169b2e5ea7859e3a775213841325afac"
+SRC_URI[sha256sum] = "f7cade4d69b754a0748c01463c33cd8b456ca9cc03bb09e85a71bcbcd54e55ec"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.39.2


--===============3046664218334734021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lighttpd: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd: SRC_URI changed from "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.71.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd" to "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.72.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd"
packages/core2-32-poky-linux/lighttpd: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PKGSIZE changed from 2329496 to 2322364 (-0%)
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-dev: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-dev: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-doc: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-doc: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-locale: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-locale: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-accesslog: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-accesslog: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ajp13: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ajp13: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-auth: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-auth: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-authn-file: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-authn-file: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-cgi: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-cgi: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-deflate: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-deflate: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-dirlisting: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-dirlisting: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-extforward: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-extforward: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-h2: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-h2: PKGSIZE changed from 71048 to 66952 (-6%)
packages/core2-32-poky-linux/lighttpd/lighttpd-module-h2: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-openssl: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-openssl: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-proxy: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-proxy: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rrdtool: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rrdtool: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-sockproxy: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-sockproxy: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ssi: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ssi: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-status: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-status: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-userdir: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-userdir: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-vhostdb: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-vhostdb: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-webdav: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-webdav: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-wstunnel: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-wstunnel: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PKGSIZE changed from 2963312 to 3024777 (+2%)
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd-staticdev: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-staticdev: PV changed from "1.4.71" to "1.4.72"
packages/core2-32-poky-linux/lighttpd/lighttpd: PKGV changed from 1.4.71 [default] to 1.4.72 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd: PV changed from "1.4.71" to "1.4.72"

--===============3046664218334734021==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.71-1.4.72.patch"

RnJvbSAwMDk4NTlhN2Y2NjU1YmIzZjA2NDY4OTQ3MzQzODMwOTk2NmJmNzA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTQ6NDM6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWdodHRwZDogdXBncmFkZSAxLjQuNzEgLT4gMS40LjcyCgotLS0KIC4uLi9saWdodHRwZC97bGln
aHR0cGRfMS40LjcxLmJiID0+IGxpZ2h0dHBkXzEuNC43Mi5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC97bGlnaHR0cGRfMS40LjcxLmJiID0+IGxpZ2h0dHBk
XzEuNC43Mi5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGln
aHR0cGQvbGlnaHR0cGRfMS40LjcxLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpZ2h0dHBk
L2xpZ2h0dHBkXzEuNC43Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40LjcxLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40LjcyLmJiCmluZGV4IDM5
NTlmODhiOTguLjg3MDU4NzE5ZjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9s
aWdodHRwZC9saWdodHRwZF8xLjQuNzEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
Z2h0dHBkL2xpZ2h0dHBkXzEuNC43Mi5iYgpAQCAtMTYsNyArMTYsNyBAQCBTUkNfVVJJID0gImh0
dHA6Ly9kb3dubG9hZC5saWdodHRwZC5uZXQvbGlnaHR0cGQvcmVsZWFzZXMtMS40LngvbGlnaHR0
cGQtJHtQVn0udAogICAgICAgICAgICBmaWxlOi8vbGlnaHR0cGQgXAogICAgICAgICAgICAiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiOGI2OTE1ZGEyMDM5NmZkYzM1NGRmMzMyNGQ1ZTQ0MDE2
OWIyZTVlYTc4NTllM2E3NzUyMTM4NDEzMjVhZmFjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImY3
Y2FkZTRkNjliNzU0YTA3NDhjMDE0NjNjMzNjZDhiNDU2Y2E5Y2MwM2JiMDllODVhNzFiY2JjZDU0
ZTU1ZWMiCiAKIERFUEVORFMgPSAidmlydHVhbC9jcnlwdCIKIAotLSAKMi4zOS4yCgo=

--===============3046664218334734021==--

