Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12196.1795765790889011408
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:49:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=QemWSjdb;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e47347279so4734068f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 23:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795765789; x=1796370589; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AnpcRJYu5PJWlmmccgJwPvDaYbn/ENRfTe/EFmfI/xc=;
        b=QemWSjdbXRWssz5lfY5t86xKVN4UYyjmaNVpQtAz2ASHbR2Eti0Ctun+dQiQ5dOpc9
         8baK3rv15e+ZOfZQI0wcfO0GO45+Sl2HhyG10iseQL/Vb8KNeHzulf+t6ClT/dr2nLT9
         hd3P+P7QJ+TeIoYesCZO7rrI0aFm61M5c333I0FwmCZFrLNgXBc772xIx7equYAVEU0D
         FbwQtLMspbnEAxIWwmV/9PiVVilMwJJTmtn5HdO+oJ9diceDwV/OSdS3YxinZY/RdaAv
         jV7+6peLaBn40TzMG/Q7QCED4PDlKultTOPCPScKbmQpyD0Rl9bNHSUFVQ4E74KRR6hA
         eaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765789; x=1796370589;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AnpcRJYu5PJWlmmccgJwPvDaYbn/ENRfTe/EFmfI/xc=;
        b=TgudqUnJ8tmXeVzoQdf9e4fkdm30QlXzuLid28gLRP+3cEJKr+5fo7K/ehZta7LrpG
         jAZvWdu7Wnw0Zep7dEwv53XQWjQrQXBg+nf9y9VvAZDkGK989gEAzTS4iY34f9UkKHWU
         eiccnUp7739r8QJ4uEjR2dMygdfknCxg6QnhMIf5Eb1BNhb8tZIo76HbCxg/aa6R8FVX
         0zosjzBjHAJSo7hTFMM+cwvhmHWZfWSkcuF1dr0qLiZHn7wn1Tst4bb78wjGCjsxwpX7
         jsZqwu4VDpq7IThErXBJGTYgp5jYuQgSb6URp614VFYMB9QIiCAQIxWkUgDoilB1A2Hk
         CkIA==
X-Forwarded-Encrypted: i=1; AL+hErHryl57yeIVBpfECIMJdgpOgvfOZw+NQD1B3+e1v+e5PgW/zGx7rE0pGEemP2dAoedxEg7xwop1SKqh9nUOspmDFA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z+BTWIT5o2QvUADc5HFhdv+L2Fgl6l7NpslYdHRWI+hpmLcWDPE
	YcfpWPpaMX48csafA/8Dqm/bpXA8iC3RT0mNkRggPygpZ3Nl+QW2u0AYrhlWFWWSNlKqBeSqfsN
	oV0j94qg=
X-Gm-Gg: AZFdTZevFHUz9zA1HuJJdtT/qlnYOc9VOb4jV9h4BAAN4iClEp7Lm4qhqbJfwIztS9U
	NlL6R4e77qjThUwm+4S4tuskn0AvbixHyfnXcOlChAnlZXQpnTN1uf4h1tXB/NqCV06TwDyoKKH
	JJnCmrDdqWgyVPgnwMfHZKO/vE8IrOHOEHOU5W0X66HfH5N4e+yvmPGdeZTmVbqNleEGBpmTuCW
	AednXfq131xzP3UP+cUNRIEoxz9SPVakrBff0Mo3vWQuAQjlMulU6L+CLtl1Kac8rFl3Yi8Riam
	JXJu/oVF55rgc1i8SZIdd8q+HLoC8WAOULlNKw6lDLOjBb4yzW9JT3dOF0ZQiOqKTBtdqNorFj0
	36QCl3LLpnn2jNoNKhX2p7k2u0a8agamzPWRJj7/IM6p3CWWvkZGIuqOaTOEezzYCFgR1U1uxlZ
	36vY+F/QAhEQWYz/vJIaz+hCDiBoe1eoQOSdGIK/5fuwpd8Ip4nxGHX8kMG9OH2pT0Obl858+BM
	U0iJl8bhiPDNdYNcyEdbigQ8G4ZySYZFUGJ76zKsxPXplLfhEE6NV4vQdtiBNj8Z1HibCLibZ5A
	c+buIj49pkd7xzJUn7I+2LMp77AF7BEuy/DW/8beAtmpsNM/YCwEFPG0KTKfSp5iNe9lVs5iF3a
	E72jr1P7Puzaqgtg6ZA==
X-Received: by 2002:a05:600c:b90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb8892cb02mr465141745e9.21.1795765789038;
        Thu, 26 Nov 2026 23:49:49 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa006c84c8cd12b797e5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:6c84:c8cd:12b7:97e5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm330317935e9.4.2026.11.26.23.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 23:49:48 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 08:49:48 +0100
Message-Id: <DN5TUEF580FA.5FW4H5KVK8H8@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <OmkarAbaji.Patil@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH 1/8] libconvert-asn1-perl: fix
 CVE-2026-126540
X-Mailer: aerc 0.20.0
References: <20261127064659.2169695-1-OmkarAbaji.Patil@windriver.com>
 <20261127064659.2169695-2-OmkarAbaji.Patil@windriver.com>
In-Reply-To: <20261127064659.2169695-2-OmkarAbaji.Patil@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 07:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251353

On Fri Nov 27, 2026 at 7:46 AM CET, Omkar Patil via openembedded-core wrote=
:
> Convert::ASN1 versions before 0.37 for Perl allow CPU exhaustion
> via quadratic bigint loop in os2ip. Every INTEGER or ENUMERATED
> longer than four content octets reaches os2ip, which iterates over
> each content octet with $result =3D ($result * 256) + $octet. Each
> multiplication operates on a bigint that grows by one octet per step,
> so decoding an n-octet value takes O(n^2) bigint work. Nothing limits
> content length before this loop runs. An attacker who controls the
> decoded data can exhaust CPU with a single oversized INTEGER or ENUMERATE=
D
> value.
>
> Reference:
> [https://nvd.nist.gov/vuln/detail/cve-2026-126540]
>
> Upstream patch:
> [https://github.com/cpan-authors/perl-Convert-ASN1/commit/49b362c527e0af0=
5fca9be1e97e4a340d95afa75]
>
> Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
> ---
>  .../CVE-2026-126540.patch                     | 147 ++++++++++++++++++
>  .../perl/libconvert-asn1-perl_0.34.bb         |   4 +-
>  2 files changed, 150 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2=
026-126540.patch

Hello,

I have not checked the other patches of this series but at least, I
think this one is needed for blacksail. Can you send the relevant fixes
to blacksail so I can review these here?

Thanks!
--=20
Yoann Congal
Smile ECS

