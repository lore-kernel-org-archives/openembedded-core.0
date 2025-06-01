Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C58C7114C
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:34 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.27788.1748786127611541400
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=wopwcazj;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=oceg/1Db;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101972bc6b770-cfad9cfc-afb2-4be0-8e17-96dd71891e0e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786132;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LZwzvpyMFjKfphSErFmZtXP6VVgcKvTpLX/rXQ49cIk=;
	b=wopwcazjIVFHqfwiqznxlAK/fiT8TG6x14CFr1BJInKSK8H7prYq/RI+GfGHZaXD
	61DgGfKu53s5D/6AcEdNjisGqSTDwh7WXdWigVTIqczgC3W41BMW9ENg8X8rBPjfhmT
	a865dx4I99QQri1+2uCsr9labDdTQpLuUkL10y24=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786132;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LZwzvpyMFjKfphSErFmZtXP6VVgcKvTpLX/rXQ49cIk=;
	b=oceg/1DbPY8NOFguM6CsrQS9kp27171dB/+uLMaGoiXRh7irlU1tqXBF1M/wY/P6
	HiLou3hCQ/7VGuYG9E24Gwk+/e9cbySduf6aMmgTWXLIli6lNlArNqPahxvhFYlFlld
	S24BwGR/6LnBviXtc+0CZeQRcm7NcLmfRPGZnrGs=
Content-Type: multipart/mixed; boundary="===============7695508227776544528=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 3.1.1 SUCCEEDED
Message-ID: <010101972bc6b770-cfad9cfc-afb2-4be0-8e17-96dd71891e0e-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217594

--===============7695508227776544528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cython* to *3.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-3.1.0-3.1.1.patch
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
From 8229aaa93bd2f84927eab1a443eeb2f8398686da Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 09:19:16 +0000
Subject: [PATCH] python3-cython: upgrade 3.1.0 -> 3.1.1

---
 .../python/{python3-cython_3.1.0.bb => python3-cython_3.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_3.1.0.bb => python3-cython_3.1.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython_3.1.0.bb b/meta/recipes-devtools/python/python3-cython_3.1.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.1.0.bb
rename to meta/recipes-devtools/python/python3-cython_3.1.1.bb
index f93135b94b..1bc6eda4ac 100644
--- a/meta/recipes-devtools/python/python3-cython_3.1.0.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.1.1.bb
@@ -7,7 +7,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "1097dd60d43ad0fff614a57524bfd531b35c13a907d13bee2cc2ec152e6bf4a1"
+SRC_URI[sha256sum] = "505ccd413669d5132a53834d792c707974248088c4f60c497deb1b416e366397"
 
 inherit pypi setuptools3 cython
 
-- 
2.47.1


--===============7695508227776544528==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-3.1.0-3.1.1.patch"

RnJvbSA4MjI5YWFhOTNiZDJmODQ5MjdlYWIxYTQ0M2VlYjJmODM5ODY4NmRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwOToxOToxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3l0aG9uOiB1cGdyYWRlIDMuMS4wIC0+IDMuMS4xCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtY3l0aG9uXzMuMS4wLmJiID0+IHB5dGhvbjMtY3l0aG9uXzMuMS4xLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY3l0aG9uXzMuMS4wLmJiID0+IHB5
dGhvbjMtY3l0aG9uXzMuMS4xLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob25fMy4xLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob25f
My4xLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1j
eXRob25fMy4xLjEuYmIKaW5kZXggZjkzMTM1Yjk0Yi4uMWJjNmVkYTRhYyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjEuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMS4xLmJiCkBA
IC03LDcgKzcsNyBAQCBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ0VOU0UgPSAiQXBhY2hl
LTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT02MWMzZWU4
OTYxNTc1ODYxZmE4NmM3ZTYyYmM5ZjY5YyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjEwOTdk
ZDYwZDQzYWQwZmZmNjE0YTU3NTI0YmZkNTMxYjM1YzEzYTkwN2QxM2JlZTJjYzJlYzE1MmU2YmY0
YTEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTA1Y2NkNDEzNjY5ZDUxMzJhNTM4MzRkNzkyYzcw
Nzk3NDI0ODA4OGM0ZjYwYzQ5N2RlYjFiNDE2ZTM2NjM5NyIKIAogaW5oZXJpdCBweXBpIHNldHVw
dG9vbHMzIGN5dGhvbgogCi0tIAoyLjQ3LjEKCg==

--===============7695508227776544528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-cython: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/core2-64-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cython/cython-3.1.0.tar.gz;downloadfilename=cython-3.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cython/cython-3.1.1.tar.gz;downloadfilename=cython-3.1.1.tar.gz"
packages/core2-64-poky-linux/python3-cython: PV changed from "3.1.0" to "3.1.1"
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PV changed from "3.1.0" to "3.1.1"
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 26057632 to 26064104 (+0%)
packages/core2-64-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-dev: PV changed from "3.1.0" to "3.1.1"
packages/core2-64-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-doc: PV changed from "3.1.0" to "3.1.1"
packages/core2-64-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-locale: PV changed from "3.1.0" to "3.1.1"
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PV changed from "3.1.0" to "3.1.1"
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 22955745 to 22976934 (+0%)
packages/core2-64-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "3.1.0" to "3.1.1"
packages/core2-64-poky-linux/python3-cython/python3-cython: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython: PV changed from "3.1.0" to "3.1.1"
packages/core2-64-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 14772719 to 14751813 (-0%)
Changes to packages/core2-64-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.13/site-packages/cython-3.1.0.dist-info moved to /usr/lib/python3.13/site-packages/cython-3.1.1.dist-info

--===============7695508227776544528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.13/site-packages/cython-3.1.0.dist-info moved to /usr/lib/python3.13/site-packages/cython-3.1.1.dist-info

--===============7695508227776544528==--

