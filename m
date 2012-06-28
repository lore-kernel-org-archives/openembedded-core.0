Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sk3QP-0005tG-Sk
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 03:21:38 +0200
Received: by dalh21 with SMTP id h21so2079033dal.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 18:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=DoQiUL5mFck5h0Qg/0zZJRZ7New1vxjdRU8RPNnoZ8I=;
	b=G84u/Zw8zDqTgD2dygchW60jtIxYJY4pRV1YCzJaK79GMj2ErbGceSBUC+OnHOXHht
	Cef97qzBVwyWFZikP2n32GbmCXhxViQucqrgC/e7V+YIiPZnuevUQiT3VECqKmQM1xRZ
	VcIvzGeoyR+YhLN1sSQR+s6UjR8x2+U198dJS5yPC651/DBLLlBJ6R0zs8PHbkmrqxtd
	17SOdUEKxHOeAB2E/7DE2NWYfYIS8wfqDidzSPv8c3lFc0auc5eY/A60I2Sp2J7RxS20
	T6wmae/8iP66+foeIn7Y22XjzeH5rVN1L7h/5E+lGxgoQCRFMUa0K3xkBPwDr0BNYILh
	OPoQ==
Received: by 10.68.202.99 with SMTP id kh3mr625484pbc.157.1340845843289;
	Wed, 27 Jun 2012 18:10:43 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id gj8sm368275pbc.39.2012.06.27.18.10.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jun 2012 18:10:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jun 2012 18:10:22 -0700
Message-Id: <9596cdb4348132c09c1844381ba6e9d5938a3bf6.1340845612.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <ac748647d97bee19bca3a4f312c82619b148c96e.1340845612.git.raj.khem@gmail.com>
References: <ac748647d97bee19bca3a4f312c82619b148c96e.1340845612.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340845612.git.raj.khem@gmail.com>
References: <cover.1340845612.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] eglibc-2.15: Update to latest on 2.15 branch
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
X-List-Received-Date: Thu, 28 Jun 2012 01:21:38 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/eglibc/eglibc_2.15.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index b2922b4..7dd9810 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -1,6 +1,6 @@
 require eglibc.inc
 
-SRCREV = "17386"
+SRCREV = "19294"
 
 DEPENDS += "gperf-native"
 PR = "r12"
-- 
1.7.9.5



