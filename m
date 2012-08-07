Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SyefS-0007n0-T5
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 09:57:30 +0200
Received: by mail-ey0-f175.google.com with SMTP id d12so1114468eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 00:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=/npCAcfVYfNNdWb8UB9MTzdfqONghj/1NAzJdgqzELk=;
	b=PLlf92NbTBcMGd0x2Wsd2WzYqe31EJKAQnPi/hqcrbCzlXpmrLwk4KjLmA1HX2JukY
	xU/r8UW2Q98n1ehX/9/VikLgvygIG8OjGAwrxUuHgF71xIQVbGtjoJlq+cMQasVPyI/Q
	ND8XudRKBA+QsDLpH9xfhizuadL9aDcHi9NHL8DRWXZeXYt+8gSZvS0RN96w3Z/W3Ai2
	bWciZzwXOqoeN7qPsiqZtUgwPgA4kPgEWDBq6bUJR6eaDYmri4u4QLPipZXj45K1t5KO
	ZGyxwjQhIMERU0gnp+3TqEitQ4gqMsnHW2q+/JMyGMJLgRhY1BgisfXxXzIor2sihO+w
	Zwcg==
Received: by 10.14.218.134 with SMTP id k6mr16621141eep.14.1344325547556;
	Tue, 07 Aug 2012 00:45:47 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id j4sm53689614eeo.11.2012.08.07.00.45.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 00:45:46 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Aug 2012 09:44:48 +0200
Message-Id: <1344325488-20479-8-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1344325488-20479-1-git-send-email-koen@dominion.thruhere.net>
References: <1344325488-20479-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmyCt2jd9VN1sRVO9jMIHvCq5LYqDde7UTJ1ZYNfe4W/140x3Er++u2Bx2nYzEYtp8eWc4e
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH][for-denzil 8/8] image_types.bbclass: Default XZ_COMPRESSION_LEVEL to -e -6
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
X-List-Received-Date: Tue, 07 Aug 2012 07:57:30 -0000

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



