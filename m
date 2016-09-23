Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 075B160110
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 11:14:50 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id b71so4705940lfg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 04:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cNIJoR6/AM7eEWyJ8wZ4lRoizwwYkZCLv1TySNDK4+8=;
	b=pf8AlHa/oWmR0YukUnWsAsFJoea/heIqpq5Y3IElc5LG2oEaGgZkiD+qssSfzOjNWf
	FLOFPagzxzYpsBegaEAQTaEv+VNb9Tkooxp5hQAy58eU401rKtFea/y5fftkYfUMVZ/U
	BcSzAfk5oyNEPIe2KvBYvEXPxU7XcFRJRjVbSYydTs1gZ2MCqLyo5YIzZ55ag//hzXRF
	ilzCt4xkl3L4eLOGuRqEwaRgZSHDJCi7XWhVQHzdLsM6xkWQM5jV8TYH5WI6peIg4DMn
	HhYo/1AS3CHxGheercWhKTbBFrd/Y7tb759ovON4Vrc2wyvoKeXV3kTDlTYUCHjp5qDQ
	9mGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cNIJoR6/AM7eEWyJ8wZ4lRoizwwYkZCLv1TySNDK4+8=;
	b=aBzYGChQWIrmYZyuJHMrVltV59D5LLE1gmFBs+LJdz68PyEnNSnf1r351XMSXkI+wa
	vFQX9W+SQFZdrm06uLMg7+MFAr+/o3PlL1xBkQAYybCNzqVS261oWjLhB4FUtOYEKCYN
	1vOIcdU+xRzwbADsrUQPeaZJr8LkQB5A4snOiK/BVYhyamLx7W8IJ+/YYFBGnrq87aAc
	SXDSObPvuwffdM64RkoxB9OCcqY1SbyvNyT2lP2aMo7GRI38QYind31qCj9HVsgvG//y
	g3lbHL9J/zehFXzyLInk3bsuGAR9jhte4ASl2PgEDeTOrCY8bneiNv/R8tpO0Veo6arS
	gBLA==
X-Gm-Message-State: AE9vXwMOq1BLoQXxqYuwt9AbBT1gd1rMfzKmWODMQ3IPrepSl7cDtk35uBI+waFDM+B6Ew==
X-Received: by 10.25.215.35 with SMTP id o35mr2361765lfg.40.1474629291694;
	Fri, 23 Sep 2016 04:14:51 -0700 (PDT)
Received: from localhost.localdomain (m77-218-246-7.cust.tele2.se.
	[77.218.246.7])
	by smtp.gmail.com with ESMTPSA id 4sm1079969ljb.10.2016.09.23.04.14.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Sep 2016 04:14:50 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 13:14:48 +0200
Message-Id: <1474629288-1221-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] lttng-tools: adds DEPENDS to util-linux
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
X-List-Received-Date: Fri, 23 Sep 2016 11:14:52 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

lttng-utils rdepends on util-linux-libuuid, this fixes a do_package_qa
QA warning.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-kernel/lttng/lttng-tools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_git.bb b/meta/recipes-kernel/lttng/lttng-tools_git.bb
index 84cac84..ab75a37 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
                     file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
 
-DEPENDS = "liburcu popt libxml2"
+DEPENDS = "liburcu popt libxml2 util-linux"
 RDEPENDS_${PN} = "libgcc"
 RDEPENDS_${PN}-ptest += "make perl bash"
 
-- 
1.9.1


