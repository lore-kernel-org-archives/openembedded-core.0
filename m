Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id E3FA976C19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:19:45 +0000 (UTC)
Received: by pabzx8 with SMTP id zx8so15928598pab.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7b42+IIFfXcusIp6z9PvYr2vxXAwAWE4+vKQiD9hBdE=;
	b=ZY1moquoUHCNGq3FRZTW282IrUYRbO9AoMIixuGsBRXGL26HegWfEMnMqDF2HIzm7Y
	HtqOMEQhAJwoTGwrkutOkxCHouDtWMNkWfOnjWFd86JkcZ6wuJwWrgGvuJMKyY0B+2+4
	EX56UlzaHY4PaHcGbCogo7CPeqO1g3rNiikm2NXFglhCpes/cC4NX6CsIigGDFe6SFU4
	Tq6uIL/rJCcPq8NAo26ZzKfFNb4zJJlQI/J7Ievm8qmBL6/2aWcWQzr2o/ft9TMMwNTe
	TvOn+5X8T69DSU36q1KDzSW3FekkyEs/ss7xVdYyhdSBSQwwGPaMWCGZl4FJKi5e51vW
	EwjQ==
X-Received: by 10.66.233.97 with SMTP id tv1mr49524178pac.110.1440454785918;
	Mon, 24 Aug 2015 15:19:45 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id p3sm18580706pdf.3.2015.08.24.15.19.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 15:19:45 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 15:19:35 -0700
Message-Id: <cover.1440454579.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/5] Various bits related to pulseaudio
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
X-List-Received-Date: Mon, 24 Aug 2015 22:19:47 -0000

From: Christopher Larson <chris_larson@mentor.com>

The following changes since commit c38acd720b3f6ffbeb544063692eb471dada8593:

  binconfig-disabled: write an message to stderr to help confused developers (2015-08-19 17:57:58 +0100)

are available in the git repository at:

  git://github.com/kergoth/openembedded-core pulseaudio-related-bits
  https://github.com/kergoth/openembedded-core/tree/pulseaudio-related-bits

Christopher Larson (5):
  libunwind: always depend on libatomics-ops
  libatomic-ops: move to recipes-support, fix recipe name
  packagegroup-core-x11-sato: obey the pulseaudio distro feature
  pulseaudio: pass --with-systemduserunitdir
  pulseaudio: add 'autospawn-for-root' PACKAGECONFIG

 meta/recipes-devtools/guile/guile_2.0.11.bb        |  2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  | 22 ++++++++++++++++++++--
 .../packagegroups/packagegroup-core-x11-sato.bb    |  3 +--
 meta/recipes-support/bdwgc/bdwgc_7.4.2.bb          |  2 +-
 .../libatomic-ops/libatomic-ops_7.4.2.bb}          |  1 +
 meta/recipes-support/libunwind/libunwind.inc       | 11 +----------
 6 files changed, 25 insertions(+), 16 deletions(-)
 rename meta/{recipes-multimedia/pulseaudio/libatomics-ops_7.4.2.bb => recipes-support/libatomic-ops/libatomic-ops_7.4.2.bb} (96%)

-- 
2.2.1


