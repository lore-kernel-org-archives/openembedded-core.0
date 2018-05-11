Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id AB520770EF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 16:06:16 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id p4-v6so5870288wrh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 09:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=sXZaUPBPPnTIE2gwMh4FGXJRoiAihyrtxBs8xtpPuAo=;
	b=aiNE5BKjS5l4+UR7/dictka5phGUcyYVCBdOGQyGXfpzJdXKylzG0LKtdp7UAH7zIS
	Nx9Jk0lvB7+OavgTtF+bfHEsUVINQc/AUkAT+R5tZjhJa1qpVAFLKlTza8u7R5d8MbzS
	B/Ub+ygSR+JGPMQA3oOxBE1/LYlYzkkcFFFEF+Rst/w2YKRHJsVPDFktMdHAiYqMMhGE
	RJi/hIhcR9JWDXvWN/3lyNAnvxtzQYfvq7kKCiRATd1m6pDaTdGAuMkdT6Aa+DttJCfM
	XuNqR3gM2l3/kxLxcBvBjoGKy5qfQSf7NPsHK2rbOwRUKMuCQBEtOMGRwgAu3GpyEVtw
	NTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=sXZaUPBPPnTIE2gwMh4FGXJRoiAihyrtxBs8xtpPuAo=;
	b=UNPFRyeDXOK9aouKDSA6ZMCv+Ves6LL3WZKpcjnaTkjweWU/xfxfxs5usiyr9jSVEo
	I+zFQTfyTFuh0PaTgVWkzPU2/gCUB3HhoNTbE437mebfinU/G2eMhcyulmvs9Y7093ur
	Nbsm6KsVBgLmmdiWmF/D3Dm6hH5XdEMIS97VxD5i2q3cMWf5bgGn7P7UWIhI5/eS2rIv
	F6r2I509NX1+UiMERE3olAe+NeQmXppNY6hDK4qNAnDtUadrS+ZPRP+BEc1tFREu+pwL
	6XgF/3AL0N+TYN0XRailETEbSzlcD3zglUPFxW/NMyl+DJ6niHYVZzjZyNYwNZ6Ri+RA
	ic4g==
X-Gm-Message-State: ALKqPwedbiYxsTKikvZoo17nzaoxcD7kCJ9+7tBAc6w3kaPPVd3bZItX
	mA3nTh+DUB8FJPojXDNPtxwZ+4zs
X-Google-Smtp-Source: AB8JxZrKhdtu4dDANIjU9R6ojOM3subDLv2eNYsRCCH93Y7LDu5u2YpzdVmcboJGcG4mbojHg22vqA==
X-Received: by 2002:adf:ac28:: with SMTP id
	v37-v6mr5184182wrc.56.1526054776825; 
	Fri, 11 May 2018 09:06:16 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v192-v6sm1603993wme.45.2018.05.11.09.06.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 09:06:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 17:06:13 +0100
Message-Id: <20180511160613.10926-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180511160613.10926-1-ross.burton@intel.com>
References: <20180511160613.10926-1-ross.burton@intel.com>
Subject: [PATCH 2/2] gtk+: fix patch headers
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
X-List-Received-Date: Fri, 11 May 2018 16:06:17 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gtk+/0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+/0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch b/meta/recipes-gnome/gtk+/gtk+/0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch
index 9201e45c39e..83be39c3bf2 100644
--- a/meta/recipes-gnome/gtk+/gtk+/0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch
+++ b/meta/recipes-gnome/gtk+/gtk+/0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Do not look into $HOME when looking for gtk modules
 On the host it causes host contamination, on the target it's a
 potential security issue. Gtk+3 has already removed this.
 
-Upstream-Status: Inapproriate [gtk2 is in maintenance mode]
+Upstream-Status: Inappropriate [gtk2 is in maintenance mode]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  gtk/gtkmodules.c | 4 ----
-- 
2.11.0


