Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 017E360589
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 21:12:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0BLC76H005848
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 13:12:07 -0800
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Jan 2016 13:12:06 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jan 2016 15:12:03 -0600
Message-ID: <1452546725-211503-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH 0/2] Fix some oe-core issues using meta-mingw
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
X-List-Received-Date: Mon, 11 Jan 2016 21:12:09 -0000
Content-Type: text/plain

There are two patches here.. 1/2 seems like it's pretty straight forward and
should be able to be used as is.  = to ?=

2/2 however is more of an RFC.  I discovered today that the always on
native of the populate_sdk_ext has broken non-Linux SDKMACHINEs.  I put
together something that only enabled populate_sdk_ext when Linux is the
SDKMACHINE, but I'm guessing there is probably a better way... looking
forward to comments.

Mark Hatle (2):
  tcmode-default.inc: Fix preferred provider
    nativesdk-sdk_prefix-libc-initial
  image.bbclass: Unconditional includes of populate_sdk_ext fails

 meta/classes/image.bbclass                  | 5 ++++-
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
1.9.3


