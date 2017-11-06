Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7BB166093A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 18:13:01 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id q83so12080569qke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Nov 2017 10:13:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=EH1egi65SyKN2APJfyPh9UHNSrPVrSbQWNIBHI6ygv0=;
	b=dPosfG99ttwTBToh+nsefakRYPP+rNQHbiwMpd4rMrA0VNESHRzEQa+nL5NRJNnd8H
	U86IbYReza2i1bS/X3M1iBYgpSb5RyhFLfwG4eIXKeVSZodhz486y/f5Sz24KKWk8+gS
	MPPx6j6nlMb3dJF5JthN7WsqFrkveSpdLs+3PEVXv2P35P0/vWktct6rlud9T3WsxAvZ
	y5D8KeOo7qgiP21hAO4H0U9yszu6SB49JvpNbvBvX1YoGaskLuwZBtmT/WY7Cvl3+zAy
	4fMuIa6guSzY8In51XGEIW7EmuoQ+aYUYfkKnEDwR4V2abv+qeFm+hoP3S4IDGIPbTsI
	2Meg==
X-Gm-Message-State: AMCzsaUfR9JpGsvEVEyLl4DEGdLgd7x7RJIaQFpS3kCoQF1adsRyEPJX
	RFr9hEh6b/B/K6KhAYsx/1V+fQ==
X-Google-Smtp-Source: ABhQp+S8Q5d7P2LCSFgvH6DbCPGoT2595ZknFyaUFD1+t5BBQy/mNV1NbO4wXL+N66utH12lAq638A==
X-Received: by 10.55.162.73 with SMTP id l70mr22078495qke.29.1509991983033;
	Mon, 06 Nov 2017 10:13:03 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	c140sm8726814qke.53.2017.11.06.10.13.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 10:13:02 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 06 Nov 2017 16:12:54 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  6 Nov 2017 16:12:50 -0200
Message-Id: <20171106181253.2081-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v6 0/3] Queued changes since rocko
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
X-List-Received-Date: Mon, 06 Nov 2017 18:13:02 -0000

Those are the patches we have queued here for master. We took the
patch version 6 so we keep the change history on the patches, about
its previous versions.

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

Otavio Salvador (3):
  mesa: Upgrade to 17.2.2 release
  libdrm: upgrade to 2.4.84
  linux-firmware: Bump to bf04291 revision

 .../drm/{libdrm_2.4.83.bb => libdrm_2.4.84.bb}     |  4 +-
 ...1-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch | 40 ------------------
 ...allivm-Fix-build-against-LLVM-SVN-r302589.patch | 49 ----------------------
 .../mesa/{mesa-gl_17.1.7.bb => mesa-gl_17.2.4.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc                |  2 +-
 .../mesa/{mesa_17.1.7.bb => mesa_17.2.4.bb}        |  7 ++--
 .../linux-firmware/linux-firmware_git.bb           |  4 +-
 7 files changed, 8 insertions(+), 98 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.83.bb => libdrm_2.4.84.bb} (93%)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_17.1.7.bb => mesa-gl_17.2.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.1.7.bb => mesa_17.2.4.bb} (78%)

-- 
2.15.0


