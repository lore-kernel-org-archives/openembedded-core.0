Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7804.1793700683814735490
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:11:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=C0Xju6tr;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91791ec1b83so30556156d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 02:11:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793700683; cv=none;
        d=google.com; s=arc-20260327;
        b=PL2DR5+bxKGH5oKHRghOiBUJ0RPIf4i1G2JvmGnmlTzZvYiXLx1zqSA+cwv2aESHAY
         SdVXpwj4GVprh8HgaMPhwyrr10BsjC3YgtiHyE3+l03xi65ufRzcxkvA8EniTWY5Uy0t
         cG7q3rA1WKM0Dkf1BnsY2L96MJWGu6ahi559kPWnu8iU3V5ohyw8juCWig+ai0XhzSRS
         dfNz0wXq+Q7UrDnQdW27NtJQh+r/s4rw+MZHBWKr172/yz6N+0W1OlrK8MKGQYMCyeza
         txYhIIwAOOIdYTh4cgpMaSbpsSJT3j0vSr5oNKJixe9HbP6WtmHNIfrndi7XyV1zFk15
         77EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K3T2DfgYghDG50Yo0u7UBu9nz3VhtPsltjs1f/2aY88=;
        fh=6Z4xUuTqkcxNv6cvnn0HdSGcZYvnhz2BRm++iEwx924=;
        b=YOyYjKH3I4zctNEgfuHAK3T9aHQr7zqbNlM3O/0kfUrxwFhcnPLirPmlRUzl9lT0zR
         JfIBaQTGYBUSi3mGA+30/mH5slsonnrUZSMRa1IPzHH+TmfKTUzfvPM0ii8FUXUXEZDN
         pKcFlcd907TxqOWw1pLA1DRFEQYjnaE9eSG6R6YWHqGwQ/y8E77I2oOdPx6BUPVlm+iy
         Wz5b03houhy+sWCqc1Jn+/Pl6EGsbqp9skE5F1vAleYwoAa3L4tKIZ9u98OjJmO/HKh5
         VOtFNQNlqEwBKmZjTh1yzQseK/5jw00JZX24DVZZQiq9S0YZBPrgwkyUMsftfBJPWr+p
         BbAw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793700683; x=1794305483; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3T2DfgYghDG50Yo0u7UBu9nz3VhtPsltjs1f/2aY88=;
        b=C0Xju6tr0YSajBvGUdVZXNZDPHtD20d0cOqXFEEwv+yzGb5lfPx/rstMC1hC4hr3R9
         OIMMCb1E23RrHqGf64Fc3V/3zOS0pDqcci2IfkuNgsRkOvoQhPyJSNDkn7GrHXoxFQaS
         bk4lqRFxh97oYpuzRe/Hg7rlnTaPSrotqA5nrBSMwpcjw4SnFGYCJIYiHRMN/toPvoZg
         6xrqmoOl0q5DSSICLTO2xzUoFubGYpYQFtvc8w4ztWdd2Dbuqzfn9vNBrAn4PmsQehop
         PwSROF3EuRjCxB00Oo6eM3mIIbTIc0EPKv42uKP7q8xs+52PSVCGPUPhrv/lUhm5Be57
         jDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793700683; x=1794305483;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K3T2DfgYghDG50Yo0u7UBu9nz3VhtPsltjs1f/2aY88=;
        b=VxQ/DrV/F4CE3+kf++ibopIDlnLYaQYv8PNufpRpFY0JNMdMpYoSTCtUK1EfOp5DA5
         ytOOPYR0JDWOoaV3tXWO6z1w5wZXVN5o7QypMzTD525sVXAWv2TY+9jm+L9/hsZM3dxT
         HITbc4IS11qnVuXfvG0e27wsWLmLPWf1ImuDtOMbDBMEtgh0BCi9VpUOI5WRhH02YG9n
         1MRYw75qh20F6PIrO2Xi+J/jLKwXxG/CDsEG2FyXKudnOeV656D79xHIcfeLSu6RagTs
         pRHnIKc/H8JsGCrlXYkmX2kspnM+QZTjTBGyNHWdYfdDocKPzd8/J8ucMB0yhNiATw+U
         sjMw==
X-Gm-Message-State: APuU4Z/wo9NTlj5s4+MnZbcpt1RxZiyoZwYzqJXLwO8z/MYaHPZMgqgr
	E8GOwPg02k/Qe/KQOQgzI7TxjDw8cwt/EtjseFz6kiQKD+QRI37djAIMvWfs0vKHHeax30kEmzF
	+COsW7k8oLe+96upMzsuz9W95366qFXg=
X-Gm-Gg: AYBFou35ksx4v5S7nUkC0srtwTmiEfuphqHGgNEVy2QjaYEJ/1M7F/ZDqDqTQFFrrwK
	0q0B4gZQovuTywQHpbjXkSYIv8I11e6pifSclBFqiFYziFe7PSuIu9Lyat1hwvMM6LECSkr2R/y
	ustu6HC/Lf5CKJI4nFLtJ5iotM0Zyl3ff6E2kBVMS4QDq1BzXoEVkYRYKBRCcjyuUDv/T6Lj2TZ
	W+xr/v2Zu5RMWcvcXLf4HpPFald0TzySlssgyfzr4t1dEaTCYSEHSeqPlLfWW4vnlXDxnNNiODj
	evdgC78l5l0jy6DZTlDoZ0B2TtQ08HH/8EiGhRZSV45e76CJmkPIvlNKGIPYjB1MtFqSVbdNgih
	fp1MJrGHFZCklqAv4iM31trg4siRPCLTjZTrBzSFx1ccrGCCq1ng/v8f2RFEmDl3jGq6Ed3g=
X-Received: by 2002:ad4:5cee:0:b0:91c:a244:7580 with SMTP id
 6a1803df08f44-91ca4b03e15mr207262466d6.18.1793700682515; Tue, 03 Nov 2026
 02:11:22 -0800 (PST)
MIME-Version: 1.0
References: <20261103094531.39610-1-jaipaul.cheernam@est.tech> <20261103094531.39610-2-jaipaul.cheernam@est.tech>
In-Reply-To: <20261103094531.39610-2-jaipaul.cheernam@est.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 3 Nov 2026 11:11:11 +0100
X-Gm-Features: AclHuK86EPbYZbLwpuFxAA0IbMBQhqyqHSEz15wGTY2SY9SXMQOHuRFkyB7X1c8
Message-ID: <CANNYZj_a3nx5kaDMSLT2wNaSQ1sBekvamBfiDL1hVT8okk7FgA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] lttng-tools: Extend recipe for nativesdk variant
To: jaipaul.cheernam@est.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000003cb71065f5c7c0d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 10:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249273

--00000000000003cb71065f5c7c0d
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Nov 2026 at 10:45, Jaipaul Cheernam via openembedded-core
<jaipaul.cheernam=est.tech@lists.openembedded.org> wrote:

> Extend the lttng-tools recipe with nativesdk support so
> that LTTng tools can be built and included in the SDK.
>

You need to explain the actual use case. How are they going to be used when
in the SDK?

Alex

--00000000000003cb71065f5c7c0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 3 Nov 2026 at 10:45, Jaipaul Chee=
rnam via openembedded-core &lt;jaipaul.cheernam=3D<a href=3D"mailto:est.tec=
h@lists.openembedded.org">est.tech@lists.openembedded.org</a>&gt; wrote:</d=
iv><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Extend the lttng-tools recipe with nativesdk sup=
port so<br>
that LTTng tools can be built and included in the SDK.<br></blockquote><div=
><br></div><div>You need to explain the actual use case. How are they going=
 to be used when in the SDK?</div><div><br></div><div>Alex=C2=A0</div></div=
></div>

--00000000000003cb71065f5c7c0d--
