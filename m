Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1064.1586717164579864240
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2020 11:46:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DAE3A40C11;
	Sun, 12 Apr 2020 18:46:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ujvdI9VjFkeM; Sun, 12 Apr 2020 18:46:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9C1C3409E7;
	Sun, 12 Apr 2020 18:46:02 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2BD8A1720BE; Sun, 12 Apr 2020 14:46:02 -0400 (EDT)
Date: Sun, 12 Apr 2020 14:46:02 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] gstreamer1.0-plugins-good: add qt5 PACKAGECONFIG
Message-ID: <20200412184602.GD1578@denix.org>
References: <19b30b569a31c0068d5c3b46e1f83178942ecc8e.camel@linuxfoundation.org>
 <20200324181234.GX1578@denix.org>
 <355e8218d0ac4611df2ad2ed0c199149c1dd1465.camel@linuxfoundation.org>
 <15FF5122E920BDAA.24006@lists.openembedded.org>
 <20200324184323.GZ1578@denix.org>
 <467110132be087c26851033a7b9e45972b5c0bd4.camel@linuxfoundation.org>
 <20200324193222.GA1578@denix.org>
 <fe9b411737f87754311de2c607656b8ac74aee86.camel@linuxfoundation.org>
 <20200324221231.GB1578@denix.org>
 <432926cd77d331fd98b7956c2394a447e9e4642c.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <432926cd77d331fd98b7956c2394a447e9e4642c.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 24, 2020 at 10:37:25PM +0000, Richard Purdie wrote:
> On Tue, 2020-03-24 at 18:12 -0400, Denys Dmytriyenko wrote:
> > On Tue, Mar 24, 2020 at 07:57:27PM +0000, Richard Purdie wrote:
> > > On Tue, 2020-03-24 at 15:32 -0400, Denys Dmytriyenko wrote:
> > > > On Tue, Mar 24, 2020 at 07:29:42PM +0000, Richard Purdie wrote:
> > > > > On Tue, 2020-03-24 at 14:43 -0400, Denys Dmytriyenko wrote:
> > All I could find is OE TSC minutes from 7 May 2013 referring to some
> > related 
> > list discussion:
> > 
> > https://lists.openembedded.org/g/tsc/message/369?p=,,,20,0,0,0::Created,,PACKAGECONFIG,20,2,0,72188707
> > 
> > (9:47:21 AM) RP: bluelightning: I think this was to PACKAGECONFIG
> > more recipes
> > (9:47:28 AM) bluelightning: ah ok
> > (9:47:36 AM) RP: bluelightning: remove the need to bbappend, have
> > people set mode config options
> > (9:47:51 AM) bluelightning: and PACKAGECONFIG to enable deps on
> > things
> > outside OE-Core as well presumably
> > (9:48:01 AM) bluelightning: (as discussed on the ml a few weeks ago)
> > (9:48:06 AM) fray: yup
> 
> Well found. There is clearly more context behind that even back then.
> 
> > I spent last couple hours digging through my archives of
> > openembedded-core and 
> > openembedded-devel lists around that time (Spring 2013), but besides
> > general move to enable PACKAGECONFIG in recipes, I didn't see
> > anything specific about crossing layer boundaries by PACKAGECONFIG
> > dependencies, unfortunately. And it was a wild time - all the energy,
> > extra activity, conflicts, flamewars - that definitely brought up
> > some memories re-reading those discussions again... :)
> 
> :)
> 
> I'm sure this has been discussed, I just don't remember where/when
> unfortunately.
> 
> I do believe the conclusion is right though and I believe there is
> enough general acceptance we can document it as such. If anyone
> objects, the TSC can discuss it but I'm not seeing that being requested
> unless there is more context to this discussion than I'm seeing.

Richard,

So, the policy issue is all sorted out now...

But how one would use this change in a multi-machine distro, when some 
machines have graphics and want qt5+gl dependencies, while other machines 
have no graphics and cannot build qt5+gl. Is there a way to keep this 
package generic w/o making it machine-specific PACKAGE_ARCH=MACHINE_ARCH?

-- 
Denys
