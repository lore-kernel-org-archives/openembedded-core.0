Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id E9C0378643
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 15:46:48 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id g206so10219923wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 08:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=rRbUMBvAiN5uRL1caIq/2JOwjWLJEViNtVSSKlSy8AY=;
	b=jjjv/7MifYK5IlS8Y+SAJcVuzKUG0xXnKGp4k7Dc8S+iLZ6yW+C+yn7cBrOozLBfNU
	V6CPHVXAQ54aQu6h80OYCvL14yo+MDzqG1BfUCgdwt5g2r9L9IOV5g5R+bXg8B3lzgAB
	d8xmYlD3wQ3kwshRMJNFwny2iJRPNSGb4RCMhJVg099x5LexPSscBMKbFM2pzagE2jUw
	lhz+ULbhH1LchXfWXfn4zceQTXzlo9T4vIXJCDIYLco0vRlePTIlHETdtr46aPwz1vtT
	YrGO+42ACCidKJmUieDKX7CfbRmrlCyx+2O90urraAqq3Qk1SmFPZWK19Ua1sXoTTXWt
	xl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rRbUMBvAiN5uRL1caIq/2JOwjWLJEViNtVSSKlSy8AY=;
	b=bX7Z6F5FhK7t3wAQQyyrofl93a/L8s6u/dKAYZACqVDkjQKNOn8jjCiBetG3Ha30sq
	6o5nO/s+sEHHn7MGpUDmN/GPE95omvGNbe9m1a5b/96wCb/qW9rUo3sxlly1VoovVZmX
	Z8EgAPVkO7dCZv+BzzH3asjNWbbKEb6y1TgZ8/YBy0sEGlltDoauWpKxlitlBhoNv8Qh
	Vj5uVYMiwvjXEpuW/bfcaINJHpP/0r1B1gucmgtVKPZQ0kdAU5TAqkkZozEPCmLJ/MI4
	aZKeWcAts9PtTdtxDS0hmp0EUKB7NSyLy4RcZMWuhccsTO4gTdP8WyxNs6dP6IURrvd4
	TOUA==
X-Gm-Message-State: AHPjjUjiHIKZ77teOuvmPbwjJKcH3ungW+hboRxd7ZGw9vlWiy0XIcrv
	rhd/XzwEczxH7Q==
X-Google-Smtp-Source: AOwi7QB+ThWXjmcluV8+PZaKWESDjE1V5MkoTt3DeJo9LXyH7KGpVEo4jUDr6cdbkflCTMpEFAAJCg==
X-Received: by 10.28.101.133 with SMTP id z127mr3049560wmb.123.1505317609968; 
	Wed, 13 Sep 2017 08:46:49 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id c83sm1111182wmd.2.2017.09.13.08.46.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 08:46:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 13 Sep 2017 17:49:01 +0200
Message-Id: <cover.1505317669.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [morty][PATCH 0/1] Backports for morty
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
X-List-Received-Date: Wed, 13 Sep 2017 15:46:49 -0000

1 cherry-pick from master:
http://git.openembedded.org/openembedded-core/commit/?id=2d2b4d7383c93174fe8eeb72440e81345df71295
pull request for pyro sent at the same time.

The following changes since commit 56eae27b3a7bd938d6959e5b671fc48ea2ab80c7:

  neard: Fix parallel build issue (2017-09-11 10:46:29 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/morty-backports
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=jansa/morty-backports

Martin Jansa (1):
  glibc-locale: add runtime dependency on glibc

 meta/recipes-core/glibc/glibc-locale.inc | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.14.1


