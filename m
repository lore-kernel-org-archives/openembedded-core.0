Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RDNFa-0006vf-1y
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 23:19:06 +0200
Received: by gyg8 with SMTP id 8so5874805gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 14:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=zTsbDEXacdSQyNmAB1tiCTNSB8tRHXOAEFzyll2bJJc=;
	b=XxWMFvU0WmJvxgDWd3J0ditGKF49UjyEVOHD63AePrOWFhZafSZghDif/nq1m/Xikz
	86V7+FeGs1GEkEyiiUZZMWazrs1WzLgxEmHMWkyEcpml577dtg/XyuYW9NT+Yrj6kiNl
	zObn6vna6hU2OHW6AzRikNtlUDM37hGPxou0Q=
Received: by 10.236.128.236 with SMTP id f72mr26908894yhi.13.1318281205034;
	Mon, 10 Oct 2011 14:13:25 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-167-38.ph.ph.cox.net.
	[24.251.167.38])
	by mx.google.com with ESMTPS id o50sm12052228yhl.9.2011.10.10.14.13.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Oct 2011 14:13:24 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Oct 2011 14:13:06 -0700
Message-Id: <2bf0304dc82d978a37c2b64d1e17e29175cffd6e.1318281075.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1318281075.git.kergoth@gmail.com>
References: <cover.1318281075.git.kergoth@gmail.com>
In-Reply-To: <cover.1318281075.git.kergoth@gmail.com>
References: <cover.1318281075.git.kergoth@gmail.com>
Subject: [PATCH 2/2] autoconf: no need to hardcode the full path to m4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Oct 2011 21:19:06 -0000

This way autom4te uses m4 as it finds it in the PATH, rather than
hardcoding any particular path.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-devtools/autoconf/autoconf_2.68.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/autoconf/autoconf_2.68.bb b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
index c6209a3..21b5fb3 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
@@ -1,6 +1,6 @@
 require autoconf.inc
 
-PR = "r2"
+PR = "r3"
 
 PARALLEL_MAKE = ""
 
@@ -27,4 +27,6 @@ RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native"
 
 SRC_URI_append_virtclass-native = " file://fix_path_xtra.patch"
 
+EXTRA_OECONF += "ac_cv_path_M4=m4"
+
 BBCLASSEXTEND = "native"
-- 
1.7.3.2.430.g208247



