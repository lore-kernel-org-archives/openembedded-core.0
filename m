Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id A6BC8745D1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 02:22:10 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id e98-v6so779565itd.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 19:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=rvNQTkj2xqdCkSz8ndLZPIMbpJ7CSe0t3NKBbQ1LTUo=;
	b=qrq4rh7qrzJY/XySr/VlomwMPxt3MdMSCR+lbVmhVgTBwzD2TUjlEltRI86MyBi30c
	e+fy+6xsa82xjRGwWCx8uTmCACaeRlSnEvO9Ipm42Q8YfP2mJPge9JwqqRpulEx32u/6
	Fi/BDkNP2zKwUqgiMjVBjLaxdBokp+womyS0JvD8YT05EcOKVbUr1yWvfDo1cth110lp
	lelpE4R5kGljykfZiNBQmdZ2tJJ6Glf4ZEDuXmbdI4+XAu9n8MFH3/wjEX69QjnW2C/F
	fm7NfpYRIjfjzLaJgLK+q+/SkouWR4xvXfg/mp90EVloiFS8MZzc1IrARD9mzsQSsryJ
	M9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rvNQTkj2xqdCkSz8ndLZPIMbpJ7CSe0t3NKBbQ1LTUo=;
	b=UzzmQ3xgf6qNpTSyT8aBCxf5k8lclOjP+Zc2yesg/TamshvgrP2VtJzVEcUdWU/G6b
	mTpLmRmKcRKILGMFWn8ZhLj36qxDHzri/k0Xvrh/iKGCMFnzqAil10h5Yku9Bc7OfLPI
	nS8zgy6dKCFwQ2PPw4SmzYZ8whRB+ZmnWBufte98Y2u5sdVMTuyUr9RE/x/nbhKt/Sag
	jU5TWwA3+HyV+653wFoTwfLr7s5Vh0HSP1eYI+cxGkiQH/Pj8iG5q+8dXBH+XAeijHUo
	74BLLlEk1mrvLOwruTeCWE2WiePJeRUWnRAVLNDYK3ATGgcLsWxa3cCKcjo55D3yOfCT
	ktDA==
X-Gm-Message-State: ALQs6tDgPLkUiSiMRlxhcGNirHq4Xdgc7lvz/BPKUYfP8A0xZSE/w05+
	PCFGu93+TekCyxfMzpm1Zvd6q0G9
X-Google-Smtp-Source: AIpwx48c6dQthnA4Tf4D2IeqnNUBpD4vTHwAWej/lQmQe5XryZetYwycLBFENrntnM3uqC75GcCvBw==
X-Received: by 2002:a24:64d8:: with SMTP id
	t207-v6mr2009031itc.112.1523413331121; 
	Tue, 10 Apr 2018 19:22:11 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id w71sm34498iow.87.2018.04.10.19.22.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 10 Apr 2018 19:22:10 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2018 21:21:53 -0500
Message-Id: <20180411022200.22277-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [sumo][PATCH 0/7] Icecream fixes
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
X-List-Received-Date: Wed, 11 Apr 2018 02:22:10 -0000

Fixes a number of bugs in Icecream toolchain generation

Joshua Watt (7):
  icecc-create-env: Allow logging to a file
  icecc-create-env: Fix RUNPATH files
  icecc-create-env: Fix library interpreter usage
  icecc-create-env: Add extra tools option
  icecc.bbclass: Add ICECC_ENV_DEBUG variable
  icecc.bbclass: Improve error reporting
  icecc.bbclass: Bump version number

 meta/classes/icecc.bbclass                         |  26 ++-
 .../icecc-create-env/icecc-create-env              | 202 ++++++++++++++-------
 2 files changed, 159 insertions(+), 69 deletions(-)

-- 
2.14.3


