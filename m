Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.25161.1591602507470244302
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ihqquJq6;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id g1so12577686edv.6
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wxz2IWEN2AXj4Hj1BKTcmKw/7+ZBHvn8XwDxfk3syzI=;
        b=ihqquJq6J9LKVxlewJPTWTv+WQjVfRcpLpNopBQr8Gf+McGYoELQQrAlZ4Pey+v2Lo
         pXRq37MNRxxV25GxyeI5tDj9jOMZ22nB3tP+ckP8hQMTUPWYSYhgidxK7y9G+3/U3Lho
         NSlVjYUr5erEjG+2xRSg+fjNo2woGsT/YHidRIfP5T3EqrCbT13zw86JQ9znh13LBLRx
         7QLr2qEGNbB01b94gzJUHA5QJ8n84rb4Z2Nh8bVzsnQLBTD5XXXe9Hr5iky5kMBA2NXT
         sUTEfpG3Mijag5IO7CvixhKlZKJIAS0Mr+hZFCTBpQIqiIn8qTna1lm8O/vFIHJs4bS4
         gw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wxz2IWEN2AXj4Hj1BKTcmKw/7+ZBHvn8XwDxfk3syzI=;
        b=PjdZwtnDW8bnIyPNMk0vwMcQu2Yam1Fe/iPDZFnGPfmFEBPMeaDYi4L+EodkX52iBV
         9qQrI18O0wL+hklm0Q4Xnze9ruOBJhbPwYlm3PZm22iNYY4PqcnFrNhD6uZNB9nrvRA5
         ewkA8OB9FQ/hpDUK4PN2hwkUpYNYWaDq2pjbnMOLsqNsOYa1hqtoXvUnj4tTXpmxx3K4
         MP+55/XWm2T6Ei45+rh1kTEw+kVzSDGPes0UQCanatzj02jTBK9JjLhATbwFlGsCOGWy
         wphHRFutQ7M5+NPe5dqoZkQqGoJ4ECsqbhb6zNijYrOGa2JvWf9lm6zrZ3Ub/GUbUOr0
         CUbw==
X-Gm-Message-State: AOAM532QUFxLNq3jkw0JTI4CxhDTWUr3A4xWTS9yBnt3IaBT6qflBFx9
	HwScPEdyTFjbvf8P53Ng65WuWWKVkZI=
X-Google-Smtp-Source: ABdhPJzA7C4GYZm1ZujXizH7IAi5p8q/mmvpDO/TX5DRcZWnx32bGIzaiZOpLdLnbIgIYo4RCD1aNg==
X-Received: by 2002:aa7:c41a:: with SMTP id j26mr21257948edq.13.1591602505829;
        Mon, 08 Jun 2020 00:48:25 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:25 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/42] epiphany: upgrade 3.36.1 -> 3.36.2
Date: Mon,  8 Jun 2020 09:46:31 +0200
Message-Id: <20200608074659.7051-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../epiphany/{epiphany_3.36.1.bb => epiphany_3.36.2.bb}        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.36.1.bb => epiphany_3.36.2.bb} (85%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.36.1.bb b/meta/recipes-gnome/epiphany/epiphany_3.36.2.bb
similarity index 85%
rename from meta/recipes-gnome/epiphany/epiphany_3.36.1.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.36.2.bb
index 8146983aef..8ac318b0d7 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.36.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.36.2.bb
@@ -14,8 +14,7 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            "
-SRC_URI[archive.md5sum] = "d66416d0be97ec7789564473337bfe57"
-SRC_URI[archive.sha256sum] = "f6f233fb43c6318476d4594707b3fdd5b4127b5e35263e73fbcad8895db8efb6"
+SRC_URI[archive.sha256sum] = "c2e676aa0fe211809a5e7e8a7e461d182890f253c53f4610f2610094b6fbfb5e"
 
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
-- 
2.26.2

