Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C624CA0EFA
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:11 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.11333.1755263225452838599
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SX4Dbro5;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RpUGTsAf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010198add74be7-0e6aa8dd-2213-4b5c-8608-ef95b01accc0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263224;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=56PF93m1MdNe3uTWIsw3mBud9nj72D87wrGQFZui+u4=;
	b=SX4Dbro5rH5PT/kwdCzNhS5MrKK2wZWGes/OnM+SdE3Q/St//YSNFi1oYWxuMRL4
	rV+imZwx6YFQ9eIQr4vgqufasLiX+3Yo5Aa4StB9ak2gOC33TUDdpyMKWb1FWxX97I0
	zV0EXxQOyafzuSDZpRP8oVFCF1Ka/93XDugJdTbo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263224;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=56PF93m1MdNe3uTWIsw3mBud9nj72D87wrGQFZui+u4=;
	b=RpUGTsAfMTlg4QmDa/E1/i0xuL6FVnxnQnVmm/C77wbV98VmjYFyPUnrAdtBN5Nv
	r4RAm8PtAIukjaavvajTLcyCuYeYWKl7weMvhP+hAdDzhKtQqPW6w+BZ/aIcfwTF+2I
	qScjXU6o9rXEzASGuxOTv6ipMbxihQcMd88dNjAw=
Content-Type: multipart/mixed; boundary="===============7793707423260619039=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2025.8 SUCCEEDED
Message-ID: <01010198add74be7-0e6aa8dd-2213-4b5c-8608-ef95b01accc0-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221910

--===============7793707423260619039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-dtschema* to *2025.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2025.6.1-2025.8.patch
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
From 083e2e47aea23dca320cd2ecd6d382f96ec66047 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 09:02:21 +0000
Subject: [PATCH] python3-dtschema: upgrade 2025.6.1 -> 2025.8

---
 ...{python3-dtschema_2025.6.1.bb => python3-dtschema_2025.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2025.6.1.bb => python3-dtschema_2025.8.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2025.6.1.bb b/meta/recipes-devtools/python/python3-dtschema_2025.8.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2025.6.1.bb
rename to meta/recipes-devtools/python/python3-dtschema_2025.8.bb
index 872084841b..9aba5f85ee 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2025.6.1.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2025.8.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "6348fb23961d0cd1c89ea0c29b790c622bc34fdd1be56090724c6c1f76cbf10d"
+SRC_URI[sha256sum] = "3c63b643fa76215b32cc6cbea9fd0dc7627dc71c67f3dca14fc04d70a7e1235e"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.47.1


--===============7793707423260619039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info -> /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info, added "/usr/lib/python3.13/site-packages/dtschema/schemas/system-idle-states.yaml"
Changes to packages/core2-64-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info was added
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/dtschema/schemas/system-idle-states.yaml was added
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/WHEEL was removed

--===============7793707423260619039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2025.6.1.tar.gz;downloadfilename=dtschema-2025.6.1.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2025.8.tar.gz;downloadfilename=dtschema-2025.8.tar.gz"
packages/core2-64-poky-linux/python3-dtschema: PV changed from "2025.6.1" to "2025.8"
packages/core2-64-poky-linux/python3-dtschema: PKGV changed from 2025.6.1 [default] to 2025.8 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2025.6.1" to "2025.8"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2025.6.1 [default] to 2025.8 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2025.6.1" to "2025.8"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2025.6.1 [default] to 2025.8 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2025.6.1" to "2025.8"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2025.6.1 [default] to 2025.8 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2025.6.1" to "2025.8"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2025.6.1 [default] to 2025.8 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2025.6.1" to "2025.8"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2025.6.1 [default] to 2025.8 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2025.6.1" to "2025.8"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2025.6.1 [default] to 2025.8 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info -> /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info, added "/usr/lib/python3.13/site-packages/dtschema/schemas/system-idle-states.yaml"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2025.6.1" to "2025.8"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 393540 to 399218 (+1%)
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2025.6.1 [default] to 2025.8 [default]
Changes to packages/core2-64-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info was added
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.8.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/dtschema/schemas/system-idle-states.yaml was added
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2025.6.1.dist-info/WHEEL was removed

--===============7793707423260619039==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2025.6.1-2025.8.patch"

RnJvbSAwODNlMmU0N2FlYTIzZGNhMzIwY2QyZWNkNmQzODJmOTZlYzY2MDQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMDk6MDI6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWR0c2NoZW1hOiB1cGdyYWRlIDIwMjUuNi4xIC0+IDIwMjUuOAoKLS0tCiAuLi57cHl0
aG9uMy1kdHNjaGVtYV8yMDI1LjYuMS5iYiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjUuOC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWR0c2NoZW1hXzIwMjUu
Ni4xLmJiID0+IHB5dGhvbjMtZHRzY2hlbWFfMjAyNS44LmJifSAoODUlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDI1LjYuMS5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDI1Ljgu
YmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjUuNi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyNS44LmJiCmluZGV4IDg3MjA4
NDg0MWIuLjlhYmE1Zjg1ZWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1kdHNjaGVtYV8yMDI1LjYuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyNS44LmJiCkBAIC03LDcgKzcsNyBAQCBpbmhl
cml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCiBQWVBJX1BBQ0tBR0UgPSAi
ZHRzY2hlbWEiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2MzQ4ZmIyMzk2MWQwY2QxYzg5ZWEw
YzI5Yjc5MGM2MjJiYzM0ZmRkMWJlNTYwOTA3MjRjNmMxZjc2Y2JmMTBkIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjNjNjNiNjQzZmE3NjIxNWIzMmNjNmNiZWE5ZmQwZGM3NjI3ZGM3MWM2N2YzZGNh
MTRmYzA0ZDcwYTdlMTIzNWUiCiAKIERFUEVORFMgKz0gInB5dGhvbjMtc2V0dXB0b29scy1zY20t
bmF0aXZlIgogUkRFUEVORFM6JHtQTn0gKz0gIlwKLS0gCjIuNDcuMQoK

--===============7793707423260619039==--

