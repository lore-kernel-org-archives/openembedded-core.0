Return-Path: <andrew@bradfordembedded.com>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 7A8066FFED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 19:46:34 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 3AB1C2111A;
	Wed, 25 May 2016 15:46:35 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute1.internal (MEProxy); Wed, 25 May 2016 15:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	bradfordembedded.com; h=cc:date:from:message-id:subject:to
	:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=GvSPnBKQGHm4bZIslBuiBStWjqk
	=; b=kVl0flyE3ITI4HW976NnA80DxFWAKKXLrdqINFfV0x+JlVrwa8OVS0DBY/M
	9NK3ymty83T9cxivP2EJy37kz1Q/JuVg0YBLPSN78Q/WaHNLtDl0CjV2unmxhn+d
	ai9mecBkAahXCFopo4jq65a1rxX8kB/Q9SkPmswGC0hkYk4A=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-sasl-enc:x-sasl-enc; s=smtpout; bh=GvSPnBKQGHm4bZIslBuiBStWjq
	k=; b=Bo2iGq/B+tHKIVpuc8quBMqvsorvhHaw/kYS4+7E6YLcVj2E0q3eCdlPDR
	inYvz2oG08KgnAql8SUtPmgLAs0BxV2kh7lpVGcjl029RYJrGQaazoek1DnIMW22
	UPuPY4KwYnauda/t10Oz27y46rVPKuufbfw4ALb0N7LMm6DEA=
X-Sasl-enc: D6upI2wsnm7vYeVhf/+7yDw/KNnkJgm5Rgv0SjPpYkWc 1464205594
Received: from kaim-eeyore.kodakalaris.net (clr-vpn01.kodakalaris.com
	[198.140.222.129])
	by mail.messagingengine.com (Postfix) with ESMTPA id C006ACCD9C;
	Wed, 25 May 2016 15:46:34 -0400 (EDT)
From: Andrew Bradford <andrew@bradfordembedded.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 15:46:08 -0400
Message-Id: <1464205571-26293-1-git-send-email-andrew@bradfordembedded.com>
X-Mailer: git-send-email 2.8.1
Cc: Andrew Bradford <andrew.bradford@kodakalaris.com>
Subject: [PATCH 0/3] Setup for bitbake perforce fetcher changes
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
X-List-Received-Date: Wed, 25 May 2016 19:46:37 -0000

From: Andrew Bradford <andrew.bradford@kodakalaris.com>

The perforce fetcher does not yet support using SRCREV="${AUTOREV}" or
the use of the P4CONFIG variable [1].  These patches setup a few things
in oe-core so that changes in bitbake can take advantage of them to fix
these two issues as well as simplify and better document the use of the
perforce fetcher.

[1]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=6303

Thanks,
Andrew

Andrew Bradford (3):
  oe-buildenv-internal: Add P4CONFIG to BB_ENV_EXTRAWHITE_OE
  bitbake.conf: Add P4DIR and FETCHCMD_p4
  base.bbclass: p4 fetcher supports srcrev

 meta/classes/base.bbclass    | 4 ++++
 meta/conf/bitbake.conf       | 2 ++
 scripts/oe-buildenv-internal | 2 +-
 3 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.8.1


