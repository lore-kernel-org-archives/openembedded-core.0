Return-Path: <patrick.ohly@intel.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 657CF7852C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 14:57:03 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id c14so46796049pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 07:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=5/G18RRRGRbJ1pvl6Mvj2poAURtb/bpsr+QUdmFn8Tw=;
	b=RL+1zoRiIlow87FZPuISi2EX4lA08VULBRPUCS/41qciThmRJ8x9GW4A6zNVSbvCNd
	yj6XMNbXLCGDnHmgiBkkX/pXsaR1yZmFrI7c6FIdwU4OqCb7eAb5Y3wzNVpF2ykZMNH9
	myU4R5Uki8VW3hPLMePaID1WyFs2Yc5j87F4YWBNHRNuvQ/J70bWWytoL2wkq49Ht2pi
	kwUDjLYkIxew0fM6wvrjEfLjTGVUq/zfBCATTkVBOjRuq6ViqGHBF9IAZq/FWeZ1QpeM
	dHiCEyLrCOvEAT1nVpliYH6E6iQ4Hh+F/C6iuKZ+2NZjc2bTO8D83KPNWwVtjfOaa1Nf
	mLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5/G18RRRGRbJ1pvl6Mvj2poAURtb/bpsr+QUdmFn8Tw=;
	b=iWX9qhtyTxoTHW2yEOc2T+PJdJvQXdKADgeOu6mxVRSDyhdVlcxswnCrHJBBRDbHhv
	KjDiW4YvCv85jN7f+X8JBh8NheoPMXdcZFTtuxSHwz1FIsg1WxueKAgPUiTdDqw109tQ
	yGE/h8F6np89cvkz4jg+8q05hA4CllA+JHIXtoV/6fVJ92OX3mK6YkaWLMbikzQsK6uy
	2rVAVxoQ+Zhr0JFzMabvxnnxKauyafDRBDMDsnxl6W+qIoSgPciuX3+WkvUWFTz2/N5f
	ielx68g1Z8RrTOGlB2VushnEVEyDcHTqX+6vswpC5H/6g5Tw02dmel/X1kmK9DpGpJ5g
	bvSA==
X-Gm-Message-State: AIVw111GYOPtNUz090B9w5rFeXca+RZmkYANbYpz4cbB/sn91qFxXGHi
	CYf6n6MGjjRRRihsAsE=
X-Received: by 10.98.159.16 with SMTP id g16mr16086063pfe.21.1501513024252;
	Mon, 31 Jul 2017 07:57:04 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FE53.dip0.t-ipconnect.de.
	[93.232.254.83])
	by smtp.gmail.com with ESMTPSA id s8sm5823850pfd.77.2017.07.31.07.57.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Jul 2017 07:57:03 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Jul 2017 16:56:53 +0200
Message-Id: <cover.d5ac661bf06568770da90f3e88828979c242547e.1501512975.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v3 0/2] move autoconf-archive into OE-core
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
X-List-Received-Date: Mon, 31 Jul 2017 14:57:03 -0000

V2:
 - removed the gnome-common dependency that was still in V1
 - merged the .inc file into the .bb file and cleaned up the recipe

V3:
 - LICENSE = "GPL-3.0-with-autoconf-exception"

Patrick Ohly (2):
  autoconf-archive: move from meta-oe to OE-core
  autoconf-archive: simplify and fix recipe

 meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb

base-commit: d3a41fbd94462efc8c6f1b55f6fb54001b447c45
-- 
git-series 0.9.1

