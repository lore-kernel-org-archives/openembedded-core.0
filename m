Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TeSXl-00066d-7R
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 16:30:44 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so507830lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 07:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=U6TeVtAO10/Kkm4Upno9LqXlrzuT6eVJ9uhSY973xFk=;
	b=i8v84+XcKp9CwPdqEKItMDLk44uTRMAgur96px7343t9IoruKi/nAyqFBpzsK06bEx
	Cvf0iVQWOmIeTgGWS4AfCzm/XcMGp1Rpf8b8WVHi5px6988dV9LS/O18RMwpvIsvG0mI
	BSCbyHBQLpf2+bDI4575z1MNQfC4p8nh2n12NsGxxH/LzJLlfqrPYx/B14zmGTA4cPla
	TZ0YLdQPsjYCCF8oLsradca+fYMFumLgRD+KVOjbdNLr1qpUQsldRyQRDfNFHCjZUE0P
	/V6fAyGfA9mLWGyGgi+c72wBhPosG1mJer+Ioi9wTSGuq9xjAOADhXacFtwXdtoT3npN
	TxiQ==
Received: by 10.152.135.139 with SMTP id ps11mr1572075lab.29.1354288566061;
	Fri, 30 Nov 2012 07:16:06 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id l1sm2218899lbm.1.2012.11.30.07.16.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Nov 2012 07:16:04 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TeSJr-00032H-SH; Fri, 30 Nov 2012 17:15:59 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 17:15:44 +0200
Message-Id: <1354288544-10778-11-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1354288544-10778-10-git-send-email-cazfi74@gmail.com>
References: <1354288544-10778-1-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-2-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-3-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-4-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-5-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-6-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-7-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-8-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-9-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-10-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 10/10] xorg-app: fix license segment md5sum boundary
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
X-List-Received-Date: Fri, 30 Nov 2012 15:30:52 -0000

Replaced incorrect "startline" with correct "beginline" for telling
where license segment in file begins. This change has no effect on
md5sum as license segments from the beginning of the file.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-graphics/xorg-app/xev_1.2.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-app/xev_1.2.0.bb b/meta/recipes-graphics/xorg-app/xev_1.2.0.bb
index 8d45e2e..5248ea1 100644
--- a/meta/recipes-graphics/xorg-app/xev_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-app/xev_1.2.0.bb
@@ -1,5 +1,5 @@
 require xorg-app-common.inc
-LIC_FILES_CHKSUM = "file://xev.c;startline=0;endline=35;md5=2f39a0038b59269c1e62efae64cfd056"
+LIC_FILES_CHKSUM = "file://xev.c;beginline=1;endline=35;md5=2f39a0038b59269c1e62efae64cfd056"
 DESCRIPTION = "X Event Viewer"
 LICENSE = "MIT"
 PE = "1"
-- 
1.7.10.4



