Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF55C87FDA
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:37 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.1431.1751386833381078906
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XPFuRhnJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=FKQyiVUd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010197c6ca473e-b5627559-9931-4c0c-9138-d04782b34faf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386834;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iJAxtJwJTOGsVYeFQEnxZhQu6mkGQks0SPMxTDrDPK8=;
	b=XPFuRhnJbBfqFkuFnHaBfL3Hb9pZlCGML/1rBIAJiKLYmpJ3pdo/cKnOri+cJI5O
	ddFkp89PA0tbFV5+FgOA1DvWq94cDMhZv5X51MWmEghZIl3KFL7mhb8hJxYWGwZEVk4
	CxJmTLTdCYFDG9Fvn8glcmGlmZZsYcUFBACz8RsA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386834;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iJAxtJwJTOGsVYeFQEnxZhQu6mkGQks0SPMxTDrDPK8=;
	b=FKQyiVUdXBdKP1s4ifMoJl9zKb4+OOpOyoO50oowj9PLeaGxIl1lqkd7dxJZPTo6
	fwy5U9V2ambDJXVpH20nCvKwNsIfBbzGZEL8IJVZDrUKz9+2/EpK5Yab6HTN7Im0UUp
	+/Zg7m+KitSVCEs8Rh/HInSgCjNRv3LuramaC9L0=
Content-Type: multipart/mixed; boundary="===============1525808237752268229=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] re2c: upgrading to 4.3 SUCCEEDED
Message-ID: <01010197c6ca473e-b5627559-9931-4c0c-9138-d04782b34faf-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219707

--===============1525808237752268229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *re2c* to *4.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-re2c-upgrade-4.2-4.3.patch
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
From f83ebb06595ea57d30f35b8d43dbba959b5c1d38 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 16:12:50 +0000
Subject: [PATCH] re2c: upgrade 4.2 -> 4.3

---
 meta/recipes-support/re2c/{re2c_4.2.bb => re2c_4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_4.2.bb => re2c_4.3.bb} (90%)

diff --git a/meta/recipes-support/re2c/re2c_4.2.bb b/meta/recipes-support/re2c/re2c_4.3.bb
similarity index 90%
rename from meta/recipes-support/re2c/re2c_4.2.bb
rename to meta/recipes-support/re2c/re2c_4.3.bb
index 0696080603..eafdf93078 100644
--- a/meta/recipes-support/re2c/re2c_4.2.bb
+++ b/meta/recipes-support/re2c/re2c_4.3.bb
@@ -7,7 +7,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c9dc2b24f340d135a07a1ac63ff53f7f8f74997fed5a4e9132a64050dbc3da1f"
+SRC_URI[sha256sum] = "51e88d6d6b6ab03eb7970276aca7e0db4f8e29c958b84b561d2fdcb8351c7150"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============1525808237752268229==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-re2c-upgrade-4.2-4.3.patch"

RnJvbSBmODNlYmIwNjU5NWVhNTdkMzBmMzViOGQ0M2RiYmE5NTliNWMxZDM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxNjoxMjo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
MmM6IHVwZ3JhZGUgNC4yIC0+IDQuMwoKLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9yZTJjL3ty
ZTJjXzQuMi5iYiA9PiByZTJjXzQuMy5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9yZTJj
L3tyZTJjXzQuMi5iYiA9PiByZTJjXzQuMy5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9yZTJjL3JlMmNfNC4yLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcmUy
Yy9yZTJjXzQuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9yZTJjL3JlMmNfNC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9yZTJjL3JlMmNfNC4zLmJiCmluZGV4IDA2OTYwODA2MDMuLmVhZmRmOTMwNzggMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3JlMmMvcmUyY180LjIuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvcmUyYy9yZTJjXzQuMy5iYgpAQCAtNyw3ICs3LDcgQEAgTElDRU5TRSA9ICJQ
RCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTY0ZWNhNGQ4YTNiNjdm
OWRjNzY1NjA5NDczMWEyYzhkIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3du
bG9hZC8ke1BWfS8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImM5
ZGMyYjI0ZjM0MGQxMzVhMDdhMWFjNjNmZjUzZjdmOGY3NDk5N2ZlZDVhNGU5MTMyYTY0MDUwZGJj
M2RhMWYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTFlODhkNmQ2YjZhYjAzZWI3OTcwMjc2YWNh
N2UwZGI0ZjhlMjljOTU4Yjg0YjU2MWQyZmRjYjgzNTFjNzE1MCIKIEdJVEhVQl9CQVNFX1VSSSA9
ICJodHRwczovL2dpdGh1Yi5jb20vc2t2YWRyaWsvcmUyYy9yZWxlYXNlcyIKIAogQkJDTEFTU0VY
VEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgotLSAKMi40Ny4xCgo=

--===============1525808237752268229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/re2c: PKGV changed from 4.2 [default] to 4.3 [default]
packages/core2-64-poky-linux/re2c: SRC_URI changed from "https://github.com/skvadrik/re2c/releases/download/4.2/re2c-4.2.tar.xz" to "https://github.com/skvadrik/re2c/releases/download/4.3/re2c-4.3.tar.xz"
packages/core2-64-poky-linux/re2c: PV changed from "4.2" to "4.3"
packages/core2-64-poky-linux/re2c/re2c-dbg: PKGV changed from 4.2 [default] to 4.3 [default]
packages/core2-64-poky-linux/re2c/re2c-dbg: PKGSIZE changed from 196441560 to 198946704 (+1%)
packages/core2-64-poky-linux/re2c/re2c-dbg: PV changed from "4.2" to "4.3"
packages/core2-64-poky-linux/re2c/re2c-dev: PKGV changed from 4.2 [default] to 4.3 [default]
packages/core2-64-poky-linux/re2c/re2c-dev: PV changed from "4.2" to "4.3"
packages/core2-64-poky-linux/re2c/re2c-doc: PKGV changed from 4.2 [default] to 4.3 [default]
packages/core2-64-poky-linux/re2c/re2c-doc: PKGSIZE changed from 1837365 to 1841512 (+0%)
packages/core2-64-poky-linux/re2c/re2c-doc: PV changed from "4.2" to "4.3"
packages/core2-64-poky-linux/re2c/re2c-locale: PKGV changed from 4.2 [default] to 4.3 [default]
packages/core2-64-poky-linux/re2c/re2c-locale: PV changed from "4.2" to "4.3"
packages/core2-64-poky-linux/re2c/re2c-src: PKGV changed from 4.2 [default] to 4.3 [default]
packages/core2-64-poky-linux/re2c/re2c-src: PKGSIZE changed from 1044830 to 1050464 (+1%)
packages/core2-64-poky-linux/re2c/re2c-src: PV changed from "4.2" to "4.3"
packages/core2-64-poky-linux/re2c/re2c-staticdev: PKGV changed from 4.2 [default] to 4.3 [default]
packages/core2-64-poky-linux/re2c/re2c-staticdev: PV changed from "4.2" to "4.3"
packages/core2-64-poky-linux/re2c/re2c: PKGV changed from 4.2 [default] to 4.3 [default]
packages/core2-64-poky-linux/re2c/re2c: PKGSIZE changed from 12508078 to 12553222 (+0%)
packages/core2-64-poky-linux/re2c/re2c: PV changed from "4.2" to "4.3"

--===============1525808237752268229==--

