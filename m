Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2EF8678447
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 00:07:23 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id m83so13098005ioi.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 17:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5ucZfopZtdlV1cahxr6FZpt6hqzh3BdjFdcrw1gKpPg=;
	b=Bsvgrnai19GfjTRWDsY2QLLl6TLqKMAliZ98etFKDqTC/JpzizpeSX1PdocCW2fWur
	vIfWCGnBSbhi4tovVK2A55rGH7TciSFwx+loBKqE+NpNNmF/tEveDt70eh2w8q8g2sg4
	muTXC/6CsxkDEbMj6kShugL91UqzfNuHosgtbmSePww6T7yPaEr4Uq4IeZSxlne6Zp8n
	nDrMshbG4etZbfqIx73H1XZNmktovze9NovHoPY/fVbPCb7+fGxNJnew8olV5UUWAzvc
	p2A12ELCxhmzVGurAp4sGifRWZ16Y2P/966ZgoG5qDC6MHpJo13tSe+J2SpC1XKIFfmG
	VAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5ucZfopZtdlV1cahxr6FZpt6hqzh3BdjFdcrw1gKpPg=;
	b=KsRYsCnSw4hdNTSUWYIDROHv7nc1Q/NPvyZ3pG/5xQVjyoCnUfwIoYVRjwv/ndDIqV
	VVhNzJ3azxhTDh5A7aw4SZVvvb6J0hcAqxqfZPLxSNLBrb07m3vlPdflwHEzxwkkuQvk
	9f36FbQaqmRHBzvLFGbC+R0C4ke/pbxw8MTEurgTgwd4TgOYC70b7RQ+0Nvp3SzU26Pa
	VrNKj3ZHiz0nTYgfVr4oUWeTrJG/yUXlOLT42GLXB4T74/UVPpnACwIKHrlSScleFqkF
	1lCCVjYNEeDzT9psf1HM+0zbeGiM/vXVpXckpL2m0L0K7+wcRdFxxB8ibnjuhRJbCl/i
	MQ4Q==
X-Gm-Message-State: AElRT7Gek/GufKAs0m27ONKomzWRD7LUzhlLh6J5+6tbuj2TK+R6SmTz
	1PfHpjDQT5Q9UmhhddSCIClavLiT
X-Google-Smtp-Source: AIpwx49SyuIo3Ct9EPaS+7q9v7z1Mz0Tbn69+3w8MJtKDn2oH+Mji3upGFxx8UAvZEtXjKDCCYVYow==
X-Received: by 10.107.213.13 with SMTP id m13mr901448iog.71.1521763644901;
	Thu, 22 Mar 2018 17:07:24 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	b185-v6sm5507431itb.8.2018.03.22.17.07.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Mar 2018 17:07:23 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2018 20:07:07 -0400
Message-Id: <20180323000707.17584-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.14.1.459.g238e487ea
In-Reply-To: <20180323000707.17584-1-twoerner@gmail.com>
References: <20180323000707.17584-1-twoerner@gmail.com>
Subject: [PATCH 2/2] virtual/libgbm: create
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
X-List-Received-Date: Fri, 23 Mar 2018 00:07:24 -0000

The 'glamor' PACKAGECONFIG in xserver-xorg creates a dependency on libgbm
which can be satisfied in some cases by mesa, in others by blobs such as mali.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc                 | 1 +
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 1a45601fdc..9e4da81f7f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,6 +20,7 @@ PROVIDES = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtual/libgles2', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)} \
     virtual/mesa \
     "
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index e8025de55f..cf2286c653 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -132,7 +132,7 @@ PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2,dri2proto"
 # DRI3 requires xshmfence to also be enabled
 PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3,dri3proto"
 PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,glproto virtual/libgl virtual/libx11"
-PACKAGECONFIG[glamor] = "--enable-glamor,--disable-glamor,libepoxy,libegl"
+PACKAGECONFIG[glamor] = "--enable-glamor,--disable-glamor,libepoxy virtual/libgbm,libegl"
 PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 PACKAGECONFIG[xshmfence] = "--enable-xshmfence,--disable-xshmfence,libxshmfence"
 PACKAGECONFIG[xmlto] = "--with-xmlto, --without-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
-- 
2.14.1.459.g238e487ea


