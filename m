Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id EA3EC60112
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 22:44:13 +0000 (UTC)
Received: by ioir85 with SMTP id r85so138586878ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7eKZuS+7kgVvLsrKaKby13Auc8qrSSU8DUUBled/a+s=;
	b=fHo/0GgHLLzs1FEF8mOpciiEJdHeHmRSzoOVXBRqnzchPvieCZrvLcgwKHtjQ6crMK
	NqMBlAvyUazWYBQqyce+TCAumctXUVC4KocBGrBJQveVZ7kthaZzvvhmQKzGxKSVE8FT
	HnPT8PlZzIKDgWBNfFbhWZW2hkLgeb+lsOCxy8Vu75ajK6hCF7uGY/ABhx0aWXG8bJ+4
	HRDacL/n43aat2aJICbhgcONB559Vxr5l7xeJa2aRelc7igh0o3HHaoaQtjI173SSMK+
	TsfHqMdr9YtIecuiMbt85uDn7qKBsXUoJqzM/9SRESK5z1ClJFB4CU6NBfKAvqfsrfIJ
	C0VA==
X-Received: by 10.107.136.75 with SMTP id k72mr17390858iod.8.1448059454438;
	Fri, 20 Nov 2015 14:44:14 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id p79sm677008ioi.15.2015.11.20.14.44.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Nov 2015 14:44:13 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 14:43:48 -0800
Message-Id: <1448059438-24431-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448059438-24431-1-git-send-email-armccurdy@gmail.com>
References: <1448059438-24431-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 01/11] busybox_git: Enable getopt applet
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
X-List-Received-Date: Fri, 20 Nov 2015 22:44:14 -0000

Keep git recipe in sync with 1.23.2:

  http://git.openembedded.org/openembedded-core/commit/?id=10c2c484d5916ad476ad7717c3629f6684f01e6d

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index ade72f4..ed1c0a8 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -41,6 +41,7 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://mount-via-label.cfg \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
+           file://getopts.cfg \
 "
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
-- 
1.9.1


