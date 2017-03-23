Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5A13C72F11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 10:34:17 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id t189so59004528wmt.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 03:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=PvpG1BOZl20hDHe0a4nGlYjkd4MXVi4yN4dHEXAW3as=;
	b=XKIThzqi06FhDDF5D1tFQuCOXDcJe8Ji2dMu/cNqOnVXCMS9MtNHDgHVrD0xncmziN
	ALNooiSsosVelFwADful7RyaCNlszGKP7nVQW9/jUaJXNJX4/uAiOx8TdpeLDVHhPiDq
	gH9W2+TL5U7b3TOuhvAt+2LkLf8bfUNAiCjeH2Y5aZpEEQ2+BkYxgnnkE1GqcO2y2VoR
	vxykDsElMA5Dn/rZW6k2e/DpFA9SWT5o9xv7YLX/gOX5RpPUa5AQvYRDgQU3M9Ltl5fz
	ZjNequzxQXmkZ7WKOzUavo628mRWk+Y72ysb1Hapeaq2QhgBaq64HxIIh5NsSf8Yeeds
	1vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PvpG1BOZl20hDHe0a4nGlYjkd4MXVi4yN4dHEXAW3as=;
	b=HSDRh3XxfcE1sA00+f0t7upylrD1HYLkdlzYrdLxKH3qDP+uCIZFlYGqiZRWX3j47n
	8dW8rCBLQJkx+16CHiPeGdPurgTNAxBvjnCAtAOZrtS5TnL/hexIXGR0CiAkUo57dRq0
	w/4PDY/AXFhUILYpIhtTD9FYIcbyFWk6P8qiAqrc15B2VZOBX63GA+Pw7NWDJhm+DCG/
	5QM+khy+jwSTFxclGgkrotp0iggOOhP3PZXEQC6x3aA8hdXLrKANw+Pa7XR3Y2No36vd
	0C0Bvt2ii8WKXp92bkVgCFchsvIAXB6ouy4HLTWUJwUeH0rPdjrjvKJqnuaORzCD4P1C
	pO7Q==
X-Gm-Message-State: AFeK/H061DZWKxPfjtkFTbOGOB4k36CJebv36q/UNLpAd7JeCPXft/DuWlXyTxsgPZHLbA==
X-Received: by 10.28.136.204 with SMTP id k195mr1994008wmd.99.1490265258907;
	Thu, 23 Mar 2017 03:34:18 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w10sm3819048wmw.14.2017.03.23.03.34.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Mar 2017 03:34:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 11:34:21 +0100
Message-Id: <cover.1490265213.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH 0/2] Debugfs fixes with different than default OPKGLIBDIR
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
X-List-Received-Date: Thu, 23 Mar 2017 10:34:18 -0000

The following changes since commit d1d55041e38b12d40f896834b56475ea19a6047f:

  sstate: Ensure installation directory is empty before execution (2017-03-22 10:12:10 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/master-rootfs-fix
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=jansa/master-rootfs-fix

Martin Jansa (2):
  rootfs.py: Respect OPKGLIBDIR variable
  package_manager.py: respect OPKGLIBDIR

 meta/lib/oe/package_manager.py | 21 ++++++++++++++-------
 meta/lib/oe/rootfs.py          |  4 +++-
 2 files changed, 17 insertions(+), 8 deletions(-)

-- 
2.12.0


