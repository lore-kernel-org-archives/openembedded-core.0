Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id AB1C07964F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 15:40:46 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id b11so2520071wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 07:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=5I9JSBarx1SDpg8UMu+iQQbPaCGQX+4aRtj1aUgqP8g=;
	b=FBZys0r0S8LK4n+2DekWnTjRDyGZLOeyqs2h9Koegn2sVPq/8U8FwH48Yk5J3DH1UF
	sHpf6Pohj+fWTjIaU2L7Au8te/VYFo3dMtfrrOsaD/rWNnlDtZL3aP1LW/uxLsjRpTIO
	cSl5Te30iwXjC3hzvY7j5sbw++gi1IZwKMD+PYRmUEvVFB5YeUSG4GG4Uc5pXJ7Mf/4u
	N71oX9JAVqWJ04nmN1fwj0Wh2u18QC0kGLwA+pueQIKTJxv3kPjjHbf7yk27qpKd6EiA
	9psRmrxB2b1bPN4D7iHHi/CKUijLrze1BAQ6ey15WHr9hhis0VwzsxUTO+gCx89Akazq
	glOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5I9JSBarx1SDpg8UMu+iQQbPaCGQX+4aRtj1aUgqP8g=;
	b=kzdrh/hoVuj0c9BZi1n9vq/m4CSvSEpCg5LEqo1yvNJYrC4GFVyVcelSV6/dfnyv39
	DtoBlvYc40SfGfZTZ07VTPXQxXF8n6v3E3ThKQf93OvozztuGe22MErD++pOUuTGp+gv
	wTCI2fpsB9fD9UJBi9kc2BlX9vYtoAiUx7bdEZ1KIzuuPSf55ZgfZ2kjpJmaUwf/Qn2F
	pxZAu8qz5ZWsDtNdjhMJt4P4DwyaCnoiEhbvsNfkbxTGbFUkhg+7YA3ShoXDlkQRT3Bf
	i8vvd+6VJke8oENR179lSHevbbf8DQi94xtA8FzPLeze9p6CbJdAX3fb/8yxLc0uoPXS
	Ds4Q==
X-Gm-Message-State: AA+aEWZYt61ljJpbcIVu3I+9Dk21BCvGTmK/Fw+1a5kxMgE4Ieoqsq/C
	TfA8fB133dr65aZI/3g1T3o+QCyfzXs=
X-Google-Smtp-Source: AFSGD/WEkDOI7AatDdFIh7i3ojxrpgJVSnC8OxxR8BWpkq42RKjgIZKDkSfX5SNUwCVnSi9G8lDwgA==
X-Received: by 2002:a7b:c24c:: with SMTP id b12mr10896464wmj.29.1545320447240; 
	Thu, 20 Dec 2018 07:40:47 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h10sm8178307wmf.44.2018.12.20.07.40.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Dec 2018 07:40:46 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2018 15:40:41 +0000
Message-Id: <20181220154043.7860-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/3] nativesdk-meson: add missing dependency on setuptools
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
X-List-Received-Date: Thu, 20 Dec 2018 15:40:48 -0000

Meson uses pkg_resources, which is part of setuptools.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/meson/nativesdk-meson_0.49.0.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.49.0.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.49.0.bb
index 53503aa9988..721ee8c8f12 100644
--- a/meta/recipes-devtools/meson/nativesdk-meson_0.49.0.bb
+++ b/meta/recipes-devtools/meson/nativesdk-meson_0.49.0.bb
@@ -66,9 +66,8 @@ do_install_append() {
 
 RDEPENDS_${PN} += "\
     nativesdk-ninja \
-    nativesdk-python3-core \
-    nativesdk-python3-misc \
-    nativesdk-python3-modules \
+    nativesdk-python3 \
+    nativesdk-python3-setuptools \
     "
 
 FILES_${PN} += "${datadir}/meson ${SDKPATHNATIVE}"
-- 
2.11.0


