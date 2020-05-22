Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web11.79.1590186838543129186
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 15:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YvACLyOU;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id 36so4301955uaf.9
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 15:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TpI1TOGkTefT9ZOgIqbT6Exe35xnsJpCu5DJl28q2p4=;
        b=YvACLyOUFbHdigBGrAbl35/rMuk0ENFAPZGETxvcsy8cE3CFlB8DcJpPBdlIQYA98s
         hq9awBOJXurh9bdbSJd3yS7p6SNiZ497dHCahTqqnWSssIGtPsnHfQF8FtadXyUs0IM1
         qb7Zom170AYmNvASXInwu7WxiJ+WJj2C/ZivhYcdDZfoFiBA4aJq2meQGCRP6oC9Xyi4
         BCK+z1Fzxc5EknH8nkw4TgNPu6kLRbg2NW+NCteTm9OovHDpjJTwfU1oqNJMqlkrDA/U
         FYus11rLMAK3A0CPEoa2GMMhDiEWhY2UtzMSngoPqQpfL5WIfwot1g6u7MwnAqA7ZtmX
         5Uvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TpI1TOGkTefT9ZOgIqbT6Exe35xnsJpCu5DJl28q2p4=;
        b=Y2p88KnBeqa9FgreueX7oxEuox87sIYwWgFXFmAAOWCFZ2C6VnnJt/TGlMh3zH31Qx
         rm0bEZuWSXcEdYTarU0iwn3x5aOtwRlmkmivHVoYwyizvorJwtPtNU8N1RVGk4eL9j5Y
         7sxFlxToEkymmjxYawUIeeQMw2tNn+17GstPKGoILyCupGKrydNmeN8orgQ+IjDxgSg2
         p1rqcelaqebbsMvD9FVO75scq/6IS3sjbTu7bTWPPyVopJSAab5O3TBvQV+enEvJ2Y/d
         5XByKWl6V54Jb3RWiu5BZ3JYND4ZccGRSqL4PzOMQtsG1fRXDaELPcIs1psVYtNE7DkY
         5CYg==
X-Gm-Message-State: AOAM5330oizUXYl8YpNSWIhNYvI/mbHibwF8+5JWeCM0D48zZFmAoe79
	R5BeN55s17xqqFA6pTNiCZllRdvY6E5pGbwvgBY=
X-Google-Smtp-Source: ABdhPJzGHWX4tGi5u0GrkuEP38jA5nSui47Y/YGRbGG2GGegLq/0cm+XCbEsV1FcTlOVjLPUNMeSzOTyXOBE7/AJIZU=
X-Received: by 2002:a9f:2823:: with SMTP id c32mr10508877uac.99.1590186837398;
 Fri, 22 May 2020 15:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <Lixb.1590180524317566740.JvZm@lists.openembedded.org> <CAP9ODKqnn7y=Mr+CTsnPyp2of3h=-r_3Rh5oeVeD_SPu7FQT5g@mail.gmail.com>
In-Reply-To: <CAP9ODKqnn7y=Mr+CTsnPyp2of3h=-r_3Rh5oeVeD_SPu7FQT5g@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 22 May 2020 15:33:45 -0700
Message-ID: <CAJ86T=VDtvME1EVBfVOBW5U+84dkpD03ksHJdik15CSOG84Xgg@mail.gmail.com>
Subject: Re: [OE-core] gtest and gmock not added to SDK
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Tom Hochstein <tom.hochstein@nxp.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 22, 2020 at 2:29 PM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> On Fri, May 22, 2020 at 5:48 PM Tom Hochstein <tom.hochstein@nxp.com> wrote:
> > The gtest and gmock packages provided by googletest are not added to the SDK by default. I assume it is because the googletest main package is empty?

Are you including googletest in the image used to create the SDK or
gmock and gtest?

It looks like gmock and gtest are only mentioned in the googletest
recipe as PROVIDES, so they are aliases for build time dependencies
only. For run time dependencies you should use googletest.

> > I added an RDEPENDS_${PN} from the dependent package to fix it. Is there a better solution?
>
> You can change the packages to have their `-dev` to rdepends on
> `gtest/gmock-dev` for example.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
> 
