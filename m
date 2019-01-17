Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by mail.openembedded.org (Postfix) with ESMTP id CB4767C21D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:27:18 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id t18-v6so9100486ljd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PcM5fG+FaAQIWhUTE71OjubrCpf4NNCRxZtQen1AuHw=;
	b=dUVRZTW0caKQK3U8/R6tn66xAL85zeGIE8HIkO3i0cLCckYqJuvOfodAgu08rhTmQU
	hJwkHKY8Z2vPgMS+NwLJiAXzn83oox7X/bmZkSk/Pmcw3HRBo4ImmiE7w9Hvql57oAol
	TG1bBuCFVnUIgRp+XbgVakhbOM0tBpk+pKAO8K6zYRuJBCgZX/0IKx62W3hkgX/i2iWB
	iQ4FWo4ZeDodrgYWYZIiAZetOkxPnaMcn/aczLwpw313MGACEFDgnILC5gP+8eGO1vVV
	gP+DGa5CDDm60jMNQt2AkPbb74h7mHmLduUBr4ogDELgnNoglyloMO0huPg8W0OyVaIP
	FI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PcM5fG+FaAQIWhUTE71OjubrCpf4NNCRxZtQen1AuHw=;
	b=sz//AAHcFGfzQhAnBMxuCShI3Ilf5RsK0ZakCugyDQiymrhISSVRXi1iigwTZouiJs
	fA2w5rX23+FIcHNX0VGd7vbXWK74BM7y0VD1+mkKatnXYgowOCs+0ndb6GBADB0ocdm9
	pBOVirzJF/ZTuUqGom3Lx+oGU6PTKSY4sj9D7Ut9j0Aee/3cLTacrgaSIblKmTdatQQU
	irdTG9CBMnIfQfjwn0HNKAYiK01cvQ5fxWwVWNGO08wZH/e4iHrt/dLUN5XywcPZ1kst
	mNn9GlO2tEaMQM9Ju+4xc/BlY9bUFckhHnd97HGuRdaLDF+I2y0/WZco2QMqpcDcuLmS
	cqsA==
X-Gm-Message-State: AJcUukfzs7z1axiIlWp2X+uDQ1vr+lNFIBlXQfwtUqmF2UUgXDc7w5ZM
	8VLC2WpWk7n3yVNujlT4l63Bw5N5
X-Google-Smtp-Source: ALg8bN4RCKim4rEyuahThXauKR4wCn0aEWKIpu7YbuxxP91P+93+Vv1aTBOyoX51njftqzOASKlEUw==
X-Received: by 2002:a2e:8007:: with SMTP id
	j7-v6mr10290274ljg.50.1547742439040; 
	Thu, 17 Jan 2019 08:27:19 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q11sm358866lfc.92.2019.01.17.08.27.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:27:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:26:59 +0100
Message-Id: <20190117162659.24997-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190117162659.24997-1-alex.kanavin@gmail.com>
References: <20190117162659.24997-1-alex.kanavin@gmail.com>
Subject: [PATCH 11/11] gobject-introspection: upgrade 1.58.2 -> 1.58.3
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
X-List-Received-Date: Thu, 17 Jan 2019 16:27:19 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-Relocate-the-repository-directory-for-native-builds.patch | 2 +-
 ...ntrospection_1.58.2.bb => gobject-introspection_1.58.3.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.58.2.bb => gobject-introspection_1.58.3.bb} (98%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
index 4017d445f75..a91d22afa7c 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -1,4 +1,4 @@
-From 47a596165e253edb45eb48a35e50f488182e13fd Mon Sep 17 00:00:00 2001
+From 7ea8c83d84a05f686128e652a5447fb5f6fb68be Mon Sep 17 00:00:00 2001
 From: Sascha Silbe <x-yo17@se-silbe.de>
 Date: Fri, 8 Jun 2018 13:55:10 +0200
 Subject: [PATCH] Relocate the repository directory for native builds
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.2.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.3.bb
similarity index 98%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.2.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.3.bb
index d00f3bd3441..4ff9b7bf4bc 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.2.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.3.bb
@@ -23,8 +23,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-$
            file://0001-Port-cross-compilation-support-to-meson.patch \
            "
 
-SRC_URI[md5sum] = "8479d6c543173721ce948484d0cd1d64"
-SRC_URI[sha256sum] = "2a5e0f69459af7ca4c41b8f4e19d9c80ddf877834bb0e7fdd420e2495ae2eda8"
+SRC_URI[md5sum] = "182432c1f33886be8f4da073218b597d"
+SRC_URI[sha256sum] = "025b632bbd944dcf11fc50d19a0ca086b83baf92b3e34936d008180d28cdc3c8"
 
 SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.17.1


