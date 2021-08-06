Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web09.2685.1628283633619091769
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 14:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm2 header.b=O4yx4NgH;
 spf=pass (domain: stwcx.xyz, ip: 64.147.123.25, mailfrom: patrick@stwcx.xyz)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id D4AE73200922;
	Fri,  6 Aug 2021 17:00:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 06 Aug 2021 17:00:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=Ot5DHUuixVtepTYVl1EMtgnNfe
	epiafCaDGA5Btchck=; b=O4yx4NgHsgu/xuTGxracjuVTOlxfblN02/RqJUE+ua
	2TGQETZ6hAengZ1hZtP8AwG9EwU5LgPYDPkd2w1ynQNUM5y1KeBFCrOW+g3nnqlg
	b2IebPOkFiUg498y+K9moqgTg0+3d+nlffneOcCGCjgZ2tn/5zHYsu3GNu6J4S9e
	Yt+T1XxurdFn4C+ODnNU3bsjynZjn3qb07c9LCZLCq1/V7088EGzlq+uuEz37vrN
	Yd8bzmNp7mn06vVGg5kLKXesIlWv556dpxWbS1Y0sJ+BSFpMinhfxTAARglCVGKq
	AbgIpppXuXy7G59TbMqo8HFB2328okOOBqebnrUIkspw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Ot5DHUuixVtepTYVl
	1EMtgnNfeepiafCaDGA5Btchck=; b=asjKTOi/BCFJG7y+AwDvDpGp9mVWiab5/
	rOUl9fDmHp8WszcKyVO21KhXmqW7ckQUPaTWE98PXp4Ir/IfBOUr2rtF2eSEwinO
	EpXvxC/SDFr6PHBLGtPwpFRTLh4aupmqKthUN74YKuwCl9SISlwNHK809aMnI+zU
	F5VkCxsmuwCm12BRtB2AqXg6YADMS1ptDTmIgAGIzJOo6Gx7rM3uXFSzYVAKQ7hC
	v6NF1DukcIHEj9UpP3diHmQ0G/H2l0XJyqtg3LntE9vV/sqyurCGc7GdtR1Tw2su
	7puDuhs1+uwsc6YTrPKvUZBbVZgzOiP9dyBuQITgA3exrS42yrkTw==
X-ME-Sender: <xms:76INYe9r2Vynci051VWs45K-zHDkB5yD9MVlcQku370lxnYdmCFKZQ>
    <xme:76INYevK1ekryr4Vp2Dmkaj2nCrkLwM51wzq1a_CnbeNiTkt3MCJB_zfKqFCM6nRw
    ibRIUgWmF2NEmnr1WI>
X-ME-Received: <xmr:76INYUDgWnYxxW54bmu6dx0rBJXlk6FzbBSHzdP1R30AijCK8uv1t0xpPlUjLeEHyPSUFuL8Y--Yl9Y4fgoDEGauLRwcMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjedugdduhedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
    fufffkofgggfestdekredtredttdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgr
    mhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptd
    eludegheejteelheduudegkeehleetfeekiedtfefgleeifeelhefgveejhfffnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkh
    esshhtfigtgidrgiihii
X-ME-Proxy: <xmx:76INYWdnDopcK4RQxOQBqdfvfIpUNzVgVqG72W1EW8r-wOUMcrUoCw>
    <xmx:76INYTNVQJomToAL12gL6I9worv0Vi9SKYEYmsXwsh17bTawPAKIYw>
    <xmx:76INYQm12r9U_oI69jy3VKXUYyk8yhCIOd0uNYkFRr7Z6tNkwTllPg>
    <xmx:8KINYVXFiwTTc7N0Vpy3PL83sqOKByFzbIGAsvxbpRusTFGpLQHq2g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Aug 2021 17:00:31 -0400 (EDT)
From: "Patrick Williams" <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH] pixman: re-disable iwmmxt
Date: Fri,  6 Aug 2021 16:00:28 -0500
Message-Id: <20210806210028.3060489-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit dd9c3d042aa5c2ae0fd80b558ec7e9c793ff36f0 dropped the iwmmxt
disable as part of the meson conversion and said: "we can add this
back again if it fails."  It does.

| cc1: warning: switch '-mcpu=arm1176jz-s' conflicts with switch '-march=iwmmxt2'
| FAILED: pixman/libpixman-1.so.0.40.0
| lto1: fatal error: target specific builtin not available
| compilation terminated.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
Change-Id: Ia1278d18543493a3f9eace6c2dd2f84701b9c2b1
---
 meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
index 5a3bb22ec3..00dd68006f 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
@@ -31,5 +31,7 @@ EXTRA_OEMESON = "-Dgtk=disabled -Dlibpng=disabled"
 # ld: pixman/libpixman-mmx.a(pixman-mmx.c.o):
 # linking mips:loongson_2f module with previous mips:isa64 modules 
 EXTRA_OEMESON += "-Dloongson-mmi=disabled"
+# disable iwmmxt due to compile fails on most arm platforms.
+EXTRA_OEMESON += "-Diwmmxt=disabled"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.31.1

