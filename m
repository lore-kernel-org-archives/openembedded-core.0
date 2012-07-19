Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Srpf5-0003iK-TX
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 14:16:56 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 05:05:32 -0700
Received: by wgbdr13 with SMTP id dr13so1656385wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 05:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=wjIOBQnwN+tVRBp9cUWBYWDJ4QWrrXbw7fCxtNPIuhI=;
	b=BrNb6UYjdj//oUvfJ5i02+noXT0s9pGt2tyse3vzMgd2B8udcMNgsrIed1FU0ryOZO
	N9m1f1yuzVPquvg2AuI2+UcUkI+5J6MZZ6I1BkyczAZRA1Sx84wIYXaraI7gyoud2uah
	ZXET2/xWDx3VFjDLZeV8tmwvLBT33/9pOwlob+oSf+slTRRSNhqrqYAGiMdDCICCMwH4
	J5eDaus7Z4GUi9XKyibmrg+L3h4lxnDQBXL/x29UhhrTDgTYDz5PcC7c7pjL/B6jWJgF
	tUXwtjwrTzwPuoFdVdTNu+qawemIlrrIxDj3AlY3+jVjjbsBTBS7v/ORSmt3wohxS2fw
	jeoA==
Received: by 10.217.6.194 with SMTP id y44mr1048175wes.27.1342699530570;
	Thu, 19 Jul 2012 05:05:30 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t8sm38149972wiy.3.2012.07.19.05.05.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 05:05:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 13:05:07 +0100
Message-Id: <79b77d1a833a1539e4edd76a608d6e20a659b41a.1342699470.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342699470.git.ross.burton@intel.com>
References: <cover.1342699470.git.ross.burton@intel.com>
In-Reply-To: <cover.1342699470.git.ross.burton@intel.com>
References: <cover.1342699470.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnzlUAeSQRJmZGENkNIhwtDC+do/TaNrN+YiViKywaSCi2zllTaWqhwuTnXjIsA/J1oz9CJ
Subject: [PATCH 1/3] libgnome-keyring: remove eggdbus dependency, it has an in-tree copy
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
X-List-Received-Date: Thu, 19 Jul 2012 12:16:56 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb b/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
index 53e583e..a6576db 100644
--- a/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
+++ b/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
@@ -9,11 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0914b9d3ebaba41ef2e3e0ae16f296cf \
                     file://egg/egg-dh.h;endline=22;md5=1626c16af2a8da1f88324cf3ced33f08"
 
 SECTION = "x11/gnome/libs"
-PR = "r1"
+PR = "r2"
 
 inherit gnome
 
-DEPENDS = "dbus eggdbus libgcrypt"
+DEPENDS = "dbus libgcrypt"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-- 
1.7.10



