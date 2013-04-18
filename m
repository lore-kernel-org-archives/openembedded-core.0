Received: from mail-we0-f181.google.com ([74.125.82.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1USpBb-0007dr-Nq
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 15:47:40 +0200
Received: by mail-we0-f181.google.com with SMTP id r6so2279860wey.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2013 06:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=BbS1eG6gSwNjfl1C7ps1zRNqAfWDbGs5DvGaOZHSDXE=;
	b=eskmlwLT80fVtcIYdR4dSvl7RcKN4LyRujT5lfPe8w3sCYKQHUbGANx/vWyDZ/x9Gt
	roGmb/UW4Y5i2/yGZKL1WoolWPZh+o/LCCxAuOPpN1N8fm1Cj7xpgQGo2cFAkqZ89i8V
	Wb0qogBYlx1xoVRgee6HlzhJkXpY2f55OjNblrtyinqxSad2vKWDxU98g3NPEP3L+tPj
	pdp4eylqICdY3nkArA915jwLbPgUtDgA283SS3h4S7i9YKMmoGSgh6ykTawvMVvpaP0u
	3R84cknPuslPJsZOwUL99PEMFXGkZqcHYsaHMuGD8S6P8MHAV2w2f/qCBENwmlmim4xH
	sEkA==
X-Received: by 10.181.12.5 with SMTP id em5mr18231649wid.24.1366291806428;
	Thu, 18 Apr 2013 06:30:06 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bq19sm16160043wib.7.2013.04.18.06.30.04
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 06:30:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2013 14:27:13 +0100
Message-Id: <1366291633-16625-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnpf1+Wf89UkNlCnHcvowuSUzvIyI91Rg2HzOskWDhLJ4eG1L5+Arw6n9l4HA4jEXE/D95m
Subject: [PATCH] udev: disable systemd support
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
X-List-Received-Date: Thu, 18 Apr 2013 13:47:40 -0000

If we want systemd support we use systemd's udev, so disable systemd
support in this udev to avoid packaging the unit files.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/udev/udev.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 587bc94..7221a49 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -43,6 +43,7 @@ EXTRA_OECONF = "--disable-introspection \
                 --libexecdir=${nonarch_base_libdir} \
                 --with-rootlibdir=${base_libdir} \
                 --with-rootprefix= \
+                --without-systemdsystemunitdir \
                "
 
 PACKAGES =+ "udev-utils udev-cache"
-- 
1.7.10.4



