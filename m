Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1PxTRI-0006d0-8S
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Mar 2011 01:09:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p29NqRow000654
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Mar 2011 15:52:27 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 9 Mar 2011 15:52:26 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Mar 2011 17:52:42 -0600
Message-ID: <cover.1299714512.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] Fix debug package generation in gcc-runtime
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
X-List-Received-Date: Thu, 10 Mar 2011 00:09:13 -0000
Content-Type: text/plain

The following patch fixes a the -dbg package generation for the gcc-runtime
packages.  This is needed to enable debugging of C++ applications.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: mhatle/bernard/fixes
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/bernard/fixes

Thanks,
    Mark Hatle <mark.hatle@windriver.com>
---


Mark Hatle (1):
  gcc-runtime: Ensure that gcc-runtime builds a debug package

 meta/recipes-devtools/gcc/gcc-package-runtime.inc |    3 +++
 meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb    |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

-- 
1.7.3.4



