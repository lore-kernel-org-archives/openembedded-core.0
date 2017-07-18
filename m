Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 628FD77F38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 11:01:56 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id z78so10737344lff.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 04:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=U7nAkyA9DS4wYKib64YsWq0dC7h+Iahpc2bx7Xw3LyQ=;
	b=VlzTALQU5YWgF8XSqeWW0kcxVbHHpMQagcAvRFIbvQAZGZbUzAc/GRlpBcId1YOd7I
	Ys1+x0+w6aTVJ/67/GrNfcsvm4gbit0YqNA0H5d7PtAdkJhvHSEo/D5dwsiJh8p71rKv
	VYxuPZOSnVzf0gFTpi1+iuQKTvliNL2cskDPyXBMI0KLQqJwcfUGYhpkAh8ScwgA82eQ
	3rn6dyzPFRsdnQ5VN3dDaO85mzJBre3ABtmWE0tpRaGCJeox3iQ913c2cICg7WpfyW85
	n7JLLYwrhul04WBVlKWAtXw2ZQK0A7nXG3uJF5dUzElssyY6BuI/fZO/8TkdUnlpjXcw
	pHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=U7nAkyA9DS4wYKib64YsWq0dC7h+Iahpc2bx7Xw3LyQ=;
	b=LZs+iLgaOyT7tG5kpq/0lWBdNAjjVpgxytR5kclm82vZ231azqHw7SVfUxz9MA9RSO
	Ygf/7XAiX9AmzV/8Xjz+OlHObG8xStSeNQjDycIB/Z7raHczJuyFgvxRWOUbgm3bkP8h
	ZFHGwXnT/9abzNlVgTN6fgz3gAwYYTZ3yFC0IvbbG/PwvnwxlRr6UnsFTTGuWom31d1y
	5sPbHBW+Qkob/6nuEbGQ1o6KsMwo3PAwhmUhXKXVspN6ZWQu0JGXShhj+tXoLACy7aaf
	39Aag2a2mLItu3b0NuZnacj0nQ2x9uEgiylXyJXUaNBqzpQR/BEyWZUOAIFpy9h87/UX
	Fa7w==
X-Gm-Message-State: AIVw112ZsMzRrpM81Mb5mT6adTtbJp2HJUPMiZcYhaZCDEgZJz7fSvCA
	4J1oFFGkfGh0u0vdixU=
X-Received: by 10.25.115.85 with SMTP id o82mr509252lfc.96.1500375717477;
	Tue, 18 Jul 2017 04:01:57 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id l81sm491452lfk.60.2017.07.18.04.01.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jul 2017 04:01:56 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jul 2017 13:01:53 +0200
Message-Id: <20170718110153.6178-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH] base.bbclass: Make .jar file depend on unzip-native
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
X-List-Received-Date: Tue, 18 Jul 2017 11:01:57 -0000

Unzip is required for jar files. Without this patch:
ERROR: junit4-4.3.1-r0 do_unpack: Unpack failure for URL:
'http://downloads.sourceforge.net/junit/junit-4.3.1-src.jar'. Unpack
command
PATH="/var/lib/jenkins/workspace/qt5122-dyspro/build/tmp/sysroots-uninative/x86_64-linux/usr/bin ......."
unzip -q -o '/var/lib/yocto/downloads/junit-4.3.1-src.jar' failed with
return value 127

Suggested-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 27a28b8b8c47..4ffffb05d5d4 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -628,7 +628,7 @@ python () {
             d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_populate_sysroot')
 
         # .zip should DEPEND on unzip-native for unpacking
-        elif path.endswith('.zip'):
+        elif path.endswith('.zip') or path.endswith('.jar'):
             d.appendVarFlag('do_unpack', 'depends', ' unzip-native:do_populate_sysroot')
 
         # file is needed by rpm2cpio.sh
-- 
2.13.2


