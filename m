Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3229373E36
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 21:50:27 +0000 (UTC)
Received: by wifm2 with SMTP id m2so1312224wif.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jul 2015 14:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=kLUns/+2Ic81CnJl+AHu1Re9WzQdKzjWyMjW+glVBOY=;
	b=CZKofbnWf0QJg9ozlMHUkfrm4n5sr2iWwh3eLNLEIxN+5KvaP5kBSGyFiSNur2SgPl
	g/91S0CHsrOPhQtizWbX8tVt7ZYP8Y6sK6+a2wgsdDMfsBOSFcVoZRBxzH62Q/GqZkTn
	TasSpgJg3gHKweQ09ExtEYJuUbKUFYxxW1Rd9gednllAM1oDhUISWMWZG4V8FXh+I0U0
	tfbP1MQ+QCSAwhWIbu+DlqfF5D3FXrSZAB5qheEc1p7oEIz5Bp45eGIGE4G6KZ6woOJ6
	pzDyN7D7ZKkx6p/4so+KB3G2I+MbM3Y+qkMTDFcigxiWMN9H1+BKZiMCIkEey1+WMxhk
	1R9g==
X-Gm-Message-State: ALoCoQlkHSAkITJMKMZAtdevc30FD1u19ph13kTV3KYASNEwUtuc3W7SbufByV1nQPjfCiG7ERHW
X-Received: by 10.180.104.129 with SMTP id ge1mr79579112wib.84.1436392226641; 
	Wed, 08 Jul 2015 14:50:26 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	lq9sm5443097wjb.35.2015.07.08.14.50.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Jul 2015 14:50:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jul 2015 22:44:58 +0100
Message-Id: <1436391898-18328-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH][V2] gnome-icon-theme: inherit allarch
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
X-List-Received-Date: Wed, 08 Jul 2015 21:50:28 -0000

The intltool 0.51 doesn't do compile tests in the autoconf macros, so this
recipe can be allarch again.

Remove dependency on target glib-2.0, it doesn't appear to be required.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
index fde2bc0..df117ae 100644
--- a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
@@ -8,9 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e7e289d90fc8bdceed5e3f142f98229e"
 
 PR = "r5"
 
-DEPENDS = "icon-naming-utils-native glib-2.0 intltool-native libxml-simple-perl-native"
+DEPENDS = "icon-naming-utils-native intltool-native libxml-simple-perl-native"
 
-inherit autotools perlnative gtk-icon-cache pkgconfig gettext
+inherit allarch autotools perlnative gtk-icon-cache pkgconfig gettext
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/2.31/${BPN}-${PV}.tar.bz2 \
            file://iconpath-option.patch"
-- 
2.1.4


