Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 57ED460849
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2020 17:23:29 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id z15so9580358wrl.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Mar 2020 09:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uli3Y3gPFY9HbgBRy76nPH4X4IrPCIYn0p5a8ocnWtU=;
	b=b7PhOP1ydq2y6nUPs0FcZ8bsN1EuG8tkhwqS6I4JMmc9hluMbxev8vbW6/Yevh63yv
	A+f/1S8ymfA+x5pOmiPwV4a6Ykea4vLAu1C7fZnjEMCVpJKTUuPbalF2t+FUYpSN4Yy2
	NvUDNz4dkPj9kd0jmftXEU6LFINivuHa9d1f1OsmG2wuwRgC5UPKeYVnRKkqs5E6nzbg
	krjWaEfSm/yVJlzpJh36sxJh+xFCEnPK2QlVD56V5LSu/3gwHJkPkO52ekIS8ZXDgKF3
	2eqFggxDikwDiOiAdkvV21DfYhmcxHcWNmJsUZmePMCxcWtSJhSqRM+DMtxPpFNcvUfR
	8dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uli3Y3gPFY9HbgBRy76nPH4X4IrPCIYn0p5a8ocnWtU=;
	b=lLN9xognUpDI0ake/oYXmVDnIoMldwWvP9PQekzbSdGJVhSd9Jkb675/PcgJ4h4j/r
	3WkLGgW8jf8uTzsakGMeKhaWugVzhPrSar11Uv4axmSGJaZyqTkkZjLv4Z++FGTXR+jC
	xIMgse25ioBvfmgLBSokYGEg2QkosdPmvOP9iOK33U1lylGa7U9UMfBGqUpD2uN16ysG
	JXqnIIWKgtwT2o1el6PJ15D3HBIFJ1DcAVQfaaRKi4byYdAp6hPJnIB/3OVwM70WHaeG
	JAy+mQIkMmOM2VxpXEsJtIQusbx5XfxsSiyoQ59BUK+JOPiGhIzyVFSs9x1iEfjwa+ns
	lOpA==
X-Gm-Message-State: APjAAAUAWP2iyAm0qNiWBYxgRauHrnNgn964XLm2n5+2yHx+r/9qMaYx
	x2/eAmBUHMNp3rMorUq5Qety43kG
X-Google-Smtp-Source: APXvYqwJC4Qu3EQVWiPU6wvDlKsDr5I6CtPFqhX+b89PuuHxpB9faideu0ag+lxUsBGPV4EvfYkGLA==
X-Received: by 2002:adf:ed91:: with SMTP id c17mr15680358wro.388.1583083409578;
	Sun, 01 Mar 2020 09:23:29 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F305233FDCC906A41691B74.dip0.t-ipconnect.de.
	[2003:f0:7f30:5233:fdcc:906a:4169:1b74])
	by smtp.gmail.com with ESMTPSA id
	q6sm22937991wrf.67.2020.03.01.09.23.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Mar 2020 09:23:28 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Mar 2020 18:23:19 +0100
Message-Id: <20200301172319.2758-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] mime-xdg.bbclass: Fix typo in comment
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
X-List-Received-Date: Sun, 01 Mar 2020 17:23:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/classes/mime-xdg.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/mime-xdg.bbclass b/meta/classes/mime-xdg.bbclass
index 63169e990d..642a5b7595 100644
--- a/meta/classes/mime-xdg.bbclass
+++ b/meta/classes/mime-xdg.bbclass
@@ -8,7 +8,7 @@ PACKAGE_WRITE_DEPS += "desktop-file-utils-native"
 DESKTOPDIR = "${datadir}/applications"
 
 # There are recipes out there installing their .desktop files as absolute
-# symlinks. For us these are dangling and cannot be introspected for "MymeType"
+# symlinks. For us these are dangling and cannot be introspected for "MimeType"
 # easily. By addding package-names to MIME_XDG_PACKAGES, packager can force
 # proper update-desktop-database handling. Note that all introspection is
 # skipped for MIME_XDG_PACKAGES not empty
-- 
2.21.0


