Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web12.6112.1595367937972770468
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2020 14:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B4KT49zm;
 spf=pass (domain: gmail.com, ip: 209.85.221.177, mailfrom: armccurdy@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id m21so97558vkp.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2020 14:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z5eqPn+A7BAvo1OC2IVw+FggftyAunJIHLbdZO6Wt90=;
        b=B4KT49zm7xzPJYw110p2RvDl+9KZeqcwHymX9/IGfMzuJzSZnadKclLRHBqfzeR5/d
         RENaIYskJ/nT4AXHoI9eF+xtWxp/7KN/uJ+rXriSQ+33zUj4VA0XRVwQBCrzdKJWUuWt
         z7d7EIQEQq1ftbR8ZVpgdzrR253Y6iix7P+PF0ZeEGWg9HRs/Rq7tmAnG6mDmkbMQYg1
         4H3/vs1w/vuEH9x24+N7wA4II0b6vuNKai7A5auibF1+IKl6AZyfjrHAy8MTba+DVuWp
         A8F0tWss2yjW7zbbHf7p87hYHDQP7WpEpdplPmAeA6q56nu7PVNsAEfOAdiHX8cVAqRt
         VmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z5eqPn+A7BAvo1OC2IVw+FggftyAunJIHLbdZO6Wt90=;
        b=RDg4BqD8TcDbf3yKXBblJr1tgZzGIUl2QzMEXTgr4r8MIkXx7ecbDGHu/PgI9MvXGa
         /BeAMATdunMdj/dtMy3uUtzAMLIFnph6cyvMOX9L92b2dCdYjdo0ujtKa18jhO1CvxtA
         NPJJDF9EuvUECZZf2971ON2+f0+7Vx+VUlKqGS3um2TvAO4euri67ucvUjvg4uznJoqw
         Q2dGh7DLPMMxEp0YEWI/3sl6vjP4aArnSA4M6JSUneS1He4J0W1zwy1eE3SDyMwjqL0Q
         vS2jA2Y+USIURpDnVWva3szkiMd0cQ1Ir+tXi6kTUgFmwTLcmMxcTU7o6fguaovQRFK5
         p6AA==
X-Gm-Message-State: AOAM532wpVtk/GHuK/s5J4glw0K67aa12ahj3u4V7Mw6K03mCKX9B7NN
	GGipfFfmvtTTAFnc63HxsRuKfNvboFgoyYJY38c=
X-Google-Smtp-Source: ABdhPJz89n9lB58ZU4zvfxDK2mE+ow/KyuwTN5Xt8nwEKgSmTlly7OMflo/bldup5VeqcIlaYQf8c8RG9LczxDZZ4l0=
X-Received: by 2002:a05:6122:12a8:: with SMTP id j8mr22020177vkp.43.1595367937005;
 Tue, 21 Jul 2020 14:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200721172650.Horde.Ywym1orCr19y5sktKiavBRT@crashcourse.ca>
In-Reply-To: <20200721172650.Horde.Ywym1orCr19y5sktKiavBRT@crashcourse.ca>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 21 Jul 2020 14:45:26 -0700
Message-ID: <CAJ86T=VS67is5ESg+L8X-UOjFRMsmxSo84mLS99tgNm9jKA1Mw@mail.gmail.com>
Subject: Re: [OE-core] "DEPENDS =" versus "DEPENDS +=" in recipe files
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 21, 2020 at 2:26 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> pursuant to cleaning up some docs and tweaking the style guide,
> i just want to clarify that the *proper* assignment to DEPENDS
> in recipe files is:
>
>    DEPENDS = "..."
>
> unless (of course) that assignment is preceded by a "require"
> of a .inc file that assigns to that variable, whereupon the "+="
> would make sense.
>
>    other than that, though, can i assume there is no rationale
> for "DEPENDS += ..." in terms of coding style? (being a minimalist,
> i hate extraneous operators.)

Wasn't the same question asked recently about PROVIDES? I think the
ruling there was that += is the "proper" assignment. Is there a
rationale for treating them differently?
