Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC4165D35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 15:33:50 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id v202so15579572itb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 08:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=c+91hsq4g4t4DP+RT4EnN9rOZqfJRqEKNSt6ypmWsQE=;
	b=TMuGQbz7CsJp1HY/NBIOVUpBqKbNQ95BqlRLpT6eLUM1hYA7jCYKsh/lGDmu2ANSHl
	CnQ24cZFEc1pFN2ABhAtjKMvI6x1XHnKbRI4J0ygR6ae4cImGnK0jsAG6APr7jp2iRJc
	TyeJad1Lf5PFKgFr+BcGVOy+AaRV0x4GZ1mVYIHZEJ0Y9ucnRGaThCTWlhNj2+sMtnsM
	nkaIhdRCcZm6ZcOedvlIiP7GHhhnbPGmAKBaySOwJyYUJRkvDO4w88Ml25Di5McjTr4J
	Sv9puXgK3cm+ZugWhI1qWyKVh9lYVftM4dk9cjI4B45m5WuOyGh7nGr+wdwaEPvBxkKq
	Rqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=c+91hsq4g4t4DP+RT4EnN9rOZqfJRqEKNSt6ypmWsQE=;
	b=BKoTAz7obTU636qXp91OabmrpMQ5Ip5AN+ddErEy9weQvhLuw0+S/DZwWel0hDsEjq
	MQDpRzCt6+1rifNbDvL9J2Eb8KoFJDjHKid6kdNNp0fMBP+yi3yLyWjuQMG7mRKLCDDO
	HQhz91gsmgXoNnj3ZdRmWahtyRLuYTekjtKTQ6LJ/38P4Kbt56stTsKKLAd+SzkGMxGO
	SSnNLT8O9xN2MGWnL+PAduoEOhUZ8ma+SIYNFyr9LxcgJ/Toy5NuuVOCM21lQhqIdvtx
	OZOet3ONyf26qj26K5+9QBf2bM4UpqEcBFxYAfE5KdOWTDWxXg8IP1WTay3FwjvF207n
	2zLw==
X-Gm-Message-State: AKS2vOyrGVogNA17K0cgP599Q6VU1CTVxxtUPUFEgF5f3VdP6316fbgX
	fpNIsBuq2G66oBtmcek=
X-Received: by 10.36.36.131 with SMTP id f125mr3178803ita.37.1498577632098;
	Tue, 27 Jun 2017 08:33:52 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FB9F.dip0.t-ipconnect.de.
	[93.232.251.159]) by smtp.gmail.com with ESMTPSA id
	f40sm1702550ioj.19.2017.06.27.08.33.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Jun 2017 08:33:50 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 17:33:37 +0200
Message-Id: <cover.f2f002a814bb8f4571ff6f9fd7cb880b94cc611f.1498577501.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.393a6efac99077bd222866024d8e18f371414195.1496071841.git-series.patrick.ohly@intel.com>
References: <cover.393a6efac99077bd222866024d8e18f371414195.1496071841.git-series.patrick.ohly@intel.com>
Subject: [PATCH v2 0/6] yocto-compat-layer.py: various enhancements
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
X-List-Received-Date: Tue, 27 Jun 2017 15:33:51 -0000

While enhancing the layer structure in intel-iot-refkit I ran into
various cases where enhancements to the tool were
necessary. intel-iot-refkit now has oe-selftests that check all layers
using this tool. In addition, the signature checking utility code is
imported into a custom test that also covers a refkit specific case
(including refkit-config.inc must not change signatures).

Changes in V2:
- turn signature checking in software layers on/off via command line flags

Patrick Ohly (6):
  yocto-compat-layer.py: avoid adding layers more than once
  yocto-compat-layer.py: tolerate broken world builds during signature diff
  yocto-compat-layer.py: apply test_signatures to all layers
  yocto-compat-layer.py: add test_world
  yocto-compat-layer.py: allow README with suffix
  yocto-compat-layer.py: make signature check code reusable

 scripts/lib/compatlayer/__init__.py     | 90 ++++++++++++++++++++++++-
 scripts/lib/compatlayer/cases/common.py | 92 +++++++-------------------
 scripts/lib/compatlayer/context.py      |  3 +-
 scripts/yocto-compat-layer.py           | 12 ++-
 4 files changed, 125 insertions(+), 72 deletions(-)

base-commit: 20b3574749420a1fef2cb2e0579584453dd4c5c5
-- 
git-series 0.9.1

