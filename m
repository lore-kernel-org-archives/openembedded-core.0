Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48725C54ED6
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:14 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.1251.1710522012782238984
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KFo1nCrR;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=dgrPWrzd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018e430e9279-0d826638-f8ce-4c44-844e-b498001b4fc5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522012;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+8v2AgG8Yhcp7xLD5gDaOvcnN9ge/ua1CGis8+RAtwc=;
	b=KFo1nCrRQQ45zjV7QR1KebLv1eU5mYUZy6H5driSXiy7xOd8pe0aJQDMjU7WbYb2
	+1t6uxAs8jixe5femzrMTK5LltGbs25Fte/4+56GBBC9pdL9idcgi+tEbM2+rD41MLk
	L6GBKnj3/GvI+nAakvpUY6cjhvlTP/8UQwXdL/vo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522012;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+8v2AgG8Yhcp7xLD5gDaOvcnN9ge/ua1CGis8+RAtwc=;
	b=dgrPWrzdZilRkBjtFYV7l2MGHvHe25UGkQbdxHHSlWI9So2HqP2Mnv3/dvtvhrH6
	qVPRjBXrBl3PS/jrzWfuQZTt03WuuUjxnBRePnzlF2tlFKDX9rVf7ecAr1x2O/T5MFt
	cVv+34VUluoCxfcQeuKhOd7puGOi0pcTSz5iVd94=
Content-Type: multipart/mixed; boundary="===============6741261230610478702=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lighttpd: upgrading to 1.4.75 SUCCEEDED
Message-ID: <0101018e430e9279-0d826638-f8ce-4c44-844e-b498001b4fc5-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197191

--===============6741261230610478702==
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
From a00be62d29b836fbd4bed41259c025ecf50c1842 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 10:36:59 +0000
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


--===============6741261230610478702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/lighttpd: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd: SRC_URI changed from "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.74.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd" to "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.75.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd"
packages/core2-64-poky-linux/lighttpd: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-dbg: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-dbg: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-dbg: PKGSIZE changed from 2639936 to 2641912 (+0%)
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
packages/core2-64-poky-linux/lighttpd/lighttpd-src: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd-src: PKGSIZE changed from 3067749 to 3070380 (+0%)
packages/core2-64-poky-linux/lighttpd/lighttpd-staticdev: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-staticdev: PV changed from "1.4.74" to "1.4.75"
packages/core2-64-poky-linux/lighttpd/lighttpd: PKGV changed from 1.4.74 [default] to 1.4.75 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd: PV changed from "1.4.74" to "1.4.75"

--===============6741261230610478702==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.74-1.4.75.patch"

RnJvbSBhMDBiZTYyZDI5YjgzNmZiZDRiZWQ0MTI1OWMwMjVlY2Y1MGMxODQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMTA6MzY6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWdodHRwZDogdXBncmFkZSAxLjQuNzQgLT4gMS40Ljc1CgotLS0KIC4uLi9saWdodHRwZC97bGln
aHR0cGRfMS40Ljc0LmJiID0+IGxpZ2h0dHBkXzEuNC43NS5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC97bGlnaHR0cGRfMS40Ljc0LmJiID0+IGxpZ2h0dHBk
XzEuNC43NS5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGln
aHR0cGQvbGlnaHR0cGRfMS40Ljc0LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpZ2h0dHBk
L2xpZ2h0dHBkXzEuNC43NS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40Ljc0LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40Ljc1LmJiCmluZGV4IDc0
NjBkM2Q3MTYuLmZjM2I3ZTAwNWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9s
aWdodHRwZC9saWdodHRwZF8xLjQuNzQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
Z2h0dHBkL2xpZ2h0dHBkXzEuNC43NS5iYgpAQCAtMTYsNyArMTYsNyBAQCBTUkNfVVJJID0gImh0
dHA6Ly9kb3dubG9hZC5saWdodHRwZC5uZXQvbGlnaHR0cGQvcmVsZWFzZXMtMS40LngvbGlnaHR0
cGQtJHtQVn0udAogICAgICAgICAgICBmaWxlOi8vbGlnaHR0cGQgXAogICAgICAgICAgICAiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1YzA4NzM2ZTgzMDg4ZjdlMDE5Nzk3MTU5ZjMwNmU4OGVj
NzI5YWJlOTc2ZGM5OGZiM2JlZDcxYjlkM2U1M2I1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhi
NzIxY2E5MzlkMzEyYWZhYTZlZjMxZGNiZDZhZmI1MTYxZWQzODVhYzgyOGU2ZmNjZDRjNWI3NmJl
MTg5ZDYiCiAKIERFUEVORFMgPSAidmlydHVhbC9jcnlwdCIKIAotLSAKMi40Mi4wCgo=

--===============6741261230610478702==--

