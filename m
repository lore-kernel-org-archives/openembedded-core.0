Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1Yzp-0007TH-Bc
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Feb 2012 08:58:17 +0100
Received: by eekc1 with SMTP id c1so31329eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 23:49:52 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.9.148 as permitted sender) client-ip=10.213.9.148; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.9.148 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.9.148])
	by 10.213.9.148 with SMTP id l20mr2658354ebl.104.1330242592960
	(num_hops = 1); Sat, 25 Feb 2012 23:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=XsKI953RvKFDkyIK4mSdGMamTqeW1xA/fMYdWAvR0rc=;
	b=QYiwTkO56hr3z6e04auBGi7h7hYNTPTmUwXKmJPClafBO8hgyFEFFTTLvKEK4WfYCT
	vrgc5J0ily/v5rM/uIBhu+M3/8OjxzSp53Dl++btcoy+W7UGTzI0JEcdzioE/AulM0GB
	8klQwGPGIM6Dwe07EFkXYAZbDMmRXf5qyU/aw=
Received: by 10.213.9.148 with SMTP id l20mr1997274ebl.104.1330242592893;
	Sat, 25 Feb 2012 23:49:52 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y14sm41703072eef.10.2012.02.25.23.49.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 25 Feb 2012 23:49:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Feb 2012 08:49:40 +0100
Message-Id: <85003f1e060b6a4406bdde5c48fb9a09bea2ee05.1330242184.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <cover.1330242184.git.Martin.Jansa@gmail.com>
References: <cover.1330242184.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 1/5] bitbake.conf: use weak assignment for BB_CONSOLELOG
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
X-List-Received-Date: Sun, 26 Feb 2012 07:58:17 -0000

* some people prefer subdirectory like ${TMPDIR}/cooker/${DATETIME}.log

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2539ae0..55daa9e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -726,7 +726,8 @@ DISTRO[unexport] = "1"
 # Used by canadian-cross to handle string conversions on TARGET_ARCH where needed
 TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH', True).replace("_", "-")}"
 
-BB_CONSOLELOG = "${TMPDIR}/cooker.log.${DATETIME}"
+# Complete output from bitbake, if you're changing it, make sure to use existing directory
+BB_CONSOLELOG ?= "${TMPDIR}/cooker.log.${DATETIME}"
 
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "OEBasic"
-- 
1.7.8.4



