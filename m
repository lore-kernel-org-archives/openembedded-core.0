Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RCHf8-0003JL-1N
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 23:08:58 +0200
Received: by yxj17 with SMTP id 17so4103939yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 14:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	bh=lo4KGnqpIo0262cDsF3FycBHCbAxuH8RSHgkwiw7ENU=;
	b=uoYv6rl0lsZnlHRuAKs11Db1NY9IPk4cb5Ur43WryrfL+vUB7KuKY9/SzSvUtNX0eR
	NQbk4DYYq2El/+/3lTy4R/yWWSmfASk1/Xabr8o0vAgj68cHMKjICnvN8DXrq9p++0H7
	ZLBw4IDRQUkn54r0K31WOhjXNDGiXpTBEDutI=
Received: by 10.236.128.231 with SMTP id f67mr9107650yhi.56.1318021395343;
	Fri, 07 Oct 2011 14:03:15 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-167-38.ph.ph.cox.net.
	[24.251.167.38])
	by mx.google.com with ESMTPS id x65sm14662621yhg.18.2011.10.07.14.03.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 14:03:14 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 14:02:58 -0700
Message-Id: <cover.1318021323.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/3] A few miscellaneous fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Oct 2011 21:08:58 -0000

The following changes since commit cc626b9e1671670a931ea3e528ea4b0f7b2e923b:

  webkit-gtk: Enable dependency tracking since the webkit makefiles have bugs (2011-10-05 14:36:18 +0100)

are available in the git repository at:
  http://github.com/kergoth/oe-core misc-fixes

Christopher Larson (3):
  autotools: fix multi-word arguments for EXTRA_OECONF
  autoconf: no need to hardcode the full path to m4
  oe.patch: drop bb.msg.domain reference

 meta/classes/autotools.bbclass                  |   14 ++++++--------
 meta/lib/oe/patch.py                            |    4 ++--
 meta/recipes-devtools/autoconf/autoconf_2.68.bb |    4 +++-
 3 files changed, 11 insertions(+), 11 deletions(-)

-- 
1.7.4.1



