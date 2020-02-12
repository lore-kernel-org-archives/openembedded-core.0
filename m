Return-Path: <jpewhacker@gmail.com>
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
	[209.85.219.180])
	by mail.openembedded.org (Postfix) with ESMTP id 20FE260B1A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 03:14:39 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id q190so340445ybg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 19:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SUbNCoxv505vX8fOE2BRzh80bbc05olEwGQv+kI/GSw=;
	b=n3b/9iNWhf3Qrm1mFA8vjrFLKI1E/SjWWrAjT9RQY643vNOLOQQObbbh3gMXnI0VAf
	UvF+uOltfeCtWtBF5pUtrcN/3+jgGwBQx1dm9SDBmCj/Pp9BWDhoH/8d92IgAe79yJBR
	Y29jPK5mkxQYRMTkdk37RpZKyaojSt0saDJZEz4Ag+p5V41b7T2bsxjEO1o+Ro+Dyzyb
	/A1WWtQWVKbccGqgEdV+1tXl3HQJxROFSow2FS82CRXSXLBbrDXCoSQdmRhu8T/J1F+L
	bJkrLcs7G8bsiKl3xvWW4aZ9pww3+uveWtmFdwy9JDhr2utQM023sNbwG7MkPSE+WAWz
	8dfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SUbNCoxv505vX8fOE2BRzh80bbc05olEwGQv+kI/GSw=;
	b=n+JyBFp7j8im3XXyYxAJNLFFzd3QCqNt7HWTK33bDkSMB0fM49YsIkRRe+2ujCsYPA
	Aa/L+XW1GSnvf++rgkhczWcfx9bM7hnt8yat5EeTrHRXl2KO0L9DxcY2DnP3hpJsZPf3
	sTaRAMNOYftF2gHpH/R+KY0hMNYv0paBK4nJ+UYBX77SLGBEYr51LmF+BhbLAJrs59C8
	Nu0WVlal4ybTqmbjzIJqBTD6u99DBiOPrfmniQla8m2VY35xyME2Y9gsz7pQE1KuW0u1
	bbW2hI9X1xpLNh6Y2cOBaCpLoE0HgXGNLjis/PihQ2EquRnJMgTTzzQXYC9NZmFdpKYH
	A2+g==
X-Gm-Message-State: APjAAAXXZdNTDqaa5XVbhKH8YDZUwi1Y0ysgf3fsv6UVvJx7xexUoZqI
	lB0AcSp/M2xvie/KbTdCQOEbM2t9
X-Google-Smtp-Source: APXvYqzjXQzzYmMnyeSRJuCJVHU5Ak3l7dmufWrgzR32wiXDnjnUgnnYT+9H31QPgpEH/QtAB4/75g==
X-Received: by 2002:a25:8b04:: with SMTP id i4mr172918ybl.495.1581477280448;
	Tue, 11 Feb 2020 19:14:40 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:4f37:550:d1b1:6f01])
	by smtp.gmail.com with ESMTPSA id
	h193sm2677370ywc.88.2020.02.11.19.14.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 11 Feb 2020 19:14:39 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Feb 2020 21:14:31 -0600
Message-Id: <20200212031435.792802-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 0/4] oeqa: Run diffoscop on saved output
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
X-List-Received-Date: Wed, 12 Feb 2020 03:14:40 -0000
Content-Transfer-Encoding: 8bit

Adds recipes to build the diffoscope tool and run it when the OEQA
reproducible build test saves output to a local path. This should make
it much easier to debug reproducible build issues from the autobuilder,
since the published output can be easily viewed on the website.

Joshua Watt (4):
  python: Add libarchive-c recipe
  python: Add magic recipe
  recipes-support: Add diffoscope recipe
  oeqa: reproducible: Run diffoscope on saved output

 meta/conf/distro/include/maintainers.inc      |  3 +++
 meta/lib/oeqa/selftest/cases/reproducible.py  | 24 +++++++++++++------
 .../python/python3-libarchive-c_2.9.bb        | 17 +++++++++++++
 .../python/python3-magic_0.4.15.bb            | 19 +++++++++++++++
 .../diffoscope/diffoscope_136.bb              | 15 ++++++++++++
 5 files changed, 71 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-libarchive-c_2.9.bb
 create mode 100644 meta/recipes-devtools/python/python3-magic_0.4.15.bb
 create mode 100644 meta/recipes-support/diffoscope/diffoscope_136.bb

-- 
2.23.0


