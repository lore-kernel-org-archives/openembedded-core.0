Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C1FC27C40
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.5954.1689456455611268838
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CGgH4sb9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101895b73ab1a-9a36f9b6-75cf-4a47-8f7d-aa954178caab-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RVtdF3zB1cON4DNAG0+PN6JCDj+no0YY99w+kAgTrys=;
	b=CGgH4sb9PuTMnW3o3R+Bc8c98OYDa21HBR6ggRLGE70Vf3ehpQi7E9BxT61H15U1
	YtXD7ZQSWjWXYB3Vm73hzVnKg4RdCW3XWb3Q/wVxFtOxnyQfjRDsYJLfXL0xVa+0PYS
	kyXhTg+RtgHyPCl5IspNO5+180LTUdC0ENGlBgFA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RVtdF3zB1cON4DNAG0+PN6JCDj+no0YY99w+kAgTrys=;
	b=cS0mqcRdy2rNAqQXKmOmRvp9dHhpBKBXGqTc2rnhbVxNtfI05Wjoq69qhm0kIlIe
	JJaI26uRNdG5O/8bQYxF0LbBCvCQfpHiQWbyvAiCbeEHYNkZSzFTBRN5/ICY2cb3SS6
	RcmvONvpWW7x/pNmQ9eZ7cIOdQLQGMb5vMJSpvrQ=
Content-Type: multipart/mixed; boundary="===============1311741932518822536=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-typing-extensions: upgrading to 4.7.1 SUCCEEDED
Message-ID: <010101895b73ab1a-9a36f9b6-75cf-4a47-8f7d-aa954178caab-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184368

--===============1311741932518822536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-typing-extensions* to *4.7.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-typing-extensions-upgrade-4.7.0-4.7.1.patch
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
From 647f69a456e05fcdc3e632941fcd5401de0bd42e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 13:23:32 +0000
Subject: [PATCH] python3-typing-extensions: upgrade 4.7.0 -> 4.7.1

---
 ...g-extensions_4.7.0.bb => python3-typing-extensions_4.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.7.0.bb => python3-typing-extensions_4.7.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb
index 887cece688..8ff77ba4fd 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[sha256sum] = "935ccf31549830cda708b42289d44b6f74084d616a00be651601a4f968e77c82"
+SRC_URI[sha256sum] = "b75ddc264f0ba5615db7ba217daeb99701ad295353c45f9e95963337ceeeffb2"
 
 inherit pypi python_flit_core
 
-- 
2.39.2


--===============1311741932518822536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-typing-extensions: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/typing_extensions/typing_extensions-4.7.0.tar.gz;downloadfilename=typing_extensions-4.7.0.tar.gz" to "https://files.pythonhosted.org/packages/source/t/typing_extensions/typing_extensions-4.7.1.tar.gz;downloadfilename=typing_extensions-4.7.1.tar.gz"
packages/core2-32-poky-linux/python3-typing-extensions: PV changed from "4.7.0" to "4.7.1"
packages/core2-32-poky-linux/python3-typing-extensions: PKGV changed from 4.7.0 [default] to 4.7.1 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-dbg: PV changed from "4.7.0" to "4.7.1"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-dbg: PKGV changed from 4.7.0 [default] to 4.7.1 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-dev: PV changed from "4.7.0" to "4.7.1"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-dev: PKGV changed from 4.7.0 [default] to 4.7.1 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-doc: PV changed from "4.7.0" to "4.7.1"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-doc: PKGV changed from 4.7.0 [default] to 4.7.1 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-locale: PV changed from "4.7.0" to "4.7.1"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-locale: PKGV changed from 4.7.0 [default] to 4.7.1 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-src: PV changed from "4.7.0" to "4.7.1"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-src: PKGV changed from 4.7.0 [default] to 4.7.1 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-staticdev: PV changed from "4.7.0" to "4.7.1"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-staticdev: PKGV changed from 4.7.0 [default] to 4.7.1 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions: PV changed from "4.7.0" to "4.7.1"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions: PKGSIZE changed from 258228 to 260090 (+1%)
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions: PKGV changed from 4.7.0 [default] to 4.7.1 [default]
Changes to packages/core2-32-poky-linux/python3-typing-extensions (sysroot):
  /usr/lib/python3.11/site-packages/typing_extensions-4.7.0.dist-info moved to /usr/lib/python3.11/site-packages/typing_extensions-4.7.1.dist-info

--===============1311741932518822536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-typing-extensions (sysroot):
  /usr/lib/python3.11/site-packages/typing_extensions-4.7.0.dist-info moved to /usr/lib/python3.11/site-packages/typing_extensions-4.7.1.dist-info

--===============1311741932518822536==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-typing-extensions-upgrade-4.7.0-4.7.1.patch"

RnJvbSA2NDdmNjlhNDU2ZTA1ZmNkYzNlNjMyOTQxZmNkNTQwMWRlMGJkNDJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTM6MjM6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXR5cGluZy1leHRlbnNpb25zOiB1cGdyYWRlIDQuNy4wIC0+IDQuNy4xCgotLS0KIC4u
LmctZXh0ZW5zaW9uc180LjcuMC5iYiA9PiBweXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuNy4x
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdHlwaW5nLWV4
dGVuc2lvbnNfNC43LjAuYmIgPT4gcHl0aG9uMy10eXBpbmctZXh0ZW5zaW9uc180LjcuMS5iYn0g
KDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
dHlwaW5nLWV4dGVuc2lvbnNfNC43LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtdHlwaW5nLWV4dGVuc2lvbnNfNC43LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXR5cGluZy1l
eHRlbnNpb25zXzQuNy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtdHlwaW5nLWV4dGVuc2lvbnNfNC43LjEuYmIKaW5kZXggODg3Y2VjZTY4OC4uOGZm
NzdiYTRmZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXR5cGluZy1leHRlbnNpb25zXzQuNy4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy10eXBpbmctZXh0ZW5zaW9uc180LjcuMS5iYgpAQCAtMTUsNyArMTUsNyBA
QCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1mY2Y2YjI0OWMyNjQxNTQw
MjE5YTcyN2YzNWQ4ZDJjMiIKICMgVGhlIG5hbWUgb24gUHlQaSBpcyBzbGlnaHRseSBkaWZmZXJl
bnQuCiBQWVBJX1BBQ0tBR0UgPSAidHlwaW5nX2V4dGVuc2lvbnMiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICI5MzVjY2YzMTU0OTgzMGNkYTcwOGI0MjI4OWQ0NGI2Zjc0MDg0ZDYxNmEwMGJlNjUx
NjAxYTRmOTY4ZTc3YzgyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImI3NWRkYzI2NGYwYmE1NjE1
ZGI3YmEyMTdkYWViOTk3MDFhZDI5NTM1M2M0NWY5ZTk1OTYzMzM3Y2VlZWZmYjIiCiAKIGluaGVy
aXQgcHlwaSBweXRob25fZmxpdF9jb3JlCiAKLS0gCjIuMzkuMgoK

--===============1311741932518822536==--

