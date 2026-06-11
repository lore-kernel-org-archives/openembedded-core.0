Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED1DCD98D5
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:49 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50418.1781195502152309190
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=pYVv676j;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TFaGOiCh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019eb78683f5-770f676f-6b33-4faa-96ee-57ec4e12b1d0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195506;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cJzdjunq5O4dDbs0mCvq7DuJOo0ZGm6pc05L2LanqkE=;
	b=pYVv676jkZ4Dg/abbhrjgG5fmt12PWsVpMswmp0AB9pIcgsBktdwdrbWEXjtQewd
	4VHbCg+6Pon81bToU7oCkXcc+aqq7dRGKvwuEv//xdgPI87AutfdDeKRi8ex4VmKkOe
	xLUrNCq3S03RYVJiuGy/7RDg3UwkjSmsxwyST1oc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195506;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cJzdjunq5O4dDbs0mCvq7DuJOo0ZGm6pc05L2LanqkE=;
	b=TFaGOiChUxJvhTBxDDntR8g873aoNh+ZP1CR197xyRfdLVHBukJGp1XY0THUyWE8
	IRKG/b6PE3Uqp3QxFTONuDPOmb+9iKqXVKyoHWu4AZaUcuAhri/50HbVWLnNfd3Tgcs
	Dnt2MMa2u+1BTZShtGRobvukGr6uFniXgPEGRIak=
Content-Type: multipart/mixed; boundary="===============8705519841495425164=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm-backend: upgrading to 2.4.9 SUCCEEDED
Message-ID: <0101019eb78683f5-770f676f-6b33-4faa-96ee-57ec4e12b1d0-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238496

--===============8705519841495425164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm-backend* to *2.4.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-backend-upgrade-2.4.8-2.4.9.patch
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
From b5d541200ccde8446437f519e06a4c0f9c267090 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 09:55:46 +0000
Subject: [PATCH] python3-pdm-backend: upgrade 2.4.8 -> 2.4.9

---
 ...ython3-pdm-backend_2.4.8.bb => python3-pdm-backend_2.4.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm-backend_2.4.8.bb => python3-pdm-backend_2.4.9.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-pdm-backend_2.4.8.bb b/meta/recipes-devtools/python/python3-pdm-backend_2.4.9.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-pdm-backend_2.4.8.bb
rename to meta/recipes-devtools/python/python3-pdm-backend_2.4.9.bb
index 5833bb717b..cdeadbaf1c 100644
--- a/meta/recipes-devtools/python/python3-pdm-backend_2.4.8.bb
+++ b/meta/recipes-devtools/python/python3-pdm-backend_2.4.9.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "d8ef85d2c4306ee67195412d701fae9983e84ec6574598e26798ae26b7b3c7e0"
+SRC_URI[sha256sum] = "c41a852ccbf4b567b033db9b2ae78660d7a4ea49307719959ab88a01f0aabb2e"
 
 inherit pypi python_pep517
 
-- 
2.47.1


--===============8705519841495425164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm-backend: PV changed from "2.4.8" to "2.4.9"
packages/x86-64-v3-poky-linux/python3-pdm-backend: PKGV changed from 2.4.8 [default] to 2.4.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm_backend/pdm_backend-2.4.8.tar.gz;downloadfilename=pdm_backend-2.4.8.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm_backend/pdm_backend-2.4.9.tar.gz;downloadfilename=pdm_backend-2.4.9.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dbg: PV changed from "2.4.8" to "2.4.9"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dbg: PKGV changed from 2.4.8 [default] to 2.4.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dev: PV changed from "2.4.8" to "2.4.9"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dev: PKGV changed from 2.4.8 [default] to 2.4.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-doc: PV changed from "2.4.8" to "2.4.9"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-doc: PKGV changed from 2.4.8 [default] to 2.4.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-locale: PV changed from "2.4.8" to "2.4.9"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-locale: PKGV changed from 2.4.8 [default] to 2.4.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-src: PV changed from "2.4.8" to "2.4.9"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-src: PKGV changed from 2.4.8 [default] to 2.4.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-staticdev: PV changed from "2.4.8" to "2.4.9"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-staticdev: PKGV changed from 2.4.8 [default] to 2.4.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: PV changed from "2.4.8" to "2.4.9"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: PKGV changed from 2.4.8 [default] to 2.4.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm_backend-2.4.8.dist-info -> /usr/lib/python3.14/site-packages/pdm_backend-2.4.9.dist-info, directory renamed /usr/lib/python3.14/site-packages/pdm_backend-2.4.8.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm_backend-2.4.9.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pdm-backend (sysroot):
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.8.dist-info moved to /usr/lib/python3.14/site-packages/pdm_backend-2.4.9.dist-info

--===============8705519841495425164==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-backend-upgrade-2.4.8-2.4.9.patch"

RnJvbSBiNWQ1NDEyMDBjY2RlODQ0NjQzN2Y1MTllMDZhNGMwZjljMjY3MDkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMDk6NTU6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbS1iYWNrZW5kOiB1cGdyYWRlIDIuNC44IC0+IDIuNC45CgotLS0KIC4uLnl0aG9u
My1wZG0tYmFja2VuZF8yLjQuOC5iYiA9PiBweXRob24zLXBkbS1iYWNrZW5kXzIuNC45LmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40
LjguYmIgPT4gcHl0aG9uMy1wZG0tYmFja2VuZF8yLjQuOS5iYn0gKDc5JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40Ljgu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40
LjkuYmIKc2ltaWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBkbS1iYWNrZW5kXzIuNC44LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40LjkuYmIKaW5kZXgg
NTgzM2JiNzE3Yi4uY2RlYWRiYWYxYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBkbS1iYWNrZW5kXzIuNC44LmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG0tYmFja2VuZF8yLjQuOS5iYgpAQCAtNCw3ICs0LDcg
QEAgTElDRU5TRSA9ICJNSVQiCiBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTRhNTY0Mjk3YjNjNWI2MjlhNTI4YjkyZmQ4ZmY2
MWVhIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDhlZjg1ZDJjNDMwNmVlNjcxOTU0MTJkNzAx
ZmFlOTk4M2U4NGVjNjU3NDU5OGUyNjc5OGFlMjZiN2IzYzdlMCIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICJjNDFhODUyY2NiZjRiNTY3YjAzM2RiOWIyYWU3ODY2MGQ3YTRlYTQ5MzA3NzE5OTU5YWI4
OGEwMWYwYWFiYjJlIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3BlcDUxNwogCi0tIAoyLjQ3LjEK
Cg==

--===============8705519841495425164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm_backend-2.4.8.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm_backend-2.4.9.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pdm_backend-2.4.8.dist-info -> /usr/lib/python3.14/site-packages/pdm_backend-2.4.9.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pdm-backend (sysroot):
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.8.dist-info moved to /usr/lib/python3.14/site-packages/pdm_backend-2.4.9.dist-info

--===============8705519841495425164==--

