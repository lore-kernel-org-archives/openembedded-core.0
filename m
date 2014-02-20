Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4EF896EE66
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 23:08:55 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id hi5so305147wib.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 15:08:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JePRJPsZVoKCsD+N2Ci/7bLrzDLM+vdt8iZMoZFzLaM=;
	b=howyaf5lJkpuH3gcOxsInVmHhL7t9g+hDu5Hgwt25BmYaTLJKgwS7epjkv5Kee5mnC
	7DeLmNfC1T10b5gXCbhKAYV8U4tkSHXVXvrbgbOwa70dYbeqPlKa2pXCK+WEExgUA9V5
	1lq94JxiK1oXkte95I+ej6OTj0kz+4kGrqxfuPk2RS1W1eH5z4lp+mpuXOqSIh/UtJav
	Q/M6xV4xWCnfy6uf7cEyHs/5EsuG4GM8bVXEAMps6mQjnU0K5euTdJIrbwYDWUZl25l/
	JE0CdYhe0Ve19vPLzL9+tubVe/GY66VFlFUJzLHix1IdHDawW518LE9boF/Oijffpkte
	aI0g==
X-Gm-Message-State: ALoCoQllPm5zIMIEVV6q9YGPmgeR0zXv3WTI0Kf8hF7BfPRt9yry6MvX1dfp+IVVukA1Y41nHnUY
X-Received: by 10.180.188.66 with SMTP id fy2mr544368wic.45.1392937735647;
	Thu, 20 Feb 2014 15:08:55 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fm3sm2401669wib.8.2014.02.20.15.08.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Feb 2014 15:08:54 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2014 23:08:51 +0000
Message-Id: <1392937731-754-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libglade: don't use gnome.bbclass
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
X-List-Received-Date: Thu, 20 Feb 2014 23:08:57 -0000

gnome.bbclass pulls in more functionality than this recipe needs (icon cache,
MIME, GConf), so instead just use gnomebase.bbclass.

[ YOCTO #5842 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/libglade/libglade_2.6.4.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libglade/libglade_2.6.4.bb b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
index 72f4c56..681b856 100644
--- a/meta/recipes-gnome/libglade/libglade_2.6.4.bb
+++ b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
@@ -11,7 +11,7 @@ SECTION = "libs"
 PR = "r5"
 DEPENDS = "zlib gdk-pixbuf gtk+"
 
-inherit autotools pkgconfig gnome gtk-doc
+inherit autotools pkgconfig gnomebase gtk-doc
 
 SRC_URI += "file://glade-cruft.patch file://no-xml2.patch file://python_environment.patch"
 
-- 
1.7.10.4


