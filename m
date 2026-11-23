Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3113.1795464113832548072
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 12:01:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=A5ucaV/I;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b51871c5c4so28925037b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 12:01:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795464113; cv=none;
        d=google.com; s=arc-20260327;
        b=eG9doDym0MUAk5PpGJCSg7PkdWhiEyRycB3KLjG9f4ZxERKqvhzFwGIXii+vSvn2do
         drfbOTkUJssVJFFltJt5r0HKzeVwXI4IF2Ko/yYa3lihDe/EC3OsbsnMsdRFMzaGkabo
         FRK4RnIS6MXQsI1BHd5NikOVB5psZL8tq04BmjPOBZ6cqMmOWA1Ct/9eSAgqH83ajPZz
         CLFsRcCye6Ih/s2wrWYGxTvzD+44dd8TXCRIswTPChbp2pVkIZhyqfMU0SKGG2kg5gQ0
         dGd4doJb/sHqLtxzlTwajzFRpX7B7QFaVRHEKqQlfQorwaShM/0S0F38hI609S/4m2jI
         DdJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PrDfemGoa/a6Jdw17xsI36RxCB/iC1jWgqGL1O8CEnc=;
        fh=VOVZu8FjXojtP/2iv884q8pvwCQeeuFgwI9OY1sYm5U=;
        b=O3+iJVKzBN5JPlTfeloqQsRZKJhShwKeDWd3J0OlPKTZx2GFAgsYRoYtOAwJz+nh7i
         UtT8DQvjRQa3y1tU073JlERSFhUk925Omd7bxgSDQQwa0+uqXlggqUz0FSapOEUpCi8A
         CPlEOVtNZ4+JH/hlT/YZC6/fPl3MxYHmadq5CO3MVkeO1Lo2gaxnHRBiXB4MNyUzggsr
         H4pI4XJMfvpwKuK9aCbItkEV0dP2GN6oz0hjUsO8OWb/L1GH0yinkh1meUJPw35HR87t
         OJPdysPCkdKs3tw+ISEwow34scW79ycEhoZo8YGkkn94XUAgm0+e3/plqa3j0JNu1IcP
         SpGw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795464113; x=1796068913; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PrDfemGoa/a6Jdw17xsI36RxCB/iC1jWgqGL1O8CEnc=;
        b=A5ucaV/Iut8s+HDmd8WU/vwkKV7AzxIAOlcuiPT1qGOcBuUtulBdk0Gzaa7izHeBfl
         T3EYscySUdRHtDMuo5OGhm+Va7bmcMh7/7tPWI8bFldt5K1LEwCtIbj77dhtJq8Z1OJF
         C6eydMQaz5grO0ijcO9oKcuzBwXt2/LGivMih/oP/oLi5XB01o0DCZqs4cU/56BTT4Ae
         rnvTham+wgUgS1osgNggfAhw8eQiDC6zkHy/XN3RYn5EEncVMiq17yPxzs2TlzMAy/6W
         +hZRNBynsUrvkOepQZSU+afCikbe4qvhQc5Kz0mU5EhBm77M1PgnPkVoAmdmsAd9464i
         n2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795464113; x=1796068913;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PrDfemGoa/a6Jdw17xsI36RxCB/iC1jWgqGL1O8CEnc=;
        b=gG7niHX3aQCzPv/Ur83WNrLXFbjn4ZQmIFIXawuAzvLF8wK50aNrN0QnH5cVexCSOn
         qyHP2UP2dqhvE8BMeiHpi8mWkLDvgATAIYBi9j5l87GAz3/6qWj1BLSaJS/by4+8OSfO
         fxEUakFslFro+S7GB+DcBEo7fn/H0MsoLZqXX1AnwIRr2OF4b33GQnXbgc0XxqBJCs0m
         jMnLLg3RDj7S+bLc/u/GzYWzzNXtQWUAWaUguvjeF/DSB+3F7V4sOWMBEC2yfFAImAFM
         iJC2QHFGikS6BJtfgJRQipq2ASTy0c4Q/XLmiE6ePQliasJRnD2nvANMiTELNe7A8ArE
         6eXQ==
X-Gm-Message-State: APuU4Z+kDYtEycEXTZRAAC6bN5rVk01upoS3mu1A6ogcWIBeaMmJyxNz
	ULuOWX5VPI3BPjXxEL1r8C9wIo59a2sT4394rZaAhQWpQlmir4s8tRaO3PpZLIz1jd52V6qWGKL
	uCIMSjv05/onpo1zsSUsDxWYAgY4IO4g=
X-Gm-Gg: AZFdTZcuEK41SOCmzXpbLH+4+jLaCXdpEOMfUftJ/eBBa+er0R6VNFVaT/nADJmgNCU
	n+q0RybVoSQNd59pu7E9yG9mFu3xaKJkbhUcxuVhuZPcmTdXoDgY9gk4fmNdRs1Q1nqSTxKcnbC
	xCd4B8d6yrnnVtWzIpb3U+z3iOetBFiRd1i2DbG+ovvfL/BZ0LrhwAqup5W+ctS7JTtftaiPhzn
	sidCW/LUcNp+xKIav4ux1ke7dIlfYe7CwPz+jSP6zvB2KL0vDGlJM5R9/vbykUZQVEEVOJ5bJtH
	amEBKNlcXzYZtR2lMZW75UejhpiCO6Lcxxxl/lMHHwDjKJYcnM4DdtTnzBgrx2b6p6t+uhh0v5z
	9v8sNGiJquhuG0MkCztPUm0bnAzhLBHHqsUqGLsz0ZUfVNo8IlGsy37aXiLCUryWmu/wrEZiYmV
	Q/uIqF4faWNF8Kn3EMU7E1EqoWsB4A2byQd2UCti+/CmNMYEK5zJTG+AltEzkY8jCWTDkGMXQWu
	m9p60dw/xbZ86P6tnZEYJrLEmgCf5PmbiEtPtDAJNgWNJngU8eIq/nQOFJXM6Sg7GdVbK6DGqYD
	ptEaKGO5LRGEmdbV4XsF68yJS6nxtspVQZ4Dz/K8KPx5Hrc8gd7ZTlBV+K04lZEdKxRaDUTbMN8
	860CPtwZRmPM=
X-Received: by 2002:a05:690e:419a:b0:67b:e7b9:7a58 with SMTP id
 956f58d0204a3-67df44dee3fmr3959148d50.44.1795464111931; Mon, 23 Nov 2026
 12:01:51 -0800 (PST)
MIME-Version: 1.0
References: <20261118145502.3243739-1-khem.raj@oss.qualcomm.com> <3A5D79A8-C1BD-46AC-A9CB-6ED307184E9E@arm.com>
In-Reply-To: <3A5D79A8-C1BD-46AC-A9CB-6ED307184E9E@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Nov 2026 12:01:25 -0800
X-Gm-Features: Aa3M54rWgZDpmxNBeJ3v5B1UXh9HzjuiQfWYxQgA73Mj8BR1YHRzDw-8_FYjyKU
Message-ID: <CAMKF1srXNYjihezOZ9-wccQMehaaT894joHWncgO8tLFAxUpOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] libtasn1: Enable linker version script explicitly
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009946bc0660f71050"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 20:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250932

--0000000000009946bc0660f71050
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 10:09=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> =
wrote:

> On 18 Nov 2026, at 14:54, Khem Raj via openembedded-core <raj.khem=3D
> gmail.com@lists.openembedded.org> wrote:
> >
> > configure's linker version script check links an empty program with a
> > script that assigns versions to an undefined symbol 'sym'. lld defaults
> to
> > --no-undefined-version and rejects it, so with ld-is-lld configure
> > decides version scripts are unsupported and the library is built withou=
t
> > any symbol versions, silently changing its ABI. Consumers linked earlie=
r
> > against the versioned library then fail file-rdeps QA, e.g. openldap:
>
> This is part of gnulib, would you be able to file a bug with them?
>

Yes, good idea. However, I wonder if we should gate this change to round
trip through
gnulib to enable lld in OpenEmbedded. It can be done in parallel.


>
> Ross

--0000000000009946bc0660f71050
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 23,=
 2026 at 10:09=E2=80=AFAM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm=
.com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On 18 Nov 2026, at 14:54, Khem Raj via openembedde=
d-core &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" t=
arget=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; configure&#39;s linker version script check links an empty program wit=
h a<br>
&gt; script that assigns versions to an undefined symbol &#39;sym&#39;. lld=
 defaults to<br>
&gt; --no-undefined-version and rejects it, so with ld-is-lld configure<br>
&gt; decides version scripts are unsupported and the library is built witho=
ut<br>
&gt; any symbol versions, silently changing its ABI. Consumers linked earli=
er<br>
&gt; against the versioned library then fail file-rdeps QA, e.g. openldap:<=
br>
<br>
This is part of gnulib, would you be able to file a bug with them?<br></blo=
ckquote><div><br></div><div>Yes, good idea. However, I wonder if we should =
gate this change=C2=A0to round trip through</div><div>gnulib to enable lld =
in OpenEmbedded. It can be done in parallel.</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
Ross</blockquote></div></div>

--0000000000009946bc0660f71050--
