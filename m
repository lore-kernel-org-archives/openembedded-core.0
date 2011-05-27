Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QQ13T-0002yA-2o
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 19:42:45 +0200
Received: by pzk36 with SMTP id 36so916648pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 10:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=eCt6yBHEW97eCTKIAJbngCPeWnki228Fu6uW07qtYks=;
	b=uXXLKqOxexKcdD/jYUeflCduzM1o26wykfWeGoZmGHmdtrRofDiSjyhWCm1f8xcuIG
	Xox/xZ4EcVKFUdqswCpmYaJ4doq8Bxbxf28Ngmw5eBaTOztDDYhRra5v+cCHgOGfwyei
	/W5Au+hxQyTV6Jbkk01C6gan1vnb+baYcdark=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=NiWTtGaM6IexU1vs3YiVm1b+OZWdQIt1C2ou6SxTmz6npSbcGBLS1pbNklZXa9KNoH
	E8dVcqBC+jwdEPa9wsdW235K5crhSdfci9LYlH5Tw/ufFM7VlfewIR9l4egJOxdzFyKg
	VIroe3/I2Z3PWwsdqvJwFQYo2VimB0+6GCHEw=
Received: by 10.68.38.10 with SMTP id c10mr924286pbk.192.1306517896213;
	Fri, 27 May 2011 10:38:16 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id b8sm664287pbj.62.2011.05.27.10.38.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 10:38:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Fri, 27 May 2011 10:38:06 -0700
Message-Id: <cover.1306517584.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] Fix SRC_URI
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
X-List-Received-Date: Fri, 27 May 2011 17:42:45 -0000

Wrong patch got pushed into pull branch. But I have made amends
here is the remainder. uclibc being in both meta-oe and oe-core
confused my build on one machine it was picking it from oe-core
and on other from meta-oe. Good new layers :)

The following changes since commit 4b9c98e10d0ebaef45c8386103ec9ed69a589fba:

  uclibc_git.bb: Fix patch path in SRC_URI (2011-05-27 10:29:24 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-thumb
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-thumb

Khem Raj (1):
  uclibc_git.bb: Fix patch path in SRC_URI

 meta/recipes-core/uclibc/uclibc_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.4.1



