Return-Path: <sujith.h@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id DC77D6011F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 06:13:21 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id p2so1087750pap.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Sep 2016 23:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=T+n/uOL/OeA6mjg14sQ4P5XufoTTh59fgVSGVL5f7e4=;
	b=G6lMMZy9yUT/UJG0d2S3iqYH2ZIN1aXNepFFyVff4j1K7+/a2fyf6C25D1mU0qjvOo
	dOLuGY8eZl/wZcsItEoWEa4C/Hddy90ugp20fEavgNiVrUQU4GCjRw/vVLLqhEk/blYn
	K/fxiUqijOHy9YxI/6LyFcfcOKmKDoyDSRnjN3vgXcUvrARsa2Ph67iCh77jk298iMYz
	aVuTwpm/KMmWZm7mkv7Lw0hwwS8hXvV6RANkKIPOPBtljRDKyYmh4yUlAQ/XzOm9oJzV
	UNNQ0+SfBIbP3YegmbS1vvZrhqTlgq7vOz97T3TV03GXkTEGs3/PvNqPhXLJxRcpGfze
	MXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=T+n/uOL/OeA6mjg14sQ4P5XufoTTh59fgVSGVL5f7e4=;
	b=MpKNSOT3x4th1CS95sLaApkEIIJOI4tBZLR/4WR6O7KdjeAmoc8/7n7A2mKNkXWm3B
	EbAck5gCdZgIHVxpGaqbHp25w6kDcLc1x7JxxGaprwwedWrQhXOTpAX/awgweUy1QjBV
	6+ZqQMdNW0I4VM6Q6JswcwNaYBdD/gK4wJCjYf9iibageok/iQTzsVXbNUIlUeoVnC2N
	K/ePxnGN/zdQ60UyOQrH65amFGQva9zDcmTi0lNbah0IpfTt8IsFdAzCzi8XHhIeq5yV
	g8xhSIcmMMA3WrWdVPejePyC6ed0CLvnELxw3gtwt4z70AYqiWhjbcgpkh23K+BgBzyj
	CyAQ==
X-Gm-Message-State: AE9vXwMm4WTDd0OxrMh42Eg53rqgq9l2hDPSuANlwGs5mSdv5B4c8u5SwGsLsnnIlvrJjQ==
X-Received: by 10.66.25.111 with SMTP id b15mr3946087pag.88.1473660801769;
	Sun, 11 Sep 2016 23:13:21 -0700 (PDT)
Received: from kdekidd0.inp-wifi.mentorg.com ([139.181.35.34])
	by smtp.gmail.com with ESMTPSA id
	tj5sm21316874pab.37.2016.09.11.23.13.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Sep 2016 23:13:21 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2016 11:43:13 +0530
Message-Id: <1473660793-3296-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] x264: add textrel to INSANE_SKIP for cyclone5 machine
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
X-List-Received-Date: Mon, 12 Sep 2016 06:13:22 -0000

From: Fahad Usman <fahad_usman@mentor.com>

This change help fix the warning message:

x264/r2491+gitAUTOINC+c8a773ebfc-r0/packages-split/x264/usr/lib/libx264.so.144' has relocations in .text [textrel]

Adding textrel to INSANE_SKIP resolves this issue.

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index fa44f9c..379961a 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -48,6 +48,7 @@ do_install() {
     oe_runmake install DESTDIR=${D}
 }
 
-# PIC can't be enabled for 32-bit x86
+# PIC can't be enabled for 32-bit x86 and cyclone5
 INSANE_SKIP_${PN}_append_x86 = " textrel"
+INSANE_SKIP_${PN}_append_cyclone5 = " textrel"
 
-- 
1.9.1


