Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1Q2lyK-0006ph-4W
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Mar 2011 15:57:12 +0100
Received: by rex (Postfix, from userid 1000)
	id 8286E20D6B; Thu, 24 Mar 2011 14:49:29 +0000 (GMT)
Message-Id: <cover.1300978024.git.richard.purdie@linuxfoundation.org>
Old-Date: Thu, 24 Mar 2011 14:47:04 +0000
Date: Thu, 24 Mar 2011 14:49:29 +0000
To: openembedded-core@lists.openembedded.org
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 0/2] Split IMAGE* variables into a separate class
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
X-List-Received-Date: Thu, 24 Mar 2011 14:57:12 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

These patches split the IMAGE* variables out into a separate class
to improve readabilty. The patch descriptions themselves have the details.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: rpurdie/imagetypes
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rpurdie/imagetypes

Thanks,
    Richard Purdie <richard.purdie@linuxfoundation.org>
---


Richard Purdie (2):
  bitbake.conf/image.bbclass: Move image type information into
    image_types.bbclass
  image_types.bbclass: Drop IMAGE_EXTRA_OPTION in favour of the more
    standard EXTRA_IMAGECMD

 meta/classes/image.bbclass       |   22 +---------
 meta/classes/image_types.bbclass |   86 ++++++++++++++++++++++++++++++++++++++
 meta/conf/bitbake.conf           |   44 -------------------
 3 files changed, 87 insertions(+), 65 deletions(-)
 create mode 100644 meta/classes/image_types.bbclass

-- 
1.7.4.1



