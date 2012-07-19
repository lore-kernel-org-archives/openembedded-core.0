Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SrkfJ-0004r9-8f
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 08:56:49 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1431924wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 23:45:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=/npCAcfVYfNNdWb8UB9MTzdfqONghj/1NAzJdgqzELk=;
	b=ZFl6lJfN10H8z5zIAbIODKPiFOMAeMZfjtcBeMprFpylOKVscJpeTOhTQJDjVPIuPQ
	shK761PKputwk8cvkBDJLzceiQ6WBN9Gepuy/kJgGbEGipUkQ++rUSZt5W1wkfwvXmPk
	lzEKqCusuAlhg+yltM5Sd4Ofno6DTblkRKSx8Fy9CtcJ2G9fzayzbD5TtzjIVP38hP/B
	xG7zS8A4MONhGwT5+BgxF3WHALNaz7+gpOVkfkztw4MjRycqWmsOs1VhL3fpd7HK63N7
	ggxQtuKxtxBSc8YZxZtRr0w4dbSLqM3dno+O1/CEr8jvPgP59I6s5g0hZCfexStezHRj
	Id3w==
Received: by 10.180.78.35 with SMTP id y3mr13143128wiw.16.1342680330017;
	Wed, 18 Jul 2012 23:45:30 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id i46sm3013193eem.0.2012.07.18.23.45.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 23:45:29 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 08:44:46 +0200
Message-Id: <1342680286-12886-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342680286-12886-1-git-send-email-koen@dominion.thruhere.net>
References: <1342680286-12886-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmz32flGlS5jeTRmpaV2E8BEmnswTjXLQIesMFR0Kl8k0BqUGLPRY7kmMQdsVLNvbpR4TVR
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [for-denzil][PATCH 5/5] image_types.bbclass: Default XZ_COMPRESSION_LEVEL to -e -6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jul 2012 06:56:49 -0000

From: Andrei Gherzan <andrei@gherzan.ro>

Having XZ_COMPRESSION_LEVEL on -e -9 and -T 0 will make xz eat more
than 6Gb memory. Reduce this to -6 to make xz to use about 471Mb
on the tested machine.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image_types.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 258be63..8869a5e 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -116,7 +116,7 @@ def imagetypes_getdepends(d):
     return depstr
 
 
-XZ_COMPRESSION_LEVEL ?= "-e -9"
+XZ_COMPRESSION_LEVEL ?= "-e -6"
 XZ_INTEGRITY_CHECK ?= "crc32"
 XZ_THREADS ?= "-T 0"
 
-- 
1.7.10



