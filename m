Return-Path: <kergoth@gmail.com>
Received: from mail-pl0-f43.google.com (mail-pl0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8025A784DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 21:08:32 +0000 (UTC)
Received: by mail-pl0-f43.google.com with SMTP id t12-v6so2315017plo.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 14:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UAEbVy72UBC3wQGp5eCI5ZlikhIL7tjlb9l00xVXx3g=;
	b=QUtD+qzDaE8EUp8H1oe6XBjcDedirqzGVS1GoY1wpThbW1k/xgk1/fhRyZMTE0pkDv
	+xG0IBkyZJ8x5G+eUJQ6phF2X3q85YGIGfZ7Sj8KNEVWSrGtBEskUlu+At5Vow8NRzAR
	6y98M20A89tTvJW+NguYyo1j0goAJfbkw2o9biGIPjb5BO/X+Y8pJ8+fiG4zL3E8BDIf
	2Sf2rkCN+vzIEJjzUkysMfQCbus77uaLKoKwk/sng7cCIiuBUN/XvYovgCOYedgrYbOu
	dNwqfYjunc1zmaZ/Q2rnMsUCRA+8cUZKzaVORVc0jXez5jRmUVegZ2XjxGmw4gp2aTH/
	X6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UAEbVy72UBC3wQGp5eCI5ZlikhIL7tjlb9l00xVXx3g=;
	b=JS8It7/zqHDY9vbxfSh0C/x9MIZyFr76Eh48wGCnxYd9uMaWPd02xmpRuggUc7+JrM
	K9D+EzIKL6hzeo864ma7ofVffOFDKdJUghS/NIDoqD5xdeg+1sPN4Bqva98cnHyPJDpg
	6aYR2yMlEX23iKGPjU+re9X4mSsIE/tgQSrBf+GBxz3ZdBiRkHX0sYmMQRvYt008wD9Y
	MxOfd9eFR66i2eGRidBanPKqy/4dnTA6OTwL0QPsF/fToUHTdXOfB61XZf4PSmWp241N
	EHzO/ZXMRjdXJU9Z3YLUt6iH8hUtx5LMeFvu9s4TvNZO/86A05uTM7ebDEKUsL1HKUMo
	kZfA==
X-Gm-Message-State: APt69E3WQT8HOM6OaXeJsQAKjeTzpmfy9nvNhdhZhYGiU8/FPfuVe/Su
	+utUPEeNE37TcDHdvxtzvidCcrvU
X-Google-Smtp-Source: ADUXVKLWAW+UP7oKyBy82KPbyVni89pEcTySvn2MztvPNMAsHDsaSR7B73/opf6g6W+fpB6HSQD+Fg==
X-Received: by 2002:a17:902:8b85:: with SMTP id
	ay5-v6mr30512720plb.30.1529615313409; 
	Thu, 21 Jun 2018 14:08:33 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	8-v6sm10513508pfk.132.2018.06.21.14.08.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jun 2018 14:08:31 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 02:08:18 +0500
Message-Id: <cover.1529603271.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/5] Pull postinst-intercepts from BBPATH
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
X-List-Received-Date: Thu, 21 Jun 2018 21:08:32 -0000

From: Christopher Larson <chris_larson@mentor.com>

These are the bits to  allow us to pull intercepts from BBPATH. This is kept
as a separate class, as it's needed by both image construction and sdk
construction, the latter to support meta-toolchain & similar recipes.

The following changes since commit 83c9405df5748744ef673ac8757bb89d7050ad8d:

  alsa-tools: rewrite packaging (2018-06-15 11:18:15 +0100)

are available in the git repository at:

  git@github.com:kergoth/openembedded-core.git bbpath-intercepts

for you to fetch changes up to 4bb748f4c9b177722a13a1f09dcd86b4595752ea:

  populate_sdk_base.bbclass: inherit and use bbpath-intercepts (2018-06-16 02:05:39 +0500)

----------------------------------------------------------------
Christopher Larson (5):
  oe.path: add which_wild function
  oe.package_manager: support loading intercepts from multiple paths
  bbpath-intercepts.bbclass: add class
  image.bbclass: inherit and use bbpath-intercepts
  populate_sdk_base.bbclass: inherit and use bbpath-intercepts

 meta/classes/bbpath-intercepts.bbclass | 23 +++++++++++++++++++++++
 meta/classes/image.bbclass             |  3 ++-
 meta/classes/populate_sdk_base.bbclass |  3 ++-
 meta/lib/oe/package_manager.py         | 19 +++++++++++++------
 meta/lib/oe/path.py                    | 34 ++++++++++++++++++++++++++++++++++
 5 files changed, 74 insertions(+), 8 deletions(-)
 create mode 100644 meta/classes/bbpath-intercepts.bbclass

-- 
2.11.1


