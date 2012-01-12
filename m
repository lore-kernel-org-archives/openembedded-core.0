Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1RlNn2-0001Sa-Mo
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 17:46:12 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id q0CGcaqE001110
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 12 Jan 2012 17:38:37 +0100
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Thu, 12 Jan 2012 17:38:36 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2012 17:38:12 +0100
Message-Id: <1326386296-1526-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.7.5
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.995
X-Spam-Score: -5.8
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.72 on 62.153.82.30
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 0/4] Conditionalize build of x11/gtk frontends
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
X-List-Received-Date: Thu, 12 Jan 2012 16:46:12 -0000

Several packages can be used without graphical frontends, but the
buildsystem brings in statically (heavy) x11 or gtk+ software stacks.
This patchset uses the 'x11' DISTRO_FEATURE to disable building of
these components.

Enrico Scholz (4):
  gst-plugins: do not build x11 related plugins without the x11
    DISTRO_FEATURE
  distcc: honor x11 DISTRO_FEATURE
  latencytop: honor x11 DISTRO_FEATURE
  sysprof: conditionalized build of gtk frontend

 meta/recipes-devtools/distcc/distcc_2.18.3.bb      |    5 +++--
 meta/recipes-kernel/latencytop/latencytop_0.5.bb   |    6 +++++-
 meta/recipes-kernel/sysprof/sysprof_git.bb         |    2 +-
 .../gstreamer/gst-plugins-base_0.10.35.bb          |    4 +++-
 meta/recipes-multimedia/gstreamer/gst-plugins.inc  |    1 +
 5 files changed, 13 insertions(+), 5 deletions(-)

-- 
1.7.7.5



