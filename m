Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7E4C369C4
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:24 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.18060.1743511400796891358
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Sx9g4TF9;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ra7YdKNj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010195f160b9fa-fff011b1-352f-4733-af67-354b612b8e37-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511403;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rYLtESGd8BnAQkLheEIFqGMfW5nuJRIPBVMXPEs6smc=;
	b=Sx9g4TF94JO37AsXzGmWUwpQD1WtwMpuzN6SqkJpf7d1IgG7cY/HifHVQ9eQjuWa
	OZQGC3YGJM6YjRluLmOxq529cmddOemUeszHfq8eVCShrkwGDDqir98sVIBWlpBRv/M
	iBkY1l/3bai+r+LKqxtqdgIIM0oGU6Fn9QdeG9oI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511403;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rYLtESGd8BnAQkLheEIFqGMfW5nuJRIPBVMXPEs6smc=;
	b=ra7YdKNjD7GDkh7eso1dhUyl1b5VyBktarhw6AV9Roc+HY/veEfmAYElXX4+v06P
	02h9jBn4XsHWSQEESi6GJQuyqkN6C4XzVndPo4iW+JBEnOMUdOd9kZ8faotwrYnmLAx
	vpi5tPS91iQCmW5J9T8SvTnoFX9igTDqZRFMaONI=
Content-Type: multipart/mixed; boundary="===============5996684072165190850=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] lighttpd: upgrading to 1.4.78 SUCCEEDED
Message-ID: <01010195f160b9fa-fff011b1-352f-4733-af67-354b612b8e37-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214084

--===============5996684072165190850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lighttpd* to *1.4.78* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lighttpd-upgrade-1.4.77-1.4.78.patch
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
From 4a1ef47850a77e8fa7b7bb5328e62ef1fc02c02e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 10:03:07 +0000
Subject: [PATCH] lighttpd: upgrade 1.4.77 -> 1.4.78

---
 .../lighttpd/{lighttpd_1.4.77.bb => lighttpd_1.4.78.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.77.bb => lighttpd_1.4.78.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.77.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.78.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.77.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.78.bb
index 2e248a6b11..1d9b4e517c 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.77.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.78.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "acafabdbfa2267d8b6452d03d85fdd2a66525f3f05a36a79b6645c017f1562ce"
+SRC_URI[sha256sum] = "3c0739e8bc75c9e9fc1cfa89e1c304dd4b0e4abb87adc646a1d20bc6a2db2a3e"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.47.1


--===============5996684072165190850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/lighttpd: SRC_URI changed from "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.77.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd" to "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.78.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd"
packages/core2-64-poky-linux/lighttpd: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-dbg: PKGSIZE changed from 2726888 to 2736472 (+0%)
packages/core2-64-poky-linux/lighttpd/lighttpd-dbg: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-dbg: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-dev: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-dev: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-doc: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-doc: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-locale: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-locale: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-accesslog: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-accesslog: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-ajp13: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-ajp13: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-auth: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-auth: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-authn-file: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-authn-file: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-cgi: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-cgi: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-deflate: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-deflate: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-dirlisting: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-dirlisting: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-extforward: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-extforward: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-h2: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-h2: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-openssl: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-openssl: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-proxy: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-proxy: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-rrdtool: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-rrdtool: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-sockproxy: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-sockproxy: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-ssi: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-ssi: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-status: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-status: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-userdir: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-userdir: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-vhostdb: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-vhostdb: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-webdav: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-webdav: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-module-wstunnel: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-module-wstunnel: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-src: PKGSIZE changed from 3129196 to 3142538 (+0%)
packages/core2-64-poky-linux/lighttpd/lighttpd-src: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-src: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-staticdev: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd-staticdev: PKGV changed from 1.4.77 [default] to 1.4.78 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd: PKGSIZE changed from 381053 to 381106 (+0%)
packages/core2-64-poky-linux/lighttpd/lighttpd: PV changed from "1.4.77" to "1.4.78"
packages/core2-64-poky-linux/lighttpd/lighttpd: PKGV changed from 1.4.77 [default] to 1.4.78 [default]

--===============5996684072165190850==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.77-1.4.78.patch"

RnJvbSA0YTFlZjQ3ODUwYTc3ZThmYTdiN2JiNTMyOGU2MmVmMWZjMDJjMDJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAxMDowMzowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Z2h0dHBkOiB1cGdyYWRlIDEuNC43NyAtPiAxLjQuNzgKCi0tLQogLi4uL2xpZ2h0dHBkL3tsaWdo
dHRwZF8xLjQuNzcuYmIgPT4gbGlnaHR0cGRfMS40Ljc4LmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xpZ2h0dHBkL3tsaWdodHRwZF8xLjQuNzcuYmIgPT4gbGlnaHR0cGRf
MS40Ljc4LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWdo
dHRwZC9saWdodHRwZF8xLjQuNzcuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQv
bGlnaHR0cGRfMS40Ljc4LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC9saWdodHRwZF8xLjQuNzcuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC9saWdodHRwZF8xLjQuNzguYmIKaW5kZXggMmUy
NDhhNmIxMS4uMWQ5YjRlNTE3YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
Z2h0dHBkL2xpZ2h0dHBkXzEuNC43Ny5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGln
aHR0cGQvbGlnaHR0cGRfMS40Ljc4LmJiCkBAIC0xNiw3ICsxNiw3IEBAIFNSQ19VUkkgPSAiaHR0
cDovL2Rvd25sb2FkLmxpZ2h0dHBkLm5ldC9saWdodHRwZC9yZWxlYXNlcy0xLjQueC9saWdodHRw
ZC0ke1BWfS50CiAgICAgICAgICAgIGZpbGU6Ly9saWdodHRwZCBcCiAgICAgICAgICAgICIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImFjYWZhYmRiZmEyMjY3ZDhiNjQ1MmQwM2Q4NWZkZDJhNjY1
MjVmM2YwNWEzNmE3OWI2NjQ1YzAxN2YxNTYyY2UiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2Mw
NzM5ZThiYzc1YzllOWZjMWNmYTg5ZTFjMzA0ZGQ0YjBlNGFiYjg3YWRjNjQ2YTFkMjBiYzZhMmRi
MmEzZSIKIAogREVQRU5EUyA9ICJ2aXJ0dWFsL2NyeXB0IgogCi0tIAoyLjQ3LjEKCg==

--===============5996684072165190850==--

