Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9A98C6C207
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 14:29:17 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id s10-v6so2199706wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2018 06:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=p72DkCNDl+YMMsfEKUPIBzic7p91P/KWOp4PyvsrZu0=;
	b=ADV46AXeDEBJb1q+08K2DitkCi0Ce98Tpbo8vdSInq8YuK4w4UazOTBsDSdeFfZjTb
	+cF8HnUba/Vha7CZkHF71ubSWqidzKY4nTech6SN4qATmp5Y0+Mhco8WIB4jDRn236E2
	kDxqEvibpP8MGb36/jPFYlJIKV87ma0J2/vT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=p72DkCNDl+YMMsfEKUPIBzic7p91P/KWOp4PyvsrZu0=;
	b=tVqPo83GnuD9an6VPXJ5cZdyz25ogqYMxIWCrej/XupkVIj1rjmmckR4PPyY4LHfVM
	kH3N/6egG/M//N90VKbaTZzIEqsU9eJsaqxh5qVMAurfi4NCb0BHEoW4cTgjSuFIHt8T
	PMgC3yaxN3ZqBh2ZfgW6yXPNX9ydMReKJx/GCGFYYb1ZZB1cNKYeOMRPmal9OlEJhjlW
	IuGzq8vtcyu3GtMSWUxl4NyYHb960yjbGVbXNyJz6sUtfW7vqE+iS2exWiz5dK1eY3qH
	DqijoozX1S4B8cseM5E2esokEy1FHrnN/OsvyU3YmAl0TrSQFAquxgOWcRSagSVC1ekO
	AJnA==
X-Gm-Message-State: AGRZ1gIa1iUYP+8OdJ6Aggvqosgt7rt5A66mdu/OJHfk4AAebPKvnghJ
	cd2O6H64YEsuRCUKNTWzHig/R+Sr/R0=
X-Google-Smtp-Source: AJdET5ept9R0oIzUFrzZdhdSjwFvESRpB6SwWBtokSdn271TmjN5TjLyjcN+TKfXN/4kXx1q+D8ROg==
X-Received: by 2002:a7b:c183:: with SMTP id
	y3-v6mr4781674wmi.150.1541773757713; 
	Fri, 09 Nov 2018 06:29:17 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h16-v6sm7713764wrb.73.2018.11.09.06.29.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Nov 2018 06:29:17 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Nov 2018 14:29:04 +0000
Message-Id: <20181109142912.23102-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 04/12] oeqa/selftest/recipetool: Fix problems from changing upstream source
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
X-List-Received-Date: Fri, 09 Nov 2018 14:29:18 -0000

The upstream source tarball checksums changed. Use the copy from our source
mirror to avoid failures.

[YOCTO #12979]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index cd15df11a93..06f980e1b0e 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -433,12 +433,12 @@ class RecipetoolTests(RecipetoolBase):
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
         recipefile = os.path.join(temprecipe, 'navit_0.5.0.bb')
-        srcuri = 'http://downloads.sourceforge.net/project/navit/v0.5.0/navit-0.5.0.tar.gz'
+        srcuri = 'http://downloads.yoctoproject.org/mirror/sources/navit-0.5.0.tar.gz'
         result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
         checkvars['LICENSE'] = set(['Unknown', 'GPLv2', 'LGPLv2'])
-        checkvars['SRC_URI'] = 'http://downloads.sourceforge.net/project/navit/v${PV}/navit-${PV}.tar.gz'
+        checkvars['SRC_URI'] = 'http://downloads.yoctoproject.org/mirror/sources/navit-${PV}.tar.gz'
         checkvars['SRC_URI[md5sum]'] = '242f398e979a6b8c0f3c802b63435b68'
         checkvars['SRC_URI[sha256sum]'] = '13353481d7fc01a4f64e385dda460b51496366bba0fd2cc85a89a0747910e94d'
         checkvars['DEPENDS'] = set(['freetype', 'zlib', 'openssl', 'glib-2.0', 'virtual/libgl', 'virtual/egl', 'gtk+', 'libpng', 'libsdl', 'freeglut', 'dbus-glib', 'fribidi'])
-- 
2.17.1


