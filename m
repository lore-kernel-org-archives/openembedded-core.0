Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R7Bn9-0006Ry-NY
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 21:52:11 +0200
Received: by bke11 with SMTP id 11so4179694bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2011 12:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ZTkEsRdIig6cXydh8/BpGwM8KoW1nwbb9uByTbZ6VO4=;
	b=xQzBLGdoHaKnJa9JZfmoMs40v9pdedC70F8wZrkF2NN7QmKmEo3o9cKAzuYCgIFTA3
	6x/oITKVrp9k8WiS7JSuyPBs33TTGKZxTMcbuC6pckXWewBipjb6zYj9ob4ev8E5NhMy
	+h37Hd/KzDKPK9RYfOfTETpcZ6rvHTGju7UJg=
Received: by 10.204.154.136 with SMTP id o8mr2576886bkw.355.1316807210480;
	Fri, 23 Sep 2011 12:46:50 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id ex8sm5500310bkc.2.2011.09.23.12.46.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Sep 2011 12:46:49 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2011 23:46:32 +0400
Message-Id: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 01/10] default-provider: also define a default provider for gconf-native
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
X-List-Received-Date: Fri, 23 Sep 2011 19:52:11 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/conf/distro/include/default-providers.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index d51ac64..6e281cc 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -22,6 +22,7 @@ VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-cworth"
 PREFERRED_PROVIDER_dbus-glib ?= "dbus-glib"
 PREFERRED_PROVIDER_dbus-glib-native ?= "dbus-glib-native"
 PREFERRED_PROVIDER_gconf ?= "gconf-dbus"
+PREFERRED_PROVIDER_gconf-native ?= "gconf-dbus-native"
 PREFERRED_PROVIDER_gdk-pixbuf ?= "gdk-pixbuf"
 PREFERRED_PROVIDER_libgcc ?= "libgcc"
 PREFERRED_PROVIDER_libgcc-nativesdk ?= "libgcc-nativesdk"
-- 
1.7.2.5



