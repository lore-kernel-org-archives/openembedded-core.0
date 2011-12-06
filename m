Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXqb3-0002AR-Ho
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 09:41:53 +0100
Received: by eeav2 with SMTP id v2so847020eea.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 00:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=6ibGKpDu3t9hSwy/MtFbPhf57uLFLKUkFPwlt68XirI=;
	b=F16fh7XoJhg0tGJnX8L3hk2glYoheBMDadcjDCC1Io04IVlzXbUwPIAbvJOK2kAltX
	CkGIL0l2txdDe9SRIBpGm3qlk5wtodEk2sH3VVCZ3DT3BHHSRae1brPhWjsNNvpHJTDm
	YbGZJkkrXNP19nFQAqeD5TJcG2UTBpUPegP8I=
Received: by 10.14.0.199 with SMTP id 47mr2150257eeb.110.1323160506407;
	Tue, 06 Dec 2011 00:35:06 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 17sm57374284eej.3.2011.12.06.00.35.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 00:35:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2011 09:34:57 +0100
Message-Id: <cover.1323160412.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
Cc: Klaus Kurzmann <mok@fluxnetz.de>
Subject: [PATCH][oe-core 0/3] Small fixes for sysstat, matchbox-session and subversion upgrade
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
X-List-Received-Date: Tue, 06 Dec 2011 08:41:53 -0000

The following changes since commit 0a7a8597be05c8def8af58eecab49d963dc9d757:

  libsdl: Disable pulseaudio explicitly (2011-12-05 23:03:23 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Klaus Kurzmann (1):
  subversion: update 1.7.0 to 1.7.1 and force libtool recreation

Martin Jansa (2):
  sysstat: don't run populate-volatile.sh update in do_rootfs or
    without populate-volatile.sh
  matchbox-session-sato: respect VIRTUAL-RUNTIME_initscripts settings

 .../libtool2.patch                                 |    0
 .../{subversion_1.7.0.bb => subversion_1.7.1.bb}   |    7 ++++---
 meta/recipes-extended/sysstat/sysstat.inc          |    7 ++++++-
 meta/recipes-extended/sysstat/sysstat_10.0.3.bb    |    2 +-
 .../matchbox-sato/matchbox-session-sato_0.1.bb     |    7 +++++--
 5 files changed, 16 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion-1.7.0 => subversion-1.7.1}/libtool2.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion_1.7.0.bb => subversion_1.7.1.bb} (75%)

-- 
1.7.8



