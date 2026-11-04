Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11206.1793804912662882033
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 07:08:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Dv22sUSA;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48fd2e38825so593614f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793804911; x=1794409711; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wwms85FnmKfHSebFnTuuGkhu/8ZXxZwE0qjngh6upHI=;
        b=Dv22sUSAvh6kBF6vwpFzk0A5dVFALm8owlgvJ2qafEEr+7Am8La/lBzPWzRD4Bl6b+
         c+lvdBjj3jTh0w4kX9hfpjo+trUBkNylFU2s6rJ3gVwBQnd55YZFz5TOl4yxb6LhKqq5
         VQx81bM4+luIpAcAQP8Lo4+sDCFBs+CFM3rDhRsnLXGJMw6agstk1FKohNdCFkpEKxv4
         LNd9XzP8KF5qHaEcQUOzaKLAW/CPKByupJ6NrJ5xxtzypggzl1noqki0WSlhhdXPJznL
         CJ9xcjU5HJcXvzTdA85p48G1lGoEC7JgC1x7LpKeTihDqgYUFhslx46nCxl3jOkYQwje
         mbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804911; x=1794409711;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wwms85FnmKfHSebFnTuuGkhu/8ZXxZwE0qjngh6upHI=;
        b=yDoy9rFRDzGxfcOCTLHYunBZli1ecOXX6BdHuY/4jkEN7gCdoAX2Li2m7GlP0xR3ib
         J0T6mJhimoaon2RciDwospHkvnLn09fLKKBK0ikQ3Blh09aU5kh+h7avqLuZZyCR1RX/
         QRs69a/1Y/1cXV0ZnJlIsQ1IcgEOAJEpNzRBLmRmRR1hVRHW8SWyBiqfVb4IR6i3CMEb
         TnWtyXcmKsxtFOCajLvHfL1q9hag0toxKyKv5KKSSrOTpw2eP3oBcHJ3eBo9HQQJM9Wd
         IKvIgqrLATtw15uGNNHefOk/rggg5NF25Y0PrTtrezMhsxoigxeLSrFKiHnW6MENjVWM
         sP0Q==
X-Forwarded-Encrypted: i=1; AKwUvBy3Z/pnody+Zvb9I0VBl90CGhmZxuVf874bp/2y7c0eP5OpBDsgMeZ0Sxg85f2/rm23ydrlbwlrNIYUdnpchOf5LA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z97eUJeVL5tmOYYTgBMIlLVxPus2GMBPpNdFt6CWAbiI/xuU6Y/
	aQPofRWklpKW67kJcbsYZ/eZOfjuoNPPp6FArSjBGHPUPe3CNJ+gdGGTdY6l18CQ+lo=
X-Gm-Gg: AYBFou0y6uubUR2myCV3TR+hzvMnoQh4j6hJq3/K1oa4yARATMU0HY3dQqpGaJdunDX
	H/Qb3TW8YsQaI0cbkNehKejEHeikjhqrXLFgsb1lHLiDBE2zyBbwzvyqO1wk27/grqPIz0D7Fyj
	sBBDiTifEC64zCAcZe0H60v5MakeC2UBV8rSwbPE/fZJpquNxjSBBwcJYYY8Z7OgErXZBKmKcHE
	HYruNRdMnQgJsX49WqIqVe04/s0v53W5qVOui88YhgZoZpTU3/UqGM00FvXZ6j4kl21Nr+oqMMf
	vCeLdmXxjiVDMcCorr7eZ8l2HN5/a0FOD1adARBWRf/mSbLvNNSk7Rz4i7I5YxBi5rgzpDQLRac
	m2+Pn9e9+Ec7wzxn+Paz6Au/TrpxNfl365LC5q0KBIRyPDLxE5fZDmHmpBHDuvK9f5dBZRBh3gF
	bJsDurBvEnMie1UOv+Y+B2uv2s/I6uMCZiLzxfrfW8ti0Llp6wR5hd20NNGpgQ5iOs9avArEVaw
	N2OEpHAF0CnlQs6qdcat5fd/HMg2S5TH0cCpejNOetHqd9q6SoGyIQY/4CSpgs3cWNJuwWg8I00
	K1MrOaYqDlSRXk2PLdp9YjKPm13/xRLooC9JEEHFIWU4w64OL+njRQ6QAzBHP8+NE0k97fhMRsA
	mEnRJMHCmjhnBV06H
X-Received: by 2002:adf:e40b:0:b0:487:27f9:844 with SMTP id ffacd0b85a97d-48e6e51849dmr27206692f8f.57.1793804910676;
        Wed, 04 Nov 2026 07:08:30 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac17c1sm4254036f8f.10.2026.11.04.07.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 07:08:29 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 16:08:29 +0100
Message-Id: <DMMIRR2WICTU.2CVIAJ7I966Q9@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] expat: fix CVE-2026-117610
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <thomas.petazzoni@bootlin.com>
To: <joaomarcos.costa@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261104142512.1562219-1-joaomarcos.costa@bootlin.com>
In-Reply-To: <20261104142512.1562219-1-joaomarcos.costa@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 15:08:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249388

On Wed Nov 4, 2026 at 3:25 PM CET, Joao Marcos Costa via openembedded-core =
wrote:
> This vulnerability, marked as High [1], was fixed upstream [2] since
> 2.10.0.
>
> Backport the fix to expat v2.8.3.
>
> This backport is actually partial. PR#1444 adds a second commit providing=
 a
> new test case, but the code uses helper functions not yet
> defined/available. A few other commits would also need to be backported s=
o
> that the test compiles at v2.8.3.
>
> [1] https://nvd.nist.gov/vuln/detail/cve-2026-117610
> [2] https://github.com/libexpat/libexpat/pull/1444
>
> Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
> ---
>  .../expat/expat/CVE-2026-117610.patch         | 30 +++++++++++++++++++
>  meta/recipes-core/expat/expat_2.8.3.bb        |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-117610.patch

Hello,

You just sent "[scarthgap][PATCH] expat: fix CVE-2026-118370" which
conflict with this one. Even if I have tooling in place to handle this
kind of conflict, I'd rather you send conflicting patches as a series.

No need of a v2 just for that but something for future series.

Thanks!
--=20
Yoann Congal
Smile ECS

