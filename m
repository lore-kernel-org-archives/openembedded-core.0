Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0C8C433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:38:05 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.64609.1656877079165382919
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=5lDh9Y/G;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id ju17so2258842pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=t2kEJHOZd41Nl3z0AmVlNYddeC9pxVwxkrlCY5WoLww=;
        b=5lDh9Y/GzojBQ6QGgP/4sQAcWucnThJmtcn7BSWnjB9U+w92wc0c172FTc7cP1vQ+0
         mFzFk8pMb4MguKFI3iR/pPAop7y9RbKC91MpxIYQEaMW60v3xF1IJHziJ7Bcm3SIkKn6
         arlBewjN1JTptlFw7e43PTVblOWATLyXeGctCgMfUx8S7EySlDsAui9laqpbQr+vbnWq
         i8QK1hLNeQQEzWPHuQVRJRislZXFROVkSPTKaBFAxT/I4IIXnw7nkAAfblamgNT1EJfF
         Q+jOcmslrxFZ4aKocpSrqkAwxFkBqS402eztzkGHpaTma+erfIbLY0Qx7r7LQacI0J87
         XVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t2kEJHOZd41Nl3z0AmVlNYddeC9pxVwxkrlCY5WoLww=;
        b=qIjSEgpLzFdSD1sUzCC39x7WIwulJDDD/0SYlLIOdjaNPrrUEFYK5+LQJP5hHUV/4L
         tNY1vkNmMf+poZHD28bKUInaWqMqfzAtusywX4kNi6Vlo8XCFRpu38YfPcrlmyPwfWCE
         NMYpkaaZyN+jDHBafSqQCTcq14KyMWJ1H3TE+dTyd4Mft4VPey8Zr/csAxG3KLNlCfmf
         sgMB8PCnxjMB54kD6+2H5dwdryyz/eyPNQz8VawDWDK/6u8wz3MbiM0VNmSFZWnUsMSa
         pgmOYEzfMUf6SfTDDV0auWjtn4PiU6skwDW/qedv/xmFBE0uU8tNbyV4n7HT6WhV28HA
         rn4Q==
X-Gm-Message-State: AJIora829dCtTVAvQTmx8SpW1MrTLXxeXBzk8AoGZEiUwB5QuvCH8wDM
	2o7K780onVIEM9GmQNam0OeHLszPdwC3hwi/
X-Google-Smtp-Source: 
 AGRyM1stu6zigQ47uo7mAu5vOxDy+eJBVuLSAa/M560+9vq/40B+GzJqrk/PhHAky/c8+AUhxkeP+A==
X-Received: by 2002:a17:90b:3584:b0:1ee:fa46:3986 with SMTP id
 mm4-20020a17090b358400b001eefa463986mr30918358pjb.227.1656877078177;
        Sun, 03 Jul 2022 12:37:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.37.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:37:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/30] coreutils: Tweak packaging variable names
 for coreutils-dev
Date: Sun,  3 Jul 2022 09:35:55 -1000
Message-Id: 
 <aa1c109283913ddb1aae0adc731ea67709bf50b9.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:38:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167580

From: Richard Purdie <richard.purdie@linuxfoundation.org>

PACKAGES uses ${PN}-dev so be consistent with the addition to the
variable to avoid weird variable conflicts.

The flags variable used here is messy, key expansion and overrides are
not supported by flags. The plain variable access does happen to work
though, so leave it as is for now and note.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a5edae117d0d2a59fd3456ccbeeb6cd35dd1951f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/coreutils/coreutils_9.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb b/meta/recipes-core/coreutils/coreutils_9.0.bb
index e4a948c7e5..865cffd4cd 100644
--- a/meta/recipes-core/coreutils/coreutils_9.0.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
@@ -174,8 +174,9 @@ RDEPENDS:${PN}-ptest += "bash findutils gawk liberror-perl make perl perl-module
 
 # -dev automatic dependencies fails as we don't want libmodule-build-perl-dev, its too heavy
 # may need tweaking if DEPENDS changes
+# Can't use ${PN}-dev here since flags with overrides and key expansion not supported
 RRECOMMENDS:coreutils-dev[nodeprrecs] = "1"
-RRECOMMENDS:coreutils-dev = "acl-dev attr-dev gmp-dev libcap-dev bash-dev findutils-dev gawk-dev shadow-dev"
+RRECOMMENDS:${PN}-dev += "acl-dev attr-dev gmp-dev libcap-dev bash-dev findutils-dev gawk-dev shadow-dev"
 
 do_install_ptest () {
     install -d ${D}${PTEST_PATH}/tests
-- 
2.25.1


