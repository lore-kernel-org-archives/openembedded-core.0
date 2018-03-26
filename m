Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5B386786EE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:31:33 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id c11-v6so12047186plo.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=rk8KwGT2wiYbViuYp59Gd+SVBzvGPozUJJkKUpF3oF8=;
	b=r0SeCoNzcsQFr4PVm0GcX6aQVN72uG0OJjDpyWyrf1AALa5pgEBbpCg/Uak8mT4+1w
	4BBFRNyNvNf9mN5Kkwj3+wV4fz+q9rMhZMdexYACu+u8u6AbIQF1n1/dVAqJbrO5T6Ip
	WmgYg/ir/vwdrp5UzrOhrlJUV7XUQZEcPFw3unObfnbJkVgYlBOaevbydmbCSpCoVu6/
	1BqOYRkOggX1D5sHFbCVBNIstPsLnbCnUgZHer8iPiMIOrN+lpTYi0tu11LCYlb3qQFd
	aGLNNQPAyRZiHbl16RYak7hNoBCmMo9fQuOLx+TwGyULs5KsMUM0qdu+TQSd0Bkfn3lG
	BIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rk8KwGT2wiYbViuYp59Gd+SVBzvGPozUJJkKUpF3oF8=;
	b=nCyG8bA6lpufL4orYsFqFlm1J8FzSY+jauIjC5wB/pcD0gHj5xwkKIub3ghoMM9qEU
	u+kaFlgv7zRzKogLElr3m/GeszoOBRcY0Qk58dMNDiZ37twUBLvVXhWF5mfolQX27tGv
	MTVHrn7eXTqPYDENbLcQNgj1cIpj6u0lkWN2KPL+3ZeXDMHOQVp9qDgoRQNwRuzvLYpy
	oO+rl7ASvXkyWJeXMr+LvuaGIbJcZJz1s/Q3xolUb3OA8a77+B5fZ/d1jYqavABiMfds
	lbSXLV3UmP97CUno5L1LuxqiG9SeDpaI5SrqjVvuV11Xqkw7ykldAidKmLswhgmn21Co
	4G8g==
X-Gm-Message-State: AElRT7EcixdpKC7/MBhoszI2eq1iLubsHqi6Un2nDKegJkCvDmOh1IGA
	HzpQh2NNkceeJXgwe5Q+OQLYQw==
X-Google-Smtp-Source: AG47ELuagbquMCxshQT6FBmUYH8u1h3FczFmm9NYtqHQV5lA2/rZwevBCdWM6JR+Wa+wh/4qvgAmqQ==
X-Received: by 2002:a17:902:144:: with SMTP id
	62-v6mr41507326plb.202.1522074695064; 
	Mon, 26 Mar 2018 07:31:35 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	j11sm29932492pff.94.2018.03.26.07.31.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 07:31:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 07:30:22 -0700
Message-Id: <c741aebb2fd6e8ceab248eeebc0731ec758e0ba7.1521989435.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521989435.git.akuster@mvista.com>
References: <cover.1521989435.git.akuster@mvista.com>
Subject: [PATCH 19/21] xf86-video-vesa: update 2.4.0 update
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
X-List-Received-Date: Mon, 26 Mar 2018 14:31:33 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../{xf86-video-vesa_2.3.4.bb => xf86-video-vesa_2.4.0.bb}          | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vesa_2.3.4.bb => xf86-video-vesa_2.4.0.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.4.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.4.0.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.4.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.4.0.bb
index fa251b5..5c1356d 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.4.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.4.0.bb
@@ -9,13 +9,11 @@ can drive most VESA-compatible video cards, but only makes use of the \
 basic standard VESA core that is common to these cards. The driver \
 supports depths 8, 15 16 and 24."
 
-PR = "${INC_PR}.0"
-
 DEPENDS += "virtual/libx11 randrproto libpciaccess"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
 RRECOMMENDS_${PN} += "xserver-xorg-module-libint10"
 
-SRC_URI[md5sum] = "a893c37c589f7a31cea929a5d896a0e2"
-SRC_URI[sha256sum] = "7bddf4d879dd6f67088ecb203a31e12334aab980174bd0909930a21f32e251c1"
+SRC_URI[md5sum] = "8134201beaf6f77150c7809c3cc802e6"
+SRC_URI[sha256sum] = "bf443c94d7bf6cd4e248f8a3147f4647be04dc4c80250d9405006263bbdee38c"
-- 
2.7.4


