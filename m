Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0b4S-00041M-Fq
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 16:59:04 +0100
Received: by eaal10 with SMTP id l10so631617eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 07:50:43 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.16.141 as permitted sender) client-ip=10.213.16.141; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.16.141 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.16.141])
	by 10.213.16.141 with SMTP id o13mr593024eba.88.1330012243048 (num_hops
	= 1); Thu, 23 Feb 2012 07:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=gfxErkC8HHZn5Vf+V3LjFtU0NtIqF00CF/Yvb+p9Ryk=;
	b=QLiQ+B4hlq2DBvCuFOK58vIQZOyiCorVUkXkUGC9okfwvBEBL8kkqHgK81s4crBT1k
	9VoDTy2jFL3KdWnGGIqCsSZfAujWzQNjcCOBT7/CFbIHL1s+wcwE+1Dz3LXbnU250vDv
	WLqAEBt+QP0HpyaDaRIDd2HBqAsI6YP0ouHx8=
Received: by 10.213.16.141 with SMTP id o13mr468430eba.88.1330012242954;
	Thu, 23 Feb 2012 07:50:42 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y14sm6617444eef.10.2012.02.23.07.50.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 07:50:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 16:50:25 +0100
Message-Id: <b782bbb18867b542d2460179819671d0d431cc12.1330012029.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <3a155936ed32d2296f38a499c41490f215b6fb4d.1330012029.git.Martin.Jansa@gmail.com>
References: <3a155936ed32d2296f38a499c41490f215b6fb4d.1330012029.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330012029.git.Martin.Jansa@gmail.com>
References: <cover.1330012029.git.Martin.Jansa@gmail.com>
Subject: [PATCH 09/11] sstate.bbclass: add *_config to SSTATE_SCAN_FILES
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
X-List-Received-Date: Thu, 23 Feb 2012 15:59:04 -0000

* e.g. mysql5 has mysql_config not mysql-config

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/sstate.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index d4f95c1..ee9bf05 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -10,7 +10,7 @@ SSTATE_PKGSPEC    = "sstate-${PN}-${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}-$
 SSTATE_PKGNAME    = "${SSTATE_PKGSPEC}${BB_TASKHASH}"
 SSTATE_PKG        = "${SSTATE_DIR}/${SSTATE_PKGNAME}"
 
-SSTATE_SCAN_FILES ?= "*.la *-config"
+SSTATE_SCAN_FILES ?= "*.la *-config *_config"
 SSTATE_SCAN_CMD ?= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES", True).split())}" \) -type f'
 
 BB_HASHFILENAME = "${SSTATE_PKGNAME}"
-- 
1.7.8.4



