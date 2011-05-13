Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QKxPu-0005UL-Ar
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 20:48:50 +0200
Received: by pwj9 with SMTP id 9so1352390pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2011 11:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=DyI4Mv/kMCeDhtVQv3yXovyA1sDkdg6fUgLuEnuYld0=;
	b=s44bo0XLl3HgNsuPw36Z1oLj61xV2g+JRtWQkMlFSIz9qWmkmEloJ1fyknpHKuuX4Y
	lLHb/QZACEbktXw9h14kFIDDa9nv2nNZau2gSK5s0gtQOlKniTqgfmRVgysd555nvWae
	Q+pCD/iVvAsKCJ09U3ZJ62n4VesUIhQd01Bf0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=c96816XcCcuuHM5MImY9I+EY6EbW9molGfHde1XWhAsCm80zajvAte1mGdj6x93/wP
	ibWzDCNpNBISY273B72AL+Q3oTz5ATw696ZAbyMg280r0zLnHRKgqfKLVgFmZFFBLD2c
	JKpfg94oyBkna8xhuTyFL5WMRwQXNw9juK9GU=
Received: by 10.143.9.2 with SMTP id m2mr994556wfi.74.1305312360419;
	Fri, 13 May 2011 11:46:00 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w14sm2303330wfh.20.2011.05.13.11.45.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2011 11:45:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Fri, 13 May 2011 11:45:54 -0700
Message-Id: <cover.1305312304.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/2] Add MACHINEOVERRIDES variable to bitbake.conf
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
X-List-Received-Date: Fri, 13 May 2011 18:48:50 -0000



Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/misc-fixes
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-fixes

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (2):
  conf/bitbake.conf: Add MACHINEOVERRIDES variable
  util-linux: inherit pkgconfig

 meta/conf/bitbake.conf                      |    3 ++-
 meta/recipes-core/util-linux/util-linux.inc |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
1.7.4.1



