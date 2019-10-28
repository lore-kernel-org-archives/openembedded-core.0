Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id BD6E97F9C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 23:52:45 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id n15so11653920wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 16:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YYWF3w7Ua7JmGsXmBYPBbimPE7arkTZTYOkKbF+TnaE=;
	b=ijT3MTgH+b9VvHUPN1r4EJVhaJk73egUSEPjJKecbC5JOT5zkxeY+AX51ahEygGizG
	84uVfT0JtdYp0cIG1bV5NHMHQQiJk+xwGOnvWUYh76vk1wPn6rWrNkSOaL8ThCsFRCo1
	otjs69EP/lBbyf5clDPrakyKdVT7vBdHYrAH9IE9wO8k9QMar09VWDXiM6Nfh25+y0pg
	SBJDmXwzzqC+HSdVH96lQJlR/O4EaHfPiv97V6m4FmE8z+lvoBBHkwJjWNMtnSGa26WF
	+lljG7ika+1A5SDdr6KBA3raW+VeD7uiSpzlgrv0Gp6+DTGb6g3LRPuTKBp9DKX9QyfL
	EhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YYWF3w7Ua7JmGsXmBYPBbimPE7arkTZTYOkKbF+TnaE=;
	b=rV7XKL3RZmv+QpoM9/hAw25zXPdibOxqmKi5kxFLPQvZgU/A8c3omNM56SGuo0WBtS
	p80eTlSbvVbfLaFEFd5sc47df902eAJ3RSZ9zLeGK6VBkrv7Ca0j7x1SwVmQBBBO2aAJ
	m5I6PMFADJlx3KHYs1mEw/EE3KyImm/Vrl3/jxVp3bADVqkoZBaUjEBovcLTP4L1VLru
	7y23d8xyJX1LBZ0v/8HkgVmcsKj6XS7O/h1MSs9qw51LUqUQwCgLi6IRHho1waltL5H7
	3CiM/7xkNihvIySbw9v7qOULRyrLXcDt/wDbWgFr5mOTg8HbLd5u0t0keOIDKnH+zTN5
	lS0w==
X-Gm-Message-State: APjAAAUGmJei63l1JxZER8gP6ebgNszqiQNnsrYcp/4wjyO5FSux9ncH
	hRS708fJG8mZwspD6FsAYUvBdZO/MkA=
X-Google-Smtp-Source: APXvYqyV1XHg9hTakQ+Hg0CtESfNuMYA/LU8m3/WYaffepR3F3l/ylo1cBlegqR4mCAWIWp7LEY7Fw==
X-Received: by 2002:adf:ff8c:: with SMTP id j12mr263773wrr.75.1572306766131;
	Mon, 28 Oct 2019 16:52:46 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	w15sm14473787wro.65.2019.10.28.16.52.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 28 Oct 2019 16:52:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2019 23:52:43 +0000
Message-Id: <20191028235243.15597-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gcr: remove intltool-native
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
X-List-Received-Date: Mon, 28 Oct 2019 23:52:46 -0000
Content-Transfer-Encoding: 8bit

gcr uses gettext now, so no need to depend on intltool-native.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gcr/gcr_3.34.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.34.0.bb b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
index f13bfecbe19..616b0e5bf5d 100644
--- a/meta/recipes-gnome/gcr/gcr_3.34.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/gcr/issues"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-DEPENDS = "intltool-native gtk+3 p11-kit glib-2.0 libgcrypt \
+DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt \
            ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
 
 inherit gnomebase gtk-icon-cache gtk-doc distro_features_check upstream-version-is-even vala gobject-introspection gettext
-- 
2.20.1


