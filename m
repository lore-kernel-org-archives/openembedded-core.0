Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RDhwY-0000B2-OI
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 21:24:51 +0200
Received: by ywf7 with SMTP id 7so6938491ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 12:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=l3Bkskfs7gpdtM4Is3FppeYYcq/1Kng/p1jCnjaFzIg=;
	b=OVh+wGqXg4JP3RSg33grlr1jOQ31E3GdFvsC+xlyny0Uammq890BZFxzs6LAluVDIS
	2CJqERLKZyqG4Xnp9MkFLTvvC7t+5dWQlRo7SyzA6K64s9/TBmGEHjnlbb1TxJAdZJwM
	mojOOM6GtVF1eJotkHIeUfQPVeTvGTVNHc27o=
Received: by 10.236.190.200 with SMTP id e48mr32058406yhn.59.1318360748193;
	Tue, 11 Oct 2011 12:19:08 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id g23sm11205147ani.16.2011.10.11.12.19.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Oct 2011 12:19:07 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Oct 2011 19:18:48 +0000
Message-Id: <cover.1318360701.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/2] Image building related fixes
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
X-List-Received-Date: Tue, 11 Oct 2011 19:24:51 -0000

The following changes since commit 4732222c46652951e66aae377631f4a361179d8f:

  Fix sysprof for powerpc64 (2011-10-10 09:54:03 +0100)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (2):
  image-live.bbclass: allow override of initrd image
  initramfs-live-boot: make it more generic and easy to use

 meta/classes/image-live.bbclass                    |    5 ++-
 meta/recipes-core/initrdscripts/files/init-live.sh |   32 ++++++++++++-------
 .../initrdscripts/initramfs-live-boot_1.0.bb       |    3 +-
 3 files changed, 25 insertions(+), 15 deletions(-)

-- 
1.7.2.5



