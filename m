Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E0A6065EE2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 23:08:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4LN8DIt001096
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 16:08:13 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 21 May 2014 16:08:12 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Wed, 21 May 2014 18:12:32 -0500
Message-ID: <cover.1400713858.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Revised pseudo-fchmodat (updated upstream-status)
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
X-List-Received-Date: Wed, 21 May 2014 23:08:16 -0000
Content-Type: text/plain

This is the pseudo-fchmodat patch, same code, but with an upstream-status
thing to indicate that it's a backport. (Slightly complicated because this
was three patches in the upstream branch, and I just merged in the combined
results so it'd be easier to see what was happening, and no one would have
to review a patch and reject it for obvious bugs that are fixed in the
next patch.)

The following changes since commit f1727bb18f35ff01e53d3d442a6ff3c613639fa6:

  guile: Update to 2.0.11 version (2014-05-21 10:50:37 -0700)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib seebs/pseudo-fchmodat2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo-fchmodat2

Peter Seebach (1):
  pseudo: handle fchmodat better, mask out unwanted write bits

 .../pseudo/files/pseudo-fchmodat-permissions.patch |  107 ++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.5.1.bb       |    3 +-
 2 files changed, 109 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/pseudo-fchmodat-permissions.patch


