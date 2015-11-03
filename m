Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1613976E70
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 22:21:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tA3MLEH9003430
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Nov 2015 14:21:15 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 3 Nov 2015 14:21:14 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Nov 2015 16:21:12 -0600
Message-ID: <1446589273-23317-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] [jethro/master] Fix mips XLP and Octeon3 assembly
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
X-List-Received-Date: Tue, 03 Nov 2015 22:21:22 -0000
Content-Type: text/plain

There is a clash in the machine value, as Octeon3 was assigned one value
by binutils, but the XLP patch decided to use the same value.  Since the
XLP value was not officially assigned, change it to avoid the clash.

This fixes an issue where certain instructions, such as DMUL, may be 
assembled incorrectly due to the clash.

Mark Hatle (1):
  binutils: Fix XLP / Octeon 3 instruction clash

 .../binutils/binutils/0012-Add-XLP-instructions-support.patch     | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
1.9.3


