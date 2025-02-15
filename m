Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1FAC3DA4A
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.8062.1739623337170846981
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=aduiUIKp;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=HNPwIF+W;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019509a18916-21986d06-65f5-428e-97a7-cd46d93862cd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623336;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tjl2O/s0eveVkHquaTTvBAgD01oTkr8Exz6dA28IVmQ=;
	b=aduiUIKp245aWSiNBzKL44LduL30/uWtdk2psIAX/mGOTNvQKuCHBz3ECG7UPhmm
	kaW7TfKp1Q5Pkjl7fUYoPfZuZT4XxD4lnRWkf7ak3u7ADk0kgJDum73DlrikQkpY4NY
	lGXmgTxXX8dy8v2UmzUkInOvC8WSY+k2t+Wh7Dn8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623336;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tjl2O/s0eveVkHquaTTvBAgD01oTkr8Exz6dA28IVmQ=;
	b=HNPwIF+WwmCtplgXhwLKWBtSj++4uDDZXr/68i65FEFkFAD7Kdk7f13zxrKuqeB2
	C8PzciBovxYAdieBH4lpfL0wvjdm5wwe9SAPEXqoi5n5osby1ojBNuNEYs4dhrZL/qP
	mwN8XrnXn4M+S1IM18kQTUTSgn51MRcKVElkSuS8=
Content-Type: multipart/mixed; boundary="===============2779546247848485458=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2025.2 SUCCEEDED
Message-ID: <0101019509a18916-21986d06-65f5-428e-97a7-cd46d93862cd-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211425

--===============2779546247848485458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-dtschema* to *2025.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2024.11-2025.2.patch
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
From 8c3e8a916dca2ab1be2c6572fde7e51be2e1a72c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 07:42:53 +0000
Subject: [PATCH] python3-dtschema: upgrade 2024.11 -> 2025.2

---
 .../{python3-dtschema_2024.11.bb => python3-dtschema_2025.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2024.11.bb => python3-dtschema_2025.2.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2024.11.bb b/meta/recipes-devtools/python/python3-dtschema_2025.2.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2024.11.bb
rename to meta/recipes-devtools/python/python3-dtschema_2025.2.bb
index 8d052d6910..2071763741 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2024.11.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2025.2.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "bb7dd36ff9406ec89607b893cfc5e1ffa7ead76fd5c48df77eafc9b4d4196047"
+SRC_URI[sha256sum] = "9adeaff2079a8b5fbc4bd1c8f02cbd232016a84a9684739cac20b4df3b19509e"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.44.1


--===============2779546247848485458==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2024.11-2025.2.patch"

RnJvbSA4YzNlOGE5MTZkY2EyYWIxYmUyYzY1NzJmZGU3ZTUxYmUyZTFhNzJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDc6NDI6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWR0c2NoZW1hOiB1cGdyYWRlIDIwMjQuMTEgLT4gMjAyNS4yCgotLS0KIC4uLi97cHl0
aG9uMy1kdHNjaGVtYV8yMDI0LjExLmJiID0+IHB5dGhvbjMtZHRzY2hlbWFfMjAyNS4yLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtZHRzY2hlbWFfMjAyNC4x
MS5iYiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjUuMi5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyNC4xMS5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDI1LjIuYmIK
c2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjQuMTEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDI1LjIuYmIKaW5kZXggOGQwNTJkNjkx
MC4uMjA3MTc2Mzc0MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWR0c2NoZW1hXzIwMjQuMTEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjUuMi5iYgpAQCAtNyw3ICs3LDcgQEAgaW5oZXJpdCBw
eXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAogUFlQSV9QQUNLQUdFID0gImR0c2No
ZW1hIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmI3ZGQzNmZmOTQwNmVjODk2MDdiODkzY2Zj
NWUxZmZhN2VhZDc2ZmQ1YzQ4ZGY3N2VhZmM5YjRkNDE5NjA0NyIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI5YWRlYWZmMjA3OWE4YjVmYmM0YmQxYzhmMDJjYmQyMzIwMTZhODRhOTY4NDczOWNhYzIw
YjRkZjNiMTk1MDllIgogCiBERVBFTkRTICs9ICJweXRob24zLXNldHVwdG9vbHMtc2NtLW5hdGl2
ZSIKIFJERVBFTkRTOiR7UE59ICs9ICJcCi0tIAoyLjQ0LjEKCg==

--===============2779546247848485458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-dtschema: PKGV changed from 2024.11 [default] to 2025.2 [default]
packages/core2-64-poky-linux/python3-dtschema: PV changed from "2024.11" to "2025.2"
packages/core2-64-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2024.11.tar.gz;downloadfilename=dtschema-2024.11.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2025.2.tar.gz;downloadfilename=dtschema-2025.2.tar.gz"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2024.11 [default] to 2025.2 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2024.11" to "2025.2"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2024.11 [default] to 2025.2 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2024.11" to "2025.2"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2024.11 [default] to 2025.2 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2024.11" to "2025.2"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2024.11 [default] to 2025.2 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2024.11" to "2025.2"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2024.11 [default] to 2025.2 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2024.11" to "2025.2"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2024.11 [default] to 2025.2 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2024.11" to "2025.2"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info -> /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info, added "/usr/lib/python3.13/site-packages/dtschema/schemas/trigger/trigger-source.yaml /usr/lib/python3.13/site-packages/dtschema/schemas/access-controller/access-controller-consumer.yaml"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2024.11 [default] to 2025.2 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 368911 to 378330 (+3%)
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2024.11" to "2025.2"
Changes to packages/core2-64-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info was added
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/dtschema/schemas/access-controller was added
  /usr/lib/python3.13/site-packages/dtschema/schemas/access-controller/access-controller-consumer.yaml was added
  /usr/lib/python3.13/site-packages/dtschema/schemas/trigger was added
  /usr/lib/python3.13/site-packages/dtschema/schemas/trigger/trigger-source.yaml was added
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info was removed
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info/WHEEL was removed

--===============2779546247848485458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info -> /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info, added "/usr/lib/python3.13/site-packages/dtschema/schemas/access-controller/access-controller-consumer.yaml /usr/lib/python3.13/site-packages/dtschema/schemas/trigger/trigger-source.yaml"
Changes to packages/core2-64-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info was added
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/dtschema-2025.2.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/dtschema/schemas/access-controller was added
  /usr/lib/python3.13/site-packages/dtschema/schemas/access-controller/access-controller-consumer.yaml was added
  /usr/lib/python3.13/site-packages/dtschema/schemas/trigger was added
  /usr/lib/python3.13/site-packages/dtschema/schemas/trigger/trigger-source.yaml was added
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info was removed
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/dtschema-2024.11.dist-info/WHEEL was removed

--===============2779546247848485458==--

