Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5527073EFD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 02:13:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4C2DuKv017989
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 19:13:56 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 11 May 2015 19:13:55 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 May 2015 19:13:54 -0700
Message-ID: <37d60010ba7e3f90761dc8d7a83c66eda3382481.1431396786.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1431396786.git.liezhi.yang@windriver.com>
References: <cover.1431396786.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] lttng-tools: separate B and S
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
X-List-Received-Date: Tue, 12 May 2015 02:13:55 -0000
Content-Type: text/plain

It works well with autotools now.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
index 8cc4220..d1c6293 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
@@ -31,7 +31,9 @@ SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.6 \
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep ptest pkgconfig useradd
+inherit autotools ptest pkgconfig useradd
+
+PR = "r1"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "tracing"
-- 
1.7.9.5


