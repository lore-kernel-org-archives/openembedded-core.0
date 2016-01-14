Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id A365C731C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 20:58:33 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id q21so33905234iod.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qFqVE+egVQrS1yqkeURf77Eydd3oqq/9zHEZYMB2cKk=;
	b=sUghXRmuilcdwPHcqu17MD0DbsbpCpxPfUGchOosOMCtZ6SANJZghRKL4LWv6u7wyK
	TYtVIkVnDaiYrm+vL14zYSVeNyR8VOIvPRazZUOBG6dToa0DsfBExEwXpAVUX3mqOgrL
	5XMSBDkolcN2nWUD1e7TWTyjWdP6p5ziOxdHgGDzFfxplecjEr1N+hlk3CGESozLw/OC
	GTm0YQ/4BL3krDSSeLuJazDsJL50oMFKhInaSJk3V8viXlzQVVuwwbWe4fDKJUyqSIGF
	Gi51Bq7jl/pc7vfQKhhIaZqmzK0Y1qNgofdm/209m61DAiziDtDTY3tgnakQIlFVWafA
	dLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qFqVE+egVQrS1yqkeURf77Eydd3oqq/9zHEZYMB2cKk=;
	b=MFxl7/pYNg/Uqx3JEx5dgZAMUcSbFukq5Zbu0Dzh9TbcmFw4+FWaooo/TIkx+mqDgO
	oHd62B3hUVqjkZOnMddmqdzobHxcZbUrjlqJszODSVubuN9vc+WNLvu0QG6TeukfHoGM
	ucs+Y6OUJo3v6+4pAm+vsaI++DQdfkLEGzwfJZJzeQ1977oE7RKA9QI1FlPoEjFkLdKQ
	VHUH15rYrvq/6tkyBR9Sr9/dXuuob24BbhXiJKqVbfW5dt2iwepfVJQqg2LpaWfcM7HE
	aLdhGbNmpAP9SFLg1nJ2ei4uKPTtYKACSTsunFm3WoS0fl6vg/jkeMDLx+X0mRJoT3SZ
	ElLQ==
X-Gm-Message-State: ALoCoQmc4ZllOgF/doZPLtwVzycsynd0htmu6gkEmgrTbTQ/SAMgYQBX+vV56KMxP5cIwP+3mYDhTIf6np3GkNd8kmV5L8ibbA==
X-Received: by 10.107.11.68 with SMTP id v65mr6649983ioi.188.1452805114626;
	Thu, 14 Jan 2016 12:58:34 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	204sm3203278iob.44.2016.01.14.12.58.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jan 2016 12:58:34 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:56:32 -0600
Message-Id: <1452804997-20926-5-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1452804997-20926-1-git-send-email-george.mccollister@gmail.com>
References: <1452804997-20926-1-git-send-email-george.mccollister@gmail.com>
Subject: [RFC][PATCH 4/9] dbus-glib: use bash-completion.bbclass
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
X-List-Received-Date: Thu, 14 Jan 2016 20:58:33 -0000

Use bash-completion.bbclass to package bash completions.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/recipes-core/dbus/dbus-glib.inc | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/dbus-glib.inc
index f8c0ebe..4661e3a 100644
--- a/meta/recipes-core/dbus/dbus-glib.inc
+++ b/meta/recipes-core/dbus/dbus-glib.inc
@@ -15,7 +15,7 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.gz
            file://test-install-makefile.patch \
 "
 
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext bash-completion
 
 #default disable regression tests, some unit test code in non testing code
 #PACKAGECONFIG_pn-${PN} = "tests" enable regression tests local.conf
@@ -26,11 +26,10 @@ EXTRA_OECONF = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-in
                 --with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool"
 EXTRA_OECONF_class-native = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml"
 
-PACKAGES += "${PN}-bash-completion ${PN}-tests"
+PACKAGES += "${PN}-tests"
 
 FILES_${PN} = "${libdir}/lib*${SOLIBS}"
-FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d/dbus-bash-completion.sh \
-   ${libexecdir}/dbus-bash-completion-helper"
+FILES_${PN}-bash-completion += "${libexecdir}/dbus-bash-completion-helper"
 FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
 FILES_${PN}-dev += "${bindir}/dbus-binding-tool"
 
-- 
2.4.5


