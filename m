Return-Path: <liu.ming50@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id D07F36BA93
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 May 2019 20:14:55 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id y10so2819671lji.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 May 2019 13:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MUuBa9HDFzrfCXpypTt0sv/1TXjKL71Bdq+VioxAnc8=;
	b=ODkL46d/s/OE4dSwbODBispK/AeCn/OmhuO2ot/FsgOYKAgv5vz5xtWeVep66mlt5y
	l0/sVBep6kHuVlumMOmNuSb9yfkUviZhdg/QWz+0G7QfiaGRiTvhsIfubm59PzdY4qNW
	P1aHDREv4jzJz3ZnsjNoM6GATXnMTjO0huj4+UQcGz8Vy9RiDIDbFKklq4ou/vNmfNoQ
	ou7/1y6N5PBcybMex2L4Ta0ASEjpS6biz3GU62xUC4fMG3qVXkhWcaWJCtMq1aCWXB7R
	vLL7mYhp1v9kqA4zewPy+W29QeYkqK3WxFcZAksb/BVHpRxdgGzgsopN4i4+1aR4dP9O
	ERwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MUuBa9HDFzrfCXpypTt0sv/1TXjKL71Bdq+VioxAnc8=;
	b=fMipuQioydZSH8nz18KrMZDY48hE5PkpX/ckLHaoH0U4xn5jmOHfiEh4B/9r3Cc3mC
	QUc+5TS/iVvzdJLVGJ7Hc0ldRRDHx/a3K2Av0/p4Ob9Ug41/HfQJUeVt8erJ9VJW5Zcm
	/bllG1b+aoDpAvFZszHx+/lJp/LgWhLknNdKdfvimmKjXWDW7UR6+BVkeIuE8NeU7Tgj
	Elg1TBlJyUvyevfKoyMjv4aKCSZ03SLmR3o9ifOfetTNG7KRZ7Vu2x0miOztEUg6aqUD
	jeWG6IU/DBNFpygGPoX3ub/p4u6c19leeMCev3+Uh4cNiw/uV4ewirH5TlB6aisjIJS/
	cJHA==
X-Gm-Message-State: APjAAAWPfHQJd8sgOz1VchUZLpyEjHROdmd+SuEPmwJpOksenMo6XCB1
	VOq8jz//IzuJfTRLxqTnrBI8eF6J
X-Google-Smtp-Source: APXvYqzSRt7vMoPr8juF06NRqbooy3kInHdfCP1bm6gKir4G0vY7skRtY48QhtpJ5Jq9GwcF9ycofw==
X-Received: by 2002:a2e:9a58:: with SMTP id k24mr4840646ljj.90.1557087296098; 
	Sun, 05 May 2019 13:14:56 -0700 (PDT)
Received: from peterliu-Precision-M4800.lan
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id s27sm542072lfo.22.2019.05.05.13.14.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 05 May 2019 13:14:55 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 May 2019 22:14:50 +0200
Message-Id: <1557087292-30921-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: gerard.salvatella@toradex.com, Ming Liu <liu.ming50@gmail.com>,
	luka.pivk@toradex.com, stefan.agner@toradex.com
Subject: [PATCH V2 0/2] Split out libx11-locale from libx11
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
X-List-Received-Date: Sun, 05 May 2019 20:14:56 -0000

From: Ming Liu <liu.ming50@gmail.com>

Changes in V2:
1 As suggested by Ross Burton, split out libx11-locale from libx11
as a standalone recipe.

Ming Liu (2):
  libx11: split out libx11-locale
  libxkbcommon: RDEPENDS on libx11-locale

 .../recipes-graphics/xorg-lib/libx11-diet_1.6.7.bb |  1 -
 .../libx11-locale/0001-Drop-x11-dependencies.patch | 86 ++++++++++++++++++++++
 .../xorg-lib/libx11-locale_1.6.7.bb                | 32 ++++++++
 meta/recipes-graphics/xorg-lib/libx11.inc          |  8 +-
 .../xorg-lib/libxkbcommon_0.8.4.bb                 |  4 +
 5 files changed, 129 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-locale/0001-Drop-x11-dependencies.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-locale_1.6.7.bb

-- 
2.7.4


