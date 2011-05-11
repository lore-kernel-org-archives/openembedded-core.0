Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QK1C4-0005K0-5A
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 06:38:40 +0200
Received: by mail-pv0-f175.google.com with SMTP id 30so77336pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 21:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=cygWR7HIQm/GfismZ1ajIMVpwWti7XVP4YSJSWlU/AA=;
	b=Og7axNdmW7jOb+fZNwi2nTWgUyrLqt/8HUo7aHA92vsq183BjqsRMPrGNEo/pek/hb
	+anLSzwW7tNenmspAqpWW+0N15NhCtNWu05QSMe8BGWXE1eN2kHtKtRmwGH5yrF8a2jS
	rodU59pZSof18+Sej9WxhHsE7uiDv/lVmahOE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=drrFd/3DvqJZIOjkEwBPdwx9ywtb+YXBQ0Qa6ooSKRfdBx9xoyG0sBN9Nelx3+3xOC
	NjwYQKWtVTo+WUT52ajU08ukifg2oBsUux8+tlGaQdMtv5eg+rtGNgfHVlBZhx+oET71
	3TwBy2fumA1oxRoMMGvsoX2V0UcYF5O7TO2lM=
Received: by 10.68.66.101 with SMTP id e5mr2538632pbt.447.1305088555517;
	Tue, 10 May 2011 21:35:55 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x8sm5257168pbp.27.2011.05.10.21.35.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 21:35:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2011 21:35:52 -0700
Message-Id: <b04796a2532bb3f1533fe2dd5f101eab34098188.1305088327.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1305088327.git.raj.khem@gmail.com>
References: <cover.1305088327.git.raj.khem@gmail.com>
Subject: [PATCH 2/2] meta/conf/layer.conf: Remove packages/*bb from BBFILES
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
X-List-Received-Date: Wed, 11 May 2011 04:38:41 -0000

packages directory has been divided into recipes-*/ dirs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/layer.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 3f63c7d..ad95405 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -2,7 +2,7 @@ BBPATH ?= ""
 # We have a conf and classes directory, add to BBPATH
 BBPATH .= ":${LAYERDIR}"
 # We have a packages directory, add to BBFILES
-BBFILES += "${LAYERDIR}/packages/*/*.bb ${LAYERDIR}/recipes-*/*/*.bb"
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb"
 
 BBFILE_COLLECTIONS += "normal"
 BBFILE_PATTERN_normal := "^${LAYERDIR}/"
-- 
1.7.4.1



