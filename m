Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id C25777E9B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 16:08:02 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id a21so2933904ljh.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 09:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=AbHjwaUEkKDqfX/lhW5DEj/W2VvKYJew7dNqrnDTF5Y=;
	b=yxNTK2ryqO5ureDDj9SA2bcU+H/bN2DwByfryeigcoPyxHqMDYEeJrJndyasUVdJFO
	hDdXIK1nQ/teLBv9g+ASe4zLsHiDYdZfGan8kVNaY54hl5oDXRKOkrhf4b/n0HNstvVA
	lEQOhXpt2kGFby2vGjJ13RhXrQkTnkGGEMURXNNWK/3g7SK6M6+MaTqKI1im/eh9SWuH
	VXbtHG0cFjC1BfQQKpJtsy2QkRtb2mh8xzeD7y45/W2rpgpSgApAt2yMATZN+NHykKqY
	0hBTLtfZvaNhMqdZhEDDwcgIpOFUuVViIPD6nDZRkmcu2osY+L4b7t72Gl87KhKOObuW
	asUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AbHjwaUEkKDqfX/lhW5DEj/W2VvKYJew7dNqrnDTF5Y=;
	b=TQjQWeZADJFmhtrZWj7obcW1OAcMMzAnQgPW5z5Ikv/+7DjZ9uDGgCsdkHnfTwdO/F
	zlU2pLAH+nzrqa+CFFZ7WMsvXseSzJ6vynbZs19mA4jSSZuT3jWoU/HVmMLpju1qeS9/
	5Jz8LxeJk6AXb7PqzEBcc4EvxcfvNqT4JtTm4ek4hOn+g2AFjc84cSHlTaep6hZwVnAd
	12kiZF7ZT5gPl4+qDZXBIp9cygzQUZoP+IuCAq6XkxcQyfxQzEgwq/B4kKhnLsM7fB6S
	ibCIEpdCYjeOXZnbF95lEama5NJ9+2I9ENMpeCZK2hGOTKVlztKvQudr3i/pa02MHkmF
	BiKA==
X-Gm-Message-State: APjAAAX/VkW96txuM0rvYlq3I1S05orkPPnohONIo7APeh+lPk1HxpVr
	CWmRQVBgTHj24XQxH+/CvCHkKhc+9x0=
X-Google-Smtp-Source: APXvYqzwNZle4Ps15Yw7xmZUw6HxpMpLZ/UpGBIscQ8KUC5ttR8/L6x+CqCA9JvpUEyViKWHv9W4DA==
X-Received: by 2002:a2e:9643:: with SMTP id z3mr3219201ljh.43.1561651683372;
	Thu, 27 Jun 2019 09:08:03 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id x19sm565925ljb.6.2019.06.27.09.08.02
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 09:08:02 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 18:08:00 +0200
Message-Id: <20190627160800.30924-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] eudev: update to 3.2.8
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
X-List-Received-Date: Thu, 27 Jun 2019 16:08:03 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-core/udev/{eudev_3.2.7.bb => eudev_3.2.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/udev/{eudev_3.2.7.bb => eudev_3.2.8.bb} (95%)

diff --git a/meta/recipes-core/udev/eudev_3.2.7.bb b/meta/recipes-core/udev/eudev_3.2.8.bb
similarity index 95%
rename from meta/recipes-core/udev/eudev_3.2.7.bb
rename to meta/recipes-core/udev/eudev_3.2.8.bb
index 1bea4ebd9f..eecf64e550 100644
--- a/meta/recipes-core/udev/eudev_3.2.7.bb
+++ b/meta/recipes-core/udev/eudev_3.2.8.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://dev.gentoo.org/~blueness/${BPN}/${BP}.tar.gz \
            file://udev.rules \
 "
 
-SRC_URI[md5sum] = "c75d99910c1791dd9430d26ab76059c0"
-SRC_URI[sha256sum] = "3004614bd253c1f98558460215027aaf60d7592c70be27fd384ec01db87bf062"
+SRC_URI[md5sum] = "ce166b3fdd910c2a4a840378f48fedaf"
+SRC_URI[sha256sum] = "61e4948e9e51271c3cce2bb5311a30b206dd03ef011062e6c627fb007e43f6b8"
 
 inherit autotools update-rc.d qemu pkgconfig distro_features_check
 
-- 
2.17.1


