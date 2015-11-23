Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6AE536012C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 15:22:52 +0000 (UTC)
Received: by qkao63 with SMTP id o63so59767372qka.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 07:22:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=T9Iq3qptX7u8coVOVxUDPZrNZnwy9J+fVWroPolA848=;
	b=iQnGoJCVPFau3g26HtgglMxwXn1bNLa04HW5z0NQHgd7kWcbH8swh9nCONUX/rhthO
	lLIr8bWE+UKFFiIwCf0dMs+0VVVFscNEqRDHpPYVhm2v8Of6f37Ae2pnSrlRWbJyHaVB
	CY+AuccXQIpI52PLTB0migp7SDGNd/gmQJux8DEdJHajBOAdQZ21ZnxkDHcKetTs9Km6
	7n/yXw1DmaoAEnoOerkrUCTs/RCFG+ZSDUhvx5cEwcUsQY6q/EyoDd18HxDsQO1+7lR7
	PJJpKf5Ovb+y8M8Nzx+EixzohfPwTvFCJ/1UoVtmXMeduIb3UJCwkM9b+VN5nR+pjvXB
	Xphg==
X-Received: by 10.55.200.132 with SMTP id t4mr27491481qkl.78.1448292173547;
	Mon, 23 Nov 2015 07:22:53 -0800 (PST)
Received: from localhost ([177.100.174.62]) by smtp.gmail.com with ESMTPSA id
	t101sm3106662qge.2.2015.11.23.07.22.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Nov 2015 07:22:52 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 23 Nov 2015 13:22:45 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Nov 2015 13:22:43 -0200
Message-Id: <1448292163-14766-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.6.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] xf86-video-vmware: Add vmwgfx PACKAGECONFIG option
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
X-List-Received-Date: Mon, 23 Nov 2015 15:22:53 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.1.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.1.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.1.0.bb
index 89b98ee..8c891e6 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.1.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.1.0.bb
@@ -15,4 +15,5 @@ SRC_URI[sha256sum] = "3c1d244e4b1b77e92126957965cdc9fb82de4c215c0706a3a8aaff6939
 
 COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
 
-EXTRA_OECONF += "--disable-vmwgfx"
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[vmwgfx] = "--enable-vmwgfx, --disable-vmwgfx, libdrm virtual/mesa"
-- 
2.6.2


