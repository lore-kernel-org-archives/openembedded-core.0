Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 29E567066B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 17:02:22 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id bs8so13457315wib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 09:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=e7e6npOj1MKgFNz0KQ2mBDcOHPKyiMn7SXQJ/PrXk5U=;
	b=uRwwPyAn9V4awmZhHjDy7mYUrLtWhhQY58sh6p8YVWZ4aDRdugXBaXoZlN9+NJHvk+
	TrCcsghNyaTuweJ51ynlVTpT/FBC+V7TCis/W3S+l3TsdNEQPmp1fchs+Pyw0zaHM9Sw
	OxsbJeUBlB2NtyquZPPsFzSMtEE9pSK4MnY/SWXQuzgMMYW2rkApzRnep4uF7iP7N4s5
	8bky9Z9ZIOyhKPPCfgRkRhc5EPU+MFAJoCFe6aknvYGx3Ju472tBCbeHvbgeuxYEY2lT
	b/RJlEKL81EsvKlkQABVdCwhMbDoMUPjm7/oq218vcPKO8JW5PJyAS6iL57Y2Lf/rqBI
	f4kA==
X-Received: by 10.180.189.52 with SMTP id gf20mr18209407wic.27.1423846943226; 
	Fri, 13 Feb 2015 09:02:23 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id hs7sm3689606wib.4.2015.02.13.09.02.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Feb 2015 09:02:22 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Feb 2015 18:02:11 +0100
Message-Id: <1423846931-9751-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] u-boot.inc: unbreak
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
X-List-Received-Date: Fri, 13 Feb 2015 17:02:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fix multiple:

| run.do_deploy.7526: line 107: [: missing `]'

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 58725fa..b898d6a 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -71,7 +71,7 @@ do_compile () {
                 then
                     continue
                 fi
-                if [ -d "${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}"]
+                if [ -d "${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}" ]
                 then
                     break
                 else
@@ -97,7 +97,7 @@ do_install () {
                 then
                     continue
                 fi
-                if [ -d "${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}"]
+                if [ -d "${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}" ]
                 then
                     break
                 else
@@ -128,7 +128,7 @@ do_install () {
                      then
                          continue
                      fi
-                     if [ -d "${D}/boot/${SPL_IMAGE}-${type}"]
+                     if [ -d "${D}/boot/${SPL_IMAGE}-${type}" ]
                      then
                          break
                      else
@@ -162,7 +162,7 @@ do_deploy () {
                 then
                     continue
                 fi
-                if [ -d "${DEPLOYDIR}/u-boot-${type}.${UBOOT_SUFFIX}"]
+                if [ -d "${DEPLOYDIR}/u-boot-${type}.${UBOOT_SUFFIX}" ]
                 then 
                     break
                 else
@@ -195,7 +195,7 @@ do_deploy () {
                       then
                           continue
                       fi
-                      if [ -d "${DEPLOYDIR}/${SPL_IMAGE}-${type}"]
+                      if [ -d "${DEPLOYDIR}/${SPL_IMAGE}-${type}" ]
                       then
                           break
                       else
-- 
1.9.3


