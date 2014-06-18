Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 20C8C700EF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 08:28:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5I8SQVx008153
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 01:28:26 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 18 Jun 2014 01:28:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jun 2014 01:28:23 -0700
Message-ID: <e1a04169ae95b4a8c497018a37a983d99587c35f.1403080009.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1403080009.git.liezhi.yang@windriver.com>
References: <cover.1403080009.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] dbus: don't override EXTRA_OECONF
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
X-List-Received-Date: Wed, 18 Jun 2014 08:28:29 -0000
Content-Type: text/plain

We need use EXTRA_OECONF_append_class-native rather than
EXTRA_OECONF_class-native.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/dbus/dbus.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 01108c9..d38ba7e 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -86,7 +86,7 @@ EXTRA_OECONF = "--disable-tests \
                 --disable-systemd \
                 --without-dbus-glib"
 
-EXTRA_OECONF_class-native = "--disable-selinux"
+EXTRA_OECONF_append_class-native = " --disable-selinux"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-- 
1.7.9.5


