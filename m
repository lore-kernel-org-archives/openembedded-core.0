Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web08.9695.1631282891330882704
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 07:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=I/qWwwHr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.50, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f50.google.com with SMTP id o16-20020a9d2210000000b0051b1e56c98fso2372440ota.8
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 07:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PqZgCOQzntTF1MKyFx++o3VtbtlvTUB6myb9K91iLg8=;
        b=I/qWwwHrydfVTkG6G2Ibo9Ra9mcWYefoNePg4j5btAOgzhfPAn27cQ8/mpE75lGrNH
         VHM9sHRZZoWSX9bXg2thtlwFW33r5GrC4BduuBrB3r2VsAMcanNXJ0SzYZSBIGUok8xZ
         p4pT7UcdeqG0i2qO45oq/nhG4Tfi6gibgqaFncx3b6p85lCPqWuC9qvoAS3nkScOQ7/+
         +6IkSO/pS5/dvYJmAzXRKHHCdjPXAkD93MdLF1fy5bVkzntZDimrZA8/uF/Gka7b9U1z
         me3JarnpC0XxDqdzE2mHylJLAZ7stn0H+Ka/n+tUm7g7Cs9KPhk5GIkjIqmx3QjO01Nj
         6odQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PqZgCOQzntTF1MKyFx++o3VtbtlvTUB6myb9K91iLg8=;
        b=fgf9jFZP23ppVPA+S+l5PfkFDsjgAYYqMfA3WeLm5VlJsb7YSqJw33v/FX3sdrvzuS
         DI129NTcPd+tzn/EFRSzlAkbg538UwRAK+7GKaCO9DGPpkeKgeDXE/xaAdfNgNkf8bMe
         VcJp2OHJrWqaDmmdVdTf1lcPWY2s++SKNZxBAAfVrbHzS13uhkSOpTaorW+GuWNcpUn/
         xg3h1S4DIUEoIbwGfu880EXmpfrCUMGrJJl6BTrO09pZTuzMYhuiAzN9A3usEiVipHBx
         o7O1GouustNAR9E/Z3qlDGZLi2yQND0V4WtizJPJwQtFwHZw1vSTGzNK1/ZoqD3C0ZOF
         o3ag==
X-Gm-Message-State: AOAM530CxwgT0IEdN11u+h1HN+xc+vhir0d+vqf+ge4RET/NUaI/p5Gu
	XHu5a0tLjnVhQq9cmvwv5+3oK/Ttfu+v8Vsc
X-Google-Smtp-Source: ABdhPJxoXnmJvDNBXRFQtjeKayQBXctKoyeTfd9jDPPeW1BrIDcWwQdCWQo486uKeR6vADG/w+qpVQ==
X-Received: by 2002:a05:6830:14d5:: with SMTP id t21mr4583696otq.271.1631282889854;
        Fri, 10 Sep 2021 07:08:09 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s198sm1248831oie.47.2021.09.10.07.08.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 07:08:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/9] dbus: upgrade 1.12.18 -> 1.12.20
Date: Fri, 10 Sep 2021 04:07:16 -1000
Message-Id: <631cbc6bfa0fee83e28e920e6e7f2f972ecfe2b3.1631282682.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631282682.git.steve@sakoman.com>
References: <cover.1631282682.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Source: https://git.openembedded.org/openembedded-core
MR: 108825
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/openembedded-core/commit/meta/recipes-core/dbus?id=bfaef91e77cd54e4f642e966903aac3f3291c325
ChangeID: bfaef91e77cd54e4f642e966903aac3f3291c325
Description:

Bugz only update
Includes fix for CVE-2020-35512

ab88811768 (HEAD, tag: dbus-1.12.20) v1.12.20
5757fd5480 Update NEWS
f3b2574f0c userdb: Reference-count DBusUserInfo, DBusGroupInfo <- cve fix
37b36d49a6 userdb: Make lookups return a const pointer
732284d530 Solaris and derivatives do not adjust cmsg_len on MSG_CTRUNC
1f8c42c7cd Start 1.12.20 development

(From OE-Core rev: bfaef91e77cd54e4f642e966903aac3f3291c325)

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bfaef91e77cd54e4f642e966903aac3f3291c325)
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../dbus/{dbus-test_1.12.18.bb => dbus-test_1.12.20.bb}       | 0
 meta/recipes-core/dbus/dbus.inc                               | 4 ++--
 meta/recipes-core/dbus/{dbus_1.12.18.bb => dbus_1.12.20.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.12.18.bb => dbus-test_1.12.20.bb} (100%)
 rename meta/recipes-core/dbus/{dbus_1.12.18.bb => dbus_1.12.20.bb} (100%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.18.bb b/meta/recipes-core/dbus/dbus-test_1.12.20.bb
similarity index 100%
rename from meta/recipes-core/dbus/dbus-test_1.12.18.bb
rename to meta/recipes-core/dbus/dbus-test_1.12.20.bb
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 3bdb7ea4ff..dcbcc0a9d6 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -10,8 +10,8 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
 "
 
-SRC_URI[md5sum] = "4ca570c281be35d0b30ab83436712242"
-SRC_URI[sha256sum] = "64cf4d70840230e5e9bc784d153880775ab3db19d656ead8a0cb9c0ab5a95306"
+SRC_URI[md5sum] = "dfe8a71f412e0b53be26ed4fbfdc91c4"
+SRC_URI[sha256sum] = "f77620140ecb4cdc67f37fb444f8a6bea70b5b6461f12f1cbe2cec60fa7de5fe"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
diff --git a/meta/recipes-core/dbus/dbus_1.12.18.bb b/meta/recipes-core/dbus/dbus_1.12.20.bb
similarity index 100%
rename from meta/recipes-core/dbus/dbus_1.12.18.bb
rename to meta/recipes-core/dbus/dbus_1.12.20.bb
-- 
2.25.1

