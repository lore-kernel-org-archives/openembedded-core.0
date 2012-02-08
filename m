Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Ruz2W-0005hl-EQ
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 05:21:52 +0100
Received: by ggeq1 with SMTP id q1so52311gge.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 20:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=2s0sYTyOqGHYoPcs4dgcAaT1bqYa21xJ71YlyXHcuJY=;
	b=h1TgWh1GfTmHHyMEGYzZAIm6YcFFRqtt4+emTBhWHJ7IvMfBjG8AH/MQj6xjc6DU9i
	OpwniKk/mMYR+J10+rqu+5mYjk0KtrtPw7nH8ysIDq5vTvTG5AKw4qYMHAzD6fHPQKOo
	aQGPlo+V1itg0v/h/yZrUuRdo8d2RJIql8JtE=
Received: by 10.236.80.4 with SMTP id j4mr35561366yhe.120.1328674429012;
	Tue, 07 Feb 2012 20:13:49 -0800 (PST)
Received: from localhost.localdomain (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id v7sm229460yhi.1.2012.02.07.20.13.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 20:13:48 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 22:13:43 -0600
Message-Id: <cover.1328674343.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.7
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/2] Resolve parsing hang issues
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
X-List-Received-Date: Wed, 08 Feb 2012 04:21:52 -0000

From: Christopher Larson <chris_larson@mentor.com>

*** BLURB HERE ***
The following changes since commit db689a99beffea1a285cdfc74a58fe73f1666987:

  Revert the switch to futures for now (2012-02-03 08:12:56 -0700)

are available in the git repository at:
  git://github.com/kergoth/bitbake.git hang-issue-fix
  https://github.com/kergoth/bitbake/tree/hang-issue-fix

Christopher Larson (2):
  cooker: roll our own process pool
  knotty: shut down more cleanly

 lib/bb/cooker.py    |  155 ++++++++++++++++++++++++++++++++++++++++++---------
 lib/bb/ui/knotty.py |   15 ++---
 2 files changed, 136 insertions(+), 34 deletions(-)

-- 
1.7.7



