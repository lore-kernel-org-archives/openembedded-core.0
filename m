Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3477.1792488097651620615
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 02:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vZhKgFmB;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1efc90e7cso2842605e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 02:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792488096; x=1793092896; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMi0BM+U6QQRpbmY4v7LTAFZMGcbYeGSE5BqxWE8QxE=;
        b=vZhKgFmBAkukHRhAHaSMEa195sXNNVxainclhnT9tHAlHS7A3ZSSoQg1PkHa4hIC/8
         CvaPY9IgWay9nw6+aAnm1JHAEqbPwq9mQ4zLDDXXRQdVwbN9xW3JweEGteBzjJGYKXDg
         mWtAHnTZKvjsLoDjA9wxk2FHvug2K6Cyr3Zqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792488096; x=1793092896;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nMi0BM+U6QQRpbmY4v7LTAFZMGcbYeGSE5BqxWE8QxE=;
        b=rlS3t9elDscUrVxVFdx+4zQZbgBAngC3w/djvAV3YZVpGXOkO5E1oq5gE2dN+D1XEM
         YK24nfOPNeCH/ygUk9Ue20wOC/X+a/i+z5TaT1K1wzU0FklLJXq76cvitonjefApqPiO
         ns1fKCPZSM4++JyAiaSYKFzU7gLRhnIdYurl56qI5wAX3xxv2PEjQNRx7NKuMlpHuXsg
         BHdasMPtwA9A6nZbGeGH1PhUFk/el5jGChv54tC77Vw1BPn57arfpLOVCe7zEdwTcU1e
         mr6zIhQ/ygu8IwMw3xU+LRVjogzln4VAAAQDSRJnWAWCiFAQmPmhJpNoE7lK92izhHmn
         cUzg==
X-Forwarded-Encrypted: i=1; AKwUvBwzuoHYwrp0pebXwr/OOAGbhKVzLlAKrkTM6s759XvhU0sh5Dpui0YuMMhBQmvbLrN4ih43bkF02LEYUVcouZnqsQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJ+P83aX0kOde4DH8jqyx1lUA/VTASRFgPD9W08K0RIEmNJA3MG
	BN2hhbQL95P8ZXCrhkZsgdMI7GDrGyagXlRdZUTa2eEY6soEX0j01GMeDBnSU0CVbgB++LHnI6k
	Zv4UfjUo=
X-Gm-Gg: AYBFou07G7n11LdQ7V8DGo3V7b9/b/Y2o6Po0bgIUgTt2WPX9vZ2mGivXPXudVje1Cn
	A2NPeloCEocLr5Gp7ndkvJkOnfHWdYLGhfQJYvlZliA6znypa6V1D4ROyUgJd2u6FHFDRp0k6no
	KL5Ltxc79A6aa92CPASKwmMJDXQe0IvafThJqq+GLMpYc/3zDLjEnvCy+FPNz+O4p+LPqCNUxMO
	Vas8pZhNjrn1Im9fQ7Vnk/Yr5NsSKfoW4Hcdds3ufTdZxzTUqY+yWBfJMzOFaKZOMxQePeKr+e9
	2YH8NFc6tF3dfHSmKy+z7nmr06w3qebJFHJJu21jkzLdqZEtyq9+9LUwT4D5+QKULku21JHeey1
	cjXcEZBJ6W48nO3bP0hq7XfnmpmkFEyoI2h3KuvYSCQg3GB6hQbQ3lICkI3UQ6TSq0sKRgDxpcq
	rW71SBAYj4knRUDCm8fIjL8d9lqT2MjXrPV2dgdT+I4vKQ0mVnm6sVz7UGj5xxlyJWTs9ug7KUL
	byy/s2By/zfQnlXynNXHe4eh9UTtGpMN7BmodwXcO8RWuBoiSqHJa4B4O8=
X-Received: by 2002:a05:600c:8b2b:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-4a1f4c80374mr39384165e9.6.1792488095386;
        Tue, 20 Oct 2026 02:21:35 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d41c8asm58213865e9.8.2026.10.20.02.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 02:21:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 11:21:32 +0200
Message-Id: <DM9JZXVWJ4V4.3EQ568QELLLBR@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH 2/7] glib-2.0-initial,glib-2.0:
 upgrade 2.88.2 -> 2.88.4
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261020082611.3115623-1-daniel.turull@ericsson.com>
 <20261020082611.3115623-3-daniel.turull@ericsson.com>
In-Reply-To: <20261020082611.3115623-3-daniel.turull@ericsson.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 09:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248256

On Tue Oct 20, 2026 at 10:26 AM CEST, Daniel Turull via lists.openembedded.=
org wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Changes in 2.88.3-2.88.4 (per NEWS):
> - CVE-2026-15588: GDBusServer pre-authentication DoS via unbounded
>   SASL line buffering
> - Security hardening backport: overflow/bounds checks in
>   GSocketAddress, Unicode normalization, GResource, GVariant,
>   logging, and GMarkup error paths
> - Fix miscompilation with GCC 17 caused by G_GNUC_CONST on
>   get_type() functions
> - Fix handling of long filenames when moving files to trash
>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  .../{glib-2.0-initial_2.88.2.bb =3D> glib-2.0-initial_2.88.4.bb}  | 0
>  .../glib-2.0/{glib-2.0_2.88.2.bb =3D> glib-2.0_2.88.4.bb}         | 0
>  meta/recipes-core/glib-2.0/glib.inc                             | 2 +-
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.88.2.bb =3D> glib-=
2.0-initial_2.88.4.bb} (100%)
>  rename meta/recipes-core/glib-2.0/{glib-2.0_2.88.2.bb =3D> glib-2.0_2.88=
.4.bb} (100%)

Hello,

I already reviewed Peter's upgrade to .3.
Can you rebase on top of it[0]? Only this single patch, I took the others
of the series into my review branch.

[0]: https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable=
/wrynose-review

Thanks,
--=20
Yoann Congal
Smile ECS

