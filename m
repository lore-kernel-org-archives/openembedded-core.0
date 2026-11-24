Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13575.1795508563178061169
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 00:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=fz3nMHZ6;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so3428225f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 00:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795508561; x=1796113361; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQnPpCgj5jVNlZkgbCtrAC4dd2vBmN77oA1dSVxu2yQ=;
        b=fz3nMHZ6DlS8b1EAHFODiSpeEb4+QFlLUfRD2pneYnt1mlzRSd/MJsSrrncFjlQIbn
         zUQO1WmBJYFUJbeW6x8qmtCJ9U9grDRYSNtw0KzPnAj8tGhBZlqQ5jX0hxLlaCAjKw3L
         tc0SBhtNOqZjO1f0xSDXcbMcDdfRui0fpJNd7v+KNXr4KNaPcTPq4kwxD5BWaMVPPblD
         KvvQIaPhSbCQqL+mLTRKICtRNyUG/09jp1PTWdT5eJ6E5hUspCujwBDPZDGkLPL9EcJL
         q7rYs8xJcFPBYTFV8d/61kNqXLt1ACrTh6DwhAPazby54ciTlqefSq+I8h5zFUFtFwwG
         aC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795508561; x=1796113361;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aQnPpCgj5jVNlZkgbCtrAC4dd2vBmN77oA1dSVxu2yQ=;
        b=h2OIVyRmoE/V1lBHgjouSA9zA9qBe5HqIqSf5CknaxWEY2ohbtNNmZSoUDrgnw7yjp
         oEL3s/2vH+7z/JIfNJ30bEsKH130lDIv4KJDdAkx5PBhLNpuAoaQ8ZWKHdkfhe/wGs4a
         sj1Ff9qHHufPg37D3IyvPln/bOiJxba7zDUORUX0aHeP/ZiPyC1yt4rNh5swR3fcyGfd
         9eL3EeYqyV/QfJ0Sk3Qode3kqo3expYmu/XcQmU6k4cy3yuaLYt3YjvPaFKEG6Vz7N6J
         F4bJUrcGIf+MQDWcg5EuHL4FvIdPM7Kvv4nOuzjxHc3G1f/c45StWAeep13IXUQ2CCyT
         1UpQ==
X-Forwarded-Encrypted: i=1; AL+hErFf6ZnqCayZly4WbnsRhg/XX/zZDi815t+7NHfdFwXGnJHURF7VQr0phNjlMplp0m4cn02sdHJ37exsMpHdDk4a1w==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/wvNxjdy6t/1S/2gkkHYabY99NQeiOpOB6nwg7Q2o4e2Rblas0
	dLlyv4oOjd98EZY/zVieAO7w2sdVuVxIoPexM+Cu6QXrKz9ivfgwxYRk91nWi2eF4UCMyUU6G6q
	qZXRQafc=
X-Gm-Gg: AZFdTZexZWAecedFRKsTRBmqyScnNjm4SyY+m06O41N0+MIUWV6HMmv1gvfdfluYCp3
	EUKgoZtaWRloYIFFEtRR9DfDtpqqUpqBBqp6+uHw31LGXERPdoDDRB9ypYTbNweRhMV1PesHZ2D
	4S+N94tKdrwvmRdrHSs39MPoWpbu8rySoeS3W0OoYluyXj/w1V6c4fPXsSVleGwSlU/TXCh6GoD
	204+fnRU7oGIkr4viv39Ynyed6VMCTc+VHTeXuRqj/rBKWzhJkZ72keRVvtDAZgy0jGknc1dpOx
	tirI1NiPPn264vzrWkFwiB1DcON+1ckIyF6Rlh7fGEWuciowGFqvqhJwK9lf24zIO9y5FhlEaHQ
	eyzQYbBFv+obnEuHdP8ZdHUF8wl7MJ4VUCkFwXDMRE2L1rK5wKe/seGSTuWHk5knTbecB7+quMP
	kYjf3ptiMcNb9Hs5KE/HI4mVwWqzoFAl7qk8B96b+JzdjvT4S0IxsbXLWaFhQQEkBw/oA6MZUHq
	A9EOSkke99mCvBiQnhcrHVBbquCzooiXsgJQylmuTWr5BPpWP+1lLF1EkZcCfHChx5dlLq/rvDp
	9FJ2pZ89IxO8R+/ghSHXJAYcpOWsMx3q+6BE0SXOwCfa59YrkRrLuo/m6mjnoKkdJhq1N2Fzyyo
	WznxszFiASxPIz1Gm
X-Received: by 2002:a05:6000:27c1:b0:4a6:5c43:6a44 with SMTP id ffacd0b85a97d-4abb2726bf6mr16483151f8f.34.1795508561237;
        Tue, 24 Nov 2026 00:22:41 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm26671829f8f.41.2026.11.24.00.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:22:40 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 09:22:40 +0100
Message-Id: <DN3ANXLU1MI1.ACTEZQZUNIEW@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 1/2] attr: upgrade 2.5.2 -> 2.6.0
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261124055437.731537-1-hthakar@cisco.com>
In-Reply-To: <20261124055437.731537-1-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250966

On Tue Nov 24, 2026 at 6:54 AM CET, Hetvi Thakar -X (hthakar - E INFOCHIPS =
PRIVATE LIMITED at Cisco) via openembedded-core wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>
> Drop patch (issue fixed upstream).
>
> Adjust file names in ptest packaging.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit cd63486443d4aeafc5d508ce874e4238c17813ad)
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  ...ibgen.h-for-posix-version-of-basenam.patch | 35 -------------------
>  meta/recipes-support/attr/attr/run-ptest      |  2 +-
>  .../attr/{attr_2.5.2.bb =3D> attr_2.6.0.bb}     |  7 ++--
>  3 files changed, 4 insertions(+), 40 deletions(-)
>  delete mode 100644 meta/recipes-support/attr/attr/0001-attr.c-Include-li=
bgen.h-for-posix-version-of-basenam.patch
>  rename meta/recipes-support/attr/{attr_2.5.2.bb =3D> attr_2.6.0.bb} (88%=
)

Hello,

This upgrade would be an exception to the usual rule to simplify CVE
patching. It needs more justification that a simple cherry-pick from
master. I expect to see:
- An analysis of the changelog highlighting changes outside of our usual
  policy and their consequences to our user's code.
- A link to the CVE backport attempt that lead to this upgrade
  suggestion.

This is a bit of work but we need those info to defend the exception to
the rule.

Regards,
--=20
Yoann Congal
Smile ECS

