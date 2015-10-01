Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 382D8770B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 18:26:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t91IQAtP029211
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Oct 2015 11:26:10 -0700 (PDT)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 1 Oct 2015 11:26:09 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Oct 2015 13:26:07 -0500
Message-ID: <1443723968-43906-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Cc: david.reyna@windriver.com
Subject: [PATCH] "Finish" the IMAGE_GEN_DEBUGFS implementation
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
X-List-Received-Date: Thu, 01 Oct 2015 18:26:11 -0000
Content-Type: text/plain

It was noticed today that the IMAGE_GEN_DEBUGFS implementation was not 
complete.  The version that was merged back in May only contained the 
filesystem generation pieces, but not the pieces for creating the image
from that filesystem.

The code has been tested and is working.  The only thing that I don't 
particularly like is that the processing code and loop is a duplicate of
the code that runs just before.  Unfortunately the only way around this
is to change the way that way the parallel bits are processed to support
multiple datastores..  (or create "another" function..)

Any feedback appreciated, but without this the feature is broken!

Mark Hatle (1):
  lib/oe/image.py: Add image generation for companion debug filesystem

 meta/conf/documentation.conf         |  2 ++
 meta/conf/local.conf.sample.extended |  9 +++++++++
 meta/lib/oe/image.py                 | 37 ++++++++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+)

-- 
1.9.3


