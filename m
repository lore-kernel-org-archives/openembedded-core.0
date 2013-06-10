Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id F01B66A9A1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 23:15:45 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id v14so4050687pde.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 16:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+RF+YYzic+QoTlZ3muvpI1akRmLCovn0UT0PZI5YddU=;
	b=m+9MiQpAgL/fOUc1jFFeJZtUPw9AGzVoKzvAK8p7nksZpqTHT1ypGwOWVgGMvpWuLS
	NJGHbt5XxaBuhNBnaNJsDF/GtR9rWNg9wP9bIqPeI8h0nRI+N9AXoNQy88E8Q5mrGiAI
	iwX9u+LucSEBy39bn9WsfF58tzoOk8seU+SnFg/bDKpYLLlwky/prcBY6QofFsQ9nrH1
	bu2sqxprdTE4iTGAgfzKPOyh1TegoE5vO0BE3D1xB/OpKFkm4ocPcTt9Sztd6bi0tH7O
	euysewk10mgWzrzLxLdbjU5SdcMDy5LaZXpHMjH7l7j528HYSU6WWsmFYwfv2WFc0E+L
	p4wA==
X-Received: by 10.66.122.68 with SMTP id lq4mr15787025pab.78.1370906147130;
	Mon, 10 Jun 2013 16:15:47 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	nz3sm11887957pbb.33.2013.06.10.16.15.44 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 16:15:46 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 16:15:47 -0700
Message-Id: <1103bc7c76faba1db73f4c4f4b8439aa03258c3d.1370906102.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1370906102.git.chris_larson@mentor.com>
References: <cover.1370906102.git.chris_larson@mentor.com>
In-Reply-To: <cover.1370906102.git.chris_larson@mentor.com>
References: <cover.1370906102.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH v2 1/4] packagegroup-core-tools-profile: don't exclude mips
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
X-List-Received-Date: Mon, 10 Jun 2013 23:15:46 -0000

From: Christopher Larson <chris_larson@mentor.com>

Now that liburcu supports mips, this packagegroup can pull in lttng recipes
(lttng-ust, lttng-tools, lttng-modules, babeltrace) on that architecture as it
does for the others.

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


