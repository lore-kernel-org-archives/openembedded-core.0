Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0DCEE600E3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 11:17:17 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id v41so9650757qtv.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 04:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=nCerEmyU3d+PkeXHaUU9qT/LvZ9opBPvagjmDBaAX3s=;
	b=By8EGpuxAX1mhBXiVgn5A5mNCv6612Dy5taM3qamKbib1e8TrSegNkj+ECGgeERVm7
	cGtt8QRcGbIwoTmOjf9NWdREtMSH6an6kxuNHs9Y0IEnrkCi/2J+qT+bdg1DUpik0XKv
	WkcGm0Qxwg0A6G8vJfumJ9/5L5SeeGpF1XYkAIWRMjbBzcRexr4WX9JgpHnoMDeTiNxS
	0MJIpEib3gPRfbO3/jQn0GFh8gYuRfigzvqi+YwwaMs5QRFkC90eurQooaM0Y5mn73z+
	XPwrPucyPaJ+S5/RUw4WgI3/LB97tetFgiQjc8pP0V1y6xt0wH0N2jbGhr9tuGLWKjsX
	eDZg==
X-Gm-Message-State: AMCzsaXkE7kccKK/IUJhs8yo/ze3cWtcmDSfWC/PB/dZNoaiFIKMsCTd
	zWI+w1Qj7gucBt3Ab/0uCPCBdA==
X-Google-Smtp-Source: ABhQp+Sd0nzgMtIm6/EKnCXEBwcfxZhXbLVRzGUf7Ph5Q9OwLOhv7NF7Ha+wv2GFTLkWhWPSLuH5aw==
X-Received: by 10.200.19.11 with SMTP id e11mr2438752qtj.68.1508325438416;
	Wed, 18 Oct 2017 04:17:18 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	b26sm7704159qtc.39.2017.10.18.04.17.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 18 Oct 2017 04:17:17 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 18 Oct 2017 09:17:09 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Oct 2017 09:17:05 -0200
Message-Id: <20171018111708.2154-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 0/3] Queued changes since rocko
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
X-List-Received-Date: Wed, 18 Oct 2017 11:17:18 -0000

Those are the patches we have queued here for master. We took the
patch version 5 so we keep the change history on the patches, about
its previous versions.


Changes in v5:
 - rebase on top of master
 - rebase on top of master
 - new patch

Changes in v4:
 - update to 17.2.2

Changes in v3:
 - fix build for wayland

Changes in v2:
 - update to 17.2.1
- amend commit log

Otavio Salvador (3):
  mesa: Upgrade to 17.2.2 release
  cmake: Upgrade to 3.9.3 release
  libdrm: upgrade to 2.4.84

 ...cmake-native_3.8.2.bb => cmake-native_3.9.3.bb} |  0
 meta/recipes-devtools/cmake/cmake.inc              | 12 ++++--
 .../cmake/{cmake_3.8.2.bb => cmake_3.9.3.bb}       |  0
 .../drm/{libdrm_2.4.83.bb => libdrm_2.4.84.bb}     |  4 +-
 ...1-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch | 40 ------------------
 ...allivm-Fix-build-against-LLVM-SVN-r302589.patch | 49 ----------------------
 .../mesa/{mesa-gl_17.1.7.bb => mesa-gl_17.2.2.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc                |  2 +-
 .../mesa/{mesa_17.1.7.bb => mesa_17.2.2.bb}        |  7 ++--
 9 files changed, 14 insertions(+), 100 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.8.2.bb => cmake-native_3.9.3.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.8.2.bb => cmake_3.9.3.bb} (100%)
 rename meta/recipes-graphics/drm/{libdrm_2.4.83.bb => libdrm_2.4.84.bb} (93%)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_17.1.7.bb => mesa-gl_17.2.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.1.7.bb => mesa_17.2.2.bb} (78%)

-- 
2.14.2


