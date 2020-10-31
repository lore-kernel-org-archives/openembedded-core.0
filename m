Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web10.5574.1604176213672197885
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 13:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=SLWu4d7f;
 spf=pass (domain: ossystems.com.br, ip: 209.85.167.67, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-lf1-f67.google.com with SMTP id f9so12316943lfq.2
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 13:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=w+cZjT5r9tO3bIqOzT/Dcb7oszkrX/YazKcsqfPFxTE=;
        b=SLWu4d7feUbExH581aDUBsfbQR4CorvhoALLgX9jnT7fdqPdsluUM+SxWAyNRFbFnD
         bY4EXtU8XkXG5PSrDepNOFmAuNDMq1yUgwz8dtYP5n4E++HS6D9PQ3z+hQYTadpkOORK
         1ag3/n4TtdaXTSp94jXllwMTzD+FHyiZt20zw59nkgOwPGrKl7grj+yXDN1CfCvFNThi
         PRl2OvRhq2AExVB9lY0yTIbjPHWFWhIdfw+ALLOx9yMz5AFvD+UjGYxUrG0HC9F6S2Im
         7ln8T8caxh2/HSnZQk/axby507u+UD16UlqbJsFdy7mP94M3MgHv/GoK246J7otCRe/4
         YwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=w+cZjT5r9tO3bIqOzT/Dcb7oszkrX/YazKcsqfPFxTE=;
        b=DEuJ8RJ4AMKGGC/jnjLnSb3DNJ7Y0piIu9P99T4cYG5c+rSXUgFEbj+2os0U/nfO8c
         /k34S0DTyxlYET60IjIjIrAtdIBgSeSpdjKvc6bqrDl0RxNzrfFHsuRvTF9iB/d8BkSb
         /6FKU4jpmMSGBmCU3IJ3xzWeXYnkH1L5yCeE/jnCeeS81Wb+N780xXnzeXOPfMZIlnth
         MLXTyJfzfscQ5s/SQGz0O82at7M+a2V/6ZQhOvTXBwLNS3ZCa+a1TZWD/IjRTlM7t9xh
         ZSHu+xCksWUK/XJ57sjUen0LaarYHn5pCrx37wf6q3p5jafx9jvWmpesZbUGXA111BQU
         0BIw==
X-Gm-Message-State: AOAM530/6hyQUW0Ad6WZnNHpFH2pJOHglWcofLGZkl4SFsFuRCCRTuUO
	BfDAmDd2F4RmUnDaYRkkoyJkj4GqF+y1v5A3
X-Google-Smtp-Source: ABdhPJy11JBo/yjxtmlxnshQaE/UMcl/DbULA7Db9KKJvUlgxRF9q/SndPx7GRiKWuIdhu9i94wjBg==
X-Received: by 2002:ac2:5097:: with SMTP id f23mr2822501lfm.211.1604176211593;
        Sat, 31 Oct 2020 13:30:11 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id p18sm1078049lfa.111.2020.10.31.13.30.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2020 13:30:11 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-lf1-f50.google.com with SMTP id a9so12307821lfc.7
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 13:30:10 -0700 (PDT)
X-Received: by 2002:a19:7cf:: with SMTP id 198mr3387046lfh.266.1604176210660;
 Sat, 31 Oct 2020 13:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <20201030232256.624297-1-quaresma.jose@gmail.com> <aa090613e34863ee936811011d3019eafba3db81.camel@linuxfoundation.org>
In-Reply-To: <aa090613e34863ee936811011d3019eafba3db81.camel@linuxfoundation.org>
Date: Sat, 31 Oct 2020 17:29:57 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp5US_QbOxB_GQiCjnh9zPfpLeqNeSdD5hPgVxupJS97w@mail.gmail.com>
Message-ID: <CAP9ODKp5US_QbOxB_GQiCjnh9zPfpLeqNeSdD5hPgVxupJS97w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer: use git to fetch the sources
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 30 de out. de 2020 =C3=A0s 21:32, Richard Purdie
<richard.purdie@linuxfoundation.org> escreveu:
> On Fri, 2020-10-30 at 23:22 +0000, Jose Quaresma wrote:
> > gstreamer has the code hosted on [1] and this repo as tags.
> > manage code with git its more convenient than with tarball archives.
> >
> > [1] - https://gitlab.freedesktop.org/gstreamer
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>
> I'm not 100% sure about this. Tarballs tend to be less overhead for
> fetching and make for easier source archiving. The git repos are easier
> for day to day dev work but tend to be harder for the AUH to handle and
> slower to fetch for the users taking up more space to download and
> unpack. I'm therefore torn. I know where we have used git for other
> core components it has caused performance issues.

We could tune the git fetcher to not download whole history, we it'd
be  a win win case no?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
