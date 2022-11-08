Return-Path: <chase.qi@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 485ABC4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 03:57:47 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web09.4333.1667879865681663882
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 19:57:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=s8I9PL1w;
 spf=pass (domain: linaro.org, ip: 209.85.166.42, mailfrom: chase.qi@linaro.org)
Received: by mail-io1-f42.google.com with SMTP id n191so10552364iod.13
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 19:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mutfGMyr68kjZksMYbDBkMzUtFajPuJTf4hslcejnE=;
        b=s8I9PL1wBEZNMeg/knzGrRnWtPBzbelZn9QKsYTkmn5v+sY09vOKIAjme837Sg9GI4
         N086piAHXs2e/QXfQnq90NDKWvryitwIoqyI7IgK9kqpS1A6gn8+4V1OKUbJgk/3FD5M
         E7ws+LUWCJGFpcH1dISodEnyjMVmNfG5ne+wcfdiA/dZVrq2Og270UWVX9ssDIWeCtvL
         oGdtsqm7c4N426AYGTL9gYh4igUleLx6ZKWQEdWtMGQReIeOB20yKEzzHV29DLxXoLEe
         VNL/U+vmvPYNdk0WXpAvsu0SNK0TzF7TMvcAHLtQRxv6+pjDJuojFqW351w2lIQGrZUa
         Mntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mutfGMyr68kjZksMYbDBkMzUtFajPuJTf4hslcejnE=;
        b=mqz5t6mDGHkrUBNpf1MWKpsdtnvMHKZNK/VDU0A81GBpNMxor1+xwbEewUXtB6pq1U
         K46Kh6YgQgAEhphbgg6efZ5I3bCHWyAXb1GnCRoV0F7a/ywm1cljukoWBWlO3rwYYhZJ
         Z2/q6gnzecTTolNqoAGLrKDG44gZ5V8hpPh2llQzrbgbkfFyUrcKL+wmzc9T25gMh4hf
         ICbp7vjmAOuc+IHmngYS/swXpqPGHafOnxeB/e2nfpLjKow2mvHbQzgO3O5SClN7LMAA
         6QWNf/AAQw89cVhV5c4urzd8CtYlUAm/wlLnoyj/+7UXXMtwk/0xWt6beauNaku64TBr
         Pj3Q==
X-Gm-Message-State: ACrzQf0QxvgENdd/czd8x01n+O9WGTwlETiTC9kq+qxEo3Kvc5DgfrbP
	SuDtoV/ZD0XnNvdV7tAVFSmt1GDjMBY/ychewvrEUW1GSO5ab48b
X-Google-Smtp-Source: AMsMyM6T2MaPtFrKqk7xQB8cCogjdb55hSzxlyppr19mw9wUZFRVF8XZACXpju8ACA80668vN9HH9WE0xowIqNvvpog=
X-Received: by 2002:a05:6602:164f:b0:6d4:8783:8019 with SMTP id
 y15-20020a056602164f00b006d487838019mr19083780iow.77.1667879864826; Mon, 07
 Nov 2022 19:57:44 -0800 (PST)
MIME-Version: 1.0
References: <20221104100140.976337-1-chase.qi@linaro.org> <D6F57683-658C-420A-BE73-78E1E03FE0A0@arm.com>
In-Reply-To: <D6F57683-658C-420A-BE73-78E1E03FE0A0@arm.com>
From: Chase Qi <chase.qi@linaro.org>
Date: Tue, 8 Nov 2022 11:57:33 +0800
Message-ID: <CACLiBhCeqAT-D6FZUx0on8q6XR53qiT=kwdMqKjw+5Q+4m8fuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] libc-test: add libc testsuite for musl
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 03:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172950

Hi Ross,

Thanks for the review.

On Fri, 4 Nov 2022 at 22:13, Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 4 Nov 2022, at 10:01, Chase Qi via lists.openembedded.org <chase.qi=3D=
linaro.org@lists.openembedded.org> wrote:
> >
> > +SRCREV =3D "18e28496adee3d84fefdda6efcb9c5b8996a2398"
> > +SRC_URI =3D " \
> > +    git://nsz.repo.hu:49100/repo/libc-test;branch=3Dmaster \
> > +    file://run-ptest \
> > +"
> > +MIRRORS +=3D "git://nsz.repo.hu:49100/repo/libc-test git://repo.or.cz/=
libc-test=E2=80=9D
>
> The project=E2=80=99s web site at https://wiki.musl-libc.org/libc-test.ht=
ml says the git URL is git://repo.or.cz/libc-test, so that=E2=80=99s the UR=
L we should fetch from.
>

The summary page https://repo.or.cz/libc-test.git shows it is a mirror
URL of git://nsz.repo.hu:49100/repo/libc-test. In v3, I removed the
MIRRORS line.  https://repo.or.cz/libc-test.git is used directly now.
At least, there is a team maintaining the services.

> Also as this project doesn=E2=80=99t appear to have versions, set:
>
> PV=3D=E2=80=9C0+git${SRCPV}=E2=80=9D.
>
> This way the version has the git SHA in, and if they ever release a versi=
on it will be greater than 0 and sort correctly.

Make sense, added in v3. Thanks for the suggestion.

- Chase

>
> Ross

