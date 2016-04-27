Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2418E731F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 12:56:57 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id e201so37611223wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 05:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BcFldwXErwBo5IKs8bdVijHU6Q3mC6Jp3MFsB8YnFtY=;
	b=eXAyk33gRktuUVFav7tn17cWXToqNF8u1G5QB91gePQUv13O4KYYGRp7ARCu8CEEUQ
	/ZzBmBFCOKrKqO7sLYKfiIjynpnXPNlKkT+SPVb2KFF4yiYz6uday2Qj+FqMok4Stix7
	chy8hQPnFVWk3gJnBOz8ltXx3pk8LMl7P6tseg5bq77zHhcUu9F/7QN5a7qhwBYHegci
	NZhgGrXJsq2vz4tWrDwTMOgEirLvQpnqUgu3wm1dhZ/CizgLSH/SqYw/7uPgiin/JhPy
	Nnr84UNniq4ZGlwIvlW7yaTYipwB1uaaQnRRmLxUHQ0ouXIaG4kkmO+495pFiRgvDGl7
	fi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BcFldwXErwBo5IKs8bdVijHU6Q3mC6Jp3MFsB8YnFtY=;
	b=F6YuyPzq/ST4oYdsTrDmM7cHOAeZ9PlL/eUv/ZeX+KtuSKxgs7sgGm0nWjhq/El014
	W1O/1sirARHZ26+I3KeNWEDj8iJ0tneEmzR7N2TkF3W8YOhL1Hr8AClSP9s1sxe39L43
	kSmC8hLLAF2lK9zCNhMRm2aBkMkSeT7icQw4bGi9C9gsJmvKv1Kok9NRBKrP5pAAaMk0
	dKyO4FRxSTIHOSvqIgz52xmwfPekGu6xaPrtKIBxBF/NU5SgVBd/kcnchz48T/TqREyE
	vxz4zM/pbiFEZHnE7yny7LMsIPew5aAuQKNTcDnotCxPIfN5+c8hc7USKgniRAiarrTD
	lv+Q==
X-Gm-Message-State: AOPr4FULNARNbr24emxAMjQxMEJfKWvwMAJSJVJyEnxGWQwIqiZbcWkfQoXrEj3HtbmxWNmh
X-Received: by 10.194.3.20 with SMTP id 20mr10417298wjy.59.1461761818214;
	Wed, 27 Apr 2016 05:56:58 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r123sm8376474wmg.20.2016.04.27.05.56.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 05:56:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 13:56:54 +0100
Message-Id: <1461761814-30036-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1461761814-30036-1-git-send-email-ross.burton@intel.com>
References: <1461761814-30036-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] gnome-desktop3: remove redundant gnome-common dependency
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
X-List-Received-Date: Wed, 27 Apr 2016 12:56:58 -0000

The gnomebase class already depends on gnome-common-native, so there's no need
to depend on it again.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb
index 374101f..75a99a6 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb
@@ -10,7 +10,7 @@ inherit gnome pkgconfig upstream-version-is-even gobject-introspection
 SRC_URI[archive.md5sum] = "9a5875247abdb99bad93f1c4230d1d6d"
 SRC_URI[archive.sha256sum] = "ddd46d022de137543a71f50c7392b32f9b98d5d3f2b53040b35f5802de2e7b56"
 
-DEPENDS += "intltool-native gsettings-desktop-schemas gconf libxrandr virtual/libx11 gtk+3 glib-2.0 gnome-doc-utils gnome-common startup-notification xkeyboard-config iso-codes"
+DEPENDS += "intltool-native gsettings-desktop-schemas gconf libxrandr virtual/libx11 gtk+3 glib-2.0 gnome-doc-utils startup-notification xkeyboard-config iso-codes"
 
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.8.0.rc3


