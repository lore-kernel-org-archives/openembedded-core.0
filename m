Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 15D82731DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 03:23:51 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id o124so39641540oia.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 19:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gmOKYW02yTlLCgNzxBAQL8IS3yrU0Ym3rOB7Ww2p/QQ=;
	b=Jj6qn/FWzqEGNGSM5Yu4Yj2DUHMjNHH1LBquP5/ui6NisvUdEIirWgqDaCLbhsts4k
	hk0Tch4ICi/20b0dyFsU2khSFP20Z+ZtLf/3o0OlPxYYOFy9YUlWQpxfi7rfg+Qh79Ce
	+lmDrwes0Ce9jODJbIPKF9KRro4rQ5eyWGxrwlsmpS44h4wkxoBE9nZz57Bv3rH4h2sp
	u0OUZ1J/Hl6ZUQKXsuyeX9ke3Iw/8qcMI0iUp/XCPJdHmsj+6n6CFDPJGHygsUTzIf07
	NfU3iWSmUEsZ/Pqb/pqKsy7rL8T0rdOjx5QAWVjlVklS8Bx/S3+vXtgtSUYQaiORNnbg
	Tikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gmOKYW02yTlLCgNzxBAQL8IS3yrU0Ym3rOB7Ww2p/QQ=;
	b=TCwGVuloMao+cj4VQ7prO4T3tfbbTd0MH9KJ0EzsEp6FzF+PGJyjjStcdC2cAsdm5Y
	7owjD9V/5iRxyS4ycN9t/M9c1Wfxg7I2gtKOVIo8Wu2j35JJ3CFuuTxosnhKbLPZ7cI0
	WuuGWEKFK5L7/hMPQe/8ZbgYI6NzSj8cAY4fp2iJzAmEl19jUxptlVk9fYQ6MApuY/Fk
	3qtsgt0JGMee8Up0tpG6gIEwwdNAFNhnEY1BSK23hNnWWM5Ia9v3Jrzuoc6nc6+gyYEy
	WttGJxqRQUC/7rHwfSoFINz+bsoDBsxwZ8JyUOhbyeKxCzTVmStVT/x/gmq5+IMvdifX
	wzkQ==
X-Gm-Message-State: AG10YORQCX9CPrK1hrLZy6XbAI1xqKzp6tKSst+Wznur/TIUd/5aAE5RSA2vOpIv1e+tYA==
X-Received: by 10.202.80.201 with SMTP id e192mr563870oib.14.1453433032808;
	Thu, 21 Jan 2016 19:23:52 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id i10sm2153206oer.5.2016.01.21.19.23.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jan 2016 19:23:51 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jan 2016 19:23:45 -0800
Message-Id: <1453433025-25280-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] pulseaudio.inc: drop obsolete dependency on liboil
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
X-List-Received-Date: Fri, 22 Jan 2016 03:23:56 -0000

Pulseaudio dropped its dependency on liboil in 2009.

  http://cgit.freedesktop.org/pulseaudio/pulseaudio/commit/?id=25724cdd40283a00e6edd9449d0f3cf16823b41b

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index ec73526..b278115 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
                     file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/pulsecore/resampler.h;beginline=4;endline=21;md5=09794012ae16912c0270f3280cc8ff84"
 
-DEPENDS = "libatomic-ops liboil libsndfile1 libtool"
+DEPENDS = "libatomic-ops libsndfile1 libtool"
 # optional
 DEPENDS += "udev alsa-lib glib-2.0 gconf"
 DEPENDS += "json-c gdbm speexdsp libxml-parser-perl-native libcap"
-- 
1.9.1


