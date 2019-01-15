Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id D32F97C14B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 22:27:35 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id D8E5C5C0EDC;
	Tue, 15 Jan 2019 23:27:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1547591255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=XDfeqYpQC09V95MU1IQTZFUQu7+sZZuAItStxa2dk60=;
	b=OgLxLEEbfsQx9n3WgbzNvDHGTAiGuvJL4Q1lyCzP+EAT4OHZb83cpXWXKkfPhBLsXmYWwW
	xpJkU+pWBA5IaQI6AGIlLotKYFozEBQV+0hyduwfdW/lyJwYKDGJRVHRxh1FBVmsG5iD75
	MI+WnDa2WEX/wWBGdY/tK//gDhcxkb0=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 23:27:30 +0100
Message-Id: <20190115222730.54560-6-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20190115222730.54560-1-stefan@agner.ch>
References: <20190115222730.54560-1-stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 5/5] consolekit: enable polkit if polkit distro feature is set
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
X-List-Received-Date: Tue, 15 Jan 2019 22:27:36 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Enable polkit depending on whether polkit distro feature is set.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/recipes-support/consolekit/consolekit_0.4.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index 15b39046e3..a17f739d4d 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -23,7 +23,7 @@ SRC_URI[sha256sum] = "b41d17e06f80059589fbeefe96ad07bcc564c49e65516da1caf9751464
 
 S = "${WORKDIR}/ConsoleKit-${PV}"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd polkit', d)}"
 
 PACKAGECONFIG[pam] = "--enable-pam-module --with-pam-module-dir=${base_libdir}/security,--disable-pam-module,libpam"
 PACKAGECONFIG[polkit] = "--with-polkit,--without-polkit,polkit"
-- 
2.13.6


