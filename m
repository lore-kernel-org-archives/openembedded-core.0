Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id B8DB778A73
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:21:02 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k9so18076206wre.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ueUVACV/2UYx/jK6WgqrSYvbDkN8jc84is9fo6vW4Ps=;
	b=bNeDuHexJtoC7yJB50qODPwerwE8FrbqSBDn6yj+6Z5kmav3NB/+U1VqKJNPRvobRs
	glAAV6KG9xoPaU9xBpUIJ36fMxWvgBlaPGenLhu6i0CUY0EfWU32CYdTYIks/Geuy/G6
	Cpy4K8n5KEAY55S7qK9J9uxSCpn4taU4M77QPSGLBuSUpRVuMar5CtJJXUPGX9f77CY+
	qJiHoEajEcbf0XT+Q+TTpGktQk2FnB7T7jGp/WSgoUOWxSz6w7r/n9CuvekyhsX1zT32
	/EUWPlf/h5phN+AyqNiLJFMf/OUS3/tGMvWijuOIZLZGfnPuCyTnbmHXMVwkMifCB9dQ
	ZoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ueUVACV/2UYx/jK6WgqrSYvbDkN8jc84is9fo6vW4Ps=;
	b=j82hcDHYLx91+0fLK13w0Orti6ika/wyZkfTuWXxQcpuscWmvoKCwfOiGZ3QuTmGov
	OHBu62ZTQbgv8n0nWdhLbQ8T6OHdb64NsrLWhcn9EjXYPQO8Nf7EHZcM9dWMMo0sfrfR
	Fo0BZhEO9gnVsfdIljWGQ7JBe0sx2ptkykSGd73GEZ+tcwWOdPlp+d8elwpZmXP85f12
	7XPzAXvq6IooIGXwMbu0tnmMVu9S65/dGd7niUYtgH3BbsmB6hYoBezinCUxU1cIgv6Y
	PUK43X7m7q9fAGaWbnIy/ECYtQeqlgSezFhH2tSOmMIb4Ckt72gcSJt1r75z384CaB11
	Scqw==
X-Gm-Message-State: APf1xPBx1sJHg2B1KWf5ala71I3QaBMs3EsMKhVxY87SvD2EwoBUHojB
	6UZ2dOa1ishstuWu0D8kMfKMESI3
X-Google-Smtp-Source: AG47ELtOhbr/UFC02JuG9sketRU3XjrBRKcV4+sY7rqV7vUMN/MuSXR15dHuscnWRGVedo7NKBQlbw==
X-Received: by 10.223.209.11 with SMTP id a11mr13489847wri.122.1520270463700; 
	Mon, 05 Mar 2018 09:21:03 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.21.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:21:02 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:29 +0000
Message-Id: <20180305172046.21729-12-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 12/29] squashfs-tools: refresh patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Mar 2018 17:21:03 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../squashfs-tools/squashfs-tools/fix-compat.patch                | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch b/meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch
index d5451469120..0ce7b4e8ce2 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch
@@ -23,7 +23,7 @@ Index: squashfs-tools/mksquashfs.c
 ===================================================================
 --- squashfs-tools.orig/mksquashfs.c
 +++ squashfs-tools/mksquashfs.c
-@@ -1286,6 +1286,10 @@ void write_dir(squashfs_inode *inode, st
+@@ -1261,6 +1261,10 @@ void write_dir(squashfs_inode *inode, st
  		dir_size + 3, directory_block, directory_offset, NULL, NULL,
  		dir, 0);
  
@@ -50,9 +50,9 @@ Index: squashfs-tools/unsquashfs.c
 ===================================================================
 --- squashfs-tools.orig/unsquashfs.c
 +++ squashfs-tools/unsquashfs.c
-@@ -38,6 +38,10 @@
- #include <limits.h>
- #include <ctype.h>
+@@ -42,6 +42,10 @@
+ #include <sys/sysmacros.h>
+ #endif
  
 +#ifndef FNM_EXTMATCH
 +#define FNM_EXTMATCH 0
-- 
2.11.0


