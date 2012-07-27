Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SujIa-0003k8-3I
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 14:05:40 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 27 Jul 2012 04:54:06 -0700
Received: by weyt11 with SMTP id t11so1789362wey.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 04:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=al5nf8cV+8ynbHAGdAs0JIjf8DExhkqDDiDRFHEcy3I=;
	b=WCPcrmYy82BxYv6l0H9VcV187ZdIw4XxUQhV0+LDdO1XhOOgEGajuZYAh0C8Woyf9M
	6XlMa5sDvFlmn9MMERk76nrvN5N3ZFWsCamgxe2ai0l4CGoXJquIwipoYtvMoTgyCX4t
	uSPlvRAqA4a4MNxtz44o1mNgx6JiFqmtUtjyZl1GDVL7I9SmzjyCsLwKgwBxtuOaINRD
	oGACI8ZHHEDuVGCE14SUwV6QYbozTWpg/cau1/8diQxGz+4qWGPv4qUaoEigiraNeCWp
	N0OPuswVS6TndimJFpaB4ICSTm85EMoCWoPnOb7cnNC4aR5VIOcGg2KpXlqLkhfDdg+n
	WvTg==
Received: by 10.180.103.136 with SMTP id fw8mr5517384wib.20.1343390045085;
	Fri, 27 Jul 2012 04:54:05 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id y5sm13523563wiw.9.2012.07.27.04.54.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jul 2012 04:54:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2012 12:53:36 +0100
Message-Id: <a02bdd399d3b352f6f981e3ace0162765e093d77.1343389943.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343389943.git.ross.burton@intel.com>
References: <cover.1343389943.git.ross.burton@intel.com>
In-Reply-To: <cover.1343389943.git.ross.burton@intel.com>
References: <cover.1343389943.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlcI3Zq8BwDfDvYLZW3LFVcndOBMpzgi2zypmbh536hImk53+NAKA93/Uj+AdTUfG8DQazV
Subject: [PATCH 2/4] libdrm: libdrm does not depend on xcb any more
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
X-List-Received-Date: Fri, 27 Jul 2012 12:05:40 -0000

From: Damien Lespiau <damien.lespiau@intel.com>

Signed-off-by: Damien Lespiau <damien.lespiau@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/drm/libdrm.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics/drm/libdrm.inc
index 8a2c760..e9ca2f9 100644
--- a/meta/recipes-graphics/drm/libdrm.inc
+++ b/meta/recipes-graphics/drm/libdrm.inc
@@ -8,9 +8,9 @@ SECTION = "x11/base"
 LICENSE = "MIT"
 SRC_URI = "http://dri.freedesktop.org/libdrm/libdrm-${PV}.tar.bz2"
 PROVIDES = "drm"
-DEPENDS = "libpthread-stubs udev cairo virtual/libx11"
+DEPENDS = "libpthread-stubs udev cairo"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 #libpciaccess is required starting from libdrm 2.4.26
 DEPENDS += " libpciaccess"
-- 
1.7.10



