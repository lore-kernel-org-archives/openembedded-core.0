Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1D6C3DA7F
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 13:26:00 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.26408.1722777949449900738
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 06:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=bMn3w2Oz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2024080413254647aeb2be6f50f24b22-dy13n_@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2024080413254647aeb2be6f50f24b22
        for <openembedded-core@lists.openembedded.org>;
        Sun, 04 Aug 2024 15:25:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=yF0v3AT8Z1/4kOW41uedIx7mJWCJSKgKKHb1qIjiFoM=;
 b=bMn3w2Oz1pbQRpnQf7SUD8+DGcYthE8JAccDn5tsvBbuRwabIFMzOj7ABGkXi29t24TP1L
 vjP49EoVno1ml7e6Cy3FFQ0RsHJhUSm3/tJC2CSqJHHn1fqRYPLghpZ91QfxEtPkKmwm85Dp
 G6vuzkeRLVwx9GR8/5W0xlo8HiHcOzeD8yG8Jl55Ahg0YR7lSNFguU3HLRkctBCkLLfLGe8Q
 z1u4unO/LH/NNpFFJ2TDEzXY833jRCZwTvHGTawi4npkQqqDptChjJz/2gt1NCulimPVJOZb
 A01GNI7mvsi8nyytKn1vtVrLSFPLYGlpA2deD8Is3IO4UR1wTLHYImNQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][PATCH v2] glibc: cleanup old cve status
Date: Sun,  4 Aug 2024 15:24:58 +0200
Message-Id: <20240804132458.4154634-1-peter.marko@siemens.com>
In-Reply-To: <20240804125633.4153809-1-peter.marko@siemens.com>
References: <20240804125633.4153809-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 13:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202949

From: Peter Marko <peter.marko@siemens.com>

This CVE status should have been removed on version update.
CPE says >=2.34 and <2.39 while our version is already 2.39.

(From OE-Core rev: b568a8f428e76f75bb8c374983f62822325ebe8a)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index ad58bebcf1..955b22bc38 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -6,5 +6,3 @@ SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
-
-CVE_STATUS[CVE-2023-4911] = "fixed-version: Fixed in stable branch updates"
-- 
2.30.2


