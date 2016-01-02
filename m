Return-Path: <mschiffer@universe-factory.net>
Received: from chaos.universe-factory.net (chaos.universe-factory.net
	[37.72.148.22])
	by mail.openembedded.org (Postfix) with ESMTP id EE81073166
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jan 2016 23:53:08 +0000 (UTC)
Received: from avalon.neoraider.dn42 (unknown [IPv6:fd1b:c28a:2fd6::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by chaos.universe-factory.net (Postfix) with ESMTPSA id 3416B18122B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jan 2016 00:53:08 +0100 (CET)
From: Matthias Schiffer <mschiffer@universe-factory.net>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Jan 2016 00:53:00 +0100
Message-Id: <f8b6e0a67be1bede97cded62d1ee42aae8b8977b.1451778497.git.mschiffer@universe-factory.net>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <c00e9825d8e0221666adffd95ed157f9affe06b8.1451778497.git.mschiffer@universe-factory.net>
References: <c00e9825d8e0221666adffd95ed157f9affe06b8.1451778497.git.mschiffer@universe-factory.net>
In-Reply-To: <c00e9825d8e0221666adffd95ed157f9affe06b8.1451778497.git.mschiffer@universe-factory.net>
References: <c00e9825d8e0221666adffd95ed157f9affe06b8.1451778497.git.mschiffer@universe-factory.net>
Subject: [PATCH v2 2/3] base-files: create ${base_bindir} etc. instead of /bin, /sbin and /lib
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
X-List-Received-Date: Sat, 02 Jan 2016 23:53:10 -0000

These directories conflict with the symlinks created for merged-usr setups.

Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
---
v2: create both ${base_libdir} and ${nonarch_base_libdir}

 meta/recipes-core/base-files/base-files_3.0.14.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index b71d5c5..2af7ecd 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -33,8 +33,8 @@ INHIBIT_DEFAULT_DEPS = "1"
 docdir_append = "/${P}"
 dirs1777 = "/tmp ${localstatedir}/volatile/tmp"
 dirs2775 = ""
-dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
-           ${sysconfdir}/skel /lib /mnt /proc ${ROOT_HOME} /run /sbin \
+dirs755 = "${base_bindir} /boot /dev ${sysconfdir} ${sysconfdir}/default \
+           ${sysconfdir}/skel ${base_libdir} ${nonarch_base_libdir} /mnt /proc ${ROOT_HOME} /run ${base_sbindir} \
            ${prefix} ${bindir} ${docdir} /usr/games ${includedir} \
            ${libdir} ${sbindir} ${datadir} \
            ${datadir}/common-licenses ${datadir}/dict ${infodir} \
-- 
2.6.4


