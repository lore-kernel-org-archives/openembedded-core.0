Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 849227F880
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 19:46:45 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id l10so22980737wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 12:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=U7Bzvb5nVZd2VYJfSe6V7Ehcl2zx4y1pSgayyJ9Xbzk=;
	b=sDLreh+/3FpM58Rbf8RH9+NICXVLCDt/at6iAThfJlhgKACmx+XdnvhmrboxT12I8H
	bMRuEvW9JYnyGQ/CBeWHnkJbb5kHkgTK/LAmHxDGjYAGWIxt7COX7Z6vlA7RhW1QD9UT
	hz9Z7d6OwWoE4CvMPvmSgy3mc1RkLPHm76pMuZRr+nSeZ86vU63y46E5ebWWdBl4oyxE
	XWy3FxvR4CwhDRP6Azfd59CLhxUsDTK0/5gc7nPdhDfbEnWG2HYrtumgBmxpZHjRC5Ks
	SakJhfNM1v5Fw0BbArah6V6P9EvGGyw0VB+hNZ+En9lX7jYhFMDyIffe29HV3yjW9EbH
	1G5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=U7Bzvb5nVZd2VYJfSe6V7Ehcl2zx4y1pSgayyJ9Xbzk=;
	b=SoM0kHacLTDdBHov72TqUR9J9ej35I4Hb8/bl/OlKrCWc239/LDbHBmbEsRXlGlKrm
	Aizxm4TCNtoHenPZgi6+vm1KxlWMLQnpC7Pi1O1oCm6XSHRAYjjaBYTtA23puYL3/K4S
	ofAyvbgTyi+qU/WKubpupyE5vsIIu8V46Xuf02Ca2FQZ4L4qlLAeTQnn32L6yRc+X348
	3sPzBTwqtWWug6/ROIu1FgmRws6azO6lqauLEc3aQVS7MHTJTQX6htJ4tNk/mHzNOGnN
	5NSHGH92aj34I8rdT0LFRyom6OXAStskzo8f+sXZBs8zG2gPs76XqlphfKQPgFa/TjQQ
	HdvQ==
X-Gm-Message-State: APjAAAWOp+4VVc3oWf9j4qTLVcVIeoTBV+amoviN5Y7dgohbiuXvxU26
	+qxH2Wb9GCf34YWdcUQq70FhIN4K
X-Google-Smtp-Source: APXvYqw4qrBRLC1LVRVlZTXV4tDDK62rIMT92QiUJ02Ea71IuYUSwIG/fqmRoCSbC681NmsX63g2eQ==
X-Received: by 2002:adf:8103:: with SMTP id 3mr412279wrm.194.1571860005771;
	Wed, 23 Oct 2019 12:46:45 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F12334761F189209A1C71FB.dip0.t-ipconnect.de.
	[2003:f0:7f12:3347:61f1:8920:9a1c:71fb])
	by smtp.gmail.com with ESMTPSA id k3sm9919918wro.77.2019.10.23.12.46.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 23 Oct 2019 12:46:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org,
	ross.burton@intel.com
Date: Wed, 23 Oct 2019 21:46:36 +0200
Message-Id: <20191023194636.26879-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v3] gsettings-desktop-schemas: upgrade 3.32.0 -> 3.34.0
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
X-List-Received-Date: Wed, 23 Oct 2019 19:46:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Need it for gnome-settings-daemon 3.34:

| meson.build:91:0: ERROR: Invalid version of dependency, need 'gsettings-desktop-schemas' ['>= 3.33.0'] found '3.32.0'.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
v2: make x11 a required distro feature
v3: remove gcr from depends / undo v2
 ...-schemas_3.32.0.bb => gsettings-desktop-schemas_3.34.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_3.32.0.bb => gsettings-desktop-schemas_3.34.0.bb} (74%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.32.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.34.0.bb
similarity index 74%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.32.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.34.0.bb
index 859f70466b..a0ff1ab84e 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.32.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.34.0.bb
@@ -11,6 +11,6 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "0c2d468a482c12594757442c983aa8ea"
-SRC_URI[archive.sha256sum] = "2d59b4b3a548859dfae46314ee4666787a00d5c82db382e97df7aa9d0e310a35"
+SRC_URI[archive.md5sum] = "9759ef53fb2e53fc8d19190e58f2c332"
+SRC_URI[archive.sha256sum] = "288b04260f7040b0e004a8d59c773cfb4e32df4f1b4a0f9d705c51afccc95ead"
 SRC_URI += "file://0001-Do-not-skip-gir-installation-for-cross-compiling.patch"
-- 
2.21.0


