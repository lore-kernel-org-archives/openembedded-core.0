Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id DE77D744C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:07:03 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id q3-v6so43474530wrj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=r53zqbS/QuSIV/MPkHRXU7vD316fbSQlPO0pVr8EIsc=;
	b=LoqRE0c2ylE3ATHaSGkeGD/TyStEDJjdtdvAAwlWB/pTeef3dWwrdsOzzit0S85UdN
	tvFckMLQwELtu8CDin64Dfip0fgyVX3FaXfLzrsLrehtO7EVXPQjOtRgr59WiG4y1RDq
	0SI4P0c5+45cmfzWKce/LZcZ5YWP0vhqtoRZd9ySpLig1qi6ESwm/shs3j9YeLNpUs93
	g3KWqdK/TKEaVIt66trfnXzMpkx7JLN4Ai4xQ6k0Q765n9p/GPA7rcqpPCsVytjw4nnv
	PFNn4915l15yKE63ZO5QKvRw4RegBnGFIZ25u/kOtWSB2fYVjOv60nVHyREkazo9CD1L
	nEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=r53zqbS/QuSIV/MPkHRXU7vD316fbSQlPO0pVr8EIsc=;
	b=iNzTeq11JsxE23vHodbAvgThOxnjGJcfYy9a7/FF4pTtcOi/KuqKPxEfU4qx7/eLzr
	II/vPexeqWl0UiF10iGSriSNK8qib5fsMjWFS/eUvtCFTyafKgtoPoDB0uecbRwFYnC2
	ff0bTDAbHEUmCCekhSCAOk/d6/4ew0Au0Hvxq/+b77I6KXKa58dyRumVGbCqEcRyVbMF
	cLqOkm3zpwv7jILOtnfU2VWc13ODakpeCTLlp/DiCxgbla54tBUu7ukKPQAyIcWeJd10
	73CZHQ/GnElGG2wkptLvqQl5ak/fAqhX0V+08PhjskrrD0gcyJ1d6IodHA6wBsOJvG7H
	EPiw==
X-Gm-Message-State: ALQs6tCPOdkfPmAQjX88xPm0jmDuiHPik6dFmDe+xC8xwXYvYEVd9Q2+
	O/ijIfZgnwZfTw8LOiJN+F0=
X-Google-Smtp-Source: AIpwx48KVf1PEnnE0FcyffOh4c4Bk2uYdP00jtnm4J2iA/ORoSOH98o+ZV/y3zEtqBVRw8MDDji4Lg==
X-Received: by 2002:adf:b850:: with SMTP id
	u16-v6mr24213094wrf.64.1524665224351; 
	Wed, 25 Apr 2018 07:07:04 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	s14sm13313499wmb.5.2018.04.25.07.07.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Apr 2018 07:07:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2018 14:07:02 +0000
Message-Id: <cover.1524665115.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [pyro][PATCH 0/3] Backports for pyro
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
X-List-Received-Date: Wed, 25 Apr 2018 14:07:04 -0000

The following changes since commit f8cc08fc7db26241d996ac710484d559eff5f9c0:

  distcc: Change SRC_URI (2018-04-02 17:09:07 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/pyro-backports
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=jansa/pyro-backports

Martin Jansa (3):
  sstate-sysroot-cruft.sh: Extend the whitelist
  sstate-diff-machines.sh: Replace MACHINE_ARCH only at the beginning
    and separated with dash
  scripts/test-dependencies.sh: remove

 scripts/sstate-diff-machines.sh |   2 +-
 scripts/sstate-sysroot-cruft.sh |   2 +
 scripts/test-dependencies.sh    | 286 --------------------------------
 3 files changed, 3 insertions(+), 287 deletions(-)
 delete mode 100755 scripts/test-dependencies.sh

-- 
2.17.0


