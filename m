Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QKrxb-0004FQ-Am
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 14:59:15 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so1944974fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2011 05:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=IQ723WDqkkegbuIegQjZbf+s6fAhOsxSRRTXX3/tDvk=;
	b=wqHkLpuu+/CtTGe8PGwbJq2DPH7YCDH5kCtj7Dx5Mi0twkrknFgDwX+AW8fqAYTgdM
	x1tLCSFWGhs7NZjw8tNA8K0+kKg4P++mx2WxeL6ZEnFF0us56dTjh+8kM29kq/OXIW6G
	wdFJ8AXtbgUpoQx8agUYiwUQssHeBUvrYq7qw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=LiDf4qjiZayLQpJcvrPVge1dbOo2KMZ9Prre1bGhn4tZThHAzOIOiPplYwddtarcmX
	Da/3mu/jZY4idi/pp2jgV0RZ6m3OeDDFCOq0oQRnHC834ikobjJqboVn86mKn/UQcdX1
	CCEbKE4FwJKai3p3Nk80MnIe8Ny5vhP8SvQvY=
Received: by 10.223.94.129 with SMTP id z1mr1699525fam.144.1305291388788;
	Fri, 13 May 2011 05:56:28 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id r13sm837795fax.8.2011.05.13.05.56.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2011 05:56:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2011 14:56:21 +0200
Message-Id: <35c73b6c53296ebfe32af1213952973b793c4d5d.1305291184.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1305291184.git.Martin.Jansa@gmail.com>
References: <cover.1305291184.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/3] glib-2.0: use PN instead of glib-2.0 in PACKAGES and FILES
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
X-List-Received-Date: Fri, 13 May 2011 12:59:15 -0000

* otherwise notes like this are shown:
  NOTE: multiple providers are available for runtime glib-2.0-utils (glib-2.0-nativesdk, glib-2.0)
  NOTE: consider defining a PREFERRED_PROVIDER entry to match glib-2.0-utils

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glib-2.0/glib.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 83f1990..f015fd3 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -18,10 +18,10 @@ require glib-2.0.inc
 DEPENDS = "glib-2.0-native gtk-doc-native zip dbus"
 DEPENDS_virtclass-native = "gtk-doc-native pkgconfig-native gettext-native dbus-native"
 DEPENDS_virtclass-nativesdk = "libtool-nativesdk"
-PACKAGES =+ "glib-2.0-utils "
+PACKAGES =+ "${PN}-utils "
 
 LEAD_SONAME = "libglib-2.0.*"
-FILES_glib-2.0-utils = "${bindir}/*"
+FILES_${PN}-utils = "${bindir}/*"
 
 inherit autotools pkgconfig gettext
 
-- 
1.7.5.rc3



