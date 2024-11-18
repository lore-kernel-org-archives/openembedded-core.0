Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A69D60061
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:31 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.4819.1731964633904052047
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=gBlxx2O5;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=1b+CntUX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010193412321d1-f44dd47a-1585-4ab9-bf7e-270c9ce10698-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964641;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Vz6mzQKdrY4aDdJ5PbMkay31zj/LZ3O2RM6x8LFWGbg=;
	b=gBlxx2O57Zhb74Bkd4OnUADzkL2ShZDUldPNpmIdVbm4ds1zEZYw0IEsbpe1bwEp
	hQchJvxn/hqb8UbYrMLQuHWn3RfsDBhjMO7EECB8JO4B7vpP3CQ9ECB5BmmyCsRFHkT
	DBJ7ph3VVQqk9YbLyrlWnwLjuE15xO7lAyOea44g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964641;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Vz6mzQKdrY4aDdJ5PbMkay31zj/LZ3O2RM6x8LFWGbg=;
	b=1b+CntUXOUtWO74JiWZEyniQFqxkMPBm3BcQfyRYv8WaYH6UyweGiS81RNvHS7W1
	yPwfORjbisqsSfiG5WK2cMjvijH52qqth9uW43t6KFCGDNmpVj8HWX+5jLjsDJ25Y3w
	yR+HbBY4+0B2sZUSRCttRZhDk8EjSitqnuwDj5cE=
Content-Type: multipart/mixed; boundary="===============1423657617510887377=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-websockets: upgrading to 14.1 SUCCEEDED
Message-ID: <01010193412321d1-f44dd47a-1585-4ab9-bf7e-270c9ce10698-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207297

--===============1423657617510887377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-websockets* to *14.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-websockets-upgrade-13.1-14.1.patch
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
From f6d68ff8004b4cdd40a9010bfb75d2ba30aa5b9a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 17 Nov 2024 03:34:58 +0000
Subject: [PATCH] python3-websockets: upgrade 13.1 -> 14.1

---
 .../{python3-websockets_13.1.bb => python3-websockets_14.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_13.1.bb => python3-websockets_14.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_13.1.bb b/meta/recipes-devtools/python/python3-websockets_14.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_13.1.bb
rename to meta/recipes-devtools/python/python3-websockets_14.1.bb
index 36838745ca..ead833a2ac 100644
--- a/meta/recipes-devtools/python/python3-websockets_13.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_14.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "a3b3366087c1bc0a2795111edcadddb8b3b59509d5db5d7ea3fdd69f954a8878"
+SRC_URI[sha256sum] = "398b10c77d471c0aab20a845e7a60076b6390bfdaac7a6d2edb0d2c59d75e8d8"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.44.1


--===============1423657617510887377==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-websockets-upgrade-13.1-14.1.patch"

RnJvbSBmNmQ2OGZmODAwNGI0Y2RkNDBhOTAxMGJmYjc1ZDJiYTMwYWE1YjlhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTcgTm92IDIwMjQgMDM6MzQ6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdlYnNvY2tldHM6IHVwZ3JhZGUgMTMuMSAtPiAxNC4xCgotLS0KIC4uLi97cHl0aG9u
My13ZWJzb2NrZXRzXzEzLjEuYmIgPT4gcHl0aG9uMy13ZWJzb2NrZXRzXzE0LjEuYmJ9ICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtd2Vic29ja2V0c18xMy4xLmJi
ID0+IHB5dGhvbjMtd2Vic29ja2V0c18xNC4xLmJifSAoNzklKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJzb2NrZXRzXzEzLjEuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2Vic29ja2V0c18xNC4xLmJiCnNpbWls
YXJpdHkgaW5kZXggNzklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy13ZWJzb2NrZXRzXzEzLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy13ZWJzb2NrZXRzXzE0LjEuYmIKaW5kZXggMzY4Mzg3NDVjYS4uZWFk
ODMzYTJhYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXdlYnNvY2tldHNfMTMuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtd2Vic29ja2V0c18xNC4xLmJiCkBAIC02LDcgKzYsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT01MTkyNGE2YWY0NDk1YjhjZmFlZTFiMWRhODY5YjZmNCIK
IAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImEzYjMzNjYwODdjMWJjMGEyNzk1MTExZWRjYWRkZGI4YjNiNTk1MDlkNWRi
NWQ3ZWEzZmRkNjlmOTU0YTg4NzgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzk4YjEwYzc3ZDQ3
MWMwYWFiMjBhODQ1ZTdhNjAwNzZiNjM5MGJmZGFhYzdhNmQyZWRiMGQyYzU5ZDc1ZThkOCIKIAog
QkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgogCi0tIAoyLjQ0LjEKCg==

--===============1423657617510887377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.13/site-packages/websockets-13.1.dist-info moved to /usr/lib/python3.13/site-packages/websockets-14.1.dist-info

--===============1423657617510887377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-websockets: PKGV changed from 13.1 [default] to 14.1 [default]
packages/core2-64-poky-linux/python3-websockets: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/websockets/websockets-13.1.tar.gz;downloadfilename=websockets-13.1.tar.gz" to "https://files.pythonhosted.org/packages/source/w/websockets/websockets-14.1.tar.gz;downloadfilename=websockets-14.1.tar.gz"
packages/core2-64-poky-linux/python3-websockets: PV changed from "13.1" to "14.1"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-dbg: PV changed from "13.1" to "14.1"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-dbg: PKGV changed from 13.1 [default] to 14.1 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-dev: PV changed from "13.1" to "14.1"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-dev: PKGV changed from 13.1 [default] to 14.1 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-doc: PV changed from "13.1" to "14.1"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-doc: PKGV changed from 13.1 [default] to 14.1 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-locale: PV changed from "13.1" to "14.1"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-locale: PKGV changed from 13.1 [default] to 14.1 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-src: PV changed from "13.1" to "14.1"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-src: PKGV changed from 13.1 [default] to 14.1 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-staticdev: PV changed from "13.1" to "14.1"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-staticdev: PKGV changed from 13.1 [default] to 14.1 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets: PV changed from "13.1" to "14.1"
packages/core2-64-poky-linux/python3-websockets/python3-websockets: PKGSIZE changed from 1132241 to 1167247 (+3%)
packages/core2-64-poky-linux/python3-websockets/python3-websockets: PKGV changed from 13.1 [default] to 14.1 [default]
Changes to packages/core2-64-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.13/site-packages/websockets-13.1.dist-info moved to /usr/lib/python3.13/site-packages/websockets-14.1.dist-info

--===============1423657617510887377==--

