Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QGyXS-0005Vi-Du
	for openembedded-core@lists.openembedded.org;
	Mon, 02 May 2011 21:12:10 +0200
Received: by gyf1 with SMTP id 1so2199733gyf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2011 12:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=P2D0msEBQ6GZP2MbDtO3glKom8RH36TLXeBunSQom18=;
	b=dgrYAlJWGAPfSF69Psf3kKufa0H5t+iFBd9jMZNTGTSeLWVoFvzd8gQLCdqsdllop9
	EoDMivwCZpCRjqukVB+rDaTNkvRX8CbSJUtt0dGdg4W4Whn2B9zW45J2py6UcbmF8zqt
	clXLK1oimwxngws+MghPkxLTZPed998IYmvb8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=mD7KWY2+f46BwfS7YadGCjExDb+Viwnr4Uwkd8E86UoBxqd0KxaN8Ao89CJrQzJ/Nk
	ro7XAbj6L6Piv+zmbbcW/MF72YOARtk3tlPB9siU94cDwZPKcYw/ZCj75Ss+NzsCRDXk
	wkR80DV6TxNO18tz5jTst5Kt8vYgnQ/w2s2uA=
Received: by 10.151.88.8 with SMTP id q8mr7690455ybl.3.1304363372860;
	Mon, 02 May 2011 12:09:32 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id r9sm856452yba.16.2011.05.02.12.09.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2011 12:09:31 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2011 19:09:13 +0000
Message-Id: <1304363356-27535-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 1/4] meta/conf/local.conf.sample: fix mklibs comment line split and typo
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
X-List-Received-Date: Mon, 02 May 2011 19:12:10 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/conf/local.conf.sample |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index ba92df8..02164eb 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -53,9 +53,10 @@ EXTRA_IMAGE_FEATURES = "tools-debug tools-profile tools-testapps debug-tweaks"
 #PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
 PACKAGE_CLASSES ?= "package_ipk"
 
-# mklibs library size optimization is more useful to smaller images, 
-# and less useful for bigger images. Also mklibs library optimization can break the ABI compatibility, so should not be applied to the images which are tobe
-# extended or upgraded later.
+# mklibs library size optimization is more useful to smaller images,
+# and less useful for bigger images. Also mklibs library optimization
+# can break the ABI compatibility, so should not be applied to the
+# images which are to be extended or upgraded later.
 #This enabled mklibs library size optimization just for the specified image.
 #MKLIBS_OPTIMIZED_IMAGES ?= "core-image-minimal"
 #This enable mklibs library size optimization will be for all the images.
-- 
1.7.2.5



