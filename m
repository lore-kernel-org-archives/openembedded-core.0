Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2336.1792436425365650328
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 12:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zc4cA25G;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1355921f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 12:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792436423; x=1793041223; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUE633Ooe4tCRRrj5eYXy1rzXqhSTPx34ip7XwmHqSE=;
        b=zc4cA25GOLQCeaTErunUwZSjhd49iwt+vyzLAop+64Osu9Hz8qO9iOgO/PnMEPIvmQ
         DfPpFp2b2A3zqLR3qJ37k8ZdxDwCjN9CvEAp55+YKeIySCjGtlTPbuW4OsGdZ5lpv2b0
         JegxnyWNknzCzR9mTmeHnO1Tr26ckQu4JefQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792436423; x=1793041223;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sUE633Ooe4tCRRrj5eYXy1rzXqhSTPx34ip7XwmHqSE=;
        b=n1eEVHsS+ZNs1quz2D16S1ChC/3PCAIf0eyisbI0N1C2bw4UoNVddFM4XDSnjCLAi+
         SKNSeiAVRFOkQf1iJraXd20tlz4MDre2t4pYLsm9u0r2ncV8oKAwMipGJWG7RT7p2doY
         pOJ8hrnuzrYuu7vk387Yfq3eGWc78vzqVbXHXH/HBdnA2QGPRSYouXm3bhA4ghD1a85P
         SAvuu60sVFMjy8cCmIqPor3aUyljgiKcbYirBw4CyJvNwG+yAYvs4NuCkKsOsC5mSMaq
         cahbfBBWXbpvkXR7iKn0bnT+0mMnDekr12rnz3wfgAmDhGqbg8fWppRtNkYbQ+KTgjfh
         vfKw==
X-Forwarded-Encrypted: i=1; AKwUvBx7ojsLBRPr+ArC3cGQEMG5BXQ1U96UR2fWZbO8M5JlW/ptNcJbmKbCQWC2h0Kx/GFJaKAYUVN69jGz1s/tQuvoTQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKDwo+7pjy9R06W51EXm2/4OdCkelMk8h+D6NnX/MJWqdUJqfAE
	WcK2wUPWdFXXaki6OjHAnkFMPucPXm8NrnO2AF7Ob9MmaPdWiXt/T1ULoGfRdiDdacU=
X-Gm-Gg: AYBFou0wFkiWfvX5bSlWGxnsMfV9oUZEVP+y7HgiRqNB5npS9g/e5vQV+y4dQqhQMHu
	oTz5j2hBQLVeNDk8tINiCzmWklLv8wi0ZvxJ5t2Kcfqd4B2bCOZubhsG/DGuJanGZCOUA99fwZM
	mFkv077tyk28nCgBxjZ4kdyyjMuRT4xOJicqgL6/F3vYSH3ByElLOtTOpAyWBWkpH0vN/zDYP+6
	+Ew1bpLysr2xv7O37cEopTOPZpeNNkp9ogz0qjclbD8FMoUV7B7ZF1ZP013GXfi2xl6M9Yfx1l+
	607yAefTEY8fdVW09aVSNCJ1lQ2dSTzjPZSEfdK2qboJh/6HgteyV3/smVUimgo++ETgR3VuqvJ
	05uwkisxhEn4N8rzCSbK4ZNROfhc3ytmztyS+lKGlGL0Y51cWI0BV/tuTEtAv6nmK/UgJkMEDC3
	CXNJr0OgyzzsHadFHodcOLfbQOCjRnB86mF8iv6dv1nplZlKdZkja+G3SgiGfDjM1Zq5MV0Us+S
	A/KgyQ8z2zR7CRCftqVbqgU0HhzbF4bgr0x/tsCZUsL47Y7vpDJYxMVpHbZtA==
X-Received: by 2002:a05:6000:38d:b0:48e:884:c70e with SMTP id ffacd0b85a97d-48e0884c755mr19973815f8f.33.1792436423420;
        Mon, 19 Oct 2026 12:00:23 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d823b7esm660678f8f.40.2026.10.19.12.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 12:00:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 21:00:22 +0200
Message-Id: <DM91OKWLPVM3.FEZC67AJPXQB@smile.fr>
Subject: Re: [wrynose][PATCH v2] libarchive: fix CVE-2026-15028
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261012110033.11294-1-jakub.szczudlo@nokia.com>
In-Reply-To: <20261012110033.11294-1-jakub.szczudlo@nokia.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 19:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248206

On Mon Oct 12, 2026 at 1:00 PM CEST, Jakub Szczudlo (Nokia) wrote:
> Backport patch to fix CVE-2026-15028.
>
> References:
>   https://nvd.nist.gov/vuln/detail/CVE-2026-15028
>
> The link in NVD is wrong. Based on project own pull request:
>   https://github.com/libarchive/libarchive/pull/3252
>
> Fixing commit is the below one:
>   https://github.com/libarchive/libarchive/commit/40b92de1def08e4fc319d55=
702785f82cedb7ef2
>
> Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
> ---
>  .../libarchive/CVE-2026-15028.patch           | 41 +++++++++++++++++++
>  .../libarchive/libarchive_3.8.7.bb            |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-=
15028.patch

Hello,

This CVE still need a fix for blacksail and master before getting merged
here.

Regards,
--=20
Yoann Congal
Smile ECS

