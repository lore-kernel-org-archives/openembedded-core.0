Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16564.1792647340891844664
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 22:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eeZfkcA/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=coCu958p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1621b9f00-99dfed0d-163e-4fa3-9074-98d1f32046ef-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792647340;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+DDUTO0haMlwahP2u7POQEvbvCIl11B06ROEdq5Hxt4=;
	b=eeZfkcA/ctT81kY7uNyrKDRag4XDSwLrlffzW+3aDtoCLKxNGVBsbpxK0Tz4dBTu
	XPeEdW3YT9C0fHcyYODPtQcYWOr1HrYYB/w/vepPIkclOX2fzDdRbEtAdLHyz9LYftC
	3obujteOYlVYh0ciIqTVPvEfX+SsvXRpgamk+MMU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792647340;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+DDUTO0haMlwahP2u7POQEvbvCIl11B06ROEdq5Hxt4=;
	b=coCu958po2LjNo/i7WghOH77sGBgX7cxjg7juCABJ6gA4nBMgDWM6i71Vdl6oRKg
	JeOyZdaHhPiebIaULqFfq8dty/04UTJVZc/unbg2pv0mfk7UBHBZ62le3zX5d79BCTS
	dHq4yR6ONiDY12Tpe7rOhsRsd/g2JAkB0/OlDRXY=
Content-Type: multipart/mixed; boundary="===============4826653473931176453=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-zipp: upgrading to 4.1.2 SUCCEEDED
Message-ID: <010101a1621b9f00-99dfed0d-163e-4fa3-9074-98d1f32046ef-000000@us-west-2.amazonses.com>
Date: Thu, 22 Oct 2026 05:35:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.22-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 05:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248412

--===============4826653473931176453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-zipp* to *4.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-zipp-upgrade-4.1.0-4.1.2.patch
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
From 4f96f49b6cfb4ad157d4cdfb2042844c95bacc47 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 22 Oct 2026 05:19:41 +0000
Subject: [PATCH] python3-zipp: upgrade 4.1.0 -> 4.1.2

v4.1.2
======

No significant changes.

v4.1.1
======

Bugfixes
--------

- Correct ``!`` negation and literal ``^`` characters in character classes in
  ``Path.glob`` and ``Path.rglob``, without matching path separators.
---
 .../python/{python3-zipp_4.1.0.bb => python3-zipp_4.1.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_4.1.0.bb => python3-zipp_4.1.2.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-zipp_4.1.0.bb b/meta/recipes-devtools/python/python3-zipp_4.1.2.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-zipp_4.1.0.bb
rename to meta/recipes-devtools/python/python3-zipp_4.1.2.bb
index ca3f1250c3..1245b555b5 100644
--- a/meta/recipes-devtools/python/python3-zipp_4.1.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_4.1.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2e21c3f75eb8d9427c8a611a8e83e9d6"
 
-SRC_URI[sha256sum] = "4cb57381f544315db7688e976e922a2b18cdb513d21cc194eb42232ba2a3e602"
+SRC_URI[sha256sum] = "cf474b90b07ea932637e17c6b9479de2b2882900b0d311bdaf4f5c000a15a97f"
 
 DEPENDS += "python3-setuptools-scm-native python3-coherent-licensed-native"
 
-- 
2.47.1


--===============4826653473931176453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-zipp: PKGV changed from 4.1.0 [default] to 4.1.2 [default]
packages/x86-64-v3-poky-linux/python3-zipp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/z/zipp/zipp-4.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/z/zipp/zipp-4.1.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-zipp: PV changed from "4.1.0" to "4.1.2"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-dbg: PKGV changed from 4.1.0 [default] to 4.1.2 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-dbg: PV changed from "4.1.0" to "4.1.2"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-dev: PKGV changed from 4.1.0 [default] to 4.1.2 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-dev: PV changed from "4.1.0" to "4.1.2"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-doc: PKGV changed from 4.1.0 [default] to 4.1.2 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-doc: PV changed from "4.1.0" to "4.1.2"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-locale: PKGV changed from 4.1.0 [default] to 4.1.2 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-locale: PV changed from "4.1.0" to "4.1.2"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-src: PKGV changed from 4.1.0 [default] to 4.1.2 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-src: PV changed from "4.1.0" to "4.1.2"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-staticdev: PKGV changed from 4.1.0 [default] to 4.1.2 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-staticdev: PV changed from "4.1.0" to "4.1.2"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp: FILELIST: directory renamed /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info -> /usr/lib/python3.14/site-packages/zipp-4.1.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/zipp-4.1.2.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp: PKGV changed from 4.1.0 [default] to 4.1.2 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp: PV changed from "4.1.0" to "4.1.2"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp: PKGSIZE changed from 53725 to 56251 (+5%)
Changes to packages/x86-64-v3-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info moved to /usr/lib/python3.14/site-packages/zipp-4.1.2.dist-info

--===============4826653473931176453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-zipp-changelog.txt"

v4.1.2
======

No significant changes.

v4.1.1
======

Bugfixes
--------

- Correct ``!`` negation and literal ``^`` characters in character classes in
  ``Path.glob`` and ``Path.rglob``, without matching path separators.

--===============4826653473931176453==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-zipp-upgrade-4.1.0-4.1.2.patch"

RnJvbSA0Zjk2ZjQ5YjZjZmI0YWQxNTdkNGNkZmIyMDQyODQ0Yzk1YmFjYzQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjIgT2N0IDIwMjYgMDU6MTk6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXppcHA6IHVwZ3JhZGUgNC4xLjAgLT4gNC4xLjIKCnY0LjEuMgo9PT09PT0KCk5vIHNp
Z25pZmljYW50IGNoYW5nZXMuCgp2NC4xLjEKPT09PT09CgpCdWdmaXhlcwotLS0tLS0tLQoKLSBD
b3JyZWN0IGBgIWBgIG5lZ2F0aW9uIGFuZCBsaXRlcmFsIGBgXmBgIGNoYXJhY3RlcnMgaW4gY2hh
cmFjdGVyIGNsYXNzZXMgaW4KICBgYFBhdGguZ2xvYmBgIGFuZCBgYFBhdGgucmdsb2JgYCwgd2l0
aG91dCBtYXRjaGluZyBwYXRoIHNlcGFyYXRvcnMuCi0tLQogLi4uL3B5dGhvbi97cHl0aG9uMy16
aXBwXzQuMS4wLmJiID0+IHB5dGhvbjMtemlwcF80LjEuMi5iYn0gICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy16aXBwXzQuMS4wLmJiID0+IHB5dGhvbjMtemlw
cF80LjEuMi5iYn0gKDgzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtemlwcF80LjEuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy16aXBwXzQuMS4yLmJiCnNpbWlsYXJpdHkgaW5kZXggODMlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy16aXBwXzQuMS4wLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF80LjEuMi5iYgppbmRl
eCBjYTNmMTI1MGMzLi4xMjQ1YjU1NWI1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtemlwcF80LjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtemlwcF80LjEuMi5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0Ug
PSAiaHR0cHM6Ly9naXRodWIuY29tL2phcmFjby96aXBwIgogTElDRU5TRSA9ICJNSVQiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0yZTIxYzNmNzVlYjhkOTQyN2M4YTYx
MWE4ZTgzZTlkNiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRjYjU3MzgxZjU0NDMxNWRiNzY4
OGU5NzZlOTIyYTJiMThjZGI1MTNkMjFjYzE5NGViNDIyMzJiYTJhM2U2MDIiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiY2Y0NzRiOTBiMDdlYTkzMjYzN2UxN2M2Yjk0NzlkZTJiMjg4MjkwMGIwZDMx
MWJkYWY0ZjVjMDAwYTE1YTk3ZiIKIAogREVQRU5EUyArPSAicHl0aG9uMy1zZXR1cHRvb2xzLXNj
bS1uYXRpdmUgcHl0aG9uMy1jb2hlcmVudC1saWNlbnNlZC1uYXRpdmUiCiAKLS0gCjIuNDcuMQoK

--===============4826653473931176453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp: FILELIST: directory renamed /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info -> /usr/lib/python3.14/site-packages/zipp-4.1.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/zipp-4.1.2.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info moved to /usr/lib/python3.14/site-packages/zipp-4.1.2.dist-info

--===============4826653473931176453==--
