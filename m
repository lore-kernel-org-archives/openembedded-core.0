Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 007E661A0C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 20:32:07 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id x3so2739258wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2020 12:32:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5pynMjU5sUUTeCyHzIzoq/J0iW6t2Mn1KhWYs3aOj08=;
	b=JCqms/gu9CM7ZTmSVYybsGZe9AbBUoWxT/VYjstImL+4bFKRLGPHvyScq//N5ChpaW
	13oaEYms/h/ZWo2GU+/X6gqi/xl2oASACRdZ5rtOEq0mcbyAYlozqFxp2duC6WGXv8j/
	r3AJZ6bAYRKovcV7AdLu9mc/+RtnAh+XHMbte9y/7tVgkGu9fCL8hRwhHTLoh25ESv5Q
	UAzecWh4LWK3551qjz+G/dJ0uTz/YZ7C35U5S+x0WVtdP3BUlQo+rvI70yYtBJYSCoi9
	om88prWoqgYu+VRjkrOeAkxNiCBG4dhD9g36VlZP4j+PMVJyYbEe29rJHrikQRfDsqx7
	FLJw==
X-Gm-Message-State: ANhLgQ01JkofCC9wdkuGB8dgPKGCq2Olfct2YP/YRWvFbuRglp3iUV7E
	Xddmd27RezWehHHqP58qx0N0Q7Qc
X-Google-Smtp-Source: ADFU+vvj3GhdMc9jUnndVZ7OYLE/O+Pvxuetzve9ZoelmMVFzo3naxLQwI+zSkyZ9yZ4YebBSbL1Pg==
X-Received: by 2002:a1c:5585:: with SMTP id j127mr539734wmb.35.1583440328405; 
	Thu, 05 Mar 2020 12:32:08 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	e22sm11536936wme.45.2020.03.05.12.32.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Mar 2020 12:32:07 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Mar 2020 20:32:07 +0000
Message-Id: <20200305203207.20498-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [PATCH][master-next] linux-firmware: also install / package all license files
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
X-List-Received-Date: Thu, 05 Mar 2020 20:32:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This doesn't happen with make install, hence all the -license packages
are missing, since they'd otherwise be empty.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
index f7198cb56a..6039dc9d71 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
@@ -209,6 +209,7 @@ do_compile() {
 
 do_install() {
         oe_runmake 'DESTDIR=${D}' install
+        cp GPL-2 LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware/
 }
 
 
-- 
2.23.0.rc1


