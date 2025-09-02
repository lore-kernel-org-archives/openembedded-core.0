Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30FACAC58D
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:42 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.89799.1756850190011907235
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SFHnMiwh;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Es3SVPdH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101990c6e819a-ef43b4f6-fd17-418f-92fb-3c0d1a9de431-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850192;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=34/gHcrrdcOyUL229FtM6u3pOb/teI43WIXtjNkarKE=;
	b=SFHnMiwhQ/JLz0llCHNN/Tcf1zhZsLEBM/c4UT/snwEyCT0ui+N3cbi21Ca81GNs
	pMa9xI0sp4FWtnv+yfpvb9fFegvgC4euAXlQkaz6QbzoGpibwA5mWV/o00UB6YZO8r+
	9q/kkKiYREM0pKC9s1FYZMpiYtS2LkeTsuQ4roBc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850192;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=34/gHcrrdcOyUL229FtM6u3pOb/teI43WIXtjNkarKE=;
	b=Es3SVPdH4NVrViYGfeHfEkVLHmtgytwuW3exBvoxFb8fEGeUco+PBp5YeNV8YX21
	JdqfC//mRUKneZP6B3mGqTd/ocbrqBVdbCQT+xSNBL+dB3bUp/D+C4Xo75INg8/GAz8
	CPo236Sgt3RhBAoSxS9khjTJEwNoWQcu8OghvfY4=
Content-Type: multipart/mixed; boundary="===============0612688088492577260=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-ruamel-yaml: upgrading to 0.18.15 SUCCEEDED
Message-ID: <010101990c6e819a-ef43b4f6-fd17-418f-92fb-3c0d1a9de431-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222786

--===============0612688088492577260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-ruamel-yaml* to *0.18.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-ruamel-yaml-upgrade-0.18.14-0.18.15.patch
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
From 4fb936c9c0247fca3a205c9a035aa7b0ebdd7a84 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 18:36:47 +0000
Subject: [PATCH] python3-ruamel-yaml: upgrade 0.18.14 -> 0.18.15

---
 ...n3-ruamel-yaml_0.18.14.bb => python3-ruamel-yaml_0.18.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.18.14.bb => python3-ruamel-yaml_0.18.15.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.14.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.15.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.18.14.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.18.15.bb
index e7ac24abb8..f14d043f56 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.14.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.15.bb
@@ -9,7 +9,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "7227b76aaec364df15936730efbf7d72b30c0b79b1d578bbb8e3dcb2d81f52b7"
+SRC_URI[sha256sum] = "dbfca74b018c4c3fba0b9cc9ee33e53c371194a9000e694995e620490fd40700"
 
 RDEPENDS:${PN} += "\
     python3-shell \
-- 
2.47.1


--===============0612688088492577260==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-ruamel-yaml-upgrade-0.18.14-0.18.15.patch"

RnJvbSA0ZmI5MzZjOWMwMjQ3ZmNhM2EyMDVjOWEwMzVhYTdiMGViZGQ3YTg0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxODozNjo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcnVhbWVsLXlhbWw6IHVwZ3JhZGUgMC4xOC4xNCAtPiAwLjE4LjE1CgotLS0KIC4uLm4z
LXJ1YW1lbC15YW1sXzAuMTguMTQuYmIgPT4gcHl0aG9uMy1ydWFtZWwteWFtbF8wLjE4LjE1LmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcnVhbWVsLXlhbWxf
MC4xOC4xNC5iYiA9PiBweXRob24zLXJ1YW1lbC15YW1sXzAuMTguMTUuYmJ9ICg4NSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1s
XzAuMTguMTQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVs
LXlhbWxfMC4xOC4xNS5iYgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlhbWxfMC4xOC4xNC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAu
MTguMTUuYmIKaW5kZXggZTdhYzI0YWJiOC4uZjE0ZDA0M2Y1NiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAuMTguMTQuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAuMTgu
MTUuYmIKQEAgLTksNyArOSw3IEBAIFVQU1RSRUFNX0NIRUNLX1BZUElfUEFDS0FHRSA9ICIke1BZ
UElfUEFDS0FHRX0iCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRh
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3MjI3Yjc2YWFlYzM2NGRmMTU5MzY3MzBlZmJmN2Q3
MmIzMGMwYjc5YjFkNTc4YmJiOGUzZGNiMmQ4MWY1MmI3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImRiZmNhNzRiMDE4YzRjM2ZiYTBiOWNjOWVlMzNlNTNjMzcxMTk0YTkwMDBlNjk0OTk1ZTYyMDQ5
MGZkNDA3MDAiCiAKIFJERVBFTkRTOiR7UE59ICs9ICJcCiAgICAgcHl0aG9uMy1zaGVsbCBcCi0t
IAoyLjQ3LjEKCg==

--===============0612688088492577260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-ruamel-yaml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.18.14.tar.gz;downloadfilename=ruamel.yaml-0.18.14.tar.gz" to "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.18.15.tar.gz;downloadfilename=ruamel.yaml-0.18.15.tar.gz"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml: PKGV changed from 0.18.14 [default] to 0.18.15 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml: PV changed from "0.18.14" to "0.18.15"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PKGV changed from 0.18.14 [default] to 0.18.15 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PV changed from "0.18.14" to "0.18.15"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PKGV changed from 0.18.14 [default] to 0.18.15 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PV changed from "0.18.14" to "0.18.15"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PKGV changed from 0.18.14 [default] to 0.18.15 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PV changed from "0.18.14" to "0.18.15"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PKGV changed from 0.18.14 [default] to 0.18.15 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PV changed from "0.18.14" to "0.18.15"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PKGV changed from 0.18.14 [default] to 0.18.15 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PV changed from "0.18.14" to "0.18.15"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PKGV changed from 0.18.14 [default] to 0.18.15 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PV changed from "0.18.14" to "0.18.15"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGV changed from 0.18.14 [default] to 0.18.15 [default]
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: FILELIST: directory renamed /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.14.dist-info -> /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.15.dist-info, directory renamed /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.14.dist-info/licenses -> /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.15.dist-info/licenses, added "/usr/lib/python3.13/site-packages/ruamel/yaml/mergevalue.py /usr/lib/python3.13/site-packages/ruamel/yaml/__pycache__/mergevalue.cpython-313.pyc"
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGSIZE changed from 1204080 to 1209426 (+0%)
packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PV changed from "0.18.14" to "0.18.15"
Changes to packages/x86-64-v3-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.14.dist-info moved to /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.15.dist-info
  /usr/lib/python3.13/site-packages/ruamel/yaml/mergevalue.py was added
  /usr/lib/python3.13/site-packages/ruamel/yaml/__pycache__/mergevalue.cpython-313.pyc was added

--===============0612688088492577260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: FILELIST: directory renamed /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.14.dist-info -> /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.15.dist-info, directory renamed /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.14.dist-info/licenses -> /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.15.dist-info/licenses, added "/usr/lib/python3.13/site-packages/ruamel/yaml/mergevalue.py /usr/lib/python3.13/site-packages/ruamel/yaml/__pycache__/mergevalue.cpython-313.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.14.dist-info moved to /usr/lib/python3.13/site-packages/ruamel_yaml-0.18.15.dist-info
  /usr/lib/python3.13/site-packages/ruamel/yaml/mergevalue.py was added
  /usr/lib/python3.13/site-packages/ruamel/yaml/__pycache__/mergevalue.cpython-313.pyc was added

--===============0612688088492577260==--

