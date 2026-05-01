Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A919ECD37BE
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:56 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15709.1777645532662829268
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QxxB+ZdL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pzKz94qV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019de3ee600f-805d0513-bbce-46f0-9879-346980fc12d5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=68RUGGEn6+B8juOWiqafngTM2piAsKmJi/ceYT8TDp4=;
	b=QxxB+ZdLc3mrqB5L1sKCFXx+HdwoBXdGTadDn4mUgG4Q7vcLPOgD2x9tKilE2wbA
	7s7kLC2Mo+j2npfqgVNflNfHQ+ycIURpa9ieRpUe5bbozJWSCo7OByx0961hw/KLW7k
	eOpLAILga1fwMk4lFkOGy8udya0SIJljzu+jKRaI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=68RUGGEn6+B8juOWiqafngTM2piAsKmJi/ceYT8TDp4=;
	b=pzKz94qVQlXWh/3g+lPmudhlfN4qFFjoIsZ3aDtDuIu/Xiw6Au2VtKLE96GiXuiz
	Z6dqNfdhFf+mKPaJZuPGbXWdg6F9iSn6QT0HfHJWSQtS2oFs7Q8SuufK1GZ02Cab4KS
	kQ1ocY7YT3+s+i9hgH5uaPCnhYdoVKA0rCuTtLbA=
Content-Type: multipart/mixed; boundary="===============8250561342732250017=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-testtools: upgrading to 2.9.1 SUCCEEDED
Message-ID: <0101019de3ee600f-805d0513-bbce-46f0-9879-346980fc12d5-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236248

--===============8250561342732250017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-testtools* to *2.9.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-testtools-upgrade-2.9.0-2.9.1.patch
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
From 7857340903b0eb71b09481f5b60eb0cf4397e69e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 09:18:00 +0000
Subject: [PATCH] python3-testtools: upgrade 2.9.0 -> 2.9.1

---
 .../{python3-testtools_2.9.0.bb => python3-testtools_2.9.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-testtools_2.9.0.bb => python3-testtools_2.9.1.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-testtools_2.9.0.bb b/meta/recipes-devtools/python/python3-testtools_2.9.1.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-testtools_2.9.0.bb
rename to meta/recipes-devtools/python/python3-testtools_2.9.1.bb
index a7011acd78..0c7f622178 100644
--- a/meta/recipes-devtools/python/python3-testtools_2.9.0.bb
+++ b/meta/recipes-devtools/python/python3-testtools_2.9.1.bb
@@ -8,7 +8,7 @@ DEPENDS += "python3-hatch-vcs-native"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "eb562d1a2157c6d443c8c118861eb452b3655d1842f9b61b8567ad01b32826e3"
+SRC_URI[sha256sum] = "39ad9eb9e1b935d6838f4b3aee4d6e72db65df5602f6feda998dbb4fe8de0b19"
 
 RDEPENDS:${PN} += "\
     python3-compression \
-- 
2.47.1


--===============8250561342732250017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/testtools-2.9.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/testtools-2.9.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/testtools-2.9.0.dist-info -> /usr/lib/python3.14/site-packages/testtools-2.9.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-testtools (sysroot):
  /usr/lib/python3.14/site-packages/testtools-2.9.0.dist-info moved to /usr/lib/python3.14/site-packages/testtools-2.9.1.dist-info

--===============8250561342732250017==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-testtools-upgrade-2.9.0-2.9.1.patch"

RnJvbSA3ODU3MzQwOTAzYjBlYjcxYjA5NDgxZjViNjBlYjBjZjQzOTdlNjllIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwOToxODowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdGVzdHRvb2xzOiB1cGdyYWRlIDIuOS4wIC0+IDIuOS4xCgotLS0KIC4uLi97cHl0aG9u
My10ZXN0dG9vbHNfMi45LjAuYmIgPT4gcHl0aG9uMy10ZXN0dG9vbHNfMi45LjEuYmJ9ICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdGVzdHRvb2xzXzIuOS4wLmJi
ID0+IHB5dGhvbjMtdGVzdHRvb2xzXzIuOS4xLmJifSAoODQlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10ZXN0dG9vbHNfMi45LjAuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdGVzdHRvb2xzXzIuOS4xLmJiCnNpbWls
YXJpdHkgaW5kZXggODQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy10ZXN0dG9vbHNfMi45LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy10ZXN0dG9vbHNfMi45LjEuYmIKaW5kZXggYTcwMTFhY2Q3OC4uMGM3
ZjYyMjE3OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXRlc3R0b29sc18yLjkuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtdGVzdHRvb2xzXzIuOS4xLmJiCkBAIC04LDcgKzgsNyBAQCBERVBFTkRTICs9ICJweXRo
b24zLWhhdGNoLXZjcy1uYXRpdmUiCiAKIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlYjU2MmQxYTIxNTdjNmQ0NDNjOGMxMTg4NjFlYjQ1MmIz
NjU1ZDE4NDJmOWI2MWI4NTY3YWQwMWIzMjgyNmUzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM5
YWQ5ZWI5ZTFiOTM1ZDY4MzhmNGIzYWVlNGQ2ZTcyZGI2NWRmNTYwMmY2ZmVkYTk5OGRiYjRmZThk
ZTBiMTkiCiAKIFJERVBFTkRTOiR7UE59ICs9ICJcCiAgICAgcHl0aG9uMy1jb21wcmVzc2lvbiBc
Ci0tIAoyLjQ3LjEKCg==

--===============8250561342732250017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-testtools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/testtools/testtools-2.9.0.tar.gz;downloadfilename=testtools-2.9.0.tar.gz" to "https://files.pythonhosted.org/packages/source/t/testtools/testtools-2.9.1.tar.gz;downloadfilename=testtools-2.9.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-testtools: PV changed from "2.9.0" to "2.9.1"
packages/x86-64-v3-poky-linux/python3-testtools: PKGV changed from 2.9.0 [default] to 2.9.1 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dbg: PV changed from "2.9.0" to "2.9.1"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dbg: PKGV changed from 2.9.0 [default] to 2.9.1 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dev: PV changed from "2.9.0" to "2.9.1"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dev: PKGV changed from 2.9.0 [default] to 2.9.1 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-doc: PV changed from "2.9.0" to "2.9.1"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-doc: PKGV changed from 2.9.0 [default] to 2.9.1 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-locale: PV changed from "2.9.0" to "2.9.1"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-locale: PKGV changed from 2.9.0 [default] to 2.9.1 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-src: PV changed from "2.9.0" to "2.9.1"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-src: PKGV changed from 2.9.0 [default] to 2.9.1 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-staticdev: PV changed from "2.9.0" to "2.9.1"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-staticdev: PKGV changed from 2.9.0 [default] to 2.9.1 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PV changed from "2.9.0" to "2.9.1"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/testtools-2.9.0.dist-info -> /usr/lib/python3.14/site-packages/testtools-2.9.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/testtools-2.9.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/testtools-2.9.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PKGV changed from 2.9.0 [default] to 2.9.1 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PKGSIZE changed from 980199 to 980575 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-testtools (sysroot):
  /usr/lib/python3.14/site-packages/testtools-2.9.0.dist-info moved to /usr/lib/python3.14/site-packages/testtools-2.9.1.dist-info

--===============8250561342732250017==--

