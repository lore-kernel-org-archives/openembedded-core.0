Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id E7BDE7C325
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 07:24:48 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id x85-v6so16581389ljb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 23:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=G5DDMfODGiOr1s2aGQa/Sn0c1SLC9S5vuUXiutyyhuw=;
	b=NA/ja+qrqSoLKRs0inrJtjEeftQDDDPc17Fbe4j44kSSeMnZMoY3xwvKARGxOo2rw4
	4ft5Qp982jChROdbLYCEsxViTegqnPigflfD2Eqrbp+I4qaexXfPGPB0lMjTs1ESbxkS
	g8efkh4UVstqrbjk9FOcHK/lwHn4pSwJLpXXw31grtHsQ1SnWWy35cHos42PET6ucHON
	v1bdCltbG24CLuOOcsIbQHY+BuRNpWr0DE8OMTPUqhrA6vkaMWvl4eZRce1nHPY3zusH
	r/ox8kzcOzES575gYtb857Xx1E+oGeVhOwZ5K6Sy6qSvu5176pPtrjPZqVZmUTl1N+C2
	siZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=G5DDMfODGiOr1s2aGQa/Sn0c1SLC9S5vuUXiutyyhuw=;
	b=XAe3LL2Cgy9A9CcpESqH/goagINmKClufQvxxccTKOZAIMJ4GPEJ2kCjRMXrpxRrxi
	98giDIdA9oHMT65uH44pOpKJBatUKSPWP5a/dm3eCjrv++C5lHNObJbGIv4mrfJWJIR2
	ODKSEkZFGTw6LtngZimo5JqYZDQ2h5PBDNaSyLayxkA33JKlvQa44lqxIC3/ug5/eLe4
	MlgSqOVSGZuKkmMlYudtPQG0x7yN0mZgEe71mQi5dOi1BEy+VO06XMWcGciV/tNlo9SI
	v0+zvBtIjzFPeclRBFo+tJF1DPNjpPf9IL1202P/qq7OtgYL7R7FiZNIZk3ED4un9ck1
	4sKQ==
X-Gm-Message-State: AJcUukdS/Ghvau2QJCCGrss8Ri89/n+QbzCAvet6HiJlD+y+O9vVhceY
	Z+VhDIhrjZXqlZ5aws/c5RVRACd6R8I=
X-Google-Smtp-Source: ALg8bN48NP5+m0Du68IUG6sz8We7wFmW6jc6XnJU0utdNn0uu3GjztgbRgMPfiynrKshFzFiVqM7XQ==
X-Received: by 2002:a2e:5054:: with SMTP id
	v20-v6mr20321345ljd.45.1548746689273; 
	Mon, 28 Jan 2019 23:24:49 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	u26-v6sm3356434lji.22.2019.01.28.23.24.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 23:24:48 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2019 08:24:42 +0100
Message-Id: <20190129072442.32343-4-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190129072442.32343-1-jonas@norrbonn.se>
References: <20190129072442.32343-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH 4/4] keymaps: tighten package write dependency
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
X-List-Received-Date: Tue, 29 Jan 2019 07:24:49 -0000
Content-Transfer-Encoding: 8bit

The dependency on systemd-systemctl-native is only needed if _both_
systemd and sysvinit are in play.

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
---
 meta/recipes-bsp/keymaps/keymaps_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/keymaps/keymaps_1.0.bb b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
index 34b208c5b3..24b13f920f 100644
--- a/meta/recipes-bsp/keymaps/keymaps_1.0.bb
+++ b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
@@ -37,7 +37,7 @@ do_install () {
     fi
 }
 
-PACKAGE_WRITE_DEPS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"
+PACKAGE_WRITE_DEPS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','systemd-systemctl-native','',d)}"
 pkg_postinst_${PN} () {
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','true','false',d)}; then
 		if [ -n "$D" ]; then
-- 
2.19.1


