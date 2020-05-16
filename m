Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.12027.1589660656278462189
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 May 2020 13:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZnwDJ5yx;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: andrey.z@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id l11so7401102wru.0
        for <openembedded-core@lists.openembedded.org>; Sat, 16 May 2020 13:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gg4c48ZYZPukYukeYH1FstEudWtK8wPAR7/53fvdhno=;
        b=ZnwDJ5yxxux8TUSaxDrcKLa3GNdOzksWj/vkjCf5KxYN39gVSOI4Lc7rJfoq4FU2FF
         61hMKF6dB27MfgxWiV5TTiTPW8kl1KtipvPA5hc20nq16JCDVdQI1pUVjtsAdOrgVAp+
         Yx5Zc8TuKuPCj+sLsvIv8ffMGTFXEBJpb+6LfDOhixg3S4uNUpXZ2g9PPOWMJxUL+3Mk
         GLvzYXvLq9Jjuc3wvPtEznsZgZqu9Ix1J6h/QcCjhnWlF8BavS30g8NzrDC+HTEjeHQQ
         +RgpOLMPQJ4ULMQCHVj5fZfhi3zOAlr+hKUJqQ9YV0ucUcjAibNkNWXk3IHc8fFgw75T
         wiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gg4c48ZYZPukYukeYH1FstEudWtK8wPAR7/53fvdhno=;
        b=OzLXbHpGw3Bq4+RHFLmyiGXu2wc39b1KOM70bAe0Vv9BKcfcIy+GSnqn9BrT2wpUr+
         AtfmV+D0y2feg0YH/Ka92Bh3CRbOPIxkrjte4BSVoDE8kvxpWd3QMy1lGqlZD4VLl21+
         nwqmdNClXJVnHIGd56eVJu5OS1J0bcQYBESeFMjvzMPDL7Z1hhtohhFqr50EUYpkdUtr
         WmD1c+IwjVFUBr4q2ZHfBo6F+1t3fIAOteIUnF/CJyvC8vXkHdwNzgRHMaDopaX0uqSJ
         jJwtmbg8VL+UfpLhL8v5hgvpAw3kH0PtvzDS6Bbh3JczMI0x8V0MWUoJRqGAAtphdKz6
         swdg==
X-Gm-Message-State: AOAM533A8PGt0DoC7+oxZTvjEfaUxSpZLn5nR7XTiw9YJ8+LsrllgdaX
	4n7SU7gb+qjHWAc8clyfjgoqeoEc9H4iGCl/6ok=
X-Google-Smtp-Source: ABdhPJyeT1B0CLdWjHQOCRzFRWbjszpFNzUNvIspBbNTD5Lr6W9Nwf1/b2czD8OdTUP2i/00+WzLsg/JQp5bDIFvKZA=
X-Received: by 2002:adf:8023:: with SMTP id 32mr11625586wrk.247.1589660654780;
 Sat, 16 May 2020 13:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200514210458.33543-1-JPEWhacker@gmail.com> <20200515185354.GE11927@denix.org>
 <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <CAGDS+n=_mqZeLFusTNV6s7EKNBDVdM589wAmcJ5qQH2BMn=MLw@mail.gmail.com>
 <20200516174702.GA22042@localhost> <c18319417f2146939146bfac448c258c@XBOX03.axis.com>
 <20200516200957.GA8056@localhost>
In-Reply-To: <20200516200957.GA8056@localhost>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Sat, 16 May 2020 22:24:04 +0200
Message-ID: <CAHtQpK4AH08zQ6dx1OWjCR6WwAmrLHNZuz0O1O9WqUnBHNk2Pg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
To: Adrian Bunk <bunk@stusta.de>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Steve Sakoman <sakoman@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Denys Dmytriyenko <denis@denix.org>, 
	Joshua Watt <jpewhacker@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"jdmason@kudzu.us" <jdmason@kudzu.us>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, May 16, 2020 at 10:10 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Sat, May 16, 2020 at 07:54:32PM +0000, Peter Kjellerstedt wrote:
> > >
> > > meta-openembedded/meta-python has a higher layer priority than OE-core.
> > >
> > > Adding higher upstream versions of these recipes to a lower-priority
> > > layer in a stable series is a potential source for weird problems.
> >
> > I would assume they'd be removed from meta-python at the same time
> > they are added to meta.
>
> "at the same time" is complicated since OE-core has releases,
> but meta-openembedded is just a branch.
>
> I would also assume that not all users of stable series are updating
> meta-openembedded to the latest on the dunfell branch at the same
> time as OE-core, some users might end up updating one but never
> updating the other one.

That I believe would be a terrible mistake when people opt-in to take
a layer, but never care about updating it... :(

On the contrary, a quick run of "bitbake-layers show-overlayed"
exhibits the following on the [master] of both OE-Core and
meta-openembedded:
=================
python3-cython:
  meta-python          0.29.14
  meta                 0.29.16
python3-dbusmock:
  meta-python          0.16.7
  meta                 0.19
python3-docutils:
  meta-python          0.15.2
  meta                 0.16
python3-pyparsing:
  meta-python          2.4.6
  meta                 2.4.7
=================

Judging be versions, it looks like OE-Core recipes are maintained, but
in meta-openembedded they are left on the side...

>
> > //Peter
>
> cu
> Adrian
> 



-- 
Regards,
Andrey.
