Return-Path: <prvs=1310c64d90=holzmayr@rsi-elektrotechnik.de>
X-Greylist: delayed 355 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 11 Feb 2020 14:17:36 UTC
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
	[81.169.146.164])
	by mail.openembedded.org (Postfix) with ESMTP id 42FAB60CD4;
	Tue, 11 Feb 2020 14:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581430657;
	s=strato-dkim-0002; d=rsi-elektrotechnik.de;
	h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=CLZHhMvrDiBe+iP7yIPQdKMeCi0XfPMV/dt2n5ZJGeQ=;
	b=spNRdMlEdeqG5XiO2C/Pop4/yQZXHATqGhXTLbSRMs+38y6tOvYkHlPAUqybcS/9LC
	k3ROhD2lrfPQ0nv/B+38I2mzq67lSkVjngmTiwPyv7cKqQAzRQDPVVulBDMMbnSi0Nc4
	1e+PCSt/W7s4CiCH2NVa/zY7SzCNee3ICcs7JzE4l2tSD05uzxcnKntnXsVM0HK0qaFf
	5Cikoq/QsjXXlTiPWKLfbwI90fwtHvyPsW5/mPzAdnFM6wbJrMN3GxxnhWIvFSUgOJqY
	K6pMYWBrGW/S9slohpbqEG+qzaxGPJRNQFHohOSRtmSj1fgvTB62mUesJe07Q8jF2UiC
	HTBQ==
X-RZG-AUTH: ":fz5RJhWIaexwuXGosGLfiBc0xYyi1Y5bd+wRKqrzPXw4V1/KqCOd+ZZzzoK8epFp9XQIUl6aPGQL"
X-RZG-CLASS-ID: mo00
Received: from mail.rsi-elektrotechnik.de
	by smtp.strato.de (RZmta 46.1.12 AUTH)
	with ESMTPSA id e0837bw1BE5bfhN
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Tue, 11 Feb 2020 15:05:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/relaxed;
	d=rsi-elektrotechnik.de; s=MDaemon; t=1581429937; x=1582034737;
	i=holzmayr@rsi-elektrotechnik.de; q=dns/txt; h=Date:From:To:Cc:
	Subject:Message-ID:References:MIME-Version:Content-Type:
	Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	User-Agent; bh=CLZHhMvrDiBe+iP7yIPQdKMeCi0XfPMV/dt2n5ZJGeQ=; b=J
	1iJ7+aAFKV03OnWKGg2GD2VBurnbitkqYTh4N4B0Mmwmy2QGs5SO5SNdjBy0i29o
	3xUa6Ozygcl3l4pyUzzIJkc0KpuWPp7jG0dV0PBrTtHu1JzM7rvPT3l3PhhO2EUE
	5n1RAB5O05YDLcEbphzpkACa66emfM3lgqDxpfj0H0=
Received: by mail.rsi-elektrotechnik.de (MDaemon PRO v19.5.4) with ESMTPSA id
	md50000243160.msg; Tue, 11 Feb 2020 15:05:37 +0100
X-Spam-Processed: mail.rsi-elektrotechnik.de, Tue, 11 Feb 2020 15:05:37 +0100
	(not processed: message from trusted or authenticated source)
X-MDArrival-Date: Tue, 11 Feb 2020 15:05:37 +0100
X-Authenticated-Sender: holzmayr@rsi-elektrotechnik.de
X-Return-Path: prvs=1310c64d90=holzmayr@rsi-elektrotechnik.de
X-Envelope-From: holzmayr@rsi-elektrotechnik.de
Date: Tue, 11 Feb 2020 14:05:00 +0000
From: Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200211140500.hreujdfmfxuf4omh@jh-mailer>
References: <CANNYZj-KS+mHQ20sQUv-SzpeaXjvAzQDPND00iuep6ek7utd5g@mail.gmail.com>
	<20200211135323.GA3234@localhost>
	<CANNYZj_ExXVJJMS3g6Ga2xNc9AgspEhcMBQgmQGaQXmkcUYvPQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj_ExXVJJMS3g6Ga2xNc9AgspEhcMBQgmQGaQXmkcUYvPQ@mail.gmail.com>
User-Agent: NeoMutt/20171215
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [Openembedded-architecture] Future of sato and X in oe-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Feb 2020 14:17:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Howdy!

On Tue, Feb 11, 2020 at 02:57:48PM +0100, Alexander Kanavin wrote:
> The question is: what are the use cases for an 'example/reference UI'? Why
> have one at all at this point? Remember, the core project is severely
> under-staffed and we need to commit our limited resources wisely.

My $.02 are, that while being a good test vehicle to build for us, it is
actually giving a wrong impression to newcomers. Like "here is a DE to
start off, and you can use this build like your desktop box" which is not
at all true.

So my votes are on, as long as we have something that *can* do
*something* on screen with as little effort as possible, we should go
for it. Maintaining a custom thing should be avoided.

Greetz

> 
> On Tue, 11 Feb 2020 at 14:53, Adrian Bunk <bunk@stusta.de> wrote:
> 
> > On Tue, Feb 11, 2020 at 01:49:27PM +0100, Alexander Kanavin wrote:
> > >...
> > > - matchbox is reliant on gtk3 (to be obsoleted by gtk4 this year), and
> > does
> > > not have a Wayland compositor. Yocto project does not have the resources
> > to
> > > do the gtk4 port, or add a compositor.
> > >
> > > - no 'lightweight Wayland compositor with a desktop/launcher experience"
> > > has emerged in the open source space; I think the only realistic choice
> > at
> > > the moment is the reference compositor Weston which provides a blank
> > > desktop with ability to open terminal windows.
> > >
> > > So the way I think things should be going (seeking opinions/inputs of
> > > course):
> > >...
> > > - oe-core continues to support and runtime-test X for as long as
> > possible;
> > > for this a new image (say, 'core-image-sato-xorg') is created which will
> > > provide matchbox under X. However, once upstream bitrot sets in, and pain
> > > threshold is exceeded, this will be removed and/or relegated to a legacy
> > > layer.
> > >
> > > Thoughts?
> >
> > matchbox made sense at a time when you could go into a shop and buy an
> > internet tablet with Linux running on 256 MB flash with 256 MB RAM.
> >
> > Part of the problem is that the only remaining usage of this branch
> > of matchbox development seems to be as example UI for Yocto.
> >
> > For matchbox/sato I am wondering whether replacing it with parts of
> > meta-xfce from meta-openembedded would be a good way forward.
> >
> > Upstream Xfce still seems to be 2-3 years away from gtk4 and Wayland
> > support, but at the point where supporting X might become a problem
> > this should be available.
> >
> > Xfce was my first thought as replacement since it appears to be
> > well-maintained in meta-openembedded, no strong opinion whether
> > it is actually the best option.
> >
> > > Regards,
> > > Alex
> >
> > cu
> > Adrian
> >

> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture


-- 
———————————————
Josef Holzmayr
Software Developer Embedded Systems

Tel: +49 8444 9204-48
Fax: +49 8444 9204-50

R-S-I Elektrotechnik GmbH & Co. KG
Woelkestrasse 11
D-85301 Schweitenkirchen
www.rsi-elektrotechnik.de
———————————————
Amtsgericht Ingolstadt – GmbH: HRB 191328 – KG: HRA 170393
Geschäftsführer: Dr.-Ing. Michael Sorg, Dipl.-Ing. Franz Sorg
Ust-IdNr: DE 128592548 

_____________________________________________________________
Amtsgericht Ingolstadt - GmbH: HRB 191328 - KG: HRA 170363
Geschäftsführer: Dr.-Ing. Michael Sorg, Dipl.-Ing. Franz Sorg
USt-IdNr.: DE 128592548


