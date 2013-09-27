Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id E761E61177
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 08:18:11 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id eo20so1907567lab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 01:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=ehwaS3IEISWFi2RpMW9i/5e7JmvmWLkayCMLXlNebEA=;
	b=Hqd7a1VKpUXjvVLMSkpnHrjIUD82bkc0J9uLoFETYQcaMfVBfDdMjpuTnWEacy/tlt
	tIVH6b3i003Z4cCvS7yueHtmGBHtv0COTewC9zNmlYbVt/DUmOwPq6+qr3Sknv8YoY7I
	/iUNI6J6UYUB3UuNxS3QyoYQb/0On8mgb4a7OHCu5Pu6OfhWe7cXB5yziG+RjXf1nKfl
	J83fEPzqARoB+v/AwQirPBI1jFKvDX2IpKIc8/l744cb9UUU2aWNG43Fm/5WjS7Ehemy
	XemVVbbn6fvQ+gvH4rsbZ1p7EwrMwOEqbxdYsi34tspmYYwuV6tlPEJfMh6dAlByQVkP
	Xe+g==
X-Received: by 10.112.210.136 with SMTP id mu8mr7664697lbc.25.1380269892677;
	Fri, 27 Sep 2013 01:18:12 -0700 (PDT)
Received: from nysan (c-5eeaaaa0-74736162.cust.telenor.se. [94.234.170.160])
	by mx.google.com with ESMTPSA id vx8sm5035747lbb.8.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 27 Sep 2013 01:18:11 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 87F7D40470C; Fri, 27 Sep 2013 10:18:09 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Sep 2013 10:18:03 +0200
Message-Id: <1380269883-26873-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] nativesdk-packagegroup-sdk-host: Add nativesdk-makedevs
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
X-List-Received-Date: Fri, 27 Sep 2013 08:18:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add makedevs to SDK, to allow simple /dev/ population.

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 95f98c8..e298ff4 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -21,6 +21,7 @@ RDEPENDS_${PN} = "\
     nativesdk-autoconf \
     nativesdk-automake \
     nativesdk-shadow \
+    nativesdk-makedevs \
     "
 
 RDEPENDS_${PN}_darwin = "\
-- 
1.8.3.2


