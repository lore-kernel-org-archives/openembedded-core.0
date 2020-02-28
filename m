Return-Path: <tgamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7A12D61963
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 14:49:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01SEnT0Q019599
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 06:49:30 -0800 (PST)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 28 Feb 2020 06:49:29 -0800
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20958)	id 6B9A39008D7;
	Fri, 28 Feb 2020 06:49:29 -0800 (PST)
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Feb 2020 06:49:29 -0800
Message-ID: <20200228144929.164927-3-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228144929.164927-1-trevor.gamblin@windriver.com>
References: <20200228144929.164927-1-trevor.gamblin@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2 v4] ptest-packagelists.inc: add coreutils to SLOW list
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
X-List-Received-Date: Fri, 28 Feb 2020 14:49:29 -0000
Content-Type: text/plain

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 4afac58e3a..54ace39d53 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -65,6 +65,7 @@ PTESTS_FAST = "\
 PTESTS_SLOW = "\
     babeltrace-ptest \
     busybox-ptest \
+    coreutils-ptest \
     dbus-test-ptest \
     e2fsprogs-ptest \
     glib-2.0-ptest \
-- 
2.24.1


