Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QPWxu-0003qS-7L
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 11:34:50 +0200
Received: by fxm19 with SMTP id 19so651222fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 02:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=vp5bMG3D1ol47/Yp1+Kewk1mB/una4FipM8lpjaZln4=;
	b=RKhEVRk7vTL0bvEmfO3EtnTIuZ8rrRgluurgzlgPkKs2AKk/TRtoxhdQ3Y0xzFu2Xh
	hv2BETaTi54odx95V1fDN6Imb42TJBjeF/sJOYGriJaFIo3tPLqezf72m1ton/O/q5ZX
	6nS7Wtq/oW8vcb8SLk5yKwjXKEeWctX4aOqyQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=NMgcOsm1eGA0OfWjdBms+ytrIKDa3jykvt1w6z3wpeV6/iJWiaP07C+E715f3qMF9+
	qEpg8ADkCde6bC7dsqvIPPqdLz3M9VOKdDur2XrZMupWKZqUOH+3NOQXiPF5G9uIzWcI
	lnhqCPLxTXeUlriYRcFLmMU7avt7xVyFMyswE=
Received: by 10.223.73.199 with SMTP id r7mr666858faj.118.1306402306595;
	Thu, 26 May 2011 02:31:46 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id e15sm211966faa.47.2011.05.26.02.31.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 May 2011 02:31:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2011 11:31:35 +0200
Message-Id: <1306402295-14048-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
Subject: [PATCH] rm_work: keep all sigdata files in stamps dir
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
X-List-Received-Date: Thu, 26 May 2011 09:34:50 -0000

* this makes fix for [YOCTO #1074] in bitbake 139b8a625818225c358a1b8363518d7ed6913188
  much more usefull for people using rm_work

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/rm_work.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 256a202..303d47d 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -42,6 +42,10 @@ do_rm_work () {
             *do_setscene*)
                 break
                 ;;
+            *sigdata*)
+                i=dummy
+                break
+                ;;
             *do_package_write*)
                 i=dummy
                 break
-- 
1.7.5.rc3



