Received: from mail-wi0-f174.google.com ([209.85.212.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UV2ed-0003iC-6N
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 18:34:47 +0200
Received: by mail-wi0-f174.google.com with SMTP id m6so7595321wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2013 09:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=9BABKUXB4a+Npti1VFx6iwiS+qTOGtEHd+YjybiYpf0=;
	b=jMC5n+05GzAXEs/T3aQ4Up1pcejX1y1RbetjTNVqau+MiNHEJxuzXRX7hRyZ15wn3R
	Bp95vx+8XT6ZGxqsGbVdwZWTDbMBwh5TWvJ0aq3OSD6SVghttCikECoywnYxgjql2cr9
	c+pI3YojPN/zftHHf0gB+zIwsDTKlLw1J4PjIwqz0GIcsLYxu5Uod5/qycW2/nX48pNa
	UsUxzH6gPpkdPoujljdt6Yhn23SZ1PCK44jjKIdgB3O1qj8WVAsDuZZF/i58xQbQxqov
	/VpZ68cEWA3McObbHPQd/4MP0YUet4F1uz8wj41NJM1nY2aTw+Wi5gzeTRDHeBJoa1Wd
	uuMQ==
X-Received: by 10.194.63.109 with SMTP id f13mr69702440wjs.11.1366820224906;
	Wed, 24 Apr 2013 09:17:04 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ge7sm32516374wic.0.2013.04.24.09.17.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Apr 2013 09:17:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 17:14:08 +0100
Message-Id: <1366820048-23778-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmAGNIakSNtIUFpsFQzil+cfFcjeOuZHRPn4FHOdwk6GbaYhRQ8lMVilMwfZsRN5tTSuJFs
Subject: [PATCH] webkit-gtk: remove gnome-keyring dependency
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
X-List-Received-Date: Wed, 24 Apr 2013 16:34:54 -0000

The direct use of gnome-keyring was removed back in 1.1.13, so remove the
dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
index 377b06c..cb192ff 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
@@ -13,7 +13,7 @@ PR = "r1"
 ICU_LIB = "icu"
 ICU_LIB_powerpc = "pango"
 
-DEPENDS = "zlib enchant gnome-keyring libsoup-2.4 curl libxml2 cairo libxslt libxt libidn gnutls \
+DEPENDS = "zlib enchant libsoup-2.4 curl libxml2 cairo libxslt libxt libidn gnutls \
            gtk+ gstreamer gst-plugins-base flex-native gperf-native perl-native-runtime sqlite3 ${ICU_LIB}"
 DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}"
 
-- 
1.7.10.4



