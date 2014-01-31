Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 905766E98A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 09:30:15 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id z5so3163759lbh.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 01:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=3bMhbo3DzyAd7d304URmJajbKdZZ6z/8iUdFSNUb5AU=;
	b=rbj47+JLqt/MAeq+WSW+RJqad3wmDdHzNI7gj20032Ai2NJJ5JnxAHScGW3FwecvIe
	z54MiB5EoEeiomrnlyPgWJHzDSTq6hOGa7wFJco3v/M9uPVLZAp90XexNizAXTu089cu
	M6y2ZUikYdetRABDXa2IeSeei+3jy3d/xk2iV/7cN3cWA7ImNW+89fs9JcIeYeJmtizu
	dhTLp5CU7xlMcsvrcnPiz0NYGYl9kL/QeWBtITFy/hDbU8krOusznaiXK6iM8podVIEB
	YzirV8FVdExYqGWk6Cpv7OeHofzLflNd+Gnnv1mbUK2nXnwdlI2lgHcSXa81eoboFMR5
	Kveg==
X-Received: by 10.152.28.137 with SMTP id b9mr13127382lah.4.1391160615402;
	Fri, 31 Jan 2014 01:30:15 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id w2sm13223783lad.4.2014.01.31.01.30.13
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 Jan 2014 01:30:14 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 6ABAC1C6020; Fri, 31 Jan 2014 10:30:08 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2014 10:30:01 +0100
Message-Id: <1391160604-23629-3-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1391160604-23629-1-git-send-email-david.nystrom@enea.com>
References: <1391160604-23629-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCHv2 2/5] nativesdk-packagegroup-sdk-host: Adding nativesdk-postinst-intercept to SDK
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
X-List-Received-Date: Fri, 31 Jan 2014 09:30:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding ability to use postinstalls intercepts in the nativesdk env, and
making sure the correlate between repo + SDK.

This to enable rootfs generation from a package repository using only a
package repository and the toolchain tarball.

See https://github.com/nysan/rootfs-sandbox for examples.

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 855fe4e..09e0aef 100644
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


