Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251AFCA9EC5
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 05:38:00 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4312.1791610676431711204
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 22:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hGpb8uHT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qQlhPDlU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a12451610f-00898ee9-ee2c-4f1d-a478-08f458b30626-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791610675;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YoR+h0D0fWXyG/W9Hqabdt6f6gBk8O53ZgmDY8R44jE=;
	b=hGpb8uHTgfK84PNgo6E7t/AxRI83m3F8DhnJ5TxgPieOIZVsAlhPwoqmkjNymMKa
	G1sx/k/LGVwoom6I6uOOuNC+SeIGdOsNQ5nZi6dLAJtumLL7TFFTib3efS57wy30rWx
	VTmxHHRVNTJ3uHI50HFEXLxUTqnOsa+BvLLArWqA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791610675;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YoR+h0D0fWXyG/W9Hqabdt6f6gBk8O53ZgmDY8R44jE=;
	b=qQlhPDlUzzNwkbykhp4RWTFR2rB6gpepmYjp00/Y0341FkIfrD0f2vSeFQ6CXuvp
	s++lGYdd6Rs3T2tCGZ+vJcTsobwey91viP3GgOhX8Tf5EB39Qaae65uf3TXpxja2DgN
	odkU5FcSAP0l6JzVAsGP80sHLnBVL213cdi9FyMs=
Content-Type: multipart/mixed; boundary="===============5126050261700807605=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygobject: upgrading to 3.58.1 SUCCEEDED
Message-ID: <010101a12451610f-00898ee9-ee2c-4f1d-a478-08f458b30626-000000@us-west-2.amazonses.com>
Date: Sat, 10 Oct 2026 05:37:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.10-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2026 05:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247491

--===============5126050261700807605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pygobject* to *3.58.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygobject-upgrade-3.58.0-3.58.1.patch
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
From 179b2a04122c6c30bf1fe9ccb73acd21ea1719a2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 10 Oct 2026 05:12:58 +0000
Subject: [PATCH] python3-pygobject: upgrade 3.58.0 -> 3.58.1

3.58.1 - 2026-10-09
-------------------
---
 ...{python3-pygobject_3.58.0.bb => python3-pygobject_3.58.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.58.0.bb => python3-pygobject_3.58.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.58.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.58.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pygobject_3.58.0.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.58.1.bb
index 7f5bec8f70..82089c2ad7 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.58.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.58.1.bb
@@ -19,7 +19,7 @@ DEPENDS += "python3 glib-2.0"
 GNOME_COMPRESS_TYPE = "gz"
 GNOMEBN = "pygobject"
 
-SRC_URI[archive.sha256sum] = "45068697de3ffe46840ca369705f23118b34db4f7deb63f6eff079a6734ddcca"
+SRC_URI[archive.sha256sum] = "4c80598ade17fbaa7798e01a25d0bf29ce109740786026a074c5c62bb3e79d23"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.47.1


--===============5126050261700807605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pygobject: PV changed from "3.58.0" to "3.58.1"
packages/x86-64-v3-poky-linux/python3-pygobject: PKGV changed from 3.58.0 [default] to 3.58.1 [default]
packages/x86-64-v3-poky-linux/python3-pygobject: SRC_URI changed from "https://download.gnome.org/sources//pygobject/3.58/pygobject-3.58.0.tar.gz;name=archive" to "https://download.gnome.org/sources//pygobject/3.58/pygobject-3.58.1.tar.gz;name=archive"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PV changed from "3.58.0" to "3.58.1"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGV changed from 3.58.0 [default] to 3.58.1 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGSIZE changed from 1498592 to 1498600 (+0%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PV changed from "3.58.0" to "3.58.1"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PKGV changed from 3.58.0 [default] to 3.58.1 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-doc: PV changed from "3.58.0" to "3.58.1"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-doc: PKGV changed from 3.58.0 [default] to 3.58.1 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-locale: PV changed from "3.58.0" to "3.58.1"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-locale: PKGV changed from 3.58.0 [default] to 3.58.1 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PV changed from "3.58.0" to "3.58.1"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: FILELIST: directory renamed /usr/src/debug/python3-pygobject/3.58.0/gi -> /usr/src/debug/python3-pygobject/3.58.1/gi
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PKGV changed from 3.58.0 [default] to 3.58.1 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PKGSIZE changed from 852746 to 852870 (+0%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-staticdev: PV changed from "3.58.0" to "3.58.1"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-staticdev: PKGV changed from 3.58.0 [default] to 3.58.1 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PV changed from "3.58.0" to "3.58.1"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: FILELIST: directory renamed /usr/lib/python3.14/site-packages/PyGObject-3.58.0.dist-info -> /usr/lib/python3.14/site-packages/PyGObject-3.58.1.dist-info
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PKGV changed from 3.58.0 [default] to 3.58.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.14/site-packages/PyGObject-3.58.0.dist-info moved to /usr/lib/python3.14/site-packages/PyGObject-3.58.1.dist-info

--===============5126050261700807605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pygobject-changelog.txt"

3.58.1 - 2026-10-09
-------------------

--===============5126050261700807605==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygobject-upgrade-3.58.0-3.58.1.patch"

RnJvbSAxNzliMmEwNDEyMmM2YzMwYmYxZmU5Y2NiNzNhY2QyMWVhMTcxOWEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTAgT2N0IDIwMjYgMDU6MTI6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Z29iamVjdDogdXBncmFkZSAzLjU4LjAgLT4gMy41OC4xCgozLjU4LjEgLSAyMDI2
LTEwLTA5Ci0tLS0tLS0tLS0tLS0tLS0tLS0KLS0tCiAuLi57cHl0aG9uMy1weWdvYmplY3RfMy41
OC4wLmJiID0+IHB5dGhvbjMtcHlnb2JqZWN0XzMuNTguMS5iYn0gfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5Z29iamVjdF8zLjU4LjAuYmIgPT4gcHl0aG9uMy1w
eWdvYmplY3RfMy41OC4xLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1weWdvYmplY3RfMy41OC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjU4LjEuYmIKc2ltaWxhcml0eSBpbmRl
eCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5
Z29iamVjdF8zLjU4LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weWdvYmplY3RfMy41OC4xLmJiCmluZGV4IDdmNWJlYzhmNzAuLjgyMDg5YzJhZDcg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWdvYmpl
Y3RfMy41OC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
eWdvYmplY3RfMy41OC4xLmJiCkBAIC0xOSw3ICsxOSw3IEBAIERFUEVORFMgKz0gInB5dGhvbjMg
Z2xpYi0yLjAiCiBHTk9NRV9DT01QUkVTU19UWVBFID0gImd6IgogR05PTUVCTiA9ICJweWdvYmpl
Y3QiCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjQ1MDY4Njk3ZGUzZmZlNDY4NDBj
YTM2OTcwNWYyMzExOGIzNGRiNGY3ZGViNjNmNmVmZjA3OWE2NzM0ZGRjY2EiCitTUkNfVVJJW2Fy
Y2hpdmUuc2hhMjU2c3VtXSA9ICI0YzgwNTk4YWRlMTdmYmFhNzc5OGUwMWEyNWQwYmYyOWNlMTA5
NzQwNzg2MDI2YTA3NGM1YzYyYmIzZTc5ZDIzIgogCiBTID0gIiR7VU5QQUNLRElSfS8ke0dOT01F
Qk59LSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============5126050261700807605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: FILELIST: directory renamed /usr/lib/python3.14/site-packages/PyGObject-3.58.0.dist-info -> /usr/lib/python3.14/site-packages/PyGObject-3.58.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.14/site-packages/PyGObject-3.58.0.dist-info moved to /usr/lib/python3.14/site-packages/PyGObject-3.58.1.dist-info

--===============5126050261700807605==--

