Return-Path: <joshuagloe@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 04986771FF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 13:59:26 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id hm5so4932674pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 06:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WdhgF66abp2RpZwDdg281V+bC4a2x7+zRKjcc7s430U=;
	b=gyAILRG29hWUcUASVHBvDXS4kHbCtaJKACcr3XRveACqfJl2RnU8DZm9YkgbZZxdU9
	MQffitAzJFeQXElCZBhFPBLNgKNPOmgec0JqeJVaSXNn9n2DFrTYnWr/pS2qL2u6YrDe
	p73AjDLMf3QGQK1jJkTFfyVXW/CfE5c5eyXMrdJbpFhnNCGB+F+ZrpBWTt4XEt77p0Wp
	JC/g187/x1FGLcA3jT7iVUitjT2J9UjYzYegmB4HsT6FLQs8xvWnNfoozEA85QXc+Kzs
	2rpqZQYIQajb2E/xDAD1Wlbfq+eUpPnMghht5k3/IQ9i2eH7v494S1JyaBYZ86Y4Re1F
	711A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WdhgF66abp2RpZwDdg281V+bC4a2x7+zRKjcc7s430U=;
	b=MR7W+Pnf7YGTrKpZWcaIVwaMkIs4LZLpUT8x3cIP55CvaP9XEgXKIq1KFpePzgf+On
	3iySwQYk+faOg5PKRVmuIxmFLUXnhphWQ3sXoFkFriuw71+fg3/2GywVCEtmXURGr16v
	xotGJU/z8rxRajT/bw8spxGtomQIXT6znaETtp9+7eTWPEPSpx4tDHTirpbIGhI/oX6t
	hsU82HBNLLJFX/SrV0EpZ5qQj8dFvLC5PAYOqgAChYKzxBaLpJkfId1ouR9eSyj8DrN2
	L0pbmHXPBVNRjuEvSObZMtL5k//QHy4ahx56ZZeOsBIcG0rMe9Uzyp+5FQYsy5i1k456
	m9ig==
X-Gm-Message-State: AE9vXwPRoJ100fwZ4r5b/jaceqRaLKFEck/B1RvN8AsOuEg71UKiuCgQvJPSptmuuCGiIg==
X-Received: by 10.66.235.100 with SMTP id ul4mr63662776pac.50.1473083966837;
	Mon, 05 Sep 2016 06:59:26 -0700 (PDT)
Received: from jlock-mobl1.ger.corp.intel.com ([192.55.54.42])
	by smtp.gmail.com with ESMTPSA id
	u1sm33982460pfu.12.2016.09.05.06.59.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 06:59:26 -0700 (PDT)
From: Joshua Lock <joshuagloe@gmail.com>
X-Google-Original-From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Sep 2016 14:59:08 +0100
Message-Id: <cover.1473083836.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/4] Python3 runqemu
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
X-List-Received-Date: Mon, 05 Sep 2016 13:59:27 -0000

This small series against master-next (as the python3 runqemu hasn't made it to
master yet) fixes the new runqemu for a workflow of mine where I build on a
headless machine and copy images locally to test them with runqemu.

The following changes since commit e0f246cefb8b6642e0df98067ade06833e83c1f8:

  gobject-introspection: set GI_SCANNER_DISABLE_CACHE for native (2016-09-05 11:59:01 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/runqemu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/runqemu

Joshua Lock (4):
  runqemu: fix typos
  runqemu: use glob rather than calling out to ls
  runqemu: assume artefacts are relative to *.qemuboot.conf
  runqemu: get NATIVE dirs from env when in source OE build dir

 scripts/runqemu | 44 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 6 deletions(-)

-- 
2.7.4

