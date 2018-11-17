Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id F25ED6C17B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 22:57:55 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 79so76344wmo.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 14:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=FPyCzhXE+d6Qc/tuCzeJbGUKzI2aKMMfSS35pI841GY=;
	b=XAgDo+jTq1jE7KLti9bv0axyp0PzirxLqrIG2IBr2C2knMdXCpXr2a1DsJGr70V21U
	R+ZAFlLObX/zfcu5jX/ndkB0NFME5OrZGL/lPr0SC2VR8YzPlIowr3gAvemsAIxukXqj
	1N3dbr/+wooXsKX/LStbHtBVvZWzQ2cSrhknY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=FPyCzhXE+d6Qc/tuCzeJbGUKzI2aKMMfSS35pI841GY=;
	b=KmRYuMCnfF0heopMm0Puq6n0S1DuApppMZ/Vqk2rR2ruK+xM8KPXH+ZQQPt6a6zQcw
	fG+3EOut+aTrfQhA47ZEdB9Z5EfLNrRS0jhoHpQRXoXxjzJwIedsS0nDJAv3NSEDNZr2
	5o4GEDh/K7EncrQ/Y/lFVOgrT5EfdBw49upH9FKbiIYmzUYWByEZNAhmq1Pwl/Nx9mXE
	qjjWXu7VHSFhVfy2Cdr/BJpUoqHsmnhwuaaEH9Nux3FVZgg9EATAQGkQIMgDzg9bIxpG
	6QMafUXBXmQjh1McyXRpl57QQ6We2QvIdMiA3DY9jNxDRowRxiDsI0XrL9jSERzBOonL
	P4LA==
X-Gm-Message-State: AGRZ1gIbwmWBdo0iFNurx/HQk4kd1sqjKglnviwn6ZnOchvwkoqhR3Nn
	YqrEL4vtsppytJob6IFzL4LdpxSkx3A=
X-Google-Smtp-Source: AJdET5elQ7OyymyjJL5de5G6HtKibncee3YIaYiWw4rQzDPtcwc05pVlpWrujGZywvcDipWePuHHlg==
X-Received: by 2002:a1c:9085:: with SMTP id s127mr2515630wmd.114.1542495475986;
	Sat, 17 Nov 2018 14:57:55 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l15sm12658470wrw.4.2018.11.17.14.57.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Nov 2018 14:57:55 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Nov 2018 22:57:45 +0000
Message-Id: <20181117225753.15733-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/9] subversion: upgrade 1.10.0 -> 1.11.0
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
X-List-Received-Date: Sat, 17 Nov 2018 22:57:56 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../subversion/{subversion_1.10.0.bb => subversion_1.11.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion_1.10.0.bb => subversion_1.11.0.bb} (96%)

diff --git a/meta/recipes-devtools/subversion/subversion_1.10.0.bb b/meta/recipes-devtools/subversion/subversion_1.11.0.bb
similarity index 96%
rename from meta/recipes-devtools/subversion/subversion_1.10.0.bb
rename to meta/recipes-devtools/subversion/subversion_1.11.0.bb
index 42c2562bfc6..9e05d34639a 100644
--- a/meta/recipes-devtools/subversion/subversion_1.10.0.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.11.0.bb
@@ -13,8 +13,8 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://serfmacro.patch \
            "
 
-SRC_URI[md5sum] = "0126847f9e8cb8ed0b90a6a18b203309"
-SRC_URI[sha256sum] = "2cf23f3abb837dea0585a6b0ebd70e80e01f95bddef7c1aa097c18e3eaa6b584"
+SRC_URI[md5sum] = "b0401a17fe9f4a769e36fcfcfad93461"
+SRC_URI[sha256sum] = "87c44344b074ac2e9ed7ca9675fb1e5b197051c3deecfe5934e5f6aefbf83e56"
 
 inherit autotools pkgconfig gettext
 
-- 
2.17.1


