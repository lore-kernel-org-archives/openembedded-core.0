Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0C0CA5FF5
	for <webhook@archiver.kernel.org>; Sun,  4 Oct 2026 05:24:53 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18732.1791091482860923943
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 22:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dcfbH7zQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pzyrAj0B;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a1055f1d47-096640b1-5a4c-47df-9337-e14cd26c7e45-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791091482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yB7N/TcCW5iXGFgt6cGTIsJzKDz86z0lnq/Ioz7a6T0=;
	b=dcfbH7zQBmft80ea8EpPDDSorJr5taKyWijh+0D1WlaBSNdXa7zO3YRWgmigsUoC
	RjLeBatguIr+S9pg5j03Ar7B/vW9QMgujuEzI08hcEczEmE28DXiAv+tCKd+i8Azcm4
	KmLugxgutGrNPCL1L6gP4RDCM2GXVtxBFbD7bk28=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791091482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yB7N/TcCW5iXGFgt6cGTIsJzKDz86z0lnq/Ioz7a6T0=;
	b=pzyrAj0B8+Wg5U4q5PN3M4/14qLuwee4x0KIJ7HxMm1ajuKZ7Sn8oCtF3sFWm1JB
	W5rvpgbMB0atllTp53nx6b6K9lskInF+p4I9Ju2wpzSrLjNbwhYiOc3GxdUgTXz0uP8
	kg9CrCjVKBrWgbgtSRmUrHsPgcpVZB1BgTrVO/XA=
Content-Type: multipart/mixed; boundary="===============0218817866616986610=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-websockets: upgrading to 17.2 SUCCEEDED
Message-ID: <010101a1055f1d47-096640b1-5a4c-47df-9337-e14cd26c7e45-000000@us-west-2.amazonses.com>
Date: Sun, 4 Oct 2026 05:24:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.04-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 05:24:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247190

--===============0218817866616986610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-websockets* to *17.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-websockets-upgrade-17.1-17.2.patch
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
From f6923d43125eda86de0648fa65d05662a6e54647 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 4 Oct 2026 05:16:18 +0000
Subject: [PATCH] python3-websockets: upgrade 17.1 -> 17.2

---
 .../{python3-websockets_17.1.bb => python3-websockets_17.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_17.1.bb => python3-websockets_17.2.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_17.1.bb b/meta/recipes-devtools/python/python3-websockets_17.2.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_17.1.bb
rename to meta/recipes-devtools/python/python3-websockets_17.2.bb
index b5ee3ec661..64f8296100 100644
--- a/meta/recipes-devtools/python/python3-websockets_17.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_17.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "acfea4c20bf54384883ea33b1240fc1db4f52e190823a4e2b334bc3e8bfca96a"
+SRC_URI[sha256sum] = "36c2fb94c990cc2545143b12690e2de6c16300f9dbe5b4f33fa300cf57dc8792"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.1


--===============0218817866616986610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: FILELIST: directory renamed /usr/lib/python3.14/site-packages/websockets-17.1.dist-info -> /usr/lib/python3.14/site-packages/websockets-17.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/websockets-17.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/websockets-17.2.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.14/site-packages/websockets-17.1.dist-info moved to /usr/lib/python3.14/site-packages/websockets-17.2.dist-info

--===============0218817866616986610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-websockets: PV changed from "17.1" to "17.2"
packages/x86-64-v3-poky-linux/python3-websockets: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/websockets/websockets-17.1.tar.gz" to "https://files.pythonhosted.org/packages/source/w/websockets/websockets-17.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-websockets: PKGV changed from 17.1 [default] to 17.2 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dbg: PV changed from "17.1" to "17.2"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dbg: PKGV changed from 17.1 [default] to 17.2 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dev: PV changed from "17.1" to "17.2"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dev: PKGV changed from 17.1 [default] to 17.2 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-doc: PV changed from "17.1" to "17.2"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-doc: PKGV changed from 17.1 [default] to 17.2 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-locale: PV changed from "17.1" to "17.2"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-locale: PKGV changed from 17.1 [default] to 17.2 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: PV changed from "17.1" to "17.2"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: FILELIST: directory renamed /usr/src/debug/python3-websockets/17.1/src/websockets -> /usr/src/debug/python3-websockets/17.2/src/websockets
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: PKGV changed from 17.1 [default] to 17.2 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-staticdev: PV changed from "17.1" to "17.2"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-staticdev: PKGV changed from 17.1 [default] to 17.2 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PKGSIZE changed from 1711167 to 1717733 (+0%)
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PV changed from "17.1" to "17.2"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: FILELIST: directory renamed /usr/lib/python3.14/site-packages/websockets-17.1.dist-info -> /usr/lib/python3.14/site-packages/websockets-17.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/websockets-17.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/websockets-17.2.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PKGV changed from 17.1 [default] to 17.2 [default]
Changes to packages/x86-64-v3-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.14/site-packages/websockets-17.1.dist-info moved to /usr/lib/python3.14/site-packages/websockets-17.2.dist-info

--===============0218817866616986610==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-websockets-upgrade-17.1-17.2.patch"

RnJvbSBmNjkyM2Q0MzEyNWVkYTg2ZGUwNjQ4ZmE2NWQwNTY2MmE2ZTU0NjQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgNCBPY3QgMjAyNiAwNToxNjoxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtd2Vic29ja2V0czogdXBncmFkZSAxNy4xIC0+IDE3LjIKCi0tLQogLi4uL3tweXRob24z
LXdlYnNvY2tldHNfMTcuMS5iYiA9PiBweXRob24zLXdlYnNvY2tldHNfMTcuMi5iYn0gIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13ZWJzb2NrZXRzXzE3LjEuYmIg
PT4gcHl0aG9uMy13ZWJzb2NrZXRzXzE3LjIuYmJ9ICg3OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdlYnNvY2tldHNfMTcuMS5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJzb2NrZXRzXzE3LjIuYmIKc2ltaWxh
cml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXdlYnNvY2tldHNfMTcuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXdlYnNvY2tldHNfMTcuMi5iYgppbmRleCBiNWVlM2VjNjYxLi42NGY4
Mjk2MTAwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
d2Vic29ja2V0c18xNy4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy13ZWJzb2NrZXRzXzE3LjIuYmIKQEAgLTYsNyArNiw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTUxOTI0YTZhZjQ0OTViOGNmYWVlMWIxZGE4NjliNmY0Igog
CiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiYWNmZWE0YzIwYmY1NDM4NDg4M2VhMzNiMTI0MGZjMWRiNGY1MmUxOTA4MjNh
NGUyYjMzNGJjM2U4YmZjYTk2YSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzNmMyZmI5NGM5OTBj
YzI1NDUxNDNiMTI2OTBlMmRlNmMxNjMwMGY5ZGJlNWI0ZjMzZmEzMDBjZjU3ZGM4NzkyIgogCiBC
QkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCiAKLS0gCjIuNDcuMQoK

--===============0218817866616986610==--

