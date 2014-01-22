Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id C4BCD6E71E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 15:09:04 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id hr13so421494lab.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 07:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=hWduginOQLnAq+ZAmflxKZI0fUvCDyry0iLVxZyZRgg=;
	b=Zi8yxZ0e/iya9N0653A0o9b4PcE5j7AtsnFFv9NZl9x4UyJtoS/pjXmOhuIij+3SCg
	GrFBgrojaQZFZxOz/xXcwHGWoqLwQ3aNuUnjs4U9IM0XbK3zGcFR6VzaONqdBIYJuM+1
	ieKGdoBzit4dc46o2K2LJBtxuiIjd2i8EK14x2IEgq7AjoFqi7ZvMrv6zz0gqNEeM6Hr
	lUv8ikHnnViBUXW657cyksRBuMZjZwHwHiPK75OY237GfyF8uCGrugZLaIVIZ/uHjY8O
	j3rydjaX0fod1/oyfCDa2D3kQWvTXc5jumQPQJ3fdoo5D6+R297ngGIzhyCiyqIPZfui
	Fi2A==
X-Received: by 10.112.132.102 with SMTP id ot6mr1315298lbb.27.1390403344880;
	Wed, 22 Jan 2014 07:09:04 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id s9sm10676051laj.0.2014.01.22.07.09.03
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 Jan 2014 07:09:03 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 6CED51C61BC; Wed, 22 Jan 2014 16:08:56 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2014 16:08:55 +0100
Message-Id: <1390403335-14487-2-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1390403335-14487-1-git-send-email-david.nystrom@enea.com>
References: <1390403335-14487-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCHv2 2/2] nativesdk-packagegroup-sdk-host: Adding nativesdk-postinst-intercept to SDK
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
X-List-Received-Date: Wed, 22 Jan 2014 15:09:05 -0000
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


