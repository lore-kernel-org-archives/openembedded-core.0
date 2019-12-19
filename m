Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 01A537FDCD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:23:26 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id d73so5423003wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N7weo64MQbSHNEgmLY7Pzo3ew6YDuM+7IxECya7nmwY=;
	b=T18uk6K54CtIeZ+aNNoILh3au4THse75wxFBR16ki+JQsujZ5vUpXscCbxvonqga+J
	hepwZq1yylrZdSf5HODHT2b6ZXgOuJWFTh25SaAeDrLgpJVIs1qdp6RbkTgubTPLWZiT
	/rzZGVydXQh9BoBvf+Yj1O/PtGxX6vicsioiMg2e0i3dpOYhPsxCyHeVRsMxqHFgmsbm
	tu4b7ZucrDAJRbubCqapc01MFcckkeWtXu0gM00Qdpe4mut6U5liBmsNfJ4cRzF4uN//
	yuVGnMlqE/5JDhEXQf/kSt+Jv97h0/Z2pnEwZZ5+JkUI4mBVFbjBbkTYJtcWkKxgdrSM
	yXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=N7weo64MQbSHNEgmLY7Pzo3ew6YDuM+7IxECya7nmwY=;
	b=lqHJHV+2WdXbKhnxK7ELj33ifiHPKLjuzlm6mpgPmV86jWEKFtt8JwRov/yJSleMsg
	4ubyZ0ranPtZXJiGFw7cb1tp27+7BMRLrEcnRBZGSv0I7/TkZDXuypVWBJAvopJZa0yl
	kVaSQwPPSE4E8ZLn59J8fvP6/xEzf5+MkKVmte5QH0Y6SFiH5R/gONTSQFz23IhLC3Rz
	aqXUaILnfE7mcsNV0XETo5nPRe6qeH+H1TRhFns24/KKvZe11y0DWdZzqvD7PTPOn1bx
	7iviendyqxgqf58jZiecD6SYCYvKO/wwQvNm2UxkOHo9frSqpFF9NbQS12r9nti5wNjT
	Pdwg==
X-Gm-Message-State: APjAAAX5t7+V4A6XwSsDVmsup9YXqxyb71ktZBALjTeBTJhY6S+rOp49
	xmppufr3DRVsz+l2tx+07sPEBrv1pF4=
X-Google-Smtp-Source: APXvYqyVb3Qkn4ZB0+Apw38OqSyWnv6X4w5rmLmi+ZXd6A98wSR7m6JL3qbvJWS0pAKGwcvGLwOqGA==
X-Received: by 2002:a05:600c:21c5:: with SMTP id
	x5mr9719324wmj.72.1576761807143; 
	Thu, 19 Dec 2019 05:23:27 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id f17sm6182584wmc.8.2019.12.19.05.23.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 05:23:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 14:22:56 +0100
Message-Id: <20191219132301.80034-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219132301.80034-1-alex.kanavin@gmail.com>
References: <20191219132301.80034-1-alex.kanavin@gmail.com>
Subject: [PATCH 11/16] epiphany: upgrade 3.34.1 -> 3.34.2
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
X-List-Received-Date: Thu, 19 Dec 2019 13:23:27 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../epiphany/{epiphany_3.34.1.bb => epiphany_3.34.2.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.34.1.bb => epiphany_3.34.2.bb} (84%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.34.1.bb b/meta/recipes-gnome/epiphany/epiphany_3.34.2.bb
similarity index 84%
rename from meta/recipes-gnome/epiphany/epiphany_3.34.1.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.34.2.bb
index cebd55dc879..a196a217dcc 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.34.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.34.2.bb
@@ -14,8 +14,8 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            "
-SRC_URI[archive.md5sum] = "50b50e18d99b19f44cc9cd419c6a4ba8"
-SRC_URI[archive.sha256sum] = "a07bc997ad2cbf14d58557bb0b63e92d8c33683680c5e50ea6f9b53b36bec1d9"
+SRC_URI[archive.md5sum] = "ae404e3a70ff904f5a23466727f8a90a"
+SRC_URI[archive.sha256sum] = "0eaa36fc7b73a23121a23b8a7ad3c18edaf5a8a6b7cdd6d630ba5b71d946a4a1"
 
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
-- 
2.17.1


