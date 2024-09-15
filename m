Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB65BFA3758
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:21 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.115639.1726410840820609374
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=gpi7RO2t;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=o4CbaKkj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010191f61ad84b-aee257bc-9dad-4f48-b35f-c9d26089d3bd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DZT6fF2QpU9I8Zcs120dePvQRBbvD9AwmsFgfOqFeRY=;
	b=gpi7RO2tLvGjPP+/W7jzN0/TSoPUwPr5RobS6tYbkKbxTTQkwa7NuMj0w75CNAnQ
	+M5f+XIo0Y0A0bMB/M4BMp+UJDxUP2e8UZKmIQ48mv43/qIkipUbXiVx0bCii1NmP8s
	jSekP7YTCGOFduW45MHsb1W7jtY2sa9bTFJ9n6qM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DZT6fF2QpU9I8Zcs120dePvQRBbvD9AwmsFgfOqFeRY=;
	b=o4CbaKkjoDnGKUSTmdJIbbOalZuSmpI4n8Md0bz+ty55EpMX/SVGnwAcTntTZKXB
	mjR8IS6n2T6FAgYiKrZPhCJZIBmJOVLlXoO8LkZ8NlE8ThkgyzAF2I8IVjPcegPZxih
	pts+zohvylFEOZCWFRtt8DxkGfFbd3W90C5Fv6wk=
Content-Type: multipart/mixed; boundary="===============0389372055468319611=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2024.9 SUCCEEDED
Message-ID: <01010191f61ad84b-aee257bc-9dad-4f48-b35f-c9d26089d3bd-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204528

--===============0389372055468319611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-dtschema* to *2024.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2024.5-2024.9.patch
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
From 93527b2948496194fa2515e03c97d06fd1f5956c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 08:30:54 +0000
Subject: [PATCH] python3-dtschema: upgrade 2024.5 -> 2024.9

---
 .../{python3-dtschema_2024.5.bb => python3-dtschema_2024.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2024.5.bb => python3-dtschema_2024.9.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2024.5.bb b/meta/recipes-devtools/python/python3-dtschema_2024.9.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2024.5.bb
rename to meta/recipes-devtools/python/python3-dtschema_2024.9.bb
index 1eb24eca23..5a159297fb 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2024.5.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2024.9.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "ea259a9ba4d1e1eff44ac8d362950361e46750bdeaf30a437a7ed33159c35fd8"
+SRC_URI[sha256sum] = "1e5cc422736d5e4167f764478e50093f340bbede95b569ed66d60748dbc39ab2"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.44.0


--===============0389372055468319611==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2024.5-2024.9.patch"

RnJvbSA5MzUyN2IyOTQ4NDk2MTk0ZmEyNTE1ZTAzYzk3ZDA2ZmQxZjU5NTZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMDg6MzA6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWR0c2NoZW1hOiB1cGdyYWRlIDIwMjQuNSAtPiAyMDI0LjkKCi0tLQogLi4uL3tweXRo
b24zLWR0c2NoZW1hXzIwMjQuNS5iYiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjQuOS5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1kdHNjaGVtYV8yMDI0LjUu
YmIgPT4gcHl0aG9uMy1kdHNjaGVtYV8yMDI0LjkuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjQuNS5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDI0LjkuYmIKc2lt
aWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWR0c2NoZW1hXzIwMjQuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjQuOS5iYgppbmRleCAxZWIyNGVjYTIzLi41
YTE1OTI5N2ZiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtZHRzY2hlbWFfMjAyNC41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1kdHNjaGVtYV8yMDI0LjkuYmIKQEAgLTcsNyArNyw3IEBAIGluaGVyaXQgcHlwaSBw
eXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKIFBZUElfUEFDS0FHRSA9ICJkdHNjaGVtYSIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImVhMjU5YTliYTRkMWUxZWZmNDRhYzhkMzYyOTUwMzYx
ZTQ2NzUwYmRlYWYzMGE0MzdhN2VkMzMxNTljMzVmZDgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MWU1Y2M0MjI3MzZkNWU0MTY3Zjc2NDQ3OGU1MDA5M2YzNDBiYmVkZTk1YjU2OWVkNjZkNjA3NDhk
YmMzOWFiMiIKIAogREVQRU5EUyArPSAicHl0aG9uMy1zZXR1cHRvb2xzLXNjbS1uYXRpdmUiCiBS
REVQRU5EUzoke1BOfSArPSAiXAotLSAKMi40NC4wCgo=

--===============0389372055468319611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.12/site-packages/dtschema-2024.5.dist-info moved to /usr/lib/python3.12/site-packages/dtschema-2024.9.dist-info

--===============0389372055468319611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2024.5.tar.gz;downloadfilename=dtschema-2024.5.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2024.9.tar.gz;downloadfilename=dtschema-2024.9.tar.gz"
packages/core2-64-poky-linux/python3-dtschema: PV changed from "2024.5" to "2024.9"
packages/core2-64-poky-linux/python3-dtschema: PKGV changed from 2024.5 [default] to 2024.9 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2024.5" to "2024.9"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2024.5 [default] to 2024.9 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2024.5" to "2024.9"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2024.5 [default] to 2024.9 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2024.5" to "2024.9"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2024.5 [default] to 2024.9 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2024.5" to "2024.9"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2024.5 [default] to 2024.9 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2024.5" to "2024.9"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2024.5 [default] to 2024.9 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2024.5" to "2024.9"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2024.5 [default] to 2024.9 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2024.5" to "2024.9"
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2024.5 [default] to 2024.9 [default]
packages/core2-64-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 362022 to 359556 (-1%)
Changes to packages/core2-64-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.12/site-packages/dtschema-2024.5.dist-info moved to /usr/lib/python3.12/site-packages/dtschema-2024.9.dist-info

--===============0389372055468319611==--

