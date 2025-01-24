Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93633C02191
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 16:29:04 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
 by mx.groups.io with SMTP id smtpd.web11.16100.1737735493001114087
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 08:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@debian.org header.s=smtpauto.stravinsky header.b=Exy0a1m7;
 spf=none, err=SPF record not found (domain: debian.org, ip: 82.195.75.108, mailfrom: bage@debian.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=gI2hI6/PHwn6EYjYUZYqPkQH1lm7pTjj4n/RZ+/iEvE=; b=Exy0a1m7tCYRIz2R6F2WtA1trG
	1OYEevOBcWAl/5v2I10qQXBerc7UAQZtuOg09q1V1V1+Swhvz5bsbQ3V2zfe66yYkzK2DfSq2ZHC5
	raK6UBcDzQcDb6Pnz3iSXroCgH1leYY9iZNARwFgAJI0WUmJfpeAXHMoiBV3S7fEK/I38rgvScldb
	rBMjStz2sxF9czUFbdadisI4T2rxQTMrZIMzZGiDAYqxeeRWvlZgv37GdVw125udLAW5hpTe5BQ9i
	n/ZfVsvHAYg7tueIz77QbN3wnij/4kjBFh4HYj+fWT2UhKCbh9AQknz+ihj6IvfpgeFUkNragwd7Q
	wWXHsE9w==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1tbMNl-009TSd-Rl; Fri, 24 Jan 2025 16:18:10 +0000
From: Bastian Germann <bage@debian.org>
To: openembedded-core@lists.openembedded.org
Cc: Bastian Germann <bage@debian.org>
Subject: [PATCH] font-util: Correct SPDX expression
Date: Fri, 24 Jan 2025 17:17:47 +0100
Message-ID: <20250124161751.13839-1-bage@debian.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Debian-User: bage
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 16:29:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210238

The BSD-4-Clause license is not contained in version 1.4.1.
But MIT and X11 are listed in the COPYING file.

License-Update: upstream has changed

Signed-off-by: Bastian Germann <bage@debian.org>
---
 meta/recipes-graphics/xorg-font/font-util_1.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb b/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb
index 0c65927fb4..6ad112aca7 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "X.Org font package creation/installation utilities"
 
 require xorg-font-common.inc
 
-LICENSE = "Unicode-TOU & BSD-4-Clause & BSD-2-Clause"
+LICENSE = "Unicode-TOU & MIT & X11 & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2a9e705c00e463c8d294f90486852e06 \
                     file://ucs2any.c;endline=28;md5=8357dc567fc628bd12696f15b2a33bcb \
                     file://bdftruncate.c;endline=26;md5=4f82ffc101a1b165eae9c6998abff937 \

