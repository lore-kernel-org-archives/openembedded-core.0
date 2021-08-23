Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web11.24242.1629726801837868006
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 06:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm2 header.b=TyEoxe9P;
 spf=pass (domain: gherzan.com, ip: 66.111.4.27, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id B2CDD5C02A3;
	Mon, 23 Aug 2021 09:53:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 23 Aug 2021 09:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm2; bh=/leRh62XUwmrp
	3leOvWmHUqYHJBZ+rf2Tq+E4T1pwfg=; b=TyEoxe9Pbh0590ajcik956SvVOK76
	ITlemXgNWsGn3Tf2zBcZMoRWjLAib6yNXSzH9cFBBW2MvNjJ96DUv704ccezWV7y
	AaIL20re6jDBb4PGWRWp0qYJYqip2uHlsDgl58yqlbTVkZI5K44nSYvEhJ92+yVZ
	NVhYDZJbW12czQUVefDCFFeovTW5aBqXS/ku/pgpkPMeshiCWPW4GSZVVL6BJ8zl
	G/o+xfeW0GcjrM/jkdKUfeSytHtsjkVvzG8FOFjgG+FEcyo3iWQ2xyDpNlbOMwGZ
	yLEcxwRJ1R6wR1KJnU8sbvbDzSeSEgk01IjbBJXv5FCTzVNpk/VNiwRdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; bh=/leRh62XUwmrp3leOvWmHUqYHJBZ+rf2Tq+E4T1pwfg=; b=KGEM2NGn
	JMLyLCFeS4mZIx/uYqDxPzw4UQNfJ3B8mVp0YHyUAbrWxv84iJd46A2GQyEpfqfi
	B49ws6L9h9M8kSLPjKNd0IlKHSOC6Pb1uEGncINSgm6pdHTbzH0Z6Ano2Xc9jIO7
	A8Z6sNnW45fnlw2hlXDBlJ2lqmm5Ljg4AgMXpYQZM3F2dMqpazqNGRWbmzXyLLML
	4nGwo6XzRfM/MVmpdZ3dybOY+hpNT6jkPmkBoS2HqGBgA7hea1LyPYr2SoPSt9qE
	hh/smH3Wne33DQZLOx1xT8ROfCyxKckAqM1YxrYj6QivKTMVNw174tZ3GZY+1SYk
	r8pVMmlV+YFQFQ==
X-ME-Sender: <xms:RagjYfZoWX3E1prxuM3SC006oP6WnQf7i2-nSda6dmV20B99bMOSHQ>
    <xme:RagjYebQHBL7ZXgdyg9Bp9RXIotHUEQkTDxtvnGykL_KIGQkNzyjFubLyL62ODI__
    STCK05TSV6ZnvUf-0o>
X-ME-Received: <xmr:RagjYR_uW5ml6L5oxoIYLradm2DBi_XSj8GKZkDRx1csNZWwYC2xynZxp8sXPnvxYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddthedgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
    ihcuifhhvghriigrnhcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqnecuggftrf
    grthhtvghrnheptedtvdfffeekteevkeetieevgeegveeiiedujeefieetvdekledvkeeh
    jeelffefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:RagjYVqpi4-fByWI2U10d4cIFeTVjK7MMcvGbCVBZy2QzNhPMzA7OQ>
    <xmx:RagjYaq72f-Yt3kc4QWO9xa-4aqzA_Q5s3Dj9YxbULHq7Yd_lrgKDg>
    <xmx:RagjYbQ_7nvZz87v792xDw66f35Om9pTEIUP2tpi00ex6isZWRwaHw>
    <xmx:RagjYdVn89nbnjt8mIZlPcP7MNYzKCtPdK4QvfhV45eH8tTTG-bHmA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Aug 2021 09:53:06 -0400 (EDT)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	jbouchard <jeanbouch418@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 2/2] Use the label provided when formating a dos partition
Date: Mon, 23 Aug 2021 14:52:50 +0100
Message-Id: <20210823135250.767173-2-andrei@gherzan.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823135250.767173-1-andrei@gherzan.com>
References: <20210823135250.767173-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: jbouchard <jeanbouch418@gmail.com>

Previously the bootimg-pcbios wic plugin was not respecting
the --label option provided from the wks file. The plugin
was setting the label to 'boot'. With this fix, the --label
option is use. If no option are specified, then the default
is 'boot'.

(From OE-Core rev: 0fd7a73c1bd2486b7a022f0f69bbcb2e0d9cb141)

Signed-off-by: jbouchard <jeanbouch418@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index f2639e7004..32e47f1831 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -186,8 +186,10 @@ class BootimgPcbiosPlugin(SourcePlugin):
         # dosfs image, created by mkdosfs
         bootimg = "%s/boot%s.img" % (cr_workdir, part.lineno)
 
-        dosfs_cmd = "mkdosfs -n boot -i %s -S 512 -C %s %d" % \
-                    (part.fsuuid, bootimg, blocks)
+        label = part.label if part.label else "boot"
+
+        dosfs_cmd = "mkdosfs -n %s -i %s -S 512 -C %s %d" % \
+                    (label, part.fsuuid, bootimg, blocks)
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
-- 
2.31.1

