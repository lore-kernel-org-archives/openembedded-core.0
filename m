Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f194.google.com (mail-ig0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id 877706012C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 May 2016 19:30:52 +0000 (UTC)
Received: by mail-ig0-f194.google.com with SMTP id jn6so2977563igb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2016 12:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=DbCtApl6l6tYhJjvpkhUyjatYrhBe+/L4bWZkYu6zpg=;
	b=LRBNx2NV5zol6EkbZ8mTV+NFK6SAXsJxMTu9AyjMId/vUZwMz+wHGAUdJauMuG51SC
	FM4GnK/84oKzYLwRvprGTjz6RmJm/+S0IUqFtvqqDR/0ZArGsTBzfHptDZdKhBnQ2lmy
	kLwrurJ7kwTnjrLtInIRaBxWPhoDZq5h3Wl4pGenPhDoSTezJrofT/OeK/18rGy9EnBw
	VIe1DjFZmgz2s6/Nsl6Yd5ikot25nEPPLWBiK4OIREHLYeABtbSXve/EzC5C+pCO1lWa
	bDR6gGD7CTaezPq5TRS/C5sxFlqMuvtGFGsX/YK3XHSSR4/7aTuWJXPD16dVAL/1GUFr
	BY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DbCtApl6l6tYhJjvpkhUyjatYrhBe+/L4bWZkYu6zpg=;
	b=FzE37Y4sIuR53FpcLM4KlP1EP1xsOn/QlUYjpLA2Z8GeG2u/Zo3lC7tV0JQXRVVRAr
	s7TyQKKzxdKv7AVdrW83T8n4v+fraYbNi4tIvGeSgSOmpixcVlR6X8tZNAaZYYaaSBiP
	2A5g8oEZFIvnaj+vA82QHhF+RjHsmDmQUbK83u7SaPyYNLWhcxHWE+9TTOGZacryTq6M
	KisiTS5NYPmWKdr2UHR2Ck3nI6oJkQDppA4u8nx8L2B6cVexT+dLlV4DaHvAfw1qhQpe
	df/OyRQbqmUlcve6dN5zX45uQjzK6PHmZm5YGkO5bF6h6U8JuAlOVnOELi3mLAuwHHLF
	9DXQ==
X-Gm-Message-State: AOPr4FX0elSiSJdAgaPQm1G0owotWXEDMAg/RKQovcyYY3T3KfGUq3bXG1X5P6gXE6CGQQ==
X-Received: by 10.50.102.207 with SMTP id fq15mr6053566igb.94.1462476653255;
	Thu, 05 May 2016 12:30:53 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id ni7sm2295382igb.0.2016.05.05.12.30.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 May 2016 12:30:50 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 May 2016 12:30:44 -0700
Message-Id: <cover.1462476586.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [master][PATCH 0/3] Fix a few recipes to obey LDFLAGS
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
X-List-Received-Date: Thu, 05 May 2016 19:30:53 -0000

From: Christopher Larson <chris_larson@mentor.com>

The following changes since commit 1a0e56630c5c27d8899dd0979ae0b86bbe227881:

  utils.bbclass: note for deprecated base_contains (2016-04-29 07:53:58 +0100)

are available in the git repository at:

  git://github.com/kergoth/openembedded-core more-ldflags-fixes
  https://github.com/kergoth/openembedded-core/tree/more-ldflags-fixes

Christopher Larson (3):
  ruby: obey LDFLAGS for the link of libruby
  mkelfimage: obey LDFLAGS, sort out HOST_ flags
  pong-clock: obey CFLAGS, LDFLAGS

 ...HOST_-vs-non-HOST_-flags-and-obey-LDFLAGS.patch | 73 ++++++++++++++++++++++
 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |  5 +-
 meta/recipes-devtools/ruby/ruby.inc                |  3 +-
 ...0002-Obey-LDFLAGS-for-the-link-of-libruby.patch | 28 +++++++++
 meta/recipes-graphics/pong-clock/pong-clock_1.0.bb |  2 +-
 5 files changed, 107 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage/0002-Sort-out-HOST_-vs-non-HOST_-flags-and-obey-LDFLAGS.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch

-- 
2.8.0


