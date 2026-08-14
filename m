Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64767C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 09:54:25 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9735.1786701257649018831
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 02:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KQvBKFDr;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cace91f112so10347425ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 02:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1786701257; x=1787306057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+wfr2IHzNFzFT71yx6rDWn3OPEbQfIwP66Q/hQGLh4=;
        b=KQvBKFDr6VYB85Ja0dd8tOEnLy7lYVWQErMWb9m2MBvmxEKCEBWl91fZFBEUgQzvtw
         p5Pu4WXkS4U8OsG3xSTTj3dWblSf1bKW+Fn7tZ+R2HiPt7L+uFZknfc5I9AROV4DkuPp
         YuRHdlMdhNsAeo2ZUMaU0xG80rhfgMgdXcApk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786701257; x=1787306057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+wfr2IHzNFzFT71yx6rDWn3OPEbQfIwP66Q/hQGLh4=;
        b=O0HJ4Ybqt82JSLFyJeEkbndNTFxBIutOnrxSWzaxllPjFB/gyJQjBroMnDfwDOfG78
         RiuLOfVtw2DhTRNmSVBLWuoC/JnuwmqoyPJIbM9e2ZXZOvr5sYTUa3lDy3ko9O8BQM/H
         gHFIpkybc2SDssgpgn8sKNGD948Rjo3P+47VDLgpaN2r8ueXix9tn/6Sp+P1VP39PAyG
         JitTg5FDT4PdqJsldlMcBtBigr4j5aaqMuki1hnasBRXQmiHuL/U38+vIb53/1HqiJ+z
         0x3w2Rl+sPpcqfIq6vZGae8KyW/Qql8odbb8VyodBIZTsNkHmy/A4OX8FRGPtzzXKwGe
         tegA==
X-Gm-Message-State: AOJu0Yxj6BdOvJIfO0n5TazHP6NuH0s59wWBE6B8jkW5JmJySMw4XKwn
	z9LjZ7QffOjYm7bfFiMNvA8RIX2+2noXr1SBD7skBKcXqZm0UC2ldAAAWW6X7HRKg3oJHzeAjvj
	oilQjVyU=
X-Gm-Gg: AR+sD11lN8TwYAX07GWY6tmVGesfDJh3+tF7dHRg0uB6f8+4RA78Qrj7//EvayAAKZ2
	IupfLgJ8n/V+TyqFhOhBNyIwLpvHdvkK5rKg/2GEm2jjaG3wMZZeHw/tKZtDsWFW6psjrDliS+c
	EIahMlleBgL3VjomurZmYH1hqoVp+eDDbO7vjFhZilv9uOAAXMPy8vKTIZMbhOeQVOgXXujkeCQ
	JStZNCacciAPSbWJc7xBOlAmaO2fvQ8YnnjZA5orKTWfdoHfh8MKlhXBWliISP95l+wp9RyAIqz
	V+eVvTgY5WNlX80+OrGq2Z0TBcv22cyzuGXqivzGNK+DwRhrKQN/JBnyAyB5EeT7ouKtiDOFg6y
	jGYVkjwqdouJPWcfDqylWPFOTYEWxAUyM0iq3VdjLlfu02rzvGiSTtmU/CVfOMpoLHZqpgiwpKD
	sMYSDEMcRcd2Afk8ReBSK2T2rEaIGDF/RzgKLak/lHylKO/mJoXetsKOessQ80VkyWLZ/ZAz8FR
	fiX82ki/1fJJNhQ
X-Received: by 2002:a17:903:3d05:b0:2c9:aae1:a611 with SMTP id d9443c01a7336-2d3b0fc1d57mr56222395ad.23.1786701256835;
        Fri, 14 Aug 2026 02:54:16 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:a7de:e349:c3d5:7c44:1c80])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bda546sm2916336eec.6.2026.08.14.02.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 02:54:15 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 2/2] rpcbind: Drop dependency on quota
Date: Fri, 14 Aug 2026 15:23:56 +0530
Message-ID: <20260814095356.775418-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814095356.775418-1-vanusuri@mvista.com>
References: <20260814095356.775418-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 09:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243429

From: Michal Sieron <michalwsieron@gmail.com>

Originally added to provide rpcsvc/rquota.h header [1], it is no longer
needed since at least v1.2.6 where [2] was merged.
Not sure why, but distros like Arch and Ubuntu (possibly others too) did
not have this dependency at any point from what I could find.
Anyway, this builds just fine without quota present.

[1]: https://git.openembedded.org/openembedded-core/commit/?h=4771f4af5926d724958ba7cf46b937c53babfc7c
[2]: git://linux-nfs.org/~steved/rpcbind
     8bf0ce4a1858b5cd00440e416ecfe0fd74662a01
     rpcbind: always use inline rpcsvc constants

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4339890671f86119f7f85cb23ec84af8141f893d)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb
index 692c421cd9..000ffe3704 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.9.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "The rpcbind utility is a server that converts RPC \
 SECTION = "console/network"
 HOMEPAGE = "http://sourceforge.net/projects/rpcbind/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=201237&atid=976751"
-DEPENDS = "libtirpc quota"
+DEPENDS = "libtirpc"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \
-- 
2.43.0


