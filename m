Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 663496072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 11:56:56 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q128so10801220wma.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 04:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+EKxKrzXJr0Jhll4r1gT8i+9QAlQhzJbP0vJqJhp/rI=;
	b=DPgLScZq6Tq+ZenOv1IS1iV/iMV52St1H5sdO7OugUj5RWooeXZZADosOxGyt5zliP
	c4Hpte+D+C6qi1z54YOluOIUK3os04bGKzSeMur8mrzqOW7IlpsBskDo/sNt0waJQv2h
	9RmB8lCLUzWuUxM0TjQmfRW+jM0YS+laLdApW1ShzAmzjrFUWLtqhf7nKxliol1T6sUB
	zqAn9cqMIP5Oi6eSP8xDI1Bf/rGqme7TZ9xSHX+QhniVIMDyxofXoOivfqsySHMqum9F
	Ugp6wzvJv3FK07jWi0J2qb8StGxEaaXn+jtf6+u9u1Y8q9alSog0s341va1hAQ4aaFyp
	IDYA==
X-Gm-Message-State: AEkoouu9uymZq1ztrTyjLyhBVkDdAduvb+L3MIXUVFv7LWu+smej+4Fb2MdNWtWXxbx5pA==
X-Received: by 10.194.58.112 with SMTP id p16mr33652838wjq.24.1469707016695;
	Thu, 28 Jul 2016 04:56:56 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	yz6sm11181446wjb.35.2016.07.28.04.56.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Jul 2016 04:56:55 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2016 12:56:54 +0100
Message-Id: <1469707014-20120-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] readline: don't install readline C examples
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
X-List-Received-Date: Thu, 28 Jul 2016 11:56:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

They are unlikely to be of any use in the target file system.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/recipes-core/readline/readline.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index 35df8b4..1a0a155 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -32,6 +32,8 @@ do_install_append () {
 	oe_libinstall -so -C shlib libreadline ${D}${libdir}
 
 	rmdir ${D}${bindir}
+	rm -rf ${D}${datadir}/${BPN}/*.c
+	rmdir ${D}${datadir}/${BPN} || true
 
 	install -m 0755 -d ${D}${sysconfdir}
 	install -m 0644 ${WORKDIR}/inputrc ${D}${sysconfdir}/inputrc
-- 
2.8.1


