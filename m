Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SHOCL-0005MF-Bt
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 01:40:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q39NVC1B012371
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Apr 2012 16:31:13 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.110) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Mon, 9 Apr 2012 16:31:11 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Apr 2012 18:31:06 -0500
Message-ID: <cover.1334014014.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
X-Originating-IP: [172.25.34.110]
Subject: [PATCH 0/1] MIPS/MIPS32 tune -> MIPS
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
X-List-Received-Date: Mon, 09 Apr 2012 23:40:37 -0000
Content-Type: text/plain

The following is in reference to the recent discussion about the mips32
-package- arch changing from mips to mips32.  One of the potential options
was to get rid of the previous "mips" and replace it with the mips32
definition standard.  This patch does just that.

Working with Khem, we have moved the default "mips" (32-bit) tune to be
-march=mips32 based, and produce package with the package arch of "mips".

The side effect of this work is that the prior 'mips' tune was actually
"mips1".  I don't believe that was really desired by anyone, but it is a
change.  Also there is no longer a "mips32" tune, just an include file
that automatically inherits and chooses the "mips" tune.

The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb47:

  runqemu-internal: Add console=tty for qemuppc and NFS (2012-04-06 01:12:15 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/mips-tune
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/mips-tune

Mark Hatle (1):
  tune-mips32: Update the default MIPS tuning to be mips32

 meta/conf/machine/include/mips/arch-mips.inc |   13 +++++++++----
 meta/conf/machine/include/tune-mips32.inc    |   24 +-----------------------
 2 files changed, 10 insertions(+), 27 deletions(-)



