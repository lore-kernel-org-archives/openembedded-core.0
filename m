Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5D202719C3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:21:27 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id y21so51677561lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BsKUik13rONrdGNCDzDXZ9GmVlAPCdXDtKvxWimc07Y=;
	b=IFhiiD/VZZAWuN0CzvVVRs52WQT+qoqntulVt1LZxSyfXzUo4Yat4wMVNKouBPoTmo
	VtNgNBMF2kn7p+wU1IBk27fU/lgNGOu7x/z5IFRbwyhpLwOW0akdN87y0AW4pFL6uEDe
	Hus8LuBMWtqoeA/OewjKg6zZZ/7H7l81JxlP1fdLQKOYc2w1S8TmxlvP3Qqy/d+eVEO3
	JqqHOvQpTk7F/IaIyJJh5rhYkCWnMcWaaKzTsEjHhmVd+hZO1adPIDXRj4aImQEyRCMO
	atkyWtOXbon6spnkjizeAXZMstXTiEg1/F+5tyath5t7brXXO3+VyBc8Uv5qx7OIDAbq
	BEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BsKUik13rONrdGNCDzDXZ9GmVlAPCdXDtKvxWimc07Y=;
	b=BtJiGTnRLRA0Ue6r0dRR4m9Z8R+JzuEg+1u4maeZPXKnQ7NFSiPrYsB/tv959SqdtF
	iBjPy14fIxstgNfNn0f4E9G2Vh79XLhRJUpAwpnTgrQ1XHFrszl7cHsWWf+gzFEv7Zcm
	0Mq8aFAf8nzcOAaF9dL6S5ffLB2OTUhDM898TX+1XdNIIVmHZStUtiuKOUjcUI/e831R
	PVhEPkUo0QGXywtF3QdLAkPx77PbAUbhbaD0xs+w5SJAu8bdBstwwPmJsg+7rxahi/SU
	HonGvixsIH9En4pwQ35rn0SXkE8Yqw+pzBi3SJnw14Ud9eMQNrMADKFdi6lYE/inT33G
	a9fw==
X-Gm-Message-State: AIkVDXJ4+9MlfAj970VcEm53GFGrTFTyMpRPnvF0n2GBx8qUNoFHuBXAeVnvChd5pfd+lQ==
X-Received: by 10.46.70.17 with SMTP id t17mr858154lja.38.1482146488918;
	Mon, 19 Dec 2016 03:21:28 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id c2sm3681892ljb.8.2016.12.19.03.21.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Dec 2016 03:21:27 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 12:20:56 +0100
Message-Id: <cover.1482145354.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <20161213185317.GA6550@linux.intel.com>
References: <20161213185317.GA6550@linux.intel.com>
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v6 0/5] wic: bugfixes & --fixed-size support, tests, oeqa: enhancements
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
X-List-Received-Date: Mon, 19 Dec 2016 11:21:29 -0000

v6 of a patch series previously posted here [1].

Changes since v5:

* `oe-selftest: enforce en_US.UTF-8 locale` was merged to master, hence it's no
  longer part of this series

* rebased on top of master (d0d260b0b85790ceb136dd6b0445e8e33d038f5e)

[1]. http://lists.openembedded.org/pipermail/openembedded-core/2016-November/129187.html

Maciej Borzecki (5):
  oeqa/utils/commands.py: allow use of binaries from native sysroot
  wic: add --fixed-size wks option
  wic: selftest: avoid COMPATIBLE_HOST issues
  wic: selftest: do not assume bzImage kernel image
  wic: selftest: add tests for --fixed-size partition flags

 meta/lib/oeqa/selftest/wic.py          | 117 +++++++++++++++++++++++++++++++--
 meta/lib/oeqa/utils/commands.py        |   9 ++-
 scripts/lib/wic/help.py                |  14 +++-
 scripts/lib/wic/imager/direct.py       |   2 +-
 scripts/lib/wic/ksparser.py            |  41 ++++++++++--
 scripts/lib/wic/partition.py           |  88 +++++++++++++++----------
 scripts/lib/wic/utils/partitionedfs.py |   2 +-
 7 files changed, 224 insertions(+), 49 deletions(-)

-- 
2.5.5


