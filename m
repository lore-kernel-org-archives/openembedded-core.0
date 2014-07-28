Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 786996B7BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 18:33:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s6SIXiRl023304
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 11:33:44 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 28 Jul 2014 11:33:43 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Jul 2014 13:39:08 -0500
Message-ID: <cover.1406572002.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] add USE_LDCONFIG_CONF_D
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
X-List-Received-Date: Mon, 28 Jul 2014 18:33:50 -0000
Content-Type: text/plain

It'd be nice to support ld.so.conf.d, but it'd also be nice
if it were optional. I made the default be zero because I don't want
to change behavior on people without warning. Lightly tested, but
since I don't actually have a use case for this lying around I
can't promise it solves all the things.

The main intended benefit is that packages can install files
in ld.so.conf without stepping on each other.

The following changes since commit 91ca6b1b2e009381d8e813906654c0958eee7efc:

  lib/oe/rootfs: Improve error message whitespace (2014-07-28 12:20:56 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib seebs/ldsoconfd
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/ldsoconfd

Peter Seebach (1):
  Add support for ld.so.conf.d

 meta/recipes-core/eglibc/eglibc-package.inc |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)


