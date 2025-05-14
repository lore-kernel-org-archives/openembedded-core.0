Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C38C54E90
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 18:53:43 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.109902.1747248814347842213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 11:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=bfR98tXW;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-2025051418533488a44be7b2f004a7f2-eoz_qm@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2025051418533488a44be7b2f004a7f2
        for <openembedded-core@lists.openembedded.org>;
        Wed, 14 May 2025 20:53:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=oXXuIQ2Agrdjwt+i5UFvBlAsnJZCKYqwJWiEN5Ov1Gw=;
 b=bfR98tXWjL6TczeBIQcTTa5Ivz5U+IL7l5idZDkVsKEsPk5QbyZFblPCh531/xWM3H7MeA
 M+CGizo52jBeqGl3ToaIOdxUvIybT5yrkWK1BVOlDtN6xIM8h50avDSXxyYO7N7DyRhQ0wXY
 Dv8SHxepQ6e3wUsudbJRv+m6A9npeedAw4sV5BDqxRMTbqsU0uBmVLGQlKPNL0yRdgFQYEM6
 fPwmyqcIy1UAC6cXt9alSARsN14IxGsMjJW9pEeIu6/STioeJsjAOY89L433WIIspyDQaTLo
 EkJOMvv+oE67MZWP1st630n5/TjBSrZ9LH992oeDzh8xGsvCsbf2w3pg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 22/22] release-notes: drop references to kernel-fitimage.bbclass
Date: Wed, 14 May 2025 20:51:06 +0200
Message-ID: <20250514185225.162998-23-adrian.freihofer@siemens.com>
In-Reply-To: <20250514185225.162998-1-adrian.freihofer@siemens.com>
References: <20250514185225.162998-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 18:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216539

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This commit drops references to the kernel-fitimage.bbclass to prevent
from build errors when the label is no longer available.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/migration-guides/release-notes-5.1.rst | 2 +-
 documentation/migration-guides/release-notes-5.2.rst | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
index 267934a71ed..bab0c145814 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -377,7 +377,7 @@ New Features / Enhancements in 5.1
       :term:`SIGGEN_EXCLUDERECIPES_ABISAFE` and does not trigger a rebuild on a
       change for dependent tasks.
 
-   -  In :ref:`ref-classes-kernel-fitimage`, the existence of
+   -  In ``kernel-fitimage``, the existence of
       :term:`EXTERNAL_KERNEL_DEVICETREE` is checked more thoroughly to avoid
       false positives.
 
diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index dd541a7e3a4..42c6d60f9b8 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -29,7 +29,7 @@ New Features / Enhancements in |yocto-ver|
       ``RuntimeWatchdogSec`` option in ``/etc/systemd/system.conf``.
 
    -  :term:`FIT_UBOOT_ENV` to allow including a u-boot script as a text in a
-      fit image. See the :ref:`ref-classes-kernel-fitimage` for more information.
+      fit image. See the ``kernel-fitimage`` for more information.
 
    -  :ref:`ref-classes-meson`: :term:`MESON_INSTALL_TAGS` to allow passing
       install tags (``--tags``) to the ``meson install`` command during the
@@ -684,7 +684,7 @@ New Features / Enhancements in |yocto-ver|
       command-line tool was added to the different Yocto Project and OpenEmbedded
       repositories.
 
-   -  :ref:`ref-classes-kernel-fitimage`: handle :doc:`multiconfig
+   -  ``kernel-fitimage``: handle :doc:`multiconfig
       </dev-manual/multiconfig>` dependency when
       :term:`INITRAMFS_MULTICONFIG` is set.
 
-- 
2.49.0


