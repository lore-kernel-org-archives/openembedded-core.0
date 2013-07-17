Return-Path: <eu@felipetonello.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id E93646B270
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 01:04:01 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id va7so1574526obc.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 18:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=gVqLDUDLGEvFh0zTE3vtdz89bbKE/h3HU9aq4NSbbgo=;
	b=XRS1Dw1gfGPXzcdSv2o65KRcuYZKjcD8LLXoHJZenegLsZxITlJH9ng3nhU3YFwv3r
	mBf4gCj3sDgu5hJ+xQqcebGFv/hrTSXU3SNEqdk3v8JHCKkB4fTJ5QpUBY8mM+sLlMvW
	XHemypLV0onnen1aDJdbUc8aEdUg+6rIozHivT9BzMwl4N/A3knXPFB0p5Him4PR7j+5
	g5xK8EW59i378ptpKj2/EOr5ZF54hy89R8qPE+rRsJY5yUsoG534kel2cUo6m678vEQ6
	Rk255UNJc2GSrUCbBW5HrE8NBdeq45oRPWy7uO3UIfjEj9ceUwZEooBMvtOuqi9p28Au
	Olqg==
X-Received: by 10.60.92.165 with SMTP id cn5mr5330466oeb.53.1374023042566;
	Tue, 16 Jul 2013 18:04:02 -0700 (PDT)
Received: from localhost.localdomain.com (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id qa4sm4084548oeb.5.2013.07.16.18.04.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Jul 2013 18:04:01 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2013 18:03:48 -0700
Message-Id: <1374023028-25980-2-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1374023028-25980-1-git-send-email-eu@felipetonello.com>
References: <1374023028-25980-1-git-send-email-eu@felipetonello.com>
X-Gm-Message-State: ALoCoQl/1XKerTgdeHa2IMdmKllY80fSFxWcRwZiIrz+8UFxL12IlBmz8hdJzSrXREzVJGurOqXP
Subject: [PATCH 2/2] pulseaudio: Added cli-protocol-unix to pulseaudio-misc
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
X-List-Received-Date: Wed, 17 Jul 2013 01:04:02 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

This is necessary since pacmd uses this module.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index dd65f65..ec435c5 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -146,6 +146,7 @@ RDEPENDS_pulseaudio-server = " \
     pulseaudio-module-switch-on-port-available"
 
 RDEPENDS_pulseaudio-module-console-kit =+ "consolekit"
+RDEPENDS_pulseaudio-misc += "pulseaudio-module-cli-protocol-unix"
 
 FILES_pulseaudio-module-gconf += "${libexecdir}/pulse/gconf-helper"
 FILES_pulseaudio-module-bluetooth-proximity += "${libexecdir}/pulse/proximity-helper"
-- 
1.8.1.4


