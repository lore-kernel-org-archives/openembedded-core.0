Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web09.2518.1626811842322150783
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jul 2021 13:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=DzVoauCl;
 spf=pass (domain: pbarker.dev, ip: 66.111.4.25, mailfrom: paul@pbarker.dev)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id AA01E5C00BA;
	Tue, 20 Jul 2021 16:10:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 20 Jul 2021 16:10:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=YuakK2vGqeIdlKRiMzqG8uIPm/
	wwE+gsj8EGnDEO6RE=; b=DzVoauClGz+daCcqKCDHmIT2v3geEi9YmyiIFSwLcy
	L37vRn8WujiPcosW4I9rAIhgdDKvFJeMw7gh4PxfbO0f2SXTylCO6m8wtiqelpHG
	rqo5FpbtVVODXZDqSxigSvV5zeTnfx2Tj9NcYtV2vNNdnLStamSOwTj4YsMV+qfs
	c4WdCfMPsKnhv/sZSMZn1McqvvCpOkFDTm+qB8hOdVM8unY85oWUvNDtec/zhX0C
	/2/hRsnZnwvKriTRDHLGWxHMYoM23CQRp7Ihb61COn+UUwoafm4QzwAiG3O//74+
	oASRXxUjnV/YOYIN/S56ZY11jbCCPopjhNxGKVqKL1DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YuakK2vGqeIdlKRiM
	zqG8uIPm/wwE+gsj8EGnDEO6RE=; b=Qy9S2OtFLDaEd2ROV2qR+i6isIlAumQwX
	Ay9Pzc5sICElb9vxMiRN85ajPcRpmaEeIiWM59ZxDKhOaX5vw1v/Rwikw5Rgc+8t
	2RAoLHk/VK0xc+W/kxudAZYANh7xg3JgAfIKmVEMvEtvGPYqJSixS9NnAEbANWyY
	rOVZ3FwWU9SfGkfpOAheRFfPfAi8ib9wrbuVwV86EoskDtWCVHeijM24NzOEpJV0
	1x7vS9BgUUURJY/7JD3Bum/cukfd4WajoghivxPKJTJ1TGreyShfp0Va0gsMjGrz
	Vc7dzLhulunoiURGtCE84NrbcEuPVlhpsSB0D8e2A41qSuQCDbNRw==
X-ME-Sender: <xms:wS33YPPyNjFHYq1dNQqylJBnPNdD6SyIqDkUKyWrjA2rGArN6GahSA>
    <xme:wS33YJ_fpUxp7opuKNoZ7Md-zp0zRQScGifYQGgAe67PitV2G2dJteFjRpApEhuVb
    l4Mcx365Oj57arEHec>
X-ME-Received: <xmr:wS33YORofamVwyW0riwyO1d10dVTfFj8r7_V_5Yzz5cPRwmX70vxvOzoG2vP39WmGpUqGbFNPfNapyRP2Z0QEW73PNs-o_pk8FhS8NGaDImtBFccFOl4oIj51NM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedvgddugedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    etfeelleehueegjedugeeitddtvdffvdelfefgvddugeekudelgeduiefhieejudenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesph
    gsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:wS33YDvttYUMdOpajLE4nCLDAm-5NQgjg8wF83XDFzKXVUOA-QcdRg>
    <xmx:wS33YHfIQHrhzPiy0ZDyNVKAZAh-a6oo1ZmHGgWi-tGokfYkGburLA>
    <xmx:wS33YP3gSsK7Oga43Y1ByWMzonTABt09ai0fIl93E_RcDeRi5v6HpA>
    <xmx:wS33YPFEqUSLYOw-rbNiM_rHRwE68umkVuQNytihexkAg1e366WOLg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jul 2021 16:10:40 -0400 (EDT)
From: "Paul Barker" <paul@pbarker.dev>
To: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Paul Barker <paul@pbarker.dev>
Subject: [PATCH] linux-yocto: Fix devupstream SRCREV assignment
Date: Tue, 20 Jul 2021 21:10:34 +0100
Message-Id: <20210720201034.25900-1-paul@pbarker.dev>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following error when building linux-yocto-upstream:

    Fetcher failure: Unable to find revision 570e7aedcd00e7e8a218e37c3dfb3b1fda83d111
    in branch v5.13/base even from upstream

The error occurred as the SRCREV_machine assignment earlier in the
recipe was being used instead of the mainline commit hash we want to use
for linux-yocto-upstream.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
index df385f912c..f43e738c69 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
@@ -31,7 +31,7 @@ SRCREV_meta ?= "4dcaa4bcd042d398e210b702449dd35fdf9f0078"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE_class-devupstream = "-1"
-SRCREV_class-devupstream ?= "f86aa267e180b23d8d24ee6886bd3bf9a360112e"
+SRCREV_machine_class-devupstream ?= "f86aa267e180b23d8d24ee6886bd3bf9a360112e"
 PN_class-devupstream = "linux-yocto-upstream"
 KBRANCH_class-devupstream = "v5.13/base"
 
-- 
2.26.2

