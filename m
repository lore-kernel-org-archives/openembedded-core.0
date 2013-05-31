Return-Path: <kergoth@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id C58DC6A4D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 02:26:30 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id fb19so1992229obc.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 19:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=arKic9jZD+dn6UrVVbxTmD+SYa2Pw1fBfo+tf6GlPWs=;
	b=FHKd+nWVkbFSe0g8YYb/0vTVdsGeJVXPaxl1sohCauJivM0Auw+kCF4J2n1u82s1TB
	kOb6qivddXVozUiW0crdoB0YlzeDtAYbiLTo2rXxlUJHMWTMhnyrO/xUoL/YSFohduyt
	H0MHNc/9mwF14A6LvCUEM+1RkuFhY/jsStmFdn8NTKZaic3pUgUEMg7GzLNi4q91XgPl
	fFsHjrGSSjPKobtQ0QK+bZlj96E/k8RpW/igSRo1c1kEWuASFOOpNYtwElpwT9uT8j9N
	yF3RkzaLOb6ybLgKF2t1eLLgkHCildAhoX83LtD6uN/8Xeel+uwNtBZQu2JaQt/LSZxj
	xRzg==
X-Received: by 10.60.16.69 with SMTP id e5mr5136274oed.46.1369967191331;
	Thu, 30 May 2013 19:26:31 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id sa2sm14397164oeb.1.2013.05.30.19.26.29
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 19:26:30 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 19:26:25 -0700
Message-Id: <aa9b6859af6fc1783f88fd3696b96ab6d3a7d693.1369967097.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1369967097.git.chris_larson@mentor.com>
References: <cover.1369967097.git.chris_larson@mentor.com>
In-Reply-To: <cover.1369967097.git.chris_larson@mentor.com>
References: <cover.1369967097.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/5] rpcbind: obey 'tcp-wrappers' PACKAGECONFIG
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
X-List-Received-Date: Fri, 31 May 2013 02:26:31 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
index 1007613..f4a0367 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
@@ -29,6 +29,9 @@ PR = "r4"
 
 inherit autotools update-rc.d
 
+PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
+
 INITSCRIPT_NAME = "rpcbind"
 INITSCRIPT_PARAMS = "start 43 S . start 32 0 6 . stop 81 1 ."
 
-- 
1.8.3


