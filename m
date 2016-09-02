Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id CCB2B77141
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 16:17:30 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 457B242B4AF4F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 17:01:47 +0100 (IST)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Fri, 2 Sep 2016 17:01:50 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Sep 2016 17:01:38 +0100
Message-ID: <1472832102-8067-1-git-send-email-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [PATCH 0/4] A few mipsel/soft float fixes
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
X-List-Received-Date: Fri, 02 Sep 2016 16:17:31 -0000
Content-Type: text/plain

Hi,

I've been trying to run bitbake -k world in poky starting with mipsel.
Here are a few fixes for various packages.

Regards
ZubairLK

p.s. 
Still trying to wrap my head around yocto/oe-core and submitting patches
Please be gentle


Zubair Lutfullah Kakakhel (4):
  packagegroup-core-sdk: Disable sanitizers for mipsel
  packagegroup: Disable packages not available on mipsel
  libffi: Add patch for MIPS soft float
  valgrind: Disable for MIPS Soft Float

 .../packagegroups/packagegroup-core-sdk.bb         |   1 +
 .../packagegroup-core-tools-profile.bb             |   2 +
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb  |   4 +
 ...ard-float-specific-code-into-ifdef-blocks.patch | 244 +++++++++++++++++++++
 meta/recipes-support/libffi/libffi_3.2.1.bb        |   1 +
 5 files changed, 252 insertions(+)
 create mode 100644 meta/recipes-support/libffi/libffi/0002-mips-wrap-hard-float-specific-code-into-ifdef-blocks.patch

-- 
1.9.1


