Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B82DF4213D
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:40 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19742.1776261879795160481
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=sjH9fZTX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=q+6LQK2Q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019d91755585-154a1dc3-8541-4844-b159-84286d224732-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261879;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yay7Z3wqYRZybW77TUS7TjcNn3XQObM8MQ4RyFh/to4=;
	b=sjH9fZTXceiXAIGH6M+39E5pT3i/evTi7m9Y0pu8x8CyCAxtuNW+VksCE9xRGkaW
	cvkC6b6HKnSMUlHs3UsXiPI2gQ+X/aWmPzBHbfvtC8PNCHgsrHiUI0rWn5jS4B7Dvkd
	wiRGVKfdO1EXfz2rTT5UkXVlXiDl7WngD2mnRkkU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261879;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yay7Z3wqYRZybW77TUS7TjcNn3XQObM8MQ4RyFh/to4=;
	b=q+6LQK2QHjxcheByJcidVnVzioSLqW7fwQzD2gMXfH5iq8ZxUznm8RgZTijmHMuP
	MZFM483vRYLNoJbwYkRu0iQJrES0ar5l5XSWFagU5zXocAzjcBLeR0TkgUD8vTE5Y2C
	GsS93x0LZjmJ0k0wzZAaQvnaA5NGXPSd/Fh5/F+4=
Content-Type: multipart/mixed; boundary="===============7445091772096058999=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-mako: upgrading to 1.3.11 SUCCEEDED
Message-ID: <0101019d91755585-154a1dc3-8541-4844-b159-84286d224732-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235236

--===============7445091772096058999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-mako* to *1.3.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-mako-upgrade-1.3.10-1.3.11.patch
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
From a7b187e47cc878520825403119d840cce52b3755 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 07:49:02 +0000
Subject: [PATCH] python3-mako: upgrade 1.3.10 -> 1.3.11

---
 .../python/{python3-mako_1.3.10.bb => python3-mako_1.3.11.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.3.10.bb => python3-mako_1.3.11.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.10.bb b/meta/recipes-devtools/python/python3-mako_1.3.11.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-mako_1.3.10.bb
rename to meta/recipes-devtools/python/python3-mako_1.3.11.bb
index 2d937dc184..eec18da0fb 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.10.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.11.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "mako"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI[sha256sum] = "99579a6f39583fa7e5630a28c3c1f440e4e97a414b80372649c0ce338da2ea28"
+SRC_URI[sha256sum] = "071eb4ab4c5010443152255d77db7faa6ce5916f35226eb02dc34479b6858069"
 
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \
-- 
2.47.1


--===============7445091772096058999==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-mako-upgrade-1.3.10-1.3.11.patch"

RnJvbSBhN2IxODdlNDdjYzg3ODUyMDgyNTQwMzExOWQ4NDBjY2U1MmIzNzU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDc6NDk6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1ha286IHVwZ3JhZGUgMS4zLjEwIC0+IDEuMy4xMQoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLW1ha29fMS4zLjEwLmJiID0+IHB5dGhvbjMtbWFrb18xLjMuMTEuYmJ9ICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW1ha29fMS4zLjEwLmJiID0+IHB5
dGhvbjMtbWFrb18xLjMuMTEuYmJ9ICg4OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLW1ha29fMS4zLjEwLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLW1ha29fMS4zLjExLmJiCnNpbWlsYXJpdHkgaW5kZXggODglCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMy4x
MC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1ha29f
MS4zLjExLmJiCmluZGV4IDJkOTM3ZGMxODQuLmVlYzE4ZGEwZmIgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMy4xMC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjMuMTEuYmIKQEAgLTgsNyAr
OCw3IEBAIFBZUElfUEFDS0FHRSA9ICJtYWtvIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVw
dG9vbHNfYnVpbGRfbWV0YSBwdGVzdC1weXRob24tcHl0ZXN0CiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICI5OTU3OWE2ZjM5NTgzZmE3ZTU2MzBhMjhjM2MxZjQ0MGU0ZTk3YTQxNGI4MDM3MjY0OWMw
Y2UzMzhkYTJlYTI4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA3MWViNGFiNGM1MDEwNDQzMTUy
MjU1ZDc3ZGI3ZmFhNmNlNTkxNmYzNTIyNmViMDJkYzM0NDc5YjY4NTgwNjkiCiAKIFJERVBFTkRT
OiR7UE59ID0gInB5dGhvbjMtaHRtbCBcCiAgICAgICAgICAgICAgICAgICBweXRob24zLW1hcmt1
cHNhZmUgXAotLSAKMi40Ny4xCgo=

--===============7445091772096058999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-mako/python3-mako: FILELIST: directory renamed /usr/lib/python3.14/site-packages/mako-1.3.10.dist-info -> /usr/lib/python3.14/site-packages/mako-1.3.11.dist-info, directory renamed /usr/lib/python3.14/site-packages/mako-1.3.10.dist-info/licenses -> /usr/lib/python3.14/site-packages/mako-1.3.11.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.14/site-packages/mako-1.3.10.dist-info moved to /usr/lib/python3.14/site-packages/mako-1.3.11.dist-info

--===============7445091772096058999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-mako: PV changed from "1.3.10" to "1.3.11"
packages/x86-64-v3-poky-linux/python3-mako: PKGV changed from 1.3.10 [default] to 1.3.11 [default]
packages/x86-64-v3-poky-linux/python3-mako: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/mako/mako-1.3.10.tar.gz;downloadfilename=mako-1.3.10.tar.gz" to "https://files.pythonhosted.org/packages/source/m/mako/mako-1.3.11.tar.gz;downloadfilename=mako-1.3.11.tar.gz"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-dbg: PV changed from "1.3.10" to "1.3.11"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-dbg: PKGV changed from 1.3.10 [default] to 1.3.11 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-dev: PV changed from "1.3.10" to "1.3.11"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-dev: PKGV changed from 1.3.10 [default] to 1.3.11 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-doc: PV changed from "1.3.10" to "1.3.11"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-doc: PKGV changed from 1.3.10 [default] to 1.3.11 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-locale: PV changed from "1.3.10" to "1.3.11"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-locale: PKGV changed from 1.3.10 [default] to 1.3.11 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-ptest: PV changed from "1.3.10" to "1.3.11"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-ptest: PKGSIZE changed from 352365 to 353965 (+0%)
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-ptest: PKGV changed from 1.3.10 [default] to 1.3.11 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-src: PV changed from "1.3.10" to "1.3.11"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-src: PKGV changed from 1.3.10 [default] to 1.3.11 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-staticdev: PV changed from "1.3.10" to "1.3.11"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-staticdev: PKGV changed from 1.3.10 [default] to 1.3.11 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako: PV changed from "1.3.10" to "1.3.11"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako: PKGSIZE changed from 648724 to 648617 (-0%)
packages/x86-64-v3-poky-linux/python3-mako/python3-mako: FILELIST: directory renamed /usr/lib/python3.14/site-packages/mako-1.3.10.dist-info/licenses -> /usr/lib/python3.14/site-packages/mako-1.3.11.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/mako-1.3.10.dist-info -> /usr/lib/python3.14/site-packages/mako-1.3.11.dist-info
packages/x86-64-v3-poky-linux/python3-mako/python3-mako: PKGV changed from 1.3.10 [default] to 1.3.11 [default]
Changes to packages/x86-64-v3-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.14/site-packages/mako-1.3.10.dist-info moved to /usr/lib/python3.14/site-packages/mako-1.3.11.dist-info

--===============7445091772096058999==--

