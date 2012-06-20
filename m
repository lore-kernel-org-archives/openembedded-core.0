Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1ShJDb-00014t-7U
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 13:37:03 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 20 Jun 2012 04:26:16 -0700
Received: by weyt11 with SMTP id t11so4822316wey.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 04:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=zRQW57qF1xZlMsKfrE8FQUjBaPiS3sxSrdtcXhEaPVo=;
	b=JH3AnOlAckzMPw2AZ/TD22fivRRq+hsBXd9xbFYlhCd0Kgl9Qe2WLISw7wyLhX0YgJ
	zL7/VEHP9pU3fh8sMpZHkEcDjY9dt7oFf2Ldkl/K8RI4ubkPlytq9uAXM4nz26hVFBMq
	B/2Q4hgDem3ikcvfMjRjQt5TZOTF58/f+zq8IY7766g+T8+ynWyS59wSB8TMwIB6jFh7
	vYTmTKTgBFWrU16GelEdZxXbwtEhiHD/bjpH6qf9ndPSTls0fDDHjCkubovfDj5/WK/N
	E64l1kuBznWlshW5yAjAUByIRcsHju02mifIm+mM1QMGcyALFiEyD7iU2veLzhsrS1Nv
	+54w==
Received: by 10.216.143.148 with SMTP id l20mr13381451wej.115.1340191574452;
	Wed, 20 Jun 2012 04:26:14 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id j4sm38490365wiz.1.2012.06.20.04.26.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 04:26:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 12:26:09 +0100
Message-Id: <cover.1340191527.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
X-Gm-Message-State: ALoCoQkOA3oNQKueNC4zie58BvsFJrpgzYr6+XwHugrzpem5RKTWAUJhoXaX/aJKjE0JdgjDj98v
Subject: [PATCH 0/6] ConnMan 1.0 upgrade
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
X-List-Received-Date: Wed, 20 Jun 2012 11:37:03 -0000

Same as before, but I signed it all off this time.

The following changes since commit e0a70547069fe7e8a2d6bdaffc985fb172d46c31:

  perl: Allow perl to cross build and native build in a directory named "t" (2012-06-18 17:33:04 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib ross/connman
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ross/connman

Ross Burton (6):
  connman: rationalise configure options
  connman: add compat RPROVIDES for older packaging
  connman: upgrade to 1.0
  connman-gnome: fix build depends (Yocto #2556)
  connman-gnome: clean up runtime dependencies
  connman-gnome: upgrade to 0.7, which works with connman 1.0

 .../connman/connman-gnome_0.5.bb                   |   38 --------------
 .../connman/connman-gnome_0.7.bb                   |   19 +++++++
 meta/recipes-connectivity/connman/connman.inc      |   27 +++++++---
 .../connman/connman/disable_alg-test.patch         |   46 ----------------
 .../connman/connman/ethernet_default.patch         |   22 --------
 .../connman/test-set-ipv4-method-api-fix.patch     |   50 ------------------
 .../connman/test-set-ipv6-method-api-fix.patch     |   55 --------------------
 .../connman/{connman_0.79.bb => connman_1.0.bb}    |   10 +---
 8 files changed, 41 insertions(+), 226 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome_0.5.bb
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome_0.7.bb
 delete mode 100644 meta/recipes-connectivity/connman/connman/disable_alg-test.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/ethernet_default.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
 rename meta/recipes-connectivity/connman/{connman_0.79.bb => connman_1.0.bb} (53%)

-- 
1.7.7.6



