Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web09.305.1611955222514866947
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 13:20:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=M4d4NxOK;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.179, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f179.google.com with SMTP id a19so10212560qka.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 13:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=o1WYy4qphWhLpiWyqTtUdF/uUnE1MBvfryvi5p3ZJUI=;
        b=M4d4NxOKATh1WZgg0aUw4QlniU+Qt2rqXopp6Z2wStoL1rVnetG94u/ASmq+N4RdUc
         JKOSX3c1deEidY6o+3qA8DQlmVO1eFpW81BP148BT7Xkx9PWzjLIGDj3kZQdwWL2sBGp
         McocxXbvMwXwEfrIMi7+TkNICx/aRv1usefsvLIpH6zW+UF+zDgOmQWPVJw7EGoXZTKp
         w1QnEaFAIz8wHmcNxvXblOktFqQpZ5DgtglTsPvO1Sw/Sx1jwmtPbzX9MXfHmn6XoO4G
         7f330VoC6wOzTF/fvKRyAyGr8slFN+wIzazzT5EBrLO5urClDOKVNRM2UW0pl+jnjIbh
         YvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=o1WYy4qphWhLpiWyqTtUdF/uUnE1MBvfryvi5p3ZJUI=;
        b=fqOU+HqIYLUCRY1e0q/owVO5CFuVeQrKuJRtBtgaqiKzTz4UXP3Yo8FwoEi8EKD+yL
         6bRUxSAlN5CIvybOf+CO4fGoPO+o3jxdlAMnhIMIsBoulAVKpmyFDrQqCaG6JJCeJarQ
         JOUE0SyDnzKwqn8YW62oXsHP3jLfP10AA0XzXIzEyRd7qU6wkpzNOE6i/q43ShHjoSzv
         v6g86nqL301WCZ8V9Pl1w1dK17flx7BrKGQUHu23/+sRUPV56mTHdIwLgSn0TF6TQazk
         6FWCLHhHAHBt++01Sg1a+Nfn7h6MiNGNCn+jkYEWSArAjr3tjNlFO7YjT+SboNMxLV5R
         CGSQ==
X-Gm-Message-State: AOAM532NVf0UR0c2w2d9KsdojJYfKhjECX221m1C9XqI8526aMzPf3+G
	5inWwqLpluTaYjL72ZddL03rJgx9Ibmi2dK8
X-Google-Smtp-Source: ABdhPJxOwNL6u39CWAI6HB57f9w5y4bLzToz4OZVyWdaB7Sw6YfCRQ2YG+PCjorWsOOFSa6Ko++1ug==
X-Received: by 2002:a37:8e06:: with SMTP id q6mr6241062qkd.402.1611955221409;
        Fri, 29 Jan 2021 13:20:21 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id 22sm7042968qke.123.2021.01.29.13.20.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jan 2021 13:20:20 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f182.google.com with SMTP id n7so10188026qkc.4
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 13:20:20 -0800 (PST)
X-Received: by 2002:a37:9a4a:: with SMTP id c71mr5841698qke.414.1611955220474;
 Fri, 29 Jan 2021 13:20:20 -0800 (PST)
MIME-Version: 1.0
References: <20210128213504.3821-1-tom.hochstein@nxp.com> <a525b7f9-c4d2-f28d-5be2-4d97590c9730@gmail.com>
 <DB6PR0102MB263003ABFF3E2D9FEE5E378988B99@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
 <CAJ86T=X=GTOM5X4vgZ4ox4_q1Dy-Y4p0Nthy047GrJBdYJ_qcg@mail.gmail.com>
 <CAP9ODKrVvkYGiJrzjEr9CgzGsGm_Wdk_8+uU=CzX6FUm1OnRHw@mail.gmail.com> <CAJ86T=VvPonLRKnERV=Y2xtrhK3edzd+3amPfGf-gHXB8H4++Q@mail.gmail.com>
In-Reply-To: <CAJ86T=VvPonLRKnERV=Y2xtrhK3edzd+3amPfGf-gHXB8H4++Q@mail.gmail.com>
Date: Fri, 29 Jan 2021 18:20:08 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpjUB0RAU1TfQEbkGObn8gSqVj_-hN6SDeFV+xAWObKbA@mail.gmail.com>
Message-ID: <CAP9ODKpjUB0RAU1TfQEbkGObn8gSqVj_-hN6SDeFV+xAWObKbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [RFC] openssl: Enable cryptodev-linux by default
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Diego Santa Cruz <diego.santacruz@spinetix.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>, 
	Tom Hochstein <tom.hochstein@nxp.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 29 de jan. de 2021 =C3=A0s 18:14, Andre McCurdy
<armccurdy@gmail.com> escreveu:
> On Fri, Jan 29, 2021 at 12:45 PM Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
> >
> > Em sex., 29 de jan. de 2021 =C3=A0s 17:39, Andre McCurdy
> > <armccurdy@gmail.com> escreveu:
> > >
> > > If a distro or BSP layer wants to enable cryptodev-linux support in
> > > openssl they can already do so by creating a .bbappend for openssl
> > > which adds the PACKAGECONFIG. ie if we decide that the option should
> > > be left disabled by default but controllable by the distro or BSP
> > > layer then no further changes are required - we already have a fully
> > > functional mechanism to do that.
> >
> > DISTRO yes, BSP is harder. If we enable it, it becomes MACHNE_ARCH as
> > well as all packages which depends on it.
>
> That's a concern if you're trying to create a package feed. But in
> that case you should already be taking care that BSP layers don't
> change the way recipes in common layers are built. ie this is
> something you would be controlling from a distro layer anyway.
>
> If you don't care about maintaining a package feed (which I guess is
> the majority of us?) then BSP layers which contain .bbappend files for
> recipes in common layers works just fine.

Also build time is a lot bigger.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
