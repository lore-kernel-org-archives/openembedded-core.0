Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RFyjj-0001fu-OQ
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 03:44:59 +0200
Received: by pzk33 with SMTP id 33so269451pzk.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 18:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Mnp8uqIYb4mnzlRKn4trImJdOUCF+AW0Ne5hQRIilSw=;
	b=hj5gh/pXLvG+pvkpj/2Ts9STVf55WO5VluFW0b5gD+i2S+CSNPa4r8ilYZhY7AIhTE
	YkBN11g0e4ox+jTZda2qphveUT0/EH/ZoJQD/1GN9EUkqA/2tZDKCm2oBC/xhUD+wHtv
	TMRwI7ajfBXr/UHudjzxqwdszM9hg4kUQFnA0=
Received: by 10.68.13.35 with SMTP id e3mr1202466pbc.31.1318901949078;
	Mon, 17 Oct 2011 18:39:09 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id ko15sm1811845pbb.9.2011.10.17.18.39.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 18:39:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2011 18:38:50 -0700
Message-Id: <cover.1318901607.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/3] gcc update and bug fix
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
X-List-Received-Date: Tue, 18 Oct 2011 01:45:00 -0000

This patchset does two things for gcc
1. Updates to latest from FSF gcc-4_6-branch 
2. Backport the fix for PR46934

The changes that come from FSF gcc are listed here
http://sakrah.homelinux.org/files/gcc-4.6-ChangeLog-r180099_r180099.txt

3. Bluez4 needed glib.h therefore depend on glib-2.0

The following changes since commit 8bc098475f58b60bfb24ec0fd338e49ac2387c50:

  gcc-4.6: Backport PR46934 fix (2011-10-17 18:00:29 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/gcc-update
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/gcc-update

Khem Raj (3):
  bluez4: Add glib-2.0 to DEPENDS
  gcc-4.6: Upgrade SRCREV to latest FSF 4.6 branch
  gcc-4.6: Backport PR46934 fix

 meta/recipes-connectivity/bluez/bluez4.inc      |    2 +-
 meta/recipes-connectivity/bluez/bluez4_4.96.bb  |    2 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc           |    5 +-
 meta/recipes-devtools/gcc/gcc-4.6/pr46934.patch |  392 +++++++++++++++++++++++
 4 files changed, 397 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/pr46934.patch

-- 
1.7.5.4



