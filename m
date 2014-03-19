Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 390686F911
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 16:24:46 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id c41so8798111yho.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 09:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=W8uL4hSzcmIIgMFey8JYHI4nv41fg+gTpGQm7yyF9Tc=;
	b=brbcvaTBZpgE9FGVNkOgJOf/XgtiFAgHNSa15dqx/24ydBIsnsUiZH5Qwthh+txyGF
	Wk7lJ1cz3BLQTlCvr/oB3WKEQU4e4yf7Q2fl2LauO2HjFypSddmUPEAccChm9SxASQeN
	nP6Zj7JYdzWXD26+nyM2N6J9RNGB3zpe5AJic6PHRN1UJJ6LN0fuvdhTiD8N2djW2HV7
	g+onaqNdTP13jhfaJ22e6NblakE/b60eY8c3nV33oGfvQ0RcI2VZu00Ve+IcdE6qvvZK
	uzr0IzHtj9Jm6A43N4WG2vA78x+AIqNVebXBad5bcocG22LZDSP6WE/iozbh10BalLFj
	N98w==
X-Received: by 10.236.132.134 with SMTP id o6mr2775285yhi.147.1395246287766;
	Wed, 19 Mar 2014 09:24:47 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id t44sm44255054yhc.6.2014.03.19.09.24.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Mar 2014 09:24:46 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 21EAE198E98E1; Wed, 19 Mar 2014 13:24:43 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Mar 2014 13:24:40 -0300
Message-Id: <1395246282-8546-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1395246282-8546-1-git-send-email-otavio@ossystems.com.br>
References: <1395246282-8546-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/4] gsettings-desktop-schemas: Updated to 3.10.1.bb
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
X-List-Received-Date: Wed, 19 Mar 2014 16:24:49 -0000

From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>

Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...s-desktop-schemas_3.7.3.bb => gsettings-desktop-schemas_3.10.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gnome/{gsettings-desktop-schemas_3.7.3.bb => gsettings-desktop-schemas_3.10.1.bb} (68%)

diff --git a/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.10.1.bb
similarity index 68%
rename from meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
rename to meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.10.1.bb
index 40e5b11..3183402 100644
--- a/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
+++ b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.10.1.bb
@@ -12,5 +12,5 @@ inherit gnome gsettings gettext
 
 GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI[archive.md5sum] = "6dbede8f6112b7e0dd4864e979b91771"
-SRC_URI[archive.sha256sum] = "1da53e1b960f08ce4b0d472e6f339b7beaf19a7889c15911775abf4efe2ec760"
+SRC_URI[archive.md5sum] = "f9ffca591a984f19a1dd9caeb96b5f23"
+SRC_URI[archive.sha256sum] = "452378c4960a145747ec69f8c6a874e5b7715454df3e2452d1ff1a0a82e76811"
-- 
1.9.0


