Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18802C3ABDA
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 18:47:13 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.110447.1747248423000351974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 11:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=U3HVNcNQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202505141846599b93a9c112376dec68-f358ta@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202505141846599b93a9c112376dec68
        for <openembedded-core@lists.openembedded.org>;
        Wed, 14 May 2025 20:47:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=H4wf2sMsp6amx6gzS2JXrcuno55a3uCLLkOQ11Q4BT4=;
 b=U3HVNcNQt/in79J2pt6t04+fitHnRUPeT23Tb8A9y3veBlvpl15ZusOjt+B2HSuWOCnBNo
 aoYXQdy8THK5VCRfXrQ0lL420PKzIsTAjIZmEsxENKYv3Mcv6oovzUjS+hkBXq/9hjPYw12h
 0VYyCOParrlXeisTUzo6ews+r097dIgWlTGjk2rmX2KChEqurml4pOSG5mL0POts2/yF3NlG
 Yi1yErbqt94isCbrTWKAU8vrE1P8zdSLBYv7kV9tBBBx6ZyFr33D7kfzsrBSd4ikv4mfUaAA
 BoVQtvScObxLPL7scBPYGddC5yfIgFXavsLimNKW4WAJyTTJQ7gAgOmQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v2 1/2] dropbear: switch url to mirror
Date: Wed, 14 May 2025 20:46:09 +0200
Message-Id: <20250514184610.97465-1-peter.marko@siemens.com>
In-Reply-To: <20250514183336.84167-1-peter.marko@siemens.com>
References: <20250514183336.84167-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 18:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216522

From: Peter Marko <peter.marko@siemens.com>

Main download page is currently unavailable, switch to mirror listed in
README file of the dropbear repository and release tarballs.

This is to allow upgrade due to CVE, it should be reverted later or
maybe even not merged and feed the tarball only from Yocto mirror until
the main page is up again.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/dropbear/dropbear_2024.86.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dropbear/dropbear_2024.86.bb b/meta/recipes-core/dropbear/dropbear_2024.86.bb
index be246a0ccd..3b54542490 100644
--- a/meta/recipes-core/dropbear/dropbear_2024.86.bb
+++ b/meta/recipes-core/dropbear/dropbear_2024.86.bb
@@ -12,7 +12,7 @@ DEPENDS = "zlib virtual/crypt"
 RPROVIDES:${PN} = "ssh sshd"
 RCONFLICTS:${PN} = "openssh-sshd openssh"
 
-SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
+SRC_URI = "https://dropbear.nl/mirror/releases/dropbear-${PV}.tar.bz2 \
            file://0001-urandom-xauth-changes-to-options.h.patch \
            file://init \
            file://dropbearkey.service \

