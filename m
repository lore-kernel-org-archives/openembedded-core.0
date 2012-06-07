Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1ScS8z-0005HK-Sk
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 04:08:14 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q571viuB021761
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jun 2012 18:57:44 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 6 Jun 2012 18:57:44 -0700
From: <xiaofeng.yan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Jun 2012 10:01:54 +0800
Message-ID: <cover.1339034063.git.xiaofeng.yan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] archiver.bbclass: Reduce some duplication for function get_licenses
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
X-List-Received-Date: Thu, 07 Jun 2012 02:08:14 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

The content to modify this bbclass is as follow:
- Use the existing functions to get license as a directory instead of 
  rewriting it for avoiding code duplication.
- Use SPDXLICENSEMAP to map licenses

The following changes since commit df8f55a919b3cc602ce1f1c51630c7edf6e36b55:
  Cristian Iorga (1):
        ltp: Add patch to correct failing build

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib xiaofeng/2473
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/2473

Xiaofeng Yan (1):
  archiver.bbclass: Reduce some duplication for function get_licenses

 meta/classes/archiver.bbclass |   23 ++++++++++++-----------
 1 files changed, 12 insertions(+), 11 deletions(-)



