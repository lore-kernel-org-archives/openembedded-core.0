Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web11.1425.1613783586292483512
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 17:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=gD1KFfMx;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 6E6B8340;
	Fri, 19 Feb 2021 20:13:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Feb 2021 20:13:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=GpgJmWgLogpBg
	PcbDd9kfpUNEnV5XxfYxrKo809pGwo=; b=gD1KFfMx0InT7TvWD8S/IG8yj1MFV
	O5Je/r6ZTOkW5Q5dHVeYZ/2Byv0QtFIlou7NIbqDUPicAiI7U5t7r9QOX7FofhTC
	pHgAy/knJzrFPZ1D+rtYNxuMKqWrn5DYZovG9HaLV3z8AQODCxgziv7tiCpAau+B
	AUPtkpBKhz8odCZEAKd3qK6X0HH4nyvrVM5x1cUv1dgTsuwDPgg3xtdhiPcY7XxX
	vwOuwO5zlJT8puZ5AzKt6PZB58Wy6i8cuFF5VrtflpuFrnuyOgHYr97+JpGW93Fs
	39Oju1+qg6g1FWWggkfF/2U83JHIZUwkKHS/MKMb2ZWa12fV0lmbRNH/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=GpgJmWgLogpBgPcbDd9kfpUNEnV5XxfYxrKo809pGwo=; b=bNSqhfgx
	u8vlEzlX9jbGpH9cltHGCAJ5vNPj/9JGOXOxfCCmLE9dWGg8EmFeeyoDU1ND6EpV
	ruUK2aO/FaAEYHXyEHMNh8+272VrWCmLEazdMJ2+e4Dp2u+d6W18lJFr4J1QRBNs
	rX390nwI+8zHzjNfLwyBfIzc9FcufNaG9yAi0x/splIQuhf1TdVrNQ/S/5WmMQIL
	ujyFlMniJzZkNiNjqPdm17AsjG1zKixHnqwuVSvg6Pmci4bT5+ddb3ifA6MycHGe
	I5botJXDgogMvzm1lOOHlv5OnBCMRuQXeKdjPGDH2OXCR8HkJsWxoy50O0zzfT9K
	/xH+SvD8MLocpg==
X-ME-Sender: <xms:IGIwYAQGa5GngXG3OMDxu1AEJEVcQhRhRj697P7ElwjjIUZlhVBfkA>
    <xme:IGIwYNxDn11neZjj6njsgweYfOGluKDxtMTANQ-EMrp6egmbo2mEmAaCi6jWO4xRX
    EM7gYEMJx5D7ZfFgk0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeejgdeftdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvghi
    ucfihhgvrhiirghnuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenucggtffrrg
    htthgvrhhnpeettddvffefkeetveekteeiveeggeevieeiudejfeeitedvkeelvdekheej
    lefffeenucfkphepkeeirddufedtrddugeeirdduvddvnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgt
    ohhm
X-ME-Proxy: <xmx:IWIwYN3k90Hro1y5wa4lIb6krPbo-zM2aYL1_a3ImO667SdmGUDM1A>
    <xmx:IWIwYEBsyrR2fKEnkDgkTC5ltMGFCWghoz6SZIheAswFacmwS2yh3w>
    <xmx:IWIwYJhbtV7Omie-y0_kClaxZeVsr_Ujt5in1CeCeD8CBU0A8VAhZQ>
    <xmx:IWIwYJLgV_ejY9-bb2Qw0bu4rP7NB3i-I5eCMePe914gAb9rGNS0mw>
Received: from qwirkle.internal (host86-130-146-122.range86-130.btcentralplus.com [86.130.146.122])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3E71024005B;
	Fri, 19 Feb 2021 20:13:04 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>,
	Robert Drab <robert.drab@huawei.com>
Subject: [dunfell][PATCH 2/4] oe/recipeutils: Fix copying patches when BBLAYERS entries are not normalised
Date: Sat, 20 Feb 2021 01:12:53 +0000
Message-Id: <20210220011255.823050-2-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210220011255.823050-1-andrei@gherzan.com>
References: <20210220011255.823050-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

`devtool` uses `copy_recipe_files` for the upgrade operation when
creating the new, workspace recipe. Before handling the copy operations,
the function checks the entry in `SRC_URI` against `FILE` while in turn
uses absolute paths. When BBLAYERS contains entries that are not
normalised, this check will fail resulting in having the recipe in the
workspace without the initial patches.

Signef-off-by: Robert Drab <robert.drab@huawei.com>
Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/lib/oe/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index fde1ad3ddd..f36a2fb0ac 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -409,7 +409,7 @@ def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True, all_variants=F
                 fetch.download()
             for pth in fetch.localpaths():
                 if pth not in localpaths:
-                    localpaths.append(pth)
+                    localpaths.append(os.path.abspath(pth))
             uri_values.append(srcuri)
 
     fetch_urls(d)
-- 
2.30.1

