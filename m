Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3E70465DAB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 21:27:45 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so1940995eei.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 14:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=VVVUA/RhaA5XXUMTJS3RVhkGYbXxiXh2dtzAStIWMr8=;
	b=0xaXlMAvS8X2UZ+XRdgkqW7km4p3v0IGgcBa+6MxBlgQCH/30vyI+zOiF3hi0Od6vV
	HqiKaP6+is2AxFArpi4cLIL0gjWRkThlvVzNPjvlAOnH7Q8gVQJr1txJso7vQjXRBp0V
	ErgFabeJwJbinpxxzR3Cuc0cT7RD7QHbTAlhrtWOsBpbFjMVOLfYdS39RVFT6lNGYEp5
	6ByafW9I4p161FbcLVmJ5g2DvPyS3Y/Dhr9sHZ4rmQlG9TInNwQ0Ht3+pjlWk7ZD8AF6
	om/tGRXhucFDzaXkLljTmMQUfvFWjU3vDXxHvnEca99O/0sWARu0F3dG/WT/95BYYpUV
	8A2g==
X-Received: by 10.15.50.136 with SMTP id l8mr6259703eew.73.1397856466187;
	Fri, 18 Apr 2014 14:27:46 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t50sm79927016eev.28.2014.04.18.14.27.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Apr 2014 14:27:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Apr 2014 23:27:47 +0200
Message-Id: <1397856467-31007-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gsettings-desktop-schemas: add missing dependency on intltool-native
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
X-List-Received-Date: Fri, 18 Apr 2014 21:27:47 -0000

* do_configure fails with:
  | NOTE: Executing intltoolize --copy --force --automake
  | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gsettings-desktop-schemas/3.10.1-r1/temp/run.do_configure.1111: 180:
  /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gsettings-desktop-schemas/3.10.1-r1/temp/run.do_configure.1111:
   intltoolize: not found
  | WARNING: exit code 127 from a shell command.
  | ERROR: Function failed: do_configure (log file is located at
  /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gsettings-desktop-schemas/3.10.1-r1/temp/log.do_configure.1111)
  NOTE: recipe gsettings-desktop-schemas-3.10.1-r1: task do_configure:

* introduced in:
  commit 1138976f7bdcd24ef57451a2c2ceffa43666610f
  Author: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
  Date:   Tue Mar 11 13:27:46 2014 +0000

    gsettings-desktop-schemas: removed unneeded class inheritance

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.10.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.10.1.bb b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.10.1.bb
index 7217c66..eb09d2f 100644
--- a/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.10.1.bb
+++ b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.10.1.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 PR = "r1"
 
-DEPENDS = "glib-2.0"
+DEPENDS = "glib-2.0 intltool-native"
 
 inherit gnomebase gsettings gettext
 
-- 
1.9.1


