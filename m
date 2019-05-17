Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6E78A7DF61
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:00 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id c77so6287478wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QIWyWB/k+WztqpIU4hcQ/9w9DWBJlUJOF/km4/2q/Ws=;
	b=G13eHY6VnS9i4xgnjpHgEA4FwPVSSJbZaxE8htMOp+Pl2FaCfzy1kBKPVGv7LMUDjQ
	1puBUt+k543lv/8sOLh2/SkC9sv6GyyIyw6FCUgFujeZSvpD9Y2cnCI25dXthJoNMMNE
	l408pu0KI/HV2gLZUdRCVCclpL3chDjXMwcfzrCs6ZSwycfOncXzkYf9ttqqvfF1+rak
	7KhXxUeOjQIU7BL14D3CbhFa2GInIjUUkWN9oXLgN1wS0onHEKltJyTPyJcYfyuC5Bp+
	IAnSLTRV3+m89EJqGXxAQMUnp43dGnyYfKgDiNJCpMD0C3hK4+xVl9zSEA37lIkqyQTz
	7flw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QIWyWB/k+WztqpIU4hcQ/9w9DWBJlUJOF/km4/2q/Ws=;
	b=XP7deopM/q6+LOHZ861ly9ZZdVjDqmfjZTKySUQEDCJJ5CwMnk+cT78CAt6+OGpklB
	w6QtwVu+ySE22Lofuvj2f4FUYV8hSSotaR51rcNecV3bhCkEndB7c57AuFg38MxXpH13
	IIEtt9isTR64OiBGEfF4erwdjTyCw0V0WidxnC+2JGDT7wJI6Dr8zMG0LKA2tj/RI7zf
	4MLU1QPxUeL0wvzHKWXa7e+wXjwiQeta3yOLjxJYYL+hiv2FRq7PCJ6mDgH+wsCjTTVD
	g9fsJcxbzrOQe27uVOLcWQZkY1eUymZ1HUB98gI0xUM7Wvo6xGamS4sQcE0Ts6TABJGa
	LX2g==
X-Gm-Message-State: APjAAAUoMa8ZpFLkaVcAxZNfjhu4QOfF81FCXfybHyRLcf0sGa4yE+eX
	6dtWMUp15bbG6JDNk+rzRK/ReBqT
X-Google-Smtp-Source: APXvYqwDNRsK7gHEUM9yBX/JO+Z4YBLL4AntVWcCxhJmjZhXU2+mEDEsqJUnHck8eIyyhkQMzRensA==
X-Received: by 2002:a1c:f515:: with SMTP id t21mr2612370wmh.0.1558116721010;
	Fri, 17 May 2019 11:12:01 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:18 +0200
Message-Id: <20190517181151.44001-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 04/37] libdazzle: upgrade 3.32.1 -> 3.32.2
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
X-List-Received-Date: Fri, 17 May 2019 18:12:00 -0000

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


