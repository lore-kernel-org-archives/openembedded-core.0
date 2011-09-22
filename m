Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R6mrc-0007Di-6v
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 19:15:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8MH9llF007367
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 10:09:47 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 22 Sep 2011 10:09:46 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2011 12:12:08 -0500
Message-ID: <cover.1316711477.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/2] Update cups and foomatic
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
X-List-Received-Date: Thu, 22 Sep 2011 17:15:08 -0000
Content-Type: text/plain

Based on RP's comments to the previous foomatic-filter update, I have
reviewed and revised both cups and foomatic-filters.

The following changes since commit 468e4a2f0e63e9d33e88b98a7d075b186ef481b2:

  glib-2.0: Drop old 2.27.5 development version (2011-09-22 08:47:22 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/rpm
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/rpm

Mark Hatle (2):
  cups: Fix recipe to use the correct cups directories
  foomatic-filters: Disable filter checking

 meta/recipes-extended/cups/cups14.inc              |   20 +++++++++++++-----
 meta/recipes-extended/cups/cups_1.4.6.bb           |    2 +-
 .../foomatic/foomatic-filters_4.0.7.bb             |   21 ++++++++++++++-----
 3 files changed, 30 insertions(+), 13 deletions(-)

-- 
1.7.3.4



