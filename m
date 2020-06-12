Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.1367.1591997920369993737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 14:38:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=vQ+MO4HT;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.196, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f196.google.com with SMTP id v79so10429039qkb.10
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 14:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=85QvoJz+ZVLqCcU1AfuioAZYd+wpQUtTzydZazHUIgk=;
        b=vQ+MO4HT4UKbUg4+PFgEi8mQoQaCLoatvtJg/OaudTJlhB/USY57D85ekFwCORq60z
         f2aHaV1VkKF+BdZvKNpwoWnKIAiZ4kK8PRnF1SxA3kbm4MnK3zDJqZtHbkjEloXafsXU
         yzgd5VfTRGHEXbTjBHWNUWYEfCdC3WiQa8rXfwGzj/8+Pyx1qCE1VIplCS9DoOSNiWZt
         Olb5nCPp5SnoBjZE8dTpJ/aYTgSAFlNvyABOG51bwXBrJCdQYcoYQacmBfvYVCjvSxUG
         D29DOEVPhXFL8vv86PY6uBu3Vg+IvlvEEVWB3vK/Z8z56mWVCkc6GcFIBCDwS+W2RTvM
         yDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=85QvoJz+ZVLqCcU1AfuioAZYd+wpQUtTzydZazHUIgk=;
        b=FlvGDxHnPlefZ+XvAMjXP/qxCLxGysT4NliCYKAHTBcqpTaDtw8szPXnOR1E06VQ2P
         2gEHSqypqlZvm9VrMDnL5altpB240tznJTMeuVKZPK2YyZzDaHyXV9MUVx1SM7a9M35B
         Vomm74P9e2pd/O7E2gHjYuvCWlsSgeu3rnQb8DHTAuTLa1NI2v8Y8pKPYwpRI5Fkmpl6
         0hytTtWK4UTetek6AJDsBkjwehORTrkgtC5QYKJbL+XzPlrwOhShH7QDnvWfGb3ZvQJI
         IeYRIAEY7IAuWgbNZanQkIiRziEywg0FwTXbtojLhJ099lwwRnqJ98cCYLXgqkuMEeQs
         xzFQ==
X-Gm-Message-State: AOAM5330xQ6zv/9Jgb97cburICwljNbLF98gHNc8gj4x8wRNk6Ne+9sg
	bU7utLed0wqQFQLz7JjH+HDwqcAlpjqXlA==
X-Google-Smtp-Source: ABdhPJzAC3b83JM186K7NRuvahU3awDUQuM/sZi1O0C2Yoa3X46U3vajA+RB5C+lnSP6PZ60QO0QkA==
X-Received: by 2002:a37:9d92:: with SMTP id g140mr5101817qke.59.1591997919199;
        Fri, 12 Jun 2020 14:38:39 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id u14sm940403qkj.18.2020.06.12.14.38.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 14:38:38 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f173.google.com with SMTP id g28so10477866qkl.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 14:38:38 -0700 (PDT)
X-Received: by 2002:a37:5d6:: with SMTP id 205mr4916572qkf.46.1591997918020;
 Fri, 12 Jun 2020 14:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200612180809.107139-1-otavio@ossystems.com.br> <20200612212556.GT17660@denix.org>
In-Reply-To: <20200612212556.GT17660@denix.org>
Date: Fri, 12 Jun 2020 18:38:26 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoa4LLNv0GQJ=fKNebGpe2uu_-gmNKQZWZxKUeZK5z_tg@mail.gmail.com>
Message-ID: <CAP9ODKoa4LLNv0GQJ=fKNebGpe2uu_-gmNKQZWZxKUeZK5z_tg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mtd-utils: Fix return value of ubiformat
To: Denys Dmytriyenko <denis@denix.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 12 de jun. de 2020 =C3=A0s 18:25, Denys Dmytriyenko
<denis@denix.org> escreveu:
>
> On Fri, Jun 12, 2020 at 03:08:09PM -0300, Otavio Salvador wrote:
> > This changeset fixes a feature regression in ubiformat.  Older versions
> > of ubiformat, when invoked with a flash-image, would return 0 in the
> > case no error was encountered.  Upon upgrading to latest, it was
> > discovered that ubiformat returned 255 even without encountering an
> > error condition.
> >
> > This changeset corrects the above issue and causes ubiformat, when give=
n an
> > image file, to return 0 when no errors are detected.
> >
> > Backport fix from 2.1.2
> >
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >
> >  ...-utils-Fix-return-value-of-ubiformat.patch | 62 +++++++++++++++++++
> >  meta/recipes-devtools/mtd/mtd-utils_git.bb    |  1 +
> >  2 files changed, 63 insertions(+)
> >  create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-=
Fix-return-value-of-ubiformat.patch
>
> ^^^
...
> ^^^
> Was it tested? The patch name doesn't seem to match the file name.

It was, but I sent it before the git commit --amend. Sorry.

Will send the v2.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
