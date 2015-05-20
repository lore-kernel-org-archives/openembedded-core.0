Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id AB7FB600B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 11:48:27 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so99900071igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 04:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=h1R/cxJbmBK4lB7y4/rB0tcHS/WsCHepjeJrM6lSfRw=;
	b=XW96pN6YRNbcW8A9khZyZarbuZ9eFn4P7aJEQ9yXOlVrEq4rZb0FP8Fk7beLxwaQtR
	l7WzHvARU8BgsB4hDV7/1xz+zisDk/a0IzJKx6sQySacrMoGCo7HAaxm83BA6EEW7iKW
	tPvIWuME+Q+mHvMGOf4uE+b7yXrG7rxPi6UcTUg0HRpQN+JEpMzNAyIir+M2AGUpoOXa
	iMPRleoLJTZ0bGj1/qX5hxq9foldCrRT5op1xHchYHxfGOWGnd+MAKT5Ry0cwvtFFR3q
	TZgdYV6L5Esun1HtHaG7mRrnP9eofqgImwoUarDpGTmNe8Dqpe85WlH3fgdTWFZpnZSK
	oIMA==
X-Gm-Message-State: ALoCoQmxsGkusGDhA44tZsGpfElHECTWuwNghyN7B23tJuXVKuEiF9SjMJrAimBqKgsnnpOjXGr+
X-Received: by 10.107.165.206 with SMTP id o197mr26313336ioe.56.1432122508596; 
	Wed, 20 May 2015 04:48:28 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p57A56B24.dip0.t-ipconnect.de.
	[87.165.107.36])
	by mx.google.com with ESMTPSA id o15sm1416373igw.11.2015.05.20.04.48.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 May 2015 04:48:27 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 May 2015 13:48:19 +0200
Message-Id: <cover.1432122320.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/1] combo-layer sanity_check fix
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
X-List-Received-Date: Wed, 20 May 2015 11:48:30 -0000

The following changes since commit c0f0b6e6ef1edc0a9f9e1ceffb1cdbbef2e409c6:

  glibc: CVE-2015-1781: resolv/nss_dns/dns-host.c buffer overflow (2015-05-16 22:37:21 +0100)

are available in the git repository at:

  git://github.com/pohly/openembedded-core master
  https://github.com/pohly/openembedded-core/tree/master

Patrick Ohly (1):
  combo-layer: handle unset dest_dir in sanity_check()

 scripts/combo-layer | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.1.4


