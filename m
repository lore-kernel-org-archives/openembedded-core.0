Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 882D573BB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 01:58:26 +0000 (UTC)
Received: by iggp10 with SMTP id p10so3536725igg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 18:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QW3sFHz42usuFuAqDYIu+EjegJJB66nzqybqZ3o4CUI=;
	b=iCV85ybprBV0rq6L/5SnhXFlThPptGXSbAguwCtS1c51W9Ik5Ta9DS9NL4jNQoexM/
	hDc/k7kVcrxrm8Z5Jz4h/EtQKnaGEfv+6tHngLg/QGZTP/COZo0hBBGJ0ktbaJYArI8k
	xbD9mef3VJ8OlqzAeNO10fRnGP5P+ho5mFbTtlgy6mlf+xgLkNZ5aN7SBQ+z8bmuM1Qq
	s2v7u55lVXU9CfG6ZcQN5hpGzERafui7OfAklk+5UFDUd42YK78VgRMQASzqzbgcSFNM
	Rh7vwZ9WLKlDHFOpZWQ9/xYtzLCm3ZdClDfVUlWxuAnBM6N3gRIxAfap3C6z0YbUj0Zd
	Sbsg==
X-Received: by 10.107.167.2 with SMTP id q2mr9518801ioe.109.1437011906334;
	Wed, 15 Jul 2015 18:58:26 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id x4sm4042784iod.26.2015.07.15.18.58.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Jul 2015 18:58:25 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jul 2015 18:58:06 -0700
Message-Id: <1437011888-12736-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1437011888-12736-1-git-send-email-armccurdy@gmail.com>
References: <1437011888-12736-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/3] libcap: always link apps dynamically
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jul 2015 01:58:29 -0000

Without the explicit over-ride, apps will be linked statically
if a .git directory is found in the top level source directory.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/libcap/libcap_2.24.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libcap/libcap_2.24.bb b/meta/recipes-support/libcap/libcap_2.24.bb
index f50dc94..e8ae7ce 100644
--- a/meta/recipes-support/libcap/libcap_2.24.bb
+++ b/meta/recipes-support/libcap/libcap_2.24.bb
@@ -36,6 +36,7 @@ EXTRA_OEMAKE = " \
   INDENT=  \
   lib=${@os.path.basename('${libdir}')} \
   RAISE_SETFCAP=no \
+  DYNAMIC=yes \
 "
 
 EXTRA_OEMAKE_append_class-target = " SYSTEM_HEADERS=${STAGING_INCDIR}"
-- 
1.9.1


