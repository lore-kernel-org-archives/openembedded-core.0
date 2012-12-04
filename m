Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfhaE-0000ij-0b
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 02:46:02 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1918643eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2012 17:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=raGW7ujZaKE+K+j4j/RoHPgGSp24FG0IDDKgmyLE4LI=;
	b=fpYiKPQyTtZq6wRjKX5kMYdtdJZDeLZL1RKlidwYGPTW3gIAmq8nHLYHLrIijIbYfX
	6vMSbSiGOh02KU0sgpUX+5C3w1vLyoBOp2yolAty4G0V6eaKWulZVDsLWLpqcJqDTgyq
	DFAS5GLaHqDmEFCCbb6GksZT6/9/9ohCwJLilYtUW/fVFpALDVoPXQpHNTTVLGDSG5I0
	nzXWQ3NgzCpHNeIolPGXlQsmJQiokxmxOlnjF3D0AEwxaMkacgHffq7zv/TpZBr7o1Kg
	gNrrR4wWmZELSU6hDcBW62sWauUiKqiD0N3+Hts1pw8GuZqKD2ZvVXg2VxV+Vxr6pfkj
	5/hQ==
Received: by 10.14.198.67 with SMTP id u43mr42872629een.7.1354584702333;
	Mon, 03 Dec 2012 17:31:42 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e1sm34693440eem.3.2012.12.03.17.31.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 17:31:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:31:12 +0100
Message-Id: <a67e1a9303addf463a56ad1d31fe25873453f159.1354584580.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354584580.git.Martin.Jansa@gmail.com>
References: <cover.1354584580.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354584580.git.Martin.Jansa@gmail.com>
References: <cover.1354584580.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/6] distutils: remove empty datadir/share after it's content is moved to datadir
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
X-List-Received-Date: Tue, 04 Dec 2012 01:46:02 -0000

* fixes a lot of QA warnings about unpackaged /usr/share/share

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/distutils.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index c73b24f..552e5f3 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -64,6 +64,7 @@ distutils_do_install() {
         #
         if test -e ${D}${datadir}/share; then
             mv -f ${D}${datadir}/share/* ${D}${datadir}/
+            rmdir ${D}${datadir}/share
         fi
 }
 
-- 
1.8.0



