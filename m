Return-Path: <tanuk@iki.fi>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 36DAE746BD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 05:21:39 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 80CCF212C8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 01:21:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute5.internal (MEProxy); Sat, 31 Mar 2018 01:21:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=NMNmmKISuUG6BiJVt
	sxuxvOFdsc8nLQKEruBBV9OmKU=; b=F6RNyFTUpH9VbNdn4jY5ICxtXB4h6EeI4
	RYlLyjIJcpEGCTv1xzwW+GOL428y2AyXckIZfGGvCucTn2bZAeiNyYepzibj0ob3
	czAP07EtiaWy/KANQyO0QncAIkV+4bCKEAXSNzNQcDRWWi9M800/7q/n4zCuTHdF
	FyufSJ8vWXAc+iusifx2dyxkJjIS0hSojB5kNpjDLYw1iwpWibBcyFeahKo2AhDc
	x8pfiha0nruF5eIRlGE2eGI7U8locbp7piv4XWN1JaG4pVDi1zGzl3Y93APnxN2b
	Y7J7O7u4Vht0YAkNjo6IHugEqxTL8YG53sFNjvJTn80EhZvdbtm2w==
X-ME-Sender: <xms:5Bq_WgW58G1ilgV2tlMv3uP9oOdzHrFTV_cdnpdNYpmxb720MNYAZA>
Received: from localhost.localdomain (unknown [192.40.95.29])
	by mail.messagingengine.com (Postfix) with ESMTPA id EF58410252
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 01:21:39 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Mar 2018 08:21:29 +0300
Message-Id: <20180331052132.23841-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.16.2
Subject: [rocko][pyro][PATCH 0/3] libvorbis security fixes
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
X-List-Received-Date: Sat, 31 Mar 2018 05:21:40 -0000

Here are some libvorbis CVE fixes cherry-picked from master. The bugs
affect at least rocko, pyro and morty, I haven't checked older stable
branches. I don't know in which libvorbis version the bugs were
introduced.

These patches apply to rocko and pyro. The patches don't apply cleanly
to morty, so I'll send the morty patches separately.

Tanu Kaskinen (3):
  libvorbis: CVE-2017-14633
  libvorbis: CVE-2017-14632
  libvorbis: CVE-2018-5146

 .../libvorbis/libvorbis/CVE-2017-14632.patch       |  62 +++++++++++++
 .../libvorbis/libvorbis/CVE-2017-14633.patch       |  42 +++++++++
 .../libvorbis/libvorbis/CVE-2018-5146.patch        | 100 +++++++++++++++++++++
 .../libvorbis/libvorbis_1.3.5.bb                   |   3 +
 4 files changed, 207 insertions(+)
 create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14632.patch
 create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14633.patch
 create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2018-5146.patch

-- 
2.16.2


