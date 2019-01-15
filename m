Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 0306E7C152
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 22:27:34 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id BD81F5C0E1C;
	Tue, 15 Jan 2019 23:27:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1547591255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=E/DhsuHILtPDH5Y776+EKrHKsWQueTsZ6B8srkB/1IM=;
	b=QzMMOOGp5Q8pLxk4iLqwTj0VWR4+3fbKiI4YEIlZRissIoEGTQG03RFLsb/J1BXXBl3ch1
	KPckz2CByeN6jLBCoBzohXzw+v1d67utphAZDNcVYO120BjOjG2wm334JqOMF3NolaHv1G
	CA+cZlAFufh1SYhvKeMfzWtSOgQCbOw=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 23:27:29 +0100
Message-Id: <20190115222730.54560-5-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20190115222730.54560-1-stefan@agner.ch>
References: <20190115222730.54560-1-stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 4/5] consolekit: rename policykit to polkit
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
X-List-Received-Date: Tue, 15 Jan 2019 22:27:35 -0000

From: Stefan Agner <stefan.agner@toradex.com>

PolicyKit has been renamed to Polkit since quite a while. Rename
the PACKAGECONFIG accordingly.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/recipes-support/consolekit/consolekit_0.4.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index 80d48bf84f..15b39046e3 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -26,7 +26,7 @@ S = "${WORKDIR}/ConsoleKit-${PV}"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', d)}"
 
 PACKAGECONFIG[pam] = "--enable-pam-module --with-pam-module-dir=${base_libdir}/security,--disable-pam-module,libpam"
-PACKAGECONFIG[policykit] = "--with-polkit,--without-polkit,polkit"
+PACKAGECONFIG[polkit] = "--with-polkit,--without-polkit,polkit"
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--with-systemdsystemunitdir="
 
 FILES_${PN} += "${exec_prefix}/lib/ConsoleKit \
-- 
2.13.6


