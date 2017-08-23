Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 945DC78285
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 15:51:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7NFpm2G022516
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 08:51:48 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 Aug 2017 08:51:47 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Aug 2017 10:50:15 -0500
Message-ID: <1503503416-47233-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH] vulkan distro flag update
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Aug 2017 15:51:47 -0000
Content-Type: text/plain

I'm not sure if this is right or not, but it resolves the failures I was
getting after updating oe this morning.

I was attempting to run the yocto project compliant script, which runs
bitbake -S none world.  The results of this were an error that vulkan
needed 'mesa-vulkan-drivers'.  Looking at mesa, it was clear that these
are only built in the 'vulkan' distro flag is set.  (and mesa is only
built in the opengl flag is set.)

So I've added these checks to the vulkan recipe, and resolved the check.


Mark Hatle (1):
  vulkan: Only build when 'vulkan' distro flag is set

 meta/recipes-graphics/vulkan/vulkan-demos_git.bb | 2 ++
 meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb  | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
1.8.3.1


