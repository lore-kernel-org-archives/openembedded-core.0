Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3233D6E446
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 17:56:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2VHugVb017306
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 31 Mar 2014 10:56:42 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 31 Mar 2014 10:56:42 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 31 Mar 2014 13:56:31 -0400
Message-ID: <bec352b1fa3311670cc4dd25dbce6bf0d2a57832.1396288310.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1396288310.git.bruce.ashfield@windriver.com>
References: <cover.1396288310.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-libc-headers: add 3.14 libc headers
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
X-List-Received-Date: Mon, 31 Mar 2014 17:56:43 -0000
Content-Type: text/plain

Introduce the 3.14 linux-libc-headers recipe, now that the 3.14 kernel is
available, and the default for the qemu reference BSPs.

The three patches which were required for the previous 3.10 libc-headers
are not required for 3.14 and can be ignored.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.14.bb | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.14.bb

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.14.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.14.bb
new file mode 100644
index 000000000000..9ac70af942a1
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.14.bb
@@ -0,0 +1,7 @@
+KORG_ARCHIVE_COMPRESSION = "xz"
+
+require linux-libc-headers.inc
+
+SRC_URI[md5sum] = "b621207b3f6ecbb67db18b13258f8ea8"
+SRC_URI[sha256sum] = "61558aa490855f42b6340d1a1596be47454909629327c49a5e4e10268065dffa"
+
-- 
1.8.1.2


