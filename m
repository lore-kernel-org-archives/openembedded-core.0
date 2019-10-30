Return-Path: <yann.dirson@blade-group.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id D369E7F91D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2019 09:32:47 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g7so1302233wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2019 02:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=blade-group.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tG2fK1nmDYsLG0pDnBYs784JLtmx2wG0I4COq0ueisg=;
	b=XJlXm304y7Wyz+oTVv61E0wdv2LlUHC6L9gmYtAI2bpimqfjCtWqtx689tx8DxkLBf
	Us6sU6A3uq4LI8qr95E0nvdfC3Ktqyc+24cVfSb31T5jU83Dnm8wzSM6Hb9Ags5V/7uW
	Hkbg7XUn8J5Sar7IZ6Ap4vvO/CMPkxxwaHPoeZxVCHkW5ylR+zme5arWK6pwcqtMdRKh
	qvg1CJiQjnLRoAqMowv+NoFRCYGPNZlJF8R3GKqdn+7pPB63zV3X0LzC4SvXNAp9cNdW
	aoxVGnIuTTU1G7KskSGliwF4T//020BwRaJnC2y8qpCAGeHnwOiFTvWLDrJFKk8Ix6W7
	XPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tG2fK1nmDYsLG0pDnBYs784JLtmx2wG0I4COq0ueisg=;
	b=RlqkVRkTeg+XlhxgFR1Czhbp72M9Egz1UsCKnO7svHXKLigM852nVoT1JiAG4j0FY4
	1AOqDW8pVEixBw78aGPMOrp6Iycu5EHR0+Vw6o4mdkMcBnZ1AZvAxZoYtsXuopeQRq4G
	D6eEtJsQ/Z7ibY/LlgCQ20ATHNQWV+zy4cKj3FHcKAL12mYU/isI295tFANo1cr6bIzg
	aRujcjkQwHNen32N2ic/IuRaHF2Wxo2eKg0il07wLGyD1o9QcoD7n3QO/dXx6K7bb+FK
	QvmqXwEHfDgEBkpNsF0GqV+B+PT/FW/vy6PMUBJG2UFlizGSJBKTSKY+E8t7d+sgXusx
	mCXw==
X-Gm-Message-State: APjAAAUysdVz12n2ETr7IjXScOWBgEJwmK9v27tsy3qvnjVKtkFbShh6
	OHMSdL1JoLXhJnk4YJMXLtmAJpGPT0zZgQ==
X-Google-Smtp-Source: APXvYqynHUqL7DWhRmFWj1kcGVap9fgNYAnJD22H4Ubi/pNQmt/3BC4HiJdD4azwmiZ6az6wG1Pfkg==
X-Received: by 2002:a7b:cbc8:: with SMTP id n8mr7600821wmi.119.1572427968111; 
	Wed, 30 Oct 2019 02:32:48 -0700 (PDT)
Received: from yantop.local ([85.118.38.73]) by smtp.gmail.com with ESMTPSA id
	t134sm1560767wmt.24.2019.10.30.02.32.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 30 Oct 2019 02:32:46 -0700 (PDT)
From: yann.dirson@blade-group.com
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Oct 2019 10:32:15 +0100
Message-Id: <20191030093215.6013-1-yann@blade-group.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH] mesa: fix meson configure fix when 'dri' is excluded from PACKAGECONFIG
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
X-List-Received-Date: Wed, 30 Oct 2019 09:32:48 -0000
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 .../mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
index 3458c19199..346b217585 100644
--- a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
+++ b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
@@ -23,7 +23,7 @@ index 0e50bb26c0a..de065c290d6 100644
  with_dri_swrast = dri_drivers.contains('swrast')
  
 -with_dri = dri_drivers.length() != 0 and dri_drivers != ['']
-+with_dri = get_option('dri') or (_drivers.length() != 0 and _drivers != [''])
++with_dri = get_option('dri') or (dri_drivers.length() != 0 and dri_drivers != [''])
  
  gallium_drivers = get_option('gallium-drivers')
  if gallium_drivers.contains('auto')
-- 
2.23.0


