Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RFmxt-0006cz-Tq
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 15:10:50 +0200
Received: by ywm39 with SMTP id 39so710726ywm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 06:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=O+XbhadTQxTBGbIE/I9SYkzcfOx/03Db48MyycIhglE=;
	b=U6RIbMQbV/x6gphOH9S9DMW3mkElztcuG5qlw4ZQR5bloPevv5R87RHtWNG0M2/akP
	rPh1VueuRiYgCKejamfFgFdFXSTRfkf3CJ3egsJcvaLZPQLzzK9/n7EjwVuYk3p5o6W9
	5N6czicKMWuTsl2yI1etk+TpbjDuEFZQaTYaM=
Received: by 10.236.181.225 with SMTP id l61mr3937399yhm.131.1318856692034;
	Mon, 17 Oct 2011 06:04:52 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q57sm5488983yhi.22.2011.10.17.06.04.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 06:04:51 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2011 13:04:42 +0000
Message-Id: <cover.1318856652.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/1] Make src_distribute to work
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
X-List-Received-Date: Mon, 17 Oct 2011 13:10:50 -0000

The following changes since commit f2dada2079b5f98e13d4888609368ba111967a60:

  lsb: Change link of ${baselib} to lib64 for 64bits system (2011-10-17 13:42:03 +0100)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (1):
  src_distribute.bbclass, src_distribute_local.bbclass: mostly
    rewritten

 meta/classes/src_distribute.bbclass       |   54 ++++++++++++++++++++---------
 meta/classes/src_distribute_local.bbclass |   28 ++++++++-------
 2 files changed, 52 insertions(+), 30 deletions(-)

-- 
1.7.2.5



