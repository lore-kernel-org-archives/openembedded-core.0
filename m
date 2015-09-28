Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BBD4974242
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 20:48:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8SKm9dg018235
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 13:48:09 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 28 Sep 2015 13:48:08 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Sep 2015 15:48:06 -0500
Message-ID: <cover.1443473220.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 2.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] cross-canadian.bbclass: armeb is also gnueabi
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
X-List-Received-Date: Mon, 28 Sep 2015 20:48:10 -0000
Content-Type: text/plain

This only shows up if you're trying to build for an armeb target,
symptom of failure is gcc failing because it can't find a supported
target with the -gnu suffix instead of -gnueabi.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>

The following changes since commit 4a1dec5c61f73e7cfa430271ed395094bb262f6b:

  multilib: Add TARGET_VENDOR to saved variables list (2015-09-28 11:59:17 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/armeb
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/armeb

Peter Seebach (1):
  cross-canadian.bbclass: big-endian ARM is also gnueabi.

 meta/classes/cross-canadian.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.3.1


