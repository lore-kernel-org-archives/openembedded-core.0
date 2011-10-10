Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RDNFX-0006vZ-9y
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 23:19:03 +0200
Received: by ywf7 with SMTP id 7so5828156ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 14:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	bh=ObkhxJJEHbZ85PZosqTZhgbo+LCKtWQ/kW7yY1aueL8=;
	b=M0SsesXMmB2lAfac+Yr4xQR5gs5ESOezjXDMkv/Rw5YuMOhYr6K6hpe78Hn+UXq9Px
	fV0iV3VeoUIBkzBdm6x20sh/ips+2wTSwiEKgAfpoMauSOLU86St+J64WNZJmlLZxdUE
	EGTVZ9W1feuKSVIOorbIzIa15XbJQXcj22aWY=
Received: by 10.236.187.73 with SMTP id x49mr2898745yhm.121.1318281201821;
	Mon, 10 Oct 2011 14:13:21 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-167-38.ph.ph.cox.net.
	[24.251.167.38])
	by mx.google.com with ESMTPS id o50sm12052228yhl.9.2011.10.10.14.13.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Oct 2011 14:13:20 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Oct 2011 14:13:04 -0700
Message-Id: <cover.1318281075.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/2] Minor autoconf & autotools.bbclass fixes (supercedes previous misc fixes request)
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
X-List-Received-Date: Mon, 10 Oct 2011 21:19:03 -0000

The following changes since commit 4732222c46652951e66aae377631f4a361179d8f:

  Fix sysprof for powerpc64 (2011-10-10 09:54:03 +0100)

are available in the git repository at:
  http://github.com/kergoth/oe-core misc-fixes

Christopher Larson (2):
  autotools: fix multi-word arguments for EXTRA_OECONF
  autoconf: no need to hardcode the full path to m4

 meta/classes/autotools.bbclass                  |    6 ++----
 meta/recipes-devtools/autoconf/autoconf_2.68.bb |    4 +++-
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.7.3.2.430.g208247



