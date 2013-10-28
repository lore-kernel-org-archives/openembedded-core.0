Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 314656D48D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 14:33:42 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id x12so6565338wgg.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 07:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GNDe67cs6qm1cLqMJwDGUTvQSzgVmGF2Qvw8Cl5LKlw=;
	b=VU2a2FKyj8SiwF+GXbfXDPQj+BYCZv6oCIvicQkxJlEcTJraWr5zdpqgr/KyZvXaPp
	rGxnw7twH2Z0fb/6+pm4lISgeB/bZbIxtF8qiAg53cQBiiK3bc3R873YgGhwXvslV8cd
	OwTIc9hGCtC74PJo7oOeLqx1KGqsULyVIk6KxmWhry3MLr2Py6Uc7SMih/7jTdDe5pQQ
	piRdVVsPFV2HN9iWlUH5VxNB6xjhw8lC8+FyHXLfAdMYE7NhtVF3CSbTYzzpzbZ7S2sq
	Trs+IFlawhE3BH76pDw6+kReFUl1r+hV/JJdQDw93gHOmmbggqecicZdQ2veGCM4+/TU
	/wjw==
X-Gm-Message-State: ALoCoQmBFgzkfImGnCeWRwGn3hyhBxwJ3Em7V83ZrUZogAhAz2c82ZwkMtcQkeCNc68/FQHEA5yo
X-Received: by 10.180.160.240 with SMTP id xn16mr9259165wib.62.1382970823505; 
	Mon, 28 Oct 2013 07:33:43 -0700 (PDT)
Received: from flashheart.burtonini.com (188.29.164.71.threembb.co.uk.
	[188.29.164.71])
	by mx.google.com with ESMTPSA id fr4sm36349149wib.0.2013.10.28.07.33.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Oct 2013 07:33:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 14:33:17 +0000
Message-Id: <1382970798-13574-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1382970798-13574-1-git-send-email-ross.burton@intel.com>
References: <1382970798-13574-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/5] gnome-common: inhert gnomebase not gnome
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
X-List-Received-Date: Mon, 28 Oct 2013 14:33:42 -0000

This recipe doesn't need any of the helpers that come with gnome (GConf, icons,
MIME, etc), so just inherit gnomebase.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gnome/gnome-common_3.7.4.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome/gnome-common_3.7.4.bb b/meta/recipes-gnome/gnome/gnome-common_3.7.4.bb
index ebf343e..af5d340 100644
--- a/meta/recipes-gnome/gnome/gnome-common_3.7.4.bb
+++ b/meta/recipes-gnome/gnome/gnome-common_3.7.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SECTION = "x11/gnome"
 PR = "r0"
-inherit gnome allarch
+inherit gnomebase allarch
 
 GNOME_COMPRESS_TYPE = "xz"
 
-- 
1.7.10.4


