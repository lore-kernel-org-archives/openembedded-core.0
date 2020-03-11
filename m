Return-Path: <tgamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 06DF061B44
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 11:33:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02BBWjVG012390
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 11 Mar 2020 04:33:00 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.487.0;
	Wed, 11 Mar 2020 04:32:35 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20958)	id 2A8F1900B0F;
	Wed, 11 Mar 2020 04:32:35 -0700 (PDT)
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Mar 2020 04:32:35 -0700
Message-ID: <20200311113235.61655-3-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311113235.61655-1-trevor.gamblin@windriver.com>
References: <20200311113235.61655-1-trevor.gamblin@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2 v5] ptest-packagelists.inc: add coreutils to SLOW
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
X-List-Received-Date: Wed, 11 Mar 2020 11:33:27 -0000
Content-Type: text/plain

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index d6f3aafc7f..c13ff724b1 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -66,6 +66,7 @@ PTESTS_SLOW = "\
     babeltrace-ptest \
     babeltrace2-ptest \
     busybox-ptest \
+    coreutils-ptest \
     dbus-test-ptest \
     e2fsprogs-ptest \
     glib-2.0-ptest \
-- 
2.17.1


