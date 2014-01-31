Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 448746EABF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 09:30:17 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id u14so3278776lbd.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 01:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=x9TeOSmLegSxTrUlVN6u8bNXvh0lJ3H2p+6uGta5imo=;
	b=H4jAi9Id8V1+v0FFYENfLt8dg9bz7lJZzkmJ+dGXvszOtpcxE0WRasz+BuTTV1xDv9
	/RhVuTjN0Gqr94+a8F5blhxxEE+gUHzOcnfTex5/eVnERQi6XwjYMfscvxcAT+iTWFm2
	iF1E8yq686AT5sqRiccPqQ27cDthFXx4FyF6QgkDIaVdsmJIomPrB+ZA9u7gKuDjmpoj
	+DwNjebne6n/YyhNSe+4ArF+yizDewHLBwtYBIw6v+BNYlJFSTWCILEWwSR+HxCKHTJe
	8i9HTEf9OJberw/RKD/XBCcp47koUkRpdvXLWytiUkNLdCUHi/n7+SlG5i4iobFP9PyZ
	EXUw==
X-Received: by 10.112.126.164 with SMTP id mz4mr514300lbb.52.1391160617520;
	Fri, 31 Jan 2014 01:30:17 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id z3sm13219216lag.10.2014.01.31.01.30.16
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 Jan 2014 01:30:16 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 775AD1C6026; Fri, 31 Jan 2014 10:30:08 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2014 10:30:04 +0100
Message-Id: <1391160604-23629-6-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1391160604-23629-1-git-send-email-david.nystrom@enea.com>
References: <1391160604-23629-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCHv2 5/5] nativesdk-packagegroup-sdk-host: Add nativesdk-nss to default inclusion in host SDK
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
X-List-Received-Date: Fri, 31 Jan 2014 09:30:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

                                                                                                                                                                                             
Since shsignlibs is used from the nss postinstall hook. It should be 
included in nativesdk to make offline rootfs construction possible.

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 09e0aef..693437e 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -24,6 +24,7 @@ RDEPENDS_${PN} = "\
     nativesdk-makedevs \
     nativesdk-smartpm \
     nativesdk-postinst-intercept \
+    nativesdk-nss \
     "
 
 RDEPENDS_${PN}_darwin = "\
-- 
1.8.3.2


