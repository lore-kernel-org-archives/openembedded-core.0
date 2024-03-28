Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE80CD1283
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 16:23:05 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web11.772.1711642983164897827
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 09:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pQydofyQ;
 spf=pass (domain: konsulko.com, ip: 209.85.214.195, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-1e2178b2cf2so7175275ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 09:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1711642982; x=1712247782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wAT93UjE1Jxj4ECMbIX0/fhecHywws4Yw1mTjHSPdE=;
        b=pQydofyQTKlqx2ap/BbqwCb7PHStOAQEbxgC7oVizPxcUQrBTmUh/mrTgLgWM18+nx
         i7uY6su/DTfcR3gttqM0ncVx6HJWbOXst0M+ASKY+zauMoHv81tWBXPkIMLHDYx6FfJI
         S2R68qZa5yuQPrzR3DZfe8bv9XH132I/L5uTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711642982; x=1712247782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wAT93UjE1Jxj4ECMbIX0/fhecHywws4Yw1mTjHSPdE=;
        b=GVAikC7QRviyWh9Wy7WtTvEjp4fjwdk6cyTM+4qH6REbchwevXKN8/69WFzkp2qjHN
         poIaYUaB0EQoZk78nusQf4syW78yBAnSzWLl+sqRrvxq6kc/u+nQpzEPFcLDQ6WANvGj
         9GVj3C0gb0QIgaTkmUf4wp/s4OHWOD2Y8+F+koWXSwZLOIGwUtQcrphrvpz+wGu7PfsB
         lso9uOl+DvH3/5CpVnvvrYpOaJ1DtuIM3vAcXxyOulWwL2nJCoMmfznXGLNbx6lSugUT
         tJygqrr84GL9RUCeCY/msMVVdiYr5pehpyHm87CkUnGdN35uQquDh5PCxIpnka4Sm3Lp
         WrvQ==
X-Gm-Message-State: AOJu0YzAbxu+dDZervAbBD79WkUGYV1b0HY66g45WHjjLYaHgNEQdy88
	JbwCeIkyyQBb8H+Vch7rJGGKiD0NWNDdN7KA12mY52H8onQho8DSadrn5k9AvEeXXljA0qYzSiP
	ovXUfNKj9
X-Google-Smtp-Source: AGHT+IF87cu6KuG4txy+05RqABthzKuT8/6AJwrh5zNk+nMehrteto4JC/KPttd/WCS5ak65vj24gA==
X-Received: by 2002:a17:902:d4cb:b0:1de:e5aa:5ce with SMTP id o11-20020a170902d4cb00b001dee5aa05cemr3764528plg.41.1711642981825;
        Thu, 28 Mar 2024 09:23:01 -0700 (PDT)
Received: from localhost ([2601:1c0:ca00:bd60:6ae3:9cc1:54c1:30c])
        by smtp.gmail.com with ESMTPSA id d1-20020a170902854100b001e0d6cd042bsm1780818plo.303.2024.03.28.09.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:23:01 -0700 (PDT)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/2] coreutils: drop obsolete liberror-perl RDEPENDS
Date: Thu, 28 Mar 2024 09:22:19 -0700
Message-Id: <20240328162218.1521815-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328162218.1521815-1-tim.orling@konsulko.com>
References: <20240328162218.1521815-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 16:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197588

The upstream maintainer for Error has deprecated it for quite some time [1].
There is no dependency in current coreutils tests for it.

[YOCTO #15461]

[1] https://metacpan.org/pod/Error#WARNING

    Using the "Error" module is no longer recommended due to the black-magical
    nature of its syntactic sugar, which often tends to break. Its maintainers
    have stopped actively writing code that uses it, and discourage people from
    doing so.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-core/coreutils/coreutils_9.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_9.4.bb b/meta/recipes-core/coreutils/coreutils_9.4.bb
index fc51adcd5b1..62ecdea6ec1 100644
--- a/meta/recipes-core/coreutils/coreutils_9.4.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.4.bb
@@ -23,7 +23,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
 SRC_URI[sha256sum] = "ea613a4cf44612326e917201bbbcdfbd301de21ffc3b59b6e5c07e040b275e52"
 
 # http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842
-# 
+#
 CVE_STATUS[CVE-2016-2781] = "disputed: runcon is not really a sandbox command, use `runcon ... setsid ...` to avoid this particular issue."
 
 EXTRA_OECONF:class-target = "--enable-install-program=arch,hostname --libexecdir=${libdir}"
@@ -169,7 +169,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 inherit ptest
 
-RDEPENDS:${PN}-ptest += "bash findutils gawk liberror-perl make perl perl-modules python3-core sed shadow"
+RDEPENDS:${PN}-ptest += "bash findutils gawk make perl perl-modules python3-core sed shadow"
 
 # -dev automatic dependencies fails as we don't want libmodule-build-perl-dev, its too heavy
 # may need tweaking if DEPENDS changes
-- 
2.34.1


