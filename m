Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 75EB96144F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 20:47:07 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id u12so7577355pgb.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 12:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YiwghgX/I+CIzOj9AdxJJeuoDmcYwx42JazA75GQJLA=;
	b=FWP+f7FUxNTccU053YUaXg41yp4hu7OkkzzspFgK8vMyfGsUOsPVQ/gYmLDnGMWQ8A
	6cJhARycuiOnl44rLyyW2t41dMYjvxDaUjbdtLQdq5ILhUd2eY931c/Y/Jv3EVmeTHLr
	2ir1PYj5ss3AHRhf6REehRsrQN07kPDBo3VJcU/RFDc/6iyxt686e5JLAqViSEPAqfgy
	v3l7dPChnEqkVmgzewa47OBj7lUuCdUCvYtSwKcV2nqKPKGyjBAHToTvRqWSl3TJEBaF
	KbX3LM1ijjDXz56x6e99RtYZeKulTSTzQCNBq+GfTGJXNs7qv8PzHcWOVSoQIrinQiA/
	MWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YiwghgX/I+CIzOj9AdxJJeuoDmcYwx42JazA75GQJLA=;
	b=Oc+eA4SL0CzLxXpjUKsxi4EwIOI0J6T5SaEfTwm1ZBuIWzBioXz9aP3qX9/FT5nc2E
	wk4Me+UlrcklDWlepi1HshpuZck7hmnU4x+nP3F8Yi3V53WMmH8TtnBcxCAkAqqZ9lEQ
	44rF+i4jlJsf89rHkfwWRF2RWQSTFYi/52j8r8Kp4x6mFr1D0l3Qd14NCCDiicfYuajC
	ksRKXh+f5qTcD0iG5zS5tzhpYz8WQFLfu8Zj/Fz96xfpJ5+GvIliHtEmGjJcIbsrVQnh
	zbPCGvK1Z6x3ZWvkTK5Z5hAL3iLDvAn6jZgU0aopTAFRLevtICnx8Qv116uNmT2eNj+v
	IhKA==
X-Gm-Message-State: APjAAAUcYY079sTiqs6kmvpUlqdlzHq03tJ6HmebTt5AhQ6KnRBhAAyx
	gBvbnKfh5xPIzOhYFfMosXg0MeHc1bA=
X-Google-Smtp-Source: APXvYqxUcLmHke8MMVzpYl+Ar4hL5/YbSDcJVrr5SL652Qql5TbyKnGgzhUwRYi8nDCBs+dMZ2T1IQ==
X-Received: by 2002:a63:d042:: with SMTP id s2mr14285977pgi.66.1581886028166; 
	Sun, 16 Feb 2020 12:47:08 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	m12sm13877924pfh.37.2020.02.16.12.47.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 12:47:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2020 12:47:06 -0800
Message-Id: <20200216204708.7179-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200216204708.7179-1-raj.khem@gmail.com>
References: <20200216204708.7179-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
Subject: [meta-gnome][PATCH 5/7] sysprof: Inherit mime and mime-xdg
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
X-List-Received-Date: Sun, 16 Feb 2020 20:47:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use += for depends to not override prior ones

Fixes
sysprof-3.34.1: package contains mime types but does not inhert mime: sysprof path '/work/aarch64-yoe-linux/sysprof/3.34.1-r0/packages-split/sysprof/usr/share/mime/packages/sysprof-mime.xml' [mime]
sysprof-3.34.1: package contains desktop file with key 'MimeType' but does not inhert mime-xdg: sysprof path '/work/aarch64-yoe-linux/sysprof/3.34.1-r0/packages-split/sysprof/usr/share/applications/org.gnome.Sysprof3.desktop' [mime-xdg]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
index 1e530efb17..ad69ab68c3 100644
--- a/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
+++ b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://src/sysprof/sysprof-application.c;endline=17;md5=a3de8df3b0f8876dd01e1388d2d4b607"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase gettext systemd upstream-version-is-even gsettings
+inherit gnomebase gettext systemd upstream-version-is-even gsettings mime mime-xdg
 
-DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
+DEPENDS += "glib-2.0 libxml2-native glib-2.0-native"
 
 SRC_URI[archive.md5sum] = "cc32455277b31afb1965d627ae3e3629"
 SRC_URI[archive.sha256sum] = "844bbb8d8b65071b3bca96f8e921319ceef81f2d2c51fcc9da63a4b355c893d0"
-- 
2.25.0


