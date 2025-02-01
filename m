Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB5AC021AF
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:00 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.42638.1738416057175640651
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=e8hVZVY2;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=qCmveGEq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010194c1abe959-4d9ca05f-37ea-49d1-8e19-9d6b00e853f2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416056;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2kaFZJXIqkL2juDzmaxrXg2whte9TlTw/EQC7iS+j8o=;
	b=e8hVZVY2iI6XwfEv1snEwzhjksB2WQvoA8vIlOmL40cavbr/8j2/ZNHh6LgnM53T
	bRINAvZ7e2NfXjUYRgXlb5DDryb0qRWPYIl3qt+ZsL9b8nt9l8seimPLPswCpCkcyG3
	5nUJMvK2HClXMvWzcW2bD4tGiKjdPjXRXkITIO94=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416056;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2kaFZJXIqkL2juDzmaxrXg2whte9TlTw/EQC7iS+j8o=;
	b=qCmveGEqFVhxWNg8QHB0LcGiH+Hrs/LW7D3ARQsAO8tAjFv7NNqCtOpomKqiakok
	BZYhoHtj+pKCxdci7Ug3/Ul2zCxG8aFebHeFzO3ySVrsJ1MfJFmyWHM4pcbzjBhY3uI
	h1D+NUeMOZ5Eli4nxM9KFqRPmhfLKxN4CGhzgnqQ=
Content-Type: multipart/mixed; boundary="===============6847923139274903921=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-websockets: upgrading to 14.2 SUCCEEDED
Message-ID: <01010194c1abe959-4d9ca05f-37ea-49d1-8e19-9d6b00e853f2-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210547

--===============6847923139274903921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-websockets* to *14.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-websockets-upgrade-14.1-14.2.patch
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
From d0ffdc2a1084010549aab81b10d066e7daad2cc1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 08:47:18 +0000
Subject: [PATCH] python3-websockets: upgrade 14.1 -> 14.2

---
 .../{python3-websockets_14.1.bb => python3-websockets_14.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_14.1.bb => python3-websockets_14.2.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_14.1.bb b/meta/recipes-devtools/python/python3-websockets_14.2.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_14.1.bb
rename to meta/recipes-devtools/python/python3-websockets_14.2.bb
index ead833a2ac..0c7b7d2470 100644
--- a/meta/recipes-devtools/python/python3-websockets_14.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_14.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "398b10c77d471c0aab20a845e7a60076b6390bfdaac7a6d2edb0d2c59d75e8d8"
+SRC_URI[sha256sum] = "5059ed9c54945efb321f097084b4c7e52c246f2c869815876a69d1efc4ad6eb5"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.44.1


--===============6847923139274903921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-websockets: PKGV changed from 14.1 [default] to 14.2 [default]
packages/core2-64-poky-linux/python3-websockets: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/websockets/websockets-14.1.tar.gz;downloadfilename=websockets-14.1.tar.gz" to "https://files.pythonhosted.org/packages/source/w/websockets/websockets-14.2.tar.gz;downloadfilename=websockets-14.2.tar.gz"
packages/core2-64-poky-linux/python3-websockets: PV changed from "14.1" to "14.2"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-dbg: PKGV changed from 14.1 [default] to 14.2 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-dbg: PV changed from "14.1" to "14.2"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-dev: PKGV changed from 14.1 [default] to 14.2 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-dev: PV changed from "14.1" to "14.2"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-doc: PKGV changed from 14.1 [default] to 14.2 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-doc: PV changed from "14.1" to "14.2"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-locale: PKGV changed from 14.1 [default] to 14.2 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-locale: PV changed from "14.1" to "14.2"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-src: PKGV changed from 14.1 [default] to 14.2 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-src: PV changed from "14.1" to "14.2"
packages/core2-64-poky-linux/python3-websockets/python3-websockets-staticdev: PKGV changed from 14.1 [default] to 14.2 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets-staticdev: PV changed from "14.1" to "14.2"
packages/core2-64-poky-linux/python3-websockets/python3-websockets: PKGV changed from 14.1 [default] to 14.2 [default]
packages/core2-64-poky-linux/python3-websockets/python3-websockets: PKGSIZE changed from 1162959 to 1171172 (+1%)
packages/core2-64-poky-linux/python3-websockets/python3-websockets: PV changed from "14.1" to "14.2"
Changes to packages/core2-64-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.13/site-packages/websockets-14.1.dist-info moved to /usr/lib/python3.13/site-packages/websockets-14.2.dist-info

--===============6847923139274903921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.13/site-packages/websockets-14.1.dist-info moved to /usr/lib/python3.13/site-packages/websockets-14.2.dist-info

--===============6847923139274903921==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-websockets-upgrade-14.1-14.2.patch"

RnJvbSBkMGZmZGMyYTEwODQwMTA1NDlhYWI4MWIxMGQwNjZlN2RhYWQyY2MxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwODo0NzoxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtd2Vic29ja2V0czogdXBncmFkZSAxNC4xIC0+IDE0LjIKCi0tLQogLi4uL3tweXRob24z
LXdlYnNvY2tldHNfMTQuMS5iYiA9PiBweXRob24zLXdlYnNvY2tldHNfMTQuMi5iYn0gIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13ZWJzb2NrZXRzXzE0LjEuYmIg
PT4gcHl0aG9uMy13ZWJzb2NrZXRzXzE0LjIuYmJ9ICg3OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdlYnNvY2tldHNfMTQuMS5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJzb2NrZXRzXzE0LjIuYmIKc2ltaWxh
cml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXdlYnNvY2tldHNfMTQuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXdlYnNvY2tldHNfMTQuMi5iYgppbmRleCBlYWQ4MzNhMmFjLi4wYzdi
N2QyNDcwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
d2Vic29ja2V0c18xNC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy13ZWJzb2NrZXRzXzE0LjIuYmIKQEAgLTYsNyArNiw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTUxOTI0YTZhZjQ0OTViOGNmYWVlMWIxZGE4NjliNmY0Igog
CiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiMzk4YjEwYzc3ZDQ3MWMwYWFiMjBhODQ1ZTdhNjAwNzZiNjM5MGJmZGFhYzdh
NmQyZWRiMGQyYzU5ZDc1ZThkOCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1MDU5ZWQ5YzU0OTQ1
ZWZiMzIxZjA5NzA4NGI0YzdlNTJjMjQ2ZjJjODY5ODE1ODc2YTY5ZDFlZmM0YWQ2ZWI1IgogCiBC
QkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCiAKLS0gCjIuNDQuMQoK

--===============6847923139274903921==--

