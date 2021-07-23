Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web12.6351.1627035781170016531
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jul 2021 03:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm2 header.b=Y8qsXvxJ;
 spf=pass (domain: gherzan.com, ip: 64.147.123.21, mailfrom: andrei@gherzan.com)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 8EC9132008C3;
	Fri, 23 Jul 2021 06:22:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 23 Jul 2021 06:22:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=YkQCyXyTbdvldT6NYI/aMfSfQd
	5dDVN1wnZ1wYD1adM=; b=Y8qsXvxJGu9KAQFDdH3Es1Ag3D2MuhVl5Dc6cuwEmM
	oMr9CNxHFCdaSIrPaPDgF3kaPm+aVT+alGUXcmR2skvmWzT5a7/WYQN4ZLo7zQ71
	hKhc7ec7+ekbmRqRkUnMWmwBXfApp6lcrlIr0vcR9SX6m/8+ozQAXHv17YQ1N8LW
	PZT13ILwbCKGObwMC2FYdyxgFxS1wuaCx23lFTwH93g94xOZ5oimTtE398Ru7Nrp
	6Y5SrsyTFhq5BSe44D2clDM8mSKDiv2Wh8LLy/rXkCMX5URQ2JIyzAXLJ96/M8C+
	HChg0UH4winacQkG6msSm0SES7+8VqZyS0AoaA0aUSKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YkQCyXyTbdvldT6NY
	I/aMfSfQd5dDVN1wnZ1wYD1adM=; b=cEYIlGnAbZCHvc4M5+vjNP6Qqb3e+508e
	v7Ol70/MqQVBTUajNux0yyV5HXTkpq/OpCpS1RlGZ/CIle6XVi9sa9XNl/d1cJcW
	Dych+Y6w0XnExpWaVfX1+t3FIOYWRzFG8tNouvZZFr3XpzRskWHObewIEig0L5Vi
	PgEu+Wc4GoLpMnULuB3E8pcsyapMQPRzMCnjQY9IdtSS22Hx5jBKbTXNZgzEnQso
	gvt5dzgbGCRtqTGwgSGqjNqYqv06pPpZ8AMTMHuyMME2iRCO0Ii6aJ9JRf0hc+k9
	IF5GLA/fCfFcqolKRyQ206aKmG673FiTIFFJE6zGG2tFfSKzVczsQ==
X-ME-Sender: <xms:gZj6YMcOrokRCUqkiipuAwKniqsGlI5xWLC3CwFQzfHr3SwLjyLKGg>
    <xme:gZj6YOMwzXlY8qu72cBX9JhYqXTEqc97nMoR_3cAseb0JNue0jzWu_dLeHMXxFJuG
    mVHta_o90bBmSieM8o>
X-ME-Received: <xmr:gZj6YNga7hjHGE0R26lZyVHqPijPflHEY9RSgrApLbxLnQU0avzGGzZLe-jFL3C8HQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeekgddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhhvghr
    iigrnhdrtghomheqnecuggftrfgrthhtvghrnhepvdetuedtuedthfevgffgieefheevte
    fhueffkeegieeigfekhfehheejieejjedunecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:gZj6YB_qgt2h96jCeYKniyBQJKUtDkSP16fINFLDpVkAwuqQzcSmEA>
    <xmx:gZj6YItN7eFRialAokJSlLuwG4mEqOws5D8qc_suOigk5PsUsXqTmA>
    <xmx:gZj6YIGCv-xB4Jl2mt5nnszbBCD2mpIQQl7TzVuPhpcm5PtU5tA5nw>
    <xmx:gpj6YFV6GxDmQSXloZ3Zczk5FnD_sMLV3EczVX7MWOvWXD_Jt33jaw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jul 2021 06:22:55 -0400 (EDT)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [dunfell][PATCH 0/1] Backport an ovmf GCC11 fix
Date: Fri, 23 Jul 2021 11:22:22 +0100
Message-Id: <20210723102223.3349354-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

There can be situations where downstreamers work with updated GCC
versions and this fix would help. Even if that is not the case, the fix
is an improvement nevertheless.

Khem Raj (1):
  ovmf: Fix VLA warnings with GCC 11

 .../ovmf/0001-Fix-VLA-parameter-warning.patch | 51 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  3 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-Fix-VLA-parameter-warning.patch

-- 
2.31.1

