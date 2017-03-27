Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id A8F4771CB3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 13:03:27 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id y18so51573997itc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 06:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=pEQ/otYc7KebNk8GuSpMaf5LyIR2SkywDkOHWbQZjXc=;
	b=aiJSGWtembsyL4wCpioZokY6aO8yVUA2CPsS4ysl8EFnprIDxo7vCDMXK9nj5dZuyt
	zQhpgEoCTKOe74E5GNs6sVgBIjHoSWEXPUaVNK5aDlO5q7tkf0kJAqEA3d0Crnlxiq2v
	y9gQ92j8ydomxQgxsRbtaMUjytJ0TQXXScnXYajOVR7NTpq4Wd0B0uojcDTRB9rP+d/N
	fY//vLpgEwgGxr51E682vwTkEL/U8AvZozj1J6JDyxA77hrNkyP3DgmIUEGs2aghkpJO
	0v9HjhnL99CD36L5TLVDyrj0hUbn2EI6yRNRXMg41y+eFuhu+F8jFkZDPGlaruAIRWOA
	xn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pEQ/otYc7KebNk8GuSpMaf5LyIR2SkywDkOHWbQZjXc=;
	b=QwAaf0dtMthEjpppZza6aO38hIixF99b9bQr7f9z5cDOhTzUZDwnC17ft9v7KQsAcy
	D7llQVrbQQCGLfO880vIVzo8gEsKo+WuP6qECExldUbnkSUvhT0A293vuhhPUVqBnYpL
	hFGWgPukR5klJs4rReoxOZQ3uJPVjpcESsGkhbNauAXFw68WXEDEWuQqjkPmCEt/0EWY
	Zj6GIFHHoaz9AFsFkk1a4mGNmkHvwUDZZUCFzi0V96fQVuUQqBJ5n6RuY4ec1BotFiyF
	A75RvyAiS7WOQYrkprNNDJV8PRWmc6D160Ekt/dhPBTJxkGh6ctP668kOHZhpm6HBjWc
	IkBA==
X-Gm-Message-State: AFeK/H1ZDQR+g6IDlLTXJKNrKBHRRJ9EVpwxDNapVTeR685aVw6i9xX4RM1LrvQSdSDSwwTJ
X-Received: by 10.36.37.71 with SMTP id g68mr9212231itg.66.1490619808353;
	Mon, 27 Mar 2017 06:03:28 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D2B5.dip0.t-ipconnect.de.
	[93.232.210.181]) by smtp.gmail.com with ESMTPSA id
	y203sm217251iod.11.2017.03.27.06.03.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Mar 2017 06:03:27 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 15:03:21 +0200
Message-Id: <cover.4189796e0dbea7cfc888587157135c9fb8477ab8.1490619742.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 0/2] oeqa: runqemu enhancements
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
X-List-Received-Date: Mon, 27 Mar 2017 13:03:27 -0000

Just something that I happened to notice when using oe-selftest a bit
more... Both patches are non-essential enhancements and thus can wait
until after 2.4.

Patrick Ohly (2):
  oeqa: tolerate interrupted select() while waiting for qemu
  oeqa: QEMU_USE_KVM can list machines

 meta/classes/testimage.bbclass        |  4 +++-
 meta/lib/oeqa/targetcontrol.py        |  7 ++++---
 meta/lib/oeqa/utils/qemurunner.py     | 10 ++++++++--
 meta/lib/oeqa/utils/qemutinyrunner.py |  5 ++++-
 4 files changed, 19 insertions(+), 7 deletions(-)

base-commit: ff4a94fdf7b42cfd7c5114f29734078874d753b8
-- 
git-series 0.9.1

