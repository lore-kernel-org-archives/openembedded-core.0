Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7214CCA493
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:48 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web08.657.1654100323818224796
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SkNio9f+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010181200fea5b-93bbd6c7-5fa4-4e94-9d08-eb0593c03094-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PCBOTBvhqKEHF+dOKOffV1RQ0ifJVnd9K+IykskL2nw=;
	b=SkNio9f+ktp+719Q3G/IHKpBcCPYPz0j/kOf5UW1sRL6memjL26OK6EuOS/lfLGR
	pLv9Fe+PkgRhJJY5MjgcuD6guLq2QoIthmA/WKs4ggB5MPstdFgbn3DRUxbmmq6UdUN
	27EfK5P0W/lyxbdy6IEu62RTzggvqBNgvZyqtQQU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PCBOTBvhqKEHF+dOKOffV1RQ0ifJVnd9K+IykskL2nw=;
	b=ibC8sY5Pnw6NGJPX0AAtODdSI9KA0XzI65MEQw3vdWHE8WuBGtU5pnoQ35U9jdHK
	vmVSUuZy4P3QBCfJXzWuAc7/fQ/onmhJC7J2n+sAH0/9bBXgzpJaCk3x/rs2R58Mv3H
	7D0TszZVUS6abKXb6nOIa/lFvsf/Qket0GkolPtQ=
Content-Type: multipart/mixed; boundary="===============0331945991141504403=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2022.5 SUCCEEDED
Message-ID: 
 <01010181200fea5b-93bbd6c7-5fa4-4e94-9d08-eb0593c03094-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:42 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166403

--===============0331945991141504403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2022.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2022.4-2022.5.patch
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
--===============0331945991141504403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.4.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.5.tar.gz"
packages/core2-32-poky-linux/python3-dtschema: PV changed from "2022.4" to "2022.5"
packages/core2-32-poky-linux/python3-dtschema: PKGV changed from 2022.4 [default] to 2022.5 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2022.4" to "2022.5"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2022.4 [default] to 2022.5 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2022.4" to "2022.5"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2022.4 [default] to 2022.5 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2022.4" to "2022.5"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2022.4 [default] to 2022.5 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2022.4" to "2022.5"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2022.4 [default] to 2022.5 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2022.4" to "2022.5"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2022.4 [default] to 2022.5 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2022.4" to "2022.5"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2022.4 [default] to 2022.5 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 214407 to 218918 (+2%)
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2022.4" to "2022.5"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2022.4 [default] to 2022.5 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.10/site-packages/dtschema-2022.4.dist-info -> /usr/lib/python3.10/site-packages/dtschema-2022.5.dist-info, added "/usr/lib/python3.10/site-packages/dtschema/schemas/isa/isa-bus.yaml /usr/lib/python3.10/site-packages/dtschema/schemas/isa/isa-bridge.yaml"
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.10/site-packages/dtschema-2022.4.dist-info moved to /usr/lib/python3.10/site-packages/dtschema-2022.5.dist-info
  /usr/lib/python3.10/site-packages/dtschema/schemas/isa was added
  /usr/lib/python3.10/site-packages/dtschema/schemas/isa/isa-bridge.yaml was added
  /usr/lib/python3.10/site-packages/dtschema/schemas/isa/isa-bus.yaml was added

--===============0331945991141504403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.10/site-packages/dtschema-2022.4.dist-info -> /usr/lib/python3.10/site-packages/dtschema-2022.5.dist-info, added "/usr/lib/python3.10/site-packages/dtschema/schemas/isa/isa-bridge.yaml /usr/lib/python3.10/site-packages/dtschema/schemas/isa/isa-bus.yaml"
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.10/site-packages/dtschema-2022.4.dist-info moved to /usr/lib/python3.10/site-packages/dtschema-2022.5.dist-info
  /usr/lib/python3.10/site-packages/dtschema/schemas/isa was added
  /usr/lib/python3.10/site-packages/dtschema/schemas/isa/isa-bridge.yaml was added
  /usr/lib/python3.10/site-packages/dtschema/schemas/isa/isa-bus.yaml was added

--===============0331945991141504403==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2022.4-2022.5.patch"

From d7bbb488a865cfaa1e30141ae5ee25c989f37a8d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jun 2022 07:58:01 +0000
Subject: [PATCH] python3-dtschema: upgrade 2022.4 -> 2022.5

---
 .../{python3-dtschema_2022.4.bb => python3-dtschema_2022.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2022.4.bb => python3-dtschema_2022.5.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2022.4.bb b/meta/recipes-devtools/python/python3-dtschema_2022.5.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dtschema_2022.4.bb
rename to meta/recipes-devtools/python/python3-dtschema_2022.5.bb
index 7bc89c844c..0520dd76aa 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2022.4.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2022.5.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "c70a644e0100b5bacd44839a2316291d8eee91f6535a8419459de59fd0fcf6ce"
+SRC_URI[sha256sum] = "147ff18bf446131d3ba14bc751febd84f4fdedf06130f53e193d3370052dfe3f"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
-- 
2.31.1


--===============0331945991141504403==--

