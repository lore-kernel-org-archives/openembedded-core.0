Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5AAAC770C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 01:43:42 +0000 (UTC)
Received: by pacao1 with SMTP id ao1so5895364pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 18:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7eKZuS+7kgVvLsrKaKby13Auc8qrSSU8DUUBled/a+s=;
	b=hRMfaESSsba0uNkSIMFcQxlV4xFOFwuSxEZQ5lYvXnQs/mMYXfQjGImJFiW+o9V/Q4
	U+nDctRC6wdMPSL7M6Vp5jC9bXIJaRT0+OT/i0cLTKmadzBPGmpBZtD35IoL3r/0r/9o
	j7dj/FcxjaFo6i71mlgtV/yOqkGi8aCvEoI2GbKWp12tZ0Z5qCyx8ADRKIZu3rzN+rWG
	/1mC/8dAZeuPNg/19hT2Ks9nyyo1oHfv/+EBX1DPx19aMko+oC5Mkz9pZvZ3iTvSw8tm
	Q2MteL0MAUX5HrU9lylmT6GE9l0ruNBR4H7jBmkoGzfdfmq5h6IavLW8E/TXhs6CkB92
	m0xA==
X-Received: by 10.66.250.197 with SMTP id ze5mr7188943pac.50.1444873423069;
	Wed, 14 Oct 2015 18:43:43 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	z6sm11928971pbt.51.2015.10.14.18.43.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Oct 2015 18:43:42 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 18:43:13 -0700
Message-Id: <1444873403-21093-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444873403-21093-1-git-send-email-armccurdy@gmail.com>
References: <1444873403-21093-1-git-send-email-armccurdy@gmail.com>
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
X-List-Received-Date: Thu, 15 Oct 2015 01:43:43 -0000

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


