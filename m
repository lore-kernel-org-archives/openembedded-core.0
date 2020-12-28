Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.46639.1609166183103558121
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 06:36:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CwFuFm3p;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id h10so5422937pfo.9
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 06:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=3cJBKN87k+IHmCZujZzcKU5oei7UhK6OR2slSMLm/V8=;
        b=CwFuFm3p35ADIPYhIN+UOD1T6zDbTQuM4ArCrszeDUssNgXdlt+psJ1nF6Rxstqm8m
         lLYWUhu3bY4VZmS5rD5JihDuqv0cHISg3dVB5L7gHCR0ermXZIqd3T7rnEe3z3g52J41
         beYZSnJPcJIEi2ud2zSPiAbIZDPxe0+RJBaUh8hoM8g1sySPEc52VPgt1PSltZ87mctF
         auCplnldecdZXL6H+Lik4BmDGXsf10/zkg6iztE+5G8qFKmOhbPoObMRk0tiubePJ81/
         GEMZp7okBtEY+XiK8cqHX28f7JthSzwZfJRs/bUynp8cj+mFKV0kwPVhZBlBN6R00YmQ
         Ce5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=3cJBKN87k+IHmCZujZzcKU5oei7UhK6OR2slSMLm/V8=;
        b=N/3nNuHDWIEsI8Vh7zyhg7L+4L8GEUNdR3vrOkw9JzFxJ29Q5N441XAnIqY234TLcP
         SJ18eWSP85n+JGDwLie0OZzvsWdYB462viCWE9M1gJ+mENMxilLIyI0PfMVrK01rVje7
         8w3ugfSko5kkwTIvCfalQqcbnqvVr0wUgXfrcnCJW6dzlaz/1cm1ewYVH/EbiqeolZg2
         iXFruVtylfuksdZm+U6vTVBh5MDDrOxoEIbgVIAuz8R7vM3tU0JEieahvWub2oEkqjei
         2IjhqIfVXvNn5JgM4Gt8SPd/JiwNFU8C19xdNPJISqtHFoipJR68NrmJgPs2RyeiI22d
         bBYg==
X-Gm-Message-State: AOAM5320676Jtw1Rn7EyC4emc2sBOSIEZWS43O3Msl9PI3cvrN4zAYqm
	AfVXV+zLG5VyU+FPhVxDUaY9Q0Bayv3sSnjbVS0=
X-Google-Smtp-Source: ABdhPJwmBMW3wB/Ces+PgGWADxW2OTWsySxyegRgH667FN/PJzQ8QY8/I+y4+ZYFzhGsLVQTA7FV0w==
X-Received: by 2002:a62:8fca:0:b029:1a9:39bc:ed37 with SMTP id n193-20020a628fca0000b02901a939bced37mr41166403pfd.61.1609166181784;
        Mon, 28 Dec 2020 06:36:21 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b22sm36422469pfo.163.2020.12.28.06.36.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 06:36:20 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/8] man-db: Avoid reproducibility failures after fixing groff-native
Date: Mon, 28 Dec 2020 04:35:45 -1000
Message-Id: <4e41a22f704e22bef0d207c9c511168bca92cc82.1609165912.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609165912.git.steve@sakoman.com>
References: <cover.1609165912.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add some temporary bumps to versions to change the output hash so we
really can take advantage of the groff-native reproducibility fix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit af9bd5a03ecf45e92868bc49b1de5c27d94eff6f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/man-db/man-db_2.9.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/man-db/man-db_2.9.0.bb b/meta/recipes-extended/man-db/man-db_2.9.0.bb
index 5b017e8023..493fe817e5 100644
--- a/meta/recipes-extended/man-db/man-db_2.9.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.9.0.bb
@@ -21,6 +21,11 @@ inherit gettext pkgconfig autotools systemd
 EXTRA_OECONF = "--with-pager=less --with-systemdsystemunitdir=${systemd_unitdir}/system"
 EXTRA_AUTORECONF += "-I ${S}/gl/m4"
 
+# Can be dropped when the output next changes, avoids failures after
+# reproducibility issues
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
+
 do_install() {
 	autotools_do_install
 
-- 
2.17.1

