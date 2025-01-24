Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3783C02194
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 16:29:04 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
 by mx.groups.io with SMTP id smtpd.web10.16315.1737735493392244758
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 08:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@debian.org header.s=smtpauto.stravinsky header.b=DDIw/LpD;
 spf=none, err=SPF record not found (domain: debian.org, ip: 82.195.75.108, mailfrom: bage@debian.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=G9q0/h9FYwCnnDUj3GIO6sqyYurfNX/UkBTjvSKTaZo=; b=DDIw/LpDpeCnBFtVIMKO3PfW2q
	tmCTDj1nRxMixazP9K0pnFJiWXcO+xWESKn89kJGLeRqwbnRL7OiMMcncqUwHE6IS2XOMTQnFd0F6
	i0QEIoEALR6b7RC3+eokx/+sZe8mY/xpxHME+COH5F7LnguK2eZMZBs5u6gFZipL4I1WP+A9qMths
	JbQyfmr79hU3YNW4wdk5Ge4Z+tZ3OGaUxNpVo2YPNIIirboruqG4bnWOVGiJ7f+NhJxlta3zwfUPA
	uLwSpqbRxxReCvvvrjbk/HL86FjGWTEvSz0QOt1mlKSDFHw0JzOfeMYCNRy0tGTbQLzuRThlIY3lY
	pRJAHNng==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1tbMNn-009TSd-0g; Fri, 24 Jan 2025 16:18:11 +0000
From: Bastian Germann <bage@debian.org>
To: openembedded-core@lists.openembedded.org
Cc: Bastian Germann <bage@debian.org>
Subject: [PATCH] libxfont2: Document more specific BSD-4-Clause-UC
Date: Fri, 24 Jan 2025 17:17:49 +0100
Message-ID: <20250124161751.13839-3-bage@debian.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250124161751.13839-1-bage@debian.org>
References: <20250124161751.13839-1-bage@debian.org>
MIME-Version: 1.0
X-Debian-User: bage
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 16:29:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210240

COPYING in libxfont2 upstream contains only one BSD-4-Clause text variant,
which is explicitly covered by the copyright addendum by University of
California. Change the SPDX license reference to BSD-4-Clause-UC.

License-Update: reference can be more specific

Signed-off-by: Bastian Germann <bage@debian.org>
---
 meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
index bf0c7d0775..bf49d728b9 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
@@ -6,7 +6,7 @@ such as freetype)."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT & MIT & BSD-4-Clause & BSD-2-Clause"
+LICENSE = "MIT & MIT & BSD-4-Clause-UC & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a5d1388c9d40be70dbad35fa440443f7"
 
 DEPENDS += "freetype xtrans xorgproto libfontenc zlib"

