Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.16841.1618781530435598354
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 14:32:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SOr/Sjy6;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id y22-20020a17090a8b16b0290150ae1a6d2bso447404pjn.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Apr 2021 14:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qDUPkQJG1w+394uIfoP1+Al+VWIocoV/Y4ZabMVEnq4=;
        b=SOr/Sjy6UZuc6Nk83f1LOEeNGxY78R0SSVP6B335TTX4iwzzNeB66n8iBlneeg69Nf
         vNgrEzo/au4Wfo1YTYHwrOpBQl7v0vjaA6AfoI3JZnEBgq1+wZn0+l4fL9KJ+wWmqxQ5
         Oa6e/Pej4leM7TidDIG1VNGtPHJ6xh0i0Je96Li/AYaYAXyl02dP5wGOdR/bIuAKLtwZ
         KhDYTR3ugJpncP9kw9GPo9I4NVd8yWoGXOc2iLP2ZYEciIGJaqlviBtMHjUkJ+8TLhOc
         vqjBmQJt9gN2/DjM27sBb6Yupcu8WDqFA9/+P8hnFCoY58jnwWNApQqfCsaESU0wlNGr
         94nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qDUPkQJG1w+394uIfoP1+Al+VWIocoV/Y4ZabMVEnq4=;
        b=L9j0RgnWsiE0POnRnmigTzrzIyY/uq+P/RYOacBmOGDsE5jsSJRRP6w69+eAoH1AYm
         Vv144fc8k0bHEy6lWo63QEw9yV9KoNj/Q9XpG4IrKOMQ8g428C9Q5ZGgJRPV9CNLcCPG
         /1pVeXvZX1vzDIaONNFcHF7WtWOuvy/UNQcPrRocs8+W3BdDJR95T3NgYIiRS4h6W25u
         k2bCu3MfoSzyInQ4IUjVlg4APetwONplAA1S3/85oQaSoHFT8ejqs0ePxyXObNThD44X
         Efg0O6IWFvwXCiP0I7C08KGiL5oxayKpwgz5qmUMDRYMKZhm9STG1hjv5AL7F2PV0kBx
         rFvQ==
X-Gm-Message-State: AOAM532RMNioWZWhjfq0fZLdPmgdsIa4bpnY+KG3SSlBM0lgOlFl9rAj
	4JZL4bHNCEy5e4gO9hRrMfbps9imLQWa8w==
X-Google-Smtp-Source: ABdhPJwAhmLlcPKJrBW1oohE3P90hrmv1Ncr7drtrQOrRqCMSeZmKlaE7Bz1tvL8NnODhOjMEJJYWg==
X-Received: by 2002:a17:90a:d18a:: with SMTP id fu10mr21206167pjb.233.1618781529773;
        Sun, 18 Apr 2021 14:32:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id fw24sm12303500pjb.21.2021.04.18.14.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 14:32:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] epiphany: Add missing dependency on gnutls
Date: Sun, 18 Apr 2021 14:32:07 -0700
Message-Id: <20210418213207.1591440-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was being pulled in by other dependencies thus far

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.38.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
index 889de16d00..ce24336ace 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/epiphany"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr \
+DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr gnutls \
 	   gsettings-desktop-schemas libxml2-native \
 	   glib-2.0 glib-2.0-native json-glib libdazzle libhandy libportal"
 
-- 
2.31.1

