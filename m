Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 17973601DF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 20:49:51 +0000 (UTC)
Received: by wiar9 with SMTP id r9so15925463wia.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 13:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=BboxKi3GXEkhMsxKalAOnLEOB0gvJIu0p45RD3s5LTw=;
	b=zv0O/uz/Poursm5shVqedlnE3yv3SOjbg9BwLBHqFy5c4E8cFkPyDSG7+qK1xjfnen
	p1FMLnBkj5MNccqpY/HSEofAQoKmKrZ6+Rvz6T365S7rsLzoaZ2x3zHQ9DAg2wC2m69u
	Mr7JteBKlcgXyMA5JahyCi83rNBhfXIJUQv5ed9RlPntUeMvto5bf5sqJcVHoDSYn0wo
	Qon0d2I0OFVzbmpCICH5krbVZdju4pnx/ucv68VsKySvhxST+9YcidI4aYNuf6BSzMdB
	iHogGhYLsBl5v2oJbNZXoH7YFY6xRfxoH8+9pn5/o26GVHwQ5j/g0V5jLb5tQLiv6EhM
	vFqQ==
X-Received: by 10.194.189.80 with SMTP id gg16mr32573965wjc.9.1435610992129;
	Mon, 29 Jun 2015 13:49:52 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id fm8sm13781415wib.9.2015.06.29.13.49.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jun 2015 13:49:50 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 13:49:58 -0700
Message-Id: <cover.1435610769.git.kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [PATCH 0/3] One recipetool fix and a couple enhancements
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
X-List-Received-Date: Mon, 29 Jun 2015 20:49:56 -0000

With this in, we can add custom recipetool commands in layers, which is
a useful capability. For Mentor, I intend to add
https://gist.github.com/kergoth/14ea8d0932f321b60d49 into
meta-mentor/meta-mel/lib/recipetool/ to get some convenience sub-commands available:

    $ recipetool kernel_set_defconfig meta-mylayer /path/to/defconfig
    $ recipetool kernel_add_fragments meta-mylayer one.cfg two.cfg
    $ recipetool kernel_set_configs meta-mylayer CONFIG_LOCALVERSION_AUTO=n CONFIG_LOCALVERSION=-test
    $ recipetool kernel_add_dts meta-mylayer *.dts

The following changes since commit 592a1d94a7b0e80059016adb59c4c61e256206f0:

  oeqa/parselogs: Whitelist qemumips64 runtime error (2015-06-27 22:49:49 +0100)

are available in the git repository at:

  git@github.com:kergoth/openembedded-core recipetool-bits

for you to fetch changes up to 974591c62ec573ee96badb28786aacd3df35ca53:

  recipetool.append: add extralines arg to appendsrc (2015-06-29 08:31:45 -0700)

----------------------------------------------------------------
Christopher Larson (3):
  recipetool: catch BBHandledException from parsing
  recipetool: also load plugins from BBPATH
  recipetool.append: add extralines arg to appendsrc

 scripts/lib/recipetool/append.py |  4 +--
 scripts/recipetool               | 73 ++++++++++++++++++++++++----------------
 2 files changed, 46 insertions(+), 31 deletions(-)

-- 
2.2.1


