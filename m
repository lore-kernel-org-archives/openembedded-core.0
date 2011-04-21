Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QCz8p-0004l3-6h
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 21:02:15 +0200
Received: by pwj9 with SMTP id 9so25372pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 11:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=67p4p+pcV/LIEzdcvlm+bcmBe9P+1Ds5+7cR2jP9emg=;
	b=ZK6fFxy9Ryc4MFVyClWJfB2RLbBSKF99gJmc6/qDjwT7LpzHMmzPjyw+KiJ27sRypq
	Wbf+hSTN27EqoLMuz/6Bc8LQMzIgvDBgQqO9S8jY1JvbvkzkW6Ze6YuiqgGogxR18cea
	uo7T24xLzeoFPfau57NnXwuGlh4xErKCyWkzE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=uqGuKbIAsskLz/rNdd+S+K9VCu6Uu2tIqO41rb0vCxDSACzIIyxMm2EuNTaYBqtogu
	FKRSaTzHBVYs1ZK8brGhMQEVVxwgO0il3U8B/x6koqCQqN9TFOtzGV5iNrEgoy5Oh/yX
	Jw7kMtGP6aCSiDfel+pIMBR08P8YwiFxDXCm8=
Received: by 10.68.56.99 with SMTP id z3mr5996pbp.267.1303412386204;
	Thu, 21 Apr 2011 11:59:46 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id o7sm1470478pbe.72.2011.04.21.11.59.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 11:59:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Apr 2011 11:59:39 -0700
Message-Id: <cover.1303412254.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] Upgrade pcmciautils 017 -> 018
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
X-List-Received-Date: Thu, 21 Apr 2011 19:02:15 -0000

Along with upgrade we are remove usage of LIBC variable
inside makefiles as this conflicts with OE's notion of
LIBC

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/pcmciautils
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/pcmciautils

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (1):
  pcmciautils: Upgrade 017 -> 018

 .../pcmciautils-017/version_workaround.patch       |   16 ------
 .../makefile_fix.patch                             |   58 ++++++++++++++++----
 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |    1 +
 meta/recipes-bsp/pcmciautils/pcmciautils_017.bb    |   12 ----
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb    |   11 ++++
 5 files changed, 59 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils-017/version_workaround.patch
 rename meta/recipes-bsp/pcmciautils/{pcmciautils-017 => pcmciautils-018}/makefile_fix.patch (63%)
 delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils_017.bb
 create mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb

-- 
1.7.4.1



