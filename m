Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B51EFA3748
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 20:16:40 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web09.2178.1666901794214716779
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 13:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P2iM3Xna;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id f27so7927372eje.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eq7d/vFDBrlqY+DwZdeqNV72amNxcshahz7AN+2U4nM=;
        b=P2iM3XnaVcB9vLPbyDipo8Fg4x7D21pnnv1UFLpCP8+iGEVU4mZWZZScEjCcT5vz/G
         1iNMyGIUMx36PIWLai7944dECefhUUTwWGxPnDLndwNVcNkO9vVl+sZKLkhbjMEkflxH
         GEPkgA5u70S8ObbLTH7BysBpcfp+L+uVeQnITom0ffJPWAgLzCOYQzp2fvn/bZuY+YLN
         yAKPEaJgF4r4JhnHCoKG5f0DcUNseIdZVy+mQInrsKJMHvhCoRsXl8RuCPbQEKz9e9iM
         6cnxGnII6BPmoRMw38JbSkBHKoP/3jUzJqz1WkpryevYpcfLCv+ulCJPwyCZ4JyJLvm2
         dZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eq7d/vFDBrlqY+DwZdeqNV72amNxcshahz7AN+2U4nM=;
        b=stwbG1AjpbCXbFDwWkV2FGz1hE6tIaQJeschFbxc016S7dvVL12KTKfdElWGKGGlP1
         9W47CEP3OoCAEVPzYjFwjdXZS44Lp+qqDtE8xLgArNij5ZokOFxuo6skNlPsfaJWUPSC
         v3wUGBl+wRIsEBmfLt2Q9sppDQ+VZL3XVSNbtY+u2RyGtGD6Qar2MI29sTK1EQ8lKyet
         v46o+h1IEe9NVKTjzyRChjvzBUHXc8VNr+4/uQvEepkFY66cxXTtmz1Q8HXtxQxN84+M
         PolqS+nAIPtI9eV1NMaOepzp2wQfDXZsws9mMQLG4eWDDje9231MmGtv9BdgJ7cEAnSL
         ABMg==
X-Gm-Message-State: ACrzQf1Xwh7a6mzLb2+kcXwVAQGE0Hkyhu/rKU87L6BJl0x68AL/rEq4
	uAkaclmfJJtYcmTmTkig5JicQGp8s8hYBw==
X-Google-Smtp-Source: AMsMyM5iwD5DtJcMQZaq17EJCyuXqLrZ7ckVlexLWgzP6wfGI0dnkvb8WILUGRrnVOrmfSuM4oUlPQ==
X-Received: by 2002:a17:907:94c7:b0:78e:1c4f:51f9 with SMTP id dn7-20020a17090794c700b0078e1c4f51f9mr45574607ejc.200.1666901792771;
        Thu, 27 Oct 2022 13:16:32 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b0077b2b0563f4sm1267225ejc.173.2022.10.27.13.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 13:16:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/23] jquery: upgrade 3.6.0 -> 3.6.1
Date: Thu, 27 Oct 2022 22:16:02 +0200
Message-Id: <20221027201611.3644334-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027201611.3644334-1-alex@linutronix.de>
References: <20221027201611.3644334-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 20:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172217

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../jquery/{jquery_3.6.0.bb => jquery_3.6.1.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/jquery/{jquery_3.6.0.bb => jquery_3.6.1.bb} (81%)

diff --git a/meta/recipes-devtools/jquery/jquery_3.6.0.bb b/meta/recipes-devtools/jquery/jquery_3.6.1.bb
similarity index 81%
rename from meta/recipes-devtools/jquery/jquery_3.6.0.bb
rename to meta/recipes-devtools/jquery/jquery_3.6.1.bb
index 39ffd38114..a474889099 100644
--- a/meta/recipes-devtools/jquery/jquery_3.6.0.bb
+++ b/meta/recipes-devtools/jquery/jquery_3.6.1.bb
@@ -13,9 +13,9 @@ SRC_URI = "\
     https://code.jquery.com/${BP}.min.map;name=map;subdir=${BP} \
     "
 
-SRC_URI[js.sha256sum] = "1fe2bb5390a75e5d61e72c107cab528fc3c29a837d69aab7d200e1dbb5dcd239"
-SRC_URI[min.sha256sum] = "ff1523fb7389539c84c65aba19260648793bb4f5e29329d2ee8804bc37a3fe6e"
-SRC_URI[map.sha256sum] = "399548fb0e7b146c12f5ba18099a47d594a970fee96212eee0ab4852f3e56782"
+SRC_URI[js.sha256sum] = "df3941e6cdaec28533ad72b7053ec05f7172be88ecada345c42736bc2ffba4d2"
+SRC_URI[min.sha256sum] = "a3cf00c109d907e543bc4f6dbc85eb31068f94515251347e9e57509b52ee3d74"
+SRC_URI[map.sha256sum] = "856ee620cebac56e872d6e99b09de05f81ccd3f3dc346e9b55eb694611a6d5e1"
 
 UPSTREAM_CHECK_REGEX = "jquery-(?P<pver>\d+(\.\d+)+)\.js"
 
-- 
2.30.2


