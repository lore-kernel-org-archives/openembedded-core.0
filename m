Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8792ACD4844
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:57 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15602.1777645526072816566
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=sI0CrxiM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=uQm3FFUb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019de3ee5a67-06060d72-b4c3-48df-acee-1c7ed7a85830-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=W6cXXTcfpaTW5tTT4Ub2x1nk7tsp5kxI8g3++UXvT6k=;
	b=sI0CrxiMWJsu79hUNyUPekd6uZzTWFLG3QZ1M60mHv1JuM1bWhVheHbqoRdlhmL4
	yybrIVWSqorgmfmJ4EaUcn52aikznJV7I+tks6etsKiQQpTARV1PbfGBHcIgS74nUCb
	pnh48I45z8D2JILUSVEUXUVz7hjVNjtI426oAptc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=W6cXXTcfpaTW5tTT4Ub2x1nk7tsp5kxI8g3++UXvT6k=;
	b=uQm3FFUbARHvLCvqDccoj6NDZeJ7HTW6eAjb3eieMyA7NYzuSu6d6X6pIFzQVGLD
	oURPO3VEPqQI2thxwczvE6beDLndXVaAx0wLUrjJhMQwuyvNXZX6Rg+FhwnfzDglozQ
	Ev1Id2riOAdNta+/t3i+BjVkXrmSKN8BJhJoqTaA=
Content-Type: multipart/mixed; boundary="===============6922498479284497432=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.26.8 SUCCEEDED
Message-ID: <0101019de3ee5a67-06060d72-b4c3-48df-acee-1c7ed7a85830-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236241

--===============6922498479284497432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.26.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.26.7-2.26.8.patch
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
From 8f5a019bc24075b38f663fdcf8c18a79c1ecdf90 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 08:59:43 +0000
Subject: [PATCH] python3-pdm: upgrade 2.26.7 -> 2.26.8

---
 .../python/{python3-pdm_2.26.7.bb => python3-pdm_2.26.8.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.26.7.bb => python3-pdm_2.26.8.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.26.7.bb b/meta/recipes-devtools/python/python3-pdm_2.26.8.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.26.7.bb
rename to meta/recipes-devtools/python/python3-pdm_2.26.8.bb
index 5e6cdcb4cf..91fcc6a5af 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.26.7.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.26.8.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "0a96a6fb4d60dfeacc1f68bf77efda39503833f6c01866cc8700ea403f0183b7"
+SRC_URI[sha256sum] = "f53a20b4b6beaa88da577a7413ebbb51bee534441339b006dba2260edbc81757"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============6922498479284497432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.7.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info, directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.7.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.26.7.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info

--===============6922498479284497432==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.26.7-2.26.8.patch"

RnJvbSA4ZjVhMDE5YmMyNDA3NWIzOGY2NjNmZGNmOGMxOGE3OWMxZWNkZjkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwODo1OTo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGRtOiB1cGdyYWRlIDIuMjYuNyAtPiAyLjI2LjgKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1wZG1fMi4yNi43LmJiID0+IHB5dGhvbjMtcGRtXzIuMjYuOC5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wZG1fMi4yNi43LmJiID0+IHB5dGhv
bjMtcGRtXzIuMjYuOC5iYn0gKDgwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuNy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1wZG1fMi4yNi44LmJiCnNpbWlsYXJpdHkgaW5kZXggODAlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG1fMi4yNi43LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuOC5i
YgppbmRleCA1ZTZjZGNiNGNmLi45MWZjYzZhNWFmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuNy5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuOC5iYgpAQCAtNCw3ICs0LDcgQEAgTElD
RU5TRSA9ICJNSVQiCiBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTJlYjMxYTJjYzFhNzU4YzM0YjQ5OWYyODdkZDA0ZWYyIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGE5NmE2ZmI0ZDYwZGZlYWNjMWY2OGJmNzdlZmRhMzk1
MDM4MzNmNmMwMTg2NmNjODcwMGVhNDAzZjAxODNiNyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJm
NTNhMjBiNGI2YmVhYTg4ZGE1NzdhNzQxM2ViYmI1MWJlZTUzNDQ0MTMzOWIwMDZkYmEyMjYwZWRi
YzgxNzU3IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3BkbQogCi0tIAoyLjQ3LjEKCg==

--===============6922498479284497432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.26.7.tar.gz;downloadfilename=pdm-2.26.7.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.26.8.tar.gz;downloadfilename=pdm-2.26.8.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm: PKGV changed from 2.26.7 [default] to 2.26.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm: PV changed from "2.26.7" to "2.26.8"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.26.7 [default] to 2.26.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.26.7" to "2.26.8"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.26.7 [default] to 2.26.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.26.7" to "2.26.8"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.26.7 [default] to 2.26.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.26.7" to "2.26.8"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.26.7 [default] to 2.26.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.26.7" to "2.26.8"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.26.7 [default] to 2.26.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.26.7" to "2.26.8"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.26.7 [default] to 2.26.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.26.7" to "2.26.8"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2496904 to 2500151 (+0%)
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.26.7 [default] to 2.26.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.7.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info, directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.7.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PV changed from "2.26.7" to "2.26.8"
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.26.7.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info

--===============6922498479284497432==--

