Received: from forward5-smtp.messagingengine.com (forward5-smtp.messagingengine.com [66.111.4.239])
 by mx.groups.io with SMTP id smtpd.web10.1950.1608233278315024232
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 11:27:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=CS8nBjpT;
 spf=neutral (domain: iki.fi, ip: 66.111.4.239, mailfrom: tanuk@iki.fi)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailforward.nyi.internal (Postfix) with ESMTP id 9A16819407BB
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 14:27:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 17 Dec 2020 14:27:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=B/4nDD86m3Yo+VjqAPQ45sVgoSl5XTRR4vjyXqNNeKQ=; b=CS8nBjpT
	40lPPaTpz6e+Q1fQr7h/PA2E62HUciGvWzMShsMWBGLnYNmtBuAJIo+fHYgo4VeV
	FYNMD2WUdpLxu9N0JQBq8K5JWi9iEQT4SiLk4AeagMCMdqHYMAp3dCRMg39ZqVPx
	Spf9zkE2j/zZ6PWUDeEIlyXkzGpVGdcnrRStYq7woJw0kfH6mi6GqLK9cyBx1zzD
	H6Ev30f46R5mNplLPVymjH/QdoPWCxHx2Q3yUUwYyiLr0ED2AmBAKgICLwUlas1t
	a9VAvpExQ8MyvQ7sEutwv30TP6UDKMWmu600uzDBjSqKe5IBe4vH1XxP5m3NbiFx
	Y+uzPsmJf5fXLQ==
X-ME-Sender: <xms:PbHbXxjQJh-0SM5hknsb2AgNX0njZkX9lHfOqYn51hhLZGa3PCvSeA>
    <xme:PbHbX6QfwWn6NqNXcmpnrVjeGImZ64OLjeSY_3bKojKp_zPzRZbyITkuBZOUygHTb
    XweO6MOMDr5-yIl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelgedguddvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefvrghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhk
    ihdrfhhiqeenucggtffrrghtthgvrhhnpefgueeuudekfeeltdetieetueejffdvveetge
    ffgeehieeuueefkedvgefffeeifeenucfkphepudekkedruddviedrkeelrdehvdenucfu
    phgrmhfkphfpvghtfihorhhkpedukeekrdduvdeirdekledrhedvnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepthgrnhhukhesihhkihdrfhhi
X-ME-Proxy: <xmx:PbHbX8G9gq6OqvFSKMHJhPXu36aWJi_vMNhi7flXwdcgEpLzn-vZqw>
    <xmx:PbHbX6k6ER-y43a62yisHQbFT1vXs_Pw9Go6bBvy2hNDRLm-F_2ObQ>
    <xmx:PbHbX31vaS8mFNW9Sie7hSshWv_36cIgzQfFWWlK3s47HP5UWfA-vA>
    <xmx:PbHbX-vYXPywzCcUBK3CtTMQmshcsWuGSOZ3SZ-lN3LBkhAf2rl2ig>
Received: from localhost.localdomain (unknown [188.126.89.52])
	by mail.messagingengine.com (Postfix) with ESMTPA id 29362108005F
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 14:27:57 -0500 (EST)
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] pulseaudio: disable EsounD support
Date: Thu, 17 Dec 2020 21:27:36 +0200
Message-Id: <20201217192738.14311-3-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201217192738.14311-1-tanuk@iki.fi>
References: <20201217192738.14311-1-tanuk@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This disables PulseAudio's EsounD emulation and the EsounD sink module.
EsounD has been obsolete for a long time, and doesn't seem to be
packaged for OpenEmbedded, so probably there are no applications around
that would need PulseAudio's EsounD support.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 4aea8bc6aa..ad059404f8 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -79,6 +79,7 @@ EXTRA_OECONF = "\
 		ac_cv_header_valgrind_memcheck_h=no \
 		--disable-tests \
 		--disable-running-from-build-tree \
+		--disable-esound \
 "
 
 # soxr (the SoX Resampler library) doesn't seem to be currently packaged in
-- 
2.20.1

