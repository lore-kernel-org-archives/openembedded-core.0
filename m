Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A78FE7D27E
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 19:46:08 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.751.1695757564727585609
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 12:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b4y1Ugze;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1dd7139aa57so901882fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 12:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695757564; x=1696362364; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UiBbA70II5CnxPW1lrtBA24oEKRa3NJtBgPglL2SYs=;
        b=b4y1UgzeuGIR0OJTKPdkdxWM763sO/bJxnPolAndyXFq3xc+hj5dkpnplxIkZ5lIHL
         61eBxRU9rECo54u642eQ5/8OSwmzFSBA1X7MqCl6TztrA+pVQAZhOIT3GZ/0InfetmQ/
         jxgjMrzd45HlDguvkk+3zQaA5zRj+sKHJq0fmy+puCP0iN/nYYhWLTl1cz8/025B7VFZ
         K1SGz33BqJPUy0FTwInA+8+BLn5tcxegWhMssKNs9hO7sgUFc+v3BXIu2SJ9ieBVWXnQ
         KorKpsnN4k+9wB07JdhWjm6seUh0SEmwE2wuKuyZoaaFIq2yvbYSDpeldMP0gxklsZVQ
         a2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695757564; x=1696362364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UiBbA70II5CnxPW1lrtBA24oEKRa3NJtBgPglL2SYs=;
        b=XbzE8PnA7cNALWdUrhlysTDhYdeeOnPD8bPEsJ8RMlqeIKBFVpwsirY6Qh5OW5LIMh
         Y2mo5BDo+BppnO8tlQtFqRzrciBb06tPRXyf0mOVMcq9KvHJiOEcnHBs1aVqYa5TZEzZ
         EB26LdM8FrxtFeaTF6A8WcVKRKVvgDzQH59xXMZJvd9KlM+G+WYKeIqDi2JP/bZYMYYY
         KPtespUnnbgtpzLyXgRh4Ya4pAoI0qpy4WECieGsvFWzrTXo+geMNOebqhmpqg4OVpNP
         HDKISjUBfgAmm1sgTXKlCGb1TEVx/FwrUtjo8cE8yXwxYnvuwUJSsOUCisSd27MxXNc5
         jV2g==
X-Gm-Message-State: AOJu0Yx6DqYeX9TxDKo+VNh+SnBin7s5L+W91BzluzWzMj9b8hhrta7z
	p1tWNkrtyAxwTS52jGEFJIfEh46ca22c70NT4eRsdGvexuo=
X-Google-Smtp-Source: AGHT+IEo311HsEozy2Dvjy+r4Rc9daoP8LufuOMwmpoADY5UXkDIq5f7rh/WgVmqsaPHZ/VPuVujqNtA1Gi+kHZBgpk=
X-Received: by 2002:a05:6870:ec87:b0:1c0:fe16:90f9 with SMTP id
 eo7-20020a056870ec8700b001c0fe1690f9mr12121672oab.51.1695757563636; Tue, 26
 Sep 2023 12:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230922072431.1481743-1-alex@linutronix.de> <20230922072431.1481743-25-alex@linutronix.de>
 <CAMKF1sprXm-xWCYGVbtQTt7y5ons1Of4ktDHMq0HYBE0+2A+JQ@mail.gmail.com> <CA+chaQf3p3=hzQqc2JqBjxMjy-wmBR2vjUqa5QpFcDT7qtj7+Q@mail.gmail.com>
In-Reply-To: <CA+chaQf3p3=hzQqc2JqBjxMjy-wmBR2vjUqa5QpFcDT7qtj7+Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Sep 2023 12:45:37 -0700
Message-ID: <CAMKF1srbXRv=ubNecLvvbW8o7bNdUfL8reUwOuFLeFgBRcAN+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 25/40] meson: upgrade 1.1.1 -> 1.2.1
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 19:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188259

On Tue, Sep 26, 2023 at 10:55=E2=80=AFAM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
>
> On Mon, Sep 25, 2023 at 6:47=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
>>
>> gnupg failure seems related to this -
>> https://errors.yoctoproject.org/Errors/Details/738191/
>
>
> I've just sent a fix for this one (gupnp not gnupg :)):

Yeah poor eyes and spellchecker have me at times. Thanks for chiming
in with a patch

> https://lists.openembedded.org/g/openembedded-devel/message/105145

