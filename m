Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1DDFD7E036
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:17 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id w8so8081910wrl.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kJ8S6N0R4iYdrzveTKUFWTVXS+9V25VVy6w499vzQAs=;
	b=RZbf+FK+r4A9csiT9Qu4kpfF6mmq3KGiUbctlyMHjMLrzb6lT0nIdzcMzivrfOwIDN
	+rlwbrB3WMKAsnYkm0OA6aG8O8oDwIuuXD+QSzZ8Z81H07z0/oWc2KpmqE7vnrq6/Lf9
	Y7T0M19zAP/6jW1KMFvk31831l07jxMzJyuJ+is6IJvHRZwfqFp6pcP7/yz+bDn8hTUg
	ZL3R2mZ1dcEGplOMhrM1aiEVStI7/pb2GzdLE69EinUo5zUzQOfMwlQKGOKFToOBwvYu
	p2iM5+mb05Ip5/V3In8aX/U496RxV7gq17qFM3QtzZ9dod0pdPLQjV4m+SlpamnYca8k
	VdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kJ8S6N0R4iYdrzveTKUFWTVXS+9V25VVy6w499vzQAs=;
	b=f2aDIpzPceERTHqNjpd8HlgTGD7FbG1bQlz1PL5+xgfoixxT4eO2xD5PH4Os/zjHJY
	ynSPLau/7n+Vjox9+bDEXWE4o+9JoOZ6oknoWH2E0//fr/vC1NqVPHth3ZrfLbZ1ao5O
	D612bHGZOBct+wphQ5HhRv3ZnBERVTUWcJR90lBuz6hYZP3BLoVDImxxNP77U+0cyS+c
	eOPqZLpoN92Te/TgH/rtl05gu9uNntKodnQH93RUeLeKJ5hYbgiQP8mU6Nadi45F4lYC
	3ltvzwmkFMl5qbMHDrKkoGQ/xHU8Ux6V7DV9wPk+r63MMDSYVbrzfGu+7uMRpyFLQC9a
	xhqA==
X-Gm-Message-State: APjAAAV86JGnCIQeHFF2QIoa6Y0aYFamkm9j4EDZH++yV/+rh4WWLcg6
	ZmFcN+vk7TA2m0uKaAlX/oCTCTuS
X-Google-Smtp-Source: APXvYqyrXUB9Oy5eVpGadClQsOpx6cHXFpQADa8wia7umbGB7q4K3PKx0AKjFdlVrnIIZfXviaGBuw==
X-Received: by 2002:adf:dc08:: with SMTP id t8mr34519831wri.220.1558116738661; 
	Fri, 17 May 2019 11:12:18 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:37 +0200
Message-Id: <20190517181151.44001-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 23/37] pkgconf: upgrade 1.6.0 -> 1.6.1
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
X-List-Received-Date: Fri, 17 May 2019 18:12:18 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../pkgconf/{pkgconf_1.6.0.bb => pkgconf_1.6.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.6.0.bb => pkgconf_1.6.1.bb} (95%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.6.0.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.6.1.bb
similarity index 95%
rename from meta/recipes-devtools/pkgconf/pkgconf_1.6.0.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_1.6.1.bb
index 1452875f5d8..c60ef74226d 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.6.0.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.6.1.bb
@@ -21,8 +21,8 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[md5sum] = "0c93492d7f001e5175b0347b5472e86d"
-SRC_URI[sha256sum] = "6135a3abb576672ba54a899860442ba185063f0f90dae5892f64f7bae8e1ece5"
+SRC_URI[md5sum] = "556bae2b9e0cc7b46e7c00083cb6d95d"
+SRC_URI[sha256sum] = "22b9ee38438901f9d60f180e5182821180854fa738fd071f593ea26a81da208c"
 
 inherit autotools
 
-- 
2.17.1


