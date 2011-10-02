Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RAQfb-0003Zq-BF
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Oct 2011 20:21:47 +0200
Received: by ggnq1 with SMTP id q1so267884ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Oct 2011 11:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=QzBweGUWUPYA5B+OWP6oV6Urat1f8joPd3KAB/HCPuQ=;
	b=vZYoD+zqTxieEb93Hx0DkZ/z8ajhVpbvOQVCSerjtgveRg5qteXpJ+/Mq+OS7sxGl/
	J+XeznIBh5dLkUM5qhgkaJd+RzYrdzwy+hGPATbwsCBXztEVrXDtxPjdZ/qvumdLaz1M
	xnJye7nRm2NPMTM8ZjCQl39HOL7O3qxd44yl0=
Received: by 10.236.197.104 with SMTP id s68mr84760345yhn.20.1317579372411;
	Sun, 02 Oct 2011 11:16:12 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id r30sm13093379yhj.20.2011.10.02.11.16.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 02 Oct 2011 11:16:11 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Oct 2011 18:15:54 +0000
Message-Id: <cover.1317579313.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/3] Minor and trivial fixes
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
X-List-Received-Date: Sun, 02 Oct 2011 18:21:47 -0000

The following changes since commit c54c1280fc0d06a53e23339c3913ec88eead13d9:

  base.bbclass: Drop unneeded dependency (2011-09-30 11:34:44 +0100)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (3):
  image.bbclass: improve comments regarding exported functions
  image-live.bbclass: allow images to override ROOTFS and INITRD
  bootimg.bbclass: fix comment typo

 meta/classes/bootimg.bbclass    |    2 +-
 meta/classes/image-live.bbclass |    4 ++--
 meta/classes/image.bbclass      |    5 +----
 3 files changed, 4 insertions(+), 7 deletions(-)

-- 
1.7.2.5



