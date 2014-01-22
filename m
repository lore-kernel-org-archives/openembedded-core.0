Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 452156D899
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 13:05:08 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id p9so285407lbv.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 05:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=d1/Ka1uQx2BUuZHGdgmq+JExaxV7F2TWnzTQA3nn63M=;
	b=ZxhCQJaV0v7zgbSBobZBMXZt1V8o86pGxi7rJAPkCZbJRDEWKA89fZu4rmVilv+m7x
	zbnS84wMwy3GkN5vqzqXnZb71YH/5ADtLggOh5q/ZJaZa53iX+RXP7qW8VRpuuBSbbbv
	QbnZFZMKWHvyM7lvzi2LeW5Lqb687nrXj9NE1uvzdj7FKmGX4D+Yr35Md8k2KQMTV5jG
	YLtDI5KfOV8U4YUuRUeFtLwaAYSsSAwyTK8S5z1Zj+Z7cGF6ZDO+qUNJXB7FFP2X9e+8
	c4XaMRADf6bNHQ4um91YoR2IwRgMIM339fytWskZ3vdpxSMvHrjJfBSquk7BNsOQOZCF
	7KEw==
X-Received: by 10.112.172.69 with SMTP id ba5mr934704lbc.55.1390395908315;
	Wed, 22 Jan 2014 05:05:08 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id s9sm10221861laj.0.2014.01.22.05.05.06
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 Jan 2014 05:05:07 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 11DAB1C61BC; Wed, 22 Jan 2014 14:05:00 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2014 14:04:45 +0100
Message-Id: <1390395885-5078-2-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1390395885-5078-1-git-send-email-david.nystrom@enea.com>
References: <1390395885-5078-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] nativesdk-packagegroup-sdk-host: Adding nativesdk-postinst-intercept to SDK
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
X-List-Received-Date: Wed, 22 Jan 2014 13:05:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 1065f30..f1bc1ea 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -23,6 +23,7 @@ RDEPENDS_${PN} = "\
     nativesdk-shadow \
     nativesdk-makedevs \
     nativesdk-smartpm \
+    nativesdk-postinst-intercept \
     "
 
 RDEPENDS_${PN}_darwin = "\
-- 
1.8.3.2


