Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5444C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 02:43:11 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.1945.1667356984310796107
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 19:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=6lRqdEph;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id z5-20020a17090a8b8500b00210a3a2364fso2670532pjn.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 19:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OxOzJe6DDwf+1/vHLVOzCmOVeAgwND7ERxnfOq0hkQ=;
        b=6lRqdEph07bfkSIf8GV25/YNm3EXgTwvG/AsDtCNqZ0m7SkhvrZL1zXznOljzuGw01
         SGtFtFf2b5e+/k4UVcj69IPtegr6Nfjn5nwdU6yiU/Xu9gaI/CrACGKj/zC9dHYKCmh4
         fkeh7PhL2fiTxr2VM445CyQBweuR4qxLFJ95Vdd6xrP/Ytg6lF3dcuevGardyz3JvQHy
         GBbGR+VCHIy4M8AMCwd10JqwIdQHhdOdyacEaN0EYbcgEoeOJY12u2gijzecaXrGDPix
         J6tZB+6czi6nzSCzhG6DV8+89zW9udTy4VCwJQP2EJ0iI+Bztp9bZxVHZ6I2pF4CWE+q
         ZJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9OxOzJe6DDwf+1/vHLVOzCmOVeAgwND7ERxnfOq0hkQ=;
        b=Ka+EPqAhACvNf2CW6fEmFyKLRWhD60y0P0Ajlo/1q9CpBR34+qV9Dt1/jBACChdk1B
         OZXDdDEkildCaprXJd4x9NJfzIb/uiBWXcwmmJKL0i0JM07PdrK5chxs1nv38dmoAFs3
         H2f4rtETYj4tk1Yyb8Ovn7mXXZB9ii+rZNfzdn013dn3sTRh7/hI0SB1dhN/d61sqRHQ
         Gj7EIARgjBPL5RchIL8UBZ3YX/a0ZWEhiAox2Br4jo6HJdpk1gslZx5NeGZWC4tj4Pm9
         zzitJ2NlWYqRB/hudnEtIKzCn1nWdGThspY2UgURecsKKHNY5B1lOg8uMLCgFxeaITIz
         QfDQ==
X-Gm-Message-State: ACrzQf2okEDvms64h1kb9d4vQ62WzC0I7lr7U7b9k8rHlVmNs7FAHRXJ
	lu5z9MRLDVQy4nLLFCRypFagH8sEWu7GWDHB
X-Google-Smtp-Source: AMsMyM7eibJTVkVjYxhjJsNlGJVmOgW0WVoDMNWXpuiiee33j1vr5WVv53SVkBX4Roz/zUJGFbh3jQ==
X-Received: by 2002:a17:90a:c56:b0:213:d200:e958 with SMTP id u22-20020a17090a0c5600b00213d200e958mr16662392pje.6.1667356983379;
        Tue, 01 Nov 2022 19:43:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902e15200b00186da904da0sm1462846pla.154.2022.11.01.19.43.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 19:43:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 20/20] gnutls: upgrade 3.7.7 -> 3.7.8
Date: Tue,  1 Nov 2022 16:42:10 -1000
Message-Id: <a583ac20cc82ede59e1a4e30708cf5434b49ce37.1667356805.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667356805.git.steve@sakoman.com>
References: <cover.1667356805.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:43:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172560

From: wangmy <wangmy@fujitsu.com>

Changelog:
=========
** libgnutls: In FIPS140 mode, RSA signature verification is an approved
   operation if the key has modulus with known sizes (1024, 1280,
   1536, and 1792 bits), in addition to any modulus sizes larger than
   2048 bits, according to SP800-131A rev2.

** libgnutls: gnutls_session_channel_binding performs additional checks when
   GNUTLS_CB_TLS_EXPORTER is requested. According to RFC9622 4.2, the
   "tls-exporter" channel binding is only usable when the handshake is
   bound to a unique master secret (i.e., either TLS 1.3 or extended
   master secret extension is negotiated). Otherwise the function now
   returns error.

** libgnutls: usage of the following functions, which are designed to
   loosen restrictions imposed by allowlisting mode of configuration,
   has been additionally restricted. Invoking them is now only allowed
   if system-wide TLS priority string has not been initialized yet:
gnutls_digest_set_secure
gnutls_sign_set_secure
gnutls_sign_set_secure_for_certs
gnutls_protocol_set_enabled

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 858886aa07d0c2c2ef2489996cc8eca5fbe931fa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-support/gnutls/{gnutls_3.7.7.bb => gnutls_3.7.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.7.7.bb => gnutls_3.7.8.bb} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.7.bb b/meta/recipes-support/gnutls/gnutls_3.7.8.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.7.7.bb
rename to meta/recipes-support/gnutls/gnutls_3.7.8.bb
index c7d782e4eb..8f979a5b99 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.7.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.8.bb
@@ -24,7 +24,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
            "
 
-SRC_URI[sha256sum] = "be9143d0d58eab64dba9b77114aaafac529b6c0d7e81de6bdf1c9b59027d2106"
+SRC_URI[sha256sum] = "c58ad39af0670efe6a8aee5e3a8b2331a1200418b64b7c51977fb396d4617114"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.25.1


