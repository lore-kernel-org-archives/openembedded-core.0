Return-Path: <logyourself@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 204077953C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 08:31:53 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id z4-v6so2229285pgv.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 01:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=v+1rTE+7i4dpgB7bKekry0h7g9rp8OBeGDdcMxljwEo=;
	b=RFsZjcjbhNnSe4bIPKHvHNNHI0jO6Pq3wJP7wfNIwjUtniuDoaXu5qtepDT4G7Ndcl
	yy30rrjzS+kmGGTa7/snu0s1M5QpTKXjbrtIlzZBKJzJsyy+eaFuQ0LAg74tilkpuG6i
	GHDe2VnsEyLczl4o2cJBcteWDI9Wzif3deUSFVtc73vXLkgYzDP/EBgdL7IE7EfiEH3p
	v/Pp8i8zB0Vf7pyD9VDkZpHXO4GFYnqeFZ7cPQa1pMeaLUr0d0yjYWHZX8vfjNjKurRK
	6IaEqT0Z2ZgXKXAge5C/PhE9UIiMScpN/MjoH7nOoUDRcPATKuk36Nt5sMnM9puMq7ty
	dloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=v+1rTE+7i4dpgB7bKekry0h7g9rp8OBeGDdcMxljwEo=;
	b=iIqTFddMAQnP9CjWEl1MJx5swrmeOfLzpMSuFIRA404X+JfL0cBOPepHWfByAf/dKP
	YugMS0sDXnXaKMYKtfr24dnFJUXS41vff2WxvE2u1FDV8TbA2ZuOlx6OzkLRtogCKN2s
	NH75IJX2XuXnr7JbWKpv2+XvsXEA22suMyWwm+aCNz9vPkW/6GK4BLqkakaed3lRfk06
	jcfNuucgmuy9uHQSAGhM0muoCyz3dKTSvYuIzdT2IGMzpWY6FvOPPmDp7475oqAkxB0F
	duGZuqrf+pJuaOAiIji6UNmA4n+Ex3ZmzcDdZAhTJc6MTYFTXbNCTkadhKTgLcP3Pzti
	giHg==
X-Gm-Message-State: AOUpUlFqTqT2WEueSbda5x6f4Wv4e4oxYZRa53ATZvGSWMy0Tc9yLKq0
	DvjtgE10aD6hOMGq/bk8LPuVUe7lDw4=
X-Google-Smtp-Source: AA+uWPwuOwbpvs+FdhwYjI5nr3Ums+7YoLflKv2tqFXqEHLQdFqFcxQP1ThJ9IoZl6+gP6jqslXzBA==
X-Received: by 2002:a63:f111:: with SMTP id
	f17-v6mr53472163pgi.87.1535013114600; 
	Thu, 23 Aug 2018 01:31:54 -0700 (PDT)
Received: from localhost.localdomain ([182.212.44.138])
	by smtp.gmail.com with ESMTPSA id
	z19-v6sm5233944pgi.33.2018.08.23.01.31.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 01:31:53 -0700 (PDT)
From: Junil Kim <logyourself@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2018 17:31:46 +0900
Message-Id: <20180823083146.15408-1-logyourself@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Junil Kim <jjunil79.kim@lge.com>
Subject: [meta-oe, morty][PATCH] ltrace_git: Update SRC_URI due to inaccessible problem
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
X-List-Received-Date: Thu, 23 Aug 2018 08:31:54 -0000

Existing URI service was closed and fetch error occurred.
Change existing repository to another mirrored SRC URI.

Signed-off-by: Junil Kim <jjunil79.kim@lge.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index 8ae018503..097723802 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -15,7 +15,7 @@ SRCREV = "01b10e191e99d8cb147e5a2b7da8196e0ec6fb94"
 
 DEPENDS = "elfutils"
 RDEPENDS_${PN} = "elfutils"
-SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git;branch=master \
+SRC_URI = "git://github.com/sparkleholic/ltrace.git;branch=master;protocol=http \
            file://configure-allow-to-disable-selinux-support.patch \
            file://0001-replace-readdir_r-with-readdir.patch \
           "
-- 
2.17.1


