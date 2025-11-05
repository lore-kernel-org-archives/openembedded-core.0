Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9917CD343F
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:35 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2340.1762384568966752539
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hZuZeo1B;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=d+cE31x6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019a564ec4a3-92483fef-c752-4bf1-9d1f-96185d610f73-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384594;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DpFGK3OV0uBwJvyql8QAW40EatRRSzoYiZCMaV5Hk+U=;
	b=hZuZeo1BMmYAzY4PYeO/K3ZUVP9xoo14XFr6ZDX9HcgHzBBQ42/AhY1/oi+dJvtx
	Bwkeah8QnRefpweCEUn2hoVfBmB0CslFIWzI79Case6SAbWZj/PSGzsw5CHrl8o49Cf
	sWm88HMrq7a3Femw5UPc8JlqqVlIcGcaXC3AVsVc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384594;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DpFGK3OV0uBwJvyql8QAW40EatRRSzoYiZCMaV5Hk+U=;
	b=d+cE31x6v8mecQOsMB8YespPuo+DieoadkDj7SQQ3mPGuto+HiqaAEoFWVi1BlLS
	KfZpLD7yhNFUSoJNlIuT7U9pgg0TYMgAnaYpIiGn/NUdpLukqwrb/1xsdJSo663BtpW
	ECiRAMrv+q5alQZK5rO4Ll63h/tZs0qDD59CIJU4=
Content-Type: multipart/mixed; boundary="===============3530155008643293945=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] lighttpd: upgrading to 1.4.82 SUCCEEDED
Message-ID: <0101019a564ec4a3-92483fef-c752-4bf1-9d1f-96185d610f73-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225862

--===============3530155008643293945==
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
From 33245beb02636df66939bd936142a2c8c01d5d73 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 18:50:50 +0000
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


--===============3530155008643293945==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.81-1.4.82.patch"

RnJvbSAzMzI0NWJlYjAyNjM2ZGY2NjkzOWJkOTM2MTQyYTJjOGMwMWQ1ZDczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxODo1MDo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Z2h0dHBkOiB1cGdyYWRlIDEuNC44MSAtPiAxLjQuODIKCi0tLQogLi4uL2xpZ2h0dHBkL3tsaWdo
dHRwZF8xLjQuODEuYmIgPT4gbGlnaHR0cGRfMS40LjgyLmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xpZ2h0dHBkL3tsaWdodHRwZF8xLjQuODEuYmIgPT4gbGlnaHR0cGRf
MS40LjgyLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWdo
dHRwZC9saWdodHRwZF8xLjQuODEuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQv
bGlnaHR0cGRfMS40LjgyLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC9saWdodHRwZF8xLjQuODEuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC9saWdodHRwZF8xLjQuODIuYmIKaW5kZXggNDBh
YmVmNzg0Yi4uODIyMWQzMDI4MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
Z2h0dHBkL2xpZ2h0dHBkXzEuNC44MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGln
aHR0cGQvbGlnaHR0cGRfMS40LjgyLmJiCkBAIC0xNiw3ICsxNiw3IEBAIFNSQ19VUkkgPSAiaHR0
cDovL2Rvd25sb2FkLmxpZ2h0dHBkLm5ldC9saWdodHRwZC9yZWxlYXNlcy0xLjQueC9saWdodHRw
ZC0ke1BWfS50CiAgICAgICAgICAgIGZpbGU6Ly9saWdodHRwZCBcCiAgICAgICAgICAgICIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImQ3ZDQyYzNmZDJmZDk0YjYzYzkxNWFhN2QxOGY0ZGEzY2Fj
NTkzN2RkYmEzM2U5MDlmODFjZjUwODQyYTU4NDAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWJm
ZTc0MzkxZjljYmQ2NmFiMTU0ZWEwN2U2NGYxOTRkYmU3ZTkwNmVmNGVkNDdlYjNiMGYzYjQ2MjQ2
Yzk2MiIKIAogREVQRU5EUyA9ICJ2aXJ0dWFsL2NyeXB0IgogCi0tIAoyLjQ3LjEKCg==

--===============3530155008643293945==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/lighttpd: SRC_URI changed from "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.81.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd" to "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.82.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd"
packages/x86-64-v3-poky-linux/lighttpd: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dbg: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dbg: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dbg: PKGSIZE changed from 2751464 to 2754152 (+0%)
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
packages/x86-64-v3-poky-linux/lighttpd/lighttpd: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd: PKGSIZE changed from 392439 to 396535 (+1%)

--===============3530155008643293945==--

