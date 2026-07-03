Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCE0C44501
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 05:34:56 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86176.1783056892639265646
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 22:34:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RMPvd4k5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=u07L7X+N;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019f2678fedd-b4bc7529-a186-456b-9c6f-d18585277858-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783056891;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UaPhP1E7FhHAPyDyl8W72O2j97u2HtwwLceVt5oNUTw=;
	b=RMPvd4k5x/vbYnDJ/cx1x77b6LelPrkfrwa7iI5VPOxIoWKzIe/FZaUZUoEMZYjl
	BUmhviG6h4epWFgrD3gtkeSZo/4epZq1sm8dhWgZLQmlPlKMswr/S5FmGzpXoE2nmzd
	7Bp4zWNlQMPPz2Ge+vG5cgz6jjp45GTf+KiOXegE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783056891;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UaPhP1E7FhHAPyDyl8W72O2j97u2HtwwLceVt5oNUTw=;
	b=u07L7X+NQKJqVUeVAUOXCfx20H76GvQU5C9Fo776fCobUjVdPgAnTnyWfkBRfDWv
	ThEFKb8hIoEffeOOyDTYiY3NZlRxGXISJhek2LvSuJ7q3JWGVYwmHYtv6X0q6rFSB+9
	OyPLrc4LI47ifQZKc6TH5sJ0UmkkVVY1EAKKZU8U=
Content-Type: multipart/mixed; boundary="===============5392267425713263654=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-typing-extensions: upgrading to 4.16.0 SUCCEEDED
Message-ID: <0101019f2678fedd-b4bc7529-a186-456b-9c6f-d18585277858-000000@us-west-2.amazonses.com>
Date: Fri, 3 Jul 2026 05:34:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.03-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 05:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240073

--===============5392267425713263654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-typing-extensions* to *4.16.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-typing-extensions-upgrade-4.15.0-4.16.0.patch
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
From 42c84119554be27d1b9a0e012892966116a4970c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Jul 2026 05:18:38 +0000
Subject: [PATCH] python3-typing-extensions: upgrade 4.15.0 -> 4.16.0

---
 ...extensions_4.15.0.bb => python3-typing-extensions_4.16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.15.0.bb => python3-typing-extensions_4.16.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb
index 4ff85bb240..cede81e128 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[sha256sum] = "0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466"
+SRC_URI[sha256sum] = "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============5392267425713263654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-typing-extensions: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/x86-64-v3-poky-linux/python3-typing-extensions: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/typing_extensions/typing_extensions-4.15.0.tar.gz;downloadfilename=typing_extensions-4.15.0.tar.gz" to "https://files.pythonhosted.org/packages/source/t/typing_extensions/typing_extensions-4.16.0.tar.gz;downloadfilename=typing_extensions-4.16.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-typing-extensions: PV changed from "4.15.0" to "4.16.0"
packages/x86-64-v3-poky-linux/python3-typing-extensions/python3-typing-extensions-dbg: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/x86-64-v3-poky-linux/python3-typing-extensions/python3-typing-extensions-dbg: PV changed from "4.15.0" to "4.16.0"
packages/x86-64-v3-poky-linux/python3-typing-extensions/python3-typing-extensions-dev: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/x86-64-v3-poky-linux/python3-typing-extensions/python3-typing-extensions-dev: PV changed from "4.15.0" to "4.16.0"
packages/x86-64-v3-poky-linux/python3-typing-extensions/python3-typing-extensions-doc: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/x86-64-v3-poky-linux/python3-typing-extensions/python3-typing-extensions-doc: PV changed from "4.15.0" to "4.16.0"
packages/x86-64-v3-poky-linux/python3-typing-extensions/python3-typing-extensions-locale: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/x86-64-v3-poky-linux/python3-typing-extensions/python3-typing-extensions-locale: PV changed from "4.15.0" to "4.16.0"
packages/x86-64-v3-poky-linux/python3-typing-extensions/python3-typing-extensions-src: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/x86-64-v3-poky-linux/python3-typing-extensions/python3-typing-extensions-src: PV changed from "4.15.0" to "4.16.0"
packages/x86-64-v3-poky-linux/python3-typing-extensions/python3-typing-extensions-staticdev: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/x86-64-v3-poky-linux/python3-typing-extensions/python3-typing-extensions-staticdev: PV changed from "4.15.0" to "4.16.0"
packages/x86-64-v3-poky-linux/python3-typing-extensions/python3-typing-extensions: FILELIST: directory renamed /usr/lib/python3.14/site-packages/typing_extensions-4.15.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/typing_extensions-4.16.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/typing_extensions-4.15.0.dist-info -> /usr/lib/python3.14/site-packages/typing_extensions-4.16.0.dist-info
packages/x86-64-v3-poky-linux/python3-typing-extensions/python3-typing-extensions: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/x86-64-v3-poky-linux/python3-typing-extensions/python3-typing-extensions: PV changed from "4.15.0" to "4.16.0"
packages/x86-64-v3-poky-linux/python3-typing-extensions/python3-typing-extensions: PKGSIZE changed from 353199 to 361725 (+2%)
Changes to packages/x86-64-v3-poky-linux/python3-typing-extensions (sysroot):
  /usr/lib/python3.14/site-packages/typing_extensions-4.15.0.dist-info moved to /usr/lib/python3.14/site-packages/typing_extensions-4.16.0.dist-info

--===============5392267425713263654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-typing-extensions/python3-typing-extensions: FILELIST: directory renamed /usr/lib/python3.14/site-packages/typing_extensions-4.15.0.dist-info -> /usr/lib/python3.14/site-packages/typing_extensions-4.16.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/typing_extensions-4.15.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/typing_extensions-4.16.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-typing-extensions (sysroot):
  /usr/lib/python3.14/site-packages/typing_extensions-4.15.0.dist-info moved to /usr/lib/python3.14/site-packages/typing_extensions-4.16.0.dist-info

--===============5392267425713263654==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-typing-extensions-upgrade-4.15.0-4.16.0.patch"

RnJvbSA0MmM4NDExOTU1NGJlMjdkMWI5YTBlMDEyODkyOTY2MTE2YTQ5NzBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBKdWwgMjAyNiAwNToxODozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdHlwaW5nLWV4dGVuc2lvbnM6IHVwZ3JhZGUgNC4xNS4wIC0+IDQuMTYuMAoKLS0tCiAu
Li5leHRlbnNpb25zXzQuMTUuMC5iYiA9PiBweXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuMTYu
MC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXR5cGluZy1l
eHRlbnNpb25zXzQuMTUuMC5iYiA9PiBweXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuMTYuMC5i
Yn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdHlwaW5nLWV4dGVuc2lvbnNfNC4xNS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuMTYuMC5iYgpzaW1pbGFyaXR5IGluZGV4
IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHlw
aW5nLWV4dGVuc2lvbnNfNC4xNS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtdHlwaW5nLWV4dGVuc2lvbnNfNC4xNi4wLmJiCmluZGV4IDRmZjg1YmIy
NDAuLmNlZGU4MWUxMjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy10eXBpbmctZXh0ZW5zaW9uc180LjE1LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuMTYuMC5iYgpAQCAtMTUs
NyArMTUsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1mY2Y2YjI0
OWMyNjQxNTQwMjE5YTcyN2YzNWQ4ZDJjMiIKICMgVGhlIG5hbWUgb24gUHlQaSBpcyBzbGlnaHRs
eSBkaWZmZXJlbnQuCiBQWVBJX1BBQ0tBR0UgPSAidHlwaW5nX2V4dGVuc2lvbnMiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICIwY2VhNDhkMTczY2MxMmZhMjhlY2FiYzNiODM3ZWEzY2Y2ZjM4YzZk
MTEzNmY4NWNiYWFmNTk4OTg0ODYxNDY2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImRjOTgzZDE5
YTUwOWM5NGRiYTcyMmVlNmFiZDMzOTQwZjdjMDVhODllMjQzYzQ3ZTkwN2ViNGRiNmYxYTQzZTUi
CiAKIGluaGVyaXQgcHlwaSBweXRob25fZmxpdF9jb3JlCiAKLS0gCjIuNDcuMQoK

--===============5392267425713263654==--

