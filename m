Return-Path: <kergoth@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 570326A622
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:46:48 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id wo10so10800214obc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=78QL01Qsp1O05pBa5Ah3IcWdGvd2bDtChcmIFQ6somc=;
	b=Q8d1EmrIKvdFCYh6ZW1HGd01ftCXHXWmoP3sO3ccCb0oc46fU70k2dTGWFGQooNZCt
	3dt4Z2G7VShYHjczou8Q76uyYcELRJrInSzPHNRZWiW/tTrobjPMwTJ+qvZzYNcPgJ2f
	ZShISc+DeRxjBKl6a3W+coyWCGv71kgWEn/sLFsDW+awTO+cXiiUNFaejZYulFdSqy1G
	FS9GvzgHQjZMQkTxNM+MHpS70npnFXfqv3yqkmuG0iiifIs3qCFtgQwp0sLrtU3MAL6o
	I1F7xatxTWes/232cCj4K7LjOW+eYkFRexU5ITDi7vdZOCzhNj77vUbRq4sGVFXTVDW8
	4OLg==
X-Received: by 10.182.108.230 with SMTP id hn6mr9713174obb.25.1370897209431;
	Mon, 10 Jun 2013 13:46:49 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id z5sm24272820obw.4.2013.06.10.13.46.47
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 13:46:48 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 13:46:49 -0700
Message-Id: <4dcc39cc1fed7d398b97859ea281ab46e8ba8dbb.1370896985.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1370896985.git.chris_larson@mentor.com>
References: <cover.1370896985.git.chris_larson@mentor.com>
In-Reply-To: <cover.1370896985.git.chris_larson@mentor.com>
References: <cover.1370896985.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/4] packagegroup-core-tools-profile: don't exclude mips
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
X-List-Received-Date: Mon, 10 Jun 2013 20:46:48 -0000

From: Christopher Larson <chris_larson@mentor.com>

Now that liburcu supports mips, this packagegroup can pull in lttng software
on that architecture.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../packagegroups/packagegroup-core-tools-profile.bb          | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 8f40c4e..bb1b78b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -48,22 +48,15 @@ SYSTEMTAP_aarch64 = ""
 
 LTTNGUST = "lttng-ust"
 LTTNGUST_libc-uclibc = ""
-LTTNGUST_mips = ""
 LTTNGUST_aarch64 = ""
 
-# lttng-tools, lttng-modules and babeltrace all depend on liburcu
-# which currentl doesn't build on mips
-
 LTTNGTOOLS = "lttng-tools"
-LTTNGTOOLS_mips = ""
 LTTNGTOOLS_aarch64 = ""
 
 LTTNGMODULES = "lttng-modules"
-LTTNGMODULES_mips = ""
 LTTNGMODULES_aarch64 = ""
 
 BABELTRACE = "babeltrace"
-BABELTRACE_mips = ""
 BABELTRACE_aarch64 = ""
 
 # valgrind does not work on mips
@@ -77,10 +70,6 @@ VALGRIND_aarch64 = ""
 #    exmap-console
 #    exmap-server
 
-# At present we only build lttng-ust on
-# qemux86/qemux86-64/qemuppc/qemuarm/emenlow/atom-pc since upstream liburcu
-# (which is required by lttng-ust) may not build on other platforms, like
-# MIPS.
 RDEPENDS_${PN} = "\
     ${PROFILETOOLS} \
     ${LTTNGUST} \
-- 
1.8.3


