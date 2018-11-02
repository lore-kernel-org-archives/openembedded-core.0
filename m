Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id B60226FF84
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 02:45:26 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id r5-v6so1390277ith.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Nov 2018 19:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pXTCrtoNMMAz7cfxRYEWyFd3q2Xv0ODuacsSSn+MxyU=;
	b=P/tT5gbMuud1GDaAOzZ1xIQxi+DIhG67MkbdEjwnr2chYg5c9eLZsJLuOxUz8eHmuP
	sTc57IS9AlhFGLaCiMLF5d35b4Uel+H/fHSVGzw0YNY7oKXemiLLI/VLij86cbWK3S/i
	jDygG6NuNPNgIPjV/s7BkJPQuiFddhvKNUbGs51jYB162UtDdRVhnHplGz9uWT02Cm8C
	Fhlh38LJHWwHIAvSnBBNT0pmhJKImsQAFF4+CCY1lgHtklH4RZ4RG5TKgPIrWHFiPfbc
	bILYhDNx6L82TMrMOR2zm6V21c4hNghvPr20A5motI65jYwu28Jd/ek0KA4YDExpS4e+
	s+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pXTCrtoNMMAz7cfxRYEWyFd3q2Xv0ODuacsSSn+MxyU=;
	b=klpGdeL06n9L8Ai9HmC8Y0G+9VWUTgAV6fy+8iUDmubPtzCO3vbi22U89chvwi/Co9
	PMtNd+blm7WCtpLqW8Uu5Rq0NQVakhFfMEbEPjvCIFq26t0qCUTaBUzmaf2IL3feKomO
	P9EKpMopdUZ//f988xZiph4KsBD7SpZfm3qNpZ+A86/GAfwsMoRI9bbmt6pCrlpleZ6K
	yw0sGT0PQnJSbXh1xKkkp7KZ9hUVRWLZC4QTskHW33xfaIZ621+2elMAb+XGBsNd39yT
	oSybSNCs7kRNbDH/es9TT94MXADNRq6zPsAlSHFJcLXKeuSB0ghmjc2YHI/rfgduqI3b
	1OHA==
X-Gm-Message-State: AGRZ1gKdutGvMT71GRkED+82yF/Mzzzaq3Qn2uGi/kXlZGcEqVnNXfDr
	6Gx0l8FKAgDPopiLND853xSAOaIe
X-Google-Smtp-Source: AJdET5fnBPsUoD+vpjulB9+R5CMTYcp4s9nxS6G8tpiWbMaTdEpr5mneWIiDH2MNciOT/766uD5THA==
X-Received: by 2002:a02:b514:: with SMTP id
	l20-v6mr8158533jaj.25.1541126727331; 
	Thu, 01 Nov 2018 19:45:27 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	h130-v6sm10959680ioa.52.2018.11.01.19.45.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Nov 2018 19:45:26 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Nov 2018 21:45:13 -0500
Message-Id: <20181102024513.6977-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: "Maxin B . John" <maxin.john@intel.com>
Subject: [PATCH] pkgconfig: export variables
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
X-List-Received-Date: Fri, 02 Nov 2018 02:45:26 -0000
Content-Transfer-Encoding: 8bit

Export the PKG_CONFIG_PATH and PKG_CONFIG_LIBDIR variables in case the
parent shell hasn't done so.
---
 .../recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
index 5e44bb435c3..a9324de4cf3 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
@@ -1,7 +1,7 @@
 #! /bin/sh
 
-PKG_CONFIG_PATH="@PATH_NATIVE@"
-PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
+export PKG_CONFIG_PATH="@PATH_NATIVE@"
+export PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
 unset PKG_CONFIG_SYSROOT_DIR
 
 pkg-config "$@"
-- 
2.19.1


