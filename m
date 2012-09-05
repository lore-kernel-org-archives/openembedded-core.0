Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T9C8n-0001oH-3F
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 11:43:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q859UvLt005341
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Sep 2012 02:30:57 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Wed, 5 Sep 2012 02:30:56 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Sep 2012 17:31:02 +0800
Message-ID: <cover.1346837304.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/3] V2: Update packages ltp and lsb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2012 09:43:21 -0000
Content-Type: text/plain

V2 just update upstream track info at same time.

Regards,
Kai

The following changes since commit 99c85ba93075a1aff789cafabbacf42e6a93bd32:

  build-appliance-image: Update to latest poky master (2012-09-04 18:04:40 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/update-pkgs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/update-pkgs

Kang Kai (3):
  ltp: update
  lsb: update version
  upstream_tracking: update lsb and ltp

 .../conf/distro/include/upstream_tracking.inc      |   12 +++---
 .../lsb/{lsb_1.4.bb => lsb_4.1.bb}                 |   34 ++++++++++----------
 .../ltp/{ltp_20120614.bb => ltp_20120903.bb}       |    6 ++--
 3 files changed, 26 insertions(+), 26 deletions(-)
 rename meta/recipes-extended/lsb/{lsb_1.4.bb => lsb_4.1.bb} (84%)
 rename meta/recipes-extended/ltp/{ltp_20120614.bb => ltp_20120903.bb} (96%)

-- 
1.7.5.4



