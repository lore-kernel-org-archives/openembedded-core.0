Return-Path: <paul@betafive.co.uk>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 895FB7D912
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 21:31:05 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 6A2DF25BBB;
	Thu,  2 May 2019 17:31:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Thu, 02 May 2019 17:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id; s=fm1; bh=o6fE69fEClv/ljh
	TKTxd73gfnC8SMknsfitgqEtcKII=; b=ZQIRM6ov6NmYDOwAFG539BLUdLqTrO3
	VJSTA0OepEzdxyeQ7BcxfKgJZ/miHwmUKfqLS3fKZQMXwMblVzUB2ojyQaHs8zDo
	hve26lSnW2IrbaMsL8tcTjAOnc14eQDYctVEcHHQwIYrLNsK/r9LrMJ+xnx/E628
	7MlrCMITTBAX8iGj83leupsvQ4KmQExv9Ua1z8vldaiGEYpqu36LQw0DD/aAjUMC
	ia3424glkLtrdbuIekbiVniQKWLkGFbkMv9Y2+XYrNTv8fCHeletpJOkUEVWGiL6
	2Zu2dWwZuZE7C7EAYroj/jAuEmI583W0PlqNfNyGuzyPCn7rJp9DfFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=o6fE69fEClv/ljhTKTxd73gfnC8SMknsfitgqEtcKII=; b=45oz32En
	3wE7NFUUNHNPrR0RKvRflCUfKzjxNdzs+xxsuB4fFVg2qf4vdxUDtEwqLb44br8Z
	e0DJt3kdQz/6V+JkzO8Z1hSnnf5ZWuSnmRFFT0j6ZeW5ebQwFg9VLrAFoFusrHNq
	C07X2P0wL7ajjbTgCrCuAtfFvNG+sF643RpTUP/u9frGYOrxGTbQZFrgddrDOerg
	344k5+XWexVHQrgFHrf7RK0Ttq3FAd538UfePlv60YVLERGiMfIAos7ReHsH4JUc
	ki1tPzHs6yDdLZx6i7pAUGgkRUrxU0ZZq4vPa40yv8/h6Iwm40NAcBeF4uxuWNb6
	PKhJn8fsfwQI/g==
X-ME-Sender: <xms:mWHLXCbZKzJvqiayQlMWOABIGW24S8_9D1zVThrLcE-vjD1SJ5bi7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieelgdduieehucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhephffvufffkffosedttdertdertddtnecuhfhrohhmpehprghulhessggvthgr
	fhhivhgvrdgtohdruhhknecukfhppeekuddrudekjedrfedvrddufeeknecurfgrrhgrmh
	epmhgrihhlfhhrohhmpehprghulhessggvthgrfhhivhgvrdgtohdruhhknecuvehluhhs
	thgvrhfuihiivgeptd
X-ME-Proxy: <xmx:mWHLXK-GCVnSr4rMF_j1CLmapmkXcBbuLar07Gvv9kSDprXk51lq_Q>
	<xmx:mWHLXO9pCq_NQcCXZQ46LHlQFsxl-sq2geYyZtDOu0nY-CCQl47wlw>
	<xmx:mWHLXDJ55RRQDVLfTuPGAx2rULKjAVnbuGcH3yKtNgeLEwiEH0-vZg>
	<xmx:mmHLXPp7N4jE7WkILCZo7_-idYE8Te8eEgAxK0QRxeyPTsuVl_n6iA>
Received: from alpha.home.b5net.uk (138.32.187.81.in-addr.arpa [81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id 025C3103D1;
	Thu,  2 May 2019 17:31:04 -0400 (EDT)
From: paul@betafive.co.uk
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 May 2019 21:30:51 +0000
Message-Id: <20190502213052.15962-1-paul@betafive.co.uk>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/1] license_image: Don't try to hard link license files
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
X-List-Received-Date: Thu, 02 May 2019 21:31:05 -0000

From: Paul Barker <paul@betafive.co.uk>

Stumbled across a build failure when setting up my new build machine with
DEPLOY_DIR set to a location outside TMPDIR on a separate drive. This only
occurs if COPY_LIC_MANIFEST is also set but it's definitely worth fixing.

This applies cleanly to both master and warrior. The backport to thud should be
fairly obvious but let me know if it's worth me submitting a separate patch
against that branch.

Paul Barker (1):
  license_image: Don't try to hard link license files

 meta/classes/license_image.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.17.1


