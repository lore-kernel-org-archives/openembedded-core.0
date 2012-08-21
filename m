Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3f15-0005r3-50
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 05:20:31 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so8863245pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 20:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=c86Y1nqXHv4tR+Efseww1smusUO9TgnyZKd4pWa13mg=;
	b=xIfpQJbDEkQS/ugWoWt96JEcN8Jy5ez0RDVs45ZZRHduhlwC3GHqe+mhurdapZNMqQ
	MSee/MIOa6G5DJSw5+/vVX1Y2ZHTV7T05ofXiw8Tr98bnmCB/Co7tXTC2rjEO2z9JNLq
	ZPF8tXAo+M7BRYYuQe1YVmegRzoBGg8+i9VCca3r7D1b1dOoBwbkiIhsFDZU9caAwRRY
	UZFqiIXZb9K+o3RMkTSpw6aweiV5Xp17YyEmRuUX0Oi7ijs1KJ/9X9obxSN8WzGRQkbb
	DLciAdE+jceWgcLGWjZzWHOjOxUTKFbXiQBJg+bdZfr289hUVG4j8OJrP03sUSTus6cb
	vCJQ==
Received: by 10.68.195.106 with SMTP id id10mr39919071pbc.121.1345518509903;
	Mon, 20 Aug 2012 20:08:29 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id nv6sm429804pbc.42.2012.08.20.20.08.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 20:08:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 20:07:52 -0700
Message-Id: <da906fcb770ea3078876d16614a5254436887e73.1345518098.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
References: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
In-Reply-To: <cover.1345518098.git.raj.khem@gmail.com>
References: <cover.1345518098.git.raj.khem@gmail.com>
Subject: [PATCH 2/9] eglibc-2.16: Update to top of 2.16 branch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 03:20:31 -0000

Some translations and tst-gettext fixes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/eglibc/eglibc_2.16.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 3b48674..69803f7 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -1,6 +1,6 @@
 require eglibc.inc
 
-SRCREV = "19383"
+SRCREV = "19922"
 
 DEPENDS += "gperf-native"
 PR = "r6"
-- 
1.7.9.5



