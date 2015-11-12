Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 91AEE77280
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:41:28 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so79589390pac.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=IhBAvxZUN0bfCI8dfhmeyKKH/fYSs69SmMzFcm4LIgE=;
	b=i35ZSLcKBRex0aTuHBshH7YFMs1iKR6kCINFQf4gu+ZCy3mIC9t1QqOWukvLx/B8Yq
	ecwZoLNjYviPzuYHOXF6wigzVOQbGs8C1tAgJHjqR9v4237W4TIjwWyYd/pr4e2PLVYJ
	WQwvw4mMxY8nuOl++hVTCAbSy2ZbB8CnE++aWsKliPcekf/CRIyNEv18Yj9WkNp9lm5P
	dCh8J5I7/rS0e7xOuxK65vMdVLpJxp6Bd6/oCttV7mwUwMlwOLpWw0mDVGynnbGTceHl
	6HCQovlZIRHoH1XgFNENTxDgpL8QrGEVELLwKy+bwXB2PO+l413/soqwKWO5uZwPUFZh
	Njvg==
X-Received: by 10.66.170.238 with SMTP id ap14mr26669465pac.128.1447371689071; 
	Thu, 12 Nov 2015 15:41:29 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	wq1sm16717225pbc.49.2015.11.12.15.41.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:41:27 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:41:18 -0700
Message-Id: <cover.1447371049.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/4] Misc improvements 2 from Mentor
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
X-List-Received-Date: Thu, 12 Nov 2015 23:41:28 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is the final of three pull requests / patch series from Mentor's queue of
changes destined for oe-core master (not jethro). This series includes a small
number of improvements which may be more contentious or may require more
consideration and review.


The following changes since commit e44ed8c18e395b9c055aefee113b90708e8a8a2f:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:02:57 +0000)

are available in the git repository at:

  git://github.com/kergoth/openembedded-core mentor-misc-improvements-2-after-jethro
  https://github.com/kergoth/openembedded-core/tree/mentor-misc-improvements-2-after-jethro

Christopher Larson (4):
  linux-dtb.inc: use absolute upd-alt paths
  opkg-utils: add update-alternatives PACKAGECONFIG
  systemd: add myhostname to nsswitch.conf
  systemd: arrange for volatile /etc/resolv.conf

 meta/recipes-core/systemd/systemd_225.bb           | 20 ++++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 12 +++++++++---
 meta/recipes-kernel/linux/linux-dtb.inc            |  4 ++--
 3 files changed, 31 insertions(+), 5 deletions(-)

-- 
2.2.1


