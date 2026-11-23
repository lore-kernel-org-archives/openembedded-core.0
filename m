Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53361.1795439833511317477
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 05:17:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=cBP/c6Fl;
 spf=pass (domain: smile.fr, ip: 209.85.208.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6bab377105dso1033798a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 05:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795439831; x=1796044631; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k3K5ZGCpNfuonpsvpxaUgfC+yyLHpNqHAnZKK54DPiA=;
        b=cBP/c6Flf/7embpiz9O25VIRjrTrlyMxVTGqQbx2VyQdpNF6KlkhfiShXzJx/1Es8M
         W1z2a1MSSAVnC3/663FNV3Sy0llf26HjnV2HNHcZDeGAf7N8rZmglGLbK45e0qvXpKXC
         i+fRvXaRLmwadM3F+JclVJ0S32/4pfJn1HoFQWdy7s5BLdV4PRH3kmzcxledrY2ekgdp
         3E4E6VEvLRrijIXaEqqflP5cnURbZxV6sSW+LOA8keukO8aFI29qqKdGRciIYQruk7r8
         qINmEeRB+nhs4l7RU2VHz9YDmj15PIxX8QBAItckPc/dQOWqIT1S/VLgYJgf+vthYKWR
         SXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439831; x=1796044631;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k3K5ZGCpNfuonpsvpxaUgfC+yyLHpNqHAnZKK54DPiA=;
        b=mukyBqHuxw2JHXL0kM0ERrfpDKJd8ET7/lNCsSj+FqiD3IRPfQWErr/F+0b8pZNNKE
         YUN2VaLWj8qCHVweMDKs/Zok9ZBPpbENj51S7daFXorAQXnfGn0YamNfvtuCfhnjJu4t
         0BfLuroFDjC3s+fFF61CLEPST1LdKgAWU52xncpmkD/rHy9siX0eMugrq9wG01FQAFRR
         nyMDjk6p0Jl8qxoGYg76qet+CYfCzCgV8yi0I5vjAkMpvCg5tzoRxBRF9zzH6xX8vIyx
         C5KGAKoxm/MFNIWwhwLvTPHYRbcfAYhG9qR+EaoL4TEBMoLb37QPB2RalE6ePym5GvdJ
         QAoQ==
X-Gm-Message-State: APuU4Z8q+kf1i3nOb9h7x2xAd0w2k/RXNleuMRRLydK3TgBGXzd9r+c0
	7GuIX4vGsX3goTS/CJOvV5WkqCKkpZHInikXCoPC/pnRUbvpwmNMXgsyngsVBmh6PhQ=
X-Gm-Gg: AZFdTZfewEMfWpviH4x3rImAjGw/T3BC1PfSdDMr94Tuf3cffLvXmDMZhA/6zMhuvXH
	v6tQD1u5gXWafeGlnZeF41oO/rl7F4mtb9i2EKzYrNldudMLx811tlmKpkJWpr+eaTpfpp3rsOB
	xrWKRz5qttNnwqX9c6A6RMofxETeC4avmvXwMEvSLgLhZmwPKi7P+xdfunumwxFvOusQt3AIW+D
	HtU6yoDewb2Bb3uj+t0fSVtjubCL1ejH0silgUixqLZT1LQY74XsBHiQ5QbNCkGYNV76MW45ARI
	y23MTmrSQO3OpNkQdFJDtXUTTqK5vS7tnhljajYaSIRKWQ4mWIoPqlOTVzDddqxOKJqkQes/LTI
	XWv5zRB6Ddj5VITYOloI7rW+tKDlYAO+wnxKSGS+nC4/ECusY/S+7ncQJ/pRJPuKpnOUA0Geh7N
	+tiCwr/gV10NBnbOh4kjeZPQyt3TqcQl9BOFnuW7VRof3W1ex25pjtL97iwNlRKHr/tsI4ZpYwK
	2kE1X1WYw/xWmqJ6Vlzu09NOqTTSKp9ccVyC6j2JR82TpyFl8mb16r9EPkxSdNjX+djlBbviSIk
	f2xZa3OIFwDofuLj/2yc6jdtgsCGQN2OtKGoSaCl0MoOvYXoXn43Ra8fq2ap67SC0sZ/yVP1E88
	VqBMcddkHjWJaYw==
X-Received: by 2002:aa7:c0c8:0:b0:6b9:278a:99f4 with SMTP id 4fb4d7f45d1cf-6ba37d5bcd8mr5884668a12.10.1795439831504;
        Mon, 23 Nov 2026 05:17:11 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba7b9570e9sm3406252a12.36.2026.11.23.05.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 05:17:11 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 14:17:10 +0100
Message-Id: <DN2MAVJKJZY9.M5DYE17FNEEM@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] bind: Security fix for
 CVE-2026-19666
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Rohini Sangam" <rsangam@mvista.com>
X-Mailer: aerc 0.20.0
References: <20261116175500.328321-1-rsangam@mvista.com>
 <DN19BWWOCZOA.13CEH4B1VTDU0@smile.fr>
 <CAL7QmvDh=WTpVNkgQ_Qmzs6NpoN1iKnfYXtCNTaGJBsvApBcVw@mail.gmail.com>
In-Reply-To: <CAL7QmvDh=WTpVNkgQ_Qmzs6NpoN1iKnfYXtCNTaGJBsvApBcVw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 13:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250917

On Mon Nov 23, 2026 at 1:05 PM CET, Rohini Sangam wrote:
> Hello,
>
> Upgrading the bind version to bind-9.18.50 doesn't fix the problem
> (CVE-2026-19666).
>
> Ref link:
> https://bind9.readthedocs.io/en/v9.18.50/notes.html#notes-for-bind-9-18-5=
0
>
> NOTE: I built the bind package by upgrading it to bind-9.18-50. The SHA-2=
56
> checksum used
> was a24f93be94712a8c11752294410f2f8a2510ec7fdc931d207fc61cdf30e54f4d.
> However, it didn't include the fix for CVE-2026-19666

Yes, fix for CVE-2026-19666 is not in the tag bind-9.18.50 but in the
branch bind-9.18:
https://github.com/isc-projects/bind9/compare/v9.18.50...bind-9.18
This is an unreleased branch that the bind project created but has no
intention to release. I think this is arguably better that our attempt at
backporting CVE patches one by one ourselves. Obviously, the rest of the
branch must comply with our stable policy.

PS: When replying to mail, please answer below what you're answering to:
See: https://curl.se/mail/etiquette.html#do-not-top-post

Regards,

>
> Regards,
> Rohini Sangam
>
>
>
> On Sun, Nov 22, 2026 at 4:24=E2=80=AFAM Yoann Congal <yoann.congal@smile.=
fr> wrote:
>
>> On Mon Nov 16, 2026 at 6:55 PM CET, Rohini Sangam via openembedded-core
>> wrote:
>> > Pick patch from [1] also mentioned at Debian tracker in [2]
>> >
>> > [1]
>> https://github.com/isc-projects/bind9/commit/78175f9749fecdac4eb0d4b08dd=
064968b4c55f8
>> > [2] https://security-tracker.debian.org/tracker/CVE-2026-19666
>> >
>> > Signed-off-by: Rohini Sangam <rsangam@mvista.com>
>> > ---
>> >  .../bind/bind/CVE-2026-19666.patch            | 113 +++++++++++++++++=
+
>> >  .../recipes-connectivity/bind/bind_9.18.49.bb |   1 +
>> >  2 files changed, 114 insertions(+)
>> >  create mode 100644
>> meta/recipes-connectivity/bind/bind/CVE-2026-19666.patch
>>
>> Hello,
>>
>> This commit is from the bind-9.18 branch upstream. Instead of
>> backporting patches one by one, how about we jump to the tip to this
>> 9.18 branch? That would put us at "9.18.50+git".
>>
>> See: https://lore.kernel.org/all/DM4MPOPTHX9C.2IO3PVJDW950C@smile.fr/
>>
>> Regards,
>> --
>> Yoann Congal
>> Smile ECS
>>
>>


--=20
Yoann Congal
Smile ECS

