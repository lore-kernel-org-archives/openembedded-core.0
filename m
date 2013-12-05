Return-Path: <andrei@gherzan.ro>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id EC9356DF64
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 09:01:57 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id e53so2033628eek.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2013 01:01:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=81J0HuSqeFrMAKix5Z9XsnYNbmDqR5t52AXM7//O7Xw=;
	b=SuWhtQQXvWYhewu1yOwZyHzmrZpmcYLFM52l+JPqJjCrNtwERVxFS/UGOsIXFiUdTD
	dBrlavCfGUr4GwYiPx71Qbi8hehaOMXlMx0agCK6tNSn+ARtwN/dTLu/G06GEel5v895
	B7MLgQtWBGVtJZjoNrdTs5KSiIEDmNrQ4l1u6ZFQsIg/K3gOylx8TLSXWGhMy+xJLjYF
	r8wmmoDXPGIz18swD3U+uv17NvBFjoU33cldmhi6cpL5xTcIloTRcbOOuJQSTZeoGpJy
	2kzdEGiJPJ+lUOTfNunm9PxUTo+C0JebTnH2WsCdkjt9p9TJufqpoVgNYUsa1zcQUPId
	knng==
X-Gm-Message-State: ALoCoQlK31KZa9c7UBlBkGVVYNeS8SRJlIuO9tvmVK+EBuxWcEuDj1KrDJ/s2aFxEgi4CqPaC5U5
X-Received: by 10.14.194.195 with SMTP id m43mr79818185een.13.1386234116619;
	Thu, 05 Dec 2013 01:01:56 -0800 (PST)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPSA id l4sm67794147een.13.2013.12.05.01.01.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Dec 2013 01:01:56 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2013 11:01:40 +0200
Message-Id: <1386234101-21411-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH V2][ 1/2] libav: Add v9.10
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
X-List-Received-Date: Thu, 05 Dec 2013 09:01:58 -0000

This version includes libavresample needed for packages like xbmc.
To use this version add:
PREFERRED_VERSION_libav = "9.10".
Removed git version as being an older version of a 9.X release.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../libav/{libav_git.bb => libav_9.10.bb}               | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)
 rename meta/recipes-multimedia/libav/{libav_git.bb => libav_9.10.bb} (65%)

diff --git a/meta/recipes-multimedia/libav/libav_git.bb b/meta/recipes-multimedia/libav/libav_9.10.bb
similarity index 65%
rename from meta/recipes-multimedia/libav/libav_git.bb
rename to meta/recipes-multimedia/libav/libav_9.10.bb
index 951baa9..a76cc9c 100644
--- a/meta/recipes-multimedia/libav/libav_git.bb
+++ b/meta/recipes-multimedia/libav/libav_9.10.bb
@@ -1,16 +1,13 @@
 require libav.inc
 
-LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
-                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
+SRC_URI = "http://libav.org/releases/libav-9.10.tar.xz"
 
-PV = "9.8+git${SRCPV}"
+SRC_URI[md5sum] = "4b49d1d8734815ca095bb0600d41c5cb"
+SRC_URI[sha256sum] = "83dbe640779da1c1e8d8836c99575f57f749d18407494ebca451578afee9300d"
 
 DEFAULT_PREFERENCE = "-1"
 
-SRCREV = "9aaca159bd220582c698f13d081a455f398c9975"
-SRC_URI = "git://git.libav.org/libav.git"
-
-S = "${WORKDIR}/git"
-
+LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
+                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
-- 
1.8.1.4


