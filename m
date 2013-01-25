Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1TyeYk-0002Pl-2z
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 09:22:50 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0P87Gc7019290
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 00:07:16 -0800 (PST)
Received: from pek-wfan-d2.corp.ad.wrs.com (128.224.162.225) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Fri, 25 Jan 2013 00:07:13 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Jan 2013 16:06:55 +0800
Message-ID: <cover.1359095007.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] git: remove unpackaged perl-native files
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
X-List-Received-Date: Fri, 25 Jan 2013 08:22:50 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

These warnings appear in a build which enabled multilib:

${libdir} is not applicable for the install path of perl-native files,
files are always installed to /usr/lib no matter the target is 32/64
bits. After installing, remove unpackaged and unneeded perl-native
files to prevent warnings.
    
Fix warning:
    WARNING: For recipe git, the following files/directories were \
        installed but not shipped in any package:
    ...
    WARNING:   /usr/lib/perl-native/perl/5.14.2/Git.pm
    WARNING:   /usr/lib/perl-native/perl/5.14.2/perllocal.pod
    WARNING:   /usr/lib/perl-native/perl/5.14.2/Error.pm
    WARNING:   /usr/lib/perl-native/perl/5.14.2/auto
    
[YOCTO#3780]

The following changes since commit f0e02dc132c301c0a33a3a8cecddc867b1f0a70e:

  sample.extended: Add DISTRO_FEATURES_INITMAN (2013-01-24 20:09:46 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/3780-git
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/3780-git

Wenzong Fan (1):
  git: remove unpackaged perl-native files

 meta/recipes-devtools/git/git.inc        |    6 +++++-
 meta/recipes-devtools/git/git_1.8.0.2.bb |    2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
1.7.10.4



