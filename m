Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RP8EU-00071B-3o
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Nov 2011 08:42:34 +0100
Received: by bkbzs2 with SMTP id zs2so4124477bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 23:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=LLn4oISWGupVnuJpazbiZN7aPetpdU8bXg1zEEDWdSo=;
	b=wYy3/rHqAbqLT11V6GZutwYUjVUVYghLjrO/as7OpjqRCPmHTXM8XVgXhmgprATPyS
	ttn5BLWs9twsXw2n7viU7neKZsjaZBrrkfAp1qJGj8kukLFHaGRBN7/LU8MeC891RBon
	AAUzlAXMV5EUpkAEeGfbmqzUNfOUzuQ1Ere9o=
Received: by 10.204.132.211 with SMTP id c19mr11289763bkt.94.1321083370848;
	Fri, 11 Nov 2011 23:36:10 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o7sm6225030bkw.16.2011.11.11.23.36.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 23:36:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Nov 2011 08:35:45 +0100
Message-Id: <1321083345-29399-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <5050804@linux.intel.com>
References: <5050804@linux.intel.com>
Subject: [PATCH] default-providers: add alsa to resolve multiple runtime providers
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
X-List-Received-Date: Sat, 12 Nov 2011 07:42:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/default-providers.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index afea5e7..79785fb 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -19,6 +19,7 @@ VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-cworth"
 #
 # Default recipe providers
 #
+PREFERRED_PROVIDER_alsa-lib ?= "alsa-lib"
 PREFERRED_PROVIDER_dbus-glib ?= "dbus-glib"
 PREFERRED_PROVIDER_dbus-glib-native ?= "dbus-glib-native"
 PREFERRED_PROVIDER_gdk-pixbuf ?= "gdk-pixbuf"
-- 
1.7.8.rc1



