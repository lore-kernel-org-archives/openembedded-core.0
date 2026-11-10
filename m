Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13770.1794287755616411604
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 21:15:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ERa94O6k;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mvHZBl2n;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a1c3e25d65-3bba7c26-8a6a-472e-8fb9-db0d58867a94-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794287754;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z6iQxwK/vM1tm5APbW22HCZHSPf9Jc1IWyB7bjq2LrA=;
	b=ERa94O6kP3WxNxqG0RU+P51bV2S8ofZo98PfyguxN7Fhar2FFkpUB23qqSFLQKc7
	DeoiGSr5Bn90QqWxlEwRMNTTim7yu1jqObUagfg4fWcwBOHRybBQM6cQCDg3Y0brt0Y
	WKPyzO+PF/JVsjmso3QP7wmi2RAIQ6gQlTHzqPiU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794287754;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z6iQxwK/vM1tm5APbW22HCZHSPf9Jc1IWyB7bjq2LrA=;
	b=mvHZBl2nksEZVp4v1igdvKElMybVvrrEe7p0zspWpP1sw+sKGAjnxOFPOQxDwuRD
	09tB/SVTntu84aNTp7Betr+NUwuzT+32iKWvX8hjMs2GUsedJdJ0uBdB/8yy7EPanzk
	I0FpTrr+IL8AkMNabqnHh1fpHCazj/YKsvRZGPe8=
Content-Type: multipart/mixed; boundary="===============3001520932435660293=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 338 SUCCEEDED
Message-ID: <010101a1c3e25d65-3bba7c26-8a6a-472e-8fb9-db0d58867a94-000000@us-west-2.amazonses.com>
Date: Tue, 10 Nov 2026 05:15:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.10-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 05:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249897

--===============3001520932435660293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *338* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-332-338.patch
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
From 5a89d6c51198e1198fc9c0d579d9e0c781420472 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 10 Nov 2026 05:15:48 +0000
Subject: [PATCH] diffoscope: upgrade 332 -> 338

---
 .../diffoscope/{diffoscope_332.bb => diffoscope_338.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_332.bb => diffoscope_338.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_332.bb b/meta/recipes-support/diffoscope/diffoscope_338.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_332.bb
rename to meta/recipes-support/diffoscope/diffoscope_338.bb
index a43b20b460..96bd21979b 100644
--- a/meta/recipes-support/diffoscope/diffoscope_332.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_338.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "da858807ce2535f1bb5c3942020b01c7aef14f870257c964b70cd4e1f2333206"
+SRC_URI[sha256sum] = "4a5c71e91602de46a09c3c8cfae82941b9e96b6a56bbca654a7b81240f69e372"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============3001520932435660293==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-332-338.patch"

RnJvbSA1YTg5ZDZjNTExOThlMTE5OGZjOWMwZDU3OWQ5ZTBjNzgxNDIwNDcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTAgTm92IDIwMjYgMDU6MTU6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDMzMiAtPiAzMzgKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMzMyLmJiID0+IGRpZmZvc2NvcGVfMzM4LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8zMzIuYmIgPT4gZGlmZm9zY29wZV8z
MzguYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMzMi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8zMzguYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMzMi5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMzOC5iYgppbmRleCBhNDNiMjBi
NDYwLi45NmJkMjE5NzliIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMzMyLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMzguYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9ZDMyMjM5YmNiNjczNDYzYWI4NzRlODBkNDdmYWU1MDQiCiAK
IGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGE4NTg4
MDdjZTI1MzVmMWJiNWMzOTQyMDIwYjAxYzdhZWYxNGY4NzAyNTdjOTY0YjcwY2Q0ZTFmMjMzMzIw
NiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0YTVjNzFlOTE2MDJkZTQ2YTA5YzNjOGNmYWU4Mjk0
MWI5ZTk2YjZhNTZiYmNhNjU0YTdiODEyNDBmNjllMzcyIgogCiBSREVQRU5EUzoke1BOfSArPSAi
XAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ3LjEKCg==

--===============3001520932435660293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-332.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-338.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-332.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-338.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-332.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-338.dist-info

--===============3001520932435660293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "332" to "338"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 332 [default] to 338 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "332" to "338"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 332 [default] to 338 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "332" to "338"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 332 [default] to 338 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "332" to "338"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 332 [default] to 338 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "332" to "338"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 332 [default] to 338 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "332" to "338"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 332 [default] to 338 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1433312 to 1448530 (+1%)
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "332" to "338"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 332 [default] to 338 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-332.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-338.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/diffoscope-332.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-338.dist-info
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "332" to "338"
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 332 [default] to 338 [default]
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-332.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-338.tar.gz"
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-332.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-338.dist-info

--===============3001520932435660293==--
