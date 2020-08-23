Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web11.181504.1598214077509952314
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rfq8RhJC;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id k25so6233375edj.13
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IZ8NDvbxCQ27ONfzL4rRqhNOAeqTYAqyAn9DD5S82ko=;
        b=rfq8RhJCkCZo6HUlinnYq5gNe+G+4CrQmlEKfPbz706nnL2sIqVDWlY4lXg8wGQCww
         w0YKdE8CRM4XAlhM2YaN7e0b56t6zY7MSALAo7Ukue6XW1bjO1oLPjs63Sp9+N6dR3tE
         wIfk6/mB0H0DRfB26GTF7ShvJ+KYl6C/sIkYm95JQeXpvuykAFYFzKlwuCYjk4J8Qvhf
         C9SdXfSvawv8IjGWVikSM4uWvVy3wI8QIygGUF2wdrDpcvznaighQB7QM1GZhfDzHPCy
         jKFmhPeq0T/50JDg/1EIPalJg7EVvxCWiK6tWMPfUntL1oridztY4qcl43No73Yv+SCG
         CPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IZ8NDvbxCQ27ONfzL4rRqhNOAeqTYAqyAn9DD5S82ko=;
        b=jQnntyGcMOyGHjSPErRCMMa7hu4R6nip/y2GFaMbi2ux8sdu3U7vgKjWfqlahKG/4p
         /oRXxI2F79K2+ae0s28gJDKXQnzafqWNXLwN9As/fTFkrHqbYL4vnQNB4NC5nPiG0mR6
         hpcWF5OWQfW0kmPt8ypYWo67y5tZoBGV0rvKtlXs5XLDP0YwYykv/lrAGpCaoM9k4c88
         buYjdfZQulkfI4NCSZMdiroB6F0yTE1rHAhjXKsPvoWrnH4vCAL8Aagp3AUZ286HHLrr
         UiF3lzTmN8n5lMaKh46t2ld0TUwI85RUJvvmEUUvdKkIN+Vopjf5PgVfEajay4KFIIGP
         agFQ==
X-Gm-Message-State: AOAM532R3myMfQypXywLLIRV1ICbUeWlmzajk4L6XEaLJeDHbRjYlVKP
	96LMYSnqI1LxCwfyVsbwvdXJPPM6xyM=
X-Google-Smtp-Source: ABdhPJzDG0QCC11kV3e8+62B+MTEIyjNS6w0rhwhDT3sJr68DNhU5B/3C93CkyrjTiG1hdw7C9Hb6A==
X-Received: by 2002:a50:ee92:: with SMTP id f18mr2473878edr.191.1598214075695;
        Sun, 23 Aug 2020 13:21:15 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:14 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/37] epiphany: upgrade 3.36.3 -> 3.36.4
Date: Sun, 23 Aug 2020 22:20:05 +0200
Message-Id: <20200823202031.24686-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../epiphany/{epiphany_3.36.3.bb => epiphany_3.36.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.36.3.bb => epiphany_3.36.4.bb} (90%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.36.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.36.4.bb
similarity index 90%
rename from meta/recipes-gnome/epiphany/epiphany_3.36.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.36.4.bb
index 8eb4ac4fcc..4c3b18331a 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.36.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.36.4.bb
@@ -14,7 +14,7 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            "
-SRC_URI[archive.sha256sum] = "621b5626374891769afec9c35946ab6c3910ea9cf9a2498bab166c99bd91e16f"
+SRC_URI[archive.sha256sum] = "588a75b1588f5a509c33cf0be6a38a0f4fc1748eeb499a51d991ddef485242bf"
 
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
-- 
2.28.0

