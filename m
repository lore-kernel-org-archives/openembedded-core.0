Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R7BnO-0006S1-FN
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 21:52:26 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so4179714bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2011 12:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=aSfABjbvY4Xnwj162uOalJ6zEazhBe1mEOjgTA12ApA=;
	b=qb2nsEVWJFV3UG7nAz72Cf3dPAP+gPgGVhq3sLIpm0tJtn4/TmsoR0Lun7XupWBXjR
	+V156hKHL39jnWeb5UcW2qKzR3oE9NxsTnVds96cjqsIRtuBIPcCe6afxLorNYfn8m4t
	WQFEFVtbdy5KiUj0nCubQXnEtqEsXVY3G2mTk=
Received: by 10.204.155.149 with SMTP id s21mr2588933bkw.243.1316807227690;
	Fri, 23 Sep 2011 12:47:07 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id ex8sm5500310bkc.2.2011.09.23.12.47.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Sep 2011 12:47:06 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2011 23:46:40 +0400
Message-Id: <1316807201-22623-9-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
References: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 09/10] gconf-dbus: packaging fixup
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
X-List-Received-Date: Fri, 23 Sep 2011 19:52:26 -0000

Behave more like plain gconf: include a dtd and .la files into -dev
package.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-gnome/gnome/gconf-dbus_705.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gconf-dbus_705.bb b/meta/recipes-gnome/gnome/gconf-dbus_705.bb
index fdfc45f..c0c2e28 100644
--- a/meta/recipes-gnome/gnome/gconf-dbus_705.bb
+++ b/meta/recipes-gnome/gnome/gconf-dbus_705.bb
@@ -10,7 +10,7 @@ RPROVIDES_${PN}-dev = "gconf-dev"
 
 #SRCREV = "705"
 #PV = "2.16.0+svnr${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 # This SVN repo is no longer available use a tarball mirror site until
 # we move to proper gconf recipe.
@@ -33,6 +33,8 @@ do_configure_prepend() {
 
 FILES_${PN} = "${libdir}/GConf-dbus/2/*.so ${libdir}/dbus-1.0 ${sysconfdir} ${datadir}/dbus* ${libdir}/*.so.* ${bindir}/* ${libexecdir}/*"
 FILES_${PN}-dbg += " ${libdir}/GConf-dbus/2/.debug"
+FILES_${PN}-dev += "${datadir}/sgml/gconf/gconf-1.0.dtd \
+		    ${libdir}/GConf-dbus/2/*.la"
 
 BBCLASSEXTEND = "native"
 
-- 
1.7.2.5



