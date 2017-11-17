Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id E97E370016
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 14:42:23 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id r39so6484725qtr.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 06:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Hm9yJM/gP/R8AZnb/3gvXQ8rI5KzP+gX3FsE3tQISzA=;
	b=GifISIN3L9aPAVQJGE6GL5By95KCUVIOXI5C96/iRx0esmXIyo3gmdx5HZ5/AdGVPG
	6VH7N6ZNa5glIHtNtCjpH4dH8K1P451s/2ZDgS1iTef53/4DuxHjHvgFvo6JOjQdTOor
	bn2MKqnT3hLHtA3Th/MnjqbLRhNL7Dk8TIM1sg6POVdPvnh1YkgqDPBtDhnUXtnr0a5e
	3JT97lz/eeH4AdI4FiE1bUaUTEeKSw6KnHO+FeCROuQTvB9khIQy/LFNNwFmZKooOFpQ
	k18HlfTZFl9WJTV/1uErq8Agm6k1gi4D7mnLdUgA9XZHC2D5pHevW0wnfW+pssPyoqAA
	2p/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Hm9yJM/gP/R8AZnb/3gvXQ8rI5KzP+gX3FsE3tQISzA=;
	b=O1z+w/gpjL0EaS+VOkrRzxj33/s5jHbfOxowhdf34f+C0b3YKxvLMR/3uQvOYh9DKI
	WZQtFtDA4N+1a4qpo1rFSGfZsrcw40ALxbbg89VvkeOAOaExkzlXKqDliGkaY4NB69aH
	Nvf+7ugLEMgObds7fVpshPJgAj47UpWbgL9LIYRlPUlnH8iMJu1uSC+kmTm3DjhBvLSw
	MdEJdXctktuuqiR8qAleo29vC1eTUGEDJNpt7pK9OQj6zurIPtbe65cZUSJEULG85kfZ
	FzUUTjumBPbHYLAGxg4bjj//IVFECuTDuHlQCB/yQUHpCQFqhPUol/Zf1sXlHwd2Nook
	lJDw==
X-Gm-Message-State: AJaThX5pLC+EtlWFtHVF9Ps9/vHY/UbjK7VpovNd6BmQMC71wcCU2Aue
	QfpzduWBzxFeGHxKlclnXLCyNQ==
X-Google-Smtp-Source: AGs4zMZ3eS55W9CEaqvgCe8DIubxINiOzvo7P99ydnRzBAfA/L0jo+eh+6Gq6l4r+B1TvjuDwkzoBA==
X-Received: by 10.55.42.129 with SMTP id q1mr8819284qkq.3.1510929744486;
	Fri, 17 Nov 2017 06:42:24 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8882:b8c::a4a])
	by smtp.gmail.com with ESMTPSA id i2sm2457385qkf.86.2017.11.17.06.42.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Nov 2017 06:42:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Nov 2017 06:42:11 -0800
Message-Id: <cover.1510807196.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.0
Subject: [PATCH 0/2] GCC Fortran fixes
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
X-List-Received-Date: Fri, 17 Nov 2017 14:42:24 -0000

Tested world builds on rpi

The following changes since commit a17f3ec910366e9e7551fa24fbc07929b9584341:

  dhcp: fix build issue with libxml2 support (2017-11-10 14:44:31 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/fortran-fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/fortran-fixes

Ricardo Ribalda Delgado (2):
  gcc-6.4: Fix libgfortran build
  gcc-7.2: Fix libgfortran build

 meta/recipes-devtools/gcc/gcc-6.4.inc              |  1 +
 .../gcc/gcc-6.4/0057-Fix-gfortran-build.patch      | 53 ++++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-7.2.inc              |  1 +
 .../gcc/gcc-7.2/0051-Fix-gfortran-build.patch      | 53 ++++++++++++++++++++++
 4 files changed, 108 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0057-Fix-gfortran-build.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch

-- 
2.15.0


