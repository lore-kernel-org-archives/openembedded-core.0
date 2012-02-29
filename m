Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S2cQF-0004VV-4b
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 06:49:55 +0100
Received: by yenm3 with SMTP id m3so1050693yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 21:41:26 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.182.2 as permitted sender) client-ip=10.236.182.2; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.182.2 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.182.2])
	by 10.236.182.2 with SMTP id n2mr33433408yhm.11.1330494086640 (num_hops
	= 1); Tue, 28 Feb 2012 21:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=w1T8qz+8t9BASscN1lDjvKxAluXmBqJc7QBePy7DKWI=;
	b=j0QY4ovmVmxsKZmUpnhRFmnOss6dcYFFBcC8kDMXO13GBlEevjThGhGx2U/g7F14eG
	33V3uiXUUSCKC49Q4+kKKbl2ww1jJAogk8naHM+gZlno4JQLrYEfVDWJ0bbhHpiBF/+H
	BneZiazyVl1lsHi3YhvuMY4DBC2JfW7du+CD0=
Received: by 10.236.182.2 with SMTP id n2mr25366943yhm.11.1330494086539;
	Tue, 28 Feb 2012 21:41:26 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id b6sm32799257anc.3.2012.02.28.21.41.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 21:41:25 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 05:41:15 +0000
Message-Id: <cover.1330494042.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/3] Pending patches from O.S. Systems' tree
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
X-List-Received-Date: Wed, 29 Feb 2012 05:49:55 -0000

The following changes since commit 61216d2743502ef38955054aad6a4f2ed63e6d43:

  licenses.conf: fix quotting of SRC_DISTRIBUTE_LICENSES (2012-02-28 17:51:42 +0000)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (3):
  image.bbclass: do not create image manifest link if IMAGE_LINK_NAME
    is empty
  image_types.bbclass: properly support IMAGE_LINK_NAME as empty
  image_types.bbclass: fix bzip2 and xz compression commands

 meta/classes/image.bbclass       |    6 ++++--
 meta/classes/image_types.bbclass |   18 +++++++++++-------
 2 files changed, 15 insertions(+), 9 deletions(-)

-- 
1.7.2.5



