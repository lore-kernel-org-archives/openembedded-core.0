Received: from outbound.soverin.net (outbound.soverin.net [116.202.65.218])
 by mx.groups.io with SMTP id smtpd.web11.8338.1606991732416856839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 02:35:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: embed.me.uk, ip: 116.202.65.218, mailfrom: ml@embed.me.uk)
Received: from smtp.soverin.net (unknown [10.10.3.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 0B22D60199;
	Thu,  3 Dec 2020 10:35:31 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [159.69.232.138]) by soverin.net
From: "Jack Mitchell" <ml@embed.me.uk>
To: openembedded-core@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Kai <kai.kang@windriver.com>,
	Jack Mitchell <ml@embed.me.uk>
Subject: [PATCH 3/3] systemd-conf: match ethernet interfaces by type rather than globbing
Date: Thu,  3 Dec 2020 10:35:02 +0000
Message-Id: <20201203103502.192240-3-ml@embed.me.uk>
In-Reply-To: <20201203103502.192240-1-ml@embed.me.uk>
References: <20201203103502.192240-1-ml@embed.me.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If we say we're enabling DHCP on wired/ethernet networks lets be more
specific than trying to catch everything with globbing.

Signed-off-by: Jack Mitchell <ml@embed.me.uk>
---
 meta/recipes-core/systemd/systemd-conf/wired.network | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-conf/wired.network b/meta/=
recipes-core/systemd/systemd-conf/wired.network
index dcf3534596..09367edb10 100644
--- a/meta/recipes-core/systemd/systemd-conf/wired.network
+++ b/meta/recipes-core/systemd/systemd-conf/wired.network
@@ -1,5 +1,5 @@
 [Match]
-Name=3Den* eth*
+Type=3Dether
 KernelCommandLine=3D!nfsroot
=20
 [Network]
--=20
2.29.2

