Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6260E77B05
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 12:16:24 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id w204so1650923wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 05:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=PIVurFAe+e8gvtjJKKGpxS8hzUx0F3pOYIGQN6UovYE=;
	b=uvsLMWQCWsFSw0SFM2urroTNNf82XZfvWMajm6KT12x1RPAaxCKCYFw6xAqXdySVYJ
	NNqaU3o0GqaWVeRno9w7qhMxYN8ZnSnqKWTj+EjruszG0hf8q/fm7vcXHrCrGqfSxKBc
	4Ob1RpFQf35w87Qw7nLbW/ooaJndhMoGKFvK8g1RyFMXneDy/2vTcQLYJRsmeAZe/UKc
	2ZQUOtEhJjosT9onerfBIbjdhUFTXU+bHJ5dM0jrhM31hr/bNlBHc+ZMr9xnkMVj/B1U
	t77CWHT+dwJONcko+vMd8gXt1xiYa7k83tiwFUL/44ILFIfcBgN4YimX4zaoErPO9ZZC
	3zvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PIVurFAe+e8gvtjJKKGpxS8hzUx0F3pOYIGQN6UovYE=;
	b=GoHfrk4S1hqtyUq3760HBlLke/C/Q0n4VajohqI689ZgjbIhoGI1byBNX+Xxuhk3HA
	cLVOkN7yblpMogi1INTOQK+WlkovRT1ADusncktjsQa/EsYDMvDqKGZBkNG1mqBDqzym
	sguH6SdmK3kpipTfiOcs+ZKwwM2v17jFv9pdwuk9pUyWa9gja7MXd4WBf7iOJqkj0eJS
	2wmuaHYKQPgcpGTLRDT7ZvI6Ky3y2lJOC8P4Jh0R5G72fUEXcjcLpyXR2lkd0SC/sqEO
	r3glmPi0OrxO3Ub9u0bd/U7MhuRs7zLRBIUsk96oSHgPBp3Lwg2qhVBFfeeze/9Qy1N6
	TIkg==
X-Gm-Message-State: AFeK/H2aHCa0eNhDVCgjTLMyLtASm5dRTIeeqsMckLvKjBvcL/H/Ydqoliv88CTR8AZgLQ==
X-Received: by 10.28.12.147 with SMTP id 141mr13414922wmm.8.1490271385127;
	Thu, 23 Mar 2017 05:16:25 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	q72sm1855433wrb.54.2017.03.23.05.16.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Mar 2017 05:16:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 13:16:28 +0100
Message-Id: <cover.1490271349.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH][morty 0/2] Debugfs fixes with different than default OPKGLIBDIR
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
X-List-Received-Date: Thu, 23 Mar 2017 12:16:28 -0000

The following changes since commit ddf907ca95a19f54785079b4396935273b3747f6:

  Revert "file: update SRCREV for 5.28 to fix fetch fail on missing commit" (2017-03-21 22:17:57 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/morty-rootfs-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/morty-rootfs-fix

Martin Jansa (2):
  rootfs.py: Respect OPKGLIBDIR variable
  package_manager.py: respect OPKGLIBDIR

 meta/lib/oe/package_manager.py | 21 ++++++++++++++-------
 meta/lib/oe/rootfs.py          |  4 +++-
 2 files changed, 17 insertions(+), 8 deletions(-)

-- 
2.12.0


