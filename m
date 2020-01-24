Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id EAFF47FD6C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 15:48:12 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id u131so1258108pgc.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 07:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=q0NOqvHsJn0zYcGQtzo6pPrSB6fyQScW6UAKrDIMvV8=;
	b=MirDwXJHXYkun3kp9MYODKCm5wGN+qZH8orHYesccXmmzLVjimP8v4X1TxAX7xvUU3
	NsIcggMIF11v0zLuO7RofdFDaAzXFYj5ZfY0hq7mKM1dSRw/8+lITAsBvoDc8PW1UWG/
	eJY3Vav9MJGRAawHBBEt3Gd0Pwt1d/94elo7zAsGCDyoJjuEtEYRTg8BzSK5JP7Q3XUg
	c6/khJy0E6PpUazD52V9W9eDohAn6ER6nI3UN2iZyTcfh62xaaXQ8C+YHZitizdAj3rZ
	LtyqOfDn3MjPvWJW2t4IiJA/OuybZ9Q9dJPgGiqKbI98LnPwmYcYXjdJd9ZLb5s4itBO
	TiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=q0NOqvHsJn0zYcGQtzo6pPrSB6fyQScW6UAKrDIMvV8=;
	b=DwuDZFodWr3cC53IlFHw3y9ghU3yrLXA0g8esMnHbDQZQ2kj9aX3wal1N9WDHBu6YD
	yxMiC+06mEAnaOZoGkKf8BASJc8BurNB1zMLCMhtou+4kks9GKbuyuS5Xhj3Aoe2rP/p
	cUut63cJZPrhe6TkO3d8dgNAFPSoMxS2jK4XPN8XYPyKrGDGXHzJngcE8QjYzgyT00E4
	3T2oahFcTR9PIzgRvDrlicOa9IHm0tdFmkUQbshWTb4jfS43QpVriKT8yi5Vz1EayUJy
	fyCieHPjR9kWJWzejjICUh+MsOoXuaky9yrTn6385FMo5R50qabGOPn1jqWhXnGdrbH+
	2nhA==
X-Gm-Message-State: APjAAAVuoF2185mcs+w84N8QJxCvljXiMVs9bYm++PREsoTVsv632FO1
	+ZDffTTHRfmAQTvD0PtzuQ7qus+f1is=
X-Google-Smtp-Source: APXvYqzDy+1KJF93u5g5j9u9ui4p9Cz1ZZqSay4kYliFMdP6kjPnmrpslvnbzRjiLR65zm/Zi2uSKA==
X-Received: by 2002:a63:d108:: with SMTP id k8mr4638092pgg.434.1579880893652; 
	Fri, 24 Jan 2020 07:48:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net
	(c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
	by smtp.gmail.com with ESMTPSA id
	133sm6729608pfy.14.2020.01.24.07.48.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 24 Jan 2020 07:48:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jan 2020 07:48:10 -0800
Message-Id: <20200124154810.1760420-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200124154810.1760420-1-raj.khem@gmail.com>
References: <20200124154810.1760420-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 6/6] konkretcmpi: Depend on python3 during build
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
X-List-Received-Date: Fri, 24 Jan 2020 15:48:13 -0000
Content-Transfer-Encoding: 8bit

Fix packaging to match py3 module install dir

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
index f62cf6ba65..e6d5663f85 100644
--- a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
+++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
@@ -6,7 +6,7 @@ implementations for many of the provider operations."
 HOMEPAGE = "https://github.com/rnovacek/konkretcmpi"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f673270bfc350d9ce1efc8724c6c1873"
-DEPENDS_append_class-target = " swig-native sblim-cmpi-devel python"
+DEPENDS_append_class-target = " swig-native sblim-cmpi-devel python3"
 DEPENDS_append_class-native = " cmpi-bindings-native"
 
 SRC_URI = "git://github.com/rnovacek/konkretcmpi.git \
@@ -34,6 +34,6 @@ PACKAGES =+ "${PN}-python"
 
 RPROVIDES_${PN}-dbg += "${PN}-python-dbg"
 
-FILES_${PN}-python = "${libdir}/python2.7/site-packages/konkretmof.py* ${libdir}/python2.7/site-packages/_konkretmof.so"
+FILES_${PN}-python = "${libdir}/python*/site-packages/konkretmof.py* ${libdir}/python*/site-packages/_konkretmof.so"
 
 BBCLASSEXTEND = "native"
-- 
2.25.0


