Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id C973D768C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 19:47:52 +0000 (UTC)
Received: by qgeg42 with SMTP id g42so88679923qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 12:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=rzoLiMmeGUB4+65Tkvx4GRKIU/ekJx2U+vNto4MSlpo=;
	b=Q9tkjFcvJXllcwGpcfO3RWxfxTFgb/hH1M9eelCIpcZSx1ufGgKutsJs2Rmdk4BJEw
	spnbymKLKxk4G1K/UsGzH904mNG7THUMNppvHWUeEWXEYWmXhY1QQ6RJNlA+55yfUWo1
	g/9ZxkYEDvsw9y8pu2bkCGsXVTNShU4VmI0JIhwx7O/LPdPK+pIdsNke1I8INY9l0Uz7
	BkXMazqfBAoKs+bicJx+nI0AGv3cpG4wGavsv2SjtecvptkHB2abHswQlbQbtxYdLUnq
	BezNghZDLtEFUX32l3SjbCOdC8YSP+BL3FQrkcUbtfMFdBMrmawHzOZ6eP99QZMrZeKR
	dxaQ==
X-Received: by 10.140.235.143 with SMTP id g137mr4847484qhc.102.1439236073006; 
	Mon, 10 Aug 2015 12:47:53 -0700 (PDT)
Received: from localhost ([179.105.243.19])
	by smtp.gmail.com with ESMTPSA id f40sm1281102qkh.0.2015.08.10.12.47.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Aug 2015 12:47:51 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 10 Aug 2015 16:47:46 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Aug 2015 16:47:45 -0300
Message-Id: <1439236066-20015-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.5.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 1/2] mesa: Provide virtual/libopenvg
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
X-List-Received-Date: Mon, 10 Aug 2015 19:47:54 -0000

There are other GPU drivers which provide alternative implementations
for libopenvg thus a virtual/libopenvg should be available for proper
dependencies to be specified.

The Freescale i.MX6 is a real world case where the Vivante GPU driver
offers an alternative implementation for libopenvg library.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 09e80e8..d0363e4 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -16,7 +16,7 @@ PE = "2"
 
 DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native udev"
 
-PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl virtual/mesa"
+PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/libopenvg virtual/egl virtual/mesa"
 
 inherit autotools pkgconfig pythonnative gettext distro_features_check
 
-- 
2.5.0


