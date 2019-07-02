Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3B8D07CBE4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 20:41:10 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id v18so18332309ljh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2019 13:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=4Y8i4wNXEFv3NZ0UcHigKWM/+g3HCWi3fh3yMam3Imc=;
	b=VkYWKuIMKSapmDHXfaT9p43RfxgrK82KanRRVAKevWFFEeQNxmYBbv0AH4h6KQe+L0
	lJlfpqGKPnx/Ef6QEQqn7L79+ls+SNgtmpiuyKT79aQZUADQ55lYHa5YRdkLE5kLtGjX
	MRN9SvmuqEJumVsyg1BxnpJWh7HwA1CHK8aNdZyaKo/wreQ488zi5zU2Bq8BMJ7ZkMOW
	T0JDrt1wdETdcWSD5K4Aon564fr+rtGxR5jlzkDWE2sIoihznTOyKJc4nvYprIPOXc4D
	mkzS4SNPeg7WlKoRQ829XgggbRJGQhGqxSe1SPNtfCr9NUxfw8oK902EBPS1MUoi3zvb
	0wCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4Y8i4wNXEFv3NZ0UcHigKWM/+g3HCWi3fh3yMam3Imc=;
	b=uSa9uHC/X+VAQd4zlvGnb+YuXUdWGEbzCQzddhdJ66nK0Sf0E8iIi9x2cqK3QYxdgN
	bN72mBUMxSDkRgCM7Wbn8lgrA/Rzjm8/ABX0qLqum2SEYtb0GGnyebm97Ve2K6Dx0FDw
	JZUVjoiKhjdlxMX6rfGaN3e7KHZLNDgjp96UY4wFV7RYEmKxfaiJIzExLaV6z6vTXw0h
	S4lI0Op3h+NmTVVLakWcNb+lZBa2FaO17sS7YvcpwHhay+jTBwC7cumc2/2WkkKf3wYq
	otwAnB33kCFPKg3QefIpuSh6XDz4PBvRjsISLZeYFNsRJlb15O8cw/BYK3JD8GbwjbRY
	v43A==
X-Gm-Message-State: APjAAAWLRGgzYoQCnPKg1nlS+VmbSOd6pXEY62roSvhG0clBanzzbvQf
	BaIahAWMDmLng87amMJ61xtBiEyIpRI=
X-Google-Smtp-Source: APXvYqxULvZ1rFKnsdqBC+YPD0723V0eKs+iqXkfrdxpAMKapLhUiN5UzxCK0h240fDzdAZ9/w6bgg==
X-Received: by 2002:a2e:6c07:: with SMTP id h7mr18651272ljc.177.1562100070550; 
	Tue, 02 Jul 2019 13:41:10 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id n1sm18032lfk.19.2019.07.02.13.41.09
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 02 Jul 2019 13:41:10 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2019 22:41:05 +0200
Message-Id: <20190702204105.23706-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-mako: update to 1.0.13
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
X-List-Received-Date: Tue, 02 Jul 2019 20:41:10 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/python/python-mako.inc                  | 4 ++--
 .../python/{python3-mako_1.0.12.bb => python3-mako_1.0.13.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.0.12.bb => python3-mako_1.0.13.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-mako.inc b/meta/recipes-devtools/python/python-mako.inc
index 31be8f1d50..d71df956e8 100644
--- a/meta/recipes-devtools/python/python-mako.inc
+++ b/meta/recipes-devtools/python/python-mako.inc
@@ -8,8 +8,8 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi
 
-SRC_URI[md5sum] = "4a7aef27217a8e6c1a29447c9b1b00ab"
-SRC_URI[sha256sum] = "0cfa65de3a835e87eeca6ac856b3013aade55f49e32515f65d999f91a2324162"
+SRC_URI[md5sum] = "ad6c7dcb5d39c99f4fdf4fec892c5dee"
+SRC_URI[sha256sum] = "95ee720cc3453063788515d55bd7ce4a2a77b7b209e4ac70ec5c86091eb02541"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-netclient \
diff --git a/meta/recipes-devtools/python/python3-mako_1.0.12.bb b/meta/recipes-devtools/python/python3-mako_1.0.13.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-mako_1.0.12.bb
rename to meta/recipes-devtools/python/python3-mako_1.0.13.bb
-- 
2.17.1


