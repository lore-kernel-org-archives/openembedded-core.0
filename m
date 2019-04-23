Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5B87B7C623
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 10:04:05 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c12so13235409wrt.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 03:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=dnWXrmXZa3tHZKaaWj7Qc1+xpuOIj7xHo5xUJm5suxQ=;
	b=Q1CrHlyWkc23qfKGKQJ9NVBv1b/G/4MVBpHSv0sCcGsbhYwwrJejHF4Svh2UxLDrw0
	SJ8LfnE3W6ohNajFmDGdmTcsboqlYzRUf4sSCTEz9TYDr40ydiNOvcFD6Uknyx+dAVby
	G6eIe6qCuxy6ZKSJHssC52nJSRR9PYTswhJFgQ86fz3KvQnzHpOdxi2pKIis/UEkwBZ6
	2r+Of3Sb5x00XcbFQFjBbkB+X9Alvo1/W5LcOx3k9KPkkVYYQjxWBCLhdqXk9Pbw4UhS
	lXBQLSR+n7S2avHfUCB31T/qGXzVQkB4kKYoAQP24VnzijWWbIwjnJLoG6vKgbW94h0W
	/cRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dnWXrmXZa3tHZKaaWj7Qc1+xpuOIj7xHo5xUJm5suxQ=;
	b=KsBS03XI1T5Q3/8WbdLxuZ50VJtCa6R7tNo7GNTVPEwNzejbVjiLmKEFK0otdTsibZ
	ygoXwxclvxW3996IFWjzT3wOv2hRYI30bcIiib7J8EB/wXrvqWOzvmfUlrKR/ff0yBwN
	Zt3uund+i3bJBj02tnmSTBM0d/QrxxqI47DdoLBjcItBiNJZDy8kfHc0ICUy2O6SR2t8
	pmti6uS5hDLxP0h30nmmdQwUne1Wdw4qAp44iDEtfRIKKqwdFaBJWszElO5r30vORSTx
	Ib1ArPoAP7Wz6f+N+VWcJDfWGmDEErgMVNNBS5ZJzDnaYuvCaRB/mGfhBkII5txESPCX
	H42Q==
X-Gm-Message-State: APjAAAXac6nEJuNvYBtyNuijXoc7YuDJLgAFdX2W+2ziAQ4wjIN/mBIR
	3Hu1Tr8pKvW1jObeG4Pm6qlStfW5h34=
X-Google-Smtp-Source: APXvYqxTmc0UxGEKu6yqsmcxfut9NBlhgtYod+4JYHPAUPZqOtH56jXyJq38LKdlxtbmEcAQFUnDVA==
X-Received: by 2002:adf:de8d:: with SMTP id w13mr2641543wrl.26.1556013845824; 
	Tue, 23 Apr 2019 03:04:05 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	w12sm39348721wrg.29.2019.04.23.03.04.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 03:04:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 12:03:59 +0200
Message-Id: <20190423100359.73090-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] meson: add missing Upstream-Status and SOB to a patch
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
X-List-Received-Date: Tue, 23 Apr 2019 10:04:05 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../meson/meson/load-configs-generalise-search-path.patch      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/meson/meson/load-configs-generalise-search-path.patch b/meta/recipes-devtools/meson/meson/load-configs-generalise-search-path.patch
index fc02576f5bd..2056763db5d 100644
--- a/meta/recipes-devtools/meson/meson/load-configs-generalise-search-path.patch
+++ b/meta/recipes-devtools/meson/meson/load-configs-generalise-search-path.patch
@@ -6,6 +6,9 @@ Subject: [PATCH] load_configs: generalise the search path
 Instead of hard-coding the fact that load_configs() searches for files under
 meson/native, pass in the subdirectory allowing the cross-file code to use the
 same logic.
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  mesonbuild/coredata.py    | 6 +++---
  mesonbuild/environment.py | 2 +-
-- 
2.17.1


