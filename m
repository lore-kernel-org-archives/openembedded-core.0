Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6BBA660D4F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 15:10:14 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u57so4957301wes.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 07:10:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=UFC1eVbWbiKmmybbW8GS7UmbfgZ/fw8lw/Bd8swsiak=;
	b=GKttBOwbf9+acAEiFpqzqr6wzz2UNQDrwKsG8DhapepagDO04fM6wmWHVEYot7aLV2
	25rx9EDmxVOcjZYx7GMKAQNWJxsoMJqAVpSHom2Ho/DSDq9hZEVuTN0h5aJaE1RjjkXZ
	Ku511ayEJnyMJDye08NEnJlLgLVHXg6nuTc10el0sFaQ9cizhVFBNch/Zo6JGzR4iWdH
	cM3Z5wSmb4+Mcrlw8Jj6rltPA2mogLt5lrLYsJ7WyYSHciZ8OL6FXrm2QbukeLGP9ODl
	qSSPNncwuHV6ukW56pUnHn6HbeiUIeOAH32dw/eqrGxwCk7us6s7jGTKhL65J+9MxiKu
	g2+g==
X-Gm-Message-State: ALoCoQkG4JzD6W0Q555NusIH3SdzB9lIqruId0TycTdC4a2Q+dQpnZPewpxnI8yj93qCxNIK8jP8
X-Received: by 10.180.105.66 with SMTP id gk2mr18800709wib.32.1387811415035;
	Mon, 23 Dec 2013 07:10:15 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	cy10sm10159573wjb.6.2013.12.23.07.10.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Dec 2013 07:10:13 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Dec 2013 15:10:09 +0000
Message-Id: <1387811410-6832-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] libxcb: don't disable parallel building
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
X-List-Received-Date: Mon, 23 Dec 2013 15:10:15 -0000

Several test builds later and there were no failures, so this appears to have
been fixed upstream.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libxcb.inc |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb.inc b/meta/recipes-graphics/xorg-lib/libxcb.inc
index 7f9b0af..d75b26b 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb.inc
+++ b/meta/recipes-graphics/xorg-lib/libxcb.inc
@@ -10,7 +10,6 @@ BBCLASSEXTEND = "native nativesdk"
 SECTION = "x11/libs"
 LICENSE = "MIT-X"
 
-PARALLEL_MAKE = ""
 DEPENDS = "xcb-proto xproto libxau libxslt-native xcb-proto-native libpthread-stubs"
 
 SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.bz2 \
-- 
1.7.10.4


