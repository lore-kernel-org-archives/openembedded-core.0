Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF13C55171
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 06:00:09 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18892.1785650408796848966
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 23:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AoUrLuzV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NcH/0twm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019fc10ee962-b080ac46-2548-469e-86da-74700a9cbb2c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785650407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=60wImYb2mYAJWdW34N5FxXkKLkbgOaT7XTXfC2veMOw=;
	b=AoUrLuzVvebATzH/4Yv78VNuQj9kpEwtSE53ldKyr6E57TUTCKPKiyGPqHpUeVEU
	pjMIo05KR9ijpJOpusORNNdTVXvG4UChAd4djS5AR6IqVukYcQIuwfx02u6aHRG7L7r
	1oWkPpBeT5DBPZB1JSn0VFk4ZpSn62+GkZBvCOFA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785650407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=60wImYb2mYAJWdW34N5FxXkKLkbgOaT7XTXfC2veMOw=;
	b=NcH/0twmXBkSpDjENpExmOJoTTQHs2rQc1hmwpdjkP7Ph5vRygfUyqPhk1f/W5OZ
	+GAcZeqfeXB5H/2FsIuzXCF3ePcpjQ/mM2NtHZZcaTIGdP8r5FEOjKUJROUH1u0B67+
	Gca1yoEsEdEPIH5Qj7jckUIho6qtjZWHU5v6h/rk=
Content-Type: multipart/mixed; boundary="===============5505969249536100522=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyopenssl: upgrading to 26.4.0 SUCCEEDED
Message-ID: <0101019fc10ee962-b080ac46-2548-469e-86da-74700a9cbb2c-000000@us-west-2.amazonses.com>
Date: Sun, 2 Aug 2026 06:00:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 06:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242520

--===============5505969249536100522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyopenssl* to *26.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyopenssl-upgrade-26.3.0-26.4.0.patch
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
From be07c18de489cd5b72c4aab795b83f2edd24e543 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 2 Aug 2026 05:28:50 +0000
Subject: [PATCH] python3-pyopenssl: upgrade 26.3.0 -> 26.4.0

Source: CHANGELOG.rst

26.4.0 (2026-08-01)
-------------------

Backward-incompatible changes:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Deprecations:
^^^^^^^^^^^^^

Changes:
^^^^^^^^

- Maximum supported ``cryptography`` version is now 50.x.
---
 ...{python3-pyopenssl_26.3.0.bb => python3-pyopenssl_26.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_26.3.0.bb => python3-pyopenssl_26.4.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_26.3.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_26.4.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pyopenssl_26.3.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_26.4.0.bb
index ca6754d462..6246375afc 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_26.3.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_26.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl python3-cryptography"
 
-SRC_URI[sha256sum] = "589de7fae1c9ea670d18422ed00fc04da787bbde8e1454aea872aa57b49ad341"
+SRC_URI[sha256sum] = "28dfcce0162b9211413e26dfbfdf1d24317fbeba18fc93c12400a1856b2a0bc7"
 
 inherit pypi setuptools3
 
-- 
2.47.1


--===============5505969249536100522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyopenssl: PKGV changed from 26.3.0 [default] to 26.4.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl: PV changed from "26.3.0" to "26.4.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyopenssl/pyopenssl-26.3.0.tar.gz;downloadfilename=pyopenssl-26.3.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyopenssl/pyopenssl-26.4.0.tar.gz;downloadfilename=pyopenssl-26.4.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PV changed from "26.3.0" to "26.4.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PKGV changed from 26.3.0 [default] to 26.4.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PV changed from "26.3.0" to "26.4.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PKGV changed from 26.3.0 [default] to 26.4.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PV changed from "26.3.0" to "26.4.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PKGV changed from 26.3.0 [default] to 26.4.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PV changed from "26.3.0" to "26.4.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PKGV changed from 26.3.0 [default] to 26.4.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PV changed from "26.3.0" to "26.4.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PKGV changed from 26.3.0 [default] to 26.4.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PV changed from "26.3.0" to "26.4.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PKGV changed from 26.3.0 [default] to 26.4.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PV changed from "26.3.0" to "26.4.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PKGV changed from 26.3.0 [default] to 26.4.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyopenssl-26.3.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyopenssl-26.4.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pyopenssl-26.3.0.dist-info -> /usr/lib/python3.14/site-packages/pyopenssl-26.4.0.dist-info
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGSIZE changed from 489068 to 489280 (+0%)
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: PV changed from "26.3.0" to "26.4.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGV changed from 26.3.0 [default] to 26.4.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.14/site-packages/pyopenssl-26.3.0.dist-info moved to /usr/lib/python3.14/site-packages/pyopenssl-26.4.0.dist-info

--===============5505969249536100522==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyopenssl-upgrade-26.3.0-26.4.0.patch"

RnJvbSBiZTA3YzE4ZGU0ODljZDViNzJjNGFhYjc5NWI4M2YyZWRkMjRlNTQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMiBBdWcgMjAyNiAwNToyODo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlvcGVuc3NsOiB1cGdyYWRlIDI2LjMuMCAtPiAyNi40LjAKClNvdXJjZTogQ0hBTkdF
TE9HLnJzdAoKMjYuNC4wICgyMDI2LTA4LTAxKQotLS0tLS0tLS0tLS0tLS0tLS0tCgpCYWNrd2Fy
ZC1pbmNvbXBhdGlibGUgY2hhbmdlczoKXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eCgpE
ZXByZWNhdGlvbnM6Cl5eXl5eXl5eXl5eXl4KCkNoYW5nZXM6Cl5eXl5eXl5eCgotIE1heGltdW0g
c3VwcG9ydGVkIGBgY3J5cHRvZ3JhcGh5YGAgdmVyc2lvbiBpcyBub3cgNTAueC4KLS0tCiAuLi57
cHl0aG9uMy1weW9wZW5zc2xfMjYuMy4wLmJiID0+IHB5dGhvbjMtcHlvcGVuc3NsXzI2LjQuMC5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5b3BlbnNzbF8y
Ni4zLjAuYmIgPT4gcHl0aG9uMy1weW9wZW5zc2xfMjYuNC4wLmJifSAoODclKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weW9wZW5zc2xfMjYuMy4w
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5b3BlbnNzbF8yNi40
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXB5b3BlbnNzbF8yNi4zLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weW9wZW5zc2xfMjYuNC4wLmJiCmluZGV4IGNh
Njc1NGQ0NjIuLjYyNDYzNzVhZmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1weW9wZW5zc2xfMjYuMy4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1weW9wZW5zc2xfMjYuNC4wLmJiCkBAIC01LDcgKzUsNyBAQCBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zYjgzZWY5NjM4N2YxNDY1NWZj
ODU0ZGRjM2M2YmQ1NyIKIAogREVQRU5EUyArPSAib3BlbnNzbCBweXRob24zLWNyeXB0b2dyYXBo
eSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU4OWRlN2ZhZTFjOWVhNjcwZDE4NDIyZWQwMGZj
MDRkYTc4N2JiZGU4ZTE0NTRhZWE4NzJhYTU3YjQ5YWQzNDEiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMjhkZmNjZTAxNjJiOTIxMTQxM2UyNmRmYmZkZjFkMjQzMTdmYmViYTE4ZmM5M2MxMjQwMGEx
ODU2YjJhMGJjNyIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLS0gCjIuNDcuMQoK

--===============5505969249536100522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pyopenssl-changelog.txt"

Changelog for python3-pyopenssl: 26.3.0 -> 26.4.0
Source: CHANGELOG.rst

26.4.0 (2026-08-01)
-------------------

Backward-incompatible changes:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Deprecations:
^^^^^^^^^^^^^

Changes:
^^^^^^^^

- Maximum supported ``cryptography`` version is now 50.x.

--===============5505969249536100522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyopenssl-26.3.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyopenssl-26.4.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pyopenssl-26.3.0.dist-info -> /usr/lib/python3.14/site-packages/pyopenssl-26.4.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.14/site-packages/pyopenssl-26.3.0.dist-info moved to /usr/lib/python3.14/site-packages/pyopenssl-26.4.0.dist-info

--===============5505969249536100522==--

