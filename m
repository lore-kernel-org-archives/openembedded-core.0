Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0740C5DF94
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 06:56:15 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16062.1787640968943243342
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 23:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=G4UW5XHd;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5219F1A1810
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 06:56:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 276EB604C4
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 06:56:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BE5C11C79F33;
	Tue, 25 Aug 2026 08:56:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787640962; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wmaj0N1HCAe3n2AowDMzf5DZdwaRUGwey3emId8R8+I=;
	b=G4UW5XHdJpCLIyWtuqs6XRVweyP8+qDm9f8B8O9zbxO563YHVDkv3jsFFZa4U696AwEpz9
	+BSvzf67h5oF8CF+3IKto5fsOO+l1OC8U6TvCaf89BQyoZzoHq0rGG6Nodi8Xo6EZzXExz
	ERny1xn06eiY0kOFosuPoV0VefuSjOOEF8M1oUZWpzDLpqzQ2yj2zIOALvTBo/xbKHCIzq
	EA010ODq/U3FlC6EaOI5/Y7xbLXHdhUr3e5N9AAIZ4hX615Oid9hk3potF5g+zBBTo+RbU
	AReYbomGw9yLl7VdkDeaWlGln4149okp2HEZE8a5+r0/Al/YzfMKVK94992VLw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 25 Aug 2026 08:55:49 +0200
Subject: [PATCH v2 1/3] meta/conf/fragments: harmonize fragment summaries
 and descriptions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-sbom-cve-check-fragment-desc-v2-1-01c3823eb780@bootlin.com>
References: <20260825-sbom-cve-check-fragment-desc-v2-0-01c3823eb780@bootlin.com>
In-Reply-To: <20260825-sbom-cve-check-fragment-desc-v2-0-01c3823eb780@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3348;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=hAy0fU3zmPSJI+0D2wQR7WECmXxuNwn7ajPMZdoOTqw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqjTx8s+VB3W0U+HFo6Hbjvce6EsZqYrtF5Dasi
 umJufQ/+vaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCao08fAAKCRDRgEFAKaOo
 Nu7YD/0S/FZZPQ9YLpNkScOXqUp6v9DyUzmCEjYTCgX/qbCo+7CglT6smoGDJLW2ZzbI+EWURxc
 0QbrGFFLjAgFlODWAczp1PvL93ozB1tQwUnOTTVsACmZ5pTSwIBEBKJcKB4o0YiHYLEhmK6IsWL
 Sko6sIix65qNXEF/lccqxfILHWWclpFjFpQWngnGptdWfFuC6MEBTzZjAWn4R6bkXnLruq4VQcG
 5TPxchkIFAB7gRzlQTKSTBtvgMuujfOm2w1eKitrgwQsnm+stDtC5xu2tnmrbsI/RybvtgbBBNb
 CRUiYMIcalSZBTp+U7B9RyQB5HWTYnc2MwJtGjzOIFfMvWvHsaljyulNKW5vdOyuEfzNv7+FxYT
 Nq3chqXiYNiIxEdmoxvEFKU9jzGmUs3RNDgMgnnollv84kAwDS7R8e3oBd2AGud2hnZVWyNhZXe
 +E88j2r7YijCeOv7olAkyvXQl0Bz+cBA+YjdkwlCgt0G0gf/6xXwNwxH04BuqIMI2LWL0lr2CNZ
 x3ZLjPK+FtPj0tTn4JSSSz4Nxcq4sYBcSnS+QYzOEyzZFMuz/GS8EdJQ9FLSFc55quO8NEZauS0
 0IRnxHqVTefhxV2j+u/SdGRICpz4oDTLm40v8FLJ3A6TrP7zunRaP/B7OIBahZUjUn48pfvM6m1
 qRYvwmq3hZpRAlg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 06:56:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244206

Use the present tense for fragment summaries, so that the
'bitbake-config-build list-fragments' has a coherent output.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../yocto-autobuilder/autobuilder-resource-constraints.conf  |  4 ++--
 meta/conf/fragments/yocto-autobuilder/autobuilder.conf       |  4 ++--
 meta/conf/fragments/yocto/sbom-cve-check.conf                | 12 ++++++------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/conf/fragments/yocto-autobuilder/autobuilder-resource-constraints.conf b/meta/conf/fragments/yocto-autobuilder/autobuilder-resource-constraints.conf
index 58cadd92b6..c3fc9990eb 100644
--- a/meta/conf/fragments/yocto-autobuilder/autobuilder-resource-constraints.conf
+++ b/meta/conf/fragments/yocto-autobuilder/autobuilder-resource-constraints.conf
@@ -1,5 +1,5 @@
-BB_CONF_FRAGMENT_SUMMARY = "Resource constraint variables used on the Yocto Projects autobuilder"
-BB_CONF_FRAGMENT_DESCRIPTION = "Resource constraint variables used on the Yocto Projects autobuilder"
+BB_CONF_FRAGMENT_SUMMARY = "Set resource constraint variables for Yocto Project Autobuilder builds"
+BB_CONF_FRAGMENT_DESCRIPTION = "Resource constraint variables for Yocto Project Autobuilder builds"
 
 BB_NUMBER_THREADS = '16'
 BB_NUMBER_PARSE_THREADS = '16'
diff --git a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
index 81adebe5ae..1f16c87d98 100644
--- a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
+++ b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
@@ -1,5 +1,5 @@
-BB_CONF_FRAGMENT_SUMMARY = "Default variables used on the Yocto Projects autobuilder builds"
-BB_CONF_FRAGMENT_DESCRIPTION = "Default variables used on the Yocto Projects autobuilder builds"
+BB_CONF_FRAGMENT_SUMMARY = "Set default variables for Yocto Project Autobuilder builds"
+BB_CONF_FRAGMENT_DESCRIPTION = "Default variables for Yocto Project Autobuilder builds"
 
 QEMU_USE_KVM ?= 'True'
 INHERIT += 'report-error'
diff --git a/meta/conf/fragments/yocto/sbom-cve-check.conf b/meta/conf/fragments/yocto/sbom-cve-check.conf
index 46f6965a0d..df43999572 100644
--- a/meta/conf/fragments/yocto/sbom-cve-check.conf
+++ b/meta/conf/fragments/yocto/sbom-cve-check.conf
@@ -1,9 +1,9 @@
-BB_CONF_FRAGMENT_SUMMARY = "This fragment enables sbom-cve-check with recommended default options"
-BB_CONF_FRAGMENT_DESCRIPTION = "Enables sbom-cve-check and applies the following configurations: \
- - Adds the sbom-cve-check class to IMAGE_CLASSES. \
- - Configures CVE database recipes to fetch the latest git revision using AUTOREV. \
- - Ensures generated SBOM includes all CVE annotations. \
- - Configures the Linux kernel recipe to provide compiled sources, \
+BB_CONF_FRAGMENT_SUMMARY = "Enable sbom-cve-check with recommended default options"
+BB_CONF_FRAGMENT_DESCRIPTION = "Enable sbom-cve-check and apply the following configurations: \
+ - Add the sbom-cve-check class to IMAGE_CLASSES. \
+ - Configure CVE database recipes to fetch the latest git revision using AUTOREV. \
+ - Ensure generated SBOM includes all CVE annotations. \
+ - Configure the Linux kernel recipe to provide compiled sources, \
    allowing CVEs to be excluded if the source is not compiled. \
 "
 

-- 
2.55.0


