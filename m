Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RtDBZ-0007OY-OI
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 08:03:59 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q136tZuq026748
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Feb 2012 22:55:47 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 2 Feb 2012 22:55:35 -0800
Message-ID: <cover.1328250226.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 3 Feb 2012 14:23:46 +0800
Date: Fri, 3 Feb 2012 14:39:29 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/2] LSB_Setup.sh: Add locale resources and startup avi
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
X-List-Received-Date: Fri, 03 Feb 2012 07:03:59 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add two parts:

1 Add absent locale resources in LSB_Setup.sh because of a lack of locale resources in core-image-lsb-qt3 when running lsb test. 
2 Add avahi-daemon. 
  Function "gethostbyaddr" will search file "/var/run/avahi-daemon/socket" but there is no this file which is created by avahi-daemon. 

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/1907_1954
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/1907_1954

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (2):
  init-functions: Add two functions
  LSB_Setup.sh: Add locale resources and startup script avahi-daemon

 meta/recipes-extended/lsb/lsb/init-functions    |    7 +++
 meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh |   50 +++++++++++++---------
 2 files changed, 36 insertions(+), 21 deletions(-)



