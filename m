Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T88Iu-0005P9-5b
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Sep 2012 13:25:24 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so2557607wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Sep 2012 04:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Xdpj5EKiPdMIZviZzxvgffGDd3qblUVEP8E//S4olm0=;
	b=UDqmoHjnRCB8ycVC2XYAoSHFIvXTuFPkvrGA5d3a2iTwDMllP0R+XY0CYdA+91MBbf
	lKfDfZ3kUBRfjZ3KGiA1y29uVZbnW26Cpe32HEs3YMWHw8IFIsV51Ch2uw2Pc4D97bV9
	rlgGns0r1e49raHIdgrzBb5zUmcf65jQaJr/abpo16e4b06mv3PaP/y+c3qTzjRKK+py
	z3SffVaBaTl1kcfSuKm7fmjMduYKqq66tWSg5zY6zlqTWcpdqq3N9v+RohIPWDEIq/rc
	Vc5LcIAXn6OcxvjJg1YcYSUzKBN67B38sxJrsK6KMa8YTnygrsiD7PSZN+VpsaYV9tHb
	IQsg==
Received: by 10.180.76.36 with SMTP id h4mr16292511wiw.13.1346584387367;
	Sun, 02 Sep 2012 04:13:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm12634313wiz.4.2012.09.02.04.13.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 02 Sep 2012 04:13:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Sep 2012 13:13:18 +0200
Message-Id: <517f4cc25674ace1c52775119331777e40a13d1d.1346584261.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1346584261.git.Martin.Jansa@gmail.com>
References: <cover.1346584261.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346584261.git.Martin.Jansa@gmail.com>
References: <cover.1346584261.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/4] sstate-cache-management.sh: fix regexp in checksum grep
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
X-List-Received-Date: Sun, 02 Sep 2012 11:25:24 -0000

* using checksum without recipe/task name doesn't seem like good idea IMHO

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-cache-management.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index a1f7c89..2b3100c 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -292,7 +292,7 @@ rm_by_stamps (){
 
   echo -n "Figuring out the files which will be removed ... "
   for i in $all_sums; do
-      grep ".*-${i}_*" $cache_list >>$keep_list
+      grep ".*-${i}_.*" $cache_list >>$keep_list
   done
   echo "Done"
 
-- 
1.7.12



