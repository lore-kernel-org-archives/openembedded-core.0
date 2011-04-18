Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBjPs-0003uB-Uy
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 10:02:40 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so3288161fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 01:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=BJqJza1CC0wUoaxoe/5+vbyQ/2p07JnGepa+GVr9yJY=;
	b=ggnIEU965U+xQlyQTQfPve5rwRv7vwQdSPb1e6yMiwQmXJcECu2So/utPkHlMu/wAK
	vPODS8HVgXHCtEByTzxUfoyY0oHGpzQpvDZZD7ywNgogqQ5SMBdFdSY2ZVfKQCDIb0Nr
	W9sRHf1G5TpiFcrjPq2aIdUWcQdcbnjVrZPoQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=TiBXbHcWFJzij0etrKUilpXT83PNP0wOqraBv7sF6UXz6MbH2NvZVwZQmavq5ycIjJ
	Wy12wvw+oRvMRkMJFpOFWqxGTo3+fjH9KLZoJaa+wxfGSmWINjVgKXmM991bWljTqo3S
	R3w2AiQIpv3dKK1+zxi9Wqx0zeDa3M2wFsIb4=
Received: by 10.223.4.142 with SMTP id 14mr592410far.39.1303113622971;
	Mon, 18 Apr 2011 01:00:22 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 23sm160563fay.4.2011.04.18.01.00.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 01:00:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Apr 2011 10:00:16 +0200
Message-Id: <e9ea8537ff218d24fe058f5fa1cf044254846470.1303113405.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1303113405.git.Martin.Jansa@gmail.com>
References: <cover.1303113405.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/4] gconf-dbus: add SRCREV to recipe
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
X-List-Received-Date: Mon, 18 Apr 2011 08:02:41 -0000

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
1.7.5.rc1



