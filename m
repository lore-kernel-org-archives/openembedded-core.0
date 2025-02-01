Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A33C0219C
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:00 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.42621.1738416044724946212
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GZe9sSX0;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0oq3fugC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010194c1abebe4-bdd3fb70-93f7-4bb3-9ff4-c7b9e8fc9a8b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416057;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DefiSTIKI+kFQjSFjdr/F+f4GLg1qMxjIowr7M7caHo=;
	b=GZe9sSX0yq5un3NJ7yqtW+ZkFXKWEa/SFGT734TcZFXR6czgKvGqZ5gzgpF/+JJr
	y/eJtip+wLzII4E5Rw+qnvvuJkhXDNUWup02fhrSoAU42c7fqbRMjyhQQTjmgxO/X2p
	8Vd8LLutn/0mKLG3jmGzPJ4Gu2BTlwfYsF6/WhS4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416057;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DefiSTIKI+kFQjSFjdr/F+f4GLg1qMxjIowr7M7caHo=;
	b=0oq3fugCJsHmDoudPZ8MDvHwh/twV6GBwDknI0nlLhWVnhbddb5ntgFZ240fqCsq
	XNHpmfzi7HXm2QA5GELllR+YB6yH6F5+iK/2gcsc2XudsxVbfeAsuVSBGGCoFsQqipU
	Gs/oKyzM8hsOdEfxD09cFgm6DOaFBNbE51bTeOso=
Content-Type: multipart/mixed; boundary="===============7046361240566371461=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] lighttpd: upgrading to 1.4.77 SUCCEEDED
Message-ID: <01010194c1abebe4-bdd3fb70-93f7-4bb3-9ff4-c7b9e8fc9a8b-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210555

--===============7046361240566371461==
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
From 95cf6c2f43a3d7185659427e4d4dbfe5933b5073 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 09:11:50 +0000
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


--===============7046361240566371461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/lighttpd: SRC_URI changed from "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.76.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd" to "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.77.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd"
packages/core2-64-poky-linux/lighttpd: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-dbg: PKGSIZE changed from 2771248 to 2782312 (+0%)
packages/core2-64-poky-linux/lighttpd/lighttpd-dbg: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-dbg: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-dev: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-dev: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-doc: PKGSIZE changed from 3068 to 3016 (-2%)
packages/core2-64-poky-linux/lighttpd/lighttpd-doc: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-doc: PV changed from "1.4.76" to "1.4.77"
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
packages/core2-64-poky-linux/lighttpd/lighttpd-src: PKGSIZE changed from 3073152 to 3129196 (+2%)
packages/core2-64-poky-linux/lighttpd/lighttpd-src: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-src: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd-staticdev: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd-staticdev: PV changed from "1.4.76" to "1.4.77"
packages/core2-64-poky-linux/lighttpd/lighttpd: PKGSIZE changed from 380988 to 381053 (+0%)
packages/core2-64-poky-linux/lighttpd/lighttpd: PKGV changed from 1.4.76 [default] to 1.4.77 [default]
packages/core2-64-poky-linux/lighttpd/lighttpd: PV changed from "1.4.76" to "1.4.77"

--===============7046361240566371461==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.76-1.4.77.patch"

RnJvbSA5NWNmNmMyZjQzYTNkNzE4NTY1OTQyN2U0ZDRkYmZlNTkzM2I1MDczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwOToxMTo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Z2h0dHBkOiB1cGdyYWRlIDEuNC43NiAtPiAxLjQuNzcKCi0tLQogLi4uL2xpZ2h0dHBkL3tsaWdo
dHRwZF8xLjQuNzYuYmIgPT4gbGlnaHR0cGRfMS40Ljc3LmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xpZ2h0dHBkL3tsaWdodHRwZF8xLjQuNzYuYmIgPT4gbGlnaHR0cGRf
MS40Ljc3LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWdo
dHRwZC9saWdodHRwZF8xLjQuNzYuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQv
bGlnaHR0cGRfMS40Ljc3LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC9saWdodHRwZF8xLjQuNzYuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC9saWdodHRwZF8xLjQuNzcuYmIKaW5kZXggMTUz
ZjQ1MWVhNy4uMmUyNDhhNmIxMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
Z2h0dHBkL2xpZ2h0dHBkXzEuNC43Ni5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGln
aHR0cGQvbGlnaHR0cGRfMS40Ljc3LmJiCkBAIC0xNiw3ICsxNiw3IEBAIFNSQ19VUkkgPSAiaHR0
cDovL2Rvd25sb2FkLmxpZ2h0dHBkLm5ldC9saWdodHRwZC9yZWxlYXNlcy0xLjQueC9saWdodHRw
ZC0ke1BWfS50CiAgICAgICAgICAgIGZpbGU6Ly9saWdodHRwZCBcCiAgICAgICAgICAgICIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjhjYmY0Mjk2ZTM3M2NmZDBjZWRmZTlkOTc4NzYwYjViMDVj
NThmZGM0MDQ4YjRlMmJjYWYwYTYxYWM4ZjUwMTEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWNh
ZmFiZGJmYTIyNjdkOGI2NDUyZDAzZDg1ZmRkMmE2NjUyNWYzZjA1YTM2YTc5YjY2NDVjMDE3ZjE1
NjJjZSIKIAogREVQRU5EUyA9ICJ2aXJ0dWFsL2NyeXB0IgogCi0tIAoyLjQ0LjEKCg==

--===============7046361240566371461==--

