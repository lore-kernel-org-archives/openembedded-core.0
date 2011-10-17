Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RFmF5-00058t-Pu
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 14:24:32 +0200
Received: by bkat8 with SMTP id t8so5703376bka.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 05:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=RlHaJDoZL61LVQuwv0AiBnE69Kq/fVFMCC/TPjU7mtE=;
	b=dLWke4RMim1+66IVZPEDU/WF+1eakOt6BtNhQlWUXzdCpA9T3jN/S+dzKnaE8a2nWy
	gwEMM2S0NmCyCsMmi/Pqx+DwMYnVQUC/Ka4f/OTk9VwxdojEL1SO+8h8GJCq6vcgwoqm
	89JfAX9je78xXvvQ8itXFfuPKtYBJJOPkCQno=
Received: by 10.204.132.199 with SMTP id c7mr14225280bkt.45.1318853923251;
	Mon, 17 Oct 2011 05:18:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm16952817bkv.8.2011.10.17.05.18.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 05:18:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2011 14:18:28 +0200
Message-Id: <1318853908-5984-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1318849592.21775.0.camel@ted>
References: <1318849592.21775.0.camel@ted>
Subject: [PATCH] mesa-dri: use DRIDRIVERS_append_arch to promote right usage for BSP layer maintainers
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
X-List-Received-Date: Mon, 17 Oct 2011 12:24:32 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-dri.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index 795144a..fcce259 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -5,8 +5,8 @@ LIB_DEPS += "libdrm expat"
 DEFAULT_PREFERENCE = "-1"
 
 DRIDRIVERS = "swrast"
-DRIDRIVERS_x86 = "swrast,i915,i965"
-DRIDRIVERS_x86-64 = "swrast,i915,i965"
+DRIDRIVERS_append_x86 = ",i915,i965"
+DRIDRIVERS_append_x86-64 = ",i915,i965"
 
 EXTRA_OECONF += "--with-driver=dri --disable-egl --disable-gallium --without-gallium-drivers --with-dri-drivers=${DRIDRIVERS}"
 
-- 
1.7.7



