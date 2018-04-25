Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4908472ECD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:06:51 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id b21so7093266wme.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=4thI8sRNZV/NjS6XqcmASRZ+FH6eBkyNQdrNWwcfbQU=;
	b=M28tekBbw4YgDrb0LYTDfUF4XvN3F9w6yr0VBInCizs13TYPVHxDtLcV0GJ2lhtH+w
	pgr1ovtaAEcu1JSQQkhl77h09Gkp86fzACqjluqFTCNAdcSL6Rz9pPGTJIz3a0Gvr0jt
	uMFuT98nZ0ilHfRkfFTeKhLzerrTAP6MFpelKcrIHimPUp+JanozAS8C9vHbc2Dy88xS
	JuasTPwosucO/cyaaqeOyP3LzFxRFkyhWWgcTPIWszGKMzqgxHD5jW6uWS0QDGpXmrHV
	y8pu33YS9b/F4aIi5vOYhYzqKE21EB8yUyafLAYaeacVHA9luCtXbUwwEYm9ZqwHClQZ
	KWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=4thI8sRNZV/NjS6XqcmASRZ+FH6eBkyNQdrNWwcfbQU=;
	b=aUg3vc9SDf5SLDce3HsDTaR4K3dayvKyciVKw3r1y8XiGJARHeN4uZaO8F1n+1j+5k
	JVutlmXVSDTJbDvePtDGwijB3esY5lGJJ0Xtap6A9lN2oK5d9JggbWbC7upeTrXRZ/fz
	rBVYHQJY+2F5h2yX9POHSM2Xu281Zufg5+gFzQN9SaQPHRrK3DMGM18vchkcRk7Fk2sz
	YtsBT2WhSqNnPCDo+3i8PPWpzmwAZ93q3Of44aGqj3GmCCwLI2QCl51baR1KXI+C5fkp
	nBrVRktSq1mTQlNpqFPALCqMAsDkJpFEWzQ5yIJ4Q+6vvEpJcbDz8RVSqM16FcWbjFb2
	kJ5A==
X-Gm-Message-State: ALQs6tCOAowTBKIefjrkzklC8M3VGF4TLaGZ96JrhRS0WA5XyaSWDPii
	E7/E5T+SzEWsC4I0nKsEpDc=
X-Google-Smtp-Source: AIpwx4/+3BHBJm+NkLzlI5cGjL3JzacYBstVB246S9Ah6V+E+tzD3kQ9gMIfQL4tkmzcgkq5YRnCUA==
X-Received: by 10.28.23.148 with SMTP id 142mr2329192wmx.0.1524665212811;
	Wed, 25 Apr 2018 07:06:52 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	32-v6sm14983909wrf.79.2018.04.25.07.06.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Apr 2018 07:06:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2018 14:06:45 +0000
Message-Id: <cover.1524665112.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [morty][PATCH 0/3] Backports for morty
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
X-List-Received-Date: Wed, 25 Apr 2018 14:06:52 -0000

The following changes since commit 7b7cbba0bb93893029118e5798ec5831838a5bd9:

  sanity.bbclass: Improved error message (2018-04-05 15:22:59 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/morty-backports
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=jansa/morty-backports

Martin Jansa (3):
  sstate-sysroot-cruft.sh: Extend the whitelist
  sstate-diff-machines.sh: Replace MACHINE_ARCH only at the beginning
    and separated with dash
  test-dependencies.sh: remove /sysroots* between component builds

 scripts/sstate-diff-machines.sh | 2 +-
 scripts/sstate-sysroot-cruft.sh | 2 ++
 scripts/test-dependencies.sh    | 4 ++--
 3 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.17.0


