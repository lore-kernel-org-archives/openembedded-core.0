Received: from mail-pa0-f48.google.com ([209.85.220.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U3ZNY-0007Gq-Gp
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Feb 2013 22:51:36 +0100
Received: by mail-pa0-f48.google.com with SMTP id hz10so1660448pad.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2013 13:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=k/cnh7BUutldb0WRGaWhTsMRwmW5gffMKNN0zMTFu0g=;
	b=JwuG6XTJJC4olo/S/THNNw1m2K64YOln9eYsausLzXaoLQ2rcxLfawrQZJ99JXcOqS
	iU9MEEk8JFNa208sP64ipn6eFsvqzCpL6rs0KT/OXdB+ltoSQUOImBMUkiFdanl8fhct
	Hx+/hkwtiIZkfxehCtakCVN8YNzI6DDW3d2b/+WrAXmdqnUuEGw9qyjk2WC6Z/Cxqssl
	X9suiyV0o9c1D1Zl+bl15jm48b85RedME9I8ldZNa++ho14+IVZj01vhJ0xm5WyvgWCB
	y3GTriu3BhS5TLCayuJyfbyOo1bJaMY4SXbflJ//K1sf2N5d4DKQpQKQp+01b1DMYgDO
	iTxQ==
X-Received: by 10.66.88.164 with SMTP id bh4mr6444601pab.41.1360247894576;
	Thu, 07 Feb 2013 06:38:14 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b3sm43817419pax.14.2013.02.07.06.38.12
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Feb 2013 06:38:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Feb 2013 15:33:54 +0100
Message-Id: <1360247634-10957-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] libpfm4: exclude from world
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2013 21:51:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb b/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb
index 460029f..438dbc3 100644
--- a/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb
+++ b/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb
@@ -24,3 +24,6 @@ S = "${WORKDIR}/libpfm-${PV}"
 do_install () {
 	oe_runmake install
 }
+
+# oprofile depends on it only for ppc* and it fails to build on arm
+EXCLUDE_FROM_WORLD = "1"
-- 
1.8.1.2



