Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A5C9065CAC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 21:21:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0KLLZBw001144
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 13:21:35 -0800 (PST)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 20 Jan 2015 13:21:35 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Jan 2015 15:21:33 -0600
Message-ID: <cover.1421788745.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] pseudo 1.6.3
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
X-List-Received-Date: Tue, 20 Jan 2015 21:21:40 -0000
Content-Type: text/plain

This has two changes from 1.6.2:
	* Merge (with some tweaking) of the without-passwd-fallback patches
	* Fix for #7097

The fix for #7097 looks reasonable to me and passes simple testing, I'm
not sure whether it's going to survive reality. Long story short, instead
of trimming trailing slashes in the client, we now trim them in the server,
so they don't affect database lookups, but do affect things like
underlying system stat() calls.

I've done a build with this, and the changes should be low-impact. File
should be up on the servers.

The following changes since commit eaea05c88661a88a89fa6b139f7e6b243155d492:

  depmodwrapper-cross: Update to use STAGING_KERNEL_BUILDDIR (2015-01-17 17:05:25 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib seebs/pseudo_163
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo_163

Peter Seebach (1):
  pseudo_1.6.2.bb/pseudo_git.bb: Pseudo 1.6.3

 ...do_client.c-protect-pwd_lck-against-magic.patch |   56 ----------
 ..._util-modify-interface-to-pseudo_etc_file.patch |   70 ------------
 ...nt.c-support-multiple-directories-in-PSEU.patch |  116 --------------------
 .../pseudo/{pseudo_1.6.2.bb => pseudo_1.6.3.bb}    |    7 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    4 +-
 5 files changed, 4 insertions(+), 249 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo-1.6.2/0001-pseudo_client.c-protect-pwd_lck-against-magic.patch
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo-1.6.2/0002-pseudo_util-modify-interface-to-pseudo_etc_file.patch
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo-1.6.2/0003-pseudo_client.c-support-multiple-directories-in-PSEU.patch
 rename meta/recipes-devtools/pseudo/{pseudo_1.6.2.bb => pseudo_1.6.3.bb} (57%)


