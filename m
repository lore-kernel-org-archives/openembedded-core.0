Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
	[209.85.166.44])
	by mail.openembedded.org (Postfix) with ESMTP id 751DC7CBD5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 15:43:17 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id u19so1814241ior.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 08:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5aSe3wN4lQEm+KK1y5wjVP/qHpW+oZE28xlEYWzgOr4=;
	b=nMlLbUnehwoiXdfNzIRFAPZHz/zuqjYtOX1XFtnghwDmVYl/cjGsBwxlO17pJSbAuC
	vVeCHU9s/81vO26yS7wRDz++0AMM8p4yk5uC2o1VcyF2+0NvBSelFi9mx5V8sk4ic2SU
	aZZj2bCXvqRLfUGE0Jr5X7IzA27DiK5+9xEdD978AU9Owk9PYAka/YQt9oV4/Tl+XQxE
	plSQJ3zX27y3cVNQ6BSzEOfSIAp0S3wuxE8bP2R9++PO412fg/ifhcnVRRJSY7jWweEJ
	NvhgWD1Pa+cGYYy2hSjO9sGZxGktHeOLHeI+lAvtZQdi3YaXostByzj+J/wb5TfEBwMI
	wgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5aSe3wN4lQEm+KK1y5wjVP/qHpW+oZE28xlEYWzgOr4=;
	b=QmJx2zS6Si106tUoilDnskk/nUkVrRoVDPQsjoNfu5MOXH6uxO0ceOX0O5IzlMOtHQ
	aU0/2zrc4ORJBUCBazjyrfsa7eTv/3ktifVWlFqr/Fw/DD7ufI1HxL1cd+/s0n+NlmTK
	vIaHtWHMTR53T6QhjW+r0Mog/CpcWXzpDhy1du9oqpD2ibd6EqCxhZgnjqq/twBNnJx3
	CHKKs+CZBMpcgPTJHR2bnjpsMJBUdVU6fZp5yRIX3qC7H+nLvLDgi/7q0t6Chrvr2PjW
	Buge1XjrYuABdKXgGPYtyiKgcWnR99TmL2z/q+WUqIbXDPVN34BBnXQW/9xTyiXsdmoG
	nXCA==
X-Gm-Message-State: APjAAAWViP1HnKxQ/tTxu+RDhawsMhBi7nGSlXdjf0MKdu58qwFpXzfJ
	gtXmaoi51lYnnIDTl2VKTlAPvYNe
X-Google-Smtp-Source: APXvYqy+PUMFYBHszFnemTiFPiVqs4yfe2VODMfz3veMkDsEgEbz+a7J3Mzt5ckMkNaU7iG/vbfcew==
X-Received: by 2002:a5d:9282:: with SMTP id s2mr20562639iom.36.1561045398220; 
	Thu, 20 Jun 2019 08:43:18 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id p10sm166267iob.54.2019.06.20.08.43.17
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 20 Jun 2019 08:43:17 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2019 10:43:00 -0500
Message-Id: <20190620154302.9251-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 0/2] python3: Reproducible build fixes
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
X-List-Received-Date: Thu, 20 Jun 2019 15:43:17 -0000
Content-Transfer-Encoding: 8bit

Two fixes to make the Python3 build reproducible

Joshua Watt (2):
  python3: Reformat sysconfig
  python3: Disable PGO for reproducible builds

 .../python/python3/reformat_sysconfig.py      | 21 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.3.bb | 20 +++++++++++++++++-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3/reformat_sysconfig.py

-- 
2.21.0


