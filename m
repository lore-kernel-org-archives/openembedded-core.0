Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RfpDf-0002cH-DY
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 09:50:43 +0100
Received: by eeit10 with SMTP id t10so7412490eei.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 00:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=9ivY2GOaPgfosJmLGWk5P0d71Pzy7BlMa0LwaPo/ILw=;
	b=KYKQew6qxtmI85oPP5p3rvIvuhp7bvkN+mZJwXWsqjdNwQSmk4GL/yb7fsu9Bcj6UG
	IutH89KyYWde+QJiqvQKsySbvEdaI4d0aBh4jZksv1H4S4J2pYLOzT5vydEvTyV6lqWm
	1N0O1rcwf3Icya69JoBImdM1/rlbvQz0aoaTM=
Received: by 10.213.112.133 with SMTP id w5mr3721036ebp.72.1325061810049;
	Wed, 28 Dec 2011 00:43:30 -0800 (PST)
Received: from localhost.localdomain (a2038.upc-a.chello.nl. [62.163.2.38])
	by mx.google.com with ESMTPS id 13sm117909854eeu.1.2011.12.28.00.43.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 00:43:29 -0800 (PST)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 09:43:05 +0100
Message-Id: <1325061785-2180-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.8.1
In-Reply-To: <4EFA3FB5.7030605@linux.intel.com>
References: <4EFA3FB5.7030605@linux.intel.com>
Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Subject: [PATCH v2 1/2] u-boot: improved DESCRIPTION, fixed HOMEPAGE
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
X-List-Received-Date: Wed, 28 Dec 2011 08:50:43 -0000

HOMEPAGE pointed to an sf.net page that said that the
page did not exist any more and after that it redirected
to the denx.de page; updated HOMEPAGE to point to that page
Also improved the description to use the official capitalisation

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 544acd2..a3f50bc 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -1,3 +1,3 @@
+DESCRIPTION = "U-Boot - the Universal Boot Loader"
+HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
-DESCRIPTION = "U-boot bootloader"
-HOMEPAGE = "http://u-boot.sf.net"
 SECTION = "bootloaders"
-- 
1.7.8.1



