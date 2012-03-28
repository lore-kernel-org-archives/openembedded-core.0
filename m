Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1SCpWn-0002kG-PT
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 11:50:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2S9foJP013599
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 02:41:50 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.241) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Wed, 28 Mar 2012 02:41:50 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Mar 2012 17:41:44 +0800
Message-ID: <cover.1332927487.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.241]
Subject: [PATCH 0/1] ghostscript: work around for parallel build issue
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
X-List-Received-Date: Wed, 28 Mar 2012 09:50:54 -0000
Content-Type: text/plain

Hi,

The patch is for Yocto 1202, to fix parallel build issue.
Test it 100 times for mips and 4 times show the error mesage that "Files exists"
but bitbake compile pass.

Regards,

The following changes since commit 7b01671f54f70c28c98457058c51ffefcb07c0e8:

  nspr 4.8.9: failed to build on x86_64 board (2012-03-27 13:26:37 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/fix-gs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/fix-gs

Kang Kai (1):
  ghostscript: fix parallel make issue

 .../ghostscript-9.02-parallel-make.patch           |   13 +++++++++++++
 .../ghostscript/ghostscript_9.05.bb                |    2 +-
 2 files changed, 14 insertions(+), 1 deletions(-)

-- 
1.7.5.4



