Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <takeshi.ken.hamasaki@gmail.com>) id 1UMdNa-00015w-3I
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Apr 2013 13:58:26 +0200
Received: by mail-pa0-f50.google.com with SMTP id bg2so1279178pad.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2013 04:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=X7ozS1MWs6apWwSUPBZ1VmcrIjwx32o/MdbXyf+t9gA=;
	b=TFOocnvfIHmusCtF9/KHR6hkh3KziBKK9g5IdpluvEMAUvzLRHV1h5u7vRpHrXovgi
	wAQQ0F2CMwOMFdFBc2U1Prq2Pvbt8DbPUPlnt3PtwYnPLdhpo/pAVA7QZM5tfopXmIXc
	ceNhBrk98vxrLU81v74XLkH6hGvoUanqmgQ4Wc8DIenL/r093sYLCGym2vuP39BsJ6vf
	NpB6CPA1mjEy9g41/7OD2duRITATRTZYi/90mEu5C0Y331MFTRcoJMQPZooPYuH43XhA
	hk/KxgKL4Kd3a/p9ywuGbiouCvgznFtzhV5iLsF8/C4MGmxViGe7EYvR6rnMEVXm1yMA
	IMzQ==
X-Received: by 10.68.204.164 with SMTP id kz4mr17427199pbc.158.1364816477026; 
	Mon, 01 Apr 2013 04:41:17 -0700 (PDT)
Received: from widex200.islocal (ZC025230.ppp.dion.ne.jp. [221.119.25.230])
	by mx.google.com with ESMTPS id
	rt13sm15015265pac.14.2013.04.01.04.41.14
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 01 Apr 2013 04:41:15 -0700 (PDT)
Sender: Takeshi Hamasaki <takeshi.ken.hamasaki@gmail.com>
From: Takeshi Hamasaki <hmatrjp@users.sourceforge.jp>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2013 20:40:57 +0900
Message-Id: <1364816457-21720-1-git-send-email-hmatrjp@users.sourceforge.jp>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH v2] pcmciautils: fix segmentation fault of pccardctl command
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
X-List-Received-Date: Mon, 01 Apr 2013 11:58:26 -0000


This changes definition of PCMCIAUTILS_VERSION to string from a multichacter constant to avoid segmentation fault of pccardctl command.

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



