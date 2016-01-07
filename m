Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 46BBD7321C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 22:29:41 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id yy13so177706769pab.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 14:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SWiQya35x/osb2PA3p4GKIeDzxSN3qk6NUucXIS4A20=;
	b=WU/eXJgcPxgrnjO9/83zXNck1PIEmnjMWwwO72nz1kX/8lkmY9nXieRtkigyR09Gcg
	L152oVOEMeH4CabMCegltz6NSScKvWjd+dyS/kuKMwqj+idpNu4VJXPKbIehaPqeg5/t
	0wVYGwKH8yOgrpDBV6R2vve2ZF1Tc3njlPxus0TpIMiAA6tk564HBDYpKl8jYt1dtUDF
	F1VjD2CKqYW6x2T+LCGsvUQPV1IycckFlN+0C8/luSJCbZMQBJF8BXzHMLpDWUh0Xnpc
	PJlbOKNJaJLPCMqmSnTbcak21CjkmNtBglg+jX+OoAG88hdgMrb5EAyuIjT7Q3cxbuv0
	3J3A==
X-Received: by 10.67.23.226 with SMTP id id2mr153986056pad.149.1452205782787; 
	Thu, 07 Jan 2016 14:29:42 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	wa17sm93819672pac.38.2016.01.07.14.29.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 14:29:41 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 14:29:11 -0800
Message-Id: <1452205752-6353-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452205752-6353-1-git-send-email-armccurdy@gmail.com>
References: <1452205752-6353-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 3/4] libav.inc: duplicate armv7a over-rides for armv7ve
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
X-List-Received-Date: Thu, 07 Jan 2016 22:29:42 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/libav/libav.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index 05b7e87..371e066 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -29,9 +29,11 @@ inherit autotools pkgconfig
 B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
 
 FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
+FULL_OPTIMIZATION_armv7ve = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
 BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 
 EXTRA_FFCONF_armv7a = "--cpu=cortex-a8"
+EXTRA_FFCONF_armv7ve = "--cpu=cortex-a8"
 EXTRA_FFCONF ?= ""
 
 PACKAGECONFIG ??= "avdevice avfilter avplay bzip2 gpl theora x264 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-- 
1.9.1


