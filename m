Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25676.1795545070066407173
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 10:31:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Ws/RWlEX;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b467581b98so47507975e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795545068; x=1796149868; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ob/sdVecpQTJCRQ0MuQ5I8sL5iPxV+O5IWYiVVQi0M=;
        b=Ws/RWlEXVlz+QtnUm/wCu7jYS5FVu7hfaFKGYdKqhu0tH2qOxwatV+itpZQKdJvuBn
         +lYF61dDtBcdDArgycjYWPXyOGpMd5pErgr5+OdDIYvuiyx/dDBEErfn9krVWBsY4ZAt
         RLxRT8RaZqJIcMx0ZPOw4AVu5iaLl74Nrnb4aVZnbTH+iT2sucp3So0qpV+asAiHVa/P
         RVHTio/G9M1NTBAEDRpevfkS+0cXYMlCuq6rwQL7ZzZN89KJZqnYHuEJ4NnXPSKVj+c7
         PLVs1yd48HraHn+YA3YBwSAQfqny2jttijf/jFsFrlmLeeQ9lGBpnBKu9mNQhrwXMYhR
         MBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795545068; x=1796149868;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ob/sdVecpQTJCRQ0MuQ5I8sL5iPxV+O5IWYiVVQi0M=;
        b=yr3BJo3lIRfK+WkYD57pSqpQpGCpG14SRRUR99I1/kf8FfDjIkRVFtlfXyIgAB3cJ7
         FnurgB41BbmPOte6XM6tF03aoJgmHJvC2lJT9Uk3Fjum+NIh34nRE2J9ZEiqhBF3AlD9
         KE69yo0LaXcLSIvveCWua0W8tXySicsTiGX9IVvXi/520DJX0LqjOXcQkQl7o/UC8Zz7
         jCSFglx//XVKbGTB2M9i0El/+s93QIVK8Re4SJQTEI51ATBijAdkMZBbMpHK4/8Baww6
         +TGoNWjkMp1rvc1NMDQpT6PEKIl3nkNf1910kj6kcdnFaRCOwbIOyhP3qqa4S3aIFPlW
         Z3Uw==
X-Forwarded-Encrypted: i=1; AL+hErEIXAz1/EyvTY/XvdR8JOJmfs/2Hfq8RcfbYIybyuhZQBkO21RN5qquXwZgbq5RpEJp98BarLghrLeKGQi+mvh6jw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z87SNO2+tVAqcXamwn8zgD0wGyhCBwomIOF0UujMEtzlCSm1ZUs
	Wz1I0AgbPvjBbHibgxzkbJVgLe6UMWy3siA8pPlS8p+y+SFZM00AlLuk25b7Ci92Ut0=
X-Gm-Gg: AZFdTZdYZYVRLYv4O1TwleJM9zp32G/K8Dz3Piw4zQ/FCXJvwwoxcGWWv+k1UOqbLbc
	MNjCI9Kh7uAPXdidUHCCCk4OUCYfj+8wx7iG4LM80LqKjKJ0N/q6bQZVhvoi3CPkCh2Gz2NHw80
	2nL4Qb+gBZnwtJp2A8sKsh/sq4aiivn/EsrYwi/KBULBzUDMR5UOJ9tpXJJQj4ziHN00juprtmm
	D+1k2rhN9RXl0z43ExVcsegTgbezKrntAynHtYGsHhAZmflciMi8HltknUSDbgnVIKIJYMbNtJC
	5nr642+/XCPjKvD6VM+HHU8SUPICmRihvvPlsGw8qeNsWu+WAIS/1U6zwPdzgZ7KIMPY1VcYs4a
	hUVl9ygjlYR2/pxnW1kd+QABmB7Te5sfl33CULwPtSltX3zoCRaCiOQw7vQXkgIy7m/fJC19sXM
	b/WnEWxkDdFZEBxPFE9pyEsHe63qiyv3wwZmO1IBzdFdSaNdOmeqlhZTH7LoPq8iBB1Mbkstabs
	asaT7PlZJ0MQ2kLc5hyshkN+zg+SCr/HcTV1Atk3habk9/K4UiA7kqzbkHJZ4modrEHfcGaqJFY
	OsicrZ56lHSAi11y0hV2kB03jx0Q7eC4r/vhVONcCrAi2MreSqVEHcnmLbHQI+T1aYb4e1hHSJj
	w+BXcsxReFJEJdkjU
X-Received: by 2002:a05:600c:4e0d:b0:4ab:e27d:e241 with SMTP id 5b1f17b1804b1-4bb88922c6amr298619405e9.15.1795545068155;
        Tue, 24 Nov 2026 10:31:08 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm29265066f8f.42.2026.11.24.10.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 10:31:07 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 19:31:07 +0100
Message-Id: <DN3NLSMHNVF9.2EA7MPWOSXGQD@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <devanshp@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][scarthgap][PATCH 3/4] curl: Fix CVE-2026-6429
X-Mailer: aerc 0.20.0
References: <20261120130414.822854-1-devanshp@cisco.com>
 <20261120130414.822854-4-devanshp@cisco.com>
In-Reply-To: <20261120130414.822854-4-devanshp@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 18:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251074

On Fri Nov 20, 2026 at 2:04 PM CET, Devansh Patel via openembedded-core wro=
te:
> From: Devansh Patel <devanshp@cisco.com>
>
> This patch applies the upstream fix commit as referenced in [1],
> and the public CVE advisory is referenced in [2].
>
> [1] https://github.com/curl/curl/commit/b4024bf808bd558026fdc6096e8457f19=
9ace306
> [2] https://curl.se/docs/CVE-2026-6429.html
> [3] https://www.cve.org/CVERecord?id=3DCVE-2026-6429
>
> Signed-off-by: Devansh Patel <devanshp@cisco.com>
> ---
>  .../curl/curl/CVE-2026-6429_p1.patch          | 205 ++++++++++++++++++
>  .../curl/curl/CVE-2026-6429_p2.patch          |  52 +++++
>  .../curl/curl/CVE-2026-6429_p3.patch          |  29 +++
>  meta/recipes-support/curl/curl_8.7.1.bb       |   3 +
>  4 files changed, 289 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429_p1.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429_p2.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429_p3.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-6429_p1.patch b/meta=
/recipes-support/curl/curl/CVE-2026-6429_p1.patch
> new file mode 100644
> index 0000000..6b195dc
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-6429_p1.patch
> @@ -0,0 +1,205 @@
> +From ad29c80f3afaffd4ee3c902e30e331eb3667b809 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Thu, 16 Apr 2026 14:26:20 +0200
> +Subject: [PATCH] http: clear credentials better on redirect
> +
> +Verify with test 2506: netrc with redirect using proxy
> +
> +Updated test 998 which was wrong.
> +
> +Reported-by: Muhamad Arga Reksapati
> +
> +Closes #21345
> +
> +CVE: CVE-2026-6429
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/b4024bf80=
8bd558026fdc6096e8457f199ace306]
> +
> +Backport Changes:
> +- Apply Curl_http_follow changes to Curl_follow in lib/transfer.c,
> +  where 8.7.1 implements redirects. Use its newurl/state.url strings
> +  and free/Curl_safefree names instead of the newer buffer API.
> +- Fold in only the required Curl_url_same_origin helper and declaration
> +  from upstream prerequisite 32a513e180ce83d5e9b708211306045407074134:
> +  https://github.com/curl/curl/commit/32a513e180ce83d5e9b708211306045407=
074134
> +  The target lacks this helper, so the redirect fix cannot compile.
> +  Use Curl_handler/Curl_get_scheme_handler because the unchanged
> +  upstream Curl_scheme/Curl_get_scheme API fails to compile on 8.7.1.
> +  Omit the prerequisite's independent lib/http2.c consumer changes;
> +  they are not needed for the redirect fix.
     ^ Please don't squash (or "fold") commits like this. In this case,
	 put the relevant parts of 32a513e180 into its own patch.
	 Otherwise, patch looks good. I'll have another look with the split.

> +- Remove the obsolete outer result declaration: the upstream block
> +  declares its own result, leaving 8.7.1's outer variable unused
> +  (confirmed with -Wall).
> +- Omit tests/data/{Makefile.am,test998,test2506},
> +  tests/libtest/{Makefile.inc,lib2506.c} and the prerequisite's
> +  tests/unit/unit1675.c under the submitted series' code-only policy.
> +
> +Signed-off-by: Devansh Patel <devanshp@cisco.com>
> +---
> + lib/transfer.c   | 87 ++++++++++++++++--------------------------------
> + lib/urlapi-int.h |  2 ++
> + lib/urlapi.c     | 33 ++++++++++++++++++
> + 3 files changed, 64 insertions(+), 58 deletions(-)
> +

--=20
Yoann Congal
Smile ECS

