Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1RGLWi-0008E4-72
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 04:05:04 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9J1xCuv024207
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 18:59:12 -0700 (PDT)
Received: from localhost (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 18 Oct 2011 18:59:12 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Oct 2011 10:00:23 +0800
Message-ID: <cover.1318989087.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.1.300.gc565c
MIME-Version: 1.0
X-Originating-IP: [128.224.162.225]
Subject: [PATCH 0/4] Update packages
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
X-List-Received-Date: Wed, 19 Oct 2011 02:05:04 -0000
Content-Type: text/plain

Hi All,

Update ghostscript, xdg-utils, libxml-sax-perl and liburi-perl to latest version.

Regards,

The following changes since commit 3c517bfe6c6d7781658f65bda4e0fdb499ca2b62:

  bind 9.8.1: fix build after recent update (2011-10-17 16:58:14 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/update-pkgs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/update-pkgs

Kang Kai (4):
  ghostscript: update to 9.04
  xdg-utils: update to 1.1.0 rc1
  libxml-sax-perl: update to 0.96
  liburi-perl: update to 1.59

 .../{liburi-perl_1.58.bb => liburi-perl_1.59.bb}   |    6 +-
 .../ghostscript-9.02-prevent_recompiling.patch     |   74 ++++++++++----------
 .../{ghostscript_9.02.bb => ghostscript_9.04.bb}   |   24 +++---
 ...ml-sax-perl_0.96.bb => libxml-sax-perl_0.99.bb} |    7 +-
 .../{xdg-utils_1.0.2.bb => xdg-utils_1.1.0rc1.bb}  |   20 +++---
 5 files changed, 67 insertions(+), 64 deletions(-)
 rename meta/recipes-devtools/perl/{liburi-perl_1.58.bb => liburi-perl_1.59.bb} (81%)
 rename meta/recipes-extended/ghostscript/{ghostscript_9.02.bb => ghostscript_9.04.bb} (81%)
 rename meta/recipes-extended/perl/{libxml-sax-perl_0.96.bb => libxml-sax-perl_0.99.bb} (85%)
 rename meta/recipes-extended/xdg-utils/{xdg-utils_1.0.2.bb => xdg-utils_1.1.0rc1.bb} (57%)

-- 
1.7.5.1.300.gc565c



