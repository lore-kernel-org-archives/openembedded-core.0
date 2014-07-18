Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0464070639
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 18:44:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6IIi9OB017223
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 11:44:09 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 18 Jul 2014 11:44:08 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Jul 2014 13:49:24 -0500
Message-ID: <cover.1405709256.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] pseudo 1.6.1
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
X-List-Received-Date: Fri, 18 Jul 2014 18:44:15 -0000
Content-Type: text/plain

* Remove the uninformative "already offline" message.
* Stop trying to request x86-specific versions of memcpy on
  non-x86.

Tarball's been submitted to pidge but may take a while to show up.

The following changes since commit a449598a839e677e2a094aa4bd9a68003de6e42e:

  bdwgc: Add PACKAGECONFIG for libatomic-ops (2014-07-17 15:04:07 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib seebs/pseudo-161
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo-161

Peter Seebach (1):
  pseudo: uprev to 1.6.1

 .../pseudo/{pseudo_1.6.0.bb => pseudo_1.6.1.bb}    |    4 ++--
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/pseudo/{pseudo_1.6.0.bb => pseudo_1.6.1.bb} (52%)


