Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id D6B9C7732D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 23:10:54 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so113215288pac.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 15:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=gMkDcxGdbU0E0ycvfsU3M/ozJTVxLgEmwmfhTHk8zms=;
	b=kVHIgmu7u/EjWGEqhCqas+T+BYNCmB4P+2F7AmJq+BhTPw42wBDV2vnHLwl/NaCDqN
	kxw/o/PZhn7/NpUFwDLOMedfSlLJfQMrFWkRWoUxD9OFVh182yllJnB9vKEk/5hUCJ/Q
	x1eh4UjVJ2jpcKbX90Q99XExIMPQ/+Z27HygMM1HTYrPZg5TBEjoIaMqFu+GVuoXL8t2
	DegGHfxSFwjEs0y10aIPhtI+qp3hDy2uMyY1oImIWyjlcO44atJ4EwfZL5f5rVYDE7Qu
	fXmYi8h8ugEYIn8RC8fagJTYSYfRsjUDjtzQgXfl+EVaUKiXejftGwE2ZWm2hIGNzIAt
	qIcA==
X-Received: by 10.66.222.68 with SMTP id qk4mr35868101pac.89.1447456254875;
	Fri, 13 Nov 2015 15:10:54 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	pq1sm22366902pbb.91.2015.11.13.15.10.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Nov 2015 15:10:53 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 16:10:41 -0700
Message-Id: <a2976f346a9ddf2822929c54c9e81b7b24f0e1d6.1447455202.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <24014f579fcadd2f2cc5f2378a41454023cf674a.1447455202.git.chris_larson@mentor.com>
References: <24014f579fcadd2f2cc5f2378a41454023cf674a.1447455202.git.chris_larson@mentor.com>
In-Reply-To: <cover.1447455202.git.chris_larson@mentor.com>
References: <cover.1447455202.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 3/6] sysprof: add missing gdk-pixbuf/pango deps
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
X-List-Received-Date: Fri, 13 Nov 2015 23:10:56 -0000

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


