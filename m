Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.61410.1600092735988764161
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DUyC6t4a;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id z17so3891620pgc.4
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=XeBE0Egf0ruHoiawtFeMy/6VloY7gHTCCvpHN2CGv9M=;
        b=DUyC6t4au9UQI+4Ig6qy5hay48404Jq1pJd4Ih8SLbNIv3f3Ra7RnDFgke9/qs58WS
         mtFm0uierlcbebyV/59S9hwennB8GioD+tuo3QNasiM/Pyu/0nRXKQu460wDYgUcm94P
         GsedcoS2HWnCUQVrvcidywCfa/S2NTOvKBdhmbE5GNDiQ1yyT/8ogseEt+70dF96Rq9m
         5UBKqU0zLfUBkbPw37TKNqXnmgsHTxKbBEffU/uqyzn28oZDCH7tKVo7EB9uDupu1IIq
         xK3UYyex/TjmJ4Qn+h6RjxJG0kfkap3YhiLVSiNPQgR3gqGcLNOnu4yGORiiEWTUZRRc
         blSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=XeBE0Egf0ruHoiawtFeMy/6VloY7gHTCCvpHN2CGv9M=;
        b=A1BF3DYsHQt0RNgulqnjCk+8o1QkOfMrekQvgLtphlEy0K9x3m/Z+pdMC/POoHN9Rz
         NAfm7x8W26AtOM3HxU5TlpRLVT3Xe6Vh0h1x/4POZvvjXj0qyYCwhMq0YQ16TehieRXH
         HcReFez4D14NE7YnVZQTkHzvao/uOstM+qa4LHIBwLxHvT0K2Nw679Ocj2HAlPxMaiDn
         vmPrjz3jrEOF9MP9AY/09KJMf3DLIVWaf4NZIshJzA6GF3kqQhtsHveIy/k1gNxf/PoR
         MUDDaELYbxLwObaTKLXLP6PNgL0x9SPmADK9RcPxePP7o41pMCO2Co5Mq6ZfiZE7ri9q
         +dfg==
X-Gm-Message-State: AOAM532j5ckPBstsIHHEiwwkuUUedevvJp96MB6WlviZqwIzysIAMdYh
	2dAbApRi/GPoSVmJR0eQGUAh03a6nX4Pe2WocxI=
X-Google-Smtp-Source: ABdhPJxPgynIPg/R7DZhMUoVoAjwYrpyoSv+SzgjBxe5bSWdL3w3wAWNNsiI6tJRzruw3GkC/m7ibA==
X-Received: by 2002:a62:7616:: with SMTP id r22mr13756451pfc.48.1600092735116;
        Mon, 14 Sep 2020 07:12:15 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.12.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:12:14 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/24] rpcbind: Use update-alternatives for rpcinfo
Date: Mon, 14 Sep 2020 04:11:23 -1000
Message-Id: <177a82f0e9f9c7fa12dd39cbbdd2ac64d920699d.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600092418.git.steve@sakoman.com>
References: <cover.1600092418.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

rpcinfo is also provided vy netkit in meta-networking

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 28183dfd7446de9113773ab89edd0afb4ab82f7e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb
index aff00e56e6..ec8f9e48b2 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb
@@ -19,7 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "ed46f09b9c0fa2d49015f6431bc5ea7b"
 SRC_URI[sha256sum] = "2ce360683963b35c19c43f0ee2c7f18aa5b81ef41c3fdbd15ffcb00b8bffda7a"
 
-inherit autotools update-rc.d systemd pkgconfig
+inherit autotools update-rc.d systemd pkgconfig update-alternatives
 
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
@@ -50,3 +50,6 @@ do_install_append () {
 		${WORKDIR}/init.d > ${D}${sysconfdir}/init.d/rpcbind
 	chmod 0755 ${D}${sysconfdir}/init.d/rpcbind
 }
+
+ALTERNATIVE_${PN} = "rpcinfo"
+ALTERNATIVE_LINK_NAME[rpcinfo] = "${bindir}/rpcinfo"
-- 
2.17.1

