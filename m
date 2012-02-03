Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1RtR3I-00018s-8w
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 22:52:16 +0100
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q13Lbcht011847
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Feb 2012 15:37:38 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q13LbaZM015304
	for <openembedded-core@lists.openembedded.org>;
	Sat, 4 Feb 2012 03:07:37 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Sat, 4 Feb 2012 03:07:35 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q13LbWJW028344;
	Sat, 4 Feb 2012 03:07:34 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Feb 2012 15:37:28 -0600
Message-ID: <1328305049-18696-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [RFC PATCH 0/1] u-boot inc: update inc file for newer u-boot versions
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
X-List-Received-Date: Fri, 03 Feb 2012 21:52:16 -0000
Content-Type: text/plain

All,

I would like your feedback on this patch which is intended to solve the
following issues with some of the newer versions of u-boot:

1. The u-boot image now ends in .img instead of .bin
2. Some versions and plaforms may use and SPL bootloader which is
   built at the same time as the u-boot binary

I tried to make sure this was backwards compatible and I was able to test
this for an am335x-evm machine from the meta-texasinstruments layer.

Most of these changes were ported from the u-boot.inc file that is in the
meta-texasinstruments layer and cleaned up to make them more generic.

Lastly, I noticed that the u-boot.inc file does not have any kind of
INC_PR defined like I would have expected to help make sure that updates
to this file cause a rebuild of u-boot recipes that depend on this
include file.  Is this something that should be added?

Thanks,
Chase


