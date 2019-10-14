Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6012A6D545
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 21:52:08 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id z9so21336791wrl.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 14:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iNdyqmdQJnDF1yb8uDxe9NGuYWRhU3xTD0XSA+HqeFo=;
	b=T0z0fDUREuTjupHBFgEtI8RmF0rifbmM6pMFgE42pu9ieFskUqJ4ls6dXBua7KNAxF
	zDL+MMiZJSOW7p11QediRQhDSf0R6VGJ4f+rldj1de5vg5Fg4KqwJOukzSkha1NTFz5z
	eETsghpCX929U7QjFrsErz0FqYL9p22lhV9My8eI0xSWI1rxdnScbbIpvp/gYHBs0Q33
	cFdJlKuM/YzBbAAHIki3U9syY4nb2aKeJeoUo+MemBjGiF7j6NBzKeqbTZ+geMCTvOAE
	tUF4wkcy4gIwr7TL3Izgf0LzgoQZCs8tZYpDbffQ0bTMyVEIl6nzmntFO+czRFMq7Faa
	afMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iNdyqmdQJnDF1yb8uDxe9NGuYWRhU3xTD0XSA+HqeFo=;
	b=K6SSqHFXXjUppU0er0UuJqP6jmPCEtEjemj32mvA7u+fPtrkDiOmBNniBgLXXvGKS0
	zccROXFcOrsbyYd1gDM162cGUBq7BjrRizqOZ0FkbjeLtONuB42CwY+9Jf/Q0OTT64u3
	hyAk641Ezz0sbGz21db/33f861Wq48pQXlAX0Iueei/tZzvUngJ8D69W9Ft9UoeSfhBZ
	K5Zj0NsyFi5pdo1x9W39+1rmUcXgvHFt5r2Xsuae4Ki6ak/f9r4CtDrfQ1OLMxcuT2Me
	nwWw8u9iWvO7rIOKHDfrQb27RiFUlwBI1+68cdqncHYqlSK6qvZY9f61pc7UFxxQtNpF
	6+/Q==
X-Gm-Message-State: APjAAAUDqDyIv244UcgDJlcqr1NzlwnyTWUM51aP7qwF62z9EtOnJGp+
	3/35+AeRC17kbghPTe4el7XgWbHm
X-Google-Smtp-Source: APXvYqzxhK/AdzRQ/JZMFcbIMrXw+FalzZi6AR+5AmWYuUllLbGHG5q67IARBh620mPnUN9hCrdLcg==
X-Received: by 2002:adf:e78c:: with SMTP id n12mr5128410wrm.351.1571089928883; 
	Mon, 14 Oct 2019 14:52:08 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F135A0825FC0019871DE783.dip0.t-ipconnect.de.
	[2003:f0:7f13:5a08:25fc:19:871d:e783])
	by smtp.gmail.com with ESMTPSA id g4sm23017531wrw.9.2019.10.14.14.52.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Oct 2019 14:52:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2019 23:51:59 +0200
Message-Id: <20191014215159.2763-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] gsettings-desktop-schemas: upgrade 3.32.0 -> 3.34.0
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
X-List-Received-Date: Mon, 14 Oct 2019 21:52:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Would need it for gnome-settings-daemon 3.34:

| meson.build:91:0: ERROR: Invalid version of dependency, need 'gsettings-desktop-schemas' ['>= 3.33.0'] found '3.32.0'.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...chemas_3.32.0.bb => gsettings-desktop-schemas_3.34.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_3.32.0.bb => gsettings-desktop-schemas_3.34.0.bb} (70%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.32.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.34.0.bb
similarity index 70%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.32.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.34.0.bb
index 859f70466b..0674448567 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.32.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.34.0.bb
@@ -5,12 +5,12 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS = "glib-2.0"
+DEPENDS = "glib-2.0 gcr"
 
 GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "0c2d468a482c12594757442c983aa8ea"
-SRC_URI[archive.sha256sum] = "2d59b4b3a548859dfae46314ee4666787a00d5c82db382e97df7aa9d0e310a35"
+SRC_URI[archive.md5sum] = "9759ef53fb2e53fc8d19190e58f2c332"
+SRC_URI[archive.sha256sum] = "288b04260f7040b0e004a8d59c773cfb4e32df4f1b4a0f9d705c51afccc95ead"
 SRC_URI += "file://0001-Do-not-skip-gir-installation-for-cross-compiling.patch"
-- 
2.21.0


