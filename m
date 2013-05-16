Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UcoL3-00047I-E6
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 04:54:44 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4G2aQsO027258
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 19:36:26 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 15 May 2013 19:36:26 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 May 2013 10:36:24 +0800
Message-ID: <cover.1368602187.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 0/1] bind: udev /var/run/named instead of /var/run/bind/run
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
X-List-Received-Date: Thu, 16 May 2013 02:54:50 -0000
X-List-Received-Date: Thu, 16 May 2013 02:54:50 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit a9f5bf0ed398bf9cb861feaa8b6fefd8645b1d09:

  sanity.bbclass: Attach the missing value to a format string. (2013-05-13 21:54:40 +0300)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/bind
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/bind

Chen Qi (1):
  bind: use /var/run/named instead of /var/run/bind/run

 .../bind/bind-9.8.1/conf.patch                     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.9.5



