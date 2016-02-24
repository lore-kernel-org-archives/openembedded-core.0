Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id E74D377281
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 18:49:23 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id g203so58347042iof.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 10:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:content-type:mime-version:content-transfer-encoding;
	bh=WIlAvnXDsdK9JOGn8DA9czRpbNsBQIaoCR5Vs7ojB0g=;
	b=cg6rkJwPeYVJoI4sr9CX4oaGwnMe88Jh5e4cJye6ac3UlaK79C+neI9xyHXAr3OC16
	E4B6oaSJK4xvRvghUW1hwULsCGiO6pu9GgP58GSGroMpEukOSvfyk4xMfV12cxKRVOJz
	+DR03P0zvYLmAfWMN50+9M97rgFZc2sr4vjEXWA13ckJcwC7v4pQd5ZyqUi6z5r0uXUh
	QSB9VnCxhtLAJK7Qr7X7nskC2jeidYC/Z1e619I6FP4RKML5HLNX45m9ycSRTrHfR3Qb
	+jsQWlUnw3+P1QlwO3G1+O57Ess3tjjAN4id3duaMk/eFoAMKK58tDoHRvwKh6+SBqEY
	IPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=WIlAvnXDsdK9JOGn8DA9czRpbNsBQIaoCR5Vs7ojB0g=;
	b=e7yE4ZSPh3lvNCmmcVC0spMgKIN2ENq88dvsKGJNKCfGLeUFSVWT8oNDAB+TBEbRM4
	DVIAqRiKvBSrTqW7zLxg7EUA36Tctl5CIEQZkw7lCoys0o6MnjbAqnLmrVsgwoUUj4WX
	b/S5MAop0DzQkbgWy2uc5jgfL/zCHdeerhLkXVwTXzoBR17kPZQWurnJ3/hzxu78gvnA
	efMfIwycWm5QZnhgqdrcfwflJSfEqrAzCE4Qr7oz2DB6iFYKOlq4Y4KtxpLt511xB282
	hCOJ0uXUfiy7riarUltT8cfvO/kfrCVO8pguaLlypXixg3BcbGNOQt3JHMaafEPHFQyw
	XslQ==
X-Gm-Message-State: AG10YOTOJRmCTYoVSyTs7lxb+qdevjcXM+lRc/u3S4Kdh0J5uJ8w9xr9/ynVsnuTxezaMmxa
X-Received: by 10.107.6.35 with SMTP id 35mr46236892iog.140.1456339764149;
	Wed, 24 Feb 2016 10:49:24 -0800 (PST)
Received: from pohly-mobl1 (p5DE8D62C.dip0.t-ipconnect.de. [93.232.214.44])
	by smtp.gmail.com with ESMTPSA id j9sm1775785iof.1.2016.02.24.10.49.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Feb 2016 10:49:23 -0800 (PST)
Message-ID: <1456339760.30039.62.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Lock, Joshua G" <joshua.g.lock@intel.com>
Date: Wed, 24 Feb 2016 19:49:20 +0100
In-Reply-To: <1456330147.5333.14.camel@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
	<1456328275.30039.49.camel@intel.com>
	<1456330147.5333.14.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/10] Integrate swupd software updater
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
X-List-Received-Date: Wed, 24 Feb 2016 18:49:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-02-24 at 16:09 +0000, Lock, Joshua G wrote:
> On Wed, 2016-02-24 at 16:37 +0100, Patrick Ohly wrote:
> > Hello!
> > 
> > I haven't had a chance to play with the actual code yet and I don't
> > know
> > yet when I'll be able to. Let me ask for some clarifications about
> > the
> > approach first anyway.
> > 
> > On Wed, 2016-02-24 at 14:52 +0000, Joshua Lock wrote:
> > > 
> > > Approach:
> > > An image that inherits the swupd-image bbclass will automatically
> > > have bundle
> > > 'chroots' created which contain the filesystem contents of the
> > > specified
> > > bundles, with the contents of the inheriting image forming the
> > > default os-core
> > > bundle.
> > > 
> > > The mechanism to achieve this is that several virtual image recipes
> > > are created
> > > using the swupdbundle class, one for each defined bundle plus a
> > > 'mega' image
> > > recipe. The 'mega' image contains the base image plus the contents
> > > of all of the
> > > bundles, whilst bundle images contain only the base image plus the
> > > contents of a
> > > single bundle.
> > Just to be sure, the actual "content" (a term that is a bit too
> > overloaded to be used precisely in all cases) of a file and its meta
> > attributes will come from the mega image, and the virtual image
> > recipes,
> > including the base image, are merely used to generate file lists?
> 
> That's not currently true, no — the file contents for a bundle come
> from the bundle image and the file contents for os-core come from the
> base image. It shouldn't be too difficult a change to make, I'll take a
> look now.

The prime example that needs to be handled correctly is where installing
additional packages for one of the extra bundles adds a system user
to /etc/passwd (*). The content of /etc/passwd must come from the mega
rootfs.

(*) Except that swupd assumes that the distro is stateless and thus
automatically excludes /etc from bundles. The example is still valid
because preparing bundles does not need to care about that.

> > What is the content of the actual image that gets created? It has to
> > match the content (= file content and meta information) of the mega
> > image and not of the base image, otherwise there can be
> > inconsistencies
> > between the actual running image and the core os bundle. I suppose
> > swupd
> > will be able to fix that, but I'm not sure.
> > 
> > It sounds like this bundle creation is completely separated from the
> > regular image creation; if so, then I suspect that this may have to
> > change.
> 
> Right, currently bundle creation happens after image creation and as
> above bundles are populated from the rootfs of the bundle images.
> 
> You're right, of course, we'll need to construct the running image from
> the bundle contents for more complex images.

We can remove the original do_rootfs and do_image and replace it with
code that copies the relevant subset of the mega image. Then the rest of
the image creation will see the right content.

> > > We took the approach of building images, rather than populating the
> > > chroot-like
> > > bundle directories with a package manager, because various layers
> > > and recipes
> > > make changes to the rootfs contents outside of the package manager,
> > > particularly
> > > with IMAGE_POSTPROCESS_COMMAND, etc.
> > Makes sense to me.
> > 
> > Have you considered generating the file lists more efficiently? I can
> > think of some alternatives, but all have downsides.
> > 
> 
> I did consider a couple of other approaches but with a goal of
> submitting this for M3 this approach felt like the surest route within
> the time available. I'd certainly like to find a more efficient method
> and if you have any suggestions I'd be happy to hear them.

I don't have any and thus agree with this route. I was merely wondering
whether you already had a working solution in mind.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




