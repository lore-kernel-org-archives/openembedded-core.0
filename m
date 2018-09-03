Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id D8C7E753D7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 21:25:10 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id u11-v6so625291plq.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2018 14:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=LgdBeZAGpF1++TMvpvBVYfJhvbiNctN865qWpvabbxQ=;
	b=YZas270qxS2YQvd3l1EhcEIa4kAzQLO2Z2Ot2Os6G86baLQq74rcqFNAXTuZJhrCyC
	rFeWWcUyeoCALQNTLwIMRthl0lyVuiTRGKnnSo3oM+f9ZgjFoW+9kDUS/wlq1+EhPkwd
	vaAuIqvKf4GjwGo3ztDD51iqughmO76GVI12kKPZ4pYw+4bQsp//kRB/gDh2O/nclWjK
	9bugwzCxMVqSTiUybD4o8aCorkMLXkHjxI05qbBqSNWHHLv/ChiPMZYbtkMrgIfDyb9y
	jFR3bc3u21q0FKpAOo2ytOHlZt6aWYmeIbmhHSRyWTUbxjD9xlCoNcUsGLfmkWYQXRzq
	MNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LgdBeZAGpF1++TMvpvBVYfJhvbiNctN865qWpvabbxQ=;
	b=Ws57m3c9KlYsWe+C/+thmknnho7YbNqs7ugYKUllNcNujcZHocNKO2QMPSJLyoatjM
	OQWhsORm7Cd89+Hdj+86i/dOcuUNiJlOLVE6dA7n62vi+UUBx628VUZ1XYoXERF7K4jq
	jOOpCyX/a3sUOplxSGcUBcEB20BVcm3W5AXDbsPEjQ+H8q0j7DkqhcBuUTfoDmzzXFbI
	Ypo7QxmuK1+V/HuP8zE4aoNAdTN+0VwbOicqUMFHkZXwFs6cEUdbQsw2cnSWZpXNJAWz
	BIQwIMnL7nsEXWq37ARN3OEXu+qc5zjNLRaJfQTFZnBmP9MnRdqTi11CjDmTg2Uw8XXq
	s94Q==
X-Gm-Message-State: APzg51C5B8xVUbFtVtSmlEgHJXo/OwxVf0FuOelxxz80zMr5q0U9GsZB
	Y9L/6cxejuBNfHBsOUfOFgwa4AnS
X-Google-Smtp-Source: ANB0VdbK+2m4vqAfDUqJa9PnqwS5usoC826WEwG9xX6eRelmSs+OkGoLgo1GYA6m0l8PZ8NzdoXVbg==
X-Received: by 2002:a17:902:5617:: with SMTP id
	h23-v6mr30232441pli.324.1536009911467; 
	Mon, 03 Sep 2018 14:25:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	p26-v6sm34626331pfi.183.2018.09.03.14.25.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Sep 2018 14:25:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2018 14:25:01 -0700
Message-Id: <cover.1536009789.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH 0/3] Misc fixes
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
X-List-Received-Date: Mon, 03 Sep 2018 21:25:11 -0000

Some failures seen when host has python3 as python
build core-image-sato for riscv64

The following changes since commit 929b1b341b4b221ac10c8621bad27abfa7ae70bc:

  openssl: Handle -conf package file conflicts (2018-08-31 15:33:56 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/misc
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/misc

Khem Raj (3):
  packagegroup-core-x11-sato: Make weak include for gst-examples
  serf: Fix Sconstruct build with python 3.7
  eglinfo: Upgrade contained waf version to 2.0.11 release

 meta/recipes-graphics/eglinfo/eglinfo.inc     |   6 +-
 meta/recipes-graphics/eglinfo/files/waf       | 169 ++++++++++++++++++
 .../packagegroup-core-x11-sato.bb             |   5 +-
 ...print-in-the-scons-file-to-unbreak-b.patch |  29 +++
 ...-Fix-path-quoting-for-.def-generator.patch |  27 +++
 .../serf/serf/0003-gen_def.patch              |  22 +++
 ...11083-fix-building-with-scons-3.0.0-.patch |  29 +++
 meta/recipes-support/serf/serf_1.3.9.bb       |   7 +-
 8 files changed, 291 insertions(+), 3 deletions(-)
 create mode 100755 meta/recipes-graphics/eglinfo/files/waf
 create mode 100644 meta/recipes-support/serf/serf/0001-Fix-syntax-of-a-print-in-the-scons-file-to-unbreak-b.patch
 create mode 100644 meta/recipes-support/serf/serf/0002-SConstruct-Fix-path-quoting-for-.def-generator.patch
 create mode 100644 meta/recipes-support/serf/serf/0003-gen_def.patch
 create mode 100644 meta/recipes-support/serf/serf/0004-Follow-up-to-r1811083-fix-building-with-scons-3.0.0-.patch

-- 
2.18.0


