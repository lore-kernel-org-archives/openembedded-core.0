Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id B7E736013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 13:28:38 +0000 (UTC)
Received: by igbhl2 with SMTP id hl2so820233igb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 06:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lcKuXfSgclEfUJXYKsbMYeZ2ZBt54aiKEZHrX0diJQ8=;
	b=OvgC0nO3mfUWyHIiRn3xEj9UNgfw4TeUvhGmK4fHPliPMC1MJiu2ziN44AgXtZpTi1
	6pWf6Pc+jiEjv5ONtSGtcEg2clMwIsGSsAhNHgd7lZyiFICet/o4MbOlkfjbLxgcqjRV
	Kt4tQoCPGDPmoyHdV9sqQY5Hb40Ab1vjF8mb00zIWj/rs122NBP9Sx35xZyKu0K15CFH
	6Sdm/OIUc4xcT/1gxP32RydMz9eD985TOKyyIY7ziMM5Uus6Op5mgzJtX6oNxPHNV6Q9
	9+EexuJtelPJzQc1PZxi+qBNsRe6d3zu7c2YLGEdEytDPlBDDDPQFC83oaUnZp/zY06H
	OhRQ==
X-Gm-Message-State: ALoCoQnzeQnxIvSoaZskQP0Kqhleb4odas+uRLBWu25HmNDxQ+EGw4Xbi2jML9VWT9hivJK9PYt8
X-Received: by 10.107.9.88 with SMTP id j85mr72405730ioi.60.1426253319933;
	Fri, 13 Mar 2015 06:28:39 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8C8C2.dip0.t-ipconnect.de.
	[93.232.200.194])
	by mx.google.com with ESMTPSA id h19sm1268716igq.10.2015.03.13.06.28.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Mar 2015 06:28:38 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 13 Mar 2015 14:28:31 +0100
Message-Id: <cover.1426252888.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/11] combo-layer enhancements
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
X-List-Received-Date: Fri, 13 Mar 2015 13:28:39 -0000

This replaces the four individual patches sent recently. It addresses
the comments that Paul had, fixes one issue in file_exclude filtering
of patches when combined with dest_dir, and last but not least,
introduces full history importing during "init".

For the separate fixes see https://github.com/pohly/openembedded-core/commits/pending

The following changes since commit fb29441216435b9bae47ca9cd42db5a6b1fe77d8:

  oeqa/parselogs: Skip hda opcode errors (2015-03-12 12:49:22 +0000)

are available in the git repository at:

  git://github.com/pohly/openembedded-core combo-layer
  https://github.com/pohly/openembedded-core/tree/combo-layer

Patrick Ohly (11):
  combo-layer: let user choose where properties get updated
  combo-layer: make Signed-off-by optional
  combo-layer: runcmd() with separate output
  combo-layer: exclude files
  combo-layer: update() also instance property
  combo-layer: init with full history
  combo-layer: combine trees via replacement objects
  combo-layer: partial import for '--history init'
  combo-layer-hook-default.sh: avoid duplicating prefix
  combo-layer-hook-default.sh: beware of embedded patches
  combo-layer-hook-default.sh: handle patches without Signed-off-by

 scripts/combo-layer                 | 277 ++++++++++++++++++++++++++++++++++--
 scripts/combo-layer-hook-default.sh |  11 +-
 scripts/combo-layer.conf.example    |  37 +++++
 3 files changed, 311 insertions(+), 14 deletions(-)

-- 
2.1.4


