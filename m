Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC1AFA0C4E
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:40 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19742.1776261879795160481
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KjaYJsPu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IwdHa2ho;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019d917557b3-2a8af6cf-9139-4cb1-843e-a5999cbfeaf4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261879;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ze2SDhn6fzGFgpX6Vv4lpyJ++GLs1mjO0U9khOmQk7c=;
	b=KjaYJsPuVDApeyUz2INrds8mpi81+VcH/YnapMAKO9BqfHVdT9E8KjzICxJOKclu
	xQIOMez1CuNZ9KzD/AsIBe3UF3iZGNEOvL6Xw7ytskcQauxrH4HIhQ0BjzpNp2znfej
	m/eeyAT1BoHcF3jTalBDVfhPIMgKWH8R0bOfvXSc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261879;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ze2SDhn6fzGFgpX6Vv4lpyJ++GLs1mjO0U9khOmQk7c=;
	b=IwdHa2hoO2R0A+TQTPL7MX/qujByU6eikUAsbCKq4oBCNcHfg+KzkOy5hXEvu6eO
	y//0R18Q5TLLHC11Rjr0526+lZ4quSM77J/E6UnweUagQyRCRM4b0M2McNtejEXJ2iw
	quodRdazvwgctBZKRrpnJhcg2htOKVmgcU7uW0Xw=
Content-Type: multipart/mixed; boundary="===============4446631039342329469=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.26.7 SUCCEEDED
Message-ID: <0101019d917557b3-2a8af6cf-9139-4cb1-843e-a5999cbfeaf4-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235238

--===============4446631039342329469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.26.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.26.6-2.26.7.patch
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
From 3238a9bbcbfee0b5f0608f9f055cebf42010bbde Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 08:33:08 +0000
Subject: [PATCH] python3-pdm: upgrade 2.26.6 -> 2.26.7

---
 .../python/{python3-pdm_2.26.6.bb => python3-pdm_2.26.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.26.6.bb => python3-pdm_2.26.7.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.26.6.bb b/meta/recipes-devtools/python/python3-pdm_2.26.7.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.26.6.bb
rename to meta/recipes-devtools/python/python3-pdm_2.26.7.bb
index 72f6415dbc..5e6cdcb4cf 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.26.6.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.26.7.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "771f95b9a484f9eb34dcf8d851be6ff95333e4f3c46189f9004cfd5cc2e925f9"
+SRC_URI[sha256sum] = "0a96a6fb4d60dfeacc1f68bf77efda39503833f6c01866cc8700ea403f0183b7"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============4446631039342329469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.6.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.26.7.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.6.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.26.7.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.26.6.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.26.7.dist-info

--===============4446631039342329469==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.26.6-2.26.7.patch"

RnJvbSAzMjM4YTliYmNiZmVlMGI1ZjA2MDhmOWYwNTVjZWJmNDIwMTBiYmRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDg6MzM6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbTogdXBncmFkZSAyLjI2LjYgLT4gMi4yNi43CgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcGRtXzIuMjYuNi5iYiA9PiBweXRob24zLXBkbV8yLjI2LjcuYmJ9ICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGRtXzIuMjYuNi5iYiA9PiBweXRo
b24zLXBkbV8yLjI2LjcuYmJ9ICg4MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI2LjYuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDgwJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuNi5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI2Ljcu
YmIKaW5kZXggNzJmNjQxNWRiYy4uNWU2Y2RjYjRjZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI2LjYuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI2LjcuYmIKQEAgLTQsNyArNCw3IEBAIExJ
Q0VOU0UgPSAiTUlUIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT0yZWIzMWEyY2MxYTc1OGMzNGI0OTlmMjg3ZGQwNGVmMiIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc3MWY5NWI5YTQ4NGY5ZWIzNGRjZjhkODUxYmU2ZmY5
NTMzM2U0ZjNjNDYxODlmOTAwNGNmZDVjYzJlOTI1ZjkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MGE5NmE2ZmI0ZDYwZGZlYWNjMWY2OGJmNzdlZmRhMzk1MDM4MzNmNmMwMTg2NmNjODcwMGVhNDAz
ZjAxODNiNyIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9wZG0KIAotLSAKMi40Ny4xCgo=

--===============4446631039342329469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.26.6.tar.gz;downloadfilename=pdm-2.26.6.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.26.7.tar.gz;downloadfilename=pdm-2.26.7.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm: PKGV changed from 2.26.6 [default] to 2.26.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm: PV changed from "2.26.6" to "2.26.7"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.26.6 [default] to 2.26.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.26.6" to "2.26.7"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.26.6 [default] to 2.26.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.26.6" to "2.26.7"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.26.6 [default] to 2.26.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.26.6" to "2.26.7"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.26.6 [default] to 2.26.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.26.6" to "2.26.7"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.26.6 [default] to 2.26.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.26.6" to "2.26.7"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.26.6 [default] to 2.26.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.26.6" to "2.26.7"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.6.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.26.7.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.6.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.26.7.dist-info
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.26.6 [default] to 2.26.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2491822 to 2496904 (+0%)
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PV changed from "2.26.6" to "2.26.7"
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.26.6.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.26.7.dist-info

--===============4446631039342329469==--

