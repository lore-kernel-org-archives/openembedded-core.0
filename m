Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6E4FF7C9C5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:47:32 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id w2so8347405wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 09:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KrftNJwjzvfwxo7dem7+yUjm6bR0/ATy8SHJKnufwcM=;
	b=O/M7VC8ig2S6g9TYTgXtdGCE1POkz2enRN0WGJa2V2pBpgGVl2FgevpEITkTE7uCN6
	juE210bos2i3rygGHloF61TW2iN2Y1YNPy7tuKoa6so/fEsuhNnOlFY1B6xWHTAPpSI+
	EzoyYQYbvO8ud8L9uqJsh6+vMZzSMr/+rnK1dOstlTf7cjty/DDyWfKyPK3aEaXUnn0z
	JJomJlhFJmDuEroLaT7JlkfJ2cX32ZS0zytWGEJ3bFBqQeCgj8jie5oNvO2LkpCEDD62
	izelK3b2iUbdBtvYAG5r5VV3XgFjzOxe2/afKuLR63hoh4F6MGo8exO5LuieLyIfilIZ
	EBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KrftNJwjzvfwxo7dem7+yUjm6bR0/ATy8SHJKnufwcM=;
	b=qeVvDJRM03qb3OCi0rOH4PECRicgXkGyYPbkvrsajJnLb+qu35rl4PROvto/C4mcZc
	LpIjFXGwXklTpJA7t/FzJHeGn/WghsT1Tai4/SBVPs8JNfR5OSL/ItmZdIep51A95TZz
	6VnkVenkSNIHEcple7B9Z+T8hp8Cy4kqaYVh96IXb1KFyIlaMPfDLVqn/nGBoJUMtHR8
	1hadINQU35fy9EUC+s4tRi439lj4WXD3vILD16UYI7eFOU5DJiw3ON/M6G0Q5AJIGcGF
	i5MVW5ReVVdrc2/US1zfgJRxwS3N96kxr7ZiHdHUnURrG13AWWPItmsz04UVATTnzdiv
	O7Dg==
X-Gm-Message-State: AHQUAuZJ6/WgQe3NW1BrCoJzZWgX6r7EQtGw5nQK6EVkTLbX4oXmx1sm
	ZUKenxjX4PS3HW+PUs441f7jfXAq
X-Google-Smtp-Source: AHgI3IbeUIFO7pqMEeNbO/5x0ik2/bF+3pnKBTm3/3Bf/7ZTPHD7FXWxwzt4HuQjhfq/KOMTxNLv6g==
X-Received: by 2002:a5d:6288:: with SMTP id k8mr22954889wru.173.1550598453054; 
	Tue, 19 Feb 2019 09:47:33 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	z15sm2006684wmi.46.2019.02.19.09.47.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:47:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 18:47:04 +0100
Message-Id: <20190219174712.60694-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219174712.60694-1-alex.kanavin@gmail.com>
References: <20190219174712.60694-1-alex.kanavin@gmail.com>
Subject: [PATCH 12/20] gcr: upgrade 3.28.0 -> 3.28.1
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
X-List-Received-Date: Tue, 19 Feb 2019 17:47:32 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gcr/{gcr_3.28.0.bb => gcr_3.28.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gcr/{gcr_3.28.0.bb => gcr_3.28.1.bb} (86%)

diff --git a/meta/recipes-gnome/gcr/gcr_3.28.0.bb b/meta/recipes-gnome/gcr/gcr_3.28.1.bb
similarity index 86%
rename from meta/recipes-gnome/gcr/gcr_3.28.0.bb
rename to meta/recipes-gnome/gcr/gcr_3.28.1.bb
index 0796362e4b3..2299199c31f 100644
--- a/meta/recipes-gnome/gcr/gcr_3.28.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.28.1.bb
@@ -12,8 +12,8 @@ inherit gnomebase gtk-icon-cache gtk-doc distro_features_check upstream-version-
 # depends on gtk+3, but also x11 through gtk+-x11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "5321319307dad34dca2fd52e7c9c01ab"
-SRC_URI[archive.sha256sum] = "15e175d1da7ec486d59749ba34906241c442898118ce224a7b70bf2e849faf0b"
+SRC_URI[archive.md5sum] = "afd88cacfd54c1ac5b3e0eb35e3aa674"
+SRC_URI[archive.sha256sum] = "95204aa2111c301778ebfbe60975ce3ed698c958430ffcc2a785ac5e593d168b"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.17.1


