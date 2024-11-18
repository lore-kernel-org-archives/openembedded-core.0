Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0156D6007E
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:21 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.4679.1731964633083259581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=f9+5VVee;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=XwfgIAtX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101934122fd95-3c35cef5-0dd9-4cea-9140-896ed2b02840-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Tgu/20cTCCCf9qFqjDL8zdCiKx63niBweAMasdyZ75A=;
	b=f9+5VVeeRHbtwLA062tkRx7sOmS3yA6r7K3HfWJZC4pZ4r6931qNBkY8NvfDNBP2
	OqbeZTA8t3j7Hvja95AzkSG86iP4D+QiYpDZe3ejxYacClrR/QZrdkY6kqwEKiauoOw
	bJvM06pIpmgiXxJiAQP2I63fy5sOxcaJBfJ2vMIg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Tgu/20cTCCCf9qFqjDL8zdCiKx63niBweAMasdyZ75A=;
	b=XwfgIAtX7CuB5stQrvxfSNs746WdEFQ+oTJIash+wBTKgv5t6eslkIEbgkg3ZNfo
	sUbUyRkHz0n5k1gfS6WZ43vu7OC9T/SD0AvSTkJJQC0WbJ3wEgaAxD6F7EQADFNT/fc
	SyCsb4+w7DZ5hEccibVehoBCuueK/9azJ+BXRLeo=
Content-Type: multipart/mixed; boundary="===============7437987736411672940=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-meson-python: upgrading to 0.17.1 SUCCEEDED
Message-ID: <010101934122fd95-3c35cef5-0dd9-4cea-9140-896ed2b02840-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207285

--===============7437987736411672940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-meson-python* to *0.17.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-meson-python-upgrade-0.16.0-0.17.1.patch
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
From 0026a1f8ed61a6a2979f4a093b9f10276b8fc0d7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 23:25:28 +0000
Subject: [PATCH] python3-meson-python: upgrade 0.16.0 -> 0.17.1

---
 ...n3-meson-python_0.16.0.bb => python3-meson-python_0.17.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-meson-python_0.16.0.bb => python3-meson-python_0.17.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-meson-python_0.16.0.bb b/meta/recipes-devtools/python/python3-meson-python_0.17.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-meson-python_0.16.0.bb
rename to meta/recipes-devtools/python/python3-meson-python_0.17.1.bb
index 79a7ff05ef..04f0a1eff8 100644
--- a/meta/recipes-devtools/python/python3-meson-python_0.16.0.bb
+++ b/meta/recipes-devtools/python/python3-meson-python_0.17.1.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
 PYPI_PACKAGE = "meson_python"
 
 inherit pypi python_mesonpy
-SRC_URI[sha256sum] = "9068c17e36c89d6c7ff709fffb2a8a9925e8cd0b02629728e5ceaf2ec505cb5f"
+SRC_URI[sha256sum] = "efb91f69f2e19eef7bc9a471ed2a4e730088cc6b39eacaf3e49fc4f930eb5f83"
 
 DEPENDS:remove:class-native = "python3-meson-python-native"
 
-- 
2.44.1


--===============7437987736411672940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-meson-python (sysroot):
  /usr/lib/python3.13/site-packages/meson_python-0.16.0.dist-info moved to /usr/lib/python3.13/site-packages/meson_python-0.17.1.dist-info
Changes to packages/x86_64-linux/python3-meson-python-native (sysroot):
  /usr/lib/python3.13/site-packages/meson_python-0.16.0.dist-info moved to /usr/lib/python3.13/site-packages/meson_python-0.17.1.dist-info

--===============7437987736411672940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-meson-python: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/meson_python/meson_python-0.16.0.tar.gz;downloadfilename=meson_python-0.16.0.tar.gz" to "https://files.pythonhosted.org/packages/source/m/meson_python/meson_python-0.17.1.tar.gz;downloadfilename=meson_python-0.17.1.tar.gz"
packages/core2-64-poky-linux/python3-meson-python: PKGV changed from 0.16.0 [default] to 0.17.1 [default]
packages/core2-64-poky-linux/python3-meson-python: PV changed from "0.16.0" to "0.17.1"
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-dbg: PKGV changed from 0.16.0 [default] to 0.17.1 [default]
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-dbg: PV changed from "0.16.0" to "0.17.1"
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-dev: PKGV changed from 0.16.0 [default] to 0.17.1 [default]
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-dev: PV changed from "0.16.0" to "0.17.1"
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-doc: PKGV changed from 0.16.0 [default] to 0.17.1 [default]
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-doc: PV changed from "0.16.0" to "0.17.1"
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-locale: PKGV changed from 0.16.0 [default] to 0.17.1 [default]
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-locale: PV changed from "0.16.0" to "0.17.1"
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-src: PKGV changed from 0.16.0 [default] to 0.17.1 [default]
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-src: PV changed from "0.16.0" to "0.17.1"
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-staticdev: PKGV changed from 0.16.0 [default] to 0.17.1 [default]
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python-staticdev: PV changed from "0.16.0" to "0.17.1"
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python: PKGV changed from 0.16.0 [default] to 0.17.1 [default]
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python: PKGSIZE changed from 186220 to 188864 (+1%)
packages/core2-64-poky-linux/python3-meson-python/python3-meson-python: PV changed from "0.16.0" to "0.17.1"
Changes to packages/core2-64-poky-linux/python3-meson-python (sysroot):
  /usr/lib/python3.13/site-packages/meson_python-0.16.0.dist-info moved to /usr/lib/python3.13/site-packages/meson_python-0.17.1.dist-info
Changes to packages/x86_64-linux/python3-meson-python-native (sysroot):
  /usr/lib/python3.13/site-packages/meson_python-0.16.0.dist-info moved to /usr/lib/python3.13/site-packages/meson_python-0.17.1.dist-info

--===============7437987736411672940==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-meson-python-upgrade-0.16.0-0.17.1.patch"

RnJvbSAwMDI2YTFmOGVkNjFhNmEyOTc5ZjRhMDkzYjlmMTAyNzZiOGZjMGQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMjM6MjU6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1lc29uLXB5dGhvbjogdXBncmFkZSAwLjE2LjAgLT4gMC4xNy4xCgotLS0KIC4uLm4z
LW1lc29uLXB5dGhvbl8wLjE2LjAuYmIgPT4gcHl0aG9uMy1tZXNvbi1weXRob25fMC4xNy4xLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbWVzb24tcHl0aG9u
XzAuMTYuMC5iYiA9PiBweXRob24zLW1lc29uLXB5dGhvbl8wLjE3LjEuYmJ9ICg4NSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1lc29uLXB5dGhv
bl8wLjE2LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWVzb24t
cHl0aG9uXzAuMTcuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWVzb24tcHl0aG9uXzAuMTYuMC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1lc29uLXB5dGhvbl8w
LjE3LjEuYmIKaW5kZXggNzlhN2ZmMDVlZi4uMDRmMGExZWZmOCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1lc29uLXB5dGhvbl8wLjE2LjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1lc29uLXB5dGhvbl8wLjE3
LjEuYmIKQEAgLTEzLDcgKzEzLDcgQEAgREVQRU5EUyA9ICIgXAogUFlQSV9QQUNLQUdFID0gIm1l
c29uX3B5dGhvbiIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9tZXNvbnB5Ci1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiOTA2OGMxN2UzNmM4OWQ2YzdmZjcwOWZmZmIyYThhOTkyNWU4Y2QwYjAyNjI5NzI4
ZTVjZWFmMmVjNTA1Y2I1ZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlZmI5MWY2OWYyZTE5ZWVm
N2JjOWE0NzFlZDJhNGU3MzAwODhjYzZiMzllYWNhZjNlNDlmYzRmOTMwZWI1ZjgzIgogCiBERVBF
TkRTOnJlbW92ZTpjbGFzcy1uYXRpdmUgPSAicHl0aG9uMy1tZXNvbi1weXRob24tbmF0aXZlIgog
Ci0tIAoyLjQ0LjEKCg==

--===============7437987736411672940==--

