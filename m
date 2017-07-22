Return-Path: <patrick.ohly@intel.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8BD1278441
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jul 2017 12:51:18 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id x187so69932419oig.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jul 2017 05:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=5rpkv0tvYNnxRAzm52jIV5PnmiThi/hCgLC7Fo4ICX8=;
	b=N6KfUMm1rGhtuyN+CbK+g8RpazY838Mp7CnzhPutPETh+4IWOpki5dB2WmqkyT8SkB
	CJX0BHBwM5Op/0kfBQTaXcZreTa+KvTJZfJpakQlTGSOB2Tz6++Ul4GMO06hmjKDKW52
	57WsgCSNuHyrhqv2m9E9u2hW7L9yx+jyw5yS9Y0Cgca5eleyk9iKqW7RhAW8QJg0auYg
	Ppi3XKMgLz+dFN7WfzM4dmcWJHWrQdMmbGpv4aQ2uifL+/9CuUADX2npwfoPOkJBidcQ
	lCzEDgyKD67Er6CUxYtr9VCLPwj4CRP0Su3d58ox8Vw65ku4h/vvMB10lZWcwrMCA1LC
	/0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=5rpkv0tvYNnxRAzm52jIV5PnmiThi/hCgLC7Fo4ICX8=;
	b=OAZWV296/h1FsltOP6aao9LjsB9MVqv1MO4nMiBjjvpHLhFyS+ez3YwBn47ypYYa/J
	Up8glIL49GxKIIbaAXbjypvXR8nn4HBqz8WIYtwJRlRM4PAnwTztCq7f2sz4CFE+Qg/e
	e5NSdpky7vRqpLOF3WmT2kD026YdSbTJzTvnwBL5ir/yhp6mlXIlb+ZtY5N1DPQXV/9N
	y3AAgYvsBHsfxFY1y9kAFzxN13mYoUzJAnkC6rWSH/8mOsIuC89XYJQzUm+jbcvSPniW
	LsEIFnsOLY8/3VpkWvv9grHMBt4VagsadnLGOqPHYNerjCChOSFcCnIG32OV+RoZQMpW
	jEqg==
X-Gm-Message-State: AIVw1127tJvaFNDm/LVGe+Wm6b1oLhRQDQlmNiSTI6fspAsHp22NDMAU
	wLOBwIKgdexojBDpCWM=
X-Received: by 10.202.239.137 with SMTP id n131mr4345133oih.227.1500727879362; 
	Sat, 22 Jul 2017 05:51:19 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F5F6.dip0.t-ipconnect.de. [93.232.245.246])
	by smtp.gmail.com with ESMTPSA id
	r185sm4047067oib.56.2017.07.22.05.51.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Jul 2017 05:51:17 -0700 (PDT)
Message-ID: <1500727874.15277.25.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Tom Rini <trini@konsulko.com>
Date: Sat, 22 Jul 2017 14:51:14 +0200
In-Reply-To: <20170721205245.GO14320@bill-the-cat>
References: <1500590631-2028-1-git-send-email-trini@konsulko.com>
	<1500623241.15277.10.camel@intel.com>
	<20170721112103.GJ14320@bill-the-cat>
	<1500642093.15277.15.camel@intel.com>
	<20170721205245.GO14320@bill-the-cat>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] image-vm: Convert vmdk/vdi/qcow2/hdddirect images to IMAGE_CMD
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
X-List-Received-Date: Sat, 22 Jul 2017 12:51:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-07-21 at 16:52 -0400, Tom Rini wrote:
> On Fri, Jul 21, 2017 at 03:01:33PM +0200, Patrick Ohly wrote:
> > On Fri, 2017-07-21 at 07:21 -0400, Tom Rini wrote:
> > > On Fri, Jul 21, 2017 at 09:47:21AM +0200, Patrick Ohly wrote:
> > > > On Thu, 2017-07-20 at 18:43 -0400, Tom Rini wrote:
> > > > > The support for writing vmdk/vdi/qcow2 images has not been converted to make
> > > > > use of the IMAGE_CMD infrastructure and instead relies on custom logic for
> > > > > adding tasks in the right place.  Convert these images to making use of
> > > > > IMAGE_CMD.
> > > > 
> > > > Thanks for working on this. I still have
> > > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=10204 open for
> > > > enhancing vmdk/vdi/qcow2.
> > > > 
> > > > However, your patch doesn't go as far as described in that bug, does it?
> > > > Instead of allowing, for example, IMAGE_FSTYPES = "wic.vmdk", it merely
> > > > changes how IMAGE_FSTYPES = "vmdk" is implemented.
> > > > 
> > > > The current patch has its merits as it simplifies the implementation,
> > > > but I think it would be worthwhile to go all the way, even if it changes
> > > > how images are going to be named.
> > > 
> > > Ah, interesting.  I guess the first thing I would argue against is
> > > saying that hdddirect should be masked.  There are reasons to want to
> > > have a raw image created.
> > 
> > I'm not sure I understand what you mean with "hdddirect should be
> > masked" - it's been a while that I looked at the code.
> > 
> > > I will take a look into using CONVERSIONCMD for vmdk/qcow2/vdi to allow
> > > for wic.vmdk to work.  But we also must have vmdk.xz work (and fwiw with
> > > my series you can get arbitrary compression that we support done, I did
> > > vmdk.xz, qcow2.lzo and vdi.bz2 just for 'fun').
> > 
> > The same is true with CONVERSIONCMD. They can be chained multiple times.
> > 
> > > But I'm not 100% sure that I like changing the normal case from "vmdk"
> > > to "wic.vmdk" or "hdddirect.vmdk" just to get a disk image to throw at
> > > ${VM_TECHNOLOGY}.
> > 
> > Yes, that's the biggest user-visible change. Basically the internal
> > implementation (multiple conversions chained together) becomes visible
> > in the end-result.
> > 
> > That is a good and a bad thing. The good thing is that it is visible how
> > the .vmdk image was created. The bad thing is that some users might not
> > care and get confused.
> 
> So, Patrick, Ed and I talked on IRC a bit about this, and I think
> without putting too many words in their mouths, I think it can be
> summarized like this.
>
> We all agree that vmdk/qcow2/vdi are a type of conversion.  It would be
> quite handy to use these conversions on other things, such as wic.
> 
> And at least from my point of view, the contents of "hdddirect" doesn't
> matter so much as the overall functionality.
> 
> So that here's where I'm at now.  I've found out when Patrick's chaining
> compression code (so that you could do silly things like ext3.gz.bz2 or
> _useful_ things like wic.vmdk.xz) was broken, and I see the best way to
> fix that too.  So I'm going to v2 this series shortly which addresses
> the problem of chaining compression types, and then brings the VM stuff
> over to using that too.

Thanks for the good summary and working on this functionality.

I'd like to add that you pointed out that a "generic" vmdk type is what
some developers ask for when they don't care about the exact way how the
resulting image is created (hdddirect vs. wic, for example). We agreed
that this is useful.

I didn't get around to mentioning it on IRC, but what I would find it
useful is if someone (BSP and/or distro?) can define which kind of raw
image is used as input for the conversion to vmdk. Hard-coding that to
just hdddirect always felt wrong to me.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




