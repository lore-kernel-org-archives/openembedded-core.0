Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1C1C433FE
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.700.1648751358534005533
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FC15139F
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:17 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 003D03F718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:16 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/23] buildtools-tarball: include nativesdk-python3-pyyaml
Date: Thu, 31 Mar 2022 19:28:53 +0100
Message-Id: <20220331182915.22128-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:29:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163842

BitBake can optionally 'import yaml' if BB_LOGCONFIG specifies a yaml
file.  This is a 3rd party module, so that this works out of the box
when buildtools is used -- either explicitly via buildtools-tarball or
implicitly via eSDK --  we can add pyyaml to the buildtools.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-=
core/meta/buildtools-tarball.bb
index fac91cfc3cf..f9f36e68c4b 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -7,13 +7,12 @@ TOOLCHAIN_TARGET_TASK ?=3D ""
=20
 TOOLCHAIN_HOST_TASK ?=3D "\
     nativesdk-sdk-provides-dummy \
-    nativesdk-python3-core \
-    nativesdk-python3-modules \
-    nativesdk-python3-misc \
+    nativesdk-python3 \
     nativesdk-python3-git \
     nativesdk-python3-jinja2 \
     nativesdk-python3-testtools \
     nativesdk-python3-subunit \
+    nativesdk-python3-pyyaml \
     nativesdk-ncurses-terminfo-base \
     nativesdk-chrpath \
     nativesdk-tar \
--=20
2.25.1


