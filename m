Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 09D9971BE5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 13:17:24 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id 2so2394749qkg.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 05:17:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=jBbV8MdusdCEvq8+peOagh137udMliMBPFSd0hOkPW4=;
	b=Jt73iZ94WTbdWcAOID9PBHbNy8I/oL+S+tuaG8L9eI7Vt9BVxYPaxiHIAm2fvZL40h
	WXIKhc3Np3qvnhtLScK6/j85me5IQAVsdzs1Pm2QACvPbAflmhJ4Bm2bQdsRcRg1+TSH
	N/INSNOHdYSBhC5z4PJyvjSnUJho4VYp3REUECrNrwZ6/8KJOKZAMLmhs26CNbTmZRfP
	+vjwHiGWUHfhJQwT4t+sRt1lU6EPTDRd7J26+7bNBBNNCbfBbLhadPbeALeai63T0eZ9
	pCAcZYdcx1mIGaQT1zuEKaQyPE2C0t1lzq+tugDpLxTSicrc54m4TS2ppWO/Wrdgibar
	ogcA==
X-Gm-Message-State: AJaThX54A1NYhpV6Y5vzXvicBNBg36+FlPdkHYOon2UbMR5usozwO03z
	gtWFS2+s65CEQlIhXQ9NQ2PlHA==
X-Google-Smtp-Source: ABhQp+SXxaBsBeeltYn79MCW21ryJOSgCgV5QOpA+RnjbxaCoZyPp17U3c8bzBm+8Hz/WjwWG9Sw7Q==
X-Received: by 10.55.42.139 with SMTP id q11mr665429qkq.285.1510147045839;
	Wed, 08 Nov 2017 05:17:25 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	q49sm2691597qtq.80.2017.11.08.05.17.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 Nov 2017 05:17:24 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 08 Nov 2017 11:17:17 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  8 Nov 2017 11:17:12 -0200
Message-Id: <20171108131716.26248-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v7 0/4] Queued changes since rocko
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
X-List-Received-Date: Wed, 08 Nov 2017 13:17:26 -0000

Those are the patches we have queued here for master.

Changes in v7:
 - fix commit log typo
 - upgrade to 2.4.88 release
 - new patch

Changes in v6:
 - update to 17.2.4

Changes in v5:
 - rebase on top of master
 - new patch

Changes in v4:
 - update to 17.2.2

Changes in v3:
 - fix build for wayland

Changes in v2:
 - update to 17.2.1
- add a note about checksum change of WHENCE file.

Otavio Salvador (4):
  mesa: Upgrade to 17.2.4 release
  libdrm: upgrade to 2.4.88
  cmake: Upgrade to 3.9.5
  linux-firmware: Bump to bf04291 revision

 ...cmake-native_3.9.3.bb => cmake-native_3.9.5.bb} |  0
 meta/recipes-devtools/cmake/cmake.inc              |  4 +-
 .../cmake/{cmake_3.9.3.bb => cmake_3.9.5.bb}       |  0
 .../drm/{libdrm_2.4.83.bb => libdrm_2.4.88.bb}     |  4 +-
 ...1-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch | 40 ------------------
 ...allivm-Fix-build-against-LLVM-SVN-r302589.patch | 49 ----------------------
 .../mesa/{mesa-gl_17.1.7.bb => mesa-gl_17.2.4.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc                |  2 +-
 .../mesa/{mesa_17.1.7.bb => mesa_17.2.4.bb}        |  7 ++--
 .../linux-firmware/linux-firmware_git.bb           |  4 +-
 10 files changed, 10 insertions(+), 100 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.9.3.bb => cmake-native_3.9.5.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.9.3.bb => cmake_3.9.5.bb} (100%)
 rename meta/recipes-graphics/drm/{libdrm_2.4.83.bb => libdrm_2.4.88.bb} (93%)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_17.1.7.bb => mesa-gl_17.2.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.1.7.bb => mesa_17.2.4.bb} (78%)

-- 
2.15.0


