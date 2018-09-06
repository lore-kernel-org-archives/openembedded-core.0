Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id AA248795F4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:40:41 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id y20-v6so8517322edq.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VzAyQk3F2g8Nrerx4XAcH38WL8Y9IyBsMVtyJa8k0tY=;
	b=FTSAt3iP6k083gpQCgf9KXaUm7OvXNUsxyBg6H4nfaMvH3PKGBXi8wPv/G10jQzTXP
	soQoRrTUqmYSUTZGumA9VGA7hNFnqizRIurcLcv4iQ38eF7K8JDbJ8vBJw0OUYYz1rJG
	9qHiby4vj4DuDHYDMD4rUeTeKplHhs+awnNALwYlxhRAPZnlXHGB904PxfRZ1WEu1D2N
	WaQofnygVn/wpfR++ggPZPhuCB9NzOfODVJHeDq3NjvCFxLULrveImjkTGFDwUtnK8ic
	r1MFRg7W5HSDs6kfzI24f0teTob9UXiSVxQ7WA01phOTZ0ahPRshaDHYBMxyqTo8chMJ
	slXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VzAyQk3F2g8Nrerx4XAcH38WL8Y9IyBsMVtyJa8k0tY=;
	b=B5lbIGUqFT0YTqAQcAOeHuHL7U95Xhpa0JxUq6WGt817AubmRg4Tb7b1dP25vR6YNa
	IDo+U37591v1KpZvjg1DZSMyJ46ZDzKCT7Uez4cOhATPAfnKP9IWR4m2HFx4l21xPxJr
	+/N39gQ4IOyvbin1rsnfQ+BM9f3A4YJECkRvA1eG4EkZoyB7veCKzCWMJstJqlKvdbJK
	xQByp7XSBZWOhUfw6xTKQwovLFfXOGEYH1R2oevqRJmHiWf6bRnikuZ1E7brbrDc31xH
	0SeOmASZf1h8pbK3MVPiKSPS/Cq0FxyZDZ2mVAjq/qZNRFOt4HyF7EYooZOaNZaE6fFj
	d1mA==
X-Gm-Message-State: APzg51AMfRNwmJ7wFqI+mawrlesBY0ss1dJ9fSk8MaL/gQF/Rjjvc9fN
	9cwCkztWY62GzSZXXAT/n/Vud109xR8=
X-Google-Smtp-Source: ANB0VdZzloWbdkQDi6tS0zNoDevUypaagN8+SnzrLYG2rpZuFQUraHaGJ3J3xX+pYv0MNLdK4/7gmQ==
X-Received: by 2002:a50:ed1a:: with SMTP id
	j26-v6mr2811918eds.29.1536230442262; 
	Thu, 06 Sep 2018 03:40:42 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	k28-v6sm2256506ede.11.2018.09.06.03.40.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:40:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:40:17 +0200
Message-Id: <1536230436-30342-2-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
References: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 02/21] sysprof: update to 3.30.0
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
X-List-Received-Date: Thu, 06 Sep 2018 10:40:42 -0000

From: Alexander Kanavin <alexander.kanavin@linux.intel.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-not-build-anything-in-help-as-it-requires-itstool.patch | 13 +++++++------
 .../sysprof/{sysprof_3.26.1.bb => sysprof_3.30.0.bb}        |  5 +++--
 2 files changed, 10 insertions(+), 8 deletions(-)
 rename meta/recipes-kernel/sysprof/{sysprof_3.26.1.bb => sysprof_3.30.0.bb} (86%)

diff --git a/meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch b/meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
index e28fdca..ade51cf 100644
--- a/meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
+++ b/meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
@@ -1,26 +1,27 @@
-From c2495a4c042e6a675da69bab20cc3669391e8e2a Mon Sep 17 00:00:00 2001
+From d332b480257aa98b63d39c3c94896a111536f937 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 Aug 2017 18:38:26 +0300
-Subject: [PATCH 1/2] Do not build anything in help/ as it requires itstool.
+Subject: [PATCH 2/2] Do not build anything in help/ as it requires itstool.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  meson.build | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 4ac3934..8c4369a 100644
+index 3986273..ae2f65e 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -116,7 +116,6 @@ subdir('tools')
+@@ -164,7 +164,6 @@ subdir('tools')
  subdir('tests')
  
  subdir('data')
 -subdir('help')
  subdir('po')
  
- meson.add_install_script('build-aux/meson_post_install.sh')
+ meson.add_install_script('build-aux/meson/post_install.sh')
 -- 
-2.14.1
+2.7.4
 
diff --git a/meta/recipes-kernel/sysprof/sysprof_3.26.1.bb b/meta/recipes-kernel/sysprof/sysprof_3.30.0.bb
similarity index 86%
rename from meta/recipes-kernel/sysprof/sysprof_3.26.1.bb
rename to meta/recipes-kernel/sysprof/sysprof_3.30.0.bb
index 9fb4e57..4f1b750 100644
--- a/meta/recipes-kernel/sysprof/sysprof_3.26.1.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_3.30.0.bb
@@ -9,8 +9,8 @@ inherit gnomebase gettext systemd upstream-version-is-even
 
 DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
 
-SRC_URI[archive.md5sum] = "6f9f947960ba79bb1269d8ee49b7db78"
-SRC_URI[archive.sha256sum] = "d8b9d5c2246696e4a3776a312731dc7c014fbd33478bb14d5512c6f1f35a3b11"
+SRC_URI[archive.md5sum] = "ae896a8a2364e18c07fafa9573202f59"
+SRC_URI[archive.sha256sum] = "29cd2c4be277f00698dce48259219557c4fddc2c01254b8fac95900a8c663f63"
 SRC_URI += " \
            file://define-NT_GNU_BUILD_ID.patch \
            file://0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch \
@@ -29,4 +29,5 @@ SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'sysprofd', 'sysp
 FILES_${PN} += " \
                ${datadir}/dbus-1/system-services \
                ${datadir}/dbus-1/system.d \
+               ${datadir}/metainfo \
                "
-- 
2.7.4


