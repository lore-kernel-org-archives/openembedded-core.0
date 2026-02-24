Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346F4F357AD
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:21 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21477.1771943117768316437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1EVEzU32;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483703e4b08so44686815e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943116; x=1772547916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EySQV0SV92rnl4sS3Q+7qO2fh6yTTNAysP4EDsWdMds=;
        b=1EVEzU329iwG4dCkA/IuCLLSH2YsF4Ft6oVNE59SN+gaUKJe3i61mJDQ4myTpsUXEx
         JKHAcxjMomLALDYJysRnHxAul34q6gVh45Ql//mTcjhANMY2Ud+l4CTCBQbYN/TwamBu
         ORNvEpRuNCIIEVNg2IFOdX/fwa+v0jSO0iNaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943116; x=1772547916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EySQV0SV92rnl4sS3Q+7qO2fh6yTTNAysP4EDsWdMds=;
        b=uRSWqm2ipys/oHIa/GvamcN9LnzF6tyvLG01ZHKj87SkHsWsLmY/zNidPQNGIdK5oH
         c5oBPVCSCVYUXkZpny2rXum9mBUJcpk5iTebtcXWnUx/qocgtDOw3uUauSoYP9P8d6OE
         n8b6SaSAg5v5bCRMPPcZK6tc145jNjHmCprENM25eGVJ58quSpYDDPv/m6pswkAZcy2N
         Zdb33OV3yfVZHW+4GvSOk04iiyqCjeD48pNq8CKpYkPHiLpmadFmNijr3/U93FqFRB9Q
         QZHOc6BnbIPkb7vhTGedsgik06DQy6aYfBN37E4c6SEi8sxuq37hdJc0G1Np6APrVMv0
         s60g==
X-Gm-Message-State: AOJu0Yx5PY0xohMuZOnw875aOAjWjwyie7BU6u6aKx+2nVw36DF3hgze
	RJN3hFk4uXx2ivLgf7X3tW/Xg94x6VnwYVD2R+NF2ihcVaSzMZryIXelTh3yqgGu+1/CSucDG69
	xZH/g
X-Gm-Gg: AZuq6aKThoOZrn9Y1umjslKPJjtYEOzOid7IQdk8Rpdez8uTtei8O0q2kx77S+HJ3ct
	QkWf4FGmQZJJ+ydccAAIZsxLzXZTTP8+X1+DBO63ohVx+RxqZXyOJVN+gITWJfGW6ioX7O+1eTs
	7XnP9Vm/rUzftIkNYprigO/aOqP1q6Z4Sx03ZfHrb9s8GHGcUaWTR3jZatAZJlSoPfvLyIwfN/R
	5Fm6EDL6C1HDxs8k6asJqXxeUJEMAxLlYncVimi6TGkPXKDw+ffCk4gAYZjJQvLAbu7a/BCa2ix
	qJOSlIEnHW4uVZRwEWyk6y5+OZgTvpX8DFBQMLuTCDA8t2agxUvizUx9q2Vpiwv60PWCP3MYLiX
	O8TMW6CxKlXHQDO/Nww3BxOba1xK3rZ9lCqLwZyDVl8kOaYziMjl216ob6O8pNr712wLg6bnMW9
	GTJZ6cShKLc79p8n865cSZ8nmlX0ZkgVFgYItAqRR1wLEFEl4gwL/uGPdH5Nv6Wsjm3/96Z4M9p
	auWi5Fp5a+rZkFMeU15p4LsKVDE/uvCTjn9URJ0/UAe
X-Received: by 2002:a05:600c:530d:b0:483:78e7:ce15 with SMTP id 5b1f17b1804b1-483bd76b9e1mr1745365e9.13.1771943115872;
        Tue, 24 Feb 2026 06:25:15 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:15 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/38] glib-2.0: patch CVE-2026-1485
Date: Tue, 24 Feb 2026 15:24:16 +0100
Message-ID: <da1c4a97c2d59157985da5281022f63373e31ae4.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231790

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1] linked from [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/issues/3871
[2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4981

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../glib-2.0/glib-2.0/CVE-2026-1485.patch     | 44 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1485.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1485.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1485.patch
new file mode 100644
index 00000000000..6768a1d00c4
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1485.patch
@@ -0,0 +1,44 @@
+From ee5acb2cefc643450509374da2600cd3bf49a109 Mon Sep 17 00:00:00 2001
+From: Marco Trevisan <mail@3v1n0.net>
+Date: Fri, 23 Jan 2026 19:05:44 +0100
+Subject: [PATCH] gio/gcontenttype-fdo: Do not overflow if header is longer
+ than MAXINT
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In case the header size is longer than MAXINT we may read and write to
+invalid locations
+
+Spotted by treeplus.
+Thanks to the Sovereign Tech Resilience programme from the Sovereign
+Tech Agency.
+
+ID: #YWH-PGM9867-169
+Closes: #3871
+
+
+(cherry picked from commit aacda5b07141b944408c79e83bcbed3b2e1e6e45)
+
+Co-authored-by: Marco Trevisan (Treviño) <mail@3v1n0.net>
+
+CVE: CVE-2026-1485
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/ee5acb2cefc643450509374da2600cd3bf49a109]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/gcontenttype.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gio/gcontenttype.c b/gio/gcontenttype.c
+index 230cea182..11323973a 100644
+--- a/gio/gcontenttype.c
++++ b/gio/gcontenttype.c
+@@ -1013,7 +1013,7 @@ tree_match_free (TreeMatch *match)
+ static TreeMatch *
+ parse_header (gchar *line)
+ {
+-  gint len;
++  size_t len;
+   gchar *s;
+   TreeMatch *match;
+ 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index c6816f93fa8..37a5fd34a96 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -73,6 +73,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2026-0988.patch \
            file://CVE-2026-1484-01.patch \
            file://CVE-2026-1484-02.patch \
+           file://CVE-2026-1485.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 

