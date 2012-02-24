Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S129E-0001p5-Rl
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 21:53:48 +0100
Received: by eekd41 with SMTP id d41so1307465eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 12:45:25 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.199.193 as permitted sender) client-ip=10.14.199.193; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.199.193 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.199.193])
	by 10.14.199.193 with SMTP id x41mr2442512een.29.1330116325909
	(num_hops = 1); Fri, 24 Feb 2012 12:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=lfvywPsY0VfbBSQJLRrSRjf9M031QFBsAbF9JJiC8JI=;
	b=OadxCBIaxETNtdg2r86KUf3DeBnrs/A5FX/UscpR5M8VDcxNHdCUd4uLOTT6UdFmS3
	Ns/ZUkNg7TojKbqgUP8emgNSfMBxtBSm20NuUypPsFVwEv+MIa8htvm7yn/HyFfG5e6V
	gQaJqjZyh1fCAlchmzsZNt1CAc7Bo4pPk6cAI=
Received: by 10.14.199.193 with SMTP id x41mr1811140een.29.1330116325806;
	Fri, 24 Feb 2012 12:45:25 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r5sm9894408eef.6.2012.02.24.12.45.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 12:45:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2012 21:45:16 +0100
Message-Id: <1330116316-3304-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [PATCH] layer.conf: use += for SIGGEN_EXCLUDERECIPES_ABISAFE and split to multiple lines
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
X-List-Received-Date: Fri, 24 Feb 2012 20:53:48 -0000

* += is important, because if oe-core is in BBLAYERS after some other
  layers with SIGGEN_EXCLUDERECIPES_ABISAFE it overwrites their entries

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/layer.conf |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index c0c2930..dac9c97 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -18,4 +18,13 @@ PATH := "${PATH}:${COREBASE}/scripts"
 
 QEMUIMAGETESTS := "${COREBASE}/scripts/qemuimage-tests"
 
-SIGGEN_EXCLUDERECIPES_ABISAFE = "sysvinit-inittab shadow-securetty opkg-config-base netbase formfactor xserver-xf86-config pointercal base-files"
+SIGGEN_EXCLUDERECIPES_ABISAFE += " \
+  sysvinit-inittab \
+  shadow-securetty \
+  opkg-config-base \
+  netbase \
+  formfactor \
+  xserver-xf86-config \
+  pointercal \
+  base-files \
+"
-- 
1.7.8.4



