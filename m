Return-Path: <laurent.bonnans@hikob.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id E75A7601A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 16:16:13 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id 191so132072534wmq.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 09:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=hikob-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=9xfUNddFMSticmWbXVR+IjH6AQ76r4wKJyvqHbVETzA=;
	b=Y7L/habRGRQQSZBFI2mZVkOKmmKvD9LAzSNgA85fswn74k1HpwHRaym759Y+ofV8MZ
	ssWLBV/tIGF3sAiJ0e9heQnCyHudytMI2Iyq9KRnCbENGdNuN7jESFDZW3VGAjVfO/OD
	FHcrXYMYJs4ush9YqVkLO5hjpSDbu7Z0RmsFeodjdCJc/CShiacuB+GV37FNlFC6WH+Y
	gBe8wVH+fo43V+pg4sXCct5IB1MnkeclN/+XBhZlWOEuD3zvZBqMPLxBV7Ttmp61OnJv
	1a4erWSaBzpoJLcU8MZ5QBvCDcuD0IHYySS4djETQyYe1g7WI9Itt1hruyZ+A9bHktlO
	Hk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=9xfUNddFMSticmWbXVR+IjH6AQ76r4wKJyvqHbVETzA=;
	b=kh7zy7IoLJoYO1LpAQrBpKPAfhv37MA+C82EouM1apynp784iApIHRGIwnGPQHTPHx
	5MvfO4f7hSl8PjbKHh3mnLEpvuZZuyQztsBsc2bO8V6srk6a6FWmf3SGUYvbJgTQ/YRi
	Vv1PthKmPqkKMcKlGfEPr0+uVIgdddVEY4JHHh6j3almlTQItdLFQtXXG8YUCE9D3dUf
	6jXDFyk6Ea977IbZSHrKPC8cb8yp3Cvi9/zqm1j4Vrn25TpNgnQvD/Ezv7Q76RRK3Wqz
	XONQbgxQweXTuGAStckfEBBamGLqn/Ga2AUcBkGPCs5+Q8UrUi2mHlCLpIJSqK8W3RVe
	e63Q==
X-Gm-Message-State: AD7BkJJpxAESO9MKcYvrJoGBHvBsM2dHDGkWH18bOLPae9WLQXBFmI2+sjPE6Fy9cFRzhBA7
X-Received: by 10.194.184.139 with SMTP id eu11mr13211440wjc.154.1459440974297;
	Thu, 31 Mar 2016 09:16:14 -0700 (PDT)
Received: from skinnylynx.meylan.hikob.com (hikob-152-162.fib.nerim.net.
	[194.79.152.162]) by smtp.gmail.com with ESMTPSA id
	gg7sm9767296wjd.10.2016.03.31.09.16.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 09:16:13 -0700 (PDT)
From: Laurent Bonnans <laurent.bonnans@hikob.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2016 18:15:58 +0200
Message-Id: <cover.1459438792.git.laurent.bonnans@hikob.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/1] python: remove tests and sqlite3-tests modules
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
X-List-Received-Date: Thu, 31 Mar 2016 16:16:15 -0000

Some python test packages were shipped with python-modules but are useless
in most production deployements. python-modules is commonly used to ship the
entire python standard library (it is in the runtime deps of pip, for
instance).

This pull request relegates them to 'python-misc' along with less commonly
used modules.

The following changes since commit 3ece01215a7b038dbd5cde313754c42d134a887f:

  ldconfig-native: Fix ELF flags on 64-bit binaries (2016-03-31 13:18:06 +0100)

are available in the git repository at:

  git://github.com/lbonn/poky python-rm-tests
  https://github.com/lbonn/poky/tree/python-rm-tests

Laurent Bonnans (1):
  python: remove tests and sqlite3-tests modules

 meta/recipes-devtools/python/python-2.7-manifest.inc | 14 +++-----------
 meta/recipes-devtools/python/python-3.5-manifest.inc | 14 +++-----------
 scripts/contrib/python/generate-manifest-2.7.py      |  6 ------
 scripts/contrib/python/generate-manifest-3.5.py      |  6 ------
 4 files changed, 6 insertions(+), 34 deletions(-)

-- 
2.5.0


