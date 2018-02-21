Return-Path: <mgloff@emacinc.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4F531787D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 06:35:44 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id n7so1013019iob.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 22:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emacinc-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=+MQsYcD6WSYrJD7L7fVMDQUpfU1RtjMQYFq89Fz25Sk=;
	b=qFXrOw1VudyGASRpt1u+pOVrz1cf/4EOIgtcss0vC96YAOYey3unyfUFtgIF4bVXM1
	HHFvZEnDxKJvKtvAMt2VhQHwRVCijgdykiz+CmgQ0uWqBVrtzybqssCWUcitS2fv/0sV
	1l1/2PCkfpw3GD1AGgUN7n96RA+GO4TKvOQK686Ezqz3CRK/1ceXwltmZE5TiG21zyQM
	CwZmn4FHbmQRvmrNrLUowBFsJXlRY2pnnDIIOMh+7qLfaT8hQRY/SQjP0ZmXV8L4QCLb
	FhIKHE2ruy0RSyKaQOVxUomdKz4p3/xB/l96XqToSc2EAZ4RyH7s0Af2rGPLt8S2UWTr
	Oxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+MQsYcD6WSYrJD7L7fVMDQUpfU1RtjMQYFq89Fz25Sk=;
	b=gmk/RLWZquzwZjOgVRr4RE48c4wc+O8OcgkQJ/SvVJ0dldlKchzOBKAIVyCRmWJSSy
	P1dee18avRv1TC8VyZeuGovooYp43H6X4OLXZl7NULgT7+bKh3tvdKgcfzWnnvyznU+X
	NSxjG5/LyO1DiPQlO6rmKTBITmMAMbz2KdM8xV9j79q12hBWAzHYdhmEk6RWYod1I2mr
	5n7S6Z1JUU7gSaQj+7/bDgGHZjROEw8iW1NEOYePW2Y/wpwLyzGNIQT8JiQBTyehieTU
	mYjfMM67mPTUijuHFSRJFhJDO7kn3khdMBcEZP/9omnMx9afAXB+ty3ux73TM8qr3c+9
	HrSg==
X-Gm-Message-State: APf1xPCmlDxOYeG3AH8GbAprG6PLZUwq533BZ0WumKzkdI85sFMmF6rc
	0CX6PkNo0IbSyMSxvzK7yxJjLofq
X-Google-Smtp-Source: AG47ELvZ/8SunNHWr33rRaIx3O9iLB7FT+ubkO8l88BoI6vz851MVMdByedHKQKQ0GowIqPuw/palg==
X-Received: by 10.107.35.7 with SMTP id j7mr2769871ioj.226.1519194945990;
	Tue, 20 Feb 2018 22:35:45 -0800 (PST)
Received: from localhost.localdomain
	([2604:2d80:8039:854a:be49:cfc1:98fa:7837])
	by smtp.gmail.com with ESMTPSA id
	l140sm18709921iol.11.2018.02.20.22.35.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Feb 2018 22:35:45 -0800 (PST)
From: Michael Gloff <mgloff@emacinc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Feb 2018 00:35:32 -0600
Message-Id: <20180221063532.29161-1-mgloff@emacinc.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH] utils.py: Use minimum value for PARALLEL_MAKE.
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
X-List-Received-Date: Wed, 21 Feb 2018 06:35:45 -0000

feded5fe2755fc6523c235fd6e82a0972e197c08 introduces
parallel_make_argument with optional limit value. We need
the min of PARRALLEL_MAKE and limit.

Signed-off-by: Michael Gloff <mgloff@emacinc.com>
---
 meta/lib/oe/utils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index ec91927233..80f0442d0a 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -195,7 +195,7 @@ def parallel_make_argument(d, fmt, limit=None):
     v = parallel_make(d)
     if v:
         if limit:
-            v = max(limit, v)
+            v = min(limit, v)
         return fmt % v
     return ''
 
-- 
2.16.2


