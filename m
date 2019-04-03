Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3700D7D316
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 15:44:32 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w10so22029967wrm.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 08:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=xMhZW4Vouwwgcg2JnLnqyoCUx17c8b2hdnMHkai5ruc=;
	b=PX7lGazSBkgaqyKQ4IYyRlypwws5LR9RsBQA+ywl8YM3VsMrnhVtONSbCBiid+yW43
	A+1P6owcSLGIPl/Iu/LK7aumpurrc1ijeGgb5lDJcDZ/rsN28Zo+WI86rOyRVm+9uxMr
	Lgmf49qLqfwpL18E6sbQ8I4BDRv46rXUFB71l2I5uk08lkGts/6nWnbOQfbfiGMpRInZ
	qwXnpzWyAHFM4mj64De58SivmJW7aNJCoRC6fZ8sApzyKNAhieGlJ2E+wchAbahDXFLh
	xLCDtiiGYIr+JRmMNGy9WcJFer7W4JNPB4cckip8U20eMaBFU0SyaiNJ4hjswjckKLYw
	kleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xMhZW4Vouwwgcg2JnLnqyoCUx17c8b2hdnMHkai5ruc=;
	b=r2c5L86lALUFjnIIB8waOP9tRPqhdVXcl3O8PXxnsopXzF1G7caLNyRSM8P1RigK9k
	sn6zCkcz64T7GIKUoAzdh+di6xUyVuGRo7B1k9RgX+DSo1AVfS0LjXRC05pO0wNBR86T
	L5gxp5jgeyQCtyEVcejhdGiH4vSmNu3brqw9pwVbTdA7a2yNRRq6b6BYpqzlV5/6pt8i
	JRu5AUzkvLeHnRYM2ELFExm7KkczaaD+PIExCZNARwxxnftOjK3wHWdyOP3vKJtrwhRB
	ldJxV03KNFOKFo3FDZRbUv4VG6RdhCpGRsYGE/CsBIjjFVEWNe72jETy0Xq9FU2Nq7XV
	EO0w==
X-Gm-Message-State: APjAAAXDDp3kolLTRMKOoowj24GF1VHlM6W5zvVBSd9UC+yIicO8zK9K
	QUB5jN7A2Nj6LgMiI956QFcUuuLAIUY=
X-Google-Smtp-Source: APXvYqz0Ermyj08taUIGOzr4TzAdOUiL42FiOeDlZA1+MqbyT7QVMSOcugvxKY3LzTMJG4dunCBlsw==
X-Received: by 2002:adf:eac9:: with SMTP id o9mr147416wrn.85.1554306272653;
	Wed, 03 Apr 2019 08:44:32 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a11sm17666280wrx.5.2019.04.03.08.44.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 08:44:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2019 16:44:28 +0100
Message-Id: <20190403154428.2778-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libsecret: remove intltool DEPENDS
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
X-List-Received-Date: Wed, 03 Apr 2019 15:44:32 -0000

libsecret 0.18.7 removed intltool and now uses pure gettext.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/libsecret/libsecret_0.18.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.7.bb b/meta/recipes-gnome/libsecret/libsecret_0.18.7.bb
index 0061b880533..ba38d107f7a 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.18.7.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.18.7.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
 
 inherit gnomebase gtk-doc vala gobject-introspection manpages
 
-DEPENDS += "glib-2.0 libgcrypt gettext-native intltool-native"
+DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
 PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
 
-- 
2.11.0


