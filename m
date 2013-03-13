Received: from mail-pb0-f42.google.com ([209.85.160.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <iwamatsu@nigauri.org>) id 1UFbOA-0002k3-5I
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 03:26:00 +0100
Received: by mail-pb0-f42.google.com with SMTP id xb4so485523pbc.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 19:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=V8PndUvJOhRzMdLxsg4p0GTQpYE9v7ltUGAFr2H7rw8=;
	b=bpODCZjeLKfnb5Zw0kKPpCERcZzS47ijFcXBXyfmhwg6AzGpWXBC6uxhvKWnYYAD3Y
	QNLMTybmQKpZmDQJ90XM9ZgtaJ2cj+Xp7jkkolZRZAQ9V3ubUB4p7eCIMBP8MBlUVvAo
	7kZfqIwqc4X11Y9p/0OH4w5ckMDJEu6Dms1nCR1ykgWneMeZvyExncnqiODig2daG4y3
	cajfcIAi8tcdijWzY9hCQwQ2ktIWQFYbgHpHY46a33AhlAwjelZBoDeAe4pHSG+UsVRY
	CK/tzpcxqymjwsgTkWG8SkpveWMIkWO9/MusAKpPye8WYwKu1h9DQ/BSXED130/gG5/2
	4plg==
X-Received: by 10.68.242.65 with SMTP id wo1mr20074879pbc.62.1363140556506;
	Tue, 12 Mar 2013 19:09:16 -0700 (PDT)
Received: from xps-iwamatsu.renesas.com (49.14.32.202.bf.2iij.net.
	[202.32.14.49])
	by mx.google.com with ESMTPS id z1sm4610376pbw.19.2013.03.12.19.09.14
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Mar 2013 19:09:15 -0700 (PDT)
Sender: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2013 11:09:01 +0900
Message-Id: <1363140541-13440-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQn6f+1aIQWbFHu6i184i9R1MqTNjl4434CU4JiTO/g+1BkA+t3l0LLIiW3vFJattibGT0Cy
Cc: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
Subject: [PATCH] alsa-tools: Update autotools.patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Mar 2013 02:26:06 -0000

envy24control, rmedigicontrol and echomixer require gtk+-2.0.
Remove envy24control rmedigicontrol and echomixer from list of tools.

CC: Cristian Iorga <cristian.iorga@intel.com>
Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
---
 .../alsa/alsa-tools/autotools.patch                |    6 +++---
 .../recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
index 294e970..08dd9de 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
+++ b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
@@ -26,9 +26,9 @@ diff -ruN alsa-tools-1.0.24.1-orig//Makefile alsa-tools-1.0.24.1/Makefile
 -	  mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
 -	  us428control usx2yloader vxloader echomixer ld10k1 qlo10k1 \
 -	  hwmixvolume hdajackretask hda-verb
-+SUBDIRS = ac3dec as10k1 envy24control \
-+	  mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
-+	  us428control usx2yloader vxloader echomixer \
++SUBDIRS = ac3dec as10k1 \
++	  mixartloader pcxhrloader sb16_csp seq sscape_ctl \
++	  us428control usx2yloader vxloader \
 +	  hwmixvolume hda-verb
  
  all:
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
index 0fe4bee..4b4f29b 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
@@ -5,7 +5,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2 & LGPLv2+"
 DEPENDS = "alsa-lib ncurses"
 
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://ld10k1/COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
-- 
1.7.9.5



