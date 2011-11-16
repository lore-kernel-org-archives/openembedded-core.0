Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1RQcx5-000750-Cb
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 11:42:47 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAGAaMw8009890
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2011 02:36:22 -0800 (PST)
Received: from localhost.localdomain (128.224.162.225) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Wed, 16 Nov 2011 02:36:22 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Nov 2011 18:36:10 +0800
Message-ID: <cover.1321439619.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.225]
Subject: [PATCH 0/1] Update eglibc 2.13 to latest svn revision
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
X-List-Received-Date: Wed, 16 Nov 2011 10:42:47 -0000
Content-Type: text/plain

Hi All,

I am not sure whether it is the right time to update eglibc, but sync with
upstream with latest rivision.

The following changes since commit fa81f8dfb7a342e355b608aa4204cf23ed2b251c:

  mime.bbclass: fix typo (2011-11-15 12:05:30 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/update-pkgs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/update-pkgs

Kang Kai (1):
  eglibc_2.13: update SRCREV

 .../conf/distro/include/distro_tracking_fields.inc |    3 +
 .../eglibc/eglibc-2.13/glibc_bug_fix_12454.patch   |  179 --------------------
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    5 +-
 3 files changed, 5 insertions(+), 182 deletions(-)
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/glibc_bug_fix_12454.patch

-- 
1.7.5.4



