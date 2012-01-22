Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ronup-0002yn-HL
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 04:16:23 +0100
Received: by iabz21 with SMTP id z21so3210348iab.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2012 19:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=PnxxLZ7J1xNFWS/XbF3y88JItFiS1YPr8qm3g0DTJgw=;
	b=f6WYT4I6NlUPFV+v3rLoTvYbyN3/iaxKpvhJHY3IyJF+kM9PXG+NLcx36Od5kzweUL
	eHhuA6CuN1Dq5sH48dJ2n6aTObzHvLfBTIdKYOFI8jpVqk00WbB+FVDc2yhPPIf1PiNi
	Sh/L1fobjrL0O++i0U9GaMQ40THWZbOQO5z6U=
Received: by 10.42.117.193 with SMTP id u1mr3411086icq.24.1327201720639;
	Sat, 21 Jan 2012 19:08:40 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id vg9sm14616637igb.4.2012.01.21.19.08.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 Jan 2012 19:08:39 -0800 (PST)
Date: Sat, 21 Jan 2012 19:09:34 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120122030934.GE27997@sakrah.homelinux.org>
References: <201201170143.46134.schnitzeltony@gmx.de>
	<55ACB0DC-90E8-4A61-89FC-D51A01B69FF2@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <55ACB0DC-90E8-4A61-89FC-D51A01B69FF2@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: update-alternatives questions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 22 Jan 2012 03:16:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (17/01/12 10:07), Koen Kooi wrote:
> 
> Op 17 jan. 2012, om 01:43 heeft Andreas Müller het volgende geschreven:
> 
> > Hi
> > 
> > when starting a fresh image (angstrom/opkg) I see for xfwm4 (xfce window manager 
> > included in meta-oe)
> > 
> > S98configure[285]: //var/lib/opkg/info/xfwm4.postinst: line 2: update-
> > alternatives: command not found
> > 
> > I checked: 
> > 
> > * there is no  update-alternatives in my image
> > * update-alternatives is packed in update-alternatives-cworth (sub package of 
> > opkg) which is not part of my image
> > 
> > Isn't it required to have update-alternatives on the target
> 
> Yes
> 
> > because it is used 
> > in postinst- / and postrm scripts?
> 
> Those should be executed offline during build, so it's only for packages you install later on. Have a look at https://github.com/koenkooi/meta-angstrom/blob/master/recipes-images/angstrom/systemd-image.bb. That recipe will not include packagemanagement and u-a if ONLINE_PACKAGE_MANAGEMENT is set to none.
> 

oe-core provides PACKAGE_GROUP_package-management/ for same. May be it
should be leveraged here ?


> regards,
> 
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


