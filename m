Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Te5tw-0002jX-Go
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 16:19:45 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so5640527eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 07:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=QrMoIU0xtfhUmRR2SiCJxb38/FCyST/eDcbYBfk/aVI=;
	b=xggGNHofhlf/H4kziCvSUPKb1fyQHfiBf7NvxTUfQRiaXTHJ5DkwTNEEn27o9yW9cC
	Ay9s5VfM67Swyn7QIztxu0vWX83UVDsAsLZWRGTY2F11KzHCHAacFM6Gl/rwTT6AtjdV
	+x7DWWpQ8U/A4kX4T/Vg+u1Cjgy4lXO1J1EdGlJMkjeFSkb/O7+4Hbu+htc25P8wxN0k
	jwX2z6H2TorAdMSlEJk9+hfVo56UguC+Mt8q68xO+WhN5Z2zkzGE7zpZUpbZLbAHOGIm
	5KpAkDiixM/uxQnYRlh8fcnG8d9vYlun23OpxLBik/wMTeugQqRwGRfUv/HwnzIBNImI
	HyOA==
Received: by 10.14.199.134 with SMTP id x6mr83164258een.31.1354201528704;
	Thu, 29 Nov 2012 07:05:28 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 46sm4110186eeg.4.2012.11.29.07.05.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Nov 2012 07:05:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2012 16:05:23 +0100
Message-Id: <1354201523-18600-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH] libcgroup: fix INSANE_SKIP
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2012 15:19:45 -0000

* that .so file is in cgroups-pam-plugin not PN

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/libcgroup/libcgroup_0.37.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb b/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
index 3ef1dad..e74f831 100644
--- a/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-PR = "r1"
+PR = "r2"
 
 inherit autotools pkgconfig
 
@@ -24,4 +24,4 @@ FILES_${PN}-dbg += "${base_libdir}/security/.debug"
 FILES_${PN}-dev += "${base_libdir}/security/*.la"
 
 # We really need the symlink so :(
-INSANE_SKIP_${PN} = "dev-so"
+INSANE_SKIP_cgroups-pam-plugin = "dev-so"
-- 
1.8.0



