Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SwP7t-0003Aq-CB
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 04:57:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q712jswd028707
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 19:45:54 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Tue, 31 Jul 2012 19:45:54 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jul 2012 21:59:34 -0500
Message-ID: <cover.1343789879.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] Fix python-setuptools
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
X-List-Received-Date: Wed, 01 Aug 2012 02:57:33 -0000
Content-Type: text/plain

The following changes since commit 4029ce1a15e1dbd374444ee77ccf2a915e463b7b:

  package_rpm.bbclass: Accomodate dash when using arrays (2012-07-31 12:22:06 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/python-setuptools
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/python-setuptools

Mark Hatle (1):
  python-setuptools: Fix setuptools install libdir != /usr/lib

 .../python/python-setuptools_0.6c11.bb             |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

-- 
1.7.3.4



