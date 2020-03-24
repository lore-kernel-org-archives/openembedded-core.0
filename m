Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.3119.1585075547753687504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 11:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UsxncuSd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id m3so4770010wmi.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 11:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Z1zAJDGxPnU+Ob6p4P1NKETh6ceqjii3fCfjg6N1Wek=;
        b=UsxncuSdtcK/zLTowG5Bd1CugxW3D0EVH3MgejEYnN01PfPNXKJykjAGw9+84xslhf
         eM/v9GwC5BQu53bFukWwpb2QmevEe1AVA8Q1aZWF5mDcYLyFRxPVpbIxUK5hm1kJqNhq
         vSr13vPchSysfagBXaLxBTxDxlPYQgke9CIwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Z1zAJDGxPnU+Ob6p4P1NKETh6ceqjii3fCfjg6N1Wek=;
        b=Uo/2VfuV42+rdiZJ/uqqYN4LXPESbAx4vSTpmY7tq+4pu197dATiAKzi64xlEd/UvS
         K+eObJwkDsY0ytL8J07Pv1AOFmnasf/vt0grSZdd4T/h4HyNl+uff997wbGpK2F4ZFTu
         ++NXcpX4+6GALHC49A5aLIvqhK6cWKrphbJgK1pOEJEHmNtKDD6hQ2f9e3krhpsG7o1i
         U1KyvbgBcU2peKuK8R2UxRxDYbBxYWehgABxJFlvON69XRibpw4YsVB8h/6rHE+Dql2T
         7icrBCnlnOSFwZR/YbVgWYEpyrwT6mTPuBsx+Viml5ZKAdCHPk1Db0Q2glyEPGedx9e+
         wFgw==
X-Gm-Message-State: ANhLgQ2q4Pg5T+ayTHygax0mTRmNMwSP9hQ7aYTHkm66j3gCTMUJ95iL
	kgJ5ylJ6L3UTIT4+Nwr4CqUsRg==
X-Google-Smtp-Source: ADFU+vtrLSqkTos8AhQNuricTvhtJb2w3v/6dx0oQ3xaZobGhOtRl0JWVA7XqZO15f0U05+0gyIyxg==
X-Received: by 2002:a05:600c:2111:: with SMTP id u17mr7130569wml.158.1585075546127;
        Tue, 24 Mar 2020 11:45:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id r18sm30336786wro.13.2020.03.24.11.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 11:45:44 -0700 (PDT)
Message-ID: <d06c85c99d491e1a023fd3d858e34b428d40912b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] gstreamer1.0-plugins-good: add qt5 PACKAGECONFIG
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Anuj Mittal <anuj.mittal@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 24 Mar 2020 18:45:43 +0000
In-Reply-To: <20200324183319.GY1578@denix.org>
References: <1582252918-89191-1-git-send-email-anuj.mittal@intel.com>
	 <1582252918-89191-2-git-send-email-anuj.mittal@intel.com>
	 <20200324175821.GW1578@denix.org>
	 <19b30b569a31c0068d5c3b46e1f83178942ecc8e.camel@linuxfoundation.org>
	 <20200324181234.GX1578@denix.org>
	 <355e8218d0ac4611df2ad2ed0c199149c1dd1465.camel@linuxfoundation.org>
	 <20200324183319.GY1578@denix.org>
User-Agent: Evolution 3.35.92-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-03-24 at 14:33 -0400, Denys Dmytriyenko wrote:
> On Tue, Mar 24, 2020 at 06:15:51PM +0000, Richard Purdie wrote:
> > On Tue, 2020-03-24 at 14:12 -0400, Denys Dmytriyenko wrote:
> > > On Tue, Mar 24, 2020 at 06:07:44PM +0000, Richard Purdie wrote:
> > > > On Tue, 2020-03-24 at 13:58 -0400, Denys Dmytriyenko wrote:
> > > > > On Fri, Feb 21, 2020 at 10:41:58AM +0800, Anuj Mittal wrote:
> > > > > > Instead of disabling unconditionally, add PACKAGECONFIG for
> > > > > > qt5. Imported from meta-qt5 layer.
> > > > > > 
> > > > > > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > > > > > ---
> > > > > >  .../gstreamer/gstreamer1.0-plugins-
> > > > > > good_1.16.2.bb                  | 7 +------
> > > > > >  1 file changed, 1 insertion(+), 6 deletions(-)
> > > > > > 
> > > > > > diff --git a/meta/recipes-
> > > > > > multimedia/gstreamer/gstreamer1.0-
> > > > > > plugins-good_1.16.2.bb b/meta/recipes-
> > > > > > multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
> > > > > > index f3e0cee..8b34111 100644
> > > > > > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> > > > > > plugins-
> > > > > > good_1.16.2.bb
> > > > > > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> > > > > > plugins-
> > > > > > good_1.16.2.bb
> > > > > > @@ -42,6 +42,7 @@ PACKAGECONFIG[libpng]     = "-
> > > > > > Dpng=enabled,-
> > > > > > Dpng=disabled,libpng"
> > > > > >  PACKAGECONFIG[libv4l2]    = "-Dv4l2-libv4l2=enabled,-
> > > > > > Dv4l2-
> > > > > > libv4l2=disabled,v4l-utils"
> > > > > >  PACKAGECONFIG[mpg123]     = "-Dmpg123=enabled,-
> > > > > > Dmpg123=disabled,mpg123"
> > > > > >  PACKAGECONFIG[pulseaudio] = "-Dpulse=enabled,-
> > > > > > Dpulse=disabled,pulseaudio"
> > > > > > +PACKAGECONFIG[qt5]        = "-Dqt5=enabled,-
> > > > > > Dqt5=disabled,qtbase
> > > > > > qtdeclarative qtbase-native"
> > > > > 
> > > > > Does it make oe-core depend on meta-qt5 layer?
> > > > > 
> > > > > What is the policy here for having inter-layer dependencies
> > > > > in
> > > > > DEPENDS vs. PACKAGECONFIG without explicitly listing them in
> > > > > LAYERDEPENDS?
> > > > 
> > > > We have a clear policy that listing such options is ok as long
> > > > as
> > > > its
> > > > not enabled by default.
> > > 
> > > Richard,
> > > 
> > > This is good, thank you for confirming. Do you have a link where
> > > this
> > > is clearly explained? Thanks again.
> > 
> > Its come up many times over the years and we've been consistent
> > about
> > it. I don't have a link but there has been mailing list discussion
> > and
> > perhaps TSC discussion long ago, I simply don't remember. There are
> > many examples of that in OE-Core.
> > 
> > The alternative is forcing more into bbappends which doesn't seem
> > to
> > gain anything (PACKAGECONFIG itself could be changed from distro
> > config
> > for example).
> > 
> > Its also easy to catch bad defaults since the recipes would no
> > longer
> > parse due to missing dependencies which we'd quickly spot.
> 
> Yes, yes, I understanf all that from a technical perspective and
> agree with it, but I was thinking about a more clear definition of
> this policy to be able to point anyone having such questions in the
> future...

Sure, that sounds great. This doesn't happen without someone doing it
though.

I have not looked at the wiki to see if we did already document it. I
guess you already searched there before asking the question. If we
don't have a policy documented, you can edit the wiki and add something
?

Cheers,

Richard

