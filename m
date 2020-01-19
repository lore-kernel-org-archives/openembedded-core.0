Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2A0EB7FBDB
	for <openembedded-core@openembedded.org>;
	Sun, 19 Jan 2020 21:37:26 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id y8so12261843pll.13
	for <openembedded-core@openembedded.org>;
	Sun, 19 Jan 2020 13:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=GB6hI/QX8DD9XRdpWSXNxjbc4uMhVp5R5O/0TsOnPhg=;
	b=TQxQVULdmc+xPgQIN8yEQ68b+WPJ0np6ll5yIpW7cZpaRnLhVJfzgWMwYLLM5bCrDL
	bXPLV76cJKcaPZHUcSD1+HkRFsWvaMhJqBo/ZxyjeMLDD+vx2t0iOl08/fdZP89w5LOR
	7TAqdbF86YjtFzzunOwcH3xkTYX4ra9T6ko9fTJo9mhIWTjN719m3saywS/ALAL/CPym
	I/JY5AFdbQU5jiOMOZ6n31mIxbgiSNk5in/FVZuaPea7ANGzAD+JMi9rMu3cQ65LLOHR
	N9UdaGDDTcYHiT0YakHZqhkkDWK6wANrYqaRM5mdkv9clGV9gBm/pJNA+ixJIN6BELz+
	9URw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=GB6hI/QX8DD9XRdpWSXNxjbc4uMhVp5R5O/0TsOnPhg=;
	b=BGp1eLFgf40YZYKKqFzzTC15aw8H+BjzVT+XHP6CnGgBbUz3ffhZVC2vQpM5bH9pfj
	XoRAoMZ2gJBBkEujf97w4S5jZsxdPnKj3bCKwb8+EHTSjhmuUO/q7AgA1brKODMahU0W
	x5GN4Tle7IQqd1CIxpG0ES816+WbPME7MOUOhSRjKHCVH4lF7DOeXpHfpmHP7niQdNv0
	elXIk4SgKub/Blz0JYScVR2dImOglu2sPHT5ipu8D4zzvL9glPfKnDjrgjH0XF5mGoPC
	RCC264P3kLbD2SldEJe6XMqJio4aClKGOH2oVu97y1wE8y0nrNllPFx0wtNnLMilCycu
	VfGw==
X-Gm-Message-State: APjAAAVRJAZqrZDdN0rz8foSQTf71Zs94p6m/lFyjon2kxYmds6Bqiv+
	9DlxVFCQLDeqUN5Zz7lio5OutPyD
X-Google-Smtp-Source: APXvYqyNgBCBy3Odk/bI4xm90pnL6nIKV4E0nPBiEeI3A1bAoY1ZYhmhqQIxmF1nRtYaLFVxbUxEig==
X-Received: by 2002:a17:902:7b86:: with SMTP id
	w6mr11211527pll.317.1579469847096; 
	Sun, 19 Jan 2020 13:37:27 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:450d:e003:9142:f492])
	by smtp.gmail.com with ESMTPSA id
	q15sm34912518pgi.55.2020.01.19.13.37.26
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 13:37:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 19 Jan 2020 13:37:18 -0800
Message-Id: <cover.1579469619.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [zeus 0/6] Patch review
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
X-List-Received-Date: Sun, 19 Jan 2020 21:37:26 -0000

Please review and provide feedback by Tuesday.

Passed on AB via A-full

The following changes since commit 5ed714139f91eb03871e01b68a4370784071234d:

  license.bbclass: Introduce AVAILABLE_LICENSES that lists all licenses (2020-01-15 11:58:08 +0800)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/zeus-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/zeus-nut

Alex Kiernan (1):
  linuxloader: Correct loader for glibc on armhf

Kalle Lampila (1):
  wic/filemap: If FIGETBSZ iotctl fail, failback to os.stat

Mike Crowe (1):
  multilib.conf: Ensure that RECIPE_SYSROOT is unchanged for native

Richard Purdie (3):
  sstatesig: Test cross/native hashserv method extension
  scripts/oe-build-perf-report: Avoid buildstats warning
  sstatesig: Improve debug output if getpwuid() fails

 meta/classes/linuxloader.bbclass            |  2 +-
 meta/conf/multilib.conf                     |  1 +
 meta/lib/oe/sstatesig.py                    | 17 +++++++--
 meta/lib/oeqa/selftest/cases/sstatetests.py | 40 +++++++++++++++++++++
 scripts/lib/wic/filemap.py                  |  6 ++--
 scripts/oe-build-perf-report                | 20 +++++++----
 6 files changed, 75 insertions(+), 11 deletions(-)

-- 
2.17.1


