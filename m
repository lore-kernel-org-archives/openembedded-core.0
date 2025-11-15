Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75347CED27B
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:04 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11951.1763224737567327213
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=d/5vSQd6;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=MbRCJT+K;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019a886264c2-71cc0210-6327-4ab8-9fdf-64e6462d489d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224741;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=M0xC+qgXwMqo7d+5QhmKcxehdJ/JcznwL+K4C6s5gUg=;
	b=d/5vSQd6EayhZvBDtUSyfCZPF0vcCC6FbvsJs9vrxcq24Go8/T3jxduWaYzbWsms
	avU7QMtR+YcWyogJXs20mOoPgmI5aiy5jACtaKQ646SnIwK1MgwtAQXOd6bcqjjUZmH
	mxMmS2YGq82ejb+aVpH734h+Z2Y3Rp9KgJoBPlYQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224741;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=M0xC+qgXwMqo7d+5QhmKcxehdJ/JcznwL+K4C6s5gUg=;
	b=MbRCJT+KdPubEjccrBB44xGb1j0WBiln5ZjN1dTiSJCGdzKyItN6xh9yf29IaO/J
	uNFmzVGI0XHafq+CVHuM5iXK2dHjtml5qzPMgTVvVi9CNgjlZEy5wK103yiaYU3bv+N
	48j8B0cf8yuoFCOmj+I26Ynvow9uusnERs4+5i5s=
Content-Type: multipart/mixed; boundary="===============7864409263975269871=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] lighttpd: upgrading to 1.4.82 SUCCEEDED
Message-ID: <0101019a886264c2-71cc0210-6327-4ab8-9fdf-64e6462d489d-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226398

--===============7864409263975269871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lighttpd* to *1.4.82* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lighttpd-upgrade-1.4.81-1.4.82.patch
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
From a792f061c748b89d915ba155c5628fef1b485142 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 12:22:26 +0000
Subject: [PATCH] lighttpd: upgrade 1.4.81 -> 1.4.82

---
 .../lighttpd/{lighttpd_1.4.81.bb => lighttpd_1.4.82.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.81.bb => lighttpd_1.4.82.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.81.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.81.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
index 40abef784b..8221d30283 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.81.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "d7d42c3fd2fd94b63c915aa7d18f4da3cac5937ddba33e909f81cf50842a5840"
+SRC_URI[sha256sum] = "abfe74391f9cbd66ab154ea07e64f194dbe7e906ef4ed47eb3b0f3b46246c962"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.47.1


--===============7864409263975269871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/lighttpd: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd: SRC_URI changed from "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.81.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd" to "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.82.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd"
packages/x86-64-v3-poky-linux/lighttpd: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dbg: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dbg: PKGSIZE changed from 2751464 to 2754152 (+0%)
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dbg: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dev: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dev: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-doc: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-doc: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-locale: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-locale: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-accesslog: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-accesslog: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-ajp13: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-ajp13: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-auth: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-auth: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-authn-file: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-authn-file: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-cgi: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-cgi: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-deflate: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-deflate: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-dirlisting: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-dirlisting: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-extforward: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-extforward: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-h2: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-h2: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-openssl: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-openssl: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-proxy: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-proxy: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-rrdtool: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-rrdtool: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-sockproxy: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-sockproxy: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-ssi: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-ssi: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-status: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-status: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-userdir: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-userdir: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-vhostdb: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-vhostdb: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-webdav: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-webdav: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-wstunnel: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-wstunnel: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-src: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-src: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-staticdev: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-staticdev: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd: PKGSIZE changed from 392439 to 396535 (+1%)
packages/x86-64-v3-poky-linux/lighttpd/lighttpd: PV changed from "1.4.81" to "1.4.82"

--===============7864409263975269871==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.81-1.4.82.patch"

RnJvbSBhNzkyZjA2MWM3NDhiODlkOTE1YmExNTVjNTYyOGZlZjFiNDg1MTQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTI6MjI6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWdodHRwZDogdXBncmFkZSAxLjQuODEgLT4gMS40LjgyCgotLS0KIC4uLi9saWdodHRwZC97bGln
aHR0cGRfMS40LjgxLmJiID0+IGxpZ2h0dHBkXzEuNC44Mi5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC97bGlnaHR0cGRfMS40LjgxLmJiID0+IGxpZ2h0dHBk
XzEuNC44Mi5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGln
aHR0cGQvbGlnaHR0cGRfMS40LjgxLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpZ2h0dHBk
L2xpZ2h0dHBkXzEuNC44Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40LjgxLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40LjgyLmJiCmluZGV4IDQw
YWJlZjc4NGIuLjgyMjFkMzAyODMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9s
aWdodHRwZC9saWdodHRwZF8xLjQuODEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
Z2h0dHBkL2xpZ2h0dHBkXzEuNC44Mi5iYgpAQCAtMTYsNyArMTYsNyBAQCBTUkNfVVJJID0gImh0
dHA6Ly9kb3dubG9hZC5saWdodHRwZC5uZXQvbGlnaHR0cGQvcmVsZWFzZXMtMS40LngvbGlnaHR0
cGQtJHtQVn0udAogICAgICAgICAgICBmaWxlOi8vbGlnaHR0cGQgXAogICAgICAgICAgICAiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkN2Q0MmMzZmQyZmQ5NGI2M2M5MTVhYTdkMThmNGRhM2Nh
YzU5MzdkZGJhMzNlOTA5ZjgxY2Y1MDg0MmE1ODQwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImFi
ZmU3NDM5MWY5Y2JkNjZhYjE1NGVhMDdlNjRmMTk0ZGJlN2U5MDZlZjRlZDQ3ZWIzYjBmM2I0NjI0
NmM5NjIiCiAKIERFUEVORFMgPSAidmlydHVhbC9jcnlwdCIKIAotLSAKMi40Ny4xCgo=

--===============7864409263975269871==--

