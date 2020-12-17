Received: from forward5-smtp.messagingengine.com (forward5-smtp.messagingengine.com [66.111.4.239])
 by mx.groups.io with SMTP id smtpd.web11.1993.1608233276287405119
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 11:27:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=SflwJhoU;
 spf=neutral (domain: iki.fi, ip: 66.111.4.239, mailfrom: tanuk@iki.fi)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailforward.nyi.internal (Postfix) with ESMTP id 93B57194348E
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 14:27:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 17 Dec 2020 14:27:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=T0nxR43oTmCcbL/UUJ2Ws+tg+qmedZeA/fq1VqPAxm0=; b=SflwJhoU
	rcefHwSzZrltQIBr8E/TXqeJm8JeQ6yGCANqxv8ibBbK96a7if+bOgDZbCeymy9o
	gXhXR2c3Hb7tEiM91vVwV0e5rDZF4qwLZkoksyYRxKfbxtIoGRsH9v93+e+0AVu9
	yGgA+TQrQ9O+OiOjzhWc9+T9chx3nfy4PJrRV46obJgsZsVs3EyGc2db+6605aTB
	tsCclvg+ZhxiNYzjF5glMKl+mJpOCC527ZpnqU9+I2YFSoQc+DV3sJ+ItXAkFsDp
	SFB7z48Hqk7WUhP2IUn8bLyGSOD64uO9PydywbOxbppZyc6QR0xKrCOc3okiI+bX
	VmVQ/zLqLyLqPw==
X-ME-Sender: <xms:O7HbXyno3jlis7-ud_tMFWNr3PHcyI9Q6NLf-kjPHnqQpSScKekT9A>
    <xme:O7HbX53LP8SkZCpxafk1gHjgs_Ix2LPXSi5jgSh3gPs6hiM7FZEIZLlPSny-3cjk5
    FAbOUbpi8cP7Hak>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelgedguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefvrghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhk
    ihdrfhhiqeenucggtffrrghtthgvrhhnpefgueeuudekfeeltdetieetueejffdvveetge
    ffgeehieeuueefkedvgefffeeifeenucfkphepudekkedruddviedrkeelrdehvdenucfu
    phgrmhfkphfpvghtfihorhhkpedukeekrdduvdeirdekledrhedvnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepthgrnhhukhesihhkihdrfhhi
X-ME-Proxy: <xmx:O7HbXwoYNbKj3ecos2LHemXn5fcRHOlCBF-ZBZCUcMM8dwXetuHucg>
    <xmx:O7HbX2mkT641tSh5v-Ut2TjmEJ9Ny4a3tcat9ysiZ7UsgEUI7XNXjw>
    <xmx:O7HbXw0br6C8jm3iNDk7NpjBYU3XGJrItN04ueKFm578tUm1Lw90MA>
    <xmx:O7HbXxDPKnljROWDitfJ83DfClm5IvBGtOYS-OUxGdUdqEAMPFtdSw>
Received: from localhost.localdomain (unknown [188.126.89.52])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1CB5A1080064
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 14:27:55 -0500 (EST)
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] pulseaudio: Remove OE_LT_RPATH_ALLOW
Date: Thu, 17 Dec 2020 21:27:35 +0200
Message-Id: <20201217192738.14311-2-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201217192738.14311-1-tanuk@iki.fi>
References: <20201217192738.14311-1-tanuk@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I don't know what these variables were supposed to do, but there doesn't
seem to be anything that would use these variables, so removing them
should be safe. The PulseAudio recipe is the only place where these
appear in the repository.

These lines were included already in the original PulseAudio recipe that
was added in commit d9a4c588ef24e7e4019fbe5a2314addbcd3a6bb8 in 2007,
and already at that time there didn't seem to be anything using these
variables.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 3a26cb59dd..4aea8bc6aa 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -129,11 +129,6 @@ EXTRA_OECONF_append_armeb = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", "
 
 export TARGET_PFPU = "${TARGET_FPU}"
 
-# TODO: Use more fine granular version
-#OE_LT_RPATH_ALLOW=":${libdir}/pulse-0.9:"
-OE_LT_RPATH_ALLOW = "any"
-OE_LT_RPATH_ALLOW[export]="1"
-
 set_cfg_value () {
 	sed -i -e "s/\(; *\)\?$2 =.*/$2 = $3/" "$1"
 	if ! grep -q "^$2 = $3\$" "$1"; then
-- 
2.20.1

