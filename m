Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNAVx-0002NP-HX
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 23:12:13 +0200
Received: by pzk36 with SMTP id 36so1426512pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 14:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=WxBDyKM66t1flxZ1X8v/VPfR2zSsikaOPW3x1ZihA/g=;
	b=NE31M64SAAxXiFc7dZH40q9Ez6/FfICgZ7pVk+7kgjnuvKf5DgGpKo5RsvNjimLB54
	m3A/nS0WtvrxNH2zwmJTmQGs4Pbn+vpDC3ZYoxRzm+lN0uJol6j8obJovWpTU3FZQvUa
	tZ/w1AmWy16TqhtivXVZoVDk4Xyh8DydmkpAM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=HhuSfyIkv8TBGKpgmSiEOvmzEAVe86nj48qU3vZXtglAI1EV6eKK20kKGI4gcDKlLs
	a5+qLXDwWGNIjVL8bXlzfNzgwY57ipjr9nCQLuODN+CxdeIu5mw7TEN+eBGf6YgVOfoZ
	YMAqXZaCZEF8LML6AzAh9aHh7Cvfci/3MksK4=
Received: by 10.68.46.195 with SMTP id x3mr5569129pbm.442.1305839356056;
	Thu, 19 May 2011 14:09:16 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id r7sm612049pbj.85.2011.05.19.14.09.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 May 2011 14:09:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 19 May 2011 14:09:03 -0700
Message-Id: <cover.1305839225.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/2] Let opkg-build allow uppercase letters
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
X-List-Received-Date: Thu, 19 May 2011 21:12:13 -0000

Majority of the changes are backported from OE
one additional patch is to opkg-utils/opkg-build to allow
uppercase letters.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/opkg
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/opkg

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (2):
  opkg: Synchronise with OE
  opkg-utils: Allow uppercase lettlers in package names

 .../opkg-utils/opkg-utils/mtime-int.patch          |   29 +++++++++++++
 .../opkg-utils/opkg-utils/uppercase-letters.patch  |   44 ++++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb |    8 +++-
 meta/recipes-devtools/opkg/opkg.inc                |    7 ++-
 meta/recipes-devtools/opkg/opkg/add_vercmp.patch   |   36 ----------------
 meta/recipes-devtools/opkg/opkg/configure          |   25 +++++++++++
 meta/recipes-devtools/opkg/opkg/headerfix.patch    |   19 --------
 meta/recipes-devtools/opkg/opkg_svn.bb             |   23 ++--------
 8 files changed, 113 insertions(+), 78 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/uppercase-letters.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/add_vercmp.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/configure
 delete mode 100644 meta/recipes-devtools/opkg/opkg/headerfix.patch

-- 
1.7.4.1



