Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2236EC433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 01:52:47 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.5806.1639014765987820745
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 17:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nTJvUEQ1;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id a11so3738369qkh.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 17:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=10OMActmvQkdOJyt2kJmpixL10u1vQAs51ZaP9zQ4W0=;
        b=nTJvUEQ1/Jwbfc6SPUKAeCBncN5kAfnA/VdHoKmbMoWJTpLFa6Pu0ySmv5OL8X3hoi
         f0hRLqthOZJ62dOTwIPJiIV0kziMkXfRV4djgyAKeEnxgqUwhaEPeyRMtwYSYtHi8tpv
         QAH62hz0LpKkgjDeZ5sZdjYyHdog7+GLo4V6cKJ6ECYAtWnIQXuFXbnFh4KHBnoJj9Ws
         RRGGdV2+L6WfFRRYG5IYfOMwc5rNXY5FMXUzeE32xKw5R9znZAwVBofrDl5Qifrsx6G1
         2QlBAqYjsJDQBZ/LMx7hZKRycks3HcFHwz9dzkrObXZPUwnSQjKahlS4G791k14mFaZs
         taew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=10OMActmvQkdOJyt2kJmpixL10u1vQAs51ZaP9zQ4W0=;
        b=8BI33KpY9QE9XqtwGaFOl7Yq+BEa4VDL9lvortQGGmkGCbBB5RgAAUgWUp8OzH1b1Y
         zs7S2MwvkIWw0iJ+C2MWHCNOyWF7yXm4NTRoJtHsJiDsrwYcH61jocP8P1WLZLOHe9CV
         4D84JZb3eCsSIxOaSb+L7YRBTguGGdAGNqGDLqRPr5457b88wWP01psnEsWH2mBHmQ0Q
         gggx9SiInpaymg88q6pszl+bXbughkR0M4l+ZbXzpxtgDbM/1yj3appbK0oRMM+gqeko
         KxNTQU+69u+tiq5QJqr7zWaJ9g7qPQ1aKI3xfItgbK1yrAhHJ0MkfRcJ2hXqEV24CIYy
         eiIA==
X-Gm-Message-State: AOAM532l7NwNZbY9uRzYugZwsnTnJaUn+Huq32FJS/RISRXCZqW+S+0G
	eEScPXgzbVyE6QrkG1WAmaWV8+blft1zixI/C58=
X-Google-Smtp-Source: 
 ABdhPJzFqZxF5reb0nzghzGnb3ER/thhXo5saKvl2rU1xXXTGzw6dWspMzCnBNxD74V0eFzde+2kOtNXcgJTg2YltNI=
X-Received: by 2002:a37:747:: with SMTP id 68mr10859455qkh.227.1639014764968;
 Wed, 08 Dec 2021 17:52:44 -0800 (PST)
MIME-Version: 1.0
References: <1638804078-8183-1-git-send-email-wangmy@fujitsu.com>
 <f206d7acc80b1d4f4425898539f06b33dfd091b8.camel@linuxfoundation.org>
 <OSBPR01MB18453CFB47B0AD1D05F85635DC709@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSBPR01MB18453CFB47B0AD1D05F85635DC709@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Dec 2021 17:52:18 -0800
Message-ID: 
 <CAMKF1sr08pvVT=fVrdivghTWO_k4aKggX6P4nQR0-y4yr1bWUw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pango: upgrade 1.48.10 -> 1.50.0
To: wangmy <wangmy@fujitsu.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 01:52:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159436

On Wed, Dec 8, 2021 at 5:30 PM wangmy <wangmy@fujitsu.com> wrote:
>
> After specifying DEFAULTTUNE =3D 'x86-64-x32', the pango needs to use pat=
ch to modify the code.
> I added this line to the bb file:
> SRC_URI:tune-x86-64-x32 =3D "file://0001-modify.patch"
> But it did not work.
> How should I write it to apply patch when specifying x86-64-x32?

SRC_URI:append:x86-x32 =3D " file://your.patch"

>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> Development Dept.I
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road, N=
anjing, 210012, China
> TEL: +86+25-86630566-8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> http://www.fujitsu.com/cn/fnst/
>
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: Tuesday, December 7, 2021 9:37 PM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>;
> > openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] pango: upgrade 1.48.10 -> 1.50.0
> >
> > On Mon, 2021-12-06 at 23:21 +0800, wangmy wrote:
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  .../pango/{pango_1.48.10.bb =3D> pango_1.50.0.bb}                 |
> > 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)  rename
> > > meta/recipes-graphics/pango/{pango_1.48.10.bb =3D> pango_1.50.0.bb}
> > > (94%)
> > >
> > > diff --git a/meta/recipes-graphics/pango/pango_1.48.10.bb
> > > b/meta/recipes-graphics/pango/pango_1.50.0.bb
> > > similarity index 94%
> > > rename from meta/recipes-graphics/pango/pango_1.48.10.bb
> > > rename to meta/recipes-graphics/pango/pango_1.50.0.bb
> > > index 40df7042e6..db17158d20 100644
> > > --- a/meta/recipes-graphics/pango/pango_1.48.10.bb
> > > +++ b/meta/recipes-graphics/pango/pango_1.50.0.bb
> > > @@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG =3D "disabled"
> > >
> > >  SRC_URI +=3D "file://run-ptest"
> > >
> > > -SRC_URI[archive.sha256sum] =3D
> > "21e1f5798bcdfda75eabc4280514b0896ab56f656d4e7e66030b9a2535ecdc
> > 98"
> > > +SRC_URI[archive.sha256sum] =3D
> > "dba8b62ddf86e10f73f93c3d2256b73238b2bcaf87037ca229b40bdc040eb3f
> > 3"
> > >
> > >  DEPENDS =3D "glib-2.0 glib-2.0-native fontconfig freetype virtual/li=
biconv
> > cairo harfbuzz fribidi"
> > >
> >
> > Seems to break x32 unfortunately:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/4403
> >
> > Cheers,
> >
> > Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159434): https://lists.openembedded.org/g/openembedde=
d-core/message/159434
> Mute This Topic: https://lists.openembedded.org/mt/87541909/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

