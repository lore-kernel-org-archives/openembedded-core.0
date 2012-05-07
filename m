Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRVOF-0007O1-R8
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 23:22:44 +0200
Received: by wibhj13 with SMTP id hj13so8209wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2012 14:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=EeFzQ2mAspqykZvf/JbeSMfg5KFss4pK0wHEMkja4ec=;
	b=KZ0JP7ccquIZD4iPHX/khXaMnqvJMGwA7tzX6uX5sq7Vr3vBpMVYgxM1f9s3xdnFXf
	HA3es3jxvPrRmPY6Bj9trl3IWfwSOxCEkbB2Bue6G2V6jDJxDkCaHGyiamwja6jIL5NU
	7r6rH2iPd+PTq9GA6mo9qVO4dt3idXe4MdsXfGht/bL+O953Bzhi41dYMgAoDX1nvg03
	2SsDOVOO+1BGbYyjheevg2+FmCRnPofKEXk02Z3wk+lKpwJw3LmdUzIorGL0w367Jon5
	0waVYl9BNOnd9z3sP6C1gmj4vKhnzC+ivhHkyfLjC4xyM6joltzrtjrSQBX/7nx+JoAt
	LuXw==
Received: by 10.180.107.101 with SMTP id hb5mr38796052wib.7.1336425173272;
	Mon, 07 May 2012 14:12:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fm1sm23911239wib.10.2012.05.07.14.12.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 14:12:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 May 2012 23:12:43 +0200
Message-Id: <1336425164-5991-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <CA+chaQem7Wiba2MLqkANC-retpk7WBre7gUpAtJsXF+b5P43aw@mail.gmail.com>
References: <CA+chaQem7Wiba2MLqkANC-retpk7WBre7gUpAtJsXF+b5P43aw@mail.gmail.com>
Subject: [PATCH 1/2] kmod: include libkmod also from libdir
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
X-List-Received-Date: Mon, 07 May 2012 21:22:44 -0000

* until it's decided it should be installed in base_libdir or libdir
* fixes libkmod packaging

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/kmod/kmod_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index 1ab9f44..8178f1c 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -54,5 +54,5 @@ pkg_prerm_kmod() {
 
 PACKAGES =+ "libkmod"
 
-FILES_libkmod = "${base_libdir}/libkmod*${SOLIBS}"
+FILES_libkmod = "${base_libdir}/libkmod*${SOLIBS} ${libdir}/libkmod*${SOLIBS}"
 FILES_${PN} += "${base_libdir}/depmod.d ${base_libdir}/modprobe.d"
-- 
1.7.8.6



