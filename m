Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4F12671BB9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 15:24:21 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id l10so21864097wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2019 07:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=h9hNakzFnzZGthZyYCqw/7TwP6bAP/6ovf9ucyRH2sQ=;
	b=moo8r25rcDHh2/FIgVzC+okZyOLCbtbyWZftF/GG/I7LH2qXLLz5hBAyQMJjmNxGkU
	D48R3ydzG6h2aWpZ7kHzJlCB+YRbnVScjGAotrrLkbV+hucieWPUpQqfNJ0KGNep4r9s
	GqaBPpGMRpHWW1nvk7i6JnqxZI/gt7x6iklXCYXXk5c5tUzwWQxtmABSb5S9FUeVWjmk
	jAPT3C84mr+x6o9qI1n5XjpCwm2UcniwvEzwFLm7bePutrnYHWXUH9/gOJuMDES+h9DU
	37WKYf3O02o00anVySQS5uARDZtG2ZXeM3VDs0L5rYAf1JA6blSaDc739+Isse2yYF45
	rfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=h9hNakzFnzZGthZyYCqw/7TwP6bAP/6ovf9ucyRH2sQ=;
	b=nLYQYgNRZhamtnSVJBLe9NBL6mY5dx4tZHQGq7QIw+ZLGyVfZFkYk5k6HE6LUm9ngj
	ZoUYnfMXDxrgUISmBFchcBz8DMkO7fPSLJw5SCQYKrHxkHVlSJvnC8sRwvXaE2F8H5dq
	dw49F3YqMC5rqPxdJ+DLQyNyXJbPN6FVvWD1UbDHptSC6niC9XlKHy/m81EGDxuYJ+bH
	U/MgPRyseaX7bF1oIXkznNqqZpLftIZgCTqT2p3FszD+s7laHMUENT/9k1jp14aosWcY
	OnrviyqydFBbxr4QSMDcFIS4BeYC9ZBJp5FIpbW0C97KcLO8YKwDbXHjAODrzsvqZ3Vj
	lGcw==
X-Gm-Message-State: APjAAAXAjZoTszJ5CL6tJMWpjGi4blny3G9O5Lu8lyuKybEaKALzdfGA
	kQ4FzcYY55kNQPHq+sjX8Mlpz7xF5sg=
X-Google-Smtp-Source: APXvYqxVFcBdFTFrN8+ud8WNCeZKOF5I5EdsEid7uOqtEW4RUvUpeGSKgUsv3sk9RghVcfTZllkkPg==
X-Received: by 2002:a5d:414a:: with SMTP id c10mr12053153wrq.100.1572967461635;
	Tue, 05 Nov 2019 07:24:21 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z14sm9569627wrl.60.2019.11.05.07.24.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 05 Nov 2019 07:24:20 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 15:24:17 +0000
Message-Id: <20191105152418.24717-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] libsoup: set CVE_PRODUCT
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
X-List-Received-Date: Tue, 05 Nov 2019 15:24:21 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
index 357f2fd3db9..3a735cf27a8 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
@@ -15,6 +15,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
 SRC_URI[md5sum] = "66c2ae89d6031b01337d78a2c57c75d5"
 SRC_URI[sha256sum] = "bd2ea602eba642509672812f3c99b77cbec2f3de02ba1cc8cb7206bf7de0ae2a"
 
+CVE_PRODUCT = "libsoup"
+
 S = "${WORKDIR}/libsoup-${PV}"
 
 inherit meson gettext pkgconfig upstream-version-is-even gobject-introspection gtk-doc
-- 
2.20.1


