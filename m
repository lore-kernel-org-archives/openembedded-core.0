Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 36BC277085
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 16:41:23 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id f74so4635907qge.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 09:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=7FsdlgupnF/+iu+t7lwc71PqaPubq0at14jmr0TERXc=;
	b=Jo6MzPdEhq6+m2A/3mZTNDjFivR0T/Xnd4W9BdSczNp9VJOr7h97VjADBAPAoUaHHE
	Amv3zY3BWruNIZsznGy487gbYcX9p3buQi2q9P5PS5TYFCflMtWBuP9vYKCS7ijXzx5z
	0i3LctXE1NRL61tw8NI/bReixRsVZnuryTUfgOmqkVgtt78nw5DTY1EhcoWKm5DGX4kT
	Ks6V2TwdApwijcMlAEtBQUGdR3geh4PYqPQYuNA5SwXTGS0eN4T+YiQHW0nX1JrI5j0X
	deG/+9Qxn0E0i5LpmW1WuhhjOTe+/doC9oRFddKb8+SNwCsu5/+E56VrRG3VYvy05Y4O
	tOMA==
X-Gm-Message-State: AOPr4FUuRq0wNIhdmsaa0Dv8HezXAPLtTZxzuTbM4DJm5exxQHMK4g8MNrUa4KqaSi87pQ==
X-Received: by 10.140.132.73 with SMTP id 70mr9037087qhe.42.1463589684120;
	Wed, 18 May 2016 09:41:24 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	v66sm4557582qka.14.2016.05.18.09.41.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 May 2016 09:41:22 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 18 May 2016 13:41:14 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 13:40:37 -0300
Message-Id: <1463589648-28641-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
References: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v8 02/13] weston: Fix SystemD service description
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
X-List-Received-Date: Wed, 18 May 2016 16:41:25 -0000

This improves the log shown in boot. Now it shows:

  [  OK  ] Started Weston Wayland Compositor

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8: None
Changes in v7: None
Changes in v6:
- Fix typo on commit log (rborton)

Changes in v5: None
Changes in v4:
- New patch.

Changes in v3: None
Changes in v2: None

 meta/recipes-graphics/wayland/weston-init/weston.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/meta/recipes-graphics/wayland/weston-init/weston.service
index 4f1f7ff..12aedb7 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.service
+++ b/meta/recipes-graphics/wayland/weston-init/weston.service
@@ -1,5 +1,5 @@
 [Unit]
-Description=Weston Wayland compositor startup
+Description=Weston Wayland Compositor
 RequiresMountsFor=/run
 
 [Service]
-- 
2.8.2


