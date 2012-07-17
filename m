Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrCwL-0005Np-0Q
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 20:56:09 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 17 Jul 2012 11:44:36 -0700
Received: by weyt11 with SMTP id t11so433912wey.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 11:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=DCkGFwUpNEOihHeJgDB1fhdI/nYZS6GHVFiIpOo9TUE=;
	b=RX6qbOFyRMxDzOekuMDmjy6b2LXPtNCQoQSZ4LlyWPZ/hEivxxWnEx3UOGC5Zi3N6p
	waUgxUnUMkMLuxsGovVZmrOcW6Wg2IEpbT3TE37Ysy4BOYq36Of8zx7PLa/U6Xb6gJDG
	MYyI+XWFgsjFhUSFqoxjcYSV/r0o30GMVcpE0rhU/7rIeKCPKiLQLi9vCcyhFTDU1xUo
	QfG6ImYCH0WBNi6ILWIJ5Y6bzmYSGMofJHF4yKA0SO7zsLP13ULXdZNM85BYcOwrGEtm
	/LsVM338uBVTF54AGoguvf4kO2E5RBSGpg0WlATBkyvPpT3rc3egw3Q9znNEXmD4sYnW
	oT2A==
Received: by 10.180.14.8 with SMTP id l8mr33807wic.6.1342550675049;
	Tue, 17 Jul 2012 11:44:35 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id k20sm28346138wiv.11.2012.07.17.11.44.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 11:44:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 19:44:18 +0100
Message-Id: <cover.1342550573.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlLWfnqKrfaEpW6SH5ZqN0yRza5aTRXpVY/igtgWsWeB0d6MpIVR0matIbx6miXxwtMFHsa
Subject: [PATCH 0/2] WebKit fixes
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
X-List-Received-Date: Tue, 17 Jul 2012 18:56:09 -0000

Fix up a warning, and make compilation fast again.

This may cause failures when doing a parallel build due to a GNU Make bug,
but it's harder to replicate than originally thought (I can't replicate it
anymore).  If we get failures again hopefully we'll be able to work out what
the real cause is.

The following changes since commit 219a855f99bc45fd273f62df9507be7223eff1b4:

  useradd.bbclass: Fix for multilib builds (2012-07-17 10:56:26 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/webkit

for you to fetch changes up to 66df0bb01e0162d51bb20b03d11157d42a057563:

  webkit-gtk: remove spurious install_prepend hack (2012-07-17 19:41:43 +0100)

----------------------------------------------------------------
Ross Burton (2):
      webkit-gtk: remove no-parallel bodge
      webkit-gtk: remove spurious install_prepend hack

 meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb |    9 ---------
 1 file changed, 9 deletions(-)

Ross Burton (2):
  webkit-gtk: remove no-parallel bodge
  webkit-gtk: remove spurious install_prepend hack

 meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb |    9 ---------
 1 file changed, 9 deletions(-)

-- 
1.7.10



