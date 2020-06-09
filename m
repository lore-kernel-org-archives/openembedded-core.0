Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1433.1591739458825188253
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 14:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 348FF40C21;
	Tue,  9 Jun 2020 21:50:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5TpVM9fp87Vs; Tue,  9 Jun 2020 21:50:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0F01140A35;
	Tue,  9 Jun 2020 21:50:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2441F17320C; Tue,  9 Jun 2020 17:50:55 -0400 (EDT)
Date: Tue, 9 Jun 2020 17:50:55 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Yu, Mingli" <mingli.yu@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] virglrenderer: correct REQUIRED_DISTRO_FEATURES
Message-ID: <20200609215055.GV17660@denix.org>
References: <20200609071549.350578-1-mingli.yu@windriver.com>
 <CANNYZj9AZ7HS2ufOhWbEpDknD87Bp84nQNVe1kGBFdBffRP_tg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj9AZ7HS2ufOhWbEpDknD87Bp84nQNVe1kGBFdBffRP_tg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

+1

The commit message should explain "why" and not "what", as "what" can be 
easily understood from the code itself.

Sometimes "why" is obvious - e.g. version update of CVE fix, but in many cases 
it's not at all clear why do you want everyone to be affected by your change.

PS. https://xkcd.com/1296/

-- 
Denys


On Tue, Jun 09, 2020 at 09:40:42AM +0200, Alexander Kanavin wrote:
> Please explain why?
> 
> Alex
> 
> On Tue 9. Jun 2020 at 9.17, Yu, Mingli <mingli.yu@windriver.com> wrote:
> 
> > From: Mingli Yu <mingli.yu@windriver.com>
> >
> > Add opengl to REQUIRED_DISTRO_FEATURES only for target build.
> >
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >  meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> > b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> > index 29b12628d0..d97f0e78f1 100644
> > --- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> > +++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> > @@ -21,4 +21,4 @@ inherit meson pkgconfig features_check
> >
> >  BBCLASSEXTEND = "native nativesdk"
> >
> > -REQUIRED_DISTRO_FEATURES = "opengl"
> > +REQUIRED_DISTRO_FEATURES_class-target = "opengl"
> > --
> > 2.24.1
> >
> > 
> >

> 

