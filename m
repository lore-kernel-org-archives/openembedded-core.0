Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id C6B457E5FB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 04:33:41 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id r18so10944457pgu.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 20:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=q4wFH1hw7H6hIKoT8pOVqU2cjkF/wsg9yGSHpxQO0EI=;
	b=N+NZkCtRnmdUj+Pxs6x5QbrlHxqs7+JOknUGhJG7aMQ2OD6hwvq69NstPaR/88n2cI
	sjTzFAoS+TeBcOGpMVo3biaR3EQ3UPZEMo7pi18oXVfQTSG2QBRPKwulYxiMJUfTksXo
	43iIoDjQaGmHhugshVIeIvYd/yTEjQto8Gdiv+O8lvuUCSQUTJ9iMenSgBsNBPNpvmgj
	kWnBdNcqCHbXMk6ucTkQqS4m6rMhA4FTqomqAXMw8mhj0jSOHTe/OVTWNFep/gM72v1S
	vKOAU8XzdD+JMr8fs5vbnHldc48Wy9kHHQDjOPmgB9sdsbODH8CLC0RxedmSUtItPJAC
	azPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=q4wFH1hw7H6hIKoT8pOVqU2cjkF/wsg9yGSHpxQO0EI=;
	b=kmcrLe/ZkIy1uT+9TQcs6zdyDAwHSaMrjSyR6LoYpeZJxlFbb1O/4ywSTkjyKxMaVe
	BPVqsLMhsjuoPpLt7d0j/faDMNrg55a3Jtk3NgGkRRsytrIj/jXIIhc5sE4cvxAmioT9
	ieofA7KlFCMd0weTO5gHK5mjbSlD/IJZiGf3GmNmYCzGmjh3OCeS7iaJkDCe6uRTJq85
	ak25QOaX8p95FXMKKb7AQhSFG/7a1Mz9h1/SaZzZiAM1SEqJ6FNv1dszpepKiUmOS5AK
	GLwPME0dtZat34pTclB7ZUrmZR4IPsWh2K3drpPpItNOW1P4GW0YSpGAGxUVTRmc9EuB
	dIvg==
X-Gm-Message-State: APjAAAX27BvpN6nUnl2TgOWz4nA9paJ7T1XWCYb2RegnRziKw2HZe9BU
	/61AcvrYwiJ3MOm69iLB8SlonHK8
X-Google-Smtp-Source: APXvYqwp2RHW0ro7cFgP+KwxLGKvlQMszyFnCQ4/g3vI5Q4SMmVAAUbrIgpiqoi2N346hDxaisQ3MQ==
X-Received: by 2002:a65:6145:: with SMTP id o5mr31888704pgv.38.1573533222566; 
	Mon, 11 Nov 2019 20:33:42 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	q12sm5212109pgl.23.2019.11.11.20.33.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 20:33:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 20:33:19 -0800
Message-Id: <cover.1573532188.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/20] QA updates
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
X-List-Received-Date: Tue, 12 Nov 2019 04:33:42 -0000

This series moves several manual tests to selftest, deletes others and some cleanup.
Deletes manual tests covered by runtime or selftests.
Deletes eclipse manual test resulting in three manual json files removed.


The following changes since commit 4dc804b2deda249f72c6941639e781dfe6ca865e:

  systemd: Add runtime dependency on new ldconfig package (2019-11-11 14:07:01 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib akuster/qa
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=akuster/qa

Armin Kuster (20):
  OEQA: Add a check for MACHINE
  OEQA: Add qemu checks
  OEQA: Centrilize the base LTP routines
  OEQA: update ltp runtimes to use new structure
  OEQA/runtime: Add ltp stress test
  OEQA/manual: remove crash stress test
  manual qa: drop ltpstress test
  manual qa/bsp-qemu: remove rpm tests already done in runtime
  manual qa/bsp-qemu: remove KVM enabled which is already done in
    selftest runqemu
  manual/bsp-qemu: drop xserver test done at runtime
  manual/bsp-qemu: remove only_one_connmand_in_background test done at
    runtime
  OEQA: remove postinit test done w/selftest runtime
  OEQA: eclipse support was dropped in warrior
  OEQA: move manual bash test to runtime
  OEQA: remove manual bash test
  OEQA: remove manual useradd test
  OEQA: move list-packageconfig-flags tests from manual to self
  OEQA: remove manual PACKAGECONFIG_FLAGS tests
  OEQA: add crosstab selftest
  OEQA: remove crosstab test from manual

 meta/lib/oeqa/core/decorator/data.py          |  89 +++++++
 meta/lib/oeqa/manual/bsp-qemu.json            | 222 ------------------
 meta/lib/oeqa/manual/compliance-test.json     |  76 ------
 meta/lib/oeqa/manual/eclipse-plugin.json      | 322 --------------------------
 meta/lib/oeqa/manual/oe-core.json             |  78 +------
 meta/lib/oeqa/runtime/cases/ltp.py            |  85 +------
 meta/lib/oeqa/runtime/cases/ltp_compliance.py |  73 +-----
 meta/lib/oeqa/runtime/cases/ltp_stress.py     |  29 +++
 meta/lib/oeqa/selftest/cases/oescripts.py     |  59 +++++
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  95 ++++++++
 meta/lib/oeqa/utils/ltp.py                    | 133 +++++++++++
 11 files changed, 413 insertions(+), 848 deletions(-)
 delete mode 100644 meta/lib/oeqa/manual/bsp-qemu.json
 delete mode 100644 meta/lib/oeqa/manual/compliance-test.json
 delete mode 100644 meta/lib/oeqa/manual/eclipse-plugin.json
 create mode 100644 meta/lib/oeqa/runtime/cases/ltp_stress.py
 create mode 100644 meta/lib/oeqa/utils/ltp.py

-- 
2.7.4


