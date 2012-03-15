Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1S8Axn-0004OE-TY
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 14:43:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2FDYi4V017150
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 06:34:44 -0700 (PDT)
Received: from build-PowerEdge-T100.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 15 Mar 2012 06:34:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Mar 2012 21:34:19 +0800
Message-ID: <cover.1331818182.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/3] logrotate: upgrade from 3.7.9 to 3.8.1
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
X-List-Received-Date: Thu, 15 Mar 2012 13:43:32 -0000
Content-Type: text/plain

Test info:

* Has been tested on qemux86, qemuppc, qemuarm.

// Robert

The following changes since commit 1e6dce3228a483b2367286e49c4aa8a71733dcbb:

  ncurses: fix install error (2012-03-15 13:14:10 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/logrotate
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/logrotate

Robert Yang (3):
  upgrade logrotate: split the old patch into 3
  upgrade logrotate: update the recipe
  upgrade logrotate: update the distro_tracking_fields.inc

 .../conf/distro/include/distro_tracking_fields.inc |    6 +-
 .../act-as-mv-when-rotate.patch}                   |   73 ++++----------------
 .../disable-check-different-filesystems.patch      |   34 +++++++++
 .../logrotate-3.8.1/update-the-manual.patch        |   42 +++++++++++
 .../{logrotate_3.7.9.bb => logrotate_3.8.1.bb}     |   11 ++-
 5 files changed, 99 insertions(+), 67 deletions(-)
 rename meta/recipes-extended/logrotate/{logrotate-3.7.9/allow-across-different-filesystems.patch => logrotate-3.8.1/act-as-mv-when-rotate.patch} (54%)
 create mode 100644 meta/recipes-extended/logrotate/logrotate-3.8.1/disable-check-different-filesystems.patch
 create mode 100644 meta/recipes-extended/logrotate/logrotate-3.8.1/update-the-manual.patch
 rename meta/recipes-extended/logrotate/{logrotate_3.7.9.bb => logrotate_3.8.1.bb} (72%)

-- 
1.7.4.1



