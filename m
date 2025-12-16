Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20BBD5CCB6
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:38 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17392.1765872135156596590
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=yJ9ubWlu;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=qRUYxA1r;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019b262e9fb7-eecd08b0-0dc0-47f1-ae06-e6e81248aa44-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BSNT2I6M/ey2msM94VysI6zK7hkofxEKz7h7N2OOvPI=;
	b=yJ9ubWlucr379DgrRrb8exwQ6eZcbAcCqzSSWzR/OwIWVU8foUIoOVfmrPW5Dz47
	sT6hGmhoq0PWWDlkcjXv64ElNChGRDCcd1DHxx430Ghvxrjjz9yeuwPZ9ZLKsq587Xm
	+9LH6ZhN4sJSY1Fl94EOpIpqwrmpqE/jJiompOM0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BSNT2I6M/ey2msM94VysI6zK7hkofxEKz7h7N2OOvPI=;
	b=qRUYxA1r04a0L3WFgqxUEbQZscqRson4wkeMqbL0zfnU6P7fMoP9bYZjakezSPCt
	yL/Q0Y2jiNpsuYzaFrjtO86my2Uh0voPKLtd/6j5jB1P6RhzjPHWifUlCaxYXkqMiK1
	Xc5jBK8eizb1W4F7gFgkw+iWtNTr0s8uV72W65lM=
Content-Type: multipart/mixed; boundary="===============7063372220213408729=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-scons: upgrading to 4.10.1 SUCCEEDED
Message-ID: <0101019b262e9fb7-eecd08b0-0dc0-47f1-ae06-e6e81248aa44-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227826

--===============7063372220213408729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-scons* to *4.10.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-scons-upgrade-4.9.1-4.10.1.patch
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
From 411bc91b215b69bfc24634df22df242e2efb92c8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 01:21:59 +0000
Subject: [PATCH] python3-scons: upgrade 4.9.1 -> 4.10.1

---
 .../python/{python3-scons_4.9.1.bb => python3-scons_4.10.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-scons_4.9.1.bb => python3-scons_4.10.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-scons_4.9.1.bb b/meta/recipes-devtools/python/python3-scons_4.10.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-scons_4.9.1.bb
rename to meta/recipes-devtools/python/python3-scons_4.10.1.bb
index 1eac1ce5a9..4a62e2e811 100644
--- a/meta/recipes-devtools/python/python3-scons_4.9.1.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.10.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
-SRC_URI[sha256sum] = "bacac880ba2e86d6a156c116e2f8f2bfa82b257046f3ac2666c85c53c615c338"
+SRC_URI[sha256sum] = "99c0e94a42a2c1182fa6859b0be697953db07ba936ecc9817ae0d218ced20b15"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============7063372220213408729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-scons/python3-scons: FILELIST: directory renamed /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info -> /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info, directory renamed /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/licenses, added "/usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/licenses/SCons/Tool/docbook/docbook-xsl-1.76.1/COPYING"
Changes to packages/x86-64-v3-poky-linux/python3-scons (sysroot):
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info was added
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/licenses/SCons was added
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/licenses/SCons/Tool was added
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/licenses/SCons/Tool/docbook was added
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/licenses/SCons/Tool/docbook/docbook-xsl-1.76.1 was added
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/licenses/SCons/Tool/docbook/docbook-xsl-1.76.1/COPYING was added
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/WHEEL was removed

--===============7063372220213408729==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-scons-upgrade-4.9.1-4.10.1.patch"

RnJvbSA0MTFiYzkxYjIxNWI2OWJmYzI0NjM0ZGYyMmRmMjQyZTJlZmI5MmM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDE6MjE6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNjb25zOiB1cGdyYWRlIDQuOS4xIC0+IDQuMTAuMQoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXNjb25zXzQuOS4xLmJiID0+IHB5dGhvbjMtc2NvbnNfNC4xMC4xLmJifSAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNjb25zXzQuOS4xLmJiID0+IHB5
dGhvbjMtc2NvbnNfNC4xMC4xLmJifSAoODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1zY29uc180LjkuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1zY29uc180LjEwLjEuYmIKc2ltaWxhcml0eSBpbmRleCA4OCUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNjb25zXzQu
OS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2Nv
bnNfNC4xMC4xLmJiCmluZGV4IDFlYWMxY2U1YTkuLjRhNjJlMmU4MTEgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zY29uc180LjkuMS5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2NvbnNfNC4xMC4xLmJiCkBAIC00
LDcgKzQsNyBAQCBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ0VOU0UgPSAiTUlUIgogTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZDkwM2IwYjgwMjdmNDYxNDAyYmFj
OWI1MTY5YjM2ZjciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiYWNhYzg4MGJhMmU4NmQ2YTE1
NmMxMTZlMmY4ZjJiZmE4MmIyNTcwNDZmM2FjMjY2NmM4NWM1M2M2MTVjMzM4IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjk5YzBlOTRhNDJhMmMxMTgyZmE2ODU5YjBiZTY5Nzk1M2RiMDdiYTkzNmVj
Yzk4MTdhZTBkMjE4Y2VkMjBiMTUiCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19i
dWlsZF9tZXRhCiAKLS0gCjIuNDcuMQoK

--===============7063372220213408729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-scons: PKGV changed from 4.9.1 [default] to 4.10.1 [default]
packages/x86-64-v3-poky-linux/python3-scons: PV changed from "4.9.1" to "4.10.1"
packages/x86-64-v3-poky-linux/python3-scons: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/scons/scons-4.9.1.tar.gz;downloadfilename=scons-4.9.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/scons/scons-4.10.1.tar.gz;downloadfilename=scons-4.10.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-dbg: PKGV changed from 4.9.1 [default] to 4.10.1 [default]
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-dbg: PV changed from "4.9.1" to "4.10.1"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-dev: PKGV changed from 4.9.1 [default] to 4.10.1 [default]
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-dev: PV changed from "4.9.1" to "4.10.1"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-doc: PKGV changed from 4.9.1 [default] to 4.10.1 [default]
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-doc: PV changed from "4.9.1" to "4.10.1"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-locale: PKGV changed from 4.9.1 [default] to 4.10.1 [default]
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-locale: PV changed from "4.9.1" to "4.10.1"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-src: PKGV changed from 4.9.1 [default] to 4.10.1 [default]
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-src: PV changed from "4.9.1" to "4.10.1"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-staticdev: PKGV changed from 4.9.1 [default] to 4.10.1 [default]
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-staticdev: PV changed from "4.9.1" to "4.10.1"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons: PKGV changed from 4.9.1 [default] to 4.10.1 [default]
packages/x86-64-v3-poky-linux/python3-scons/python3-scons: PV changed from "4.9.1" to "4.10.1"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons: PKGSIZE changed from 21993243 to 22020593 (+0%)
packages/x86-64-v3-poky-linux/python3-scons/python3-scons: FILELIST: directory renamed /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info -> /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info, added "/usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/licenses/SCons/Tool/docbook/docbook-xsl-1.76.1/COPYING"
Changes to packages/x86-64-v3-poky-linux/python3-scons (sysroot):
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info was added
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/licenses/SCons was added
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/licenses/SCons/Tool was added
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/licenses/SCons/Tool/docbook was added
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/licenses/SCons/Tool/docbook/docbook-xsl-1.76.1 was added
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/licenses/SCons/Tool/docbook/docbook-xsl-1.76.1/COPYING was added
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/scons-4.10.1.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/WHEEL was removed

--===============7063372220213408729==--

