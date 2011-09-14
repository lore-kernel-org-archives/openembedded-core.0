Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R3df9-0002jC-Cm
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 02:49:15 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8E0i4kh009393
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 17:44:04 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 13 Sep 2011 17:44:03 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Sep 2011 19:52:54 -0500
Message-ID: <cover.1315961467.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] Update to latest prelinker -- fix arm and x86 issues
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
X-List-Received-Date: Wed, 14 Sep 2011 00:49:15 -0000
Content-Type: text/plain

This fixes yocto bugzilla bug 1473.  It addresses an issue where a typecast
wasn't being specified and the compiler was doing the wrong thing in a 
printf.

The symbols of the previous failure were, on a 32-bit IA32 host, targeting
either a 32-bit IA32 target or ARM target the results of a prelinked image
may not work properly.

The following changes since commit 3be290aac4da885fe5bc31797c4a689196c63b7a:

  libzypp: move package-manger to it own package (2011-09-13 16:19:30 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/prelink
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/prelink

Mark Hatle (1):
  Uprev to latest version of prelink_git, fixing TLS issues

 meta/recipes-devtools/prelink/prelink_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.3.4



