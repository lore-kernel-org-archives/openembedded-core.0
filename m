Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC343C2D0CE
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:40 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.42210.1717263218081781367
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fnQoZVIu;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=DTVWXcIE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018fd4dd3528-1673fee0-5cec-4e13-a40a-12677a33b3c7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3OiBlt3pOmna3CHgWUc6jk6oaasYoJotILe9yNX220I=;
	b=fnQoZVIuIDgPPZUUA7iXWNou5vTog4WWtBWkS0MoXRdJnyRiGU5E2HxpyFE4mWWr
	bIODp5f4tRr30z4JFPmfHeQnpU2yAHFrYMCwC4v6HDgq/3i7y6WTaMM3SJEl4G1L+BB
	Fb/B0uqCfM6L01lh3A+lVHQtEtX/PgY3VdvcCAo0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3OiBlt3pOmna3CHgWUc6jk6oaasYoJotILe9yNX220I=;
	b=DTVWXcIEZaiGwLGVOxc+D2SznAiKNRWMpChJWs7mdzVkG/Pvy8jIPO26CpfXTYWy
	RhagednxaYXQJ71kzKbJinlmDp8yn5IT9K+TmzyC7CfqEaJp0VZRe2rEQNUc8qElA9N
	YZBxGL/XQAui+zABtbK1XdqodqNXInn1BkmpFncY=
Content-Type: multipart/mixed; boundary="===============9202749448719056139=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-typing-extensions: upgrading to 4.12.0 SUCCEEDED
Message-ID: <0101018fd4dd3528-1673fee0-5cec-4e13-a40a-12677a33b3c7-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200137

--===============9202749448719056139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-typing-extensions* to *4.12.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-typing-extensions-upgrade-4.11.0-4.12.0.patch
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
From 6a3aa1c7bffd5e105ff71be980a5057fecb2bd49 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 09:38:28 +0000
Subject: [PATCH] python3-typing-extensions: upgrade 4.11.0 -> 4.12.0

---
 ...extensions_4.11.0.bb => python3-typing-extensions_4.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.11.0.bb => python3-typing-extensions_4.12.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.11.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.12.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.11.0.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.12.0.bb
index ad45b669ec..87d8158f75 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.11.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.12.0.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[sha256sum] = "83f085bd5ca59c80295fc2a82ab5dac679cbe02b9f33f7d83af68e241bea51b0"
+SRC_URI[sha256sum] = "8cbcdc8606ebcb0d95453ad7dc5065e6237b6aa230a31e81d0f440c30fed5fd8"
 
 inherit pypi python_flit_core
 
-- 
2.44.0


--===============9202749448719056139==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-typing-extensions-upgrade-4.11.0-4.12.0.patch"

RnJvbSA2YTNhYTFjN2JmZmQ1ZTEwNWZmNzFiZTk4MGE1MDU3ZmVjYjJiZDQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAwOTozODoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdHlwaW5nLWV4dGVuc2lvbnM6IHVwZ3JhZGUgNC4xMS4wIC0+IDQuMTIuMAoKLS0tCiAu
Li5leHRlbnNpb25zXzQuMTEuMC5iYiA9PiBweXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuMTIu
MC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXR5cGluZy1l
eHRlbnNpb25zXzQuMTEuMC5iYiA9PiBweXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuMTIuMC5i
Yn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdHlwaW5nLWV4dGVuc2lvbnNfNC4xMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuMTIuMC5iYgpzaW1pbGFyaXR5IGluZGV4
IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHlw
aW5nLWV4dGVuc2lvbnNfNC4xMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtdHlwaW5nLWV4dGVuc2lvbnNfNC4xMi4wLmJiCmluZGV4IGFkNDViNjY5
ZWMuLjg3ZDgxNThmNzUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy10eXBpbmctZXh0ZW5zaW9uc180LjExLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuMTIuMC5iYgpAQCAtMTUs
NyArMTUsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1mY2Y2YjI0
OWMyNjQxNTQwMjE5YTcyN2YzNWQ4ZDJjMiIKICMgVGhlIG5hbWUgb24gUHlQaSBpcyBzbGlnaHRs
eSBkaWZmZXJlbnQuCiBQWVBJX1BBQ0tBR0UgPSAidHlwaW5nX2V4dGVuc2lvbnMiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI4M2YwODViZDVjYTU5YzgwMjk1ZmMyYTgyYWI1ZGFjNjc5Y2JlMDJi
OWYzM2Y3ZDgzYWY2OGUyNDFiZWE1MWIwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhjYmNkYzg2
MDZlYmNiMGQ5NTQ1M2FkN2RjNTA2NWU2MjM3YjZhYTIzMGEzMWU4MWQwZjQ0MGMzMGZlZDVmZDgi
CiAKIGluaGVyaXQgcHlwaSBweXRob25fZmxpdF9jb3JlCiAKLS0gCjIuNDQuMAoK

--===============9202749448719056139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-typing-extensions: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/typing_extensions/typing_extensions-4.11.0.tar.gz;downloadfilename=typing_extensions-4.11.0.tar.gz" to "https://files.pythonhosted.org/packages/source/t/typing_extensions/typing_extensions-4.12.0.tar.gz;downloadfilename=typing_extensions-4.12.0.tar.gz"
packages/core2-64-poky-linux/python3-typing-extensions: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/core2-64-poky-linux/python3-typing-extensions: PV changed from "4.11.0" to "4.12.0"
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-dbg: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-dbg: PV changed from "4.11.0" to "4.12.0"
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-dev: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-dev: PV changed from "4.11.0" to "4.12.0"
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-doc: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-doc: PV changed from "4.11.0" to "4.12.0"
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-locale: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-locale: PV changed from "4.11.0" to "4.12.0"
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-src: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-src: PV changed from "4.11.0" to "4.12.0"
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-staticdev: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-staticdev: PV changed from "4.11.0" to "4.12.0"
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions: PKGSIZE changed from 267732 to 290049 (+8%)
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions: PV changed from "4.11.0" to "4.12.0"
Changes to packages/core2-64-poky-linux/python3-typing-extensions (sysroot):
  /usr/lib/python3.12/site-packages/typing_extensions-4.11.0.dist-info moved to /usr/lib/python3.12/site-packages/typing_extensions-4.12.0.dist-info

--===============9202749448719056139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-typing-extensions (sysroot):
  /usr/lib/python3.12/site-packages/typing_extensions-4.11.0.dist-info moved to /usr/lib/python3.12/site-packages/typing_extensions-4.12.0.dist-info

--===============9202749448719056139==--

