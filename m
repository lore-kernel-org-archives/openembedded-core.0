Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 547D2C3ABBF
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 18:38:45 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.3491.1746643119335038843
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 11:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eTmQyGwT;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-60402c94319so139139eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 11:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746643118; x=1747247918; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3SB1Ema4+z6LxGrq6lIt8M8SxzA+aFB+agOo2UDvHA=;
        b=eTmQyGwTVQIRLhDikheGPjyEc9DDsW5pop78jMG80A3Sz5iMTYQVVXJ+vCTEU4g1rn
         ojI+q748+QFUnLQvTGwD+ksLZK6PYNMyRPWc0ZTC+Id7DgNNpI+vCCgP/2Pi5IEY8+Pr
         0zt6i9fHknZXcIdbJ8odC5XwgBKKc59kzuHOSgyrmE/fKRo3P58ynHPBvLi/aa8hDSSs
         1DW5rtB/rJRDaEJW1OszBlT0S3LY8Z/tpuxSERn5ddELyLAFDNAuJ0b8CRs6jKr6p/SN
         80ydJvNr8sDJNIkeYISnUyTshywp2VOpLYJJLMMEWGm7gfAeql3tGbNxHjoMyh082SSb
         ZTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746643118; x=1747247918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3SB1Ema4+z6LxGrq6lIt8M8SxzA+aFB+agOo2UDvHA=;
        b=N2NZqM2Y/puMTQ8Mgp2xw3lNa+uvBLNYEwIwg8YFvEuce1oMpx7Ot72lLBB7BbEDwP
         mXTW+p50EjNdD4A3gaZ5Oufiedct+N8cNukE3jv/nLj0Xh5OpeUx/SdrFjSZbFhARZ/7
         sjH+222otJmpH2B/W7qJudB+i3X+2C/3rkmngTltGgej8V4fQ+RxFM+r8B9s+XhvZKOF
         zIYITjw7u0N0zZ0TwsFmeWrmd6J2N6+4LV8JpR6miRwKHKfzUNO++qkxh2c/S1p8A/b5
         U+Cqcv+osaTNp8n0l9cOgpp50DhUvlAT/y7A8X2Id50nW10Qe3BBa04eg5ofEGWlrBKL
         cpfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdNzJzf212Kes/Nf3csACsSYWzPKyamDJON4uVPQLRHLl3kooD8nyxm1Qh7FvC+l+8SR0gUk20qjkJ9ibJ+ymuaA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxXtcya4+rAD02uXP+idDE5bLtMaIUzXwbSsHH2Wws4qZKdPF80
	e0O+FdIxIAsKqiSFuV9hOE3hyMTfmEGOxMc0n1aPDQneyuTqfArkRR4F+L5nT4lbvV463kRRE/x
	/i+xxNFpvaOVH7YP6rUvXtl0OeKw=
X-Gm-Gg: ASbGncvTwy2dqrHw3NkpuA0E9ovwDDR+fIkcEn7Z2XNeXx8frx6897vhsxC/p0cZIdo
	d+rI0SL0BbHH4w5XugoXVaNeA9ol6ieHkFpmqqnbf1Rud6EL4yppmnquNgrt7562m2I837EGnPu
	V8GG5ymgCCkDHwppjv2PDmGle7SaNQ8cUMJQWZg5KY+eWQlDjLdA==
X-Google-Smtp-Source: AGHT+IGNM3esyIJhmQaQ0PYxmv6VoRuiMp6sy9UvjcHMIVY9+i5AeO2pEMWZgakD77esc9HWHu4xXQS3PfeSqVFpzQM=
X-Received: by 2002:a05:6820:2d0a:b0:606:85ad:881 with SMTP id
 006d021491bc7-60828bcd823mr3069138eaf.0.1746643118604; Wed, 07 May 2025
 11:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <0a4bac6d-292f-4278-ac5b-348a160a319c@windriver.com>
 <23053.1746531517602060473@lists.openembedded.org> <CAMKF1spM6xrsWf1CvUsHr+1BF5Eo+X+ZKSN=DOiXq0Y4DrGYMQ@mail.gmail.com>
 <CAHebdzR4rGAq0e4FLuThxqE57UuT+LLqLXQd425--A6OAUPXZg@mail.gmail.com>
 <CAMKF1sqkw3xZpLqKw9aaOvike+6RPBsRsfoq+dXzeQf6Zpn1pg@mail.gmail.com>
 <CAHebdzTV7rRKkAJGzL79sngS3BDCEx2nNu8+jO1t5STM31bGeA@mail.gmail.com>
 <CAMKF1spEREKO0RL7d=RE9i-g0GDqWqPGcbR_Cr8pr=ET03AcFg@mail.gmail.com>
 <183D310FC8853D5E.1749@lists.openembedded.org> <aBtspIFmf7KoIZ_7@nuoska>
 <20250507182924.GA700@localhost> <B699294E-FA19-495C-9DFF-68AB3502240E@arm.com>
In-Reply-To: <B699294E-FA19-495C-9DFF-68AB3502240E@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 May 2025 11:38:12 -0700
X-Gm-Features: ATxdqUGdFuUVeVOxH_zJCBfmdyaNKjhQpqSweoze1gGgNcfU_fqvQFbiDSLP_ZQ
Message-ID: <CAMKF1sq6ttpUeRCsSY9WbY8hixTkhaCOB61u6AB-=xVqhTVn+g@mail.gmail.com>
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64: gcs required
To: Ross Burton <Ross.Burton@arm.com>
Cc: "twoerner@gmail.com" <twoerner@gmail.com>, Mikko Rapeli <mikko.rapeli@linaro.org>, 
	Sathishkumar Duraisamy <sathishkumar.d.cbe@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 18:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216127

On Wed, May 7, 2025 at 11:34=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 7 May 2025, at 19:29, Trevor Woerner via lists.openembedded.org <twoer=
ner=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > I stumbled across this build issue via a completely different route tha=
n most
> > others, it seems, and certainly different than what you have described.=
 I'm
> > not using meta-security and I'm not using tpm2. Therefore your patch wi=
ll do
> > little to solve my build, and others will likely stumble across this is=
sue by
> > other routes as well.
>
> For what it=E2=80=99s worth, we=E2=80=99re seeing this without meta-secur=
ity too.  This needs to be worked around in core (personally, I=E2=80=99d r=
emove =E2=80=94fatal-warnings from systemd until openssl includes the GCS h=
ints).
>

thats a bigger hammer, I would suggest to apply
LDFLAGS:append:aarch64 =3D " -Wl,-z,gcs-report-dynamic=3Dnone"
in systemd recipe in core

> Ross

