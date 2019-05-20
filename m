Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id E861C7D735
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:36 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id r7so14751672wrr.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QIWyWB/k+WztqpIU4hcQ/9w9DWBJlUJOF/km4/2q/Ws=;
	b=BFJ22fieorI7pBdJxVb+B1NSMBcKR+pZO+gNJXa1dWFF1q14RPY8hVNYM4JLiRCNQW
	CvGKQzOuB8sm1q27XZaUxWkibY2+0LqbSRrAr/aS6kVvEaJ7u4Arf4Fuj4gJLx7LdGdO
	9SF8yB9pqACrq3uIBhId/uj4zYLuMh49jdL4FJl+Q3wFd8Zu+PpyUiX2XR1ROZN4XlQR
	JiXLCyvcjz0ufmCNqlH8CzwM2YV5+X3B0kHrJGRgq1JhOZUZS68ONwi1AoaVnlvo5/Mb
	7q/tSkYeNa7EICvgNyKn6AiHnm+2JeP8FefHAVjLb9S5IETqBFwnHd4kWbuPx/fE8SPs
	YFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QIWyWB/k+WztqpIU4hcQ/9w9DWBJlUJOF/km4/2q/Ws=;
	b=HrTym3eZz3aovFhsEpec4DWA96fVRFee95cXRGLd6i1LWLlji/h5acEf3+ymSe2hQN
	0SgFX4dSd7IcbdAsWfV3NH31RJ94u9HMIOtgr6nsrlyJK4Lh5EquDl4DNtLIpiqEBzob
	IJJSv6SotzhLgJM+MviEbT+HaHXUkF5WfHzf11vYBMhsjSA3/YIVdg/TaqlzNEbr19Il
	vRTn4HjJ/PMhAR6WVc6uFC6sai5OWwjsI3MtSUaJi1KSbEq09hm71bmPeCt91V126SYo
	5eFljCwVHX6QQHNnLRtRttPbZlsliOPYHHeFGu4ox6sm34C5cDwUBOfHnioh4eY684IR
	UVSg==
X-Gm-Message-State: APjAAAUoDUm/TiJLiaRNpeSHJhK/bXLIkHy+ZFkQcToJ95qCFJmEt7rv
	MTw76N3claS70+vsd9n0VULXymx8
X-Google-Smtp-Source: APXvYqxUdhrmMbQNuXMeSf47rW/p1vGzWsv4Te2O62GbDPE+oAWDDc+A/HzIU3b5sUQK7B/jZCNcxg==
X-Received: by 2002:adf:eb02:: with SMTP id s2mr39877449wrn.29.1558361497396; 
	Mon, 20 May 2019 07:11:37 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:10:48 +0200
Message-Id: <20190520141125.10805-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 05/42] libdazzle: upgrade 3.32.1 -> 3.32.2
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
X-List-Received-Date: Mon, 20 May 2019 14:11:37 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libdazzle/{libdazzle_3.32.1.bb => libdazzle_3.32.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libdazzle/{libdazzle_3.32.1.bb => libdazzle_3.32.2.bb} (73%)

diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.32.1.bb b/meta/recipes-gnome/libdazzle/libdazzle_3.32.2.bb
similarity index 73%
rename from meta/recipes-gnome/libdazzle/libdazzle_3.32.1.bb
rename to meta/recipes-gnome/libdazzle/libdazzle_3.32.2.bb
index dac59f86b31..58e78a5b789 100644
--- a/meta/recipes-gnome/libdazzle/libdazzle_3.32.1.bb
+++ b/meta/recipes-gnome/libdazzle/libdazzle_3.32.2.bb
@@ -7,8 +7,8 @@ inherit gnomebase upstream-version-is-even vala distro_features_check gobject-in
 
 DEPENDS = "glib-2.0-native glib-2.0 gtk+3"
 
-SRC_URI[archive.md5sum] = "5f6455ebc47e86f63b9579997137f391"
-SRC_URI[archive.sha256sum] = "238da19fdcc3ae9bb0c2d781d099fb8c6ec70c4dd3dffad80d230344ecc3f972"
+SRC_URI[archive.md5sum] = "b5c99a8f483a0defe7c7124a3220e412"
+SRC_URI[archive.sha256sum] = "413f8dfb8706760e0c649e2994bd10524ac0736601dd03ad2036293bed3bf141"
 
 GIR_MESON_OPTION = 'with_introspection'
 
-- 
2.17.1


