Return-Path: <tanuk@iki.fi>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id B72F378839
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 08:59:30 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id E9DA920C9A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 04:50:56 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Tue, 20 Mar 2018 04:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Jcbip9Q0XIjY/vpiA
	qVbncLAMNrB/oqZ2a62K7eit1g=; b=nmiQMsQuzBjtu9gAUzBupBsAx+D6rtRnI
	c3mJt1v6+Y8DdBJhfa1mXcCJmyEs6TM8e0hSG15XmhQ2fBjIJJYythOTXsWjRbeS
	aZ6WAjTPILZ73hgS6stJGwNXO0HH4vxWq5OcoKbFDYZf2UM8dUjeQsKxHlJHlmUW
	1pwNHTKHkmTEYJYeEOWm57QdgUks3TdL746iaNwpmKZTz/G/ZzPyfZ6NOr2qTAnx
	3xorSiJxGlqKNstMwrKsp/rdRECU7OjKR0aMbcSck3pPqgyf1abQrfkXMQESps92
	mgUEBm2IXXPPwnM6GKPgz3KAuTdjhKGJbP9IY7aM2s4P1NALsp9BQ==
X-ME-Sender: <xms:cMuwWl1YR-k5VWZK95JyaMg0mFpY6VeghASrUc2b6J4mDsaqnvSjhQ>
Received: from localhost.localdomain (unknown [192.40.95.30])
	by mail.messagingengine.com (Postfix) with ESMTPA id 577F77E1D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 04:50:56 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2018 10:50:21 +0200
Message-Id: <20180320085024.554-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH 0/3] libvorbis security fixes
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
X-List-Received-Date: Tue, 20 Mar 2018 08:59:30 -0000

libvorbis 1.3.6 was recently released, and contains fixes for some CVEs.
Since the deadline for version upgrades is past, I'm only submitting the
CVE fixes.

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


