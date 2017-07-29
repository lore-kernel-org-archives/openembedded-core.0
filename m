Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9C33478541
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 13:38:43 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id 33so107263858wrz.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 06:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=d4/RN3+6Jv0pnNjv3EWOnxCqhIgNyDGu/o4g4/iy+nc=;
	b=T475i0KJhxQRCXUn2Lw63w3kHy60TUvmHKQgBRrRBnW/ragq55qMOiVy7fuS5Nnn2Z
	CEjTWFYKuJhnReTYnCkicNSxF+XSuUyIsmvpURvIE8U1m/7UWfuerhxBieUkm48QofgD
	n6f0BLIVK39QIak561iv58kNb+FuOc0DuJlVScp4zj1BUUitFYc5oVG+lUGOjhTxTeW6
	1J0HaqdYH0v2JQvj0RpjnxQJrVeajBzKkYxsiE8Oj+ilZfe+AqtXkBNDz45yNhmfpXYp
	FW/iO7n6kTs31ximefIU64L1c7SzjsPX3Cf4FWLBJHezP/VTRC8tuWZddL4Ne2kGpzDc
	wDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=d4/RN3+6Jv0pnNjv3EWOnxCqhIgNyDGu/o4g4/iy+nc=;
	b=osgPggYxtVQn9/CqKYNv3lJp321oV9uENeNK1clqasJ+TLDZmcbqwXovB381HI5yzx
	ui6ZlfPNpdpgEabMISTlmGoKr6AQlx/JmVRTp0XTv5DWbfisUddi7urreGzhies3mU32
	jJ2YFY3ZCXr2JEJYqcP1Qa37StBthZ7UIpmBYoRRu6UzlX9bG7o081C/n7MY4T5Rdxvr
	xrWCheV/UV4YxvtPsT4rG6RzyEaDjPojen1fE+qw5CwbiCZ8DWMq3OnpnK9zHBiRx1FA
	kWhpB+1IWhIiIMShcEG4n0vSJTiDmGGvvYAl7XZK27UjvYSBs530QX7zIp8Pm3iLRF8+
	zwqQ==
X-Gm-Message-State: AIVw1128hEohIqCX9DqOIZXCVFQpIc2qtzb13kLQt02MbZB1Op0KjbCN
	LrFvUSPet5HJWFxTB5Y=
X-Received: by 10.223.171.184 with SMTP id s53mr7913971wrc.75.1501335523906;
	Sat, 29 Jul 2017 06:38:43 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r128sm18704945wmb.27.2017.07.29.06.38.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Jul 2017 06:38:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Jul 2017 14:38:36 +0100
Message-Id: <cover.1501335449.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 0/8][pyro] Archiver fixes
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
X-List-Received-Date: Sat, 29 Jul 2017 13:38:44 -0000


Hi,

The archiver had bitrotted and the recipe specific sysroot changes were the
final straw.  Backport a number of patches from master so that it works again.

Ross

The following changes since commit 9d7c958940adeb066517ab6082167163ae9db2ca:

  bitbake: toaster: noweb should init database (2017-07-27 22:36:46 +0100)

are available in the git repository at:

  ssh://git@git.yoctoproject.org/poky-contrib ross/pyro

for you to fetch changes up to f8b01d64b8708d7d734f041ac050790f067c1837:

  archiver: preserve sysroot paths in configured mode (2017-07-29 14:05:24 +0100)

----------------------------------------------------------------
Dengke Du (1):
      archiver.bbclass: fix do_ar_original error for matchbox-desktop

Joshua Watt (1):
      archiver: Escape recipe name in regex

Mikko Ylinen (1):
      archiver.bbclass: adapt do_unpack_and_patch to RSS

Patrick Ohly (3):
      archiver.bbclass: enhance do_ar_recipe task signature
      archiver.bbclass: various fixes for original+diff mode
      archiver.bbclass: do not cause kernel rebuilds

Ross Burton (1):
      archiver: preserve sysroot paths in configured mode

Zhenbo Gao (1):
      archiver: avoid archiving source for glibc-locale

 meta/classes/archiver.bbclass | 71 +++++++++++++++++++++++++++++++++++--------
 meta/lib/oe/sstatesig.py      |  6 +++-
 2 files changed, 63 insertions(+), 14 deletions(-)

Dengke Du (1):
  archiver.bbclass: fix do_ar_original error for matchbox-desktop

Joshua Watt (1):
  archiver: Escape recipe name in regex

Mikko Ylinen (1):
  archiver.bbclass: adapt do_unpack_and_patch to RSS

Patrick Ohly (3):
  archiver.bbclass: enhance do_ar_recipe task signature
  archiver.bbclass: various fixes for original+diff mode
  archiver.bbclass: do not cause kernel rebuilds

Ross Burton (1):
  archiver: preserve sysroot paths in configured mode

Zhenbo Gao (1):
  archiver: avoid archiving source for glibc-locale

 meta/classes/archiver.bbclass | 71 +++++++++++++++++++++++++++++++++++--------
 meta/lib/oe/sstatesig.py      |  6 +++-
 2 files changed, 63 insertions(+), 14 deletions(-)

-- 
2.11.0


