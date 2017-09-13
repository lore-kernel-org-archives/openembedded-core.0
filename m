Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D457878667
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 15:46:53 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i131so958122wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 08:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=obhO4oR7FHQe7ltYHJAnSH5QEPZmhSYs4N0PBorNOPU=;
	b=dmE0dd4D/wiSFwrrDRrqI8z48pqlldc6E3pmco5Hw3K9akYwp7/NNS9GPQ0PGjjzAO
	6niRh5SqumurxmJCPAoTzj7E45G8EXDtkiMTrU1aacJJSyJ4NnsIuh96EZspHlazb/bl
	UGJTd9EU4K1PnCr9S+Xq8e31pe412rHf8KNEej8Nv3fkX3l5lgE+ji8EJ3r61nIpGxpe
	cePduO7XqCtiMz9caeUQHcXvZgPgw9CA//5kWOTjfeLFG2skMgFhKelULS5s+ZUmGF6a
	cjGhHFUJtA3r/VlLafrQEcyftxLCdSvrnjZpTOQ4c5JGiZDA3Y+wFyUSEVUoWGzstp2a
	hO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=obhO4oR7FHQe7ltYHJAnSH5QEPZmhSYs4N0PBorNOPU=;
	b=ONcZWiNuuDfNlcScfork9+F+dw3KetpVKSAnZOZTBfbUfwO6SZJCJ/VcxGRYl7us21
	x2b65t76KVZN+z8yUis2pVPAOPJGVlH7OxQUBaWSSmHLRrZeb1MYxezZfzkbRCa/vqEp
	Ag2AedGcjIHXZxjM7/gnhYrfG2p95K14l3XFhx6VwuLL+E/60tdVOyhMr3GHYf/N8co6
	z+b7BBxwDqncaIJkeV+vaGY5tu2p4lAVaE+JsNZPQlMJ0ZdUSG01kKfgJXPiCU8XIvKa
	fCbb5QKPtYKFraN1cNj4cC75ch/8MKrXy9p82IPcnLrFgwMh58u6XVXh8Klx7YaQDsi9
	mG1w==
X-Gm-Message-State: AHPjjUg+DQoRAYe49exwFxggWRJ/HvgqTVRUH4zGBKAtQB9utsLITJXF
	ueeOPLU7AvePZXrVt8oa+iY=
X-Google-Smtp-Source: AOwi7QDsQ4v41o6OMZ9qRY+0YieDMnv7ajPEEjnJLC8xgAw2yLd13mtcs8b23AMGzboC0vd5ITDgwA==
X-Received: by 10.28.143.208 with SMTP id r199mr2945694wmd.39.1505317614946;
	Wed, 13 Sep 2017 08:46:54 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w14sm1325601wmf.13.2017.09.13.08.46.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 08:46:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 13 Sep 2017 17:49:09 +0200
Message-Id: <cover.1505317670.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [pyro][PATCH 0/2] Backports for pyro
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
X-List-Received-Date: Wed, 13 Sep 2017 15:46:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2 cherry-picks from master:
http://git.openembedded.org/openembedded-core/commit/?id=c7ba7e9e7a7ca2caf453106112dc5a3c855b21d3
http://git.openembedded.org/openembedded-core/commit/?id=2d2b4d7383c93174fe8eeb72440e81345df71295

The following changes since commit 7b3584ace93d45ac4078019a7ef185c6e190c51f:

  Revert "expat: Don't use getrandom() in the -native case" (2017-09-11 23:50:55 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/pyro-backports
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=jansa/pyro-backports

Martin Jansa (2):
  glibc-locale: add runtime dependency on glibc
  bitbake.conf: add bzr to HOSTTOOLS_NONFATAL

 meta/conf/bitbake.conf                   | 3 +++
 meta/recipes-core/glibc/glibc-locale.inc | 4 ++++
 2 files changed, 7 insertions(+)

-- 
2.14.1


