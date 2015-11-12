Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 400F077277
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:40:59 +0000 (UTC)
Received: by pasz6 with SMTP id z6so82464544pas.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=gMkDcxGdbU0E0ycvfsU3M/ozJTVxLgEmwmfhTHk8zms=;
	b=jvYQfE3sozEGAb4ltVh3CE18xoLEjpgRfNPfy6QL85Ui4EoSRAMyiGVg9Hqb66QOtj
	bwLt/otlsetMBvC5e6IRtYelK2uvjz7rA0oQBWlwv1FaYIso5BhpfOn78mgmqweAWVyC
	qihWtP0SsxXb6X11o7WVaUky7PmI8JBqwVyoiHOCiRgqsnOZ6BRLJVnu+NM5OKClkEFV
	XVgFqYMzzOFumqmfgf1/gSdW4PDhQev1KjyOczsikyEOcusvat6aX0fNs/9eMMY3FO5g
	3VXXBQQj1rihO5cWrb01r59iLZ9/cSXZlPofMyDN2+C7WCdXzh54PT6MxIyWWDB9ZSo9
	LYWA==
X-Received: by 10.68.142.37 with SMTP id rt5mr27381597pbb.64.1447371659552;
	Thu, 12 Nov 2015 15:40:59 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	yz3sm16726614pbb.37.2015.11.12.15.40.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:40:58 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:40:34 -0700
Message-Id: <1292381aee521c9535c80dd302a1129e3b3de31e.1447371041.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <0608c916d5ea89bc95112b583a04de0cc81a6374.1447371041.git.chris_larson@mentor.com>
References: <0608c916d5ea89bc95112b583a04de0cc81a6374.1447371041.git.chris_larson@mentor.com>
In-Reply-To: <cover.1447371041.git.chris_larson@mentor.com>
References: <cover.1447371041.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/7] sysprof: add missing gdk-pixbuf/pango deps
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
X-List-Received-Date: Thu, 12 Nov 2015 23:40:59 -0000

From: Christopher Larson <chris_larson@mentor.com>

These are explicitly checked with pkg-config in the configure script.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-kernel/sysprof/sysprof_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
index d331a23..84c6aad 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 inherit autotools pkgconfig
 
 PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK2DISTROFEATURES}', 'gui', '', d)}"
-PACKAGECONFIG[gui] = "--enable-gui,--disable-gui,gtk+ libglade"
+PACKAGECONFIG[gui] = "--enable-gui,--disable-gui,gtk+ gdk-pixbuf pango libglade"
 
 # We do not yet work for aarch64.
 #
-- 
2.2.1


