Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9370D6005E
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:10 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.4672.1731964625466138589
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Wcl7Plh6;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0N8wdfTF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101934122e368-c5302928-5188-4160-8525-9f040afd90bf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964625;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=S6gicIGPKrmTCepigPx92HPpa2VbE2+QAbTptwHcJtQ=;
	b=Wcl7Plh6DJP0K5X++UIn0GcYQ9xrU+X97F2ZI/f9ng+PkHE8+Q2gdz4ewg6Ry+i9
	JEoRd7GQeuDc+Y8odNLtS4EULB+MGKkgidWHGbRGFwoS4vgCXsmbU36Lo5lzYLaVTkB
	vFKnTajnsZ0XS5aXMPo5vjZ5DGVD3NUIDOXU2KOg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964625;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=S6gicIGPKrmTCepigPx92HPpa2VbE2+QAbTptwHcJtQ=;
	b=0N8wdfTFsJKrBnM3NiUX+ws0Dnp2l7p+its/z7yqjz/NQY9pU79Du4l714Q48/nO
	C/32Vzz0bvKIfsfptuAAuTAEXuGulUAHR1n5pZKyaqdW+FrodrNkErSX4vJP86c0rwP
	VFyVC2zikHei1xNdUhyEKZgWMQ83kam3LppJwvsA=
Content-Type: multipart/mixed; boundary="===============6551807011612040843=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2024.11 SUCCEEDED
Message-ID: <010101934122e368-c5302928-5188-4160-8525-9f040afd90bf-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207275

--===============6551807011612040843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-dtschema* to *2024.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2024.9-2024.11.patch
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
From 4e5ab16128daf8084333b93fcbd5b803a5529ebe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 20:46:17 +0000
Subject: [PATCH] python3-dtschema: upgrade 2024.9 -> 2024.11

---
 .../{python3-dtschema_2024.9.bb => python3-dtschema_2024.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2024.9.bb => python3-dtschema_2024.11.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2024.9.bb b/meta/recipes-devtools/python/python3-dtschema_2024.11.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2024.9.bb
rename to meta/recipes-devtools/python/python3-dtschema_2024.11.bb
index 5a159297fb..8d052d6910 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2024.9.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2024.11.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "1e5cc422736d5e4167f764478e50093f340bbede95b569ed66d60748dbc39ab2"
+SRC_URI[sha256sum] = "bb7dd36ff9406ec89607b893cfc5e1ffa7ead76fd5c48df77eafc9b4d4196047"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.44.1


--===============6551807011612040843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.13/site-packages/dtschema-2024.9.dist-info -> /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info, added "/usr/lib/python3.13/site-packages/dtschema/cmp_schema.py /usr/lib/python3.13/site-packages/dtschema/__pycache__/cmp_schema.cpython-313.pyc /usr/lib/python3.13/site-packages/dtschema/schemas/gpio/gpio-nexus-node.yaml /usr/bin/dt-cmp-schema /usr/lib/python3.13/site-packages/dtschema/schemas/wakeup-source.yaml"
Changes to packages/core2-64-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info was added
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info/RECORD was added
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/dtschema/cmp_schema.py was added
  /usr/lib/python3.13/site-packages/dtschema/__pycache__/cmp_schema.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/dtschema/schemas/gpio/gpio-nexus-node.yaml was added
  /usr/lib/python3.13/site-packages/dtschema/schemas/wakeup-source.yaml was added
  /usr/lib/python3.13/site-packages/dtschema-2024.9.dist-info was removed
  /usr/lib/python3.13/site-packages/dtschema-2024.9.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2024.9.dist-info/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2024.9.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/dtschema-2024.9.dist-info/RECORD was removed
  /usr/lib/python3.13/site-packages/dtschema-2024.9.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2024.9.dist-info/WHEEL was removed

--===============6551807011612040843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-dtschema: PKGV changed from 2024.9 [default] to 2024.11 [default]
packages/core2-64-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2024.9.tar.gz;downloadfilename=dtschema-2024.9.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2024.11.tar.gz;downloadfilename=dtschema-2024.11.tar.gz"
packages/core2-64-poky-linux/python3-dtschema: PV changed from "2024.9" to "2024.11"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2024.9" to "2024.11"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2024.9 [default] to 2024.11 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2024.9" to "2024.11"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2024.9 [default] to 2024.11 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2024.9" to "2024.11"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2024.9 [default] to 2024.11 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2024.9" to "2024.11"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2024.9 [default] to 2024.11 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2024.9" to "2024.11"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2024.9 [default] to 2024.11 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2024.9" to "2024.11"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2024.9 [default] to 2024.11 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.13/site-packages/dtschema-2024.9.dist-info -> /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info, added "/usr/lib/python3.13/site-packages/dtschema/__pycache__/cmp_schema.cpython-313.pyc /usr/lib/python3.13/site-packages/dtschema/schemas/wakeup-source.yaml /usr/lib/python3.13/site-packages/dtschema/schemas/gpio/gpio-nexus-node.yaml /usr/bin/dt-cmp-schema /usr/lib/python3.13/site-packages/dtschema/cmp_schema.py"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 362417 to 378894 (+5%)
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2024.9" to "2024.11"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2024.9 [default] to 2024.11 [default]
Changes to packages/core2-64-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info was added
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info/RECORD was added
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/dtschema/cmp_schema.py was added
  /usr/lib/python3.13/site-packages/dtschema/__pycache__/cmp_schema.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/dtschema/schemas/gpio/gpio-nexus-node.yaml was added
  /usr/lib/python3.13/site-packages/dtschema/schemas/wakeup-source.yaml was added
  /usr/lib/python3.13/site-packages/dtschema-2024.9.dist-info was removed
  /usr/lib/python3.13/site-packages/dtschema-2024.9.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2024.9.dist-info/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2024.9.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/dtschema-2024.9.dist-info/RECORD was removed
  /usr/lib/python3.13/site-packages/dtschema-2024.9.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2024.9.dist-info/WHEEL was removed

--===============6551807011612040843==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2024.9-2024.11.patch"

RnJvbSA0ZTVhYjE2MTI4ZGFmODA4NDMzM2I5M2ZjYmQ1YjgwM2E1NTI5ZWJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMjA6NDY6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWR0c2NoZW1hOiB1cGdyYWRlIDIwMjQuOSAtPiAyMDI0LjExCgotLS0KIC4uLi97cHl0
aG9uMy1kdHNjaGVtYV8yMDI0LjkuYmIgPT4gcHl0aG9uMy1kdHNjaGVtYV8yMDI0LjExLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtZHRzY2hlbWFfMjAyNC45
LmJiID0+IHB5dGhvbjMtZHRzY2hlbWFfMjAyNC4xMS5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyNC45LmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjQuMTEuYmIK
c2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjQuOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjQuMTEuYmIKaW5kZXggNWExNTkyOTdm
Yi4uOGQwNTJkNjkxMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWR0c2NoZW1hXzIwMjQuOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyNC4xMS5iYgpAQCAtNyw3ICs3LDcgQEAgaW5oZXJpdCBw
eXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAogUFlQSV9QQUNLQUdFID0gImR0c2No
ZW1hIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWU1Y2M0MjI3MzZkNWU0MTY3Zjc2NDQ3OGU1
MDA5M2YzNDBiYmVkZTk1YjU2OWVkNjZkNjA3NDhkYmMzOWFiMiIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICJiYjdkZDM2ZmY5NDA2ZWM4OTYwN2I4OTNjZmM1ZTFmZmE3ZWFkNzZmZDVjNDhkZjc3ZWFm
YzliNGQ0MTk2MDQ3IgogCiBERVBFTkRTICs9ICJweXRob24zLXNldHVwdG9vbHMtc2NtLW5hdGl2
ZSIKIFJERVBFTkRTOiR7UE59ICs9ICJcCi0tIAoyLjQ0LjEKCg==

--===============6551807011612040843==--

