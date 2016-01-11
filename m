Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6BBDB73257
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 15:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0BF17xY003661; Mon, 11 Jan 2016 15:01:07 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id guFT-2AhPm0M; Mon, 11 Jan 2016 15:01:07 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0BF12rL003646
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 11 Jan 2016 15:01:03 GMT
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1aIdxu-0008D5-Ra; Mon, 11 Jan 2016 15:01:02 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jan 2016 15:00:59 +0000
Message-Id: <1452524461-31509-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1452524461-31509-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1452524461-31509-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/5] lttng-tools: Upgrade to 2.7.1
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
X-List-Received-Date: Mon, 11 Jan 2016 15:01:09 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/lttng/lttng-tools_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_git.bb b/meta/recipes-kernel/lttng/lttng-tools_git.bb
index 4c42251..e68e7f3 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_git.bb
@@ -13,8 +13,8 @@ DEPENDS = "liburcu popt lttng-ust libxml2"
 RDEPENDS_${PN} = "libgcc"
 RDEPENDS_${PN}-ptest += "make perl bash"
 
-SRCREV = "d71e55a5f1f423eeaa47c08e5797e47ce8e825fb"
-PV = "2.7.0+git${SRCPV}"
+SRCREV = "a90f2c1e10b759782653a81815625e9d1bbb75ca"
+PV = "2.7.1+git${SRCPV}"
 
 PYTHON_OPTION = "am_cv_python_pyexecdir='${libdir}/python${PYTHON_BASEVERSION}/site-packages' \
                  am_cv_python_pythondir='${libdir}/python${PYTHON_BASEVERSION}/site-packages' \
-- 
2.5.0


