Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q0FtY-000229-HV
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 17:17:52 +0100
Received: by ywg8 with SMTP id 8so1172890ywg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=Zw2WlCBxU/LnLCZf2Krxu4wTZndl91PS3r+/xVQK6gM=;
	b=KU7gzlF4/aPox1AC8Pm/QsvKQE7PLQdK/edRYgNw6YTul1JeTKpG71W8cVaNfF1wh1
	dby3HtuFhc5PKZfwmh7dbn1tWa5fukPRYnikTfKxlyeZmQAtorqO+p6rTJBEGdrPa1h3
	iHIyvS5RYEFruz7yyGhyagJVS5IejxY3Mdz7U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=oFO7LByhl4yEpxf+3EGNLka+WQKw5g1FMwH/AWT6IRJF1LabsMF/MQOXEs1czUmBdm
	HgYvMXngYvdJJYKk7bSdStTB5u+MVw5yI4fbmeSR3LxpX4Y5mZTpXP31X3JZA4wq6bwA
	/qfoaKWcdeHDUMFONx1AJNZ18S37JvvHJ+5k0=
Received: by 10.150.244.4 with SMTP id r4mr26633ybh.256.1300378563966;
	Thu, 17 Mar 2011 09:16:03 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id q29sm67146yba.2.2011.03.17.09.16.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 09:16:03 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2011 09:15:54 -0700
Message-Id: <cover.1300378309.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.2.3
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 0/4] Pull request - a few misc fixes
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
X-List-Received-Date: Thu, 17 Mar 2011 16:17:52 -0000

From: Chris Larson <chris_larson@mentor.com>

Pull URL: https://github.com/kergoth/oe-core
  Branch: misc-fixes
  Browse: https://github.com/kergoth/oe-core/commits/misc-fixes

Thanks,
    Chris Larson <chris_larson@mentor.com>
---


Chris Larson (4):
  poky-init-build-env: unbork for zsh
  native: empty PACKAGES_DYNAMIC the way we do PACKAGES
  scripts/bitbake: add -g/--graphviz to NO_BUILD_OPTS
  Shift a few env bits into scripts/bitbake

 meta/classes/native.bbclass |    2 ++
 poky-init-build-env         |    2 +-
 scripts/bitbake             |    6 +++++-
 scripts/poky-env-internal   |    4 +---
 4 files changed, 9 insertions(+), 5 deletions(-)

-- 
1.7.2.3



