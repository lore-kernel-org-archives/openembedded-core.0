Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A62C5DF94
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 12:27:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6278.1787315224248513344
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 05:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2CZAwF+h;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 901864E41319
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 12:27:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66062604AA
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 12:27:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF4C611C77084;
	Fri, 21 Aug 2026 14:26:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787315218; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zkCoM41bxRUCWMewOJG2fljx166xJrpasvP8dgd6+3c=;
	b=2CZAwF+hRZqiNEEFc4jEpXSAnMY3DcWaZGt5W0BRP8oeOwFRWyqFwT9iJlZ4Kg/6GskJ3m
	L10OXaFWDAob3lV05YM+E5G++mfS4nWeSyqEZBg6H+8kCWV+VVNcOuWz3x+MQ8diXVepow
	yQ3JKEfkDmhegiHJckRkU7uyzFOskX679QOMXoFRTDPFHJ28gOjul6is8vLHqvNRZxSUgC
	gUTTIONB0UZ6VaxceyQQevdXAE2kXsataW/wvQC24CA9cCY0N0VPZR6Q74kEk74RLM1NEs
	KGfkV3ST9/Dgxf32aLDz+eKSvxqAantTW5XG/naLVfArniJjcVBR8z96qvVofA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 21 Aug 2026 14:26:31 +0200
Subject: [PATCH 1/3] meta/conf/fragments: harmonize fragment summaries and
 descriptions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-sbom-cve-check-fragment-desc-v1-1-e06feb747b07@bootlin.com>
References: <20260821-sbom-cve-check-fragment-desc-v1-0-e06feb747b07@bootlin.com>
In-Reply-To: <20260821-sbom-cve-check-fragment-desc-v1-0-e06feb747b07@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2788;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=uQTnPJwpz+MWA5RyyMyQPIvf0n8S7cc2Ztq3VyiNK3U=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqiEQKT2hgW82BIyUjVk5R6qJmdDn00euBfDukq
 s/fF0WJdjOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaohECgAKCRDRgEFAKaOo
 NkoSEACEW+XhksXJh0xKVOkFnoQ4J5UaA7NyCLNaEdCoH+RqXaOZ6dKpcDMXyx+r+qtwcmID6vA
 r4hRiNKWyAYsDhLMMme2R5OHIjAdbN3JQWxDcjmdp63h51mRMKtTzHxP8YIph2eO6gXo39iYILG
 zlD+9NWQNDjrJN8l0ZxIPyBeIXKch5t3LvelpZz6f+1wdiRn7vg3sOa1Ibl8fXRUGZcZQzsspH7
 h+7ThHvyyygyYfikhucfPshCs9hAncNP2X1CYT5LzUfOjCZFuxCsqqW2vxlgRS3Qxj+gmAypTAb
 qQK+pinsEZtVhFh911RWCpuw0rE9nNuhPialDDPR41VudMTOtiH6OaaVLRUEoj8HqN00+rudihm
 Nqn5Tlm8hH/lG4Y4RR87+A7lLmh8e+Y2aqF+pA/L9IjbYOo/HsNB1Sd59bxkz/2V4lcbWbV0KrF
 WgEjqhctrKcyKvKzoABnhcuIKGzWSBBvc5RotCHTFrM8QPiDycqL8iP9yGB96v2dY6nXgAC/vNn
 69w4+qXEStFUY/hB0fA5cObAEOfQQ6jvJNZQLrSaW9hUe+kFdUgpx3M1QMQnc8BGURjWu30qvHe
 4dVoYzL+ZW/r81bQ4Uy0a+gM32Fj9JXs3E6eiEcZk7pn769MpzpwRS+DSZxx8Dxg36avnQCrAd9
 RMCLu6sygzkzpog==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 12:27:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243935

Use the present tense for fragment summaries, so that the
'bitbake-config-build list-fragments' has a coherent output.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../fragments/yocto-autobuilder/autobuilder-resource-constraints.conf | 4 ++--
 meta/conf/fragments/yocto-autobuilder/autobuilder.conf                | 4 ++--
 meta/conf/fragments/yocto/sbom-cve-check.conf                         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

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
index 46f6965a0d..f4178af4ec 100644
--- a/meta/conf/fragments/yocto/sbom-cve-check.conf
+++ b/meta/conf/fragments/yocto/sbom-cve-check.conf
@@ -1,4 +1,4 @@
-BB_CONF_FRAGMENT_SUMMARY = "This fragment enables sbom-cve-check with recommended default options"
+BB_CONF_FRAGMENT_SUMMARY = "Enable sbom-cve-check with recommended default options"
 BB_CONF_FRAGMENT_DESCRIPTION = "Enables sbom-cve-check and applies the following configurations: \
  - Adds the sbom-cve-check class to IMAGE_CLASSES. \
  - Configures CVE database recipes to fetch the latest git revision using AUTOREV. \

-- 
2.55.0


