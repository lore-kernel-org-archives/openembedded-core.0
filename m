Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.12975.1611672228545547686
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=A6Vlunby;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id lw17so1386518pjb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZybtsxAb13vGH6sGv8RSSy6yLNsGj+tp62aV5u57oHc=;
        b=A6Vlunby+TPPrMRg2dtxKHH261cSEqMoLdoZWbRqICLA0v8fdmhSS+720eJZbj2z30
         +N9SIJMj9zPh7KdsduIHbVJPMnsEl2k9qrBNIlbVERq9+NdAsu67q0xD8zXZ/IU7YP8O
         j4zZXx5V1LA/026dda0rDc6TT2u1C9HM0kLMUWvNjdIZwX4mONh5pTS9CnmPyAi6cpCv
         4bQOXW89AXAt5w+UKF7c48/YtrvhiLxSf2+MKVap3gpsP239yQmGhyae2jfI3P27I1pe
         e173XCooFoBrx2mNIlddhuxBOGGR5JGmPO/Hyc9UeS//IVaU0kxw074wFy4UrRv/MN1g
         HO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZybtsxAb13vGH6sGv8RSSy6yLNsGj+tp62aV5u57oHc=;
        b=D3ei8zOZp5RTUsB7Pn79tJivGm8fUrjnW2KNu+wwWmXKY0qFeXIGVwRhzSVx+gembd
         sOkR0kk8XgjVKxMl06MaFBKbb4qT68OFRhQfqQ0XMw2kUdlA8eS1PXxsiFU3sKnXugTZ
         ZCK0+A3OdT4+qcoAB2trs1xIL/vsjLrbOM8QJXF6PNl+0mg2fLIwJUD8WMKisap00QmE
         9HIF2c+BljPBjmU3kxhAfer2Pg68Cj1Lq3AqqnEgyYK4ZdrXZD1Ogr5XRRa6Xp1ael3d
         +jFaN6tDTJq5NIc+wh7VcD6s6oQnNE6LNU7BnFbNZ+IwzLC66j22gxpqNvRye8cIn24h
         aerA==
X-Gm-Message-State: AOAM531Vd8Bl9yCK3PlI50vrAjkS/on7QNgDO0RQS+RRK3hXRmYPmTx2
	x8vQfQxKjPD335LXhHiX2vQVyo+1168sNIxqpg8=
X-Google-Smtp-Source: ABdhPJy9HVR0afVeyJAng5fwN+c3bWWuJtR/ozOmsl8K7Rkn7Pkgxe3xqp1jWVnKKAG+Zf7/kZsHgA==
X-Received: by 2002:a17:90a:a084:: with SMTP id r4mr108209pjp.190.1611672227624;
        Tue, 26 Jan 2021 06:43:47 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.43.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:43:46 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 35/46] license.bbclass: Add COMMON_LICENSE_DIR and LICENSE_PATH dirs to PSEUDO_IGNORE_PATHS
Date: Tue, 26 Jan 2021 04:41:46 -1000
Message-Id: <57abdccfba799fc1308477ea2e7b65d0894cbeb7.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Martin Jansa <Martin.Jansa@gmail.com>

* now without ${COREBASE}/meta in PSEUDO_IGNORE_PATHS after:
  73d538f207 bitbake.conf: Prevent pyc file generation in pseudo context
  the do_package tasks are failing when LICENSE_CREATE_PACKAGE is enabled
  pseudo.log shows that it's because of license texts copied from
  ${COREBASE}/meta:
  path mismatch [46 links]: ino 96733640 db '/OE/build/tmp-glibc/work/all-oe-linux/foo/1.0/image/usr/share/licenses/foo/generic_Apache-2.0' req '/OE/build/openembedded-core/meta/files/common-licenses/Apache-2.0'.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 39423a33595e7ade82fc88f55823660f8532cb84)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/license.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index f90176d6c0..dc91118340 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -31,6 +31,7 @@ python do_populate_lic() {
             f.write("%s: %s\n" % (key, info[key]))
 }
 
+PSEUDO_IGNORE_PATHS .= ",${@','.join(((d.getVar('COMMON_LICENSE_DIR') or '') + ' ' + (d.getVar('LICENSE_PATH') or '')).split())}"
 # it would be better to copy them in do_install_append, but find_license_filesa is python
 python perform_packagecopy_prepend () {
     enabled = oe.data.typed_value('LICENSE_CREATE_PACKAGE', d)
-- 
2.25.1

