Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BEC9B7269B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 09:20:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0E9KhGG022498
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 01:20:43 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 01:20:42 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 01:20:38 -0800
Message-ID: <72246a610d47199885008d3ed513f6bc0c3d883e.1421227202.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421227202.git.liezhi.yang@windriver.com>
References: <cover.1421227202.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] autotools.bbclass: print make clean
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
X-List-Received-Date: Wed, 14 Jan 2015 09:20:48 -0000
Content-Type: text/plain

It makes us easier to see make clean failed.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/autotools.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index ca04e79..402ee1b 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -111,6 +111,7 @@ autotools_preconfigure() {
 				# regenerate them even if CFLAGS/LDFLAGS are different
 				cd ${S}
 				if [ "${CLEANBROKEN}" != "1" -a \( -e Makefile -o -e makefile -o -e GNUmakefile \) ]; then
+					echo "Running \"${MAKE} clean\" in ${S}"
 					${MAKE} clean
 				fi
 				find ${S} -name \*.la -delete
-- 
1.7.9.5


