Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TL4nX-0003dm-4F
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 06:18:31 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so8693090ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Oct 2012 21:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=NwSkeG5dX8VjTi6PmF+Y0GQc4/TnMcWgU2KJiCSwfKY=;
	b=Dc7h5dDDjPXcoReulVu3qhBiW/G5KW+IWAa4D0N36iz8FX9djfhrejSK5giNTn9fjT
	GBJUrIPoxIi9lHrPvDvLvLX+KcwDzo5XvF3WNzZDMWJF7PkcjUat7umV5/IKaGXgtxgE
	Tpr7/0N2KSCB717jEi8cq1VUmE++qh1p2SGRau5DbMIbGxQ0zVUooX82WYtCoKLiNMo0
	ZkOF5CfllVSpfstqehTTlXNzre8XZRh9qZ5CvjP+jjHAgv/TUns00oYyeG/aIyoZmDtT
	EoFCdcKegYeZRE9uurk+e5iph3mAIvs2CbWMfKM/IrgGQp52z/L5O97ZWMpKmIQHmmNG
	vW4Q==
Received: by 10.50.179.33 with SMTP id dd1mr1071529igc.31.1349669124867;
	Sun, 07 Oct 2012 21:05:24 -0700 (PDT)
Received: from localhost.localdomain ([96.44.93.233])
	by mx.google.com with ESMTPS id d19sm6175073igp.6.2012.10.07.21.05.22
	(version=SSLv3 cipher=OTHER); Sun, 07 Oct 2012 21:05:24 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon,  8 Oct 2012 00:05:17 -0400
Message-Id: <cover.1349668552.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] linux-yocto: consolidated configuration update
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
X-List-Received-Date: Mon, 08 Oct 2012 04:18:31 -0000

Richard/Saul,

This update carries the same warning as one I sent earlier, I'm out
of the office until Wednesday, but don't want to sit on these chanages
until then.

This pull request are the configuration changes that I've collected
over the past few weeks that are safe for the yocto 1.3 release. 
For the most part these are obselete configuration item cleanup
(and hence no runtime change), warning removal for selected BSPs
(and hence no runtime change) and removal of some kernel modules 
without a specific use case, but were large (hence a smaller footprint
for any default configuration build, and no runtime change).

I've also included a the change made for poky-tiny, which has already
been incorportated by Darren Hart. During Darren's testing, he would
have had all these config changes, so they got some extra testing.

I've stacked this on top of my yocto-bsp change, since it's easier
to do from here.

If there are any problems use my gmail address, since I can't
access my work email until Wednesday.

Cheers,

Bruce

The following changes since commit af84c18279bdf7c2c7f5ee5d5e88f7ce666f3a29:

  linux-yocto-bsps: update hardware reference BSPs to v3.4.11 (2012-10-07 22:50:59 -0400)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-yocto/3.4: fix kconfig warnings and unnecessary options
  linux-yocto/3.4: tiny: Add qemu KMACHINE to common-pc-tiny.scc

 meta/recipes-kernel/linux/linux-yocto_3.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.5.4



