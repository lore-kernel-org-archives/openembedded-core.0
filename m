Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42756.1795616476486837188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 06:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=x/FhB7+J;
 spf=pass (domain: gmail.com, ip: 209.85.222.44, mailfrom: otavio.salvador@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9828fee1b4bso1830124241.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 06:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795616475; x=1796221275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWmDepgj/D3E0vqCdJEUJGWLXQ+zaKuTlctSB4lQBfA=;
        b=x/FhB7+JIE7PD7aKnY7p05JeR3fPP0oMTHWfZ3oAMHtKKs9C+paWXorXpVExT2WJaQ
         G2xe7OORePh5uHrGEm0gDdjLaTpm0Ydb40muwU05pfuW2U392rDiNE7nqaUhd71BPAXp
         LkRMPLZG0ie5GixGVy3O2OyMjHm23DJ0wIr48OXUrRTYis3FaLcuISc0hn4VCs6zeVJs
         X4A9CFxTVC9Zd7w3pfMXUM1xM0N3U3WkvJ/TbYW5aV+7bcz2aXM2eXGzN4AVzvGneFpP
         voSkXkBEaALbpobwityPsaS9Ksz1YEn47v0F9S7poXPGY7+wtVzYJ88Ui+/r7Df/fOTf
         Fb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616475; x=1796221275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PWmDepgj/D3E0vqCdJEUJGWLXQ+zaKuTlctSB4lQBfA=;
        b=OWPCuCD3ci+OgEnKNXH6gA9c8DMQXJyT5Y7gqn8kPkDzrhH826GmhPyNWE3VW2fOGW
         +CZeiHjpXLJdzZL9AUwrsWTrUDlOoInAqiNY/bJNon3X/ESu8kgCp/IQxECov91/SHrK
         6cLxLqbY4JKTm1uL2B7TDic7hq9BmAhnEyQ2fH89hws7t6v16vRoYdNYFiSN4ts0y3Po
         ibrYkxLcWBmc0wz7k4FMoxMSWpDDiNwbWdJFvXTAEO0bDafXCSwQuKUeggkK6Wpeb4Lr
         uVOquKBrBxwE51wZPreXAC0+WzgIlK340Z4NPFm7XlW4CB98L+tXl4NIfxt+QjBeqKO1
         PH8Q==
X-Gm-Message-State: APuU4Z8nw8BkFJY0Ihi+v9YYRVvrezJLNRuCR3yWVzFYN6hYhNw7QKFo
	f1H2cMcCdytCvTRS1v7Jc85hF+oeWw5TrAB6hKYeQ/XefBq+8RApWlk9uvUvJpFG
X-Gm-Gg: AZFdTZf/712AjZ2vxPFOOyH46L1KFOv5Z69IeX90SGshSms5DuxiJHY8MqH7or0O2tw
	Gk7hNGWwKPZTtKOU/IKzM0NrJwrTf01r6rEhAFqU0A8mT/AG92h7rUUEEFtB2D5y8K1H445WEaB
	49gVQCdG75XmNCn8S6Qt4hBXt70adMu+aAy4n48pSYzWqhW0GHXMCFNzdXCYdKowPw+qJ37Yltx
	xM5nJ1gn8jm31T8vKmaIwH2LSNMEixei4zAtevxMcSzRO+AaJv813aopxohS8P6VBTPyeBbGkHh
	PeAVqbUROFW3B5uwS+LXJttyaE1kWO9r5ZCLcGE93pPdeVbjrSEbgLXAT2sWHgW+thgo6KlhI21
	MsoWjd97JMRVONPRwp2ypg5uYTDPOPIfb+U5KGa6zRK+HA1UBo43aGTyheegL40L0/qo8dntZfc
	nPvu2NjrNz+tjNgEl0W4jCgBCaD8Ezt2a8mbm5okXgFMgOO48x1EKMW0YFJ4yAnyZOyCPWnA2j4
	WMaJrLUSnd2oBxUGEcPldDWVEK9yG/oVwH2LoWBOtJajNmX3+zSNnyzzdjpJXWITaiVStDaYc0f
	KAE7U8Ss3dvLZxvoDpWbEocFHJ7ZC/fD6xdxEtPx5xU1pwuOlOIRD7R82rhz5UB131LhIdczbWg
	2Jdmlo8+25+7daIlHdfP1IutvK5uIEJPuT7Wgx+DuEKjy30xCvWfA7/sOeGKGoD2nhIjIcmr8ce
	QoP8coXUXiwzFEBfVa7QIIAQbkTuiqYmBz
X-Received: by 2002:a05:6122:628b:b0:5ec:e6b8:eb94 with SMTP id 71dfb90a1353d-5ee8aefcf60mr10614694e0c.12.1795616475272;
        Wed, 25 Nov 2026 06:21:15 -0800 (PST)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([201.89.183.192])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b653081sm17473310e0c.16.2026.11.25.06.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:21:14 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio.salvador@ossystems.tech>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.tech>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	efe.canicoz@atlascopco.com
Subject: [wrynose][PATCH] multilib: make preferred_provider mirroring deterministic
Date: Wed, 25 Nov 2026 11:21:11 -0300
Message-ID: <20261125142111.2917748-1-otavio@ossystems.tech>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 14:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251188
Content-Type: text/plain; charset="utf-8"

From: Efe Can Icoz <efecanicoz@gmail.com>

Sort PREFERRED_PROVIDER_ and PREFERRED_RPROVIDER_ lists before iterating over
them to make multilib mirroring deterministic. Otherwise ordering becomes
random and if base version comes after overriden version, new created
multilib-base version is wiping previously created multilib-overriden versions
in setVar function.

Sorting providers and rproviders makes sure that base versions of any variable
comes before any of it's override definitions.

Signed-off-by: Efe Can Icoz <efe.canicoz@atlascopco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0b41c42c0258c005194ca8322a9b373e2f2e063d)
Signed-off-by: Otavio Salvador <otavio@ossystems.tech>
---
 meta/classes/multilib_global.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index d9372d9ed1..d936dfe787 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -67,7 +67,7 @@ def preferred_ml_updates(d):
     sort_versions(required_versions, "REQUIRED")
     sort_versions(preferred_versions, "PREFERRED")
 
-    for prov in providers:
+    for prov in sorted(providers):
         val = d.getVar(prov, False)
         pkg = prov.replace("PREFERRED_PROVIDER_", "")
         if pkg.endswith("-native") or "-crosssdk-" in pkg or pkg.startswith(("nativesdk-", "virtual/nativesdk-")):
@@ -112,7 +112,7 @@ def preferred_ml_updates(d):
         if prov != provexp and d.getVar(prov, False):
             d.renameVar(prov, provexp)
 
-    for prov in rproviders:
+    for prov in sorted(rproviders):
         val = d.getVar(prov, False)
         pkg = prov.replace("PREFERRED_RPROVIDER_", "")
         for p in prefixes:
-- 
2.54.0

