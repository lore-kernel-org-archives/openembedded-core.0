Return-Path: <paul@betafive.co.uk>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 1D2626C397
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 09:06:26 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 2470821B7C;
	Tue, 24 Sep 2019 05:06:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Tue, 24 Sep 2019 05:06:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=ppj5jCGkqvVroH/k0ML/uict/2
	KnFc7HVh0wIYUMEdE=; b=zNFBzJIP+kwIuywLsccAiFwN/pqT9zWD4gy60yuwKE
	917HrgYMrkzat5fsqbZPoPv+pa90RTeqCAmfMHplmO9VjxKAWaJRsBcUstC/stLi
	kIAFIknGnqaLYXoywlSavc4QLJA0X89u7FYLOwRbc/jYuxZOJWCztXzKGBP2uO2M
	VWA1YP5XlVPF+aRbJ2w10QjUcsCQ3mKsQZoRu6OeK+zpgxBPM9zF09m8NP4Yqirp
	Igx9hnfdOsT2WZRE8ie0xQRcn1IoWmBEEjW4wx0nX5bBhSMBBFXhRu3E9VG3bdx1
	nNVBzqQsNeMdtMGyFKrVBTLuhQSXcyD1bwNQ9PigBWTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ppj5jCGkqvVroH/k0
	ML/uict/2KnFc7HVh0wIYUMEdE=; b=sME9DvstYpsWUctk32iVy/9s/MfNdg7EC
	Ozpql2/RxhDFv/YnP39LDnKFxBhXewrrFbBlkNSgyf19vipXeqvefU5F00yfPjIw
	/U24CuibccTflDlUQHO+ex8XmVKdjB1YOIbL+yFwJoC19+OYBTCrmvy1/11Tdjn6
	S/fLUYLMp/oxmjJMvFTUj3WYEwd1C7nEx5MthIkv+mb7llexE6Nj6Pqg2tvCMkVZ
	yqV3YSygt/HpAbI5ItQ+2vRGOcFBk9yuG3gcfZng39RBDC94ppG44HkC325DqsBZ
	9AaH2KQIAG0baX5KwGX5s9xcFQfCHR0r3bhHOKN5dVDBHl+qTySTA==
X-ME-Sender: <xms:j9yJXZAOY9mSfrpYC7U9e4otqgqfK5Czi_J7bvjhPvC2rWH5njDmow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedtgdduudcutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
	dtnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsegsvghtrghfihhvvgdr
	tghordhukheqnecukfhppedvudefrdegkedruddurddugeelnecurfgrrhgrmhepmhgrih
	hlfhhrohhmpehprghulhessggvthgrfhhivhgvrdgtohdruhhknecuvehluhhsthgvrhfu
	ihiivgeptd
X-ME-Proxy: <xmx:j9yJXd4RbS09NjTbaH42Rtza8_mHDlalCJsYbZeOKSJjLLLo-DPJEg>
	<xmx:j9yJXQ0xFs8R1eqqYX7Nl_FI21sWgrwb1fF9j28SCqrXEqg7jqRvHA>
	<xmx:j9yJXRkw7v-v511URnf87eMvBRwT5m_VJyNobgl25cWl07Fg8TXxGw>
	<xmx:kNyJXeA-Zy37Kk7Z25uCNMNfqHUKZKRmZQmnsN_dLJb0QPipBwX65A>
Received: from arch0.home.b5net.uk (unknown [213.48.11.149])
	by mail.messagingengine.com (Postfix) with ESMTPA id 26DF2D6005F;
	Tue, 24 Sep 2019 05:06:23 -0400 (EDT)
From: Paul Barker <paul@betafive.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2019 10:06:08 +0100
Message-Id: <20190924090609.264248-1-paul@betafive.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 0/1] Add new mirror archiver mode
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
X-List-Received-Date: Tue, 24 Sep 2019 09:06:26 -0000
Content-Transfer-Encoding: 8bit

This patch allows the creation of a full source mirror using the archiver
bbclass. Using the archiver allows us to make use of copyleft license
filtering, recipe type filtering and other features that are not available if
we just copy the contents of the downloads directory itself to create a
mirror. We also get the advantage of sstate caching and we don't have to
throw away the entire downloads directory before building to keep sources for
other builds out of our mirror.

The resulting mirror may be published and used as an entry in PREMIRRORS or
MIRRORS for a subsequent build. The functionality is explained in more detail
in the patch commit message and the additions to the documentation comments.

We've been using this patch in our Oryx Linux distro for a few months now to
confirm that it works as expected. All feedback is welcome, especially from
people who have worked on the archiver bbclass before.

Mirror creation was tested with the following additions to local.conf:

    INHERIT += "archiver"
    BB_GENERATE_MIRROR_TARBALLS = "1"
    ARCHIVER_MODE[src] = "mirror"
    ARCHIVER_MODE[mirror] = "combined"
    ARCHIVER_MIRROR_EXCLUDE = "file://"
    COPYLEFT_LICENSE_INCLUDE = "*"

The resulting mirror directory was moved out of the tmpdir and a rebuild was
tested with the following additions to local.conf:

    BB_NO_NETWORK = "1"
    INHERIT += "own-mirrors"
    SOURCE_MIRROR_URL = "file://${TOPDIR}/mirror"

Paul Barker (1):
  archiver.bbclass: Add new mirror archiver mode

 meta/classes/archiver.bbclass | 136 +++++++++++++++++++++++++++++-----
 1 file changed, 117 insertions(+), 19 deletions(-)

-- 
2.23.0


