Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 35B83713B6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 00:48:04 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id hz20so10892775lab.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 17:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cY8YALpa64wzMpCIp507XnEap0fEhV2VYSfGws17J9M=;
	b=RgdsVAR/2sPNB1qoPOkpTYXnmjB7nuYF1D5UBPjWfhmzCyy8zXTqKzCIuuPP82S3da
	BXULmhHzzpbCFRZrYQe8C6jad0Apx2epuB+R44HgujSZAvwc4dG376+skRl4C4ohfscm
	I2e79rortAHcE2pplPeOYISa318VvvrKJOql6TBWTSGkVALilpmVCyGlSxjbYCMyZ1th
	NWFeHHPd8T/MOTTVnfDABDWb5hiKGOP9EJPtP826VLMsJh8huCDmcWAQCA1rmr5KEMfJ
	LNGnz3JtJSngtckpLp55nm2TEtT9Hlgq0ycCwDMI9dg5fp4EsBTChdQzmNP6Dm5odevf
	AcUg==
X-Received: by 10.112.135.137 with SMTP id ps9mr934678lbb.24.1409791684495;
	Wed, 03 Sep 2014 17:48:04 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id r6sm40705lbp.29.2014.09.03.17.48.02
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Sep 2014 17:48:03 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.84)
	(envelope-from <cazfi74@gmail.com>)
	id 1XPLDV-0006Tg-E0; Thu, 04 Sep 2014 03:48:01 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Sep 2014 03:47:53 +0300
Message-Id: <cover.1409791241.git.cazfi74@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/6] Version updates & misc patch cleanup
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
X-List-Received-Date: Thu, 04 Sep 2014 00:48:07 -0000

Mainly updates to newer upstream versions, with some no longer needed patches dropped.

It took me a while to create a pull request. Apparently git request-pull has changed
significantly recently, and scripts/create-pull-request has not been updated accordingly.


 - ML


The following changes since commit e72aac2ae9e5fce1715fa04b7e94034fd06892d9:

  alsa-lib: libasound should runtime depends on alsa-conf (2014-09-03 11:30:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib 1d09577ffa2838c6465f034555db36dd8fc3476a
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/up

Marko Lindqvist (6):
  gtk+2: update to 2.24.24
  libpng: drop unnecessary automake requirement lowering patch
  libpng: update to 1.6.13
  pixman: update to 0.32.6
  pango: update to 1.36.6
  gtk+3: update to 3.12.2

 ...utton-do-not-prelight-in-touchscreen-mode.patch |  0
 ...Duplicate-the-exec-string-returned-by-gtk.patch |  0
 .../cellrenderer-cairo.patch                       |  0
 .../configure-nm.patch                             |  0
 .../configurefix.patch                             |  0
 .../{gtk+-2.24.22 => gtk+-2.24.24}/doc-fixes.patch |  0
 .../entry-cairo.patch                              |  0
 .../hardcoded_libtool.patch                        |  0
 .../run-iconcache.patch                            | 11 +++---
 .../toggle-font.diff                               |  0
 .../{gtk+-2.24.22 => gtk+-2.24.24}/xsettings.patch |  0
 meta/recipes-gnome/gtk+/gtk+3.inc                  |  6 ++-
 .../fix-build-when-wayland-backend-enabled.patch   | 43 ----------------------
 .../gtk+/{gtk+3_3.10.7.bb => gtk+3_3.12.2.bb}      |  5 +--
 .../gtk+/{gtk+_2.24.22.bb => gtk+_2.24.24.bb}      |  4 +-
 .../pango/{pango_1.36.5.bb => pango_1.36.6.bb}     |  4 +-
 .../{pixman_0.32.4.bb => pixman_0.32.6.bb}         |  4 +-
 ...0001-configure-lower-automake-requirement.patch | 31 ----------------
 .../libpng/{libpng_1.6.10.bb => libpng_1.6.13.bb}  | 11 +++---
 19 files changed, 24 insertions(+), 95 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/cellrenderer-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/configure-nm.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/configurefix.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/doc-fixes.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/entry-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/run-iconcache.patch (72%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/toggle-font.diff (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/xsettings.patch (100%)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/fix-build-when-wayland-backend-enabled.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.10.7.bb => gtk+3_3.12.2.bb} (75%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.22.bb => gtk+_2.24.24.bb} (93%)
 rename meta/recipes-graphics/pango/{pango_1.36.5.bb => pango_1.36.6.bb} (56%)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.32.4.bb => pixman_0.32.6.bb} (89%)
 delete mode 100644 meta/recipes-multimedia/libpng/libpng/0001-configure-lower-automake-requirement.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.6.10.bb => libpng_1.6.13.bb} (58%)

-- 
2.1.0


