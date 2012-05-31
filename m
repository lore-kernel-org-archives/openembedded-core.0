Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SZyb0-00019i-ED
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 08:10:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4V60Yc2005952
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 23:00:34 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 30 May 2012 23:00:33 -0700
From: <xiaofeng.yan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 May 2012 14:02:55 +0800
Message-ID: <cover.1338443711.git.xiaofeng.yan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/2] archiver.bbclass:Improve the usability for the archiver classes
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
X-List-Received-Date: Thu, 31 May 2012 06:10:54 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

The usability of the archiver classes can be improved, beyond the 
simple addition of default values for the variables. 
A user could well inherit just archiver rather than the individual 
useful classes, and not realize it will do nothing.

The following changes since commit f28209d9d3c67203a2c7a2b25cacfe31643d1bfa:
  Kang Kai (1):
        cooker.py: terminate the Parser processes

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib xiaofeng/2472
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/2472

Xiaofeng Yan (2):
  archiver.bbclass: Improve the usability for the archiver classes
  local.conf.sample.extended: Change the usage about arhiver.bbclass

 meta-yocto/conf/local.conf.sample.extended |   31 ++++++++++++++++-----------
 meta/classes/archiver.bbclass              |    6 +++-
 2 files changed, 22 insertions(+), 15 deletions(-)



