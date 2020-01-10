Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id A6CD37FFAB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 16:53:10 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id m24so2734389wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 08:53:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=o1Yn+n7H6FHD6V3uWLJAFIzRl4jTeLGnRvdNPwdZ2cs=;
	b=FgNtq2yeCdUAW3Ecnb9OwZQM/oqv/VJ/u1K/gsYUpISmkSpvOIBSwZQ8bhLPaclv9C
	gE1MQnftD/a5jf1tHJnKC9XQ+j+Qg0+4n6cHUz3qn2kKFcZR/VP5GG8CSCPnu11MUTXm
	ezegdk53HudTZg9+hzJltvhWr7sKnZd4UDyc5KowyVXFFAWTyDFPnOIAU8DjDpukO377
	/1zAY5zTKBWBAA8a4JaU7CIRcCnPwVi/ByFae4lmFkGhAnA3mYHw8F6J1zp2A2jhYNLs
	GH7kKZKESKuPi7o8bvVzTJbEY5tdC0g5gctB/smyDtqwpRHhzFAwLpPhS7VzLwlT1KWk
	VNBA==
X-Gm-Message-State: APjAAAUtIsOt6z07tG5P42gYv9dRS0dHmcRxzHSSTp3Y2VpH7zezxMqO
	6M42ay3nu7rpq6jEDKrSlP49U9Vx
X-Google-Smtp-Source: APXvYqwI1mRgGGIQsHJDATPFkq/qDNKdpzrzDS03tq+pWyHFnKKBxFH6rfTLnx3db+nHzTGwH2Nmiw==
X-Received: by 2002:a1c:7406:: with SMTP id p6mr5333158wmc.82.1578675191286;
	Fri, 10 Jan 2020 08:53:11 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c195sm3010137wmd.45.2020.01.10.08.53.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 08:53:10 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2020 16:52:48 +0000
Message-Id: <20200110165302.27426-3-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200110165302.27426-1-git@andred.net>
References: <20200110165302.27426-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 02/16] site: musl has working memcmp()
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
X-List-Received-Date: Fri, 10 Jan 2020 16:53:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I.e. a memcmp() that is 8bit clean (like glibc).

Signed-off-by: André Draszik <git@andred.net>
---
 meta/site/common-musl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/site/common-musl b/meta/site/common-musl
index 1b4fc32135..024b6ba1e5 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -4,6 +4,7 @@ ac_cv_func_realloc_works=${ac_cv_func_realloc_works=yes}
 ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
 ac_cv_func_malloc_works=${ac_cv_func_malloc_works=yes}
 ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
+ac_cv_func_memcmp_working=${ac_cv_func_memcmp_working=yes}
 ac_cv_func_getpgrp_void=yes
 ac_cv_func_setpgrp_void=yes
 ac_cv_func_setgrent_void=yes
-- 
2.23.0.rc1


