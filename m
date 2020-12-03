Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.web11.1857.1607023228481708125
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 11:20:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KRSJltxB;
 spf=pass (domain: gmail.com, ip: 209.85.221.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f170.google.com with SMTP id r9so670929vkf.10
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 11:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PPFHpTAMQXlE5TUKET6B365RB9iUx/P61Q1YENiLey4=;
        b=KRSJltxBGub9pXLhB6EWT1OkAYO8wNH0fa3pKKy7a44zvp2x3qQHUFi2J6uvrIUVwh
         aPTxrskzDkze/00pDxTrpMOWpUenbwBjtShqZyn9shcyPCTQVdfasAEjGl/XwUJHiBX5
         7G2Ge7xwnwy3RKZ6XbLhiLIFxlDZndBQb7KlB2RwhSn1GWR/mm8pgXgYR2oez7KVkaPD
         gyLLoL1YO7YX8DBpAPce1aN5u4dkXfcGtWg02kIV3RRWT0VSd2Fd80F9tmxY7hIW4/Vb
         hlU5CfyqNn8dkYVlX1K2QpY8P1hRDNHgGXUC2wkWOfB20KQB2YfkMcUAp2Zh90G2JYZV
         N7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PPFHpTAMQXlE5TUKET6B365RB9iUx/P61Q1YENiLey4=;
        b=svykvmiO9caHUc4BSmZPd+Eb5wtkNmv9rCg1TBMXfN2oAGloK/GRRkHCZ2K69PLLnV
         O8KBZFJzL5VW6gNucL6h4epuhGbOE5RKQOhJyXLjF8AMOO8VS1YchfiWOJGjh3o5KXLb
         odMaoxa6LCvBTesg4OW3XwNIH8AggtUhP7HM+Ko7AEz/mdpfP4i5ltAR/qvrLfV4oURk
         HzIzmr9SsWGNBRVuSnRJSoPGPV6O/6JuON0cRAl9Owx9olJuvugI8OG0ewFBmUPy8mna
         MYxMWPax+4sL5+955iZdXAa7CCBkmKVNA3uWD9mXrN6gA4QHASYCzLv2SwwpEanAfMfM
         Gj1Q==
X-Gm-Message-State: AOAM530Mj/ziZDNxBLTFWeKjrGbVaYVJiaR3b8z78ezBWdpDUAAC1TLy
	6tm//g3bAm2uZVQU5cmiILv0xtUe+Syx7M7bMas=
X-Google-Smtp-Source: ABdhPJzCzEgmbMbcJxPHJK3igkuBQQqCpCLOH9lpyEXwW375jlS8IoRLn2GtL50fxRQaUjktphz5TZqz+ElTUVJ2IFU=
X-Received: by 2002:a1f:5e0b:: with SMTP id s11mr832287vkb.8.1607023227651;
 Thu, 03 Dec 2020 11:20:27 -0800 (PST)
MIME-Version: 1.0
References: <20201203133727.12936-1-alex.kanavin@gmail.com>
 <20201203133727.12936-4-alex.kanavin@gmail.com> <CAMKF1sqM-xmu-L-nhRKsf-A1Loiv0U72zV6jcNXyEy9QOLXdNw@mail.gmail.com>
In-Reply-To: <CAMKF1sqM-xmu-L-nhRKsf-A1Loiv0U72zV6jcNXyEy9QOLXdNw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 3 Dec 2020 20:20:15 +0100
Message-ID: <CANNYZj-fDQdkXVN=hjqb7u=bqPZhXfidO_cT+Buv6gB4gAN_ew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/11] ruby: fix reproducibility
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a1492d05b59440c3"

--000000000000a1492d05b59440c3
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Dec 2020 at 20:16, Khem Raj <raj.khem@gmail.com> wrote:

>
> where is this template used ? is it used on target ? is it possible to
> just all bare compiler name then since it will still work on target
> although not as important as if it was needed during cross builds.
>

I don't think it is used on target, as harcoded host items would surely not
have worked. Again, the goal here is not to ensure that target toolchain
and target tests work (a large and not necessarily useful task), but merely
to avoid host paths leaking into target packages.

Alex

--000000000000a1492d05b59440c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 3 Dec 2020 at 20:16, Khem Raj &lt=
;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
where is this template used ? is it used on target ? is it possible to<br>
just all bare compiler name then since it will still work on target<br>
although not as important as if it was needed during cross builds.<br></blo=
ckquote><div><br></div><div>I don&#39;t think it is used on target, as harc=
oded host items would surely not have worked. Again, the goal here is not t=
o ensure that target toolchain and target tests work (a large and not neces=
sarily useful task), but merely to avoid host paths leaking into target pac=
kages.=C2=A0</div><div><br></div><div>Alex<br></div></div></div>

--000000000000a1492d05b59440c3--
