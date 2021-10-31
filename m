Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33485C433EF
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:39 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.32840.1635699518595733897
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=0+v8y6EO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id t11so10071906plq.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OHqrwDzxeiM6KC6zeuvBMDVV1gc8z5ksaCDfiS8l5Sg=;
        b=0+v8y6EOkD1ejJi7gthLvfIKnFUTmdMgmFQzrRG80e5mLpgSp6Crj2v0qp7XRN4urN
         epj2WkKbQVo4yWnJYurbk2OHXnYgjSkvGX1Fo8Lx4mf91me/W7S0C5UQCdMBoC5A2NY1
         TWakYCqzf6D0CwHZSzIv6Spojj/kkKI2Cec5pwBJBblVKgRHfGVVCm4jkMTJdXBGOlLg
         dnVXGSQM56TB/7ZD+Jb70ADNInaGiyagrLllA+mJrAfS3VVpdIlVAn3NvpIbpbmcAHA7
         atFPzEyWVNyWUHilR1WrkbXoy7SI7T4kLwqa9Ot4hT5r/70Dxg0TH7YOeDF5fo5Sgae6
         JwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OHqrwDzxeiM6KC6zeuvBMDVV1gc8z5ksaCDfiS8l5Sg=;
        b=vbi4XM9JXbhoXHUFXhTPNvg3LlquTpI88HUrGv8nhKmbV6XwrF1HL94ET7I/F39CJQ
         aolQrF/VcJxYe7IGGL2AfHNfe5Ck2Cdsfrp1kV+L7U+OIJqe71Av8rCbNvGHBUcW3LD2
         TXVHzRkhqjPnPQtwzzL8fxCOVKy4ibkYfNyltbHO3E351T6dUKHjwh6fHUDIWeU4Bi9d
         hv6P42HTYL90HSh/RP4LEOTVhEl+Zg7ThC9+djnbPO+GAVOGh8KItSAe/9jN2Rj8A9bJ
         PZTQmd8cXPKIzcnixNtfhdj8VlsP208l45/fmBkvwM8lYaZm3UOSQ8OjZQ2XM82f63P7
         9m1w==
X-Gm-Message-State: AOAM530bZy4WlFe+d3EArAGnC4FOVykEasrSR6qkD6+KcoSr7hi6WF31
	CF+ltQ5daMA9M2SiI4v1BDuidc8ISQJpcmPq/ys=
X-Google-Smtp-Source: 
 ABdhPJzQQfBnVCqdzuW1xsqZcL7csf4FJzLkI7CL760Q/11ukuAGUT9uvfbZeL7RyFHGDDMvrrdY3A==
X-Received: by 2002:a17:90a:ae12:: with SMTP id
 t18mr33219131pjq.137.1635699517636;
        Sun, 31 Oct 2021 09:58:37 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/29] mirrors.bbclass: remove dead infozip mirrors
Date: Sun, 31 Oct 2021 06:57:37 -1000
Message-Id: 
 <7210c6531c2b068d71a01cd049c17e4c09618849.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157676

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0140df8724a1c73f7b62fbbbaee58c3eb119eeba)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/mirrors.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 87bba41472..ebec56c83c 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -29,7 +29,6 @@ ftp://dante.ctan.org/tex-archive ftp://ftp.fu-berlin.de/tex/CTAN \n \
 ftp://dante.ctan.org/tex-archive http://sunsite.sut.ac.jp/pub/archives/ctan/ \n \
 ftp://dante.ctan.org/tex-archive http://ctan.unsw.edu.au/ \n \
 ftp://ftp.gnutls.org/gcrypt/gnutls ${GNUPG_MIRROR}/gnutls \n \
-http://ftp.info-zip.org/pub/infozip/src/ http://mirror.switch.ch/ftp/mirror/infozip/src/ \n \
 http://ftp.info-zip.org/pub/infozip/src/ ftp://sunsite.icm.edu.pl/pub/unix/archiving/info-zip/src/ \n \
 http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/ http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/OLD/ \n \
 ${APACHE_MIRROR}  http://www.us.apache.org/dist \n \
-- 
2.25.1


