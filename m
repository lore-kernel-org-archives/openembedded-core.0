Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id E9D2974725
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Apr 2018 07:19:42 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y69so7811658pfb.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Apr 2018 00:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WjcnfKYkOqPAWL3msPGnLwxCD9MwQnn0aVZ/AEfAivA=;
	b=VglcaQ7gbtl/spp22Se9owk4szivIVrG5GuXgmNh8onHTUbIiBn/K7uQ/UqXH3bWUF
	rnZ37XbXHjFBk4/jfwjD4mbtswWQjymKedHsjDIRY5ZHl+POlkq5wK6OsQ18cEkSVm09
	aELwlni33EWU3L6TlENhBlhKANs7aRjy5h9k4NsHjoT9cAE0jnW/xnB11rrhcbRXaHo/
	gcbxPnlosJsu3Q/PxzCNuyYsV3rSnr283uNr7gaiO/6XTjVJb2o7X85490YfcJkQihsR
	g5i2Q7Y81Pp18PLLeWR1hpRrfZH24g2XR55T4tbro67gtO3YlgY0UkTo1qCYICHxFXPr
	ElUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WjcnfKYkOqPAWL3msPGnLwxCD9MwQnn0aVZ/AEfAivA=;
	b=kRW3dzgy7+ONyDj+S9dbRq6u1A+8QQTTDgJOMHDZHWWQkORkoihuyrE6CQBJRN4g68
	o6XsrxwVQyfRlM0Wwoo/nKPDxT3VFPnWZCw7yGdTwPY5Z7dkvNsvYFv+gd5yzE048YgR
	Wx8oOKkhUnIUWYZPff0uPhWCMKFegd0+07jagKV7Vj4geD9Um46wUlKg/nJV2W8gaByz
	wC1I1UXK4PkznsPhdrjyG2QKCOBL88eZzxd/iUSDJK0gePOZodt4C+/f/VEcenkbhm87
	2uvE12/LQTB+qljVOSZLgiUW46ag7zGq4TlMX0bAi9d1jVaOTFVsP0zQCJeAc2QqR+9/
	En6g==
X-Gm-Message-State: AElRT7E4odihwmoLOMeTNBW/9HYGkf++9EpSTiJtn4wR5P5bWAmsDfXi
	zrlaWgkilha7pzwt8JSdXH7lZQ==
X-Google-Smtp-Source: AIpwx49gvU+RIaLvHih99MDVlZlowRdRDN6Yusha/STIjYtMsTG7VlhP6ITgiNKmHrjs0GbHDGvqmg==
X-Received: by 10.99.123.70 with SMTP id k6mr3415614pgn.292.1522567183502;
	Sun, 01 Apr 2018 00:19:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	5sm27554121pfh.133.2018.04.01.00.19.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Apr 2018 00:19:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Apr 2018 00:19:32 -0700
Message-Id: <cover.1522567040.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.3
Subject: [PATCH 0/4] llvm 6.0 update and Misc fixes
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
X-List-Received-Date: Sun, 01 Apr 2018 07:19:43 -0000

Most of these fixes are inspired by gcc8 they are mostly harmless
llvm 6.0 is something we should get into sumo as well and its a leaf recipe


The following changes since commit 4cedddb83623c79980b354642dfeaf78218ca4b7:

  libpcre-ptest: skip locale test (2018-03-30 09:40:34 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu

Khem Raj (4):
  x264: Use updated gnu-config artifacts
  nasm: Fix pure function warnings
  systemtap: Backport a fix for build with gcc8
  llvm: Upgrade to 6.0 release

 ...LibraryInfo-Undefine-libc-functions-if-th.patch |  20 +-
 .../0002-llvm-allow-env-override-of-exe-path.patch |   4 +-
 meta/recipes-devtools/llvm/llvm_git.bb             |  11 +-
 ...rop-pure-function-attribute-from-seg_init.patch |  27 +++
 meta/recipes-devtools/nasm/nasm_2.13.03.bb         |   4 +-
 .../systemtap/systemtap/0001-Fixes-for-gcc-8.patch | 215 +++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.inc    |   1 +
 meta/recipes-multimedia/x264/x264_git.bb           |   2 +
 8 files changed, 266 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-devtools/nasm/nasm/0001-asmlib-Drop-pure-function-attribute-from-seg_init.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Fixes-for-gcc-8.patch

-- 
2.16.3


