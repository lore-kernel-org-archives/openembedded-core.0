Return-Path: <kergoth@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6B2D16E2EC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 14:56:48 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id h10so928876eak.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 06:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=y5fDx1KYgMH/Nr66PuvgX28a9G42PfAwwVGZ+xXB7yA=;
	b=L9dGsHSEEyZHWumI1/Uf01lJuVDGSssSZxuwvaOqeqpuUrocmwSUnzvjRfZ630tW8Q
	N5qGsizZoY+EDWerJKvnAyvTemYqyIKWevUM2D6t9U9uvzZnUEfej1OBrU2QbkmoKDmh
	tK3fUhQmvkTXAi3PM7EOOpbPTYvu3DZbf84w/qt7Tknx+gVPSHwrU12WUW/v+JMjW7tm
	CTLZPeRxtjpTSXFfwezE8E3HC8s8o5t1+IaJ+nvvFMphFcxgjGPZC6fTm/Q+lOyiBCSy
	BsbNktdz8WI27uXWp26e0H/9PcQwgYlN9P4P+2dZmNAz2+euA4w4lXKFci/z7lbFzDeI
	11+w==
X-Received: by 10.15.63.77 with SMTP id l53mr3314214eex.89.1386946607792;
	Fri, 13 Dec 2013 06:56:47 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id 44sm7648810eek.5.2013.12.13.06.56.45
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Dec 2013 06:56:47 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Dec 2013 07:56:38 -0700
Message-Id: <b00a526527b3248c9014bc3c0e5c606ef97e0838.1386946335.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1386946335.git.kergoth@gmail.com>
References: <cover.1386946335.git.kergoth@gmail.com>
In-Reply-To: <cover.1386946335.git.kergoth@gmail.com>
References: <cover.1386946335.git.kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [RFC 2/2] systemd: rrecommend os-release
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
X-List-Received-Date: Fri, 13 Dec 2013 14:56:48 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-core/systemd/systemd_208.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_208.bb b/meta/recipes-core/systemd/systemd_208.bb
index c1f8d77..4c2fbc6 100644
--- a/meta/recipes-core/systemd/systemd_208.bb
+++ b/meta/recipes-core/systemd/systemd_208.bb
@@ -223,6 +223,7 @@ RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units \
                       util-linux-agetty \
                       util-linux-fsck e2fsprogs-e2fsck \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
+                      os-release \
 "
 
 PACKAGES =+ "udev-dbg udev udev-utils udev-hwdb"
-- 
1.8.3.4


