Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 720DEC54E74
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:18 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.36977.1709330716878546699
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FbtGLGWl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cPQXw9/D;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018dfc0cd669-0cd3183a-c665-4523-a2a7-2ae7d6bc7902-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IOb1ELlfeBASzU5LnbNe2xSotqudFWBafg0KqbjB/5M=;
	b=FbtGLGWlj+xToRVEIYjhIY4IqAURnXvCzQ7WY5b5Xnc8SUPvWeTOCvcsPca9zPsh
	o/YO/FOmC5wEK29NH/mubvOKOFFWHSRgfbtHYDEL+76nP/X9g9m0W8waKNPC56dQxrg
	a+TSv7ujLroex8jVsd30/UtttcMmsDRGpg+TZdz4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IOb1ELlfeBASzU5LnbNe2xSotqudFWBafg0KqbjB/5M=;
	b=cPQXw9/D5hGkAmq2FDaxDjbCtV3U4oMSGuM3GMn3GtoR1dhCzvTLqy2J5SdXUHoL
	Sb2Dyes4eDzVolNwreZoXcLCD4QtY++PavK3Om8gPZEGf7RdDeJGnuMAsIP4gn/cq7r
	8sPwRMZWT3qi9Yz4J9J7BJLQnAr+BVsJjbMzJr60=
Content-Type: multipart/mixed; boundary="===============2214849977366432847=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-ruamel-yaml: upgrading to 0.18.6 SUCCEEDED
Message-ID: <0101018dfc0cd669-0cd3183a-c665-4523-a2a7-2ae7d6bc7902-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196490

--===============2214849977366432847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-ruamel-yaml* to *0.18.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-ruamel-yaml-upgrade-0.17.35-0.18.6.patch
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
From d9a15b6d39ef3c315250727cd4ecefdea24db8a8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 12:46:04 +0000
Subject: [PATCH] python3-ruamel-yaml: upgrade 0.17.35 -> 0.18.6

---
 ...17.35.bb => python3-ruamel-yaml_0.18.6.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.17.35.bb => python3-ruamel-yaml_0.18.6.bb} (33%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb
similarity index 33%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb
index 02911ebde0..17d6e2e8e8 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb
@@ -1,14 +1,35 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,6 +1,6 @@
+#   The MIT License (MIT)
+#  
+# - Copyright (c) 2014-2023 Anthon van der Neut, Ruamel bvba
+# + Copyright (c) 2014-2024 Anthon van der Neut, Ruamel bvba
+#  
+#   Permission is hereby granted, free of charge, to any person obtaining a copy
+#   of this software and associated documentation files (the "Software"), to deal
+# 
+#
+
 SUMMARY = "YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order."
 HOMEPAGE = "https://pypi.org/project/ruamel.yaml/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0e5f41db57c3a8d3584b450d35985ad1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=30cbbccd94bf3a2b0285ec35671a1938"
 
 PYPI_PACKAGE = "ruamel.yaml"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "801046a9caacb1b43acc118969b49b96b65e8847f29029563b29ac61d02db61b"
+SRC_URI[sha256sum] = "8b27e6a217e786c6fbe5634d8f3f11bc63e0f80f6a5890f28863d9c45aac311b"
 
 RDEPENDS:${PN} += "\
     python3-shell \
-- 
2.42.0


--===============2214849977366432847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-ruamel-yaml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.17.35.tar.gz;downloadfilename=ruamel.yaml-0.17.35.tar.gz" to "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.18.6.tar.gz;downloadfilename=ruamel.yaml-0.18.6.tar.gz"
packages/core2-64-poky-linux/python3-ruamel-yaml: PKGV changed from 0.17.35 [default] to 0.18.6 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml: PV changed from "0.17.35" to "0.18.6"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PKGV changed from 0.17.35 [default] to 0.18.6 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PV changed from "0.17.35" to "0.18.6"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PKGV changed from 0.17.35 [default] to 0.18.6 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PV changed from "0.17.35" to "0.18.6"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PKGV changed from 0.17.35 [default] to 0.18.6 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PV changed from "0.17.35" to "0.18.6"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PKGV changed from 0.17.35 [default] to 0.18.6 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PV changed from "0.17.35" to "0.18.6"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PKGV changed from 0.17.35 [default] to 0.18.6 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PV changed from "0.17.35" to "0.18.6"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PKGV changed from 0.17.35 [default] to 0.18.6 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PV changed from "0.17.35" to "0.18.6"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGSIZE changed from 1180597 to 1186680 (+1%)
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGV changed from 0.17.35 [default] to 0.18.6 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: FILELIST: directory renamed /usr/lib/python3.12/site-packages/ruamel.yaml-0.17.35.dist-info -> /usr/lib/python3.12/site-packages/ruamel.yaml-0.18.6.dist-info, added "/usr/lib/python3.12/site-packages/ruamel/yaml/docinfo.py /usr/lib/python3.12/site-packages/ruamel/yaml/__pycache__/docinfo.cpython-312.pyc"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PV changed from "0.17.35" to "0.18.6"
Changes to packages/core2-64-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.18.6.dist-info was added
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.18.6.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.18.6.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.18.6.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.18.6.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.18.6.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/ruamel/yaml/docinfo.py was added
  /usr/lib/python3.12/site-packages/ruamel/yaml/__pycache__/docinfo.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.17.35.dist-info was removed
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.17.35.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.17.35.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.17.35.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.17.35.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.17.35.dist-info/WHEEL was removed

--===============2214849977366432847==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-ruamel-yaml-upgrade-0.17.35-0.18.6.patch"

RnJvbSBkOWExNWI2ZDM5ZWYzYzMxNTI1MDcyN2NkNGVjZWZkZWEyNGRiOGE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxMjo0NjowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcnVhbWVsLXlhbWw6IHVwZ3JhZGUgMC4xNy4zNSAtPiAwLjE4LjYKCi0tLQogLi4uMTcu
MzUuYmIgPT4gcHl0aG9uMy1ydWFtZWwteWFtbF8wLjE4LjYuYmJ9IHwgMjUgKysrKysrKysrKysr
KysrKystLQogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1ydWFtZWwteWFt
bF8wLjE3LjM1LmJiID0+IHB5dGhvbjMtcnVhbWVsLXlhbWxfMC4xOC42LmJifSAoMzMlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ydWFtZWwteWFt
bF8wLjE3LjM1LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1l
bC15YW1sXzAuMTguNi5iYgpzaW1pbGFyaXR5IGluZGV4IDMzJQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlhbWxfMC4xNy4zNS5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAu
MTguNi5iYgppbmRleCAwMjkxMWViZGUwLi4xN2Q2ZTJlOGU4IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlhbWxfMC4xNy4zNS5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlhbWxfMC4xOC42
LmJiCkBAIC0xLDE0ICsxLDM1IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1
ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dp
bmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2Ug
dGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBz
dW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5z
ZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5
ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRQorIyAr
KysgTElDRU5TRQorIyBAQCAtMSw2ICsxLDYgQEAKKyMgICBUaGUgTUlUIExpY2Vuc2UgKE1JVCkK
KyMgIAorIyAtIENvcHlyaWdodCAoYykgMjAxNC0yMDIzIEFudGhvbiB2YW4gZGVyIE5ldXQsIFJ1
YW1lbCBidmJhCisjICsgQ29weXJpZ2h0IChjKSAyMDE0LTIwMjQgQW50aG9uIHZhbiBkZXIgTmV1
dCwgUnVhbWVsIGJ2YmEKKyMgIAorIyAgIFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZy
ZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmluZyBhIGNvcHkKKyMgICBvZiB0aGlz
IHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdh
cmUiKSwgdG8gZGVhbAorIyAKKyMKKwogU1VNTUFSWSA9ICJZQU1MIHBhcnNlci9lbWl0dGVyIHRo
YXQgc3VwcG9ydHMgcm91bmR0cmlwIHByZXNlcnZhdGlvbiBvZiBjb21tZW50cywgc2VxL21hcCBm
bG93IHN0eWxlLCBhbmQgbWFwIGtleSBvcmRlci4iCiBIT01FUEFHRSA9ICJodHRwczovL3B5cGku
b3JnL3Byb2plY3QvcnVhbWVsLnlhbWwvIgogCiBMSUNFTlNFID0gIk1JVCIKLUxJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTBlNWY0MWRiNTdjM2E4ZDM1ODRiNDUwZDM1OTg1
YWQxIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzBjYmJjY2Q5NGJm
M2EyYjAyODVlYzM1NjcxYTE5MzgiCiAKIFBZUElfUEFDS0FHRSA9ICJydWFtZWwueWFtbCIKIAog
aW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4MDEwNDZh
OWNhYWNiMWI0M2FjYzExODk2OWI0OWI5NmI2NWU4ODQ3ZjI5MDI5NTYzYjI5YWM2MWQwMmRiNjFi
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhiMjdlNmEyMTdlNzg2YzZmYmU1NjM0ZDhmM2YxMWJj
NjNlMGY4MGY2YTU4OTBmMjg4NjNkOWM0NWFhYzMxMWIiCiAKIFJERVBFTkRTOiR7UE59ICs9ICJc
CiAgICAgcHl0aG9uMy1zaGVsbCBcCi0tIAoyLjQyLjAKCg==

--===============2214849977366432847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: FILELIST: directory renamed /usr/lib/python3.12/site-packages/ruamel.yaml-0.17.35.dist-info -> /usr/lib/python3.12/site-packages/ruamel.yaml-0.18.6.dist-info, added "/usr/lib/python3.12/site-packages/ruamel/yaml/__pycache__/docinfo.cpython-312.pyc /usr/lib/python3.12/site-packages/ruamel/yaml/docinfo.py"
Changes to packages/core2-64-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.18.6.dist-info was added
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.18.6.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.18.6.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.18.6.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.18.6.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.18.6.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/ruamel/yaml/docinfo.py was added
  /usr/lib/python3.12/site-packages/ruamel/yaml/__pycache__/docinfo.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.17.35.dist-info was removed
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.17.35.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.17.35.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.17.35.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.17.35.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/ruamel.yaml-0.17.35.dist-info/WHEEL was removed

--===============2214849977366432847==--

