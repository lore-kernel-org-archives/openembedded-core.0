Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id D625C7582D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 16:42:10 +0000 (UTC)
Received: by iecwk5 with SMTP id wk5so16864182iec.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 09:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=QECwcuTsNCn5cc9pLOsGiGJh7R5rcvSVspN8uMXDRqA=;
	b=G5i6gdpBEiPldMbVNDx4wfZ2ioVtmomBvZe9dJjYSqoZSNIIKIpVtfW1Bt8mcAn1bt
	8oCCbuKttZ0rHAV77oMuO3xoKZHBPzh8y2Vtx/iTlImULrU2LI1ecsDXDDDh6w7uKe+J
	Fx3S4PwP9jh+EZzJtXpdBzllLNBHezj99EvmPCRRHPY2M3wXAR+wZR1yA9S0Ghd5Pryx
	NyWns88v/aAG/i/PuDhflHocp+ANkO1Jh8SG1NLBlV4vVwpG9iL3DBKtKDmG+7yaCH3C
	o8Ds7+p1+erAVofusUPqBa1sYYHPEIzDjmGbqZhbsal8Dp1VCAs62ai3Nmecn7cc1Ti/
	b64g==
X-Received: by 10.50.61.241 with SMTP id t17mr6413412igr.34.1433349731501;
	Wed, 03 Jun 2015 09:42:11 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id d4sm15059595iod.17.2015.06.03.09.42.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jun 2015 09:42:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jun 2015 09:42:02 -0700
Message-Id: <169d7c377b7ee384071518feb7a54293523795d7.1433349512.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <0d3de82d935f6408e5c04ff980a2b3fd4a9e4ac3.1433349512.git.raj.khem@gmail.com>
References: <0d3de82d935f6408e5c04ff980a2b3fd4a9e4ac3.1433349512.git.raj.khem@gmail.com>
In-Reply-To: <cover.1433349512.git.raj.khem@gmail.com>
References: <cover.1433349512.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] lsof: Remove LSOF_OS
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
X-List-Received-Date: Wed, 03 Jun 2015 16:42:11 -0000

This is not needed since its target recipe and we always
need to pass 'linux' for OS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/lsof/lsof_4.88.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-extended/lsof/lsof_4.88.bb b/meta/recipes-extended/lsof/lsof_4.88.bb
index 0e49f92..bc8774f 100644
--- a/meta/recipes-extended/lsof/lsof_4.88.bb
+++ b/meta/recipes-extended/lsof/lsof_4.88.bb
@@ -29,9 +29,6 @@ python do_unpack () {
     d.setVar('SRC_URI', src_uri)
 }
 
-export LSOF_OS = "${TARGET_OS}"
-LSOF_OS_libc-uclibc = "linux"
-LSOF_OS_libc-glibc = "linux"
 export LSOF_INCLUDE = "${STAGING_INCDIR}"
 
 do_configure () {
@@ -42,7 +39,7 @@ do_configure () {
                 LINUX_CLIB="-DGLIBCV=${LINUX_CLIB}"
                 export LINUX_CLIB
         fi
-	yes | ./Configure ${LSOF_OS}
+	yes | ./Configure linux
 }
 
 export I = "${STAGING_INCDIR}"
-- 
2.1.4


