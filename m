Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RR03u-0005iz-F9
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 12:23:22 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAHBGvGK025799
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 03:16:57 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 17 Nov 2011 03:16:56 -0800
Message-ID: <cover.1321528387.git.xiaofeng.yan@windriver.com>
Old-Date: Thu, 17 Nov 2011 19:13:07 +0800
Date: Thu, 17 Nov 2011 19:16:14 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/1] gtk+:Have gtk+ pick up ${NM} from the environment
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
X-List-Received-Date: Thu, 17 Nov 2011 11:23:22 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

When gtk+ configures, it should pick up ${NM} from the environment if it is defined, instead of just looking for "nm". 

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/gtk+
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/gtk+

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (1):
  gtk+: Have gtk+ pick up ${NM} from the environment

 .../gtk+/gtk+-2.24.6/configure-nm.patch            |   14 ++++++++++++++
 meta/recipes-gnome/gtk+/gtk+_2.24.6.bb             |    3 ++-
 2 files changed, 16 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+-2.24.6/configure-nm.patch



