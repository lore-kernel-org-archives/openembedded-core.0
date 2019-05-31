Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0A9D07E5B6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 20:02:28 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d15so7138001qkl.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 13:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=DGMoLrG0YA23ESAMfjW1mLcXv9uIdlOm2O81Jv1hh0o=;
	b=cEbXMtH/lwLgu2KIo1vSse5eqfFJEvt+oRPqjflW4dT30d8QfPxRXTYwhZZ6GfHtIk
	6Q8KR01EhdI5Vvnnu4dM91qFrHR6zzdqOlLh60l35lOfSTi96Gz9AEo/G9Umt8/Uk032
	g1VgTBnYOVI5w24qm9wHzpsK+Ecnlq1jLEiusEjLSYrwmtOBTvQiWibR/pGSXOBlu9P3
	2Ns5TwUWH9aNfJpCPvkMVWEs2exzlz16MxgQvBn75h9kpSGgVzsXiL6wzQYAO20gszrl
	CFmJRrt+hF1POhNWfs0fuKur7dC0nNUXAKt/YD9s1/BY62P6x+JZ6BPJ/KT8n+c4owQl
	AuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=DGMoLrG0YA23ESAMfjW1mLcXv9uIdlOm2O81Jv1hh0o=;
	b=oEC/5JOjxKISTMQlEfJVKPA8QYfc1GShWU9zdLzhKBrS5wAXQurmREr/bRdnBjP1IC
	rG7baS4DSU5xucmOyciprGAKSmDDr3uygR9yfbdDj7lANa5TTk/ON3uok1XbK1Q/YV9j
	zw1od/GSR/n3JCf2ZUtBP0dcAMIIZkgRtF7i7i32unAJjB2VLUIfuqFdQuX6B7dOtvi1
	uRy6CjdoAVcudjgdvh0BCUWwMpChrnIUmDVohORLpGvu+gFf6Kox8oxAModlGe2ieN2x
	q79ZmQfKUAju1U0qySKyVMxZdbC/L4C717RaT8sSAxjlQ4DnWs/ftGZ3b7gRyq1oCQjP
	fCWg==
X-Gm-Message-State: APjAAAWJTHfMKDlNz/kmJgf0QjhHBm/CNETWZ08wupaLRzp7MCOgsevU
	Y3ZZb8e4mO0mAHd3AefzExiWEJ1vStch7w==
X-Google-Smtp-Source: APXvYqxT0xdDvQ6dI4TlZEkPXv+1vC07qJWoSbve/C/G4C3nhQ7JRsEpoOLhd28WPPBllVfvPS/6UQ==
X-Received: by 2002:a37:5d44:: with SMTP id r65mr4934558qkb.221.1559332949759; 
	Fri, 31 May 2019 13:02:29 -0700 (PDT)
Received: from centrium.lab.ossystems ([181.220.86.53])
	by smtp.gmail.com with ESMTPSA id
	z18sm3991085qtf.28.2019.05.31.13.02.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 31 May 2019 13:02:29 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 17:02:16 -0300
Message-Id: <20190531200216.11763-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] mesa: Update 19.0.3 -> 19.0.5
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
X-List-Received-Date: Fri, 31 May 2019 20:02:29 -0000
Content-Transfer-Encoding: 8bit

Mesa 19.0.5 is a bug fix release which fixes bugs found since the
19.0.3 release.

For full log see:
 - https://www.mesa3d.org/relnotes/19.0.5.html
 - https://www.mesa3d.org/relnotes/19.0.4.html

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../mesa/{mesa-gl_19.0.3.bb => mesa-gl_19.0.5.bb}             | 0
 meta/recipes-graphics/mesa/{mesa_19.0.3.bb => mesa_19.0.5.bb} | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_19.0.3.bb => mesa-gl_19.0.5.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.0.3.bb => mesa_19.0.5.bb} (84%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.0.3.bb b/meta/recipes-graphics/mesa/mesa-gl_19.0.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.0.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_19.0.5.bb
diff --git a/meta/recipes-graphics/mesa/mesa_19.0.3.bb b/meta/recipes-graphics/mesa/mesa_19.0.5.bb
similarity index 84%
rename from meta/recipes-graphics/mesa/mesa_19.0.3.bb
rename to meta/recipes-graphics/mesa/mesa_19.0.5.bb
index 8a72df1014..51cba4e47c 100644
--- a/meta/recipes-graphics/mesa/mesa_19.0.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.0.5.bb
@@ -6,8 +6,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-Allow-enable-DRI-without-DRI-drivers.patch \
            "
 
-SRC_URI[md5sum] = "d03bf14e42c0e54ebae5730712ccc408"
-SRC_URI[sha256sum] = "f027244e38dc309a4c12db45ef79be81ab62c797a50a88d566e4edb6159fc4d5"
+SRC_URI[md5sum] = "1509a3251d459fd8b6fadf9329669dc1"
+SRC_URI[sha256sum] = "6aecb7f67c136768692fb3c33a54196186c6c4fcafab7973516a355e1a54f831"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.20.1


