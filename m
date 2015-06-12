Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DFA1A758E6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 03:23:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5C3NNlp023677
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 20:23:23 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 11 Jun 2015 20:23:23 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jun 2015 20:23:20 -0700
Message-ID: <cover.1434079315.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] Add invalid-ac-cv QA and and remove invalid ac_cv.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Jun 2015 03:23:25 -0000
Content-Type: text/plain

The following changes since commit 0dbe539403fc0da3c3d0b1a6636bc7c9d0e19484:

  pulseaudio: fix version when building inside a dirty git checkout (2015-06-11 23:57:52 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ac-cv
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/ac-cv

Robert Yang (2):
  insane.bbclass: check invalid ac_cv value
  Remove invalid ac_cv

 meta/classes/insane.bbclass                        |   19 ++++++++++++++++++-
 meta/recipes-connectivity/openssh/openssh_6.8p1.bb |    8 --------
 meta/recipes-connectivity/socat/socat_1.7.3.0.bb   |    1 -
 meta/recipes-core/glibc/glibc.inc                  |    1 -
 meta/recipes-devtools/apt/apt.inc                  |   12 ------------
 meta/recipes-devtools/git/git_2.4.2.bb             |    2 +-
 meta/recipes-devtools/python/python.inc            |    1 -
 meta/recipes-devtools/strace/strace_4.10.bb        |    2 --
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    1 -
 .../gstreamer/gstreamer1.0-plugins-base.inc        |    2 --
 meta/recipes-multimedia/lame/lame_3.99.5.bb        |    2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    1 -
 meta/recipes-support/apr/apr_1.5.2.bb              |    4 ----
 13 files changed, 20 insertions(+), 36 deletions(-)

-- 
1.7.9.5


