Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 23B3B606CB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 16:55:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u96GtZL0016531
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Oct 2016 09:55:35 -0700 (PDT)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Oct 2016 09:55:34 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Oct 2016 11:55:32 -0500
Message-ID: <20161006165533.40950-1-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] Fix linuxloader reference for MIPS*
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
X-List-Received-Date: Thu, 06 Oct 2016 16:55:38 -0000
Content-Type: text/plain

Fix linux loader reference for MIPS*

Note, this patch assumes the previously submitted change for the
mipsisa*r6* work has been applied.  It's critical that the mips*
match is -after- any more specific mips matches.

Mark Hatle (1):
  linuxloader.bbclass: Adjust mips to cover all mips/mips64

 meta/classes/linuxloader.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.9.3


