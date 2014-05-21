Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f41.google.com (unknown [209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 032B8660CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 04:45:56 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id lj1so1017502pab.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 21:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=82RELI+D/p69nxL4fguif+V/WraTLHN0/6tQS6tlMLE=;
	b=kYlHeGjkqKSfqy3cL2tiQJpa/49KW7vichCBoW1Cdy5RtiwlX0wD3r9L70h1AfZ8H0
	YJ4+5mvrXDPn3LjLCCNbnhO2lJ2/uWPZwJuLNIilrzj7Fjut6E7QWJ/a5GpQzWgaIzB1
	TOu9vIs7XXM0Lo21vIDnVr4dqd3fNKw/FSJFE5PpZlxqLQwI7k9WZp6XxXTNWySzyxmY
	rVecyQQ3OXxxAFXFgQxhK1vLEoVfkeSo43hlaQgi9NI5oX/DBW6NYZGHbUl2LnSY77kv
	zcAMO5KSFdGCKvyvYRhzoIidKOg88N8mSKWtT0OIUouXeOHDRyE6xIgOM4IfGAWw6AV+
	j1qQ==
X-Received: by 10.66.253.33 with SMTP id zx1mr56070810pac.28.1400647557521;
	Tue, 20 May 2014 21:45:57 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	ck10sm99308401pac.0.2014.05.20.21.45.55 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 20 May 2014 21:45:56 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 May 2014 21:47:29 -0700
Message-Id: <1400647649-27570-3-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1400647649-27570-1-git-send-email-ticotimo@gmail.com>
References: <1400647649-27570-1-git-send-email-ticotimo@gmail.com>
Subject: [PATCH 2/2] bitbake.conf: add default ${CPAN_MIRROR}
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
X-List-Received-Date: Wed, 21 May 2014 04:46:01 -0000

From: Tim Orling <TicoTimo@gmail.com>

* Set default to http://search.cpan.org/CPAN/, as it should be

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9f14785..fde8d76 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -570,6 +570,7 @@ XLIBS_MIRROR = "http://xlibs.freedesktop.org/release"
 XORG_MIRROR = "http://xorg.freedesktop.org/releases"
 SAVANNAH_GNU_MIRROR = "http://download.savannah.gnu.org/releases"
 SAVANNAH_NONGNU_MIRROR = "http://download.savannah.nongnu.org/releases"
+CPAN_MIRROR = "http://search.cpan.org/CPAN"
 
 # You can use the mirror of your country to get faster downloads by putting
 #  export DEBIAN_MIRROR = "ftp://ftp.de.debian.org/debian/pool"
-- 
1.8.3.2


