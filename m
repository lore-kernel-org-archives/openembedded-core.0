Return-Path: <marc.ferland@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id AA80871C70
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 13:20:27 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id x86so32989981ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 06:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TtmjcVm1Ey0mO17q3ojpCVyqghW82WRZbPHT81WdAF0=;
	b=qP5Vtw0RxbmZ7fCxezvwn00wWu3TvlJ5/PvSmjxcCAKxxOOvINWQeXnBJi5EVgiibw
	SCEqonjvvbqolqVrvPLiT+bXIzOIc9lN1E9iqzgAjscoV/u9DxBEdO85vQtbLgrfqYQa
	wzaBCqV0eyKlp75NinhUaH0HRNZdhBNUSpQWRlygbnAFSlKQ8VXF3Y5XlwJP5YVvpoW2
	KfS/nN55uUMzpoxs7khBg7mKVjptRdfWZPkoIIG1gU1rFtSQfDR0Y3hLI7WAORDVkEvB
	In0plnOQlqLjS6gmMc635VLpob+aiCd0AYq3TMroP6j8nzXs9C2Ka0HWwzl9uJkx/xvj
	TTBg==
X-Gm-Message-State: AN3rC/4WSiQnNCoPwzkl+JlOGC5xNNb+nH/vkUt9vm13sWALMzhXaHjE
	oilQl28uLCMfgQ==
X-Received: by 10.36.211.209 with SMTP id n200mr14607131itg.73.1492521629192; 
	Tue, 18 Apr 2017 06:20:29 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	m124sm4879865itd.3.2017.04.18.06.20.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Apr 2017 06:20:28 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Apr 2017 09:20:04 -0400
Message-Id: <1492521609-26624-4-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492521609-26624-1-git-send-email-ferlandm@amotus.ca>
References: <1492521609-26624-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCHv3 3/8] bluez5: add PACKAGECONFIG option for midi
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
X-List-Received-Date: Tue, 18 Apr 2017 13:20:27 -0000

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 4244fc8..687656e 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -16,6 +16,7 @@ PACKAGECONFIG ??= "obex-profiles readline"
 PACKAGECONFIG[obex-profiles] = "--enable-obex,--disable-obex,libical"
 PACKAGECONFIG[readline] = "--enable-client,--disable-client,readline,"
 PACKAGECONFIG[testing] = "--enable-testing,--disable-testing"
+PACKAGECONFIG[midi] = "--enable-midi,--disable-midi,alsa-lib"
 
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
-- 
2.7.4


