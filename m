Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4527F82A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:53 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id bb5so1226289plb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=EhTtpeSQR9dndN/cJBZLsQv7EfcgQiZUVWGJD/lk7Oc=;
	b=PupSuUXYj/tjLtO7i2/9GI28JSKdn6/dN6HpmvsWThdSnNzyFbdeY1L1NNTHBLw9oO
	j9Tq0EPKuBIp9NP05c93hEiF0C+rgIjd8H9hc53BPi5blxPMJVBhQnhd5KJZ/R8kDjLm
	V4IBeg2O8cn/zCs9H+8Lge4amLiVWF+EuXweYtzPfPY6lzXb9WGB2KwFnaASyXb0KLVx
	DnBhBdF1k5Cm0oksC4DcE7FyKy4HGko34RpbEFPdMprzNY2vUzOXpYqfq1I82qN+2hO5
	uiWGhdkLrG4OpOBXsHwEc9OSJYrtgCnyQempkB0oX0d88ZUEXFjCCa3uFq2+W7deMoe0
	wa7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=EhTtpeSQR9dndN/cJBZLsQv7EfcgQiZUVWGJD/lk7Oc=;
	b=rWmrduTW85mUXk2e949aRko/NnMdO/jvhO99JfMydMSl82wYZQXhEcw0ap/pjLOP4N
	H9ubciYHwjfRis2JTkfs1YlH0I907fUoyZY1lmXK08I3yWEStfw43VLE8tcJbzgGlydP
	4Po2VnaWC2ca2BMOsaYrcmwjNYNVSSGuT+KzpqozDf2Z9tQtTe0WrEJL8+yFxyes2/ZK
	vRdabmV0L8FZDal2VggcRtSV/MwyzvQS1V3USZwwLjFh+XGgM3PEf+0Gg8EErraQYq3c
	JX91iF+3sXJT6ig8Qknc/B6eiuusAjhrlX1cx8SrSHF+Ghcyf8uQ/s5/JtWq/eQL9EBC
	rjTw==
X-Gm-Message-State: APjAAAXy6XZ/JH7TwFWtDSbt3nBcXbAd2/utFaa6xoVpCtqXi/PC34kG
	MLRYGh4H3AwBrAApWWpSGYJXD4wo
X-Google-Smtp-Source: APXvYqwEaQKHz9qWj2ap5+dDdV8UjpeRo0od+8eyoaTChRYQ2C98mKsPjCZ2bR6QWMt2vqZLiZ7KMA==
X-Received: by 2002:a17:902:7d8c:: with SMTP id
	a12mr4366808plm.221.1573659174928; 
	Wed, 13 Nov 2019 07:32:54 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:32:11 -0800
Message-Id: <0b9748c655b6f733b504e70288f4b91dca2e4d58.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 29/31] libtirpc: create the symbol link for rpc header files
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:54 -0000

From: Zhixiong Chi <zhixiong.chi@windriver.com>

Since the Sun RPC is deprecated in glibc, the rpc header files
are not provided any more, but it allows alternative RPC
implementations, such as TIRPC or rpcsvc-proto, to be used.

So we create the symbol link for rpc header files for tirpc to
be more compatible with the glibc version and the application usage.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
index 9c480b8..8977a37 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
@@ -23,6 +23,20 @@ EXTRA_OECONF = "--disable-gssapi"
 
 do_install_append() {
         chown root:root ${D}${sysconfdir}/netconfig
+        install -d ${D}${includedir}/rpc
+        install -d ${D}${includedir}/rpcsvc
+        for link_header in ${D}${includedir}/tirpc/rpc/*; do
+            if [ -f $link_header -a ! -e ${D}/${includedir}/rpc/$(basename $link_header) ]; then
+                ln -sf ../tirpc/rpc/$(basename $link_header) ${D}${includedir}/rpc/$(basename $link_header)
+            fi
+        done
+        for link_header in ${D}${includedir}/tirpc/rpcsvc/*; do
+            if [ -f $link_header -a ! -e ${D}/${includedir}/rpcsvc/$(basename $link_header) ]; then
+                ln -sf ../tirpc/rpc/$(basename $link_header) ${D}${includedir}/rpcsvc/$(basename $link_header)
+            fi
+        done
+        ln -sf  tirpc/netconfig.h ${D}/${includedir}/netconfig.h
+
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


