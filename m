Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UCVBD-00078f-2i
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 14:11:48 +0100
Received: by mail-wi0-f178.google.com with SMTP id hq4so1976997wib.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2013 04:55:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=4XIniVouBQURr/+jpRTjR+l8ZvYXCxG+QCNaGzhJfNo=;
	b=CdZUXHO1H5rJ5phczsuQuCvrhD7d2Vr/eGOUPyQiAUyousoqRgWK4zcF7iWbN4ZbbV
	tLl5kRK9WZsGafjIcxg7gyORH+D0f//K5IdrNhoeDgjHZGHkDXaIhrKmhQ84vfmDnp/Y
	2L8JwT13VpaWCK+XwJqjAOUa0w76a7dW1KE3TbtwvcKodmoZBDMNILid0qgspNBIHEpm
	6bGKIr7u1PXTfKlVIFVPSlp8xt4pUlfr4x1Wk/e/KS5xveayGf+fJRNw06uf4Dubz68t
	OXRAFxkvghDplGH7qwxvbl/xL8JyOzNp7h99TpTiIgoAxcb7P5aSyk21g/W3WsrZcQAD
	FXNA==
X-Received: by 10.180.88.168 with SMTP id bh8mr11432748wib.15.1362401718278;
	Mon, 04 Mar 2013 04:55:18 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fx5sm15460507wib.11.2013.03.04.04.55.16
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 04:55:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2013 12:52:46 +0000
Message-Id: <20627f408334008456ef2f13d744815dab08b72a.1362401323.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362401323.git.ross.burton@intel.com>
References: <cover.1362401323.git.ross.burton@intel.com>
In-Reply-To: <cover.1362401323.git.ross.burton@intel.com>
References: <cover.1362401323.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmv/xgXpVqyKzv2+VfwXx5uZJV9facBy9n9a8IYjLKgKdVnwNF9hkBNcmMzpFIe6X1mVW+z
Subject: [PATCH 3/4] gtk+: mark as provider of virtual/gtk-update-icon-cache-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Mar 2013 13:11:52 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 8c2b977..f05838a 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 SECTION = "libs"
 
+PROVIDES_class-native = "virtual/gtk-update-icon-cache-native"
+
 X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender libxcomposite"
 DEPENDS = "glib-2.0 pango atk jpeg libpng gdk-pixbuf-native docbook-utils-native \
  libgcrypt cairo gdk-pixbuf"
-- 
1.7.10.4



