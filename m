Return-Path: <andre.draszik@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 214D3606A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 10:04:59 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id f93so58955362lfi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 03:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=13QqUIr0p8jxYDNgeGG2japvylNPLaWKfZF0E0Rguyo=;
	b=Am8ATmAYIzx93zyNfPxAs/j899xrQOt9yWy73xY8531xZ665vaaziADlQTx0XTbcb4
	mf39ubiQx8BRJVNl75EickL03VUReHrSq/RvgydHzvGWauP6E0uEagD2KATIVl6gxprU
	DC7hxo6dWh/lngaz4IvzC0Gz5Cfnk9DTav50pqC/EbDzE9OxRiURMLWY8mQ618nBA83y
	oyoZNHo+umW828afsm63DkKeXsfsfPLEOLk6KIq54hEvwosfynbEHZYAPZE3KrzIEnpN
	SKKiE/KJBJTLY1OXCQFyZVdpL3DimDUgHAW2FhAfvhcFAGH9CpWb33Qu+6Toh9mhTvbU
	FoBA==
X-Gm-Message-State: ALyK8tKOr4kIzFwkwbpPtVRXPAybB8zHBowNcW5xBqrw+yjHUITPa8WEx8+kmskq8RyRNg==
X-Received: by 10.25.32.85 with SMTP id g82mr6766221lfg.184.1468490699837;
	Thu, 14 Jul 2016 03:04:59 -0700 (PDT)
Received: from localhost ([185.46.212.59])
	by smtp.gmail.com with ESMTPSA id 62sm406550ljj.3.2016.07.14.03.04.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Jul 2016 03:04:58 -0700 (PDT)
Message-ID: <1468490695.17743.8.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 11:04:55 +0100
In-Reply-To: <CAKUP++sNL9QmS9zqL2_dZBb6wRDiZJFnzkgid9+x+Anv_44QFg@mail.gmail.com>
References: <1462534000-18539-1-git-send-email-ross.burton@intel.com>
	<1464346463.28160.45.camel@andred.net>
	<a8f703f6-4b7b-d7f0-722f-df7caee70291@windriver.com>
	<1464360133.3815.7.camel@andred.net>
	<351f6c15-c64d-106f-2d73-6c27500d5894@windriver.com>
	<CAKUP++sNL9QmS9zqL2_dZBb6wRDiZJFnzkgid9+x+Anv_44QFg@mail.gmail.com>
X-Mailer: Evolution 3.20.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH] bitbake.conf: add default for IMAGE_FSTYPES_DEBUGFS
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
X-List-Received-Date: Thu, 14 Jul 2016 10:05:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

On Fr, 2016-05-27 at 21:42 +0100, André Draszik wrote:
> 
> On Fri, May 27, 2016 at 4:21 PM, Mark Hatle <mark.hatle@windriver.com>
> wrote:
> > On 5/27/16 9:42 AM, André Draszik wrote:
> > > On Fr, 2016-05-27 at 09:21 -0500, Mark Hatle wrote:
> > > > On 5/27/16 5:54 AM, André Draszik wrote:
> > > > > This doesn't work for me (at least on krogoth):
> > > > > 
> > > > >     ERROR: poky/meta/recipes-core/images/build-appliance-
> > > > > image_14.0.0.bb: No IMAGE_CMD defined for IMAGE_FSTYPES entry
> > > > > 'debugfs_vmdk' - possibly invalid type name or missing support
> > > > > class
> > > > >     ERROR: Failed to parse recipe: poky/meta/recipes-
> > > > > core/images/build-
> > > > > appliance-image_14.0.0.bb
> > > > > 
> > > > > I *instead* am using the attached patch successfully.
> > > > > 
> > > > > Is anybody else facing the same issue?
> > > > 
> > > > Ross's patch should have fixed this.  It ensures that
> > > > IMAGE_FSTYPES_DEBUGFS is
> > > > always set to 'something'.
> > > 
> > > Yes, and now bitbake is looking for an IMAGE_CMD for debugfs_vmdk
> > > according
> > > to the error message. Note that I didn't specify vmdk anywhere, my
> > > IMAGE_FSTYPES is set to .tar.gz only.
> > > 
> > > > You should check if the patch has been applied to the "krogoth"
> > > > branch.
> > > 
> > > I did apply it locally. For me, it only works if i revert Ross' patch
> > > and
> > > apply my patch instead.
> > > 
> > 
> > Use bitbake -e <image>.  View the IMAGE_FSTYPES and
> > IMAGE_FSTYPES_DEBUGFS.  Do
> > you see vmdk in the former?  If so, look at the comments above it and it
> > shoudl
> > show you where it came from.
> > 
> > My guess is you have an image or BSP that is hard coding a specific
> > 'vmdk'.
> > 
> > I agree there is a problem here, some filesystem types do not make sense
> > for
> > debugfs type.  I'm not sure how to necessarily reconcile this behavior,
> > but vmdk
> > doesn't seem reasonable to me here..
> > 
> > But first figure out where it's coming from.
> > 
> > Setting IMAGE_FSTYPES_DEBUGFS = "tar.gz" in your local.conf should be
> > enough to
> > set the value and avoid the behavior.  If it's not, again look at the
> > bitbake -e
> > output and see what it's saying it's doing.


> Nothing is pulling vmdk into my builds. vmdk does not end up in
> my IMAGE_FSTYPES or IMAGE_FSTYPES_DEBUGFS. Again, the output from bitbake
> -e is fine when reverting Ross' patch and applying the patch I posted
> earlier instead. With Ross' patch (only), bitbake doesn't even finish
> parsing due to the exception being thrown (so bitbake -e output is empty
> apart from the exception).
> 
> I know I can set IMAGE_FSTYPES_DEBUGFS explicitly to work around the
> issue, but that's not it is intended to work.


Do you have any more suggestions how to debug this?

I am still in the exact same position. I need to revert Ross' patch and
apply the patch I sent before.

Is anybody successfully using this feature?


Cheers,
Andre'


