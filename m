Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3D76960053
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 22:29:05 +0000 (UTC)
Received: by igcsj18 with SMTP id sj18so119385211igc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 15:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EQzMm304n4P5NvFEVcggs4h+8eysOriFrFXmRmM4A5U=;
	b=L5gHCNCYUAq2G7GY6hH+Y6USBnH2VaZuvhixLq3b+PlcQhG3nxyJrJ1TXb6eGxmuL0
	HwRpxzdCikFoLkc/2m55Z9TIqtj+8cOgYqLe/kR1Fv4bmO7kOoFpmlK1WXsmW35+UPIG
	UsH5DI5ob9HBInEanQWmkxAgQtb7nYOgc4pIsof7BNDWkQ2to2aJ3mBLB9JsvxXyO4Yr
	GnzSZstc+VqOBdxMF6Z2+WPz83Rxp5TPSSf45Nhv2Djrn/Y9eKVKrNIG0fiyhQk01GEV
	pb8PGJkVlZh9GpURwcgi5gJ1AV9r6VEmyZADzHjldKhj0Algk6V8lhBZPw9HgUyk203D
	5l4Q==
X-Received: by 10.50.138.136 with SMTP id qq8mr28852636igb.27.1435703345981;
	Tue, 30 Jun 2015 15:29:05 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id p4sm224239igg.20.2015.06.30.15.29.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Jun 2015 15:29:05 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jun 2015 15:28:49 -0700
Message-Id: <1435703330-15892-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1435703330-15892-1-git-send-email-armccurdy@gmail.com>
References: <1435703330-15892-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/3] lsb: update i586 TARGET_ARCH tests to also handle i686
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
X-List-Received-Date: Tue, 30 Jun 2015 22:29:06 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-extended/lsb/lsb_4.1.bb     | 6 +++---
 meta/recipes-extended/lsb/lsbtest_1.0.bb | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index 7b2ee78..6215b62 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -40,7 +40,7 @@ do_install(){
 	mkdir -p ${D}${sysconfdir}/lsb-release.d
 	printf "LSB_VERSION=\"core-4.1-noarch:" > ${D}${sysconfdir}/lsb-release
 
-	if [ "${TARGET_ARCH}" = "i586" ];then
+	if [ "${TARGET_ARCH}" = "i586" ] || [ "${TARGET_ARCH}" = "i686" ];then
 		printf "core-4.1-ia32" >>  ${D}${sysconfdir}/lsb-release
 	else
 		printf "core-4.1-${TARGET_ARCH}" >>  ${D}${sysconfdir}/lsb-release
@@ -53,7 +53,7 @@ do_install(){
 	fi
 	echo "DISTRIB_DESCRIPTION=\"${DISTRO_NAME} ${DISTRO_VERSION}\"" >> ${D}${sysconfdir}/lsb-release
 
-	if [ "${TARGET_ARCH}" = "i586" ];then
+	if [ "${TARGET_ARCH}" = "i586" ] || [ "${TARGET_ARCH}" = "i686" ];then
 		mkdir -p ${D}${sysconfdir}/lsb-release.d
 		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-noarch
 		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-noarch
@@ -99,7 +99,7 @@ do_install_append(){
                ln -sf ld-linux-x86-64.so.2 ld-lsb-x86-64.so.2
                ln -sf ld-linux-x86-64.so.2 ld-lsb-x86-64.so.3
        fi
-       if [ "${TARGET_ARCH}" = "i586" ];then
+       if [ "${TARGET_ARCH}" = "i586" ] || [ "${TARGET_ARCH}" = "i686" ];then
 	       cd ${D}/${baselib}
                ln -sf ld-linux.so.2 ld-lsb.so.2
                ln -sf ld-linux.so.2 ld-lsb.so.3
diff --git a/meta/recipes-extended/lsb/lsbtest_1.0.bb b/meta/recipes-extended/lsb/lsbtest_1.0.bb
index f61251e..ea12502 100644
--- a/meta/recipes-extended/lsb/lsbtest_1.0.bb
+++ b/meta/recipes-extended/lsb/lsbtest_1.0.bb
@@ -19,7 +19,7 @@ do_install() {
 	install -d  ${D}/opt/lsb-test
 	install -m 0644 ${S}/packages_list ${D}/opt/lsb-test/packages_list
 	install -m 0644 ${S}/session ${D}/opt/lsb-test/session
-	if [ "${TARGET_ARCH}" = "i586" ];then
+	if [ "${TARGET_ARCH}" = "i586" ] || [ "${TARGET_ARCH}" = "i686" ];then
 		sed -i -e 's/lsbarch/ia32/g' -e 's/targetarch/i486/g' ${D}/opt/lsb-test/packages_list
 		sed -i -e 's/targetarch/x86/g' ${D}/opt/lsb-test/session
 	fi
-- 
1.9.1


