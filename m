Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7F2F260D36
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 17:43:38 +0000 (UTC)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 017HhcjN027434
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Feb 2020 11:43:39 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 11:43:36 -0600
Message-Id: <20200207174337.110342-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/1] Fix vardeps issue with SDK generation
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
X-List-Received-Date: Fri, 07 Feb 2020 17:43:39 -0000

I sent this before, but I suspect it got lost in the unrelated microblaze
rework.  No changes from the prior version, just resending to make it easier
to find.

Mark Hatle (1):
  populate_sdk_base: if the SDKIMAGE_FEATURES changes, refresh the SDK

 meta/classes/populate_sdk_base.bbclass | 1 +
 1 file changed, 1 insertion(+)

-- 
2.17.1


