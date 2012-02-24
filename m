Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S0m4J-00030w-4T
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 04:43:39 +0100
Received: by pbbrp12 with SMTP id rp12so199116pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 19:35:16 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.223.167 as permitted sender) client-ip=10.68.223.167; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.223.167 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.223.167])
	by 10.68.223.167 with SMTP id qv7mr1963953pbc.139.1330054516350
	(num_hops = 1); Thu, 23 Feb 2012 19:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Uqlhs0Ek+lEP6VJIhV2g73aHd2e0BWm4ZiLG0lBzuOE=;
	b=Zj3Ulj0X+FwiS+RSe0IjRDYAqeBFOQjOUmtcDR0GSp8pIgN4htBuF9HdEIsQWxnLPr
	xtqrk5UdcSnjkhudTcf11znXvrMUMNS3n21RJHYeotPgiRUuGJObL0b3StObpKWfqi1h
	udCIDqviUI0clmfmA8bFrLbwKIkThDjOhPkUk=
Received: by 10.68.223.167 with SMTP id qv7mr1638718pbc.139.1330054516301;
	Thu, 23 Feb 2012 19:35:16 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id x3sm3155131pbn.5.2012.02.23.19.35.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 19:35:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 19:33:50 -0800
Message-Id: <8c8ecaccdb0df61b8c734b3db79bed2cc4f05445.1330053959.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1330053959.git.raj.khem@gmail.com>
References: <cover.1330053959.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] glib-networking: Add intltools-native to DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2012 03:43:39 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../glib-networking/glib-networking_2.28.7.bb      |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb b/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
index 1ae34c0..c8536e8 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 SECTION = "libs"
-DEPENDS = "glib-2.0 gnutls"
+DEPENDS = "glib-2.0 gnutls intltool-native"
 
 PR = "r1"
 
-- 
1.7.5.4



