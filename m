Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id AB0A7795EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 20:13:56 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id s12-v6so3757731wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 13:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=8JNYPN9Ll/Vxu0GSn5xmXxdiZFUQ5nMSAeugnpChsuQ=;
	b=Pt2S1JHU+lR/4+/PYn93MXkUxZKsb9nnxnGP/nQVaLPeYp4K9PhfGno2EUeo6RouPW
	ks4pgbkPnpHYK15ybfn4Qu3QFLvyDCSGjoZZuzPd4TdO3/2BImnZIfESzvQDiCzj4/1V
	f/VvmXxj6/EG7RTZJv/e9u3kzJwp0d7oooCHzg7SPPdChgSzvH1ngCGd2HM00HZaqPb2
	QmdttLNtqKshoKYoP3YTAVTzi+XYWQC9N2Da1R4TlaaQh5Ss5QrJWC5/aBwTwiz5OZ+/
	edGe8OJlIn+DYMaVd7txbrny10f8fjIreDbU4QFXaillQ+AV8z9fc4MCourjmbBnRQm4
	W7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8JNYPN9Ll/Vxu0GSn5xmXxdiZFUQ5nMSAeugnpChsuQ=;
	b=unsR6OG9ZcufDEVoaz76aZn6nlko9uvv5r7fKQS5yvontqQ2EzpvjP7a19398HNx/D
	K+P2TwNAsg5lNOwlF8ofI6y7h8bjCCO3NqkQPaZ/sH2WLjDLDsKG8gA57eWqHE1qnok7
	co79kdE73ivAnY6zyvgSvotp9vXLdzCFKARpuTBg4A3eDeyWYrtpFVnPYwgMErZsA79J
	PYoodXuDP7xt8kgRL6rtGQtjw5siyb1Y5xvH2dBAj3lIgEDzd069pTjuhe9D/fFosUT7
	8hw6QmeCI3o7VmdmNzllaQRKLUPbomLpSmkrfSyUrd5anLicP0uKx9wt975dujSo1iVR
	L0lw==
X-Gm-Message-State: APzg51CEE8Cx9ajqfPE6lF2gSdCu0iIB3Xk5Z3if2kJgZj66egakaQ0l
	GGBuAl2sL+/H+6hbOfBY7MG1C5eRNZA=
X-Google-Smtp-Source: ANB0VdaUZlfXCBD3N6EyQLVhTiTcdr4mW06baA7AdNL+hDcMCa5b328d7hEYCIhrDz/JMO308TZEYA==
X-Received: by 2002:a1c:f03:: with SMTP id 3-v6mr2763146wmp.129.1536783236757; 
	Wed, 12 Sep 2018 13:13:56 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j66-v6sm3082079wrj.28.2018.09.12.13.13.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Sep 2018 13:13:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2018 21:13:54 +0100
Message-Id: <20180912201354.11673-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] oeqa/selftest/recipetool: fix cmake test
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
X-List-Received-Date: Wed, 12 Sep 2018 20:13:57 -0000

Now that oe-core has fribidi packaged Navit will find it at configure time, so
add it to the generated DEPENDS.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 754ea949824..2b5c3d6a0ed 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -439,7 +439,7 @@ class RecipetoolTests(RecipetoolBase):
         checkvars['SRC_URI'] = 'http://downloads.sourceforge.net/project/navit/v${PV}/navit-${PV}.tar.gz'
         checkvars['SRC_URI[md5sum]'] = '242f398e979a6b8c0f3c802b63435b68'
         checkvars['SRC_URI[sha256sum]'] = '13353481d7fc01a4f64e385dda460b51496366bba0fd2cc85a89a0747910e94d'
-        checkvars['DEPENDS'] = set(['freetype', 'zlib', 'openssl', 'glib-2.0', 'virtual/libgl', 'virtual/egl', 'gtk+', 'libpng', 'libsdl', 'freeglut', 'dbus-glib'])
+        checkvars['DEPENDS'] = set(['freetype', 'zlib', 'openssl', 'glib-2.0', 'virtual/libgl', 'virtual/egl', 'gtk+', 'libpng', 'libsdl', 'freeglut', 'dbus-glib', 'fribidi'])
         inherits = ['cmake', 'python-dir', 'gettext', 'pkgconfig']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
-- 
2.11.0


