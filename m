Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A790CC982F1
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 05:42:15 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3735.1790055734584313590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 22:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Vnvm9kYn;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ma0VlzSN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a0c7a2d974-961368ac-1655-40a6-892e-4df7a23668dd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790055733;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Fo7pBvcOhvyItM0DhsXpb4iiXy7Qsd+MarYKkvFaWrQ=;
	b=Vnvm9kYnL5GwAepp2/shY6PGNgU4D+qrCSQ7hprOAk6hKmjBYatknFZwFomwRmRG
	lM5UKdHc/6AvSlcRcG677yO2PJ8nx+7vjXdlNUNx1Z1W+37o1gikPQa38IM3J6SeDF7
	AHhJ82jFBYaGI6E+GLOA+0oOVj5RNnPO3VjH4wis=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790055733;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Fo7pBvcOhvyItM0DhsXpb4iiXy7Qsd+MarYKkvFaWrQ=;
	b=ma0VlzSNjWl0gVvfYdwlgbm6or1Jes/fnHjsutBfp2kj/fdz0YQzf311XJvfn69b
	2vcRr/Y1H0B0JZG3uVnleA+YGDHZFkg4GR9sHtHKmMAb44k1H2+6wcdA5BE2RfO1z2d
	iFpMerMahUWULbn1N5CCkIs+4NnsMAm/ZoJwb+R4=
Content-Type: multipart/mixed; boundary="===============1237486511527552768=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 330 SUCCEEDED
Message-ID: <010101a0c7a2d974-961368ac-1655-40a6-892e-4df7a23668dd-000000@us-west-2.amazonses.com>
Date: Tue, 22 Sep 2026 05:42:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.22-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 05:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246374

--===============1237486511527552768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *330* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-329-330.patch
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
From 44f7a5e6aab9bf33d756043c3d762619a67178f9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 22 Sep 2026 05:42:07 +0000
Subject: [PATCH] diffoscope: upgrade 329 -> 330

---
 .../diffoscope/{diffoscope_329.bb => diffoscope_330.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_329.bb => diffoscope_330.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_329.bb b/meta/recipes-support/diffoscope/diffoscope_330.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_329.bb
rename to meta/recipes-support/diffoscope/diffoscope_330.bb
index f803321631..87c20546d8 100644
--- a/meta/recipes-support/diffoscope/diffoscope_329.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_330.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "940ee30d8d98231f4d4855e36caf96e9eec9ec3d3cb359b744687b369b2b54d9"
+SRC_URI[sha256sum] = "92fb70b930077282ceaf104b4eb02c6368c860b0c89d6aab98f0a55682ee0361"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============1237486511527552768==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-329-330.patch"

RnJvbSA0NGY3YTVlNmFhYjliZjMzZDc1NjA0M2MzZDc2MjYxOWE2NzE3OGY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjIgU2VwIDIwMjYgMDU6NDI6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDMyOSAtPiAzMzAKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMzI5LmJiID0+IGRpZmZvc2NvcGVfMzMwLmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8zMjkuYmIgPT4gZGlmZm9zY29wZV8z
MzAuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMyOS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8zMzAuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMyOS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMzMC5iYgppbmRleCBmODAzMzIx
NjMxLi44N2MyMDU0NmQ4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMzI5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMzAuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9ZDMyMjM5YmNiNjczNDYzYWI4NzRlODBkNDdmYWU1MDQiCiAK
IGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTQwZWUz
MGQ4ZDk4MjMxZjRkNDg1NWUzNmNhZjk2ZTllZWM5ZWMzZDNjYjM1OWI3NDQ2ODdiMzY5YjJiNTRk
OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5MmZiNzBiOTMwMDc3MjgyY2VhZjEwNGI0ZWIwMmM2
MzY4Yzg2MGIwYzg5ZDZhYWI5OGYwYTU1NjgyZWUwMzYxIgogCiBSREVQRU5EUzoke1BOfSArPSAi
XAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ3LjEKCg==

--===============1237486511527552768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-329.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-330.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/diffoscope-329.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-330.dist-info
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-329.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-330.dist-info

--===============1237486511527552768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 329 [default] to 330 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "329" to "330"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 329 [default] to 330 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "329" to "330"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 329 [default] to 330 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "329" to "330"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 329 [default] to 330 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "329" to "330"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 329 [default] to 330 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "329" to "330"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 329 [default] to 330 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "329" to "330"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 329 [default] to 330 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "329" to "330"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-329.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-330.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/diffoscope-329.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-330.dist-info
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 329 [default] to 330 [default]
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "329" to "330"
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-329.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-330.tar.gz"
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-329.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-330.dist-info

--===============1237486511527552768==--

