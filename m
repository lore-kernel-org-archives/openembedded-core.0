Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q5FL6-0001jE-8h
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 12:42:56 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so1711285bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 03:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=Xa4xE8aJ485L5ULtCXkUKinBuFY8qwsD7eI9DdgVKmQ=;
	b=EPQVzok0LyCwRXvRtsk6IUXxcV+dK/JHs8lLXaTiCGYZ+JLFxsDmVa+rHz7ejg8Ydw
	dy8okZ8u/0SdWyvBMF6zm4xXMZ5MISMl2UY88jW6/qWpXZMvWcDrIChE32cuxrHfzJTv
	OUVUReef8waElLM3bau/5EYJVSYDxc9dB/amg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=F7ZfxGPIdDEVi/6Il8FO1tSVF42iLnphuwyNN5nWyY4xslO4W9ZbRbTAtKpXb6UaQx
	ObRCVMr/kf8pgUpKIZcjiKHqS7b3ucdC0kxcY0lJ83L7FsGt1nw+rtMCeC+oDx7s9KKH
	XLIrxB2IQhh/XG25h4A+YG6unlnWMOcklwAdI=
Received: by 10.204.188.65 with SMTP id cz1mr2381062bkb.108.1301568057722;
	Thu, 31 Mar 2011 03:40:57 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm646785bkm.18.2011.03.31.03.40.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 03:40:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2011 12:40:55 +0200
Message-Id: <01e4bd4da87c2f8fc3344467eab6a32f7904a05e.1301567822.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301567822.git.Martin.Jansa@gmail.com>
References: <cover.1301567822.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/3] gconf-dbus: add SRCREV to recipe
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
X-List-Received-Date: Thu, 31 Mar 2011 10:42:56 -0000

* taken from meta/conf/distro/include/poky-default-revisions.inc for
  those who want gconf-dbus and are not using poky

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-gnome/gnome/gconf-dbus_svn.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gconf-dbus_svn.bb b/meta/recipes-gnome/gnome/gconf-dbus_svn.bb
index 9fdd82c..04908c3 100644
--- a/meta/recipes-gnome/gnome/gconf-dbus_svn.bb
+++ b/meta/recipes-gnome/gnome/gconf-dbus_svn.bb
@@ -10,6 +10,7 @@ RPROVIDES_${PN}-dev = "gconf-dev"
 
 PV = "2.16.0+svnr${SRCPV}"
 
+SRCREV = "705"
 SRC_URI = "svn://developer.imendio.com/svn/gconf-dbus;module=trunk;proto=http"
 S = "${WORKDIR}/trunk"
 
-- 
1.7.4.1



