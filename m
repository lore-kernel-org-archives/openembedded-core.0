Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE73C433EF
	for <webhook@archiver.kernel.org>; Sun, 20 Feb 2022 14:10:16 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.21788.1645366215144156173
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 06:10:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N3bL0AcN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id m27so10859917wrb.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 06:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=T7cQbqbltOZOPvfnpX/i3OERKq81+SQC9LzYRXe/J+A=;
        b=N3bL0AcNGK2vrXF0Gz3ogZdsv0jRmuiskaBi71oRaAeQN/0h06EOk9IwPcVcnfxyrg
         fJCUYrFcC50UIKwHzNs+OuF1cwq3uLlWSAcCaUmdf7pt+LClOYg7os1CcrDJ4+8vnlGt
         BWu+tA3fbbw+SfBeeswFfey6fxOdVptzYqfLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T7cQbqbltOZOPvfnpX/i3OERKq81+SQC9LzYRXe/J+A=;
        b=gOhHZ9zAhCxgA0yz+hX8fpehHjrtMhBYPb7mwSKFTocBBC7pUIS1qWhfeWND7wLmm3
         BdxU9/d0Ne0NNwE7r6ntTUA/Y1ate1lUOZhp134/j9YNC/kg/3hrGSntf72ZXUVmR+jQ
         Z5BhuYP5T+8NxwJuuGlgrAE6NBdEGJR3Rt+Qd67uL7Y39U8rFrETr4ipBeX4LPZgmJ5Y
         e5m4ENBpILntmQk4ilpqtpMDce0eV88IIKUnDC4oOEGMOFfAQa2ak9gpduoMjTnB56co
         qzze864QxLB2tTpImJx6ZBMGzgKZoIN2B+POfB1s8wCwxKvWY2/Wume5Z/pY56h6njvu
         HeMA==
X-Gm-Message-State: AOAM533sBUQtHnTECCo7pxO/M2z99L+tBuwyxSOh89NemQyzeLGw6LFO
	op7LEBlystlL1wyLBtGPGenP9WXqpyHCdDxP
X-Google-Smtp-Source: 
 ABdhPJxlT9PQtyOKAmrT4Usv8aQsOnm1P1L0+zGLyoAe6smYQMRPNpZHL83Nnz1iMiNYebVTbY8m9g==
X-Received: by 2002:adf:910d:0:b0:1e3:9484:1601 with SMTP id
 j13-20020adf910d000000b001e394841601mr11792654wrj.419.1645366213211;
        Sun, 20 Feb 2022 06:10:13 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9355:e71:cc42:42f1])
        by smtp.gmail.com with ESMTPSA id
 z6-20020a1cf406000000b0037c4e2d3baesm4844548wma.19.2022.02.20.06.10.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 06:10:12 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libxml-parser-perl: Add missing RDEPENDS
Date: Sun, 20 Feb 2022 14:10:11 +0000
Message-Id: <20220220141011.3112326-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220220141011.3112326-1-richard.purdie@linuxfoundation.org>
References: <20220220141011.3112326-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Feb 2022 14:10:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161982

Running the ptest package in an image alone highlighted missing module
dependencies. Add them to fix those errors.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb
index ef7b287778b..6cd40bd2929 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb
@@ -53,6 +53,7 @@ do_install_ptest() {
 	chown -R root:root ${D}${PTEST_PATH}/samples
 }
 
+RDEPENDS:${PN} += "perl-module-carp perl-module-file-spec"
 RDEPENDS:${PN}-ptest += "perl-module-filehandle perl-module-if perl-module-test perl-module-test-more"
 
 BBCLASSEXTEND="native nativesdk"
-- 
2.32.0


