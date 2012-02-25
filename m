Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S15Oc-0006Kb-83
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Feb 2012 01:21:54 +0100
Received: by eekd41 with SMTP id d41so1370039eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 16:13:31 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.102.1 as permitted sender) client-ip=10.213.102.1; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.102.1 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.102.1])
	by 10.213.102.1 with SMTP id e1mr1377700ebo.20.1330128811379 (num_hops
	= 1); Fri, 24 Feb 2012 16:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=v67xogjvGWGgJIYuRySHFBG3fbbusj+g+ETPlRUkY/c=;
	b=NpTDsh3ygBBRtTkeztZ31xSvxUL6hnkN5+GZfA+witVHmms71li9VJdL4dNP0ng00H
	IRBsYGi2A3ECNd+Me72nbhZp+jrZkKBaSSfdZWfrT/zOssLhGcGODsOv2iECF3/tWpKu
	syTSsCkHq6XTMPWWsIiPQ8acaT48eeyOpJSJY=
Received: by 10.213.102.1 with SMTP id e1mr1019655ebo.20.1330128811259;
	Fri, 24 Feb 2012 16:13:31 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y14sm24179696eef.10.2012.02.24.16.13.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 16:13:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Feb 2012 01:13:23 +0100
Message-Id: <1330128803-26445-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [PATCH] layer.conf: add keymaps to SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Sat, 25 Feb 2012 00:21:54 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/layer.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index dac9c97..93c087a 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -27,4 +27,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   xserver-xf86-config \
   pointercal \
   base-files \
+  keymaps \
 "
-- 
1.7.8.4



