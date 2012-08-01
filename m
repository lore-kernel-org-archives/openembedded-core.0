Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1SwZqD-0000Rz-IK
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 16:24:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q71ECLB3009996
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 07:12:22 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 1 Aug 2012 07:12:21 -0700
From: Morgan Little <morgan.little@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2012 10:12:01 -0400
Message-ID: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: This is a series of patches to update recipes that display warnings about the
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
X-List-Received-Date: Wed, 01 Aug 2012 14:24:02 -0000
Content-Type: text/plain

I compared the environment variables to make sure that they expanded out to
the same variables so nothing should be changed during runtime. 

The following changes since commit 4029ce1a15e1dbd374444ee77ccf2a915e463b7b:
  Khem Raj (1):
        package_rpm.bbclass: Accomodate dash when using arrays

are available in the git repository at:

  git@github.com:morganlittle/oe-core.git updatealternativesfixes

Morgan Little (19):
      tinylogin: use new update-alternatives
      patch: use new update-alternatives
      ubootchart_svn: use new update-alternatives
      gawk: use new update-alternatives
      less: use new update-alternatives
      mingetty: use new update-alternatives
      mktemp: use new update-alternatives
      msmtp: use new update-alternatives
      sed: use new update-alternatives
      time: use new update-alternatives
      wget: use new update-alternatives
      which: use new update-alternatives
      metacity: use new update-alternatives
      matchbox-session: use new update-alternatives
      matchbox-wm-2: use new update-alternatives
      mini-x-session: use new update-alternatives
      mutter: use new update-alternatives
      powertop: use new update-alternatives
      rxvt-unicode: use new update-alternatives

 meta/recipes-core/tinylogin/tinylogin_1.4.bb       |    8 ++++----
 meta/recipes-devtools/patch/patch.inc              |    4 ++--
 meta/recipes-devtools/ubootchart/ubootchart_svn.bb |    8 ++++----
 meta/recipes-extended/gawk/gawk_3.1.5.bb           |    8 ++++----
 meta/recipes-extended/gawk/gawk_4.0.1.bb           |    8 ++++----
 meta/recipes-extended/less/less_444.bb             |    6 +++---
 meta/recipes-extended/mingetty/mingetty_1.08.bb    |    8 ++++----
 meta/recipes-extended/mktemp/mktemp_1.7.bb         |    8 ++++----
 meta/recipes-extended/msmtp/msmtp_1.4.24.bb        |    8 ++++----
 meta/recipes-extended/sed/sed_4.1.2.bb             |    8 ++++----
 meta/recipes-extended/sed/sed_4.2.1.bb             |    8 ++++----
 meta/recipes-extended/time/time.inc                |    6 +++---
 meta/recipes-extended/wget/wget.inc                |    8 ++++----
 meta/recipes-extended/which/which_2.18.bb          |    6 +++---
 meta/recipes-extended/which/which_2.20.bb          |    6 +++---
 meta/recipes-gnome/gnome/metacity_2.30.3.bb        |    8 ++++----
 .../matchbox-session/matchbox-session_0.1.bb       |    8 ++++----
 .../matchbox-wm-2/matchbox-wm-2_git.bb             |    8 ++++----
 .../mini-x-session/mini-x-session_0.1.bb           |    8 ++++----
 meta/recipes-graphics/mutter/mutter.inc            |    6 +++---
 meta/recipes-kernel/powertop/powertop_1.13.bb      |    8 ++++----
 .../recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb |    7 ++++---
 22 files changed, 81 insertions(+), 80 deletions(-)


