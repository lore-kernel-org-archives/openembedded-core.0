Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id A164C7FE65
	for <openembedded-core@openembedded.org>;
	Thu,  9 Jan 2020 04:50:17 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id k197so2586707pga.10
	for <openembedded-core@openembedded.org>;
	Wed, 08 Jan 2020 20:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FGdQ06L+8AO2jYEi6Yk2DLFJAG/84Bb46vaODV8E2mc=;
	b=TKAwaoQ4TiHA0isv3AGX1Yhp3LxSVUNdxBkKC2gICqZCCeFmw34Ktnorge91fYT9GF
	9MMUXdhsLaHOBVdyX7Msy7LfrHCLbD36tDU4MgFr4tkkiMIR2at2cg5UKIxvfshIi7uy
	+q/9nABSxWhG6p9w2d3gPlwM+K2/xxf8ouSh9tsj+M/lYOGl+WgUcUXoydd/L6zPoAo0
	ZyjUhB5hIsi4d+dzdwjQWGgg7olecqjCbrckkkwLjje2tjIRrX9Fbs0OvgUvopzpFnNN
	g94Cd8h11PeOUR5bP3nhv87PPIvOs4NGc4+AUkI0FSeLT8B8vI5lCpKYGhQydi9bvIrk
	rYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FGdQ06L+8AO2jYEi6Yk2DLFJAG/84Bb46vaODV8E2mc=;
	b=IaXGtZCLBQ5NZaQLY1ZB/Telinz89e/Nml0x9VFkGJ8gBDYuFz6EnKh/gDqG0dJHfA
	+3D7lbnyeyFSaVT0uz5+HNv+6QTMDr+/hesKaWavRls7PrN93n/hoM2pPAvefrhidoOE
	V2h30nl9yBZx5EDi/P9I9/J46//LSf6szcxs7ILznbE8bHvTN6mMSJonF93uj7DN6W46
	Hu5x2gg37cR0/VOajiuZsl0qxPcjvwiHKoZMR26sCWFVWVepwbTbQGYWa+2EXy41kogz
	WqCJomATNa11ELRAj+Qf1YjwsVkD/TlvbwQhEKVl+D++H2WxApYRqru2MHgfcdjcSTnW
	bqYw==
X-Gm-Message-State: APjAAAXfjkOAoLNvM20tuJG4JA1kpT4xqUF9Q3YqUwqYicHZzGKvKSXN
	YzXxhi6Om/a8AbN5KvBp9fXyMqRD
X-Google-Smtp-Source: APXvYqypSt8ZW9BV6A3S9r6Xglgfbt63aQe04CQkJZhL1gJPHTwkk4mIzvcfppNKHsFq1DBRPqgFhw==
X-Received: by 2002:a63:6f0a:: with SMTP id k10mr9296149pgc.113.1578545418630; 
	Wed, 08 Jan 2020 20:50:18 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:304b:2b9c:bcb7:ff1a])
	by smtp.gmail.com with ESMTPSA id l9sm5018427pgh.34.2020.01.08.20.50.17
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 20:50:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Wed,  8 Jan 2020 20:49:44 -0800
Message-Id: <9a2748db44c4382bbba81a5a9b96c998f0fab983.1578544698.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578544698.git.akuster808@gmail.com>
References: <cover.1578544698.git.akuster808@gmail.com>
Subject: [zeus 25/28] python3: Update to apply libgcc fix to libpython, glibc only
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
X-List-Received-Date: Thu, 09 Jan 2020 04:50:17 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to account for review feedback on list.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ec788594f3f6a47687c6eb321437f2d2b58b1518)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/python/python3_3.7.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.7.6.bb b/meta/recipes-devtools/python/python3_3.7.6.bb
index 407c5a2bd9..b33b7028d4 100644
--- a/meta/recipes-devtools/python/python3_3.7.6.bb
+++ b/meta/recipes-devtools/python/python3_3.7.6.bb
@@ -323,7 +323,7 @@ PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
 # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
-RDEPENDS_${PN} = "libgcc"
+RDEPENDS_libpython3_append_libc-glibc = " libgcc"
 RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
-- 
2.17.1


