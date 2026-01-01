Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F9EEED600
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:37:59 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102973.1767267475523399507
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TBLVATD5;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=dMOc8t5/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019b79599d18-da5f5356-bfd9-4d16-90f9-eb3878ff400c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267474;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fbahua3LBeJPzF3Poh7CDx2qVMIJard1YytwkcmdLxI=;
	b=TBLVATD5Uiv3U3XM2I0joL8mQC3vfWE6obySjbAlVbB/IJ6BVT/mAc1HNR6ufjHa
	+CDS/BWGrw/+AF6GrbC8gZPnXrZuyZl9U1cx/f58pvNuefB3fbiOKlcUgVlertJ4BCz
	u0KGDGURnEkkqCGMFkY0dL3AVs7k2XOD2BJHGIoc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267474;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fbahua3LBeJPzF3Poh7CDx2qVMIJard1YytwkcmdLxI=;
	b=dMOc8t5/33hmgi6+h202ZQqUZbfGnd4AWWOoh6YTtk3JJJg9KBkccUNWTPTK6uf9
	ZOfb6lduW/0zmLa64lijt5WWutIdLaEEFSbDtoNwpE+z3w7sBXEOcGvQrz7asTm1G3d
	mkYmtOCqYqz5mleEfWE1m1RgR10qtTZGAPQWSk5U=
Content-Type: multipart/mixed; boundary="===============3279075721821567874=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-ruamel-yaml: upgrading to 0.19.0 SUCCEEDED
Message-ID: <0101019b79599d18-da5f5356-bfd9-4d16-90f9-eb3878ff400c-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228779

--===============3279075721821567874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-ruamel-yaml* to *0.19.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-ruamel-yaml-upgrade-0.18.17-0.19.0.patch
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
From cb8d0134c8b8e39332264f28b35a6c59436beca8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 08:08:45 +0000
Subject: [PATCH] python3-ruamel-yaml: upgrade 0.18.17 -> 0.19.0

---
 ...on3-ruamel-yaml_0.18.17.bb => python3-ruamel-yaml_0.19.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.18.17.bb => python3-ruamel-yaml_0.19.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.17.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.18.17.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.19.0.bb
index a513a9e957..2ec285addb 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.17.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.0.bb
@@ -10,7 +10,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 inherit pypi python_setuptools_build_meta
 
 S = "${UNPACKDIR}/ruamel.yaml-${PV}"
-SRC_URI[sha256sum] = "9091cd6e2d93a3a4b157ddb8fabf348c3de7f1fb1381346d985b6b247dcd8d3c"
+SRC_URI[sha256sum] = "ff19233e1eb3e9301e7a3d437847713e361a80faace167639327efbe8c0e5f95"
 
 RDEPENDS:${PN} += "\
     python3-shell \
-- 
2.47.1


--===============3279075721821567874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-ruamel-yaml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/ruamel_yaml/ruamel_yaml-0.18.17.tar.gz;downloadfilename=ruamel_yaml-0.18.17.tar.gz" to "https://files.pythonhosted.org/packages/source/r/ruamel_yaml/ruamel_yaml-0.19.0.tar.gz;downloadfilename=ruamel_yaml-0.19.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml: PKGV changed from 0.18.17 [default] to 0.19.0 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml: PV changed from "0.18.17" to "0.19.0"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PKGV changed from 0.18.17 [default] to 0.19.0 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PV changed from "0.18.17" to "0.19.0"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PKGV changed from 0.18.17 [default] to 0.19.0 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PV changed from "0.18.17" to "0.19.0"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PKGV changed from 0.18.17 [default] to 0.19.0 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PV changed from "0.18.17" to "0.19.0"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PKGV changed from 0.18.17 [default] to 0.19.0 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PV changed from "0.18.17" to "0.19.0"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PKGV changed from 0.18.17 [default] to 0.19.0 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PV changed from "0.18.17" to "0.19.0"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PKGV changed from 0.18.17 [default] to 0.19.0 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PV changed from "0.18.17" to "0.19.0"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGSIZE changed from 1217216 to 1207113 (-1%)
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: FILELIST: directory renamed /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.17.dist-info/licenses -> /usr/lib/python3.13/site-packages/ruamel_yaml-0.19.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.17.dist-info -> /usr/lib/python3.13/site-packages/ruamel_yaml-0.19.0.dist-info
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGV changed from 0.18.17 [default] to 0.19.0 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PV changed from "0.18.17" to "0.19.0"
Changes to packages/x86-64-v3-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.19.0.dist-info was added
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.19.0.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.19.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.19.0.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.19.0.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.19.0.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.17.dist-info was removed
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.17.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.17.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.17.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.17.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.17.dist-info/WHEEL was removed

--===============3279075721821567874==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-ruamel-yaml-upgrade-0.18.17-0.19.0.patch"

RnJvbSBjYjhkMDEzNGM4YjhlMzkzMzIyNjRmMjhiMzVhNmM1OTQzNmJlY2E4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAwODowODo0NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcnVhbWVsLXlhbWw6IHVwZ3JhZGUgMC4xOC4xNyAtPiAwLjE5LjAKCi0tLQogLi4ub24z
LXJ1YW1lbC15YW1sXzAuMTguMTcuYmIgPT4gcHl0aG9uMy1ydWFtZWwteWFtbF8wLjE5LjAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1ydWFtZWwteWFtbF8w
LjE4LjE3LmJiID0+IHB5dGhvbjMtcnVhbWVsLXlhbWxfMC4xOS4wLmJifSAoODYlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ydWFtZWwteWFtbF8w
LjE4LjE3LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15
YW1sXzAuMTkuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlhbWxfMC4xOC4xNy5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAuMTku
MC5iYgppbmRleCBhNTEzYTllOTU3Li4yZWMyODVhZGRiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlhbWxfMC4xOC4xNy5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlhbWxfMC4xOS4wLmJi
CkBAIC0xMCw3ICsxMCw3IEBAIFVQU1RSRUFNX0NIRUNLX1BZUElfUEFDS0FHRSA9ICIke1BZUElf
UEFDS0FHRX0iCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCiBT
ID0gIiR7VU5QQUNLRElSfS9ydWFtZWwueWFtbC0ke1BWfSIKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICI5MDkxY2Q2ZTJkOTNhM2E0YjE1N2RkYjhmYWJmMzQ4YzNkZTdmMWZiMTM4MTM0NmQ5ODViNmIy
NDdkY2Q4ZDNjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImZmMTkyMzNlMWViM2U5MzAxZTdhM2Q0
Mzc4NDc3MTNlMzYxYTgwZmFhY2UxNjc2MzkzMjdlZmJlOGMwZTVmOTUiCiAKIFJERVBFTkRTOiR7
UE59ICs9ICJcCiAgICAgcHl0aG9uMy1zaGVsbCBcCi0tIAoyLjQ3LjEKCg==

--===============3279075721821567874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: FILELIST: directory renamed /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.17.dist-info/licenses -> /usr/lib/python3.13/site-packages/ruamel_yaml-0.19.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.17.dist-info -> /usr/lib/python3.13/site-packages/ruamel_yaml-0.19.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.19.0.dist-info was added
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.19.0.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.19.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.19.0.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.19.0.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.19.0.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.17.dist-info was removed
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.17.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.17.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.17.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.17.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.17.dist-info/WHEEL was removed

--===============3279075721821567874==--

