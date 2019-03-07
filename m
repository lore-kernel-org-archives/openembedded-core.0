Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2D3767CCE0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 17:32:30 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id r124so11800524pgr.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 09:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jQ83BXbk4v7gihUCNyaEOSN08m5NPeisbPQWXJrACqw=;
	b=pTjfFoBQFWPWfKCYA9PyGXkWtl+Wo/oLJJdysVptMB06sEoW9RyvE64z48fOyUETO6
	sodYIuXNQ4dq55h6m7kEtuoiRi1+IbzXRQcZMxyQb1IDocwCknSmTWh9CQZtF8JqUJO+
	2ZctmJjuz1XuqB2cxP13r4XUrb7hwEx6QBrXMEIC27CId0cGyfpuV42huE9b6+gDqNUG
	R5tGw2nxOovikXXL140CXn01wX2lK6iOil/16zQfcLotgyhkWB78nqvbKoJ2GYYOaC73
	YUSVPqYJuvnjPbbOTQUaXJpBVrv1EEindxHbWk/3HImX/1mkBrSo340ma9UpwcSLeU5h
	ASJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jQ83BXbk4v7gihUCNyaEOSN08m5NPeisbPQWXJrACqw=;
	b=cVwAcN214mL45dmUsp1h9hgdtwZIkwLYBo6gNM/VxTCMlhno3v5Zw/bmzO0422zWac
	t7vaLA0hkrXJZMpyqMiO7MKAvIQUjclZ9wNOkuOSXuHxE99TFCfcf1sZYrsMy93jrGaB
	g0S1/KyeT23FX+cALUDLEc9qkKivzEyy0chrQ9+7oofvEd/cOZsLWvMXGeTvhRwf+8Fp
	DdX0K89q5X357crYwjDpJ2suTmvUv1HF7fAnx3ZjDhCFrh8fWJ/OWR1KNIhvaEsnM6uU
	N05T1Ec+qckY7DsQPbaTo+K5a83rPKIQALtvjBkDmau0V1T+A5VZI5Mh3AfeJLy1aeEZ
	wv6A==
X-Gm-Message-State: APjAAAUftZXLRFNFse/c4iW9F4ZYaASwtAFY7hD+AqhsxMWFvVdZCyIk
	Xg8OqqpEgUViyQFtKIG7KdgS9Wbz
X-Google-Smtp-Source: APXvYqwk5thgD/SGwha5CukNUJS15oEvcq8jtPwQ5IIz/nZom9IZouBfKvsy5GuBMGak/yfBOhsHYA==
X-Received: by 2002:a63:8b42:: with SMTP id j63mr12110421pge.79.1551979950761; 
	Thu, 07 Mar 2019 09:32:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id
	c127sm12794775pfg.133.2019.03.07.09.32.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Mar 2019 09:32:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Mar 2019 09:32:15 -0800
Message-Id: <20190307173215.18765-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] inetutils: Fix build on RISC-V
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Mar 2019 17:32:30 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index a27dbae2e6..453f485d1c 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -54,6 +54,8 @@ EXTRA_OECONF_append_libc-musl = " --disable-rsh --disable-rcp --disable-rlogin "
 do_configure_prepend () {
     export HELP2MAN='true'
     cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${S}/build-aux/config.rpath
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
     rm -f ${S}/glob/configure*
 }
 
-- 
2.21.0


