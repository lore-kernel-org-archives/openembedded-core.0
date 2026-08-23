Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 095CCC5DF81
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 15:58:10 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16450.1787500679654792815
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 08:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=IS9pc8Yu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260823155757568538ffd500020710-_yn367@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260823155757568538ffd500020710
        for <openembedded-core@lists.openembedded.org>;
        Sun, 23 Aug 2026 17:57:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=4dA9H3/sntX9M4jmU7F+qwMB1rJHv3Gi8wP61QyyzCM=;
 b=IS9pc8Yu+CGBmTu6XfS8BQSbZJGGvU2F+t5fImrudV52bu1nLOBwqno0ba7uB3iLWVTzQh
 OE6Lcj+2OICuVPku4A7B5fayzTqVUISIb9CZWHWsCNDKsa+61+qkYLiXODuR9d118TwGZ8Va
 GIOAawttbcsRel8W2TE9bCGI05yJMvLGfSSVJ0sxrNPKRm6EAR3SPgZpaf7ubGdoq5beVLdK
 NshjVWP2h2KEuArBmaoWBTvcIHaWyAZ26Ero/Ep2pqaEmU5emkNtLgUaF2QL9zjeC7cVap4F
 OKl2B52zzDhcTpN6y1d6YJ4NMnCcdPd57ZkaZOqp/mXG6kdMS1R81fJg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 2/3] libslirp: upgrade 4.9.1 -> 4.9.3
Date: Sun, 23 Aug 2026 17:57:40 +0200
Message-ID: <20260823155741.2091982-2-peter.marko@siemens.com>
In-Reply-To: <20260823155741.2091982-1-peter.marko@siemens.com>
References: <20260823155741.2091982-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 15:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244040

From: Alexander Kanavin <alex@linutronix.de>

License-Update: license moved to a separate file
https://gitlab.com/qemu-project/libslirp/-/commit/d6cfac6d060d57c0e38a9c61157eaf6962b6c257

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 16f511425c537239e487b73998f9d8133a8ca2c4)

Full release notes:
* https://gitlab.freedesktop.org/slirp/libslirp/-/blob/v4.9.3/CHANGELOG.md?ref_type=tags

It also shows one "change":
* bootp: allow https for UEFI HTTP boot
It however does not change ABI and can also be interpreted as security
feature (allowing https), thus should be allowed for LTS backport.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../slirp/{libslirp_4.9.1.bb => libslirp_4.9.3.bb}           | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/slirp/{libslirp_4.9.1.bb => libslirp_4.9.3.bb} (70%)

diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb b/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
similarity index 70%
rename from meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
rename to meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
index 50577fd4ae..734e59a59b 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
@@ -2,10 +2,11 @@ SUMMARY = "A general purpose TCP-IP emulator"
 DESCRIPTION = "A general purpose TCP-IP emulator used by virtual machine hypervisors to provide virtual networking services."
 HOMEPAGE = "https://gitlab.freedesktop.org/slirp/libslirp"
 LICENSE = "BSD-3-Clause & MIT"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bca0186b14e6b05e338e729f106db727"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f95a9bf4a7e411164fe843697ccda59e \
+                    file://LICENSE;md5=cfea6044642fd63b90ce9d79f5db64d9"
 
 SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
-SRCREV = "9c744e1e52aa0d9646ed91d789d588696292c21e"
+SRCREV = "dd76415fce457e319d665eb8210d05c5731360ba"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS = "glib-2.0"

