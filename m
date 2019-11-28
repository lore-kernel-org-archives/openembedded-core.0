Return-Path: <jeff.dagenais@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4DDCF7FA32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 02:16:01 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id m16so21399175qki.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 18:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lS2UWJMJXe9ptOeMWzhvrJ4bEUGlbEFpKI4Im1qiWIw=;
	b=oeirPJ2WcnvR2YV4EcGg39hF6LzQNcZpAWkOn8uHeI4OC2oHZ6WR8yynCVARPNsaur
	qbOjZYl++65R/YIMTcD9Iz44fMR8RB2LbbNfaxdZdJwBGAYwQ0wQp95ntBXi0F3Uym11
	zWOTUT64aBhDzav6rKp2dLyGf3s034BWL7fb8v916FOQQMJRfC8gKaPOjq1nS3jDNW53
	6yMXPKkvLH/7i3zpb/cyrgw/ylHRgcHoM30Gun8WyzeCRAtP0Cf/yKKAxQSUqFO01Der
	bAcEtn8Rgu+X/6Wem9i5Ul3TldAvlc9xw04bhv9wgf/hY5JluksMltsBPs8UFxHF/6Ji
	v+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lS2UWJMJXe9ptOeMWzhvrJ4bEUGlbEFpKI4Im1qiWIw=;
	b=W8ZKea3VJiyiTxU04joZxDGbuMh9njzvAWMSDRSywd3F6UdFHU/VEresdtQhexivUt
	DbTVf7H8L8NaID9XMIm+2GVcoitsceed46kXqmGAoT+Xm0nGmKJ7ub5/Qt5Q+OgKJpt0
	mLjiCd12gY1vqJcN94jQIes+nTGuAwGI/EwvHQKkRZ/PesPhJaoEtOmIf+Mkth1Q30Hh
	YAeNXcDljKgCUcRsUzIVjJGddVnWzbDXlT5j1VS+Whl3V83xBnWn3jknK9585U2n6Y1X
	A8jX4lxE9CaG+pjLYYeeEnBIIjO9jlNKOKf+/PQ1x48knSw0qUE2CRq9leYoMNdNTG+O
	gTaw==
X-Gm-Message-State: APjAAAUnSM3Vt0FTMwRrjJQy/CUsuHN8Iul9EwCEyGrgWs9zx8hZ2Jbk
	pk2MroBap8bssGLwlddFylyocR1OVA49Dw==
X-Google-Smtp-Source: APXvYqy/sGuv/e8dXZQN1C8gDG1ngevx+v7FrHjqSSIEVrlaV3wv4Ho1b/Z+Z6yEP22aeGTAv+sC7A==
X-Received: by 2002:a05:620a:b0f:: with SMTP id
	t15mr5124806qkg.135.1574907362103; 
	Wed, 27 Nov 2019 18:16:02 -0800 (PST)
Received: from jfddesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236])
	by smtp.gmail.com with ESMTPSA id j7sm7809196qkd.46.2019.11.27.18.16.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Nov 2019 18:16:01 -0800 (PST)
From: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
X-Google-Original-From: Jean-Francois Dagenais <dagenaisj@sonatest.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 21:15:43 -0500
Message-Id: <20191128021543.32614-1-dagenaisj@sonatest.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] mc: rrecommend the full terminfo database instead of rdepending on it
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
X-List-Received-Date: Thu, 28 Nov 2019 02:16:02 -0000
Content-Transfer-Encoding: 8bit

From: Jean-Francois Dagenais <jeff.dagenais@gmail.com>

Signed-off-by: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
---
 meta/recipes-extended/mc/mc_4.8.23.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mc/mc_4.8.23.bb b/meta/recipes-extended/mc/mc_4.8.23.bb
index ac40e56183..95fa1dae78 100644
--- a/meta/recipes-extended/mc/mc_4.8.23.bb
+++ b/meta/recipes-extended/mc/mc_4.8.23.bb
@@ -4,7 +4,8 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=270bbafe360e73f9840bd7981621f9c2"
 SECTION = "console/utils"
 DEPENDS = "ncurses glib-2.0 util-linux"
-RDEPENDS_${PN} = "ncurses-terminfo"
+RDEPENDS_${PN} = "ncurses-terminfo-base"
+RRECOMMENDS_${PN} = "ncurses-terminfo"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
-- 
2.23.0


