Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF2BC61DBE
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 05:44:16 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2182.1787982251345752843
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 22:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=b5ieqgWc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TuzROMf2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a04c0c0bba-d9938dec-c47d-4062-8448-40cc6703e045-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787982253;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MZmUMt4cIQ7cIFvPJtebbkZn3H3Mrm4fHS4ZHYpVj8M=;
	b=b5ieqgWcHTSOVJBGfjesIEVriXZy+I/109+j6h1JvZD82BMc1VYRfbrsppgBJwfq
	Bv668eRxqX+2zjsSJq4GEwwGufGPnRKh5dduTyWoMbOV7UCi/jp1deFTMpOelpOl0T+
	4TeapZFFhnDToHtW0dNb8DR39F8OQGOTpvLMV7yI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787982253;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MZmUMt4cIQ7cIFvPJtebbkZn3H3Mrm4fHS4ZHYpVj8M=;
	b=TuzROMf2RCEFAu3gZCtRyrg0Q/Kw/EUiMaQq82Y49bfTKtV6I67S0IHjlIyuknyl
	2RCiGt11GhDMyS0DG+1Ahoq89kZsENeEWoh68GEQSW/JZo6G+ZzRcjuqNy8I/4fj18k
	dTC3XFEwYSS3fdmaGiaBPsmtWFNfHW54v4B+9lZg=
Content-Type: multipart/mixed; boundary="===============2804993223867353444=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wcwidth: upgrading to 0.8.3 SUCCEEDED
Message-ID: <010101a04c0c0bba-d9938dec-c47d-4062-8448-40cc6703e045-000000@us-west-2.amazonses.com>
Date: Sat, 29 Aug 2026 05:44:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.29-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2026 05:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244625

--===============2804993223867353444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-wcwidth* to *0.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wcwidth-upgrade-0.8.2-0.8.3.patch
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
From f1ec2ae123ca3f5ca44f846efe0e7fe624cc9618 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 29 Aug 2026 05:24:17 +0000
Subject: [PATCH] python3-wcwidth: upgrade 0.8.2 -> 0.8.3

---
 .../{python3-wcwidth_0.8.2.bb => python3-wcwidth_0.8.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.8.2.bb => python3-wcwidth_0.8.3.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.8.2.bb b/meta/recipes-devtools/python/python3-wcwidth_0.8.3.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-wcwidth_0.8.2.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.8.3.bb
index d5867ef9b8..3ba5b5b29b 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.8.2.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.8.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "91fbef97204b96a3d4d421609b80340b760cf33e26da123ff243d76b1fda8dda"
+SRC_URI[sha256sum] = "d128512515fbf4612e0ff21fd6380399210318b7b54a9af59dff8454cf9730eb"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.1


--===============2804993223867353444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.8.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/wcwidth-0.8.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.8.2.dist-info -> /usr/lib/python3.14/site-packages/wcwidth-0.8.3.dist-info, added "/usr/lib/python3.14/site-packages/wcwidth/textwrap.py,cover"
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.14/site-packages/wcwidth-0.8.2.dist-info moved to /usr/lib/python3.14/site-packages/wcwidth-0.8.3.dist-info
  /usr/lib/python3.14/site-packages/wcwidth/textwrap.py,cover was added

--===============2804993223867353444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth: PV changed from "0.8.2" to "0.8.3"
packages/x86-64-v3-poky-linux/python3-wcwidth: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.8.2.tar.gz;downloadfilename=wcwidth-0.8.2.tar.gz" to "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.8.3.tar.gz;downloadfilename=wcwidth-0.8.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-wcwidth: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PV changed from "0.8.2" to "0.8.3"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PV changed from "0.8.2" to "0.8.3"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PV changed from "0.8.2" to "0.8.3"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PV changed from "0.8.2" to "0.8.3"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PV changed from "0.8.2" to "0.8.3"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 194309 to 198538 (+2%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PV changed from "0.8.2" to "0.8.3"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PV changed from "0.8.2" to "0.8.3"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PV changed from "0.8.2" to "0.8.3"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 4375656 to 4410977 (+1%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.8.2.dist-info -> /usr/lib/python3.14/site-packages/wcwidth-0.8.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.8.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/wcwidth-0.8.3.dist-info/licenses, added "/usr/lib/python3.14/site-packages/wcwidth/textwrap.py,cover"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.14/site-packages/wcwidth-0.8.2.dist-info moved to /usr/lib/python3.14/site-packages/wcwidth-0.8.3.dist-info
  /usr/lib/python3.14/site-packages/wcwidth/textwrap.py,cover was added

--===============2804993223867353444==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wcwidth-upgrade-0.8.2-0.8.3.patch"

RnJvbSBmMWVjMmFlMTIzY2EzZjVjYTQ0Zjg0NmVmZTBlN2ZlNjI0Y2M5NjE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjkgQXVnIDIwMjYgMDU6MjQ6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdjd2lkdGg6IHVwZ3JhZGUgMC44LjIgLT4gMC44LjMKCi0tLQogLi4uL3tweXRob24z
LXdjd2lkdGhfMC44LjIuYmIgPT4gcHl0aG9uMy13Y3dpZHRoXzAuOC4zLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13Y3dpZHRoXzAuOC4yLmJiID0+
IHB5dGhvbjMtd2N3aWR0aF8wLjguMy5iYn0gKDg0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjguMi5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAuOC4zLmJiCnNpbWlsYXJpdHkgaW5k
ZXggODQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13
Y3dpZHRoXzAuOC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtd2N3aWR0aF8wLjguMy5iYgppbmRleCBkNTg2N2VmOWI4Li4zYmE1YjViMjliIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjgu
Mi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8w
LjguMy5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2px
dWFzdC93Y3dpZHRoIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT1iMTU5NzljMzlhMjU0Mzg5MmZjYThjZDg2YjRiNTJjYiIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjkxZmJlZjk3MjA0Yjk2YTNkNGQ0MjE2MDliODAzNDBiNzYwY2YzM2Uy
NmRhMTIzZmYyNDNkNzZiMWZkYThkZGEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDEyODUxMjUx
NWZiZjQ2MTJlMGZmMjFmZDYzODAzOTkyMTAzMThiN2I1NGE5YWY1OWRmZjg0NTRjZjk3MzBlYiIK
IAogaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcgcHRlc3QtcHl0aG9uLXB5dGVzdAogCi0t
IAoyLjQ3LjEKCg==

--===============2804993223867353444==--

