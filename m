Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPgjA-0000L2-Oh
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 23:04:48 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so1385234pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 13:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=3GA4mpiHeIqviWbprTcoBPQT6hkFuz149e386CeuZQ8=;
	b=jTFIB5z6xstmsSzznL5FVmIfuVtb9yfiqza3rmHSZPKVlTsb2xi+FIN6wmQKxUjPin
	yzwf1HQOmPCr7e8QIo+k0G3mjtKaC7ZaB/DPnXxVRHvKxT0cogdMQ5S+hKMxQDgsthqY
	nfTcHaoGugMiSsKGOk6L0q4nIJsvut4pFL2BrySwDFlcxd0keVhUUZRrzMB4njG//+Ut
	6FH7eFUZBK2yyDM2ozqqshWkpMiG5p/pIt5uRA3ZzrEsACusBlWIv5aLWHkopTYX8z2p
	IiUH5vTqTWEwv8zgJgmt9XYgDzO1R7jsyH+IGHhTzpsOymjsSbSXH5+aD0BHGhiTXa9V
	AzmQ==
Received: by 10.68.202.130 with SMTP id ki2mr900666pbc.52.1335992106032;
	Wed, 02 May 2012 13:55:06 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id pg6sm2949558pbb.41.2012.05.02.13.55.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 13:55:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 13:53:59 -0700
Message-Id: <47dd443428cddc9e709f208aad6829e83dfd98ab.1335991900.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <0c57b76bc47680ccf576d412a3dc7e726f1daba2.1335991900.git.raj.khem@gmail.com>
References: <0c57b76bc47680ccf576d412a3dc7e726f1daba2.1335991900.git.raj.khem@gmail.com>
In-Reply-To: <cover.1335991900.git.raj.khem@gmail.com>
References: <cover.1335991900.git.raj.khem@gmail.com>
Subject: [PATCH 6/7] uclibc: Return correct endianness for mips64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 May 2012 21:04:49 -0000

Regular expression did not check for mips64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-config.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc-config.inc b/meta/recipes-core/uclibc/uclibc-config.inc
index 0e0c188..265626c 100644
--- a/meta/recipes-core/uclibc/uclibc-config.inc
+++ b/meta/recipes-core/uclibc/uclibc-config.inc
@@ -75,7 +75,7 @@ def map_uclibc_endian(a, d):
 	if re.match('^(avr32|e1|frv|(parisc|hppa)|m68k|microblaze|powerpc.*|(sparc|sun).*)$', a):
 		return 'BIG'
 	# Possibly BE
-	elif re.match('^(((arm|sa110).*eb)|h8300.*eb|(parisc|hppa).*eb|mips|sh.*eb|xtensa.*eb)$', a):
+	elif re.match('^(((arm|sa110).*eb)|h8300.*eb|(parisc|hppa).*eb|mips|mips64|sh.*eb|xtensa.*eb)$', a):
 		return 'BIG'
 	return 'LITTLE'
 
-- 
1.7.5.4



