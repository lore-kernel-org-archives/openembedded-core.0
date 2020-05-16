Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web12.14466.1589670917667526935
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 May 2020 16:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Djynrr7Q;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id l15so1549878vsr.3
        for <openembedded-core@lists.openembedded.org>; Sat, 16 May 2020 16:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SavTU1S7/xkJerFdqfGDzZdoMdTBnnXP20hdJ30zcCU=;
        b=Djynrr7QfS3v5KmsHgap7+1B30NMUZt6GTKAtKNvLFpzQff9tN1zYfCO6H/ffJjpEK
         r3/8aL6fMav9Co5vj8C4fre9PfSoJRrjuO8/aLL21sLoD+B+zYG1eWXTsszXgNqAIanW
         DKpNe6tyZeE0iLF2x3KGozwDZf1OOpKjRxaMSgHLer8ZGSzYIPHGsO/JlM6X9t/QF/wO
         09WuG/7ntY64BISqz8SgDkLuphLeCLzXxTHdgkZWgTkUmTp3rbAtY11d3Os0bPzvMK98
         y+yZ4qVclCdLrHjrraXjLSozDEVPltqfyTAg3H5F1VU2wst3B3yGa0LKuIkPA4r/5/+P
         4eQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SavTU1S7/xkJerFdqfGDzZdoMdTBnnXP20hdJ30zcCU=;
        b=Dy8qtVUiyMThcQM+UxKvYLTS++na0fFwaGnweM8LwXUCA2GxuaqUd1quI/Ec39TQ/3
         1rWD9n3d4T6jWseTO/PlFw5afsEP9dNX9U7WS11DGLI0PMIwyn8gWmGuDchKZkNCwLVJ
         D9tDC5qjiohbLTy7hKg93N9c9DJZYSmn/Fgkp9xbKpVw6UwQVCRuj6XbnyIHLrhiPX7p
         IiqHlPkEkaQl9ONwAoueU12KLfWbXe1AneLvByufg1W+JG6d79VmBGxlxE/FUV2Ewr2I
         FeRxjVOFPM6WkgpVnOYifsqDeJRtWoJRdHxY8D5HGje2nufZg+Rexlg8DQeRjvx5q0y3
         b12g==
X-Gm-Message-State: AOAM531thBaja0KQApj4jdcQbfljB2uHTbgmfG4S1JaY8EsC8lWw3Rno
	7tlBLFyOVxaw4etCHgcBgO6RwS6/lKbJ5/vM2y0=
X-Google-Smtp-Source: ABdhPJxwh++lOCAxOMjzTYxnED930puiknqhP9ToBdCcCdeNynyCrLmJ4nlYaV9GwQes/laBVvEKionRlV3zKUvNdBU=
X-Received: by 2002:a67:f356:: with SMTP id p22mr3000031vsm.130.1589670916765;
 Sat, 16 May 2020 16:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200514210458.33543-1-JPEWhacker@gmail.com> <20200515185354.GE11927@denix.org>
 <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <CAGDS+n=_mqZeLFusTNV6s7EKNBDVdM589wAmcJ5qQH2BMn=MLw@mail.gmail.com>
 <20200516174702.GA22042@localhost> <c18319417f2146939146bfac448c258c@XBOX03.axis.com>
 <20200516200957.GA8056@localhost> <CAHtQpK4AH08zQ6dx1OWjCR6WwAmrLHNZuz0O1O9WqUnBHNk2Pg@mail.gmail.com>
In-Reply-To: <CAHtQpK4AH08zQ6dx1OWjCR6WwAmrLHNZuz0O1O9WqUnBHNk2Pg@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Sat, 16 May 2020 16:15:07 -0700
Message-ID: <CAJ86T=XTdV+n+1g5TA43QeOwOkDSG_=Pjx6yBJFmWKPXQpCf6w@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	Steve Sakoman <sakoman@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Denys Dmytriyenko <denis@denix.org>, Joshua Watt <jpewhacker@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"jdmason@kudzu.us" <jdmason@kudzu.us>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, May 16, 2020 at 1:24 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> On Sat, May 16, 2020 at 10:10 PM Adrian Bunk <bunk@stusta.de> wrote:
> > On Sat, May 16, 2020 at 07:54:32PM +0000, Peter Kjellerstedt wrote:
> > > >
> > > > meta-openembedded/meta-python has a higher layer priority than OE-core.
> > > >
> > > > Adding higher upstream versions of these recipes to a lower-priority
> > > > layer in a stable series is a potential source for weird problems.
> > >
> > > I would assume they'd be removed from meta-python at the same time
> > > they are added to meta.
> >
> > "at the same time" is complicated since OE-core has releases,
> > but meta-openembedded is just a branch.
> >
> > I would also assume that not all users of stable series are updating
> > meta-openembedded to the latest on the dunfell branch at the same
> > time as OE-core, some users might end up updating one but never
> > updating the other one.
>
> That I believe would be a terrible mistake when people opt-in to take
> a layer, but never care about updating it... :(
>
> On the contrary, a quick run of "bitbake-layers show-overlayed"
> exhibits the following on the [master] of both OE-Core and
> meta-openembedded:
> =================
> python3-cython:
>   meta-python          0.29.14
>   meta                 0.29.16
> python3-dbusmock:
>   meta-python          0.16.7
>   meta                 0.19
> python3-docutils:
>   meta-python          0.15.2
>   meta                 0.16
> python3-pyparsing:
>   meta-python          2.4.6
>   meta                 2.4.7
> =================
>
> Judging be versions, it looks like OE-Core recipes are maintained, but
> in meta-openembedded they are left on the side...

Right, and that's the problem. Anyone using meta-python will continue
to use the older recipes and not see the updates (since meta-python is
a higher priority layer than oe-core).

The right way to have done this would have been to update the recipes
in meta-python before merging to oe-core, not merging to oe-core and
then immediately updating them there.
