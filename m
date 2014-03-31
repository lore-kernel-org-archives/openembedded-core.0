Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BB66B6F902
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 17:56:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2VHuhrX016730
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 31 Mar 2014 10:56:43 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 31 Mar 2014 10:56:43 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 31 Mar 2014 13:56:32 -0400
Message-ID: <e6015802086cbf8199d112a3e75a7391a417ede6.1396288310.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1396288310.git.bruce.ashfield@windriver.com>
References: <cover.1396288310.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] libc-headers: set TC default to 3.14
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
X-List-Received-Date: Mon, 31 Mar 2014 17:56:44 -0000
Content-Type: text/plain

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index d6a626cfab8c..300deeaf5fb9 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.24"
 EGLIBCVERSION ?= "2.19"
 UCLIBCVERSION ?= "0.9.33+git%"
-LINUXLIBCVERSION ?= "3.10"
+LINUXLIBCVERSION ?= "3.14"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"
-- 
1.8.1.2


