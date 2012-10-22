Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TQJsb-00004q-SD
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 17:25:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9MFC0Hn026048
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 08:12:00 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Mon, 22 Oct 2012 08:11:59 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Oct 2012 10:20:34 -0500
Message-ID: <cover.1350918262.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/4] Implement multilib SDK support
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
X-List-Received-Date: Mon, 22 Oct 2012 15:25:26 -0000
Content-Type: text/plain

The attached patch set implements multilib SDK support.  This means that 
when generating an SDK (either by a traditional SDK recipe or the
do_populate_sdk task), that support infrastructure for each multilib
will be included in the SDK.

Note, this code does -not- change the toolchain.  If the generated toolchain
does not work properly with the multilib configuration, that will need to
be a seperate fix!

This was tested with both the oe-core and our custom Wind River toolchain.
Generation passed on the oe-core SDK, but the functionality of the toolchain
was not tested.  The Wind River toolchain did get properly generated and
functioned as expected.

Note:  The 0003 patch that affects processing the environment file was
agreed to with the other author of the function.

The following changes since commit 06d27cf0fbcc4004e6f456880eca49893c9290bf:

  xorg: remove XF86 BigFont extension (2012-10-22 14:57:26 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib mhatle/sdk
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/sdk

Mark Hatle (4):
  multilib: Add support for cross-canadian multilib packages
  multilib - crosssdk: Stop building multilib for crosssdk packages
  populate_sdk_base: Update extraction script for multilibs
  populate_sdk_base: Ensure that the multilib cross-canadian tools are
    used

 meta/classes/base.bbclass              |   43 +++++++++++++++++++++++++++++---
 meta/classes/multilib.bbclass          |   20 +++++++++++---
 meta/classes/populate_sdk_base.bbclass |    7 +++--
 meta/lib/oe/classextend.py             |    4 +-
 4 files changed, 60 insertions(+), 14 deletions(-)

-- 
1.7.3.4



