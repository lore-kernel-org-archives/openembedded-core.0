Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69ADC3064D
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:23 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.1284.1715794338536972189
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Odcd5LWv;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=avYYxQHQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018f7d4fe053-a21e7ab5-82e7-41fd-85be-6bdb337dabe9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rDo5hGoqfOvPgWRhCtqLCYzv926gomeG2K9XTO+uakY=;
	b=Odcd5LWvDEw+/BqZMG3aXscNsCENwWCNibHThcIRrgqyoDaKQfP2HeZKKAzMH4mn
	3ZchzB8AkmC7dTXSj9jTRfms9XqTlJ5gM00H2dcFGEFREZsMt/rOZD0irc6jOXrg5IJ
	EluYFIMQCk/RCfqqzvW93KqGz9CLHFidIIB0YxVw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rDo5hGoqfOvPgWRhCtqLCYzv926gomeG2K9XTO+uakY=;
	b=avYYxQHQc7L3sDDhzUpuZgKfZTQpnoyP0xqry9NyEAiKiIlv+WxUlvkwbPljzYZ/
	7EfjnP/AdeEzClrVZx4RJ9VF0Hz2rZQTV4kt5DAc5UFcPC4ZFPmonzwnlFjN7QbNCKo
	KZVBJOAN+pNiUJDR2EobTg8XfW/iXGsWjWR7O2J4=
Content-Type: multipart/mixed; boundary="===============0368383889724563871=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-mako: upgrading to 1.3.5 SUCCEEDED
Message-ID: <0101018f7d4fe053-a21e7ab5-82e7-41fd-85be-6bdb337dabe9-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199343

--===============0368383889724563871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-mako* to *1.3.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-mako-upgrade-1.3.3-1.3.5.patch
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
From 0adcea4126583f76b1b0db98f15d03a924c6878b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 09:55:06 +0000
Subject: [PATCH] python3-mako: upgrade 1.3.3 -> 1.3.5

---
 .../python/{python3-mako_1.3.3.bb => python3-mako_1.3.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.3.3.bb => python3-mako_1.3.5.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.3.bb b/meta/recipes-devtools/python/python3-mako_1.3.5.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-mako_1.3.3.bb
rename to meta/recipes-devtools/python/python3-mako_1.3.5.bb
index 7545cbef99..d27fb121a6 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.3.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.5.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "e16c01d9ab9c11f7290eef1cfefc093fb5a45ee4a3da09e2fec2e4d1bae54e73"
+SRC_URI[sha256sum] = "48dbc20568c1d276a2698b36d968fa76161bf127194907ea6fc594fa81f943bc"
 
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \
-- 
2.44.0


--===============0368383889724563871==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-mako-upgrade-1.3.3-1.3.5.patch"

RnJvbSAwYWRjZWE0MTI2NTgzZjc2YjFiMGRiOThmMTVkMDNhOTI0YzY4NzhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMDk6NTU6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1ha286IHVwZ3JhZGUgMS4zLjMgLT4gMS4zLjUKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1tYWtvXzEuMy4zLmJiID0+IHB5dGhvbjMtbWFrb18xLjMuNS5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tYWtvXzEuMy4zLmJiID0+IHB5dGhv
bjMtbWFrb18xLjMuNS5iYn0gKDg0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjMuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1tYWtvXzEuMy41LmJiCnNpbWlsYXJpdHkgaW5kZXggODQlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMy4zLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjMuNS5i
YgppbmRleCA3NTQ1Y2JlZjk5Li5kMjdmYjEyMWE2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjMuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjMuNS5iYgpAQCAtOCw3ICs4LDcgQEAgUFlQ
SV9QQUNLQUdFID0gIk1ha28iCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWls
ZF9tZXRhCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlMTZjMDFkOWFiOWMxMWY3MjkwZWVmMWNm
ZWZjMDkzZmI1YTQ1ZWU0YTNkYTA5ZTJmZWMyZTRkMWJhZTU0ZTczIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjQ4ZGJjMjA1NjhjMWQyNzZhMjY5OGIzNmQ5NjhmYTc2MTYxYmYxMjcxOTQ5MDdlYTZm
YzU5NGZhODFmOTQzYmMiCiAKIFJERVBFTkRTOiR7UE59ID0gInB5dGhvbjMtaHRtbCBcCiAgICAg
ICAgICAgICAgICAgICBweXRob24zLW1hcmt1cHNhZmUgXAotLSAKMi40NC4wCgo=

--===============0368383889724563871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-mako: PKGV changed from 1.3.3 [default] to 1.3.5 [default]
packages/core2-64-poky-linux/python3-mako: PV changed from "1.3.3" to "1.3.5"
packages/core2-64-poky-linux/python3-mako: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.3.3.tar.gz;downloadfilename=Mako-1.3.3.tar.gz" to "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.3.5.tar.gz;downloadfilename=Mako-1.3.5.tar.gz"
packages/core2-64-poky-linux/python3-mako/python3-mako-dbg: PKGV changed from 1.3.3 [default] to 1.3.5 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-dbg: PV changed from "1.3.3" to "1.3.5"
packages/core2-64-poky-linux/python3-mako/python3-mako-dev: PKGV changed from 1.3.3 [default] to 1.3.5 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-dev: PV changed from "1.3.3" to "1.3.5"
packages/core2-64-poky-linux/python3-mako/python3-mako-doc: PKGV changed from 1.3.3 [default] to 1.3.5 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-doc: PV changed from "1.3.3" to "1.3.5"
packages/core2-64-poky-linux/python3-mako/python3-mako-locale: PKGV changed from 1.3.3 [default] to 1.3.5 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-locale: PV changed from "1.3.3" to "1.3.5"
packages/core2-64-poky-linux/python3-mako/python3-mako-src: PKGV changed from 1.3.3 [default] to 1.3.5 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-src: PV changed from "1.3.3" to "1.3.5"
packages/core2-64-poky-linux/python3-mako/python3-mako-staticdev: PKGV changed from 1.3.3 [default] to 1.3.5 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-staticdev: PV changed from "1.3.3" to "1.3.5"
packages/core2-64-poky-linux/python3-mako/python3-mako: PKGV changed from 1.3.3 [default] to 1.3.5 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako: PV changed from "1.3.3" to "1.3.5"
packages/core2-64-poky-linux/python3-mako/python3-mako: PKGSIZE changed from 638645 to 638113 (-0%)
Changes to packages/core2-64-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.12/site-packages/Mako-1.3.3.dist-info moved to /usr/lib/python3.12/site-packages/Mako-1.3.5.dist-info

--===============0368383889724563871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.12/site-packages/Mako-1.3.3.dist-info moved to /usr/lib/python3.12/site-packages/Mako-1.3.5.dist-info

--===============0368383889724563871==--

