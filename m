Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rv6fp-00079F-Gt
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 13:30:57 +0100
Received: by ggeq1 with SMTP id q1so144008gge.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2012 04:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=ctWO+DQ+Hbk7rd/sjINacFBnPLUFjoFoW2MvP7jyNo0=;
	b=WF/MhHrZC4kTyd2CMzJ1u2SYuRT02lG6u+oZPedEZ/gMIKcidnH/snQNxvkQtp3bwh
	xWLPB5nKl5Z+/dBHAqPSWNh2Ro3J1S2rCabes9vyomAlwsifjZdNKO18HP5IWSaNP+XF
	a8CKSTYqlavaDvrzB6sAreJdccYXUVfLLBRds=
Received: by 10.236.124.17 with SMTP id w17mr36525380yhh.26.1328703773898;
	Wed, 08 Feb 2012 04:22:53 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id b12sm1695032yhj.4.2012.02.08.04.22.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Feb 2012 04:22:53 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2012 12:22:43 +0000
Message-Id: <cover.1328703672.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/2] Patches pending from O.S. Systems' tree
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
X-List-Received-Date: Wed, 08 Feb 2012 12:30:57 -0000

This has removed the map_dependencies from the cross class as we were
handling those by hand anyway in meta-chicken.

The following changes since commit 06b740d4ca077fb4c89ee6d1065fabb02da45ec6:

  classes/buildhistory: sort list fields in package info (2012-02-08 10:43:01 +0000)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (2):
  cross.bbclass: add virtclass handler
  useradd.bbclass: skip processing on virtclass-cross extended packages

 meta/classes/cross.bbclass   |   17 +++++++++++++++++
 meta/classes/useradd.bbclass |    3 +++
 2 files changed, 20 insertions(+), 0 deletions(-)

-- 
1.7.2.5



