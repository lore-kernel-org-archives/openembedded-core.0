Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RyS1n-0002lQ-UG
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 18:55:28 +0100
Received: by yhfq46 with SMTP id q46so1948802yhf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2012 09:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=oNBRex3XhjQ5pB6vNkzdYqo0/HS5w8fvSIJ/9ebE+08=;
	b=gJvTxZZ8Yt4Q8Ukk47cnOQh7ZRmE69b1FVyCXOa3eTcxkfrymhyVyFdbVU5IsoMex6
	aQ1CBaWwd55yqb33Ul/D8LbVokdWDBO4VpCkVQmI5njmJb1AoiZgRoECcXnWnXXtwjHl
	X0lETNwjuvZImNScb7YUIzN6pEGhb6aXwYp5I=
Received: by 10.236.183.198 with SMTP id q46mr11040790yhm.0.1329500833260;
	Fri, 17 Feb 2012 09:47:13 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id e45sm24123959yhk.2.2012.02.17.09.47.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Feb 2012 09:47:12 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Feb 2012 17:47:02 +0000
Message-Id: <cover.1329500798.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/3] Pending O.S. Systems' tree patches
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
X-List-Received-Date: Fri, 17 Feb 2012 17:55:28 -0000

The following changes since commit e5ad03093dfc4364d1407183f458df79f347c7a1:

  guile: fix cross configure failure (2012-02-10 13:38:16 +0000)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (3):
  update-rc.d.bbclass: do nothing for extended cross packages
  rootfs_ipk.bbclass: fix status file location in rootfs
  rootfs_ipk.bbclass: fix unpacked postinst support if no package
    management

 meta/classes/rootfs_ipk.bbclass  |   21 ++++++++++++++++++---
 meta/classes/update-rc.d.bbclass |    1 +
 2 files changed, 19 insertions(+), 3 deletions(-)

-- 
1.7.2.5



