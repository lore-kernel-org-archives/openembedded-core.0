Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2D74B60603
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 19:43:58 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id x129so4602123ite.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 12:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=Eej97/kVLGVX5mkUfNDaPw7T3d1NVDf/17nsODlyDLQ=;
	b=ajE96MxRlry9GR1qKxIlQIjpt0oB+nZEFdCqZi7g2F+0RP9L64Zf+Bbia5xUJhcthG
	1lwOoZZ+cAvMK0Kjwki4AyYZUmSDXBTo3P1EldOR2r6qVIC4wu6GdUrj0G0lt4NLVDft
	mUiauahqob3ZjLRb1hNlO2fLHuSXUfipYLpaU/WqgCrulSnuErF8eu6WAAsKanmV0pmH
	8f7xUzGxs4qWoTGh0IsZBf3/oQSA8Oo4EHNtAPbo00F2Eg+LYeQpxcbBySjEFQienABw
	S0ljMetMShBx8QPaXBVOe7s3/kJA9rgKplD/N26RP7mJa6MM/Ee+I0WMrpB+Py+OUQJX
	u6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Eej97/kVLGVX5mkUfNDaPw7T3d1NVDf/17nsODlyDLQ=;
	b=h9r+yVc839PYPXpwZrYgtJySmbG0q4iqSHzpyaV2RQX5jGAhdaKadxyA9iyw+XnlVP
	xIqwu7H66rzbGXoUg551EVUYMLdCeqATD7ndm1QKPrJlsplnQ0yPJ1ik9TFQWqels3tN
	5vp14I4lJoR/NC98Tm6y9lUHzNmfTr2++TsKPWRSof1z0xIJ8ZwMgyEgYZz7gR2YUMw2
	YmFdsouRQcQR/Gzi9a9O3SLjoQ+VI9H9nRRINw40g4ZnNe43DQVuB5jLWwkduEULK1JJ
	Jk6jXCWrvdA4Ogx9jwMWitR3FRguEIltoDIEk4o3nxwHCg+gjS72aZ/FWIdTisUC/WuT
	cC+Q==
X-Gm-Message-State: AODbwcDT7UFM8uTSNEjCUyduMeFs5djzB7i5ryAVOiXCMh2QcfdeMOtt
	pXSzGPiUy+GZpYpjEQM=
X-Received: by 10.36.67.199 with SMTP id s190mr8736701itb.29.1497210240000;
	Sun, 11 Jun 2017 12:44:00 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	e186sm3022036itc.21.2017.06.11.12.43.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Jun 2017 12:43:59 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Jun 2017 15:43:49 -0400
Message-Id: <20170611194350.18033-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH v3 0/1] mesa.inc: enable texture float for gallium
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
X-List-Received-Date: Sun, 11 Jun 2017 19:43:59 -0000

changes for v3:
- add Upstream-Status patch header
- fix typo in commit message from v2
- add links pointing to where the patch was obtained
- change commit subject line to remove "potentially"

changes for v2:
- copy the solution from Fedora
- the original solution (to enable or disable texture float at ./configure
  time) was rejected in favour of Fedora's approach to always enable the
  feature, but then edit the code to enable or disable the feature at run time

Trevor Woerner (1):
  mesa.inc: potentially enable texture float for gallium

 .../mesa/files/0002-hardware-gloat.patch           | 51 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc                |  2 +-
 meta/recipes-graphics/mesa/mesa_17.1.1.bb          |  1 +
 3 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0002-hardware-gloat.patch

-- 
2.13.0


