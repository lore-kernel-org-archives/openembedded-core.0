Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R4Nnp-0002O7-HR
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 04:05:17 +0200
Received: by mail-iy0-f175.google.com with SMTP id x2so1971809iad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 19:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=VTfIUIWwHbz/qEl1lK4EsTZ/obcvqmA7zgooloY46qc=;
	b=kkGLpsCRGXiNFFJnYDhM+xWyrWsvg2W4+qSz3rPFuidIbGcc/JO593yEQDrpDi7PW5
	Ghm21RhWw2iqxz44Q9JBx368faKUL398YWkpco265hbf33yx/bmZ8twQj7RDGV0AnvuR
	bJJ+ZE+n2VjQctQb9iWHGqp3PkKgcaVWh1hGQ=
Received: by 10.231.85.37 with SMTP id m37mr2869046ibl.94.1316138407432;
	Thu, 15 Sep 2011 19:00:07 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id r2sm7188837ibq.7.2011.09.15.19.00.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 19:00:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2011 18:59:55 -0700
Message-Id: <7a3da4679400cf116b4357a69703f295853d49f7.1316138063.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <34fc595e22f0b359e6ae5ead10c1ecee30a447f6.1316138063.git.raj.khem@gmail.com>
References: <34fc595e22f0b359e6ae5ead10c1ecee30a447f6.1316138063.git.raj.khem@gmail.com>
In-Reply-To: <cover.1316138063.git.raj.khem@gmail.com>
References: <cover.1316138063.git.raj.khem@gmail.com>
Subject: [PATCH 3/4] eglibc-2.13: Replace oewarn with bbwarn
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
X-List-Received-Date: Fri, 16 Sep 2011 02:05:17 -0000

oewarn does not exist

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/eglibc/eglibc_2.13.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index 3b19e7b..b2da697 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -204,7 +204,7 @@ do_compile () {
 		cd ${S}/sunrpc/rpcsvc
 		for r in ${rpcsvc}; do
 			h=`echo $r|sed -e's,\.x$,.h,'`
-			rpcgen -h $r -o $h || oewarn "unable to generate header for $r"
+			rpcgen -h $r -o $h || bbwarn "unable to generate header for $r"
 		done
 	)
 	echo "Adjust ldd script"
-- 
1.7.5.4



