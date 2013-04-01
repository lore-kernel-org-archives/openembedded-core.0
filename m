Received: from mail-pd0-f176.google.com ([209.85.192.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <takeshi.ken.hamasaki@gmail.com>) id 1UMb2M-00070U-HG
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Apr 2013 11:28:22 +0200
Received: by mail-pd0-f176.google.com with SMTP id r11so1128020pdi.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2013 02:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=IGDK54o5xsR1eOLDiYy4LCHfCQVZfJUPq1MJc2CwGD0=;
	b=hchi8Knb5Vuc7/o2EU7iYaWg+D0Rv4IsN2GFgIXo14rONjey87d+3BHwxJ/6Gzkx9p
	DtdC7vUt9SvsUtkWd6kXRST2SmwZPc4odqat2fhU7YtrWts2qdsVl9CRrUy4PeQYbUOb
	hNHt4r2njq8HM2sL5uSksRY1Wo2lknMyE1RMQW2UXgzFVgSnlpL886R2ea6ATQv+Krx3
	Pnd45mE3Qu8vZOcedflzNm3QIb2jR692IFp5ulxVcXVFjWaLwZ17SbB2BtoCz4rY1RFp
	i4hu3vYtKQot+VkDJu2fc9hj/GQtDSVusDtpQyztggmrPjN1ynNhvmScafkzfHdqbjyc
	lTHg==
X-Received: by 10.67.10.238 with SMTP id ed14mr17856690pad.41.1364807473705;
	Mon, 01 Apr 2013 02:11:13 -0700 (PDT)
Received: from widex200.islocal (ZC025230.ppp.dion.ne.jp. [221.119.25.230])
	by mx.google.com with ESMTPS id hu2sm13091230pbc.38.2013.04.01.02.11.06
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 01 Apr 2013 02:11:12 -0700 (PDT)
Sender: Takeshi Hamasaki <takeshi.ken.hamasaki@gmail.com>
From: Takeshi Hamasaki <hmatrjp@users.sourceforge.jp>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2013 18:10:44 +0900
Message-Id: <1364807444-20977-1-git-send-email-hmatrjp@users.sourceforge.jp>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] pcmciautils: fix segmentation fault of pccardctl command
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
X-List-Received-Date: Mon, 01 Apr 2013 09:28:22 -0000


This changes difinition of PCMCIAUTILS_VERSION to string from a multichacter constant to avoid segmentation fault of pccardctl command.

Signed-off-by: Takeshi Hamasaki <hmatrjp@users.sourceforge.jp>
---
 meta/recipes-bsp/pcmciautils/pcmciautils.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
index 80271d6..0651236 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
@@ -21,7 +21,7 @@ export udevrulesdir = "${nonarch_base_libdir}/udev/rules.d"
 export UDEV = "1"
 LD = "${CC}"
 CFLAGS =+ "-I${S}/src"
-CFLAGS =+ "-DPCMCIAUTILS_VERSION=\'${PV}\'"
+CFLAGS =+ "-DPCMCIAUTILS_VERSION=\\"${PV}\\""
 
 PARALLEL_MAKE = ""
 EXTRA_OEMAKE = "-e 'STRIP=echo' 'LIB_OBJS=-lc -lsysfs' 'LEX=flex'"
-- 
1.7.10.4



