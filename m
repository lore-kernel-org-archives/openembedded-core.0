Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.35385.1611181067865235903
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 14:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jGnm5Wcq;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id k193so5856130qke.6
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Jan 2021 14:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QOW96znlKgQ58qIPTePsTyvYfZB14ps/WhRfVDp4I78=;
        b=jGnm5WcqXpfcJaUy6TCS7xl2ISnfO95K0Jfn++WWhx7QezYKbAaAVtGGtyV6nYcEGu
         vXIetscsFRMqJV/utODBo/eqKS5Dhsbm63CrvCGmdpSDp/w7fbHTFqiZZCTGkaig3P7S
         WPoND+FbFp3aYdv/8sUXk0XOzzL50j6Gd+i6XbOkXPz8arJWOFo7l0m0kxogwvQaBuBi
         SJoeFD/71jPxgGT5VeM1CwUEzNrOU6ROqPAYuboUThah+uQmHMOnYkjelhID7wVVcBOI
         jVxzLuShqz8x9enbh7dhm/bt/KbWsHVtPlSZEDhM+ZO0jo/kpCrQY/R09ZsVcv0W3Mlq
         QPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QOW96znlKgQ58qIPTePsTyvYfZB14ps/WhRfVDp4I78=;
        b=fzt64V8a6XnC6EObikiC4RUCX7P3QdA9pzL5xLJmiDmKW54igzbGtVP/fJVa0rbM7O
         2Wi7veAWTLw9LPxY4oNYTaH/je56yQV/5D5pJNDtHyvxiT/C9Z5vZF50xvgYG6U8pmSv
         S+zruKN3gDEnCQJCsq4ukVlRkUTXxzCRaA5fFuimNERUrloxuKscsO1Dtino8mZSUEzZ
         2bcPL5pH3BrKfgJLQ37AIQLrXm/+0Yq6S/ZIdRAlP03gPUuRSONzxcF+DUeujCf43XAl
         h+7KECoWWCS17MNFhDz/IY4cMX6rV9/RtlYIaY3zKTNvrfZ2E8bqUCKBQc7FKB0hf3+l
         HQ4g==
X-Gm-Message-State: AOAM532zivmM5GHNigBo3h/UacVvj/NLL41YoPUeEcl+ulirRvb/vMi4
	v9DYqX010dl7LR3uyALnn1w6BOEZkBFsAoARYOM=
X-Google-Smtp-Source: ABdhPJyhNLofaE7nQZNhutztiKG5rinoEulGah6ulJ6UyPLXvyWrjEZweUh7vh3eHf9NCGw4dkya3/tC21MHAYsXbzY=
X-Received: by 2002:a37:4286:: with SMTP id p128mr3219832qka.337.1611181066931;
 Wed, 20 Jan 2021 14:17:46 -0800 (PST)
MIME-Version: 1.0
References: <20210120182001.20523-1-oobitots@cisco.com> <CAP9ODKok0YUiD2rgJfZYFS0-oP1w-GS8s-KeuV2HUG2skSSKnA@mail.gmail.com>
In-Reply-To: <CAP9ODKok0YUiD2rgJfZYFS0-oP1w-GS8s-KeuV2HUG2skSSKnA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 20 Jan 2021 14:17:20 -0800
Message-ID: <CAMKF1sqJxR=HfCW10jFdjENi8Rj-BFML4qgrRKdLQa=q2gvx7Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] dtc: improve reproducibility
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Oleksiy Obitotskyy <oobitots@cisco.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

it perhaps should be sent upstream too.

On Wed, Jan 20, 2021 at 2:00 PM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> Hello,
>
> Em qua., 20 de jan. de 2021 =C3=A0s 15:20, Oleksiy Obitotskyy via
> lists.openembedded.org <oobitots=3Dcisco.com@lists.openembedded.org>
> escreveu:
> >
> > Makefile override CFLAGS, so -fmacro/debug-prefix-map
> > optiions was omitted and binaries contains absolute
> > patch to sources.
> >
> > Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
> > ---
> >  meta/recipes-kernel/dtc/dtc.inc               | 10 +++++-
> >  ...-Makefile-to-add-CFLAGS-not-override.patch | 36 ++++++++++++++++++=
+
> > ...
>
> The patch can be applied unconditionally as it essentially allow new
> flags to be added and should not harm. In fact, applying it seems to
> be the correct fix IMO.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>
>=20
>
