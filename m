Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.21504.1604265407914955866
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2020 13:16:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lPqEEHwy;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id s25so2132537ejy.6
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2020 13:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fOLX7eBWeDGqEz/3FFc/uCHaB5II+tn0olA1mgSR/eE=;
        b=lPqEEHwyKiuTJG8riLumbzAer+vyqqIkmGqQnS4q+I475IuF9ejUhRxr2xkQCJADYB
         fBRhoH+M2Bumcu/VqNH8N1i4cKIMUp5b16zTDGCjtcKzhZrbt+zFHAqGRC6GHXU3Rf3g
         JJtbhYJ2FAI/8qtG/T8UnKF6zk3x3pZ4S+JrvS5jq/LWeGppBb7C+CSwPTTqGAsoVvq/
         3m6JFlvGYi7yY3fIUDF/H/4mCS8cEIQzK3gTcIvmYVm9N30hu76VjzMpK1Nivtt/bXV7
         69DV3ig2rZo/mY3sgVnyBzrtqeyH4aYO6wY2LKINWYcjAdcGu+yLjLNXdhrMRrsPnVjx
         mkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fOLX7eBWeDGqEz/3FFc/uCHaB5II+tn0olA1mgSR/eE=;
        b=LhrYaBNX8g17PFmMUlJVX2jDJXNk3hcTLCgswe6EwWHmNTMrDodwHcf/VMI/kAe1bl
         nqTC1tpKg0ZTqSiz26WGCPN47BF4ZtD+BuOL5slGf/4TlMQaWg25uiCdMKPy0wYblIrT
         cjCdSsZ/OChZDMaDkEiyAFgcW6KByX70ZerCNVdEeDJKgUoq/5K3BEtjjuli0QueTv0C
         bjMWi18vLcLNBeK36b/Wgab3LCY97KE9wBErxs82hiaCbEDuoJ0jYKZHxZl78ydrPLzP
         B6mdeu+M7jrD/Id+Qo1eCY6N7rfa08y2TOaIIzsTJOzjm28p2kTNaNHGEz8vQeRfda0b
         wSPA==
X-Gm-Message-State: AOAM533Ry15loPXtup3z8pLv5nl5WkoLLL4RBqantqymjvlWqCqErHG4
	1tEoNitZiveNDLw9E5w1dCXwZQQx9ur1rPtNwrk=
X-Google-Smtp-Source: ABdhPJwi5zl0J94q4NijYQtCT7Ojm1cbqjauJcaz0Fj86HUSm/7TflddMtM2PfeiGWyEKZ7dKkaA68bdA8dN/qO7pzc=
X-Received: by 2002:a17:906:16c6:: with SMTP id t6mr12338790ejd.453.1604265406320;
 Sun, 01 Nov 2020 13:16:46 -0800 (PST)
MIME-Version: 1.0
References: <20201030232256.624297-1-quaresma.jose@gmail.com>
 <aa090613e34863ee936811011d3019eafba3db81.camel@linuxfoundation.org> <CAP9ODKp5US_QbOxB_GQiCjnh9zPfpLeqNeSdD5hPgVxupJS97w@mail.gmail.com>
In-Reply-To: <CAP9ODKp5US_QbOxB_GQiCjnh9zPfpLeqNeSdD5hPgVxupJS97w@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Sun, 1 Nov 2020 21:16:34 +0000
Message-ID: <CANPvuRmR1=tNVRzLDB3teoKz+k3OFAf4KvJ03mFemgYQyPSDEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer: use git to fetch the sources
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Otavio Salvador <otavio.salvador@ossystems.com.br> escreveu no dia
s=C3=A1bado, 31/10/2020 =C3=A0(s) 20:30:
>
> Em sex., 30 de out. de 2020 =C3=A0s 21:32, Richard Purdie
> <richard.purdie@linuxfoundation.org> escreveu:
> > On Fri, 2020-10-30 at 23:22 +0000, Jose Quaresma wrote:
> > > gstreamer has the code hosted on [1] and this repo as tags.
> > > manage code with git its more convenient than with tarball archives.
> > >
> > > [1] - https://gitlab.freedesktop.org/gstreamer
> > >
> > > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> >
> > I'm not 100% sure about this. Tarballs tend to be less overhead for
> > fetching and make for easier source archiving. The git repos are easier
> > for day to day dev work but tend to be harder for the AUH to handle and
> > slower to fetch for the users taking up more space to download and
> > unpack. I'm therefore torn. I know where we have used git for other
> > core components it has caused performance issues.
>
> We could tune the git fetcher to not download whole history, we it'd
> be  a win win case no?

I don't know if it is possible to use something like: git clone =E2=80=93de=
pth 1
but with a solution like this we reduce the download overhead to
values close to the file archive.

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750



--=20
best regards,
Jos=C3=A9 Quaresma
