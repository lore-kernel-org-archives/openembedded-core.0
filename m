Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.41763.1591030287971218095
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 09:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=IglyNI3v;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.66, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f66.google.com with SMTP id w7so4113351edt.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 09:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dkZsXU/VX9rNADg4NgBbsC9WYtQFN1XTbldzIslpCgU=;
        b=IglyNI3vXHhpuxQ4v5yrXPiVxXKZr3sD7dU/yOYMCWWzSoO/aOuAiWi8Uis8FKZKVu
         0kcyYRB8d/d80kPRE21rz8G+hbvkTQTHn0ZzHKWq5zq3YVjySKZ0zQFnK5CASIlkVwNa
         TlBVN4Q4Hh2YmZ1oNqspmfKejwJJDYrPfZKJwtXA8BvstZwEgicEL+g2Mks7BIjxl6Cw
         fNqwU1StWIvlRWH75okA7uWIT/ScdBX7/de88X7+cFb76olBPXRaphOU8TF9Qxc7fD3l
         /saHuNzQEbFztj0jRMO3R8yq746YrTvUGDi33qebDTvws0GiFuA3LDiHwFOB3fM+YXE3
         vrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dkZsXU/VX9rNADg4NgBbsC9WYtQFN1XTbldzIslpCgU=;
        b=S/dddjruhM4tzSLVZi0+YZW4Bcoy/fnCOv3uPMRL50X0uFYZDhGekt+jMLLOWOyfw+
         i2azusc76jIKlhio7BddQHowi5q4W4U9jAoTeWAZXClhFBWAK6Gm0OidyW2mHRQy/G+g
         50xQ+D+YA3+wuO8POh5h2rOuJzPfzPA1yNWt73bATU0PBtA6WR6lKZl0gdLt2zl4WsSP
         j1+l4+/iJwHWt9HDfnJYkHrfM0Tpy4rhRRr3WgGdTdRLFiSElBha8e499t+Q0vaK2Fmy
         RxMYrEqFnS0XlSA3AJLeSr1wKAnNjSrac87+sohxwaT4zbDthGexXn8C3yf1ShRsLg7Z
         xxQQ==
X-Gm-Message-State: AOAM533tON19Zf5vOlAYodYQCmgbuHgd/UjEOwIs/aR9IpfW2F0kulcO
	rNde2vxIk2k/9xrle6Sak1bxxDGFb26kSJLBD4aVSg==
X-Google-Smtp-Source: ABdhPJwC2mFeFOsAtNwLADujQzY8KmCBaldsfejxfJUdAVTuC/us9zE4lC0Ik7/9Ijx+be4MrwdfKzR9PQZeZrJLMEw=
X-Received: by 2002:a50:fc0d:: with SMTP id i13mr20714160edr.260.1591030286319;
 Mon, 01 Jun 2020 09:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1591020366.git.steve@sakoman.com> <afb301af1cc21c69d6f26f47202d399228406390.1591020366.git.steve@sakoman.com>
 <234ca3dfe01ffa0108e1ee9bc73934ce5fd45141.camel@linuxfoundation.org>
In-Reply-To: <234ca3dfe01ffa0108e1ee9bc73934ce5fd45141.camel@linuxfoundation.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 1 Jun 2020 06:51:14 -1000
Message-ID: <CAOSpxdbKZ9o30_5BPiPySJ7_DQ5DWY50YhMaq_mZdQ6zLwuw+Q@mail.gmail.com>
Subject: Re: [OE-core][dunfell 14/16] bitbake.conf: Remove unused DEPLOY_DIR_TOOLS variable
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 1, 2020 at 6:38 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2020-06-01 at 04:11 -1000, Steve Sakoman wrote:
> > From: "Robert P. J. Day" <rpjday@crashcourse.ca>
> >
> > Variable DEPLOY_DIR_TOOLS was introduced in 2007:
> >
> >   commit f751a20152c651a33f08ceda0502fa1d4f11c005
> >   Author: Richard Purdie <richard@openedhand.com>
> >   Date:   Wed Aug 8 21:02:39 2007 +0000
> >
> >       bitbake.conf: Sync with OE.dev
> >
> > apparently never used so get rid of it.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit b1f15f651461d07a8cfbd3bdcfea0e89f195212d)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/conf/bitbake.conf | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index bdade79abe..4acf235930 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -410,7 +410,6 @@ DEPLOY_DIR_IPK = "${DEPLOY_DIR}/ipk"
> >  DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"
> >  DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
> >  DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images/${MACHINE}"
> > -DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
> >
> >  PKGDATA_DIR = "${TMPDIR}/pkgdata/${MACHINE}"
>
> This does cause breakage in meta-oe (single recipe) so probably not
> stable material.

OK, I'll remove this patch from the pull request.

Thanks!

Steve
