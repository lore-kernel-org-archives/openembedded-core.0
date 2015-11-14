Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 40F0D7731D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Nov 2015 21:45:00 +0000 (UTC)
Received: by wmww144 with SMTP id w144so68008399wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Nov 2015 13:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wdyCKk8LgZcAvC7uOEisPe3QJuzXXP5mEy7ac+zGcWI=;
	b=CLFCfCYwF1opMVyt/iIcAOFtBALuNYu80mywerWzDo9ukvheCUEE2tfxFHl/vxF56m
	spoglEPOKA0lS4xZW/6WxdqoBKSx3fEFbT/oZT5qSIHIgT36Au3kHqr2/0XeConajGnR
	b9FVDJ71t+Rt4DEA8rcveeKVsOWkMQkPhenqi1nHz8/c2AOmjpx/ud8w6IqnBaJDK/Mq
	uSCxo8ceyJ61Pxm2FHiiBpZq0PkZJLVAZ5aXV/V46I6KjotiVm+2r4Lb2vaswVZC0/KH
	CWPhouokJJGnAkQOBJp5jddhC/XK2FT3xQTigchOANQIvSJh4EjP1GY+sbp8OjtE6q9y
	fG6w==
X-Received: by 10.194.203.106 with SMTP id kp10mr29836679wjc.86.1447537500395; 
	Sat, 14 Nov 2015 13:45:00 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	u139sm10517589wmu.22.2015.11.14.13.44.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Nov 2015 13:44:59 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Nov 2015 22:44:43 +0100
Message-Id: <1447537483-22167-1-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
Subject: [meta-oe][PATCH] python-pickle: Add rdepend python-db
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
X-List-Received-Date: Sat, 14 Nov 2015 21:45:04 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta/recipes-devtools/python/python-2.7-manifest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index dd8d825..818b204 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -178,7 +178,7 @@ RDEPENDS_${PN}-numbers="${PN}-core ${PN}-lang ${PN}-re"
 FILES_${PN}-numbers="${libdir}/python2.7/decimal.* ${libdir}/python2.7/fractions.* ${libdir}/python2.7/numbers.* "
 
 SUMMARY_${PN}-pickle="Python serialisation/persistence support"
-RDEPENDS_${PN}-pickle="${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
+RDEPENDS_${PN}-pickle="${PN}-core ${PN}-codecs ${PN}-io ${PN}-re ${PN}-db"
 FILES_${PN}-pickle="${libdir}/python2.7/pickle.* ${libdir}/python2.7/shelve.* ${libdir}/python2.7/lib-dynload/cPickle.so ${libdir}/python2.7/pickletools.* "
 
 SUMMARY_${PN}-pkgutil="Python package extension utility support"
-- 
2.4.3


