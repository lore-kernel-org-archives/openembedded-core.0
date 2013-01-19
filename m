Received: from mail-ob0-f174.google.com ([209.85.214.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TwhKI-0006u3-Cr
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Jan 2013 23:55:50 +0100
Received: by mail-ob0-f174.google.com with SMTP id ta14so4835065obb.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 14:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=fT74VVWyVcZYZqTuGNHuOlDDavteNacV6MY0CeVlfUw=;
	b=iuVicqwPGNxJGfaJWHUoaN5J0lIldRwcsv04wldFp7IWEiyqmuOcZA2T9WdgpobPoK
	uewufo/B+Yp60Q8qvBmtBvdFp7Yn7v1nNEDxHpgJdWL9r+bDfCxu3zH8AysDD3jjPUVX
	zefUZlLe8gGWgB2uoXNxnHSzYC2tGm3PuBejK3VybK5+mtWIiqEW8dZTXBd4z4F4P5Rf
	RWi35Hmxs0gLc9dQVON7dJoGrmsENtJ14qSFgcD2nASJmhwmjLasdSlIzehdsK2W+i4J
	cmcB/aoXRiDa7HzFV4IYByYZYG9w60v9ScMFdq3f/AVXFg1gltnazRtyzna5k4DclPlZ
	4rSA==
X-Received: by 10.182.36.103 with SMTP id p7mr10497965obj.5.1358635223536;
	Sat, 19 Jan 2013 14:40:23 -0800 (PST)
Received: from leo.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id 7sm6936441obu.4.2013.01.19.14.40.22
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 14:40:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2013 14:40:05 -0800
Message-Id: <320c8ce2bc4d82f7c2334c223622dbb3bdab8698.1358634922.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
References: <613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
In-Reply-To: <cover.1358634922.git.raj.khem@gmail.com>
References: <cover.1358634922.git.raj.khem@gmail.com>
Subject: [PATCH 3/4] consolekit_0.4.5.bb: Package unpackaged systemd files
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
X-List-Received-Date: Sat, 19 Jan 2013 22:55:51 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/consolekit/consolekit_0.4.5.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
index d1cc037..67899f6 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
@@ -29,7 +29,7 @@ EXTRA_OECONF = "${POLKITCONF} --with-systemdsystemunitdir=${systemd_unitdir}/sys
                 ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam-module --with-pam-module-dir=${base_libdir}/security', '--disable-pam-module', d)} \
                "
 
-FILES_${PN} += "${localstatedir}/log/ConsoleKit ${libdir}/ConsoleKit ${base_libdir} ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
+FILES_${PN} += "${localstatedir}/log/ConsoleKit ${libdir}/ConsoleKit  ${systemd_unitdir} ${base_libdir} ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
 FILES_${PN}-dbg += "${base_libdir}/security/.debug"
 
 PACKAGES =+ "pam-plugin-ck-connector"
-- 
1.7.9.5



