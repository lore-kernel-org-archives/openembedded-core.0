Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2087.1794939641979607046
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 10:20:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=NB6GwD28;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so1316955e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794939640; x=1795544440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Nn1POX9cODFBsi8LJZ5H0Fcx+g7gS/zRsD1UY9XygMg=;
        b=NB6GwD28jkwTjBCW/9gmJVSeypE+99Ax6n+VP64Qj6MUOHd2X55HfZEyn8i3EqpNQR
         V5KVrcFLu1pkA1HaydUM9ejGRLRndqwsfJymeDMgLD/GXtj5x778cRyw/MRXJdylhUvn
         L0/marwTFaSYP+b0wFgUhwQThthNlMVrvpCb7PzAIW1KtZet6Sl3SWLIhq9YfJ0iwYwH
         aoarGbshzpWVtCNKMlJE6FABVEPZGdxslumbD5xKim1JrzVQQ+7tYJB+ZZBda3TbJb4n
         zeXFPqbk+DYq1xgGFqAmiM2+MBvQkvXMkgToyCb26hGKLIUaZRdyqyi+WD/pFw3yLEkR
         iIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939640; x=1795544440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Nn1POX9cODFBsi8LJZ5H0Fcx+g7gS/zRsD1UY9XygMg=;
        b=DuIoXVw42tAMB7+y7Vz7QgfKEhV5inuKo4hWHXQ5tYwMeTPbr+R0vaIm4b0nFnK0LH
         JapGjD1XaHW76Z/prYd/+e1/WgvC4dWluvHzQhYxcr8C5Q7QdutGaqVNVrh/me+Q4n7G
         92umIbhZOYomxpsl9U0jx3S3t/FPkAK7zk9Q1mlVKmZxLwPjv3wjXBAgbC1P+bOxbU+m
         +pwx0GOSw8eef9gaTddUSF6CuvEEOLJEBz5EhQeGs3BNTR5MAl/mziLLle9OZc4YEDr7
         68Vx50KUgkJZoIXxht+QyBkFJEH2tlf9N4DEOFi3t6Et3k4RSgngs6IbeFeeoNTg34S+
         grag==
X-Gm-Message-State: APuU4Z8XyPUeQgJgDW/K66Pav5i2npkxi1zcGt0tG1PIe7wEjrZWTbwS
	7/GUnd29RFKe/m00wzPYJ88zWoDEpPe+2uSl2XUY27ceixVAXDEKelKhx1TZ/yCVtbeleW3MyYb
	yQYo2drs=
X-Gm-Gg: AYBFou3yCpSgnoJWy209I9uy/DEBIgeBkKFxkbMmKxyMH1Dma5/B8ZOMEDAwqEGjCH8
	DMyEuI1pyI50wdb/vib5L7fSq93gvrJMixIYvSnJ0OKu1Knt82OQCuyMFmxhbGoQYCYNBS7mSTE
	2ZA5ZkSl81W4QmMuqcuOp3bA7STH6IkP7Hnhj1V+pPzFsNbJDgxQJwZ3hEb1hdlzLW9uvcxlmBS
	CkP2CcptBL67Ltl/FN9uK99/cK2owR7XmBjNDiRowaXeyPiBiYHrc+bO/64Sh7rBt8EHSkNYaXr
	ozzX7hTIrVY2ugkS+n9hAcKvQPSxo6EE1WNxKD26cTfnavNH84a0KZjwQjeXv3toByhx9TYO2kO
	GIu8J20c9dykQZTfPDhk2L4m7ARgcpz2XHOp8ei2xb+FZotQihtBUrc45pTQJpchoab2Oy04HsJ
	p2UCkiP23Dr47XpialHeMLmA+3PpMTrCEVT7BseA+TbH2iwLEpeIEDc/FDVwGyLzTvpFuyPocl4
	jHB8e/aBiR6W3AGxlCiwp7Y1Xl23SCgP+ia8xw71qUcmqcRkh2aHmrrHhuJex8jnvz1iKtZIZtP
	PyJANuWEJooI5kZEXnQQ/DyWUPr3O7phujvum106rNjSuNNBuInaY+vQLpp/2GFWg53lhtUkXG+
	gEo+UAQcFXJ6Dshgyez3q/OfwMr7p
X-Received: by 2002:a05:600c:34d5:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4bb55ab1610mr297476495e9.26.1794939640040;
        Tue, 17 Nov 2026 10:20:40 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm114337f8f.15.2026.11.17.10.20.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:20:39 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 11/17] curl: set CVE_STATUS for CVE-2026-19931
Date: Tue, 17 Nov 2026 19:20:11 +0100
Message-ID: <2927f9ec538c1f516d17f88d4fc673c87b05a561.1794939400.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794939400.git.yoann.congal@smile.fr>
References: <cover.1794939400.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 18:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250478
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Analysis:
- The advisory [1] names [2] as its fixed-in commit. It moves
  connection maintenance to admin handles, preserving the identity
  used by authentication reuse checks.
- Earlier, [4] added Negotiate/NTLM connection reuse checks,
  including an SSPI ambient-user check using recent_conn_id.
  Later, [5] removed that SSPI check; the other checks remain.
- Curl 8.19.0 predates [4]. Applying [2] alone would not reproduce
  the later upstream behavior; a source fix needs backport analysis.
- The advisory describes Negotiate reuse with empty credentials and
  lists curl 8.19.0 within the affected range [1].
- On Linux, this requires krb5 and negotiate-auth. Wrynose enables
  negotiate-auth but leaves krb5 disabled by default [3].
- Follow the merged GSS-API configuration check in [3]. Set
  not-applicable-config if either option is absent; otherwise keep
  unpatched while the source backport is deferred.
- Record the CVE as not-applicable-config unless both required
  PACKAGECONFIG options are enabled; otherwise retain unpatched status.
  The CVE_STATUS decision is conditional, not hardcoded.

Reference:
[1] https://curl.se/docs/CVE-2026-19931.html
[2] https://github.com/curl/curl/commit/7103a93b05bc69ea98ed9d05d02fa9eeba533f2f
[3] https://github.com/openembedded/openembedded-core/commit/93c410c455b92a2b1fe3b77347e57d02f344056b
[4] https://github.com/curl/curl/commit/1a17959fc7a80864c9c9b37097856bdb4a465cf8
[5] https://github.com/curl/curl/commit/1c58877705b172da892cb9c18c5edb572f2d1d73

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/curl/curl_8.19.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 80352a592a5..7807780c965 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -62,6 +62,7 @@ CVE_STATUS[CVE-2026-9547] = "not-applicable-config: vulnerable libssh backend is
 CVE_STATUS[CVE-2026-12064] = "${@bb.utils.contains('PACKAGECONFIG', 'libssh2', 'unpatched', 'not-applicable-config: SCP/SFTP support is not enabled in PACKAGECONFIG', d)}"
 CVE_STATUS[CVE-2026-8458] = "${@bb.utils.contains('PACKAGECONFIG', 'krb5 negotiate-auth', 'unpatched', 'not-applicable-config: applicable only with GSS-API-backed Negotiate authentication', d)}"
 CVE_STATUS[CVE-2026-82209] = "not-applicable-config: public suffix list support is disabled by the recipe with --without-libpsl"
+CVE_STATUS[CVE-2026-19931] = "${@bb.utils.contains('PACKAGECONFIG', 'krb5 negotiate-auth', 'unpatched', 'not-applicable-config: GSS-API Negotiate is disabled', d)}"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
