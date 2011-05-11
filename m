Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QK2yc-0007uF-MN
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 08:32:54 +0200
Received: by pvc30 with SMTP id 30so108192pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 23:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=HkZbWPIgt8MWc3ePTBhqVzT1fRD+todeykSBtc04BpI=;
	b=YxUNd39Rd0ZNC/GJLHTRJiI2vBHTo4srY0+j+5CpmXCcCcBtcqRz/eBQckcvAG7xyc
	Gumvvlg6E0pBRuWZM63fxsm9a74NNvMbEH4vbBuZjLlvpr7cQfX1PHcYWPZzfqiN/Hya
	/yvyLqajtpM2LC8cNhzfW+Fd+gZcUfrziGXJc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=AcofSK6LbfOsG5ht/0f0mqJHxLKoPbgrC/OVbUliDb10eZ0cChGiW9qayJ8Z0VfKxR
	B/UKKEMSRVbkmIwiXZQ9eJRF13HPfw0PRGoyih6qiCElC+2LimbMu8EnvqCTlVAM9OeB
	pPRTRIiT97vqkvFfxGGaRNqTnhjv3hlLrfRR0=
Received: by 10.68.18.3 with SMTP id s3mr11533460pbd.246.1305095407184;
	Tue, 10 May 2011 23:30:07 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y5sm5312031pbq.57.2011.05.10.23.30.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 23:30:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2011 23:30:03 -0700
Message-Id: <237ad27052ac01cead340513a7057d81e0c2fcfe.1305095232.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1305095232.git.raj.khem@gmail.com>
References: <cover.1305095232.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] conf/bitbake.conf: use --no-check-certificate to avoid errors when wgetting from https
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
X-List-Received-Date: Wed, 11 May 2011 06:32:54 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index fb488ae..030a78b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -507,17 +507,17 @@ XORG_MIRROR = "http://xorg.freedesktop.org/releases"
 
 FETCHCMD_svn = "/usr/bin/env svn"
 FETCHCMD_cvs = "/usr/bin/env cvs"
-FETCHCMD_wget = "/usr/bin/env wget -t 5 -q"
+FETCHCMD_wget = "/usr/bin/env wget -t 5 -q --no-check-certificate"
 FETCHCMD_bzr = "/usr/bin/env bzr"
 FETCHCMD_hg = "/usr/bin/env hg"
 
 FETCHCOMMAND = "ERROR, this must be a BitBake bug"
-FETCHCOMMAND_wget = "/usr/bin/env wget -t 5 -q --passive-ftp -P ${DL_DIR} '${URI}'"
+FETCHCOMMAND_wget = "/usr/bin/env wget -t 5 -q --passive-ftp -P --no-check-certificate ${DL_DIR} '${URI}'"
 FETCHCOMMAND_cvs = "/usr/bin/env cvs '-d${CVSROOT}' co ${CVSCOOPTS} ${CVSMODULE}"
 FETCHCOMMAND_svn = "/usr/bin/env svn co ${SVNCOOPTS} ${SVNROOT} ${SVNMODULE}"
-CHECKCOMMAND_wget = "/usr/bin/env wget --spider -t 5 --passive-ftp -P ${DL_DIR} '${URI}'"
+CHECKCOMMAND_wget = "/usr/bin/env wget --spider -t 5 --passive-ftp -P --no-check-certificate ${DL_DIR} '${URI}'"
 RESUMECOMMAND = "ERROR, this must be a BitBake bug"
-RESUMECOMMAND_wget = "/usr/bin/env wget -c -t 5 -q --passive-ftp -P ${DL_DIR} '${URI}'"
+RESUMECOMMAND_wget = "/usr/bin/env wget -c -t 5 -q --passive-ftp -P --no-check-certificate ${DL_DIR} '${URI}'"
 UPDATECOMMAND = "ERROR, this must be a BitBake bug"
 UPDATECOMMAND_cvs = "/usr/bin/env cvs -d${CVSROOT} update -d -P ${CVSCOOPTS}"
 UPDATECOMMAND_svn = "/usr/bin/env svn update ${SVNCOOPTS}"
-- 
1.7.4.1



