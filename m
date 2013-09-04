Return-Path: <Paul_Woegerer@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 1DDF46BCA4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 12:51:58 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1VHCYy-00031C-AC from Paul_Woegerer@mentor.com ;
	Wed, 04 Sep 2013 05:52:00 -0700
Received: from SVR-IES-FEM-02.mgc.mentorg.com ([137.202.0.106]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 4 Sep 2013 05:52:00 -0700
Received: from atv-pwoegere-l3.atv.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-02.mgc.mentorg.com (137.202.0.106) with Microsoft SMTP
	Server id 14.2.247.3; Wed, 4 Sep 2013 13:51:58 +0100
From: "Woegerer, Paul" <Paul_Woegerer@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Sep 2013 14:51:57 +0200
Message-ID: <2038889.UofUo7Kta6@atv-pwoegere-l3.atv.mentorg.com>
Organization: Mentor Graphics, Embedded Software Division
User-Agent: KMail/4.11 (Linux/3.10.10-25.g8038aea-desktop; KDE/4.11.0; x86_64; ;
	)
MIME-Version: 1.0
X-OriginalArrivalTime: 04 Sep 2013 12:52:00.0146 (UTC)
	FILETIME=[8BBFDF20:01CEA96D]
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/3] lttng-modules: Update to version 2.3.0
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
X-List-Received-Date: Wed, 04 Sep 2013 12:51:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

---
 meta/recipes-kernel/lttng/lttng-modules_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_git.bb b/meta/recipes-kernel/lttng/lttng-modules_git.bb
index 9959a74..789b5ec 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_git.bb
@@ -10,8 +10,8 @@ DEPENDS = "virtual/kernel"
 
 inherit module
 
-SRCREV = "10fe4e3f10c9ce1f2963bd118b91895a67e955ee"
-PV = "2.2.1+git${SRCPV}"
+SRCREV = "78c8710bb8e6b7f6301d95afec0305f40fa063ad"
+PV = "2.3.0+git${SRCPV}"
 
 SRC_URI = "git://git.lttng.org/lttng-modules.git \
            file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
-- 
1.8.4



