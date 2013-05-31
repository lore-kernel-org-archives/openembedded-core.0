Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1D3726A56B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:09:20 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id n57so1293224wev.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 08:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=HpoDQ2KsRhDvrxFDwo+RhUPOcrUKSmI+bmDTeSJkqpo=;
	b=QEzljiOI5GX8KL6n+/vRlyNVcWlLT+H9wciriTF//3CanPcXGI4twe66Jr00wyS6th
	McaByGg4qJzXOSlMnmwJ0pcccqKMi223uFzO7YuZu0IqKFFqutM9LirSocoVJAybb4u+
	i5tx/vJeJNHp4tn/FfzuvLP4v5nkaEasFtJE5aZXeAm6VmE+HJJlaNFlX+3jzREQh5l5
	4rbbuNvA1IKJqpEOzjxNfNSxn/j3GwX0bTVtRB/pYY4prKtDe7E+f14CAgnDqE78FzRh
	xmS6UNtzFptpPJmOBmOZoNzkmsfrbKUYLCOFPNx9VrNd1hG/hph2Xf6CHOq3rrtGZWvU
	ssuA==
X-Received: by 10.180.21.242 with SMTP id y18mr3776172wie.7.1370012961903;
	Fri, 31 May 2013 08:09:21 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fu14sm4546170wic.8.2013.05.31.08.09.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 08:09:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 16:05:46 +0100
Message-Id: <986a0582611ff59d5a94d7e8996e6070a613942a.1370012689.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370012689.git.ross.burton@intel.com>
References: <cover.1370012689.git.ross.burton@intel.com>
In-Reply-To: <cover.1370012689.git.ross.burton@intel.com>
References: <cover.1370012689.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlnB4MMxyUFJkYIEgxMExPdZK0egnR0ewKsnrleINHuNZeVXi3FD9sJGXthf4V4JBEbNX6C
Subject: [PATCH 10/11] gtk+3: clean up libtool link creation to avoid errors in configure log
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
X-List-Received-Date: Fri, 31 May 2013 15:09:21 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 4742eb9..f4d5254 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -18,7 +18,8 @@ export PKG_CONFIG_FOR_BUILD = "${STAGING_BINDIR_NATIVE}/pkg-config-native"
 
 do_configure_prepend() {
     # Do this because the configure script is running ./libtool directly
-    ln -s ${TARGET_PREFIX}libtool libtool || true
+    rm -f libtool
+    ln -s ${TARGET_PREFIX}libtool libtool
 }
 
 # Forcibly disable the GTK+ 2 dependency as we don't want to natively build the
-- 
1.7.10.4


