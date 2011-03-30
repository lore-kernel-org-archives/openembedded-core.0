Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Q520V-0008DX-1O
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Mar 2011 22:28:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2UKQhwT002994
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Mar 2011 13:26:43 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 30 Mar 2011 13:26:42 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <poky@yoctoproject.org>, <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2011 15:29:11 -0500
Message-ID: <cover.1301516765.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/3] Fix zypper integration
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
X-List-Received-Date: Wed, 30 Mar 2011 20:28:48 -0000
Content-Type: text/plain

Fix the zypper integration on Bernard (Poky).  This is also be necessary 
in master/OE-core as well!  (I have not verified that the C++ workaround 
is needed on OE-Core, but the same change for MIPS -is- needed due to 
namespace collision.)

Fixes [YOCTO #827] Zypper not working on ARM.  (Note, one of the issues 
resolved actually affects all host types..)

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: mhatle/bernard/zypper
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/bernard/zypper

Thanks,
    Mark Hatle <mark.hatle@windriver.com>
---


Mark Hatle (3):
  Fix sat-solver & RPM5 integration issue
  Fix integration of zypper and sat-solver
  Workaround for Global C++ Constructor problem on ARM

 .../libzypp/libzypp/archconf.patch                 |   15 -
 .../arm-workaround-global-constructor.patch        |   68 +++
 .../libzypp/libzypp/builtin-arch.patch             |  122 -----
 .../libzypp/libzypp/libzypp-pokyarch.patch         |  498 ++++++++++++++++++++
 .../libzypp/libzypp/no-builtin-arch.patch          |  128 -----
 meta/recipes-extended/libzypp/libzypp_git.bb       |  120 ++++-
 .../sat-solver/sat-solver/builtin-arch.patch       |   28 --
 .../sat-solver/sat-solver/no-builtin-arch.patch    |   29 --
 .../sat-solver/sat-solver_obsolete.patch           |   20 +
 .../sat-solver/sat-solver/sat-solver_poky.patch    |  106 +++++
 meta/recipes-extended/sat-solver/sat-solver_git.bb |   43 +-
 11 files changed, 820 insertions(+), 357 deletions(-)
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/archconf.patch
 create mode 100644 meta/recipes-extended/libzypp/libzypp/arm-workaround-global-constructor.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/builtin-arch.patch
 create mode 100644 meta/recipes-extended/libzypp/libzypp/libzypp-pokyarch.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/no-builtin-arch.patch
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/builtin-arch.patch
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/no-builtin-arch.patch
 create mode 100644 meta/recipes-extended/sat-solver/sat-solver/sat-solver_obsolete.patch
 create mode 100644 meta/recipes-extended/sat-solver/sat-solver/sat-solver_poky.patch

-- 
1.7.3.4



