Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 977DF71AB3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 03:38:09 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id g2so115764874pge.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 20:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bejkzTUdZc2bAk4ptCO6/2CwmxbLWTXupRnfc/bWoTg=;
	b=qeWff2nu1XVykAKwBrsMionCDVf90bh15z/QgZ3nmHAvzbFlLzE+Vjr0lP70MBT3p+
	wffeKjKsqEJdui5tV2pE1IFy/9R4aCejYN/M9aPLM3QaDjJSyoqBzYei1KFJapJjWJ9i
	DkSKBT9vIQux2p6dfshn4BlD/w6xtiEAZTGM38bT4nKqu6YAxQXhsiUdl3WElErXlgfm
	RqFC7dqqkd3YIPrOUdMlD6vzMGK1h+c/W3Ty9ec6W7O2cyPmGIl7t1X+Ci6EoFPcFfhC
	gmFpsFU1HyKQQk2QE55QhNgcF83E1Ju0FHyVsAyo8hb9xvFSmipk0ysLwOJydHSAmmSN
	/eyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bejkzTUdZc2bAk4ptCO6/2CwmxbLWTXupRnfc/bWoTg=;
	b=ZJSlZkhpTHOanfcFhx9VH0vn4gjrsmno56zutqLfuFFKDqKNQcVLgv05LYRBQRTPZb
	f7gB4/keirS6u2sSucCIz9VNkllQc2gAMRyuHfJoRppmC8j4tRll4L5kiYv2EHP7x/d4
	X0F+PmjUzFkaA/fti73pVVhG3stUdG7lt5pTMsK7on21T7Xvu/2eDL8E/U+o0ill+2hB
	9+ZB0IasJ27u0XXOeP/Sl2sZuemMjOR4Pq1UBrDXSYYafIKNgUZ8Dd2AmFqkSyJ4GSIg
	Uxp+iF8dtd7UpAR628TWdUUrHXkCiQErfDNtbVvl2jbsBWhDfPWcvrWrh6sMxCPlR+0m
	qpZQ==
X-Gm-Message-State: AFeK/H3F3fy/GjrqLl+ybR/nXR22d32iydFKOlBW7PclOI6fVZFSXvp40SsGbWjTkFr4WQ==
X-Received: by 10.99.123.72 with SMTP id k8mr408848pgn.139.1490240290682;
	Wed, 22 Mar 2017 20:38:10 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	d4sm6471560pfb.104.2017.03.22.20.38.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Mar 2017 20:38:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Mar 2017 20:37:58 -0700
Message-Id: <cover.1490240196.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
Subject: [PATCH 0/2] Misc fixes
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
X-List-Received-Date: Thu, 23 Mar 2017 03:38:09 -0000

clang finds couple of more issues to weed out

The following changes since commit d1d55041e38b12d40f896834b56475ea19a6047f:

  sstate: Ensure installation directory is empty before execution (2017-03-22 10:12:10 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu

Khem Raj (2):
  db: Fix atomic function namespace clash with clang builtins
  libvorbis: Contain gcc specific compiler flags using configure option

 .../libvorbis/0001-configure-Check-for-clang.patch | 56 ++++++++++++++++++++++
 .../libvorbis/libvorbis_1.3.5.bb                   |  4 +-
 ...me-local-__atomic_compare_exchange-to-avo.patch | 45 +++++++++++++++++
 meta/recipes-support/db/db_5.3.28.bb               |  1 +
 4 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch
 create mode 100644 meta/recipes-support/db/db/0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch

-- 
2.12.1


