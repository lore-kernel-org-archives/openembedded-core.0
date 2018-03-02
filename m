Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 82AAD7880B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 04:49:25 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id a23so10564784qtn.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 20:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4z50Pyjg7Z2tIRzzqE7QcT/bc2dxATB1/klsG8EGS5U=;
	b=lbN2mHCSSLtEAC0YkdKC8TwAIv9ufl7vjWh3X7EH//zFWlCbRsYKRJ+FD60RzM+Fe2
	1sP3TmETwmI1sDTigiGD1REOK/gVELFb1RWphHmuKzZ6fjfGsrbljY9XENC2NVCzOTKe
	L9W5haRGOJJdTdIp8pRuqV5mZq0SSpzXk3xJzMaEVBB0+vq+qqaKzhL+bdpHaXPnWjbw
	WzA1qHIWJB+nb9PGHyu8cXjW5G5jORKsRpZvk+8iRybsENEp6D5h9HGBh4jOO1DHVWvd
	7Wasvllu2zUI+8qHUAi5xzgIoiEIsd7T6yG3iQ2F8M9n+sFdk3Tu5DAB+Je20HUVKUuu
	jHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4z50Pyjg7Z2tIRzzqE7QcT/bc2dxATB1/klsG8EGS5U=;
	b=efXfb/SRVDw7i7r/ReZIIvXznO+5Vn5Zk0tryrNU8FKrcOdaelOEKLjPfgEPqoiOWD
	xfouUU2LxcNZB1HkFeKvAqW7c87TG3gmW8KogqBSzCOlXgQ5WVTiNNuM1WqKNc7wjXjH
	tzxs6wU5+IPh5A/rZ4tN+EmLfIRe8TpK9GqqkFQMUx7PnxeBPaMT9FfkK9cPov696mPa
	YkKNiWD48bp4YUjcm3tYWxL7vRVKmoyeZe1FCVrN66MRY+7gcmcUMmet/WFgcJeV5AN8
	MUBzgX1rzd8CTGEC5VWdvXtfPNFmR+ra27j/uKcPcEtgzzIAzZRU8oBB/Dg5PSqH0dtf
	XaMA==
X-Gm-Message-State: AElRT7Gc17sIoxmvlJwtPa+PJ7cukxkrW/p93XIa74+m6Mav4rBvumfF
	n8nIk3KwxNWIHdYVLSRCpXlssYRS
X-Google-Smtp-Source: AG47ELtlgC96g93CSsmbqKMcaTE7gtSWduy2NVntyU44j8G3o4wfwa48+i7QlTGnEQCvawSXvspUJw==
X-Received: by 10.200.8.205 with SMTP id y13mr6918174qth.89.1519966166316;
	Thu, 01 Mar 2018 20:49:26 -0800 (PST)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236]) by smtp.gmail.com with ESMTPSA id
	e39sm4183296qtk.22.2018.03.01.20.49.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 20:49:25 -0800 (PST)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 23:48:08 -0500
Message-Id: <20180302044808.31177-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
Subject: [meta-oe][PATCH] python-matplotlib: Change download name
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
X-List-Received-Date: Fri, 02 Mar 2018 04:49:25 -0000

gflags: change download name.

Just having "v2.0.2.tar.gz" was causing problems with other
similarly misconfigured packages.
---
 meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb b/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb
index 5b1c3f05b..b7a3fcfc1 100644
--- a/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74"
 DEPENDS += "python-numpy freetype libpng python-dateutil python-pytz"
 RDEPENDS_${PN} = "python-core python-distutils python-numpy freetype libpng python-dateutil python-pytz"
 
-SRC_URI = "https://github.com/matplotlib/matplotlib/archive/v${PV}.tar.gz \
+SRC_URI = "https://github.com/matplotlib/matplotlib/archive/v${PV}.tar.gz;downloadfilename=${BP}-${PN}.tar.gz \
            file://fix_setupext.patch \
 "
 SRC_URI[md5sum] = "89717c1ef3c6fdcd6fb1f3b597a4858c"
-- 
2.11.0


