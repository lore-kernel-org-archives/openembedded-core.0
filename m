Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2062.1585073557892489113
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 11:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3C52140BCC;
	Tue, 24 Mar 2020 18:12:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id byVkBpco2kmJ; Tue, 24 Mar 2020 18:12:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 029DC40BAC;
	Tue, 24 Mar 2020 18:12:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A11B01718E9; Tue, 24 Mar 2020 14:12:34 -0400 (EDT)
Date: Tue, 24 Mar 2020 14:12:34 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] gstreamer1.0-plugins-good: add qt5 PACKAGECONFIG
Message-ID: <20200324181234.GX1578@denix.org>
References: <1582252918-89191-1-git-send-email-anuj.mittal@intel.com>
 <1582252918-89191-2-git-send-email-anuj.mittal@intel.com>
 <20200324175821.GW1578@denix.org>
 <19b30b569a31c0068d5c3b46e1f83178942ecc8e.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <19b30b569a31c0068d5c3b46e1f83178942ecc8e.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 24, 2020 at 06:07:44PM +0000, Richard Purdie wrote:
> On Tue, 2020-03-24 at 13:58 -0400, Denys Dmytriyenko wrote:
> > On Fri, Feb 21, 2020 at 10:41:58AM +0800, Anuj Mittal wrote:
> > > Instead of disabling unconditionally, add PACKAGECONFIG for
> > > qt5. Imported from meta-qt5 layer.
> > > 
> > > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > > ---
> > >  .../gstreamer/gstreamer1.0-plugins-
> > > good_1.16.2.bb                  | 7 +------
> > >  1 file changed, 1 insertion(+), 6 deletions(-)
> > > 
> > > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> > > plugins-good_1.16.2.bb b/meta/recipes-
> > > multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
> > > index f3e0cee..8b34111 100644
> > > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> > > good_1.16.2.bb
> > > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> > > good_1.16.2.bb
> > > @@ -42,6 +42,7 @@ PACKAGECONFIG[libpng]     = "-Dpng=enabled,-
> > > Dpng=disabled,libpng"
> > >  PACKAGECONFIG[libv4l2]    = "-Dv4l2-libv4l2=enabled,-Dv4l2-
> > > libv4l2=disabled,v4l-utils"
> > >  PACKAGECONFIG[mpg123]     = "-Dmpg123=enabled,-
> > > Dmpg123=disabled,mpg123"
> > >  PACKAGECONFIG[pulseaudio] = "-Dpulse=enabled,-
> > > Dpulse=disabled,pulseaudio"
> > > +PACKAGECONFIG[qt5]        = "-Dqt5=enabled,-Dqt5=disabled,qtbase
> > > qtdeclarative qtbase-native"
> > 
> > Does it make oe-core depend on meta-qt5 layer?
> > 
> > What is the policy here for having inter-layer dependencies in
> > DEPENDS vs. PACKAGECONFIG without explicitly listing them in
> > LAYERDEPENDS?
> 
> We have a clear policy that listing such options is ok as long as its
> not enabled by default.

Richard,

This is good, thank you for confirming. Do you have a link where this is 
clearly explained? Thanks again.

-- 
Denys
