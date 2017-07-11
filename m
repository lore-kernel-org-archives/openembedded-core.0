Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7FA2777D9F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 15:06:25 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id v143so629871qkb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 08:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=kwkK2MCOPKXu+WT+2/DO05fygtRJEYOOKRGA6aoCt+U=;
	b=o5jxz68C/yEmi1svmRcouOBuii3VAz7ZcMLVviwRtZepMuOvvdaOcCTudXIl+Fab0g
	eeNQFmUZ0ryL9SGh0wQilb26CV54BkPHv6OIWSHCK0RCKbRcfO+6fRMUmbMNjtBjarMc
	AwICiXVEpUJ4/SaabIl40eskKh4n0WHoZtffq9yA2yTBR0zmOJQJqNM7M6IZTgXFCvBf
	czy/+bWxKIrQAFRZDyIyHXX/PwwB1RJmAYUV85vIj5OvkRBgJUFiqwDzCXA+AgJeBpoz
	es7BnvhEnr8p4vl2i4FStFZn8Y9+20as5QrMfBIIPHGDXyVdVzPDSnq8ZEVMbXnvp+e4
	h2BA==
X-Gm-Message-State: AIVw1130gM24FlzB8bLvZgSCsVXMGZvK2DZFH6pUpy7xexuSPaXtnMs3
	P9dDXNnMe1hBPwa9
X-Received: by 10.55.97.13 with SMTP id v13mr421521qkb.107.1499785586643;
	Tue, 11 Jul 2017 08:06:26 -0700 (PDT)
Received: from localhost.localdomain ([179.105.243.125])
	by smtp.gmail.com with ESMTPSA id j7sm128460qtb.60.2017.07.11.08.06.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Jul 2017 08:06:25 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 11 Jul 2017 12:06:16 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Jul 2017 12:06:14 -0300
Message-Id: <20170711150614.22675-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.13.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] libarchive: Upgrade to 3.3.2 release
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
X-List-Received-Date: Tue, 11 Jul 2017 15:06:34 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../libarchive/{libarchive_3.3.1.bb => libarchive_3.3.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.3.1.bb => libarchive_3.3.2.bb} (93%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.3.1.bb b/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
similarity index 93%
rename from meta/recipes-extended/libarchive/libarchive_3.3.1.bb
rename to meta/recipes-extended/libarchive/libarchive_3.3.2.bb
index 7a7da58b1f..9bf40f2609 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.3.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
@@ -34,8 +34,8 @@ EXTRA_OECONF += "--enable-largefile"
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
           "
 
-SRC_URI[md5sum] = "d2af45480aa5b0db5b5f3919cd0ea65e"
-SRC_URI[sha256sum] = "29ca5bd1624ca5a007aa57e16080262ab4379dbf8797f5c52f7ea74a3b0424e7"
+SRC_URI[md5sum] = "4583bd6b2ebf7e0e8963d90879eb1b27"
+SRC_URI[sha256sum] = "ed2dbd6954792b2c054ccf8ec4b330a54b85904a80cef477a1c74643ddafa0ce"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.13.2


