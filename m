Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QtwLr-0003It-3a
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 08:45:15 +0200
Received: by fxg11 with SMTP id 11so1241102fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 23:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=aCV4bAL/ZpBxHpZfpnG9rwVojsGGEAlZmyJFFqzHC94=;
	b=me1qg9yXuHFCokpdqjMoeEbjYjyRksRQoPDHqKSSNrezKipCoL0CV1o5G7rpjU6ga3
	AzjgpMw7YgcuuxvD5WfnOZpaEVK/zorMM18Ng6guSDBasjUrw5qM1q2CuZ1JE+oxcq5u
	EQdywWFZkUY+cBr/pNWxunXx19QNmpCjWs24c=
Received: by 10.223.16.210 with SMTP id p18mr593057faa.71.1313649633697;
	Wed, 17 Aug 2011 23:40:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 25sm1400457fay.31.2011.08.17.23.40.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Aug 2011 23:40:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 08:40:19 +0200
Message-Id: <cover.1313649419.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/2] Small fixes
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
X-List-Received-Date: Thu, 18 Aug 2011 06:45:15 -0000

The following changes since commit 2e83e6755441cb14bd907d306974338c15173189:

  kernel: restore crtsavres.o to enable building external modules on powerpc (2011-08-17 15:46:16 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Martin Jansa (2):
  task-core-boot: allow distribution to override default dev_manager
    provider with VIRTUAL-RUNTIME_dev_manager
  bluez4: update recipe from meta-oe

 meta/recipes-connectivity/bluez/bluez4_4.96.bb |   17 ++++++-----------
 meta/recipes-core/tasks/task-core-boot.bb      |    5 ++++-
 2 files changed, 10 insertions(+), 12 deletions(-)

-- 
1.7.6



