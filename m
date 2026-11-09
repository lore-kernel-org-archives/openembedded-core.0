Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.880.1794204972263526297
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 22:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RWMSi2jS;
 spf=pass (domain: konsulko.com, ip: 74.125.82.42, mailfrom: tim.orling@konsulko.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so1019044c88.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 22:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794204971; x=1794809771; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JBb1TTJm7yuvt05SuNBdljcSZBKr25mskZcgCstB37Q=;
        b=RWMSi2jSPwTOqEID3O+FZ4bWk7vLNcWt5zholcHD1NniwxBH9n1h11atrZbA1xvRNX
         4iLCXDdpthENR4F3kFU1LneW8rhBS0luOXUwVnKt/zKkFzCFLDhBTEfgbXpY65i//H4X
         ErQpgvVWGpXooiciDMNNaZ/PgE2Uwg0YFiEVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204971; x=1794809771;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JBb1TTJm7yuvt05SuNBdljcSZBKr25mskZcgCstB37Q=;
        b=xMppFCeqrMTdOauQAoqydslwjnutDasHHdNQ4edgd8eo+HPLxz1zezQ6nyE3sRbXn+
         4orRaSIhEjh7WRWDk/iZArhh9qB0qTR18XsKcnZEMezFif3OFfRUS2hu1v2UWiDIXyYr
         vMSN0ll4xJn2ZlCSXRZ31Hyv8ciVv567wH38DuLJKmWQcnUqd398gPMubT+lq2LiDugW
         rG+VLwWCI4e9+Jn5ELgEF5YlRLuumoToqN9WUUfqpO/5zI6boVbGkxFPlxU0sV4KiWD4
         lZgkjf+0H3HTDj7grGgsJ+Ud7EPyZwNb//Bund/YqgkDKnpCSCpOUl7wJRrQmW6trx95
         NJqw==
X-Gm-Message-State: APuU4Z9TRvB7HFJzc45mPrk3h3zZhWLow2vHPS4sA60mM1mhkFG16CMu
	LHHqr8TFBe6W+0ZOyMB7XbpUgtlzTENbq9LV2jqaDha/HS2elC8bxKeFUxTUZT9z/84=
X-Gm-Gg: AYBFou2W3LfPsSt0eKzkUq3km+2VneR8FPH9QivazBbEleMECwX395TGPYIGPFaoItB
	e8igqhNiE/RAfrmn/0YjwyMSolkk/QNuxmRUeymByxH7Gp02sY1R1njq3mi9gLjbHN2UIaOGCKs
	X6Q6ZZONIK44BLo3CkoskQaa3AJvvXTpwzGH2inHHcZyD49MvjwA0XaYIK/mcnxdQjxIaQdEpTz
	IhcjB3Zsfs+byKwHf7Gm1K1/YZk3AeTkmm3w+3zr70X/4YWJ+ELMtS9002si9KzWyTQfz3YaeLf
	fdVKtJwMRmdU+A9q66kuA4FR5gGX7EaD1CgtdqobyuMaL2qYFnZsbG8aVgbXkoJwbRKsjgnzHki
	V9/azCkfn5dNieabd1HTue8W7AGJyHasIzMII4l62ujRQ+6QYHgU8vEhb2E3otkqU0LwAkREldO
	TLi+fgA88+BbkAjexmLj/yKKokZXaaBaeb3XVLylMllAZzE+5hfPY8W40fnlNh+sVrzcgcFxZVJ
	RaA2fTSOlVg0tIMEaZ98vEGxFGICRUDJIhOPYzWtR+s8i/GOGatmEtkcSWbaAP3A7FBr7wTzB5y
	fpTW4zRnDDgmvpY3d5invAhsFn5puwis17MtFDW7cCGVfZNExdhNjYezp/T7uiVEy4YztahIiKU
	oqw9X4ws81dBFbPM9W2/luTxV
X-Received: by 2002:a05:7022:1708:b0:15e:6541:3099 with SMTP id a92af1059eb24-1b39fe81533mr4601366c88.7.1794204971299;
        Sun, 08 Nov 2026 22:16:11 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from localhost ([12.169.103.88])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771fa200sm9992885c88.22.2026.11.08.22.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 22:16:10 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Nov 2026 22:16:10 -0800
Message-Id: <DMQGKWEKQD80.3AGDOFXBSG08H@konsulko.com>
From: "Tim Orling" <tim.orling@konsulko.com>
To: "Ross Burton" <Ross.Burton@arm.com>, "tim.orling@konsulko.com"
 <tim.orling@konsulko.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 4/5] python3-websockets: enable ptest; use
 git fetcher
X-Mailer: aerc 0.22.0
References: <20261102011816.3710992-1-tim.orling@konsulko.com>
 <20261103193829.1806542-8-tim.orling@konsulko.com>
 <93C8C258-4D9A-46A2-9164-D177A681F6DC@arm.com>
In-Reply-To: <93C8C258-4D9A-46A2-9164-D177A681F6DC@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 06:16:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249794

On Thu Nov 5, 2026 at 6:41 AM PST, Ross Burton wrote:
> On 3 Nov 2026, at 19:38, Tim Orling via openembedded-core <tim.orling=3Dk=
onsulko.com@lists.openembedded.org> wrote:
>> The PyPI sdist prunes tests/, so fetch the 17.1 tag from git. This
>> re-enables ptest, reverted in a0488f2e1d when the sdist dropped the test=
s.
>>=20
>> Upstream advises packagers against running the suite because timeout
>> tests can flake on slow build farms; under ptest it runs on the target,
>> and it passed repeatedly on qemux86-64.
>
> Whilst I approve of ptests in general, I think this one will be a cause o=
f pain.
>
> Tests are not shipped in the sdists on purpose[1], and upstream is very c=
lear that the tests are not for packagers[2]:
>
> =E2=80=9C=E2=80=9D"
> If you=E2=80=99re packaging websockets for a distribution, you must use r=
eleases published on PyPI as input. You may check SLSA attestations on GitH=
ub.
> You mustn=E2=80=99t rely on the git repository as input. Specifically, yo=
u mustn=E2=80=99t attempt to run the main test suite. It isn=E2=80=99t trea=
ted as a deliverable of the project. It doesn=E2=80=99t do what you think i=
t does. It=E2=80=99s designed for the needs of developers, not packagers.
> On a typical build farm for a distribution, tests that exercise timeouts =
will fail randomly. Indeed, the test suite is optimized for running very fa=
st, with a tolerable level of flakiness, on a high-end laptop without noisy=
 neighbors. This isn=E2=80=99t your context.
> =E2=80=9C=E2=80=9D=E2=80=9D
>
> This feels like it will be too flaky for the autobuilder, even if we remo=
ve tests which have tight timeouts.

As much as I want ptest to feel comfortable with updates, I cannot deny you=
r conclusions.

I am abandoning this series.

--Tim

>
> Ross
>
> [1] https://github.com/python-websockets/websockets/issues/1739#issuecomm=
ent-5016084799
> [2] https://websockets.readthedocs.io/en/stable/project/contributing.html=
#packaging


