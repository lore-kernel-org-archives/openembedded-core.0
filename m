Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FF8F428D8
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 20:15:11 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4478.1776284106544565242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 13:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ThIfXdEc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2026041520150418308761c1000207c5-emjpvn@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026041520150418308761c1000207c5
        for <openembedded-core@lists.openembedded.org>;
        Wed, 15 Apr 2026 22:15:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=uM+Ea7f9RjzyAIPYdTI+Pb9PNJ4g46y9GUND6cZ0V1E=;
 b=ThIfXdEcJLrAvMWKaHRuKxIdT9XX0b5MSCNTqlXTHqhmlaHoIzEcGG0PjuiBXbDORUSV9G
 hzPuKdmNe45oacyyrX7NNrIwxjg00orI4B7kfw8XsiKDJx4HQTGtElprpRKVfVsY38EvIOr3
 IsbE0pcGP+JXMNdnzWAkWv5Ax2ptL2TvUc1lCH6/qUghkWaodqrqTFKykQDlJQ3mIm+hkwnj
 3/5oZPHcuaxj1mFKbSClonK6L8LxufP/SYrhp0HfrbYWSDaFawrQcEzK60NzZN6TnuPIjGhb
 P7Jv4taASb2ykaxqwv1vWo/6ybispmD8pI36R7zyvw3Ow7vQR13ZJiow==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/2] grub: set status for 6 CVEs fixed in 2.14
Date: Wed, 15 Apr 2026 22:14:42 +0200
Message-ID: <20260415201442.2172352-2-peter.marko@siemens.com>
In-Reply-To: <20260415201442.2172352-1-peter.marko@siemens.com>
References: <20260415201442.2172352-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 20:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235328

From: Peter Marko <peter.marko@siemens.com>

These CVEs were fixed in 2.14, however Redhat CNA does not fill any
version to CPEs.
References for fixes are in Debian security tracker:
* https://security-tracker.debian.org/tracker/CVE-2025-54770
* https://security-tracker.debian.org/tracker/CVE-2025-54771
* https://security-tracker.debian.org/tracker/CVE-2025-61661
* https://security-tracker.debian.org/tracker/CVE-2025-61662
* https://security-tracker.debian.org/tracker/CVE-2025-61663
* https://security-tracker.debian.org/tracker/CVE-2025-61664

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-bsp/grub/grub2.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index da67975290..0656489ead 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -28,6 +28,12 @@ CVE_STATUS[CVE-2023-4001]  = "not-applicable-platform: Applies only to RHEL/Fedo
 CVE_STATUS[CVE-2024-1048]  = "not-applicable-platform: Applies only to RHEL/Fedora"
 CVE_STATUS[CVE-2024-2312]  = "not-applicable-platform: Applies only to Ubuntu"
 CVE_STATUS[CVE-2024-49504] = "not-applicable-platform: Applies only to SUSE"
+CVE_STATUS[CVE-2025-54770] = "fixed-version: fixed since 2.14"
+CVE_STATUS[CVE-2025-54771] = "fixed-version: fixed since 2.14"
+CVE_STATUS[CVE-2025-61661] = "fixed-version: fixed since 2.14"
+CVE_STATUS[CVE-2025-61662] = "fixed-version: fixed since 2.14"
+CVE_STATUS[CVE-2025-61663] = "fixed-version: fixed since 2.14"
+CVE_STATUS[CVE-2025-61664] = "fixed-version: fixed since 2.14"
 
 DEPENDS = "flex-native bison-native gettext-native gawk-replacement-native"
 

