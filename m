Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14354.1795013708361960901
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 06:55:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Q0p5Q6bn;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso1683746eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 06:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795013708; x=1795618508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o0KPrVUYxBN99Ow1IrpBUH7blKeQdGGxmE5J2M5zJiA=;
        b=Q0p5Q6bnXqWIpMDHs/ePeeHY9GxHq4f8LEs8hXQ85pD2Mglp0TVg1JW6Pa5gaCHyjT
         HUVelqNuZPJuBCwKSnA1sOCwN4qplXFzWw09oc/TYNqnl/ba2YdLxWubj6O7CFvKiYoj
         1zmRHfFkHlIawm2BJkXrPL7ruzZHn+gLHekb7bxbEvNck7r5Rl3q1xWS/fC9262dR3+Y
         JdWn7picTyYBW4kmuJkKDFIMB6i99FSN8c4vPy0M+ixpfwxeWMWhwQEwLRjend9gJv0U
         WGuVfRUwL2L5lTIXtvRgQWqDyMJpmbR2Rezlc/8F1JYL4nWsjfMeXUr6VPK9Nk5GYnDe
         XEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013708; x=1795618508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o0KPrVUYxBN99Ow1IrpBUH7blKeQdGGxmE5J2M5zJiA=;
        b=1iYBfuZW/uLp0Sy4eW8gl3JoZhu7NJ01TsMKWMCl6EO7Ws7iDp/Fom52dMYCEi3Bdn
         Niei3BDnV+qEspJJcCtVAJE49r9SENlCpz5KNS2JjWkGOrFmqVQ2hMOX5QT+35enlrzY
         JGGeGnElj/6HjFNPtFtOorcxp3udHecdCXNSH72YlsKJ1c8AO2ROkvbUhROV0bVOUNDE
         o/MEuSkeXVYDv98aGC1K6QKhFvW1v0KPSKacCO5yBD+i1rNMSoZhMg8EbpZ/6f47M/U+
         oL/gXK8Qx8D0xbP7/GqB1Deuw9v8+FFw2Dd5LXLwka8ljfTHSUmRDBqpHiw2vxmEx5Fi
         925A==
X-Gm-Message-State: APuU4Z/1ABkqePEkYYGFEzG46JxAK95zE+BuROjlhpaSPbqRwsHuvECH
	jQDLpr+DuY4Y1xFCQnQ+2pbGyyWrafn+l6WmfDdkVwPJ8soe+elY22OC46EkTGBh
X-Gm-Gg: AZFdTZdbbPp3o19Zqn5hxNhdycfdc3Vv8K+oWjmLqq1cc6uiG2c25NxXl603PvYKZvC
	+YEe4j4FGLREujEODBCsaco/AS25vUP32GgUGLhe/wSACzwJBemIduqzxqOydYKfym3WhyxNlWM
	MYYHIZWv0iLi+8Nz1zakxJH4a8021bm6e2guWuUkPJe+exfMF/PfOdtUTNqzCSsFzo2haSTI7bi
	/VGnWoHJX02gv1mT1z50onRM5ANwhyCu3bCCnOY57hlG/S88UpLm18QCzbyGESjO8MsOzEFh5OI
	sH9IIbzRgvu1S5nAFicWSiwm6+qnsJAmdTFFZmrSq0xeHCuS7lbQfUeebi1Q+Ki9dEJc5q/lyZ0
	Q+sUNZ1RN0ozIjAJwDJqaddQ6xVJmgPe2QyIqN5E79Cb8lrIYi3WK2OqXuqyn0eQ54xgLgnNvo0
	btQOtVI9aH7TBj8bGtQTM1nEsOglT6o3jdDYWxCxvaz25NqnZgBk0C3RDSDM+SF/hH4SJkWelyh
	HRbJinlVMw2p89vZ5FDKhjcL+RkL5zaW2OLh5F417d+0hGs1I7kvKSyRuVqDUq7YE0ciqgdGqOj
	2L8tr7m1iA77mhDBgbEZfrFlPLq23aemulJAY4NIrIoW0C9oKqU1ESuTuRpU7VA1mJQRSxxfE4z
	MYJz+LSoG2GQK6jlVVfQgkBAlocJSZ/7Y0yiBv1El91350+goxM1LYw4AN3DNaEf0peiLOZnU2x
	IBKKM0uOLr3DK51Rqz49fm3vJADAWp1xwQzXlPXeb3WO3tk2Z9C0IuOJZZ1GMS89oh2e8jI646g
	jNl8OQSjhjpHu1Kb02txNJQ1EsW49QH+ReuHhpw1qUJCL6bq3PgojsWQ2zWvo1uafOSCYhY2KlE
	40h9laencYkdV/aREkZU7mzsQQ==
X-Received: by 2002:a05:7300:cf98:b0:36c:a390:8907 with SMTP id 5a478bee46e88-38281023d16mr3097874eec.21.1795013707392;
        Wed, 18 Nov 2026 06:55:07 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6304ff2sm8678804eec.6.2026.11.18.06.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:55:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 2/5] libidn2: Enable linker version script explicitly
Date: Wed, 18 Nov 2026 06:54:59 -0800
Message-ID: <20261118145502.3243739-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118145502.3243739-1-khem.raj@oss.qualcomm.com>
References: <20261118145502.3243739-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 14:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250552
Content-Type: text/plain; charset="utf-8"

configure's linker version script check links an empty program with a
script that assigns versions to an undefined symbol 'sym'. lld defaults to
--no-undefined-version and rejects it, so with ld-is-lld configure
decides version scripts are unsupported and the library is built without
any symbol versions, silently changing its ABI. Consumers linked earlier
against the versioned library then fail file-rdeps QA, e.g. openldap:

  libldap.so.2 requires libgnutls.so.30(GNUTLS_3_4)(64bit), but no
  providers found in RDEPENDS:openldap? [file-rdeps]

Every supported linker handles version scripts, so enable them
explicitly instead of relying on the broken probe.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-extended/libidn/libidn2_2.3.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/libidn/libidn2_2.3.8.bb b/meta/recipes-extended/libidn/libidn2_2.3.8.bb
index 37703aa929..44e6c76c6b 100644
--- a/meta/recipes-extended/libidn/libidn2_2.3.8.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.3.8.bb
@@ -19,6 +19,7 @@ DEPENDS = "virtual/libiconv libunistring"
 inherit pkgconfig autotools gettext texinfo gtk-doc lib_package
 
 EXTRA_OECONF += "--disable-rpath \
+                 --enable-ld-version-script \
                  --with-libunistring-prefix=${STAGING_EXECPREFIXDIR} \
                  "
 
