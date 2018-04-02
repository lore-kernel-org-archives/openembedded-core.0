Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9B84B74809
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Apr 2018 20:25:38 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id u11so15473021wri.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Apr 2018 13:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=PiEWrixmHa6AL2ZpKayBbpjaFJdl1IBGoUGeJfuqX70=;
	b=hY+50r/e43ozBUiQCR+aATvswfeiNMhN63qZrXgI6NHrbS+lDRUXw+FP4MPGeHZWnh
	LTPDQr/uy3A0tyxNEbGGe6pHuBT/AvpH2nT+7r/urERJ27JPM7JLXiWh0448IWaBR4Eb
	jYu66sUsvM7InwzIe2U0ZRTQlaMK3vDeZqrLRAtnB89DUKMp+6hCr1p+YS8YVJyoH5co
	3pKHPWjL7eIRdHndB+e8uFuEktIazA9k8uGLGQkiS/7qR1v5w936qey/Kz0NpJIYHlgX
	geVUOTHXauGXQiismArsLtDB7nRjvwwpKhsGSpa7qAmygELRtjpKnY4VErCkHNPHrsGr
	qq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PiEWrixmHa6AL2ZpKayBbpjaFJdl1IBGoUGeJfuqX70=;
	b=HnMJucoNnpKMjIerm9ZjOE0OKZQRqqOEmUcw4Tr/5bUZhQoUvMdeE4sDNFeYWTmWJK
	QKyrMECeK+t6EGnpt3enDl9+kCZyFp1ih9S0F83faXDdwJe3BcYDrNlWI1L+kqfgZOlh
	acmMV7p4XJiULF5AUHPvEGdE45UA6A6NNajB0UuDLhZFGspLx4ASpR6ado/0Y2r8ghm0
	GZdh/k/SevQqyjLJ55F+T0zu3r2o3ABql5AbYUxZlxUQsn4in7DqRx4Kmd57GRiOlPWU
	UIMzE93y6QAjLYgjg3qNQI6i2uGdeRMIpsW1TtqnBDHmtFQc/8yyD36uawoXapkM1U/K
	XLXA==
X-Gm-Message-State: AElRT7EKtp5uYtVy4qLHd18Lr+GE3qbvhZ/HQzWYzQKAA/iXd8Whg9k3
	Aaz8eVUdU12l9JmGD8QGFJwOQg==
X-Google-Smtp-Source: AIpwx4+uLdo4OvBSVFQ85KjapsWVVZNJxDrBoDrWTcpXOkmskkUA69SUS4LAhahmY2+OfLC3xL6s2w==
X-Received: by 10.223.226.13 with SMTP id j13mr8100136wri.118.1522700738438;
	Mon, 02 Apr 2018 13:25:38 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC1FD051E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:fd05:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	b185sm368791wmb.48.2018.04.02.13.25.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 02 Apr 2018 13:25:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Apr 2018 22:25:26 +0200
Message-Id: <20180402202526.7988-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180402202526.7988-1-schnitzeltony@gmail.com>
References: <20180402202526.7988-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] mesa: Prefer dri3 for x11/opengl
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
X-List-Received-Date: Mon, 02 Apr 2018 20:25:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adresses [1]

https://bugzilla.yoctoproject.org/show_bug.cgi?id=12642

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9e4da81f7f..639eb35f6b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -40,7 +40,7 @@ EXTRA_OECONF = "--enable-shared-glapi \
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
 		   "
 
-- 
2.14.3


