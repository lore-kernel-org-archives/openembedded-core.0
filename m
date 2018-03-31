Return-Path: <tanuk@iki.fi>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id D4542747AD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 05:24:34 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id D93BF20ADC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 01:24:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Sat, 31 Mar 2018 01:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=52+Y3HX4mz2wxQ63A
	ItBcxN1+xoG5Tdr7LlflUFs31A=; b=NDgtyFZFHv3WwI26aTungZs7SaV3s+U2I
	o4SE9LqAO7Cg7k8B65yrCuLkqJ04SlLYKFaO1d3WdMvUAiMfPsK0NRLtqijlZY1C
	cbQvPft/wIZowu/g472w6IkyCcnw284LZYcQe5kDUOAdvJFrq4RZd4ig+y86F/WG
	dV1K/IasrKPTahvc+L8Ynul7uS32oTGPCwqwJBbe14cptbPLEGGasAgfIXOC6jDk
	oxCybmZeNuy89cKA5VNgfB1NszG66xDdKbK7bcq8Si2U5vP9QvqXBY7TOI7WgUDY
	Vc1sOG/cpRChGRNkffcqmI/AQGqeAzdibixMSon0bJmQ+RJpnvTgQ==
X-ME-Sender: <xms:kxu_WpqUYUF4Np5HzI5IfVOxaT90YPjBMvOIHyXaO-lYzmlVaPscdg>
Received: from localhost.localdomain (unknown [192.40.95.29])
	by mail.messagingengine.com (Postfix) with ESMTPA id 613CBE4437
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 01:24:35 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Mar 2018 08:24:25 +0300
Message-Id: <20180331052428.24138-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.16.2
Subject: [morty][PATCH 0/3] libvorbis security fixes
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
X-List-Received-Date: Sat, 31 Mar 2018 05:24:35 -0000

Here are some libvorbis CVE fixes cherry-picked from master. The bugs
affect at least rocko, pyro and morty, I haven't checked older stable
branches. I don't know in which libvorbis version the bugs were
introduced.

These patches apply to morty. I have sent the rocko and pyro patches
separately.

Tanu Kaskinen (3):
  libvorbis: CVE-2017-14633
  libvorbis: CVE-2017-14632
  libvorbis: CVE-2018-5146

 .../libvorbis/libvorbis/CVE-2017-14632.patch       |  62 +++++++++++++
 .../libvorbis/libvorbis/CVE-2017-14633.patch       |  42 +++++++++
 .../libvorbis/libvorbis/CVE-2018-5146.patch        | 100 +++++++++++++++++++++
 .../libvorbis/libvorbis_1.3.5.bb                   |   6 +-
 4 files changed, 209 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14632.patch
 create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14633.patch
 create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2018-5146.patch

-- 
2.16.2


