Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F20C02194
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:19 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.17869.1736936768451810378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=AsuGzbe3;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=OsyeQW+w;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010194697fd667-36dcccda-42cc-4d74-90ac-1cfb1bad05f0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936773;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7F9grmVO5NgYBegUkK8SPdqoE/Hdtum0ZSHlnd4giSQ=;
	b=AsuGzbe3RIcWJmJX7/RsUEoMHmGWyv3/QbkfRPTCG2np7YEdA1QV8k06y86b72wC
	YO58Mp1Il4EaUD1OGja5jbfHKHNX7UyhFqBOi1znEsHD3uv/KRw5Uyki0DHcEr1EpG+
	wZ6/8hP/6Mn8awWmWfTvpm+T3wiu5UOyZN2APxvA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936773;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7F9grmVO5NgYBegUkK8SPdqoE/Hdtum0ZSHlnd4giSQ=;
	b=OsyeQW+wV242z1xijzQlYu1eM1n7SbTO2iZoUtocYaUFpaWCpe0wt1t6XnHMdgen
	DX5xOIElwr0xHi2FeJQx/DqkbvsONQaBgnj1NDzA7U4/2AI3SvckjRszer+wBL++842
	rxxnqpqgPxMXdl1nfsDpxcxgkvffPOHGQSUXY/xk=
Content-Type: multipart/mixed; boundary="===============0166374630464749007=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] lighttpd: upgrading to 1.4.77 SUCCEEDED
Message-ID: <01010194697fd667-36dcccda-42cc-4d74-90ac-1cfb1bad05f0-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209856

--===============0166374630464749007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lighttpd* to *1.4.77* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lighttpd-upgrade-1.4.76-1.4.77.patch
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
From 33c0da1de4cef21d8a872bded1f3e8f9a9642260 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 08:19:21 +0000
Subject: [PATCH] lighttpd: upgrade 1.4.76 -> 1.4.77

---
 .../lighttpd/{lighttpd_1.4.76.bb => lighttpd_1.4.77.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.76.bb => lighttpd_1.4.77.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.76.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.77.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.76.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.77.bb
index 153f451ea7..2e248a6b11 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.76.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.77.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "8cbf4296e373cfd0cedfe9d978760b5b05c58fdc4048b4e2bcaf0a61ac8f5011"
+SRC_URI[sha256sum] = "acafabdbfa2267d8b6452d03d85fdd2a66525f3f05a36a79b6645c017f1562ce"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.44.1


--===============0166374630464749007==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.76-1.4.77.patch"

RnJvbSAzM2MwZGExZGU0Y2VmMjFkOGE4NzJiZGVkMWYzZThmOWE5NjQyMjYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDg6MTk6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWdodHRwZDogdXBncmFkZSAxLjQuNzYgLT4gMS40Ljc3CgotLS0KIC4uLi9saWdodHRwZC97bGln
aHR0cGRfMS40Ljc2LmJiID0+IGxpZ2h0dHBkXzEuNC43Ny5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC97bGlnaHR0cGRfMS40Ljc2LmJiID0+IGxpZ2h0dHBk
XzEuNC43Ny5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGln
aHR0cGQvbGlnaHR0cGRfMS40Ljc2LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpZ2h0dHBk
L2xpZ2h0dHBkXzEuNC43Ny5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40Ljc2LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40Ljc3LmJiCmluZGV4IDE1
M2Y0NTFlYTcuLjJlMjQ4YTZiMTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9s
aWdodHRwZC9saWdodHRwZF8xLjQuNzYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
Z2h0dHBkL2xpZ2h0dHBkXzEuNC43Ny5iYgpAQCAtMTYsNyArMTYsNyBAQCBTUkNfVVJJID0gImh0
dHA6Ly9kb3dubG9hZC5saWdodHRwZC5uZXQvbGlnaHR0cGQvcmVsZWFzZXMtMS40LngvbGlnaHR0
cGQtJHtQVn0udAogICAgICAgICAgICBmaWxlOi8vbGlnaHR0cGQgXAogICAgICAgICAgICAiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4Y2JmNDI5NmUzNzNjZmQwY2VkZmU5ZDk3ODc2MGI1YjA1
YzU4ZmRjNDA0OGI0ZTJiY2FmMGE2MWFjOGY1MDExIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImFj
YWZhYmRiZmEyMjY3ZDhiNjQ1MmQwM2Q4NWZkZDJhNjY1MjVmM2YwNWEzNmE3OWI2NjQ1YzAxN2Yx
NTYyY2UiCiAKIERFUEVORFMgPSAidmlydHVhbC9jcnlwdCIKIAotLSAKMi40NC4xCgo=

--===============0166374630464749007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/lighttpd: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd: SRC_URI changed from "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.76.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd" to "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.77.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd"
packages/core2-64-poky-linux/lighttpd/lighttpd-dbg: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-dbg: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-dbg: PKGSIZE changed from 2771248 to 2782312 (+0%)
packages/core2-64-poky-linux/lighttpd/lighttpd-dev: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-dev: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-doc: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-doc: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-doc: PKGSIZE changed from 3068 to 3016 (-2%)
packages/core2-64-poky-linux/lighttpd/lighttpd-locale: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-locale: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-accesslog: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-accesslog: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-ajp13: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-ajp13: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-auth: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-auth: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-authn-file: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-authn-file: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-cgi: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-cgi: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-deflate: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-deflate: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-dirlisting: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-dirlisting: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-extforward: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-extforward: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-h2: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-h2: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-openssl: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-openssl: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-proxy: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-proxy: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-rrdtool: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-rrdtool: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-sockproxy: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-sockproxy: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-ssi: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-ssi: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-status: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-status: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-userdir: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-userdir: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-vhostdb: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-vhostdb: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-webdav: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-webdav: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-wstunnel: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-wstunnel: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-src: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-src: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-src: PKGSIZE changed from 3073152 to 3129196 (+2%)
packages/core2-64-poky-linux/lighttpd/lighttpd-staticdev: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-staticdev: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd: PKGSIZE changed from 380988 to 381053 (+0%)

--===============0166374630464749007==--

