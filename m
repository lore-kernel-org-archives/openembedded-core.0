Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id D40187D200
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 10:22:28 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t16so1492376wra.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 03:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YlONa1HYajlOy07GcBTJx3x/aaWZMZN2uN2bbd3FmVI=;
	b=rMRxxkhdv7dWSZATbGvj4B60V1a1DUPognvfftGopZ18WGfe7lwE6on+uYVnIJngBg
	5mBYz0hzfdzzO0iRJEmiNIgk8mE5IIWSE5k9nq9zEXFxKuBzx5muSrMuzKimHZCGRoGu
	0ftDAyPRShkmeb6qYU5be4lXlf1MC4DMUVfKLzM/RV5Hhg5Zj3j+ziDlRHGvzzsNm9KQ
	qXj06numi6/N5BQNchzykKhXTIfu3lPSKmoIKlY9Q6RYJwN63CRhSyksWvLC6NrWbcHK
	NnwrywDHluemjYbWY0UdptBTd5UqimgfOi+5aC3jl45mKxYZrlnd2lnnuIngznqubauN
	YbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YlONa1HYajlOy07GcBTJx3x/aaWZMZN2uN2bbd3FmVI=;
	b=XcEQVnP9aAuqrsxYFO/MRP6QG9nG9iMXyIR+tzG4IzE5HJX5+7T3F+TsCZ51GIY6i+
	kpiag+kwNNpyNOehMvzk6tpZepuUl2F6za3YD718cDghBVlPAnOVTO2S+Nhj5tlokiv6
	kSilmfk7GPkWF8myOzu5oBkZadCZ7F25MSsaL7Dq/RCvILY9p+ZzFpzP6w/4puR+K9cH
	atWHxgWIALS+atRn5ORaEwERZfWrnWNs9bsYrBJB43nZpc/p/O2njws5zvVeAsqsGIus
	p7oYEnOEO9x+3XuAyTSailWJkIueKduqsouNiKKu4spXC8nUX6XKAKvjplVVCZJpbeMi
	G4mw==
X-Gm-Message-State: APjAAAXrCYiD/7c+0EqsiTXtR4hSvQkBYn2g4WYB3DLgNJXCn+F0t0dm
	QrlcyAqBql5UljXbh1qqbA74kXmNNq8=
X-Google-Smtp-Source: APXvYqwQqGls5MZaLbyq3XOOIQouVima1503iez8QMPoskKEGfGyyOAXLyVRnC+LvyVr+00IOaeRXw==
X-Received: by 2002:adf:82cd:: with SMTP id 71mr35034053wrc.265.1566382949255; 
	Wed, 21 Aug 2019 03:22:29 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	u129sm3639623wmb.12.2019.08.21.03.22.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 21 Aug 2019 03:22:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2019 12:22:23 +0200
Message-Id: <20190821102223.67819-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] conf/conf-notes.txt: add a mention of common tools
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
X-List-Received-Date: Wed, 21 Aug 2019 10:22:29 -0000

They remain not as widely known as they should be;
perhaps mentioning them in the environment init banner could help.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/conf-notes.txt | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/conf/conf-notes.txt b/meta/conf/conf-notes.txt
index f1a4f4da143..5af13a8357f 100644
--- a/meta/conf/conf-notes.txt
+++ b/meta/conf/conf-notes.txt
@@ -9,4 +9,9 @@ Common targets are:
     meta-toolchain
     meta-ide-support
 
-You can also run generated qemu images with a command like 'runqemu qemux86'
+You can also run generated qemu images with a command like 'runqemu qemux86'.
+
+Other commonly useful commands are:
+ - 'devtool' and 'recipetool' handle common recipe tasks
+ - 'bitbake-layers' handles common layer tasks
+ - 'oe-pkgdata-util' handles common target package tasks
-- 
2.17.1


