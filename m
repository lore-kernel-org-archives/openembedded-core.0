Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CE3C76BF08
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 05:19:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r835JFtD015178
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Sep 2013 22:19:15 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 2 Sep 2013 22:19:14 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Sep 2013 13:19:22 +0800
Message-ID: <cover.1378185423.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/2] Add status command for LSB compliance for some packages
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
X-List-Received-Date: Tue, 03 Sep 2013 05:19:15 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

The following changes since commit 619e63946fef32995363981aab288fc669e8ac04:

  pulseaudio: disable GTK+ by default (2013-09-02 18:04:56 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/status
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/status

Roy.Li (2):
  distcc: add init.d/distcc status command for LSB compliance
  irda-utils: add init.d/irattach status command for LSB compliance

 meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/init |    9 ++++++++-
 meta/recipes-devtools/distcc/files/distcc                   |   10 +++++++++-
 2 files changed, 17 insertions(+), 2 deletions(-)

-- 
1.7.10.4


