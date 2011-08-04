Received: from c-76-105-242-32.hsd1.or.comcast.net ([76.105.242.32]
	helo=localhost6.localdomain6) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@localhost6.localdomain6>)
	id 1QpjPn-0005e7-N9 for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 18:07:56 +0200
Received: from localhost6.localdomain6 (localhost.localdomain [127.0.0.1])
	by localhost6.localdomain6 (8.14.3/8.14.3/Debian-9.2ubuntu1) with ESMTP
	id p74IO2CT012455; Thu, 4 Aug 2011 11:24:02 -0700
Received: (from eflanagan@localhost)
	by localhost6.localdomain6 (8.14.3/8.14.3/Submit) id p74IO1do012454;
	Thu, 4 Aug 2011 11:24:01 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Aug 2011 11:23:05 -0700
Message-Id: <cover.1312481647.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
To: OECore <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] Disk io measurements for build statistics
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
X-List-Received-Date: Sat, 06 Aug 2011 16:07:56 -0000

Resubmitting with task end time put back in. This should allow us
to plot ${PN} tasks along an axis with various disk io to give
us a better idea where disk thrash is occurring

This commit adds disk-io statistics functionality on a build
and per-task basis. I've also started drying it up some.

We pull measurements for whatever partition TMPDIR exists on.
We pull /proc/diskstats for every task and the entire build and collect
I do no analysis in this, leaving that for the end user. 

The following changes since commit 5561aaad28ed6db6d962f88db32814043044731f:

  eglibc: Fix patch merge breakage (2011-08-04 15:41:19 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib eflanagan/disk-io-stats
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=eflanagan/disk-io-stats

Beth Flanagan (1):
  buildstats.bbclass: Adding disk io measurement

 meta/classes/buildstats.bbclass |  221 +++++++++++++++++++++++++--------------
 1 files changed, 142 insertions(+), 79 deletions(-)



