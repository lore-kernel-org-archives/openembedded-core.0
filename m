Return-Path: <mark.hatle@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 55A626AFC2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 23:40:59 +0000 (UTC)
Received: from SAN-EXCH-DR.corp.ad.wrs.com (san-exch-dr.corp.ad.wrs.com
	[128.224.81.10])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r79Nexgl024511
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Aug 2013 19:40:59 -0400 (EDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	SAN-EXCH-DR.corp.ad.wrs.com (128.224.81.10) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 9 Aug 2013 16:40:58 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Aug 2013 18:41:04 -0500
Message-ID: <1376091665-24119-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH] Fix an issue with runtime remapping and multilibs
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
X-List-Received-Date: Fri, 09 Aug 2013 23:40:59 -0000
Content-Type: text/plain

Fix an issue with runtime remapping and multilibs when the remapped
filename is the same as the original (non-multilib) name.  This can
happen with all arch, and module packages.

Mark Hatle (1):
  image.bbclass: Move runtime_mapping_rename to avoid conflict w/
    multilib

 meta/classes/image.bbclass | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

-- 
1.8.3


