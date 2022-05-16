Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Khem Raj" <raj.khem@gmail.com>
Subject: [PATCH] musl-locales: Switch SRC_URI to new location
Date: Mon, 16 May 2022 15:49:21 -0700
Message-Id: <20220516224921.37639-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>

Original repository has been less maintained and thusly adelie linux
community has picked up the package and started to maintain it also
applied long standing bug fixes.

Now we use new fork by Adélie Linux, which includes more supported
locales.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl-locales_git.bb | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/musl/musl-locales_git.bb b/meta/recipes-core/musl/musl-locales_git.bb
index 40b20e250d2..92532237e03 100644
--- a/meta/recipes-core/musl/musl-locales_git.bb
+++ b/meta/recipes-core/musl/musl-locales_git.bb
@@ -2,15 +2,15 @@
 # Released under the MIT license (see COPYING.MIT for the terms)
 #
 SUMMARY = "Locales support for musl"
-HOMEPAGE = "https://gitlab.com/rilian-la-te/musl-locales"
+HOMEPAGE = "https://git.adelielinux.org/adelie/musl-locales/-/wikis/home"
 LICENSE = "MIT & LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf5713fba707073020b1db2acaa73e78 \
                     file://LICENSE.MIT;md5=a4f1c6864a83ddf4b754cdab7d593523"
 
-SRC_URI = "git://gitlab.com/rilian-la-te/musl-locales;protocol=https;branch=master"
+SRC_URI = "git://git.adelielinux.org/adelie/musl-locales;protocol=https;branch=main"
 
 PV = "1.0+git${SRCPV}"
-SRCREV = "1101fb2bcdd189cd9415b8bd1c775eb43527d25c"
+SRCREV = "cac3dcdccd1d0c08d17f4919d862737d64b76f79"
 
 S = "${WORKDIR}/git"
 
@@ -28,46 +28,55 @@ python () {
 
 # only locale binaries are under GPL-3.0-or-later others are MIT
 LICENSE:${PN} = "LGPL-3.0-or-later"
-LICENSE:locale-base-ch-de = "MIT"
+LICENSE:locale-base-cs-cz = "MIT"
 LICENSE:locale-base-de-ch = "MIT"
 LICENSE:locale-base-de-de = "MIT"
 LICENSE:locale-base-en-gb = "MIT"
 LICENSE:locale-base-en-us = "MIT"
 LICENSE:locale-base-es-es = "MIT"
+LICENSE:locale-base-fi-fi = "MIT"
 LICENSE:locale-base-fr-fr = "MIT"
 LICENSE:locale-base-it-it = "MIT"
 LICENSE:locale-base-nb-no = "MIT"
 LICENSE:locale-base-nl-nl = "MIT"
 LICENSE:locale-base-pt-br = "MIT"
+LICENSE:locale-base-pt-pt = "MIT"
 LICENSE:locale-base-ru-ru = "MIT"
+LICENSE:locale-base-sr-rs = "MIT"
 LICENSE:locale-base-sv-se = "MIT"
 
-PACKAGES =+ "locale-base-ch-de \
+PACKAGES =+ "locale-base-cs-cz \
              locale-base-de-ch \
              locale-base-de-de \
              locale-base-en-gb \
              locale-base-en-us \
              locale-base-es-es \
+             locale-base-fi-fi \
              locale-base-fr-fr \
              locale-base-it-it \
              locale-base-nb-no \
              locale-base-nl-nl \
              locale-base-pt-br \
+             locale-base-pt-pt \
              locale-base-ru-ru \
+             locale-base-sr-rs \
              locale-base-sv-se \
              "
-FILES:locale-base-ch-de += "${datadir}/i18n/locales/musl/ch_DE.UTF-8"
+FILES:locale-base-cs-cz += "${datadir}/i18n/locales/musl/cs_CZ.UTF-8"
 FILES:locale-base-de-ch += "${datadir}/i18n/locales/musl/de_CH.UTF-8"
 FILES:locale-base-de-de += "${datadir}/i18n/locales/musl/de_DE.UTF-8"
 FILES:locale-base-en-gb += "${datadir}/i18n/locales/musl/en_GB.UTF-8"
 FILES:locale-base-en-us += "${datadir}/i18n/locales/musl/en_US.UTF-8"
 FILES:locale-base-es-es += "${datadir}/i18n/locales/musl/es_ES.UTF-8"
+FILES:locale-base-fi-fi += "${datadir}/i18n/locales/musl/fi_FI.UTF-8"
 FILES:locale-base-fr-fr += "${datadir}/i18n/locales/musl/fr_FR.UTF-8"
 FILES:locale-base-it-it += "${datadir}/i18n/locales/musl/it_IT.UTF-8"
 FILES:locale-base-nb-no += "${datadir}/i18n/locales/musl/nb_NO.UTF-8"
 FILES:locale-base-nl-nl += "${datadir}/i18n/locales/musl/nl_NL.UTF-8"
 FILES:locale-base-pt-br += "${datadir}/i18n/locales/musl/pt_BR.UTF-8"
+FILES:locale-base-pt-pt += "${datadir}/i18n/locales/musl/pt_PT.UTF-8"
 FILES:locale-base-ru-ru += "${datadir}/i18n/locales/musl/ru_RU.UTF-8"
+FILES:locale-base-sr-rs += "${datadir}/i18n/locales/musl/sr_RS.UTF-8"
 FILES:locale-base-sv-se += "${datadir}/i18n/locales/musl/sv_SE.UTF-8"
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.36.1

