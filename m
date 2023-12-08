Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44493C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 13:48:04 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.35884.1702043278808232774
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 05:47:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YXogjiuq;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2c9f62fca3bso26324891fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 05:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702043277; x=1702648077; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rj2z/ARUdsMWX85+B0XZ8FH+hsBey55UwR4QgmdEX8g=;
        b=YXogjiuqNDkx2OzkuYpKhwZww/ltCQY9qTqiQ5SGZuJCo9+jteT0ZaWtlDiqSiIXfw
         /DxHpTJzGgCMJKPzppLRrgSYVNDGZIp5KzZEqAteq/xurnWcsiJR3g3HRY+PJsIKqoVG
         PVyRF9XkBWgKoO4e2M63H89UVP7cIPH6Y4VVadYSwqh1BxJvB37ZzBal1lyneoL9ko9p
         KH3urD3CzDJ/jrOcdScPR2e7cgD1Zte4RUcS9RYe0N03NhSUfa9zL45NI7qaHQ/xxb2x
         zypLl6L5VfF7w6dOmMFQmprG0mIYMO/eQ7hsHVaVfprsZtLRYagxUm57aEzryKGQlQm9
         8Kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702043277; x=1702648077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rj2z/ARUdsMWX85+B0XZ8FH+hsBey55UwR4QgmdEX8g=;
        b=b06lAYMWQmEalVJojUkV4B2OYgKiQiOfazKIrNc1ceHSzezKmkR9/HfCcw5AgY7U1i
         oGUoBJc41oZcCGD0ZN2XKS364jHmy0crNs9sVf0dfUvNZgi5SJu/EtS4otlLHOo+M6Ay
         /hCd/ZjVe9LMHZxeI7kH9zK1okc0RN0V9d/RaLq+u1DV2fnVLj9myjJ7BH/Ys3JUaB08
         Sge7wRyZRjxs2W1Eup8XuIch6m0KtkZD+e1xYIjS6XnTNTWa4dtZjC2BV//5YCaektcV
         I4DMcqn44UFuk/QFh8NyaOFh8hGsXIFy6UkKijd01U8H8ArpoocC+a3YC/kq541xkzQk
         MODQ==
X-Gm-Message-State: AOJu0Yy5+u7IFbImfB+jRe9EcA9rvJ3FqM5Aeuqsx3oNTSNAHv3gCYAK
	11qhiXfez3Ux3ht3ZHF18wEE1ooPxpFAi6u4pQKSoNVL
X-Google-Smtp-Source: AGHT+IGiJSOdSXcZ1XH1+noMWZ/j3/4z+Uwz69wHHXu2RWDY8jkntPRJ7mJbU3wgPjiJoQNPXJnwZLYtH3zDV0Vvk9Q=
X-Received: by 2002:a2e:6808:0:b0:2c9:f6e6:fe3e with SMTP id
 c8-20020a2e6808000000b002c9f6e6fe3emr2463532lja.49.1702043276449; Fri, 08 Dec
 2023 05:47:56 -0800 (PST)
MIME-Version: 1.0
References: <20231208095455.1252421-1-Yash.Shinde@windriver.com>
In-Reply-To: <20231208095455.1252421-1-Yash.Shinde@windriver.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 8 Dec 2023 13:47:44 +0000
Message-ID: <CAO5Uq5R1hYwo+oa4QR9bFQif57OrXbWEY0QSZfJZZHmipfajqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust: Upgrade 1.70.0 -> 1.73.0
To: Yash.Shinde@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 13:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192061

On Fri, Dec 8, 2023 at 9:56=E2=80=AFAM Shinde, Yash via lists.openembedded.=
org
<Yash.Shinde=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Yash Shinde <Yash.Shinde@windriver.com>
>
> In rust 1.72.0 the 'mips*-unknown-linux-gnu*' support demoted from tier2 =
to tier3.
> The mips bootstrap compiler is removed from src/stage0.json file and
> so the same are removed from rust-snapshot.inc. [https://github.com/rust-=
lang/rust/releases/tag/1.72.0]
>
> Drop bootstrap_fail.patch, getrandom-open64.patch
> as they are merged in upstream rust.
]>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---

If we're going to go down the road of disabling the rust oe-selftest
(and I don't see a better option right now as we're well behind), I
have a series which steps us through each of the releases up to
1.74.0.

It also avoids the need for the library/test hack (upstream has a new
target we can use for libstd).


--
Alex Kiernan

