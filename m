Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4CF466FFFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 11:02:22 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id g13so113030qta.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 04:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=XYh17ubWdf0aDc2QMnw0xoea1HkqXY+H6Z+aGlMEXvQ=;
	b=nFAisPbdyhgMSdK//UAgkq5V4vigiVd1Cy8Me6f+geaPD9B9XHMcIInMUUCm2cGtIi
	VKSjANbjHpV+MgGHw6cplbUm5LXP97wr0q+VB/GtZxr7vOKudQ7P3dfHpGiQNR8540Vf
	Ejlzqan5v+XQRK1R2amvAwqPR3+n6cdxaqbOIX7kCf5CGu55PUf7vUDsOVrVdiN1M4Wj
	Nr7tWVMDeaizZ8q/M8leCnn5DdUzZTcJBvk6T09phRV7vgYMwOwkSbZAUZpdG6I/mjpC
	7g9IZ1050kaK2StmRbeEXkaJsuA+3ARp+mfqIkkVH78GGAUuSKwYSX2D43W9QvVYCt6c
	aLCw==
X-Gm-Message-State: AHPjjUgVlLUNIxhDHI1k3FN0PJbXVN+QoMJIhMk1najy40voQa2bOeWF
	jXMQ1+7/oP1dmjBW
X-Received: by 10.200.49.170 with SMTP id h39mr114325qte.301.1503918143974;
	Mon, 28 Aug 2017 04:02:23 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id m126sm81251qkd.20.2017.08.28.04.02.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 28 Aug 2017 04:02:23 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 28 Aug 2017 08:02:15 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Aug 2017 08:02:14 -0300
Message-Id: <20170828110214.2647-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] libdrm: Upgrade to 2.4.83
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
X-List-Received-Date: Mon, 28 Aug 2017 11:02:23 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/drm/{libdrm_2.4.81.bb => libdrm_2.4.83.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.81.bb => libdrm_2.4.83.bb} (93%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.81.bb b/meta/recipes-graphics/drm/libdrm_2.4.83.bb
similarity index 93%
rename from meta/recipes-graphics/drm/libdrm_2.4.81.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.83.bb
index 9181340a6c..a5cb75c266 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.81.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.83.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch \
           "
 
-SRC_URI[md5sum] = "d04f3567f0a812188d06f860fded5ab7"
-SRC_URI[sha256sum] = "8cc05c195ac8708199979a94c4e4d1a928c14ec338ecbcb38ead09f54dae11ae"
+SRC_URI[md5sum] = "23800953ed7564988872e1e8c61fde31"
+SRC_URI[sha256sum] = "03a52669da60ead62548a35bc430aafb6c2d8dd21ec9dba3a90f96eff5fe36d6"
 
 inherit autotools pkgconfig manpages
 
-- 
2.14.1


