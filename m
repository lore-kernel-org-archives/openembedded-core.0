Return-Path: <joshuagloe@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5E5967731C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 20:33:09 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id gi6so91167pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 13:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gEiFofx5kYiN8+xL17kEkji+Rd33lvk4LtQZSbiK5iA=;
	b=h4xHaaqCWhk94V2Oi09LqmrrHncltRow4EyqRzDBcJvJo9y5T/L0p91nbiSzc2DwPg
	rMiUStCNFGsH5UT2WzPuYGrY6Q1lzIzxsamrYI3sGqieAfVa8XjtlesG5wKUUYAaREtu
	EOJ9VOTYFCvlpFv/a8KO+EgGbvBpwaaqak6mHf1fFl62flJKp0WxGR4vZoZgpzct2/QE
	dEw9vuPgDTjIipUr3EY9xfbNJN+aUKbfW/GhPFrXtTCZWX7SkS5LoYPqKN9wn15/WLD0
	Km0QN+WlMlsMsi5Y5an+H36U+TX7rIyLSB4nKgH6Z/g4un0o1eyxNukLhU4eCxZwXWgo
	DGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gEiFofx5kYiN8+xL17kEkji+Rd33lvk4LtQZSbiK5iA=;
	b=RdRW42DvqnamAWnOL6SzzIeJoCi13BqrJ2cPSSp6x1UBNds9TSiRBMaQPJl/SqoK8A
	8yc49qUpqU5FMyugoxsARoL7UmKRa2WsMeIb+mPs1HzYPmkyyFMPxAtP4P4+19/Yc908
	4BNfBMRBT4pW6W8gmbzyjuiO6GR83kkUR7vvJ0yC2yrp4SxQ0eoWHMgj2AqFfTamfenf
	HSZXwgw2numcDPcm0V/iKJJ4GH3Kw0ORDyHOHvDJ/PHV+XmuafCJYHPOi1grJKRMYqvp
	PGWeXgj9fOgfFKMxCWqjIWoogfLpxnxeS2ckaY28Sh6/tE2tA/5OAi3lhi+ASkhbX1oh
	InIA==
X-Gm-Message-State: AE9vXwMCLeahwOHv5RVh8KVaEhmu0ofFQrpYcDf/U4BlVAg8g3AqlpGWW8n2w5mZjiQ62g==
X-Received: by 10.66.163.129 with SMTP id yi1mr858451pab.47.1473107590892;
	Mon, 05 Sep 2016 13:33:10 -0700 (PDT)
Received: from jlock-mobl1.ger.corp.intel.com ([192.55.54.43])
	by smtp.gmail.com with ESMTPSA id
	m24sm35402875pfi.34.2016.09.05.13.33.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 13:33:10 -0700 (PDT)
From: Joshua Lock <joshuagloe@gmail.com>
X-Google-Original-From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Sep 2016 21:32:54 +0100
Message-Id: <cover.1473107499.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2 0/3] Python3 runqemu
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
X-List-Received-Date: Mon, 05 Sep 2016 20:33:10 -0000

This small series against master-next (as the python3 runqemu hasn't made it to
master yet) fixes the new runqemu for a workflow of mine where I build on a
headless machine and copy images locally to test them with runqemu.

Changes since v1:
* drop a patch to replace an ls -t call with Python's glob()
* Fix and enhance reading STAGING_*_NATIVE from the bitbake environment, tested
  with artefacts in a completely different path to the build path and invoking 
  with both the qemuboot.conf file as the arg to runqemu and the parent 
  directory.

The following changes since commit 5b3ac3cd92d1f021c06b22eaa0e74ab8dfb22764:

  kernel-module-split.bbclass: no need for running depmod (2016-09-05 17:45:53 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/runqemu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/runqemu

Joshua Lock (3):
  runqemu: fix typos
  runqemu: assume artefacts are relative to *.qemuboot.conf
  runqemu: better handle running on a host with different paths

 scripts/runqemu | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 3 deletions(-)

-- 
2.7.4

