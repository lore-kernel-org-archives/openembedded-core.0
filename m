Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3854.1792489410063689877
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 02:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=298pxRGO;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e10a70540so1260649f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 02:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792489408; x=1793094208; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1wG+VrHY9KJGHw8g6BX+cQmyqkJkCJzHcg+77tZDj4U=;
        b=298pxRGOdsVQRmi+p1BziXsSgHemGlfKaiWYcOIp8/BRLMgb5DSxzYA8yQnC1McTuZ
         i4F5AQr/HzRJACW0xeeM62YNPLZtERgJ/jaaD5dz9Gt0dZo00bxAhfdAc11jXrz5vc3U
         yk/tE3XxasLR/DUNv99fD2Ub5HWurQGrB4lVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792489408; x=1793094208;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1wG+VrHY9KJGHw8g6BX+cQmyqkJkCJzHcg+77tZDj4U=;
        b=0S0lHf+87yjEfSRvmQJwKcC+QoG0nM/X9VJNPvLeJydUr1GRt91YFmPO16766P2hW9
         kFhbaRG9N7CMfFaBPn8zfy+XV9zH++j1gVdLARohlRWv11i8g7US9iYGLKuMxUKLbLNF
         kQoIZrop+1IUidH/tO2INckCNj19I3c7qDidwwtuWsQIywh2t5PaTSZxKWftpJUcl0br
         63n+iTu5E0rqOkwU6IeMmoeQg6J10dQWOuVf+b7ww57YcrVhgQTWAwYK7olZuxxDn5yg
         yCr6kP5XqqLgNVyyeHQ2qMiXdDW9Yf5PWPE+m/wT0vTkYjXxkeqYvZO3jLcFzoy8FkUO
         9Xnw==
X-Forwarded-Encrypted: i=1; AKwUvBxJWOjHOByKOrgPxcwll2I/TQPjT09EONnwtQqmjOqd2Q20iOuNp8QDB4F88lymzo4ccfC8cnXv9oIZ/GFXjiM27A==@lists.openembedded.org
X-Gm-Message-State: AFq9FYL3+Gm6H/Hejm9NmLR+ih32xzcG9X9MN6DBo/IZGOKwQRkNY0n2
	LnGcNq99p4Zj2UyK3PHGGNCDh+cz7c/l/vjwqPoDP4Oi1z1BFZLSMVbRco66qDkVIIOVLPytsp2
	tZE9+3D4=
X-Gm-Gg: AYBFou1oWoX5+Aa5+BH45bcIijrn9Jb+2H6T0BgEGeejjhrjK65tK1okE7YOKhLx0bL
	jabby+7EREQV8oXOnmR47Q9GJxS3bUhiLURQ7r7Zkld5jbKfL87QELA8jmLPMrsYNV8GR2P1ziU
	UduZ3nEewfxyUoiCaGMBmdg3/LxJAPEpv7SliuyHdnZldltEz0gbHM4slrwYsgZG91VKoe0VZ4X
	Ef5CP0OpStmPmwIcsZ/6mT4rwAEpGQKzr3pYoAO7QRVQBHFzkMReptj1Z3112mM8XlTEuEn0i7G
	TMmFxhsskML6a1CA82USsjaF779KRreWo6Eu7t5dVTf+dQ28uhYgrDpZpEcTDNKGSsoMGMLw3Z1
	H7Q6RO0MLXbVkbpCQY7C2vOifNuYSRTIvKWVlkHll/HV8kWt2jMAK2YKLrr0PgBOD2xM7V1NtRt
	iRZw/QAWPALNPXfCRdgC9539RPz8IVQLThhWw4g8LV7z3+iTht96okxQY0JzEXVt7moA+KP8zMs
	oPL08Us/FFJi9DiAKOsuJLXKqDiOS7kwTW+tvsTeUyU+yYyRivOdqaK5eM=
X-Received: by 2002:a05:600c:1da1:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a1d76011ffmr239623765e9.19.1792489407869;
        Tue, 20 Oct 2026 02:43:27 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ca3597sm58163415e9.2.2026.10.20.02.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 02:43:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 11:43:27 +0200
Message-Id: <DM9KGPPMLDB3.3DH9OW39KJTSB@smile.fr>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH 3/7] python3: upgrade 3.14.7 ->
 3.14.8
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261020082611.3115623-1-daniel.turull@ericsson.com>
 <20261020082611.3115623-4-daniel.turull@ericsson.com>
In-Reply-To: <20261020082611.3115623-4-daniel.turull@ericsson.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 09:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248267

On Tue Oct 20, 2026 at 10:26 AM CEST, Daniel Turull via lists.openembedded.=
org wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Security fixes in 3.14.8:
> - CVE-2026-19445: crash in ssl when sni_callback switches SSLContext
>   and the original context is no longer referenced
> - CVE-2026-15806: scope HTTPPasswordMgr credentials to the URL scheme
>   so HTTPS credentials aren't reused for a matching HTTP URL
> - asyncio/ssl: validate server_hostname when check_hostname is set,
>   for start_tls(), create_connection() and SSLContext.wrap_bio()
> - zipfile: bound decompressed data per read for bzip2/LZMA/Zstandard
>   members, matching the existing deflate limit
> - tarfile: fix extraction filters creating directories outside the
>   destination for names that leave and re-enter it
> - Bundle libexpat 2.8.5
>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  .../python/{python3_3.14.7.bb =3D> python3_3.14.8.bb}             | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3_3.14.7.bb =3D> python3_3.14=
.8.bb} (99%)

That would put wrynose ahead of master.
I'll hold this one until master/blacksail are upgraded.

Regards,
--=20
Yoann Congal
Smile ECS

