Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6C4287847B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 16:56:32 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id d54so3020306qtd.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 08:56:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=icxMqzHyBL90OsxPWpUutqkqHTeln/VtV4OSnj0tcns=;
	b=eHoAV95FR/bP1/N+8zBy4gwO2mP62gICcBgDE7CC1Go9RsdfiVrQk3JYfuoZP+rDTv
	K8vqoYwoaJeBIREUAOAaNXBMJfbCsFFv1alirLvA2B8kHIIkZxGxmGQX15sptokBzVrc
	D3thhogF4rWGTnASdEU0fNM5fTe/ZhhZLuX2SK0d9clv1Hx6oY52VeixRFxUUM1WAqXb
	GVn28Tos4M6z084RpV1WhOLMjIzm4Nx5WglxSE85lUbFW+TiuA+azpTWDW4MazKiuLie
	SPuAP0C3ktkX0qJatGIlFRRhktIts9++CeAolQluupLZBuQA0NgJYUIe08rh9BMvqWHF
	4CUw==
X-Gm-Message-State: AKwxytcKpwJzpHzewyqZrHxnn0OCf1VO87lRvOgPlKNONN/DGX/OWPWg
	H7vGQURpfBduiSP434uvDMt51A==
X-Google-Smtp-Source: AH8x225VpQtAyx5UBFd/qhdP9ah+e89ovZKIP9U+i93y3B23Pq3LhbekHseC5I3VQnT6ak6v0fjLkg==
X-Received: by 10.55.126.132 with SMTP id z126mr4570710qkc.276.1516726594091; 
	Tue, 23 Jan 2018 08:56:34 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id t90sm531545qtd.42.2018.01.23.08.56.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Jan 2018 08:56:33 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 23 Jan 2018 14:56:26 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jan 2018 14:56:17 -0200
Message-Id: <20180123165625.7352-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [rocko-backport PATCH 0/8] Rocko backport
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
X-List-Received-Date: Tue, 23 Jan 2018 16:56:33 -0000

Those are the commits we think that should be backported
to rocko.

Those are fixes or minor improvements which does make sense
to backport and has high impact for our customers.

If there is any incompatible change, please let us know.


Mark Hatle (1):
  uninative.bbclass: Fix broken symlink issue

Otavio Salvador (5):
  image_types_wic.bbclass: Ensure '-c image_wic' works
  libarchive: Enable xz and lzo by default
  grub-efi: Rework GRUB_BUILTIN variable as it is too long
  grub-efi: Add loadenv and test as default built-in
  grub: Move grub-editenv packaging to grub2.inc

Richard Purdie (1):
  grub-efi: Fix DEPENDS

Tom Hochstein (1):
  libepoxy: Fix build break for EGL_CAST dependency

 meta/classes/image_types_wic.bbclass               |  3 ++
 meta/classes/uninative.bbclass                     | 12 ++++++++
 meta/recipes-bsp/grub/grub-efi_2.02.bb             |  5 ++--
 meta/recipes-bsp/grub/grub2.inc                    |  6 ++++
 meta/recipes-bsp/grub/grub_2.02.bb                 |  6 +---
 .../libarchive/libarchive_3.3.2.bb                 |  2 +-
 .../Add-fallback-definition-for-EGL-CAST.patch     | 33 ++++++++++++++++++++++
 meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb   |  3 +-
 8 files changed, 61 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-graphics/libepoxy/libepoxy/Add-fallback-definition-for-EGL-CAST.patch

-- 
2.16.1


