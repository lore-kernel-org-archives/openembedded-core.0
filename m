Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sn73X-0007iG-Ry
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 13:50:40 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 06 Jul 2012 04:39:32 -0700
Received: by werf11 with SMTP id f11so4244166wer.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2012 04:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=oXzYKw9tuRxz6kpyD2/4kmV0ZP3nKOnOzPOSu3um01I=;
	b=OaejAC19LRAZdNCzAzxbD0d8CBdmAmcKggsBaF6OwEiByYESP2GdO02Tr4bJ/vkrQd
	HP0yLQkjIQiWNISumNGPGvzOeqEx4jhetut6wu3QuDpJ3aKpJPR3s+iYKbPmZrtwewqi
	Ju06jhrx9pocWO2lxqFtyK/bzJ75pMO6W3MlyHLkm5/zGN73cc/qgTrc0ic5KfrrBzvx
	n3zN4VaWm5ZHA8uqlOZZ0naMz2B212Qi33e25Q/l6t6paCDEBPrQujomGrAWdu1+oxdr
	EvF4HHvgY/PaLWqBGM5Ze385QbZ2ymSDgyIjHZSwso/5B5V/91gim4f1sGayayJ2yYos
	bt6A==
Received: by 10.216.175.76 with SMTP id y54mr9593279wel.56.1341574771238;
	Fri, 06 Jul 2012 04:39:31 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id df4sm5300627wib.4.2012.07.06.04.39.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Jul 2012 04:39:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jul 2012 12:39:16 +0100
Message-Id: <cover.1341574354.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmDmuzpgxTPyG+o5C4PiLXwBYxVKEC/NBZh/kyn5764bFz/pTQpkeJHQZaCrg9te9M/gDAI
Subject: [PATCH 0/2] Fix QA warnings from ConnMan
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
X-List-Received-Date: Fri, 06 Jul 2012 11:50:40 -0000

ConnMan warns that /usr/lib/connman/plugins isn't shipped, so ship the empty
directory in the main package.  Whilst there, remove some entirely pointless
entires in FILES.

The following changes since commit 5051e9837fa698e03d0a7a8a918ee7aa98409ce1:

  bitbake: usermanual: Fix missing markup (2012-07-06 09:41:56 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/connman

for you to fetch changes up to e7d865a01ec2b7f0aaf8bfd38d1604e9c1764207:

  connman: ship the empty plugins directory in the connman package (2012-07-06 12:30:41 +0100)

----------------------------------------------------------------
Ross Burton (2):
      connman: remove some obviously wrong (circa early-GNOME 2?) directories from FILES
      connman: ship the empty plugins directory in the connman package

 meta/recipes-connectivity/connman/connman.inc |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

Ross Burton (2):
  connman: remove some obviously wrong (circa early-GNOME 2?)
    directories from FILES
  connman: ship the empty plugins directory in the connman package

 meta/recipes-connectivity/connman/connman.inc |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

-- 
1.7.10



