Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TLDvA-0005kq-Cf
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 16:03:06 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so9645195ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2012 06:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=dEauqZWy5ju0XB7X2geAzFXogH+oQ40E+Qf7Imn2UJc=;
	b=n6BzTYJYDmhdJVTP4mXj+rO3WrEe9JKKHr47pufEEoFs/y+LeMOcQ6/UW+YA7lZBii
	h9TM8ipQcZZX4YCb74wDFoJq97zN0zmP6CNwLCIy7MRWhpuChkdXsWeBXvdZmj1PN2Nf
	fooFgUJ3myClr12brGxH87VbteiCdsQRuqxzhOkpeTFYAdWbrgM5lfdOfMAq2Msxuc42
	hE+CTAYR5YuxszrwEvwM4/EPIzlJgpzhHvr9Ht1Ion6kXT5esIvos60Cu11jqNvMibrN
	4UsyzJoqN/1IgrFNtWdIhPb3/dbpChMvPlPogZ4X7HObVDhIbMDWyqxGPGCINaaAjSHN
	8IWQ==
Received: by 10.50.184.229 with SMTP id ex5mr8345366igc.72.1349704190839;
	Mon, 08 Oct 2012 06:49:50 -0700 (PDT)
Received: from localhost.localdomain ([96.44.93.233])
	by mx.google.com with ESMTPS id uj11sm1664431igb.15.2012.10.08.06.49.48
	(version=SSLv3 cipher=OTHER); Mon, 08 Oct 2012 06:49:49 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon,  8 Oct 2012 09:49:37 -0400
Message-Id: <cover.1349703933.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] linux-yocto-3.4: perf fixes
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
X-List-Received-Date: Mon, 08 Oct 2012 14:03:08 -0000

Richard/Saul,

Here are a couple of last minute perf fixes that were reported
recently. One fixes a parallel build issue and the other adapts
perf annotate to the typical yocto userspace.

I did as many build tests as I could here, but the changes are
small and safe.

This should be it for kernel updates for the release, unless
something major pops up.

My same warning applies: I'm heading out for the day, and make
sure to reply to my gmail account if there are issues with this.

cc: Tom Zanussi <tom.zanussi@intel.com>

Cheers,

Bruce

The following changes since commit 04232f5908d4a3116589193fa5f1ff526bdedacc:

  poky-tiny: Update the default kernel to linux-yocto-tiny_3.4 (2012-10-08 09:23:57 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto/3.4: perf: parallel build and tools fixes

 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   12 ++++++------
 3 files changed, 10 insertions(+), 10 deletions(-)

-- 
1.7.5.4



