Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id F303E6DF6E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 11:35:49 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id u14so10127464lbd.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2013 03:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=ualavPQfj9IdVCoAqrf+Gj5BeYWm2lUi/+xMb3Z5XTI=;
	b=Wf69koQbDCu+em9xadqw6Es+QPomyDyBXVX8TomVL7dteuRZrCoLm5WX3GqmUlsT5v
	Re7ShESiChvF7Nme2p+K4C5iWti0l0DLKwO5+uDNMj3ec7z6bQJjx7AEWsDmaNH3Nuyc
	EnBSnP+PmFa2kYKgzYjC96Ofe9r0vIE3U7ryROVBYshT0ZoICjz1Ov7iMk+095anQdlE
	ql+cYrjRb6fZ1/5E6jqJZizmhHY/0nDco/IT61ceUZxkS0SuXBqU4gwROLEhc886jCS3
	VKZdeCO0evejnY8FahFSymOtld8zBJ7v8WaGvVMzN0tfe/Z1Fa5Q6S2lsDXZaNZOvnaE
	9jIA==
X-Received: by 10.112.218.74 with SMTP id pe10mr4273957lbc.19.1386243348819;
	Thu, 05 Dec 2013 03:35:48 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id c8sm43309170lag.3.2013.12.05.03.35.47
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 05 Dec 2013 03:35:48 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 28A671C5E70; Thu,  5 Dec 2013 12:35:46 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2013 12:35:43 +0100
Message-Id: <1386243343-15551-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] nativesdk-packagegroup-sdk-host: Added nativesdk-smartpm
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
X-List-Received-Date: Thu, 05 Dec 2013 11:35:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This will allow offline creation of a rootfs, using only
the RPM package repository and a toolchain tarball.

Ref: https://github.com/nysan/rootfs-sandbox

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index e298ff4..e6631d8 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -22,6 +22,7 @@ RDEPENDS_${PN} = "\
     nativesdk-automake \
     nativesdk-shadow \
     nativesdk-makedevs \
+    nativesdk-smartpm \
     "
 
 RDEPENDS_${PN}_darwin = "\
-- 
1.8.3.2


