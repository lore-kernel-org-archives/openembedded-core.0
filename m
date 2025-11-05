Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65774CD379F
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:36 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2343.1762384572017878893
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dwo43jhz;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=HvU0t1Qr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019a564eb6a3-fd36b215-85a3-4549-83dc-5f8da535024f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384590;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CWck6xVpLBOq9i6iTEqSphsBeMK7OC8cuKyscFD1SAc=;
	b=dwo43jhzS9YFnb6kdxntKqB7KlprOd6V9POaZYZW//cbxg835ivyyOKiXo/BIQHj
	0yvrA5ri4on2BNFoxKX4uoq67CXjkQqwsFwL9V85sjD0NWYMm1b+wt1YVNmFdCZTr9J
	F4pUUnmzHqJIquH9W4AGA7TjaLSbpbD2dgA+b/o8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384590;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CWck6xVpLBOq9i6iTEqSphsBeMK7OC8cuKyscFD1SAc=;
	b=HvU0t1QrkqsACxG4r95NYiMVcoDVF6Ehrr3Fv9LuCU+AaKwtJucJMGXBXzTcQS14
	Lsx4EE81Hl1T+Hie/synjMF7t7zEO44NO3YxOVWyE1dq0rJg/AeJINe6kKFe6HxpfLP
	GE5Db3gUOoPfJWdiqpEzagKNPq2paXXn13i3XR5c=
Content-Type: multipart/mixed; boundary="===============5994376314704281421=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-scons: upgrading to 4.10.0 SUCCEEDED
Message-ID: <0101019a564eb6a3-fd36b215-85a3-4549-83dc-5f8da535024f-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225848

--===============5994376314704281421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-scons* to *4.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-scons-upgrade-4.9.1-4.10.0.patch
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
From 86f504520eb851b3b002f25aa372f557ce6cf44e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 17:54:07 +0000
Subject: [PATCH] python3-scons: upgrade 4.9.1 -> 4.10.0

---
 .../python/{python3-scons_4.9.1.bb => python3-scons_4.10.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-scons_4.9.1.bb => python3-scons_4.10.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-scons_4.9.1.bb b/meta/recipes-devtools/python/python3-scons_4.10.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-scons_4.9.1.bb
rename to meta/recipes-devtools/python/python3-scons_4.10.0.bb
index 1eac1ce5a9..47a763161d 100644
--- a/meta/recipes-devtools/python/python3-scons_4.9.1.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.10.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
-SRC_URI[sha256sum] = "bacac880ba2e86d6a156c116e2f8f2bfa82b257046f3ac2666c85c53c615c338"
+SRC_URI[sha256sum] = "61e2fc42e0e2c750105d61f26cc1dfebcae9f4103d3dc0e9aeb373016b0d208c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============5994376314704281421==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-scons-upgrade-4.9.1-4.10.0.patch"

RnJvbSA4NmY1MDQ1MjBlYjg1MWIzYjAwMmYyNWFhMzcyZjU1N2NlNmNmNDRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNzo1NDowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2NvbnM6IHVwZ3JhZGUgNC45LjEgLT4gNC4xMC4wCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtc2NvbnNfNC45LjEuYmIgPT4gcHl0aG9uMy1zY29uc180LjEwLjAuYmJ9ICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc2NvbnNfNC45LjEuYmIgPT4gcHl0
aG9uMy1zY29uc180LjEwLjAuYmJ9ICg4OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXNjb25zXzQuOS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXNjb25zXzQuMTAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg4JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2NvbnNfNC45
LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zY29u
c180LjEwLjAuYmIKaW5kZXggMWVhYzFjZTVhOS4uNDdhNzYzMTYxZCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNjb25zXzQuOS4xLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zY29uc180LjEwLjAuYmIKQEAgLTQs
NyArNCw3IEBAIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDRU5TRSA9ICJNSVQiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1kOTAzYjBiODAyN2Y0NjE0MDJiYWM5
YjUxNjliMzZmNyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImJhY2FjODgwYmEyZTg2ZDZhMTU2
YzExNmUyZjhmMmJmYTgyYjI1NzA0NmYzYWMyNjY2Yzg1YzUzYzYxNWMzMzgiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiNjFlMmZjNDJlMGUyYzc1MDEwNWQ2MWYyNmNjMWRmZWJjYWU5ZjQxMDNkM2Rj
MGU5YWViMzczMDE2YjBkMjA4YyIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1
aWxkX21ldGEKIAotLSAKMi40Ny4xCgo=

--===============5994376314704281421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-scons/python3-scons: FILELIST: directory renamed /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info -> /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/licenses, added "/usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/licenses/SCons/Tool/docbook/docbook-xsl-1.76.1/COPYING"
Changes to packages/x86-64-v3-poky-linux/python3-scons (sysroot):
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info was added
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/licenses/SCons was added
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/licenses/SCons/Tool was added
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/licenses/SCons/Tool/docbook was added
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/licenses/SCons/Tool/docbook/docbook-xsl-1.76.1 was added
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/licenses/SCons/Tool/docbook/docbook-xsl-1.76.1/COPYING was added
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/WHEEL was removed

--===============5994376314704281421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-scons: PKGV changed from 4.9.1 [default] to 4.10.0 [default]
packages/x86-64-v3-poky-linux/python3-scons: PV changed from "4.9.1" to "4.10.0"
packages/x86-64-v3-poky-linux/python3-scons: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/scons/scons-4.9.1.tar.gz;downloadfilename=scons-4.9.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/scons/scons-4.10.0.tar.gz;downloadfilename=scons-4.10.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-dbg: PKGV changed from 4.9.1 [default] to 4.10.0 [default]
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-dbg: PV changed from "4.9.1" to "4.10.0"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-dev: PKGV changed from 4.9.1 [default] to 4.10.0 [default]
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-dev: PV changed from "4.9.1" to "4.10.0"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-doc: PKGV changed from 4.9.1 [default] to 4.10.0 [default]
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-doc: PV changed from "4.9.1" to "4.10.0"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-locale: PKGV changed from 4.9.1 [default] to 4.10.0 [default]
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-locale: PV changed from "4.9.1" to "4.10.0"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-src: PKGV changed from 4.9.1 [default] to 4.10.0 [default]
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-src: PV changed from "4.9.1" to "4.10.0"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-staticdev: PKGV changed from 4.9.1 [default] to 4.10.0 [default]
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-staticdev: PV changed from "4.9.1" to "4.10.0"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons: FILELIST: directory renamed /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info -> /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/licenses, added "/usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/licenses/SCons/Tool/docbook/docbook-xsl-1.76.1/COPYING"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons: PKGV changed from 4.9.1 [default] to 4.10.0 [default]
packages/x86-64-v3-poky-linux/python3-scons/python3-scons: PV changed from "4.9.1" to "4.10.0"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons: PKGSIZE changed from 21993243 to 22017895 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-scons (sysroot):
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info was added
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/licenses/SCons was added
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/licenses/SCons/Tool was added
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/licenses/SCons/Tool/docbook was added
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/licenses/SCons/Tool/docbook/docbook-xsl-1.76.1 was added
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/licenses/SCons/Tool/docbook/docbook-xsl-1.76.1/COPYING was added
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/scons-4.10.0.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/scons-4.9.1.dist-info/WHEEL was removed

--===============5994376314704281421==--

