Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SNgqA-0008Ad-6K
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 10:47:46 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3R8c6O8018741
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 01:38:07 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 27 Apr 2012 01:38:06 -0700
Message-ID: <cover.1335515558.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 27 Apr 2012 16:32:38 +0800
Date: Fri, 27 Apr 2012 16:39:08 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/1] gdk-pixbuf: Add --with-x11 when building lsb image
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
X-List-Received-Date: Fri, 27 Apr 2012 08:47:46 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Hi Richard,

This is V2 for fixing bug 2284. I made some modification according to your suggestion.
Please review it again. 

The following was your suggestion:
We should be using the linuxstdbase override and also make it
conditional on x11 being in DISTRO_FEATURES.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/2284
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/2284

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (1):
  gdk-pixbuf: Add --with-x11 when building lsb image

 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)



