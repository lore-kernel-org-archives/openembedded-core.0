Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615C9CD98E3
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 00:02:17 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web10.5127.1696982529331697006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 17:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Eeb6F1u5;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.46, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-57b811a6ce8so3522806eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 17:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696982528; x=1697587328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P3p+GOm2CZ7u8g69/d2uNrzllODFutlBbrkYJCCHE+g=;
        b=Eeb6F1u5wp46ZkIAlO/GJnVU2TrV0zxusoztposlwNbJNU0TPKOHkasWjoafPrqKHS
         RDl/f8ecZ9RszcRCUWM8oHbrA/kRa7WqhZKA7sqa40pbA1oAhoU3XdSPmjwY/fGgkds3
         MydKRLoXJiYnRI3KS11Tr/hitFZ8oJb7ZLynPtIvxFbJhqsYX7J8Xer4VfW1MJPOIwkF
         56KXBAOaDwZg6BEzTDNKWV+dTG+l1vEil4s2GrcAxsFYu6KtPqPUSvGRoQesX7IrH8lx
         O1wrNwgkdFxdZosEazGI/mfdvsrEyRXPaZH8LOWQ83RlZpu0y5nYivmeX/sNkTwOLE4P
         eH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696982528; x=1697587328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3p+GOm2CZ7u8g69/d2uNrzllODFutlBbrkYJCCHE+g=;
        b=d/LqYz6NnYqCzCn2IptwZ6XokuVfdPg/WfU5W/hJ/0DT3mh04hihTpJwzhjn9vnv7V
         +u8bi80x9ZMdmSCGeILQWIU1ykNFgx0sSwcSGcn3QjUGYbPO3bvllrUTFjIrn3DWyUyz
         e1qAyzBRZoUzOMvfuIXHoHCTUqHapSOm6yG8vB4S1ZGp0PbJDNIxFbWF/VTVvUsrRcco
         0FB5FyFuecSXSUXkv6tyTC1+qI4CUhq9CIHJTM3D5ur7P+KUAcG++Kj5pBei/D0N64oa
         lTkQuyuMqZdfgghytveLQjg0xuZB1wQWbFH5UZ18UKDQv92ZHyJ1Tn9sLFMYwxvIEw4y
         y8qA==
X-Gm-Message-State: AOJu0YzLIC6KBj3uXlyh+Aug6Pg28I8uO7Ao82NdZ7ZCpXSu2NDupRfU
	Q7XgGO/K1A3yfAsjWK69De88yjkXnSolyGn/RqM=
X-Google-Smtp-Source: AGHT+IEE3yx2aI5BtrjVXnLbCWpU4Hhr5627occtwi7QUlACV69iBQKJDJtZZsmH332qH8AH/94c5g==
X-Received: by 2002:a05:6358:33a5:b0:143:5180:1700 with SMTP id i37-20020a05635833a500b0014351801700mr19735990rwd.27.1696982528117;
        Tue, 10 Oct 2023 17:02:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a9-20020a63bd09000000b005891f3af36asm10758222pgf.87.2023.10.10.17.02.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 17:02:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 12/20] libsoup-2.4: update PACKAGECONFIG
Date: Tue, 10 Oct 2023 14:01:25 -1000
Message-Id: <c78a34caf466524356572b8cdd2ada615081bfc2.1696982312.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696982312.git.steve@sakoman.com>
References: <cover.1696982312.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 00:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188930

From: Ross Burton <ross.burton@arm.com>

Add explicit PACKAGECONFIGs for brotli,ntlm, and sysprof.

libsoup needs to be told where ntlm_auth will be on the target, so write
a cross file to do so.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 54b6ea078daeb58a3bb20bb4275d1140640a77d2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4_2.74.3.bb              | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 79281fbf5b..5abeced30b 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -25,12 +25,24 @@ UPSTREAM_CHECK_REGEX = "libsoup-(?P<pver>2(\.(?!99)\d+)+)\.tar"
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
 
-# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards. Disable by default.
 PACKAGECONFIG ??= ""
+PACKAGECONFIG[brotli] = "-Dbrotli=enabled,-Dbrotli=disabled,brotli"
+# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards
 PACKAGECONFIG[gnome] = "-Dgnome=true,-Dgnome=false"
 PACKAGECONFIG[gssapi] = "-Dgssapi=enabled,-Dgssapi=disabled,krb5"
-
-EXTRA_OEMESON:append = " -Dvapi=disabled -Dtls_check=false"
+PACKAGECONFIG[ntlm] = "-Dntlm=enabled,-Dntlm=disabled"
+PACKAGECONFIG[sysprof] = "-Dsysprof=enabled,-Dsysprof=disabled,sysprof"
+
+# Tell libsoup where the target ntlm_auth is installed
+do_write_config:append:class-target() {
+    cat >${WORKDIR}/soup.cross <<EOF
+[binaries]
+ntlm_auth = '${bindir}/ntlm_auth'
+EOF
+}
+EXTRA_OEMESON += "--cross-file ${WORKDIR}/soup.cross"
+
+EXTRA_OEMESON += "-Dvapi=disabled -Dtls_check=false"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.34.1


