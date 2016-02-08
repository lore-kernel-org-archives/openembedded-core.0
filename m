Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id D30636FF5B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 20:35:21 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id e127so1529127pfe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 12:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JCcdugQtbOV4egG2yDx+I+OK3mMNl2emd7HvqCoVhcg=;
	b=Uon4LMusOMZnlGj5WMCQUY2CD32ZhIoPlsvL6RMQzY4XvQb01suV9V5khUYeukn9wV
	WIJgYjx6B03TESm017Yj1VzrEdBl60+JLc+VRt/UOUVGzr8vl0xyQA1hJyD3cfYvDjjl
	IskTl/UimexZG1fCEU3PxO6UEWGTG0R2b3xg/FWQKIDK5X3GCNaNFZC6pJBnQRiXLwIi
	5Uvflf1R23XygVIZIjSt0xAupU2kphnJZGqlChTzL5uUX1Q0B/+xzQPYOnHUu3SM1REQ
	n3VuMiIDOFyhv23o6P0wTvaAs8MZN7E/UDNVLd3A+KDP8ioHuW3Vdj57MT4grYUj31UE
	3W3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JCcdugQtbOV4egG2yDx+I+OK3mMNl2emd7HvqCoVhcg=;
	b=Cp7d7Kd7gnFs3LRVsh1x8dWzlj57fbyZlpQUphz5GWZ91KeQMiGf2miFyalOtzPPrP
	PiUrjduBiJFyyDix6AIT7C2NLSPsoZIfzbEY9Q8UIF2nErb/sB2ry1Y162u+xHa2FnRH
	eIqFKMjmiWylraXmT2E5b5fMKc1CThqxBrOjK9v4ue7qdyP+4CdABf1CwbqfRWZbRtHR
	XMZXrMYeTux562NrL7LSP8TWDGURvhu5+eX7uLN4wUEPN5Sjb3JQBXQypu6oKp/0ikcJ
	+Yg69z+m3gCTmgbmNVXoaFsuewZuqOu2cgiv8WrnbowbxKGAhFr66/wnXSQQHfnGhUTV
	wCSQ==
X-Gm-Message-State: AG10YOSyjXJ4l1u4SkL2a/4g94CzE/ovlTwuLojJnhdWvVVE91OXecMhvpkoMPZzMcWTuw==
X-Received: by 10.98.74.144 with SMTP id c16mr19706557pfj.129.1454963722373;
	Mon, 08 Feb 2016 12:35:22 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	u90sm45313301pfa.60.2016.02.08.12.35.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Feb 2016 12:35:21 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Feb 2016 12:34:41 -0800
Message-Id: <1454963681-18756-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454963681-18756-1-git-send-email-armccurdy@gmail.com>
References: <1454963681-18756-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] libproxy: add PACKAGECONFIG control for gnome3
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
X-List-Received-Date: Mon, 08 Feb 2016 20:35:21 -0000

The gnome3 module was previously enabled by default, so enable the
gnome3 PACKAGECONFIG option by default too.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/libproxy/libproxy_0.4.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.11.bb b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
index a523857..11a23b1 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.11.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
@@ -19,9 +19,11 @@ inherit cmake pkgconfig
 
 PACKAGECONFIG ?= " \
     ${@ '' if incompatible_license_contains('GPLv3', 'x', '', d) == 'x' or bb.utils.contains('DISTRO_FEATURES', 'x11', 'x', '', d) == '' else 'gnome' } \
+    gnome3 \
 "
 
 PACKAGECONFIG[gnome] = "-DWITH_GNOME=yes,-DWITH_GNOME=no,gconf"
+PACKAGECONFIG[gnome3] = "-DWITH_GNOME3=yes,-DWITH_GNOME3=no"
 
 EXTRA_OECMAKE += " \
     -DWITH_KDE4=no \
-- 
1.9.1


