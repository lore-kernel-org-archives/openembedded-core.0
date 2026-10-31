Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1567.1793425338550586871
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 22:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cGNlevuB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Di0vVseR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a1907aed14-0be9b10a-b007-4119-a082-2c46ada7fc7a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793425337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zEbyhN9cNjtXJO9ZUWk45igwFwVGW3RESqy2uTpJt2E=;
	b=cGNlevuB8J4BAyRcixUg4HDe/7ZVWbKBfixneZgS9mTT4RbxyNJ3qV0JabLpNT/c
	HfOSRUj2VShJL3Tn5EhGOghPYKM4RF8gSYzkP6Mc74Yi1SosDCldXnjarr94gj12UZZ
	rdnh+UtOsfglcYuxis/4W1Numex+FmhzGMVnqKtI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793425337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zEbyhN9cNjtXJO9ZUWk45igwFwVGW3RESqy2uTpJt2E=;
	b=Di0vVseRn46HYU3GTCMA56+WzDNUVfTu/lc5T6nqTOeeZ4BNC8SbdVsxVkYY8r4+
	GUhNXsNRaHIMMTlu7XXzmM6v0PSPm8Vdl76cNgph/bplLQrpy0vh/wbFJxRLOByf6hm
	2l8ije2aLygvHOb0kkbzqjuSJX8KFcaQfCY9JRx8=
Content-Type: multipart/mixed; boundary="===============2309597393803099629=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-websockets: upgrading to 17.4 SUCCEEDED
Message-ID: <010101a1907aed14-0be9b10a-b007-4119-a082-2c46ada7fc7a-000000@us-west-2.amazonses.com>
Date: Sat, 31 Oct 2026 05:42:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.31-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 05:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249136

--===============2309597393803099629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-websockets* to *17.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-websockets-upgrade-17.1-17.4.patch
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
From 6d7fb275e2a3ecfcb9fbd24187831348547cebe3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 31 Oct 2026 05:22:06 +0000
Subject: [PATCH] python3-websockets: upgrade 17.1 -> 17.4

---
 .../{python3-websockets_17.1.bb => python3-websockets_17.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_17.1.bb => python3-websockets_17.4.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_17.1.bb b/meta/recipes-devtools/python/python3-websockets_17.4.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_17.1.bb
rename to meta/recipes-devtools/python/python3-websockets_17.4.bb
index b5ee3ec661..81c8ebed2a 100644
--- a/meta/recipes-devtools/python/python3-websockets_17.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_17.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "acfea4c20bf54384883ea33b1240fc1db4f52e190823a4e2b334bc3e8bfca96a"
+SRC_URI[sha256sum] = "09d3939b70df0c8ad2da145ebd50978bccaee1d565e838b0e7921a34d38571eb"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.1


--===============2309597393803099629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-websockets: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/websockets/websockets-17.1.tar.gz" to "https://files.pythonhosted.org/packages/source/w/websockets/websockets-17.4.tar.gz"
packages/x86-64-v3-poky-linux/python3-websockets: PKGV changed from 17.1 [default] to 17.4 [default]
packages/x86-64-v3-poky-linux/python3-websockets: PV changed from "17.1" to "17.4"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dbg: PKGV changed from 17.1 [default] to 17.4 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dbg: PV changed from "17.1" to "17.4"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dev: PKGV changed from 17.1 [default] to 17.4 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dev: PV changed from "17.1" to "17.4"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-doc: PKGV changed from 17.1 [default] to 17.4 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-doc: PV changed from "17.1" to "17.4"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-locale: PKGV changed from 17.1 [default] to 17.4 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-locale: PV changed from "17.1" to "17.4"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: PKGV changed from 17.1 [default] to 17.4 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: FILELIST: directory renamed /usr/src/debug/python3-websockets/17.1/src/websockets -> /usr/src/debug/python3-websockets/17.4/src/websockets
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: PV changed from "17.1" to "17.4"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-staticdev: PKGV changed from 17.1 [default] to 17.4 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-staticdev: PV changed from "17.1" to "17.4"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PKGSIZE changed from 1711167 to 1729135 (+1%)
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PKGV changed from 17.1 [default] to 17.4 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: FILELIST: directory renamed /usr/lib/python3.14/site-packages/websockets-17.1.dist-info -> /usr/lib/python3.14/site-packages/websockets-17.4.dist-info, directory renamed /usr/lib/python3.14/site-packages/websockets-17.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/websockets-17.4.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PV changed from "17.1" to "17.4"
Changes to packages/x86-64-v3-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.14/site-packages/websockets-17.1.dist-info moved to /usr/lib/python3.14/site-packages/websockets-17.4.dist-info

--===============2309597393803099629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: FILELIST: directory renamed /usr/lib/python3.14/site-packages/websockets-17.1.dist-info -> /usr/lib/python3.14/site-packages/websockets-17.4.dist-info, directory renamed /usr/lib/python3.14/site-packages/websockets-17.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/websockets-17.4.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.14/site-packages/websockets-17.1.dist-info moved to /usr/lib/python3.14/site-packages/websockets-17.4.dist-info

--===============2309597393803099629==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-websockets-upgrade-17.1-17.4.patch"

RnJvbSA2ZDdmYjI3NWUyYTNlY2ZjYjlmYmQyNDE4NzgzMTM0ODU0N2NlYmUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMzEgT2N0IDIwMjYgMDU6MjI6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdlYnNvY2tldHM6IHVwZ3JhZGUgMTcuMSAtPiAxNy40CgotLS0KIC4uLi97cHl0aG9u
My13ZWJzb2NrZXRzXzE3LjEuYmIgPT4gcHl0aG9uMy13ZWJzb2NrZXRzXzE3LjQuYmJ9ICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtd2Vic29ja2V0c18xNy4xLmJi
ID0+IHB5dGhvbjMtd2Vic29ja2V0c18xNy40LmJifSAoNzklKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJzb2NrZXRzXzE3LjEuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2Vic29ja2V0c18xNy40LmJiCnNpbWls
YXJpdHkgaW5kZXggNzklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy13ZWJzb2NrZXRzXzE3LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy13ZWJzb2NrZXRzXzE3LjQuYmIKaW5kZXggYjVlZTNlYzY2MS4uODFj
OGViZWQyYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXdlYnNvY2tldHNfMTcuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtd2Vic29ja2V0c18xNy40LmJiCkBAIC02LDcgKzYsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT01MTkyNGE2YWY0NDk1YjhjZmFlZTFiMWRhODY5YjZmNCIK
IAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImFjZmVhNGMyMGJmNTQzODQ4ODNlYTMzYjEyNDBmYzFkYjRmNTJlMTkwODIz
YTRlMmIzMzRiYzNlOGJmY2E5NmEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDlkMzkzOWI3MGRm
MGM4YWQyZGExNDVlYmQ1MDk3OGJjY2FlZTFkNTY1ZTgzOGIwZTc5MjFhMzRkMzg1NzFlYiIKIAog
QkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgogCi0tIAoyLjQ3LjEKCg==

--===============2309597393803099629==--
