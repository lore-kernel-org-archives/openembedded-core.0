Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65964C61CE3
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 05:57:15 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15667.1787637421694782831
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 22:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=I4ixADS2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=USzBZeWC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a0377e521e-2c8265c2-08ad-441a-98bf-600509b4f06e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787637420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DN5IH1+PC33x8jEIGPgCvR9g6Ti3Aez9DN3eCbUsNWQ=;
	b=I4ixADS277POQXhe9Rd7kATmoehaidKmMouHhrMnOBBChr1sm/NlEV5M96Lolp5z
	FZ9632Fr+VUVtKbC/qwOnW/JKAXJy+VUNval79LyFONXzIUTcrwBJtsSdQ9jY6MBSwe
	zkmMv/w6IDpQC5Y5jdMOAM0cBTq2xgHzL1s9HIso=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787637420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DN5IH1+PC33x8jEIGPgCvR9g6Ti3Aez9DN3eCbUsNWQ=;
	b=USzBZeWCguGacubvYaEzWjC7KeXGfQO+pek2sXLE8L7nYS00Tp8UYGH02Bm2b0Ia
	U1nl82eXA9hesQM7VoD3p9vdrOGQbnYiitdYjRaOK+IoQJW41w1MAxkuTA7STaJsasW
	MbFPc1RoXLQUIuZHSK8z7K+ApNYX+gLY/lPaei4c=
Content-Type: multipart/mixed; boundary="===============1910469525370612104=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pbr: upgrading to 7.1.1 SUCCEEDED
Message-ID: <010101a0377e521e-2c8265c2-08ad-441a-98bf-600509b4f06e-000000@us-west-2.amazonses.com>
Date: Tue, 25 Aug 2026 05:57:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.25-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 05:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244196

--===============1910469525370612104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pbr* to *7.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pbr-upgrade-7.1.0-7.1.1.patch
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
From 609c25722ced140c2f8b6c92799238217ff99f10 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 25 Aug 2026 05:56:54 +0000
Subject: [PATCH] python3-pbr: upgrade 7.1.0 -> 7.1.1

Source: ChangeLog

7.1.1
-----

* Fix hook ordering race that drops subpackages from wheels
---
 .../python/{python3-pbr_7.1.0.bb => python3-pbr_7.1.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pbr_7.1.0.bb => python3-pbr_7.1.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pbr_7.1.0.bb b/meta/recipes-devtools/python/python3-pbr_7.1.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pbr_7.1.0.bb
rename to meta/recipes-devtools/python/python3-pbr_7.1.1.bb
index 7fc227e6bb..987c1615f1 100644
--- a/meta/recipes-devtools/python/python3-pbr_7.1.0.bb
+++ b/meta/recipes-devtools/python/python3-pbr_7.1.1.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN} += "python3-setuptools"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "66ece3a2f5c4f05e5f37569213e755193f6e00b8aa361bfb190533ea8ee8b10c"
+SRC_URI[sha256sum] = "973da2aee9961d7cb278aa74e1829f6daafec9dd8ee8c1655cbf3f5843bfe083"
-- 
2.47.1


--===============1910469525370612104==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pbr-upgrade-7.1.0-7.1.1.patch"

RnJvbSA2MDljMjU3MjJjZWQxNDBjMmY4YjZjOTI3OTkyMzgyMTdmZjk5ZjEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjUgQXVnIDIwMjYgMDU6NTY6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBicjogdXBncmFkZSA3LjEuMCAtPiA3LjEuMQoKU291cmNlOiBDaGFuZ2VMb2cKCjcu
MS4xCi0tLS0tCgoqIEZpeCBob29rIG9yZGVyaW5nIHJhY2UgdGhhdCBkcm9wcyBzdWJwYWNrYWdl
cyBmcm9tIHdoZWVscwotLS0KIC4uLi9weXRob24ve3B5dGhvbjMtcGJyXzcuMS4wLmJiID0+IHB5
dGhvbjMtcGJyXzcuMS4xLmJifSAgICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24ve3B5dGhvbjMtcGJyXzcuMS4wLmJiID0+IHB5dGhvbjMtcGJyXzcuMS4xLmJifSAoODMlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYnJfNy4x
LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGJyXzcuMS4xLmJi
CnNpbWlsYXJpdHkgaW5kZXggODMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1wYnJfNy4xLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1wYnJfNy4xLjEuYmIKaW5kZXggN2ZjMjI3ZTZiYi4uOTg3YzE2MTVm
MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBicl83
LjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGJyXzcu
MS4xLmJiCkBAIC0xMyw0ICsxMyw0IEBAIFJERVBFTkRTOiR7UE59ICs9ICJweXRob24zLXNldHVw
dG9vbHMiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjY2ZWNlM2EyZjVjNGYwNWU1ZjM3NTY5MjEzZTc1NTE5M2Y2ZTAwYjhhYTM2
MWJmYjE5MDUzM2VhOGVlOGIxMGMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTczZGEyYWVlOTk2
MWQ3Y2IyNzhhYTc0ZTE4MjlmNmRhYWZlYzlkZDhlZThjMTY1NWNiZjNmNTg0M2JmZTA4MyIKLS0g
CjIuNDcuMQoK

--===============1910469525370612104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pbr: PV changed from "7.1.0" to "7.1.1"
packages/x86-64-v3-poky-linux/python3-pbr: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pbr/pbr-7.1.0.tar.gz;downloadfilename=pbr-7.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pbr/pbr-7.1.1.tar.gz;downloadfilename=pbr-7.1.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-pbr: PKGV changed from 7.1.0 [default] to 7.1.1 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dbg: PV changed from "7.1.0" to "7.1.1"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dbg: PKGV changed from 7.1.0 [default] to 7.1.1 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dev: PV changed from "7.1.0" to "7.1.1"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dev: PKGV changed from 7.1.0 [default] to 7.1.1 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-doc: PV changed from "7.1.0" to "7.1.1"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-doc: PKGV changed from 7.1.0 [default] to 7.1.1 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-locale: PV changed from "7.1.0" to "7.1.1"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-locale: PKGV changed from 7.1.0 [default] to 7.1.1 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-src: PV changed from "7.1.0" to "7.1.1"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-src: PKGV changed from 7.1.0 [default] to 7.1.1 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-staticdev: PV changed from "7.1.0" to "7.1.1"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-staticdev: PKGV changed from 7.1.0 [default] to 7.1.1 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: PKGSIZE changed from 740279 to 740392 (+0%)
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: PV changed from "7.1.0" to "7.1.1"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pbr-7.1.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info -> /usr/lib/python3.14/site-packages/pbr-7.1.1.dist-info
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: PKGV changed from 7.1.0 [default] to 7.1.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pbr (sysroot):
  /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info moved to /usr/lib/python3.14/site-packages/pbr-7.1.1.dist-info

--===============1910469525370612104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pbr-changelog.txt"

Changelog for python3-pbr: 7.1.0 -> 7.1.1
Source: ChangeLog

7.1.1
-----

* Fix hook ordering race that drops subpackages from wheels

--===============1910469525370612104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pbr-7.1.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info -> /usr/lib/python3.14/site-packages/pbr-7.1.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pbr (sysroot):
  /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info moved to /usr/lib/python3.14/site-packages/pbr-7.1.1.dist-info

--===============1910469525370612104==--

