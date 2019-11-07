Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8EBFD7FA1D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 23:26:28 +0000 (UTC)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id xA7NQQp6003903
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Nov 2019 17:26:27 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 17:26:25 -0600
Message-Id: <20191107232626.21787-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/1] eSDK w/o buildtools
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
X-List-Received-Date: Thu, 07 Nov 2019 23:26:29 -0000

This allows the eSDK w/o integrated builtools.

Enabled with: SDK_INCLUDE_BUILDTOOLS = '0'

qemux86-64 - core-image-minimal - eSDK sizes

Regular eSDK - 838 MB
Minimal eSDK -  34 MB
Min w/o bts  -  11 MB

So it's a fairly significant drop in download size for the eSDK.

Mark Hatle (1):
  populate_sdk_ext.bbclass: Make integrated buildtools optional

 meta/classes/populate_sdk_ext.bbclass | 41 ++++++++++++++++++---------
 1 file changed, 27 insertions(+), 14 deletions(-)

-- 
2.17.1


