Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id AE87D77115
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 19:55:13 +0000 (UTC)
Received: by wmec75 with SMTP id c75so122506490wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Nov 2015 11:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3fFAv44J5tRofrjW9QNLlYbwud08IICPy+1ZkA/8J/g=;
	b=bawxCQ2Fr1YEf9L3jEovMS0+FAx+BNq4JfZlv7pbnw04Uzp/np/zEHW1lygRX46W+c
	+fjz470u3zpxVLK7KsXNRtwA1wJdKvNZOa5H5Tzr6w+audk54BIQUBC5FXw+g3krqfHA
	UR3NVE1N0svrWbKSxP12AOn4ImHNrDKhDdAfVuasdq8AEyKxSZzmN5bdJ8oROYUN0aL0
	kDM/hhAFlywtSIAgz5cXXiCxM80erVz2kT8i4PveSq0o8bZQr2UREUOWxMWV/NY5oVVM
	o+kWWf37XNV0xV9ZFgq2rMpj9M14gEVaZR2Eg0JOI0hURlXSzpEhlxbUfVoUbqsFmW/S
	SdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3fFAv44J5tRofrjW9QNLlYbwud08IICPy+1ZkA/8J/g=;
	b=WDZHaWPGsfazNoF6XGAjhiRHk4eHOrb4WHrHyiSiW1n7K/+u3AaI5atkRd66Gj1ZDE
	aw4Wg2dG//fU87vitu7MWTiPVoqgD1YEaTh6NS+As/zji7EjazyBQ+05yiWacMmYW09v
	cl9O5tUkyAyIccvQfbzzrueeufYzdvFoHelLOl6QIJB+oIQBGw2/b2CXryXA7HQTxHVg
	PeGxbc2jH6MWER+0VgmO6g4B8t38yohzE5HTbQTh1cdUy4sw/9awXBNuxw/W1lTFAqB8
	vyg4TbtDdBiUF2Xtw184jlgYxC9VxRhl0T+VzRfs+t5LyjHFtR2SFdynUBYPSQAZkOAS
	Yw3g==
X-Gm-Message-State: ALoCoQky7/oHHx0UcKFUJMaTuUvfOMQDWqrVDPOPJ3I+MEV+qaEwueFxHiTfQDycr+iMvEo7s901
X-Received: by 10.28.92.16 with SMTP id q16mr30720687wmb.94.1446666913281;
	Wed, 04 Nov 2015 11:55:13 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id w9sm3206881wjf.20.2015.11.04.11.55.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Nov 2015 11:55:12 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Nov 2015 19:47:00 +0000
Message-Id: <1446666421-2549-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1446666421-2549-1-git-send-email-ross.burton@intel.com>
References: <1446666421-2549-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/4] gcr: remove Vala dependency
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
X-List-Received-Date: Wed, 04 Nov 2015 19:55:14 -0000

The Vala support in GCR requires gobject-introspection so even with the build
dependency on Vala it isn't enabled, so remove the build dependency and
explicitly disable Vala support.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gcr/gcr_3.16.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.16.0.bb b/meta/recipes-gnome/gcr/gcr_3.16.0.bb
index 057c815..cf4be84 100644
--- a/meta/recipes-gnome/gcr/gcr_3.16.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.16.0.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt vala"
+DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt"
 
 inherit autotools gnomebase gtk-icon-cache gtk-doc distro_features_check
 # depends on gtk+3
@@ -14,6 +14,8 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 SRC_URI[archive.md5sum] = "d5835680be0b6a838e02a528d5378d9c"
 SRC_URI[archive.sha256sum] = "ecfe8df41cc88158364bb15addc670b11e539fe844742983629ba2323888d075"
 
+EXTRA_OECONF = "--disable-vala"
+
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
     ${datadir}/gcr-3 \
-- 
2.1.4


