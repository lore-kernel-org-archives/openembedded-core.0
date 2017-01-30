Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 14F7A77440
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 19:10:03 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id 203so200964985ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 11:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Pa4VY80RJcBbTxt08U7VlIO1aMzKsf/Gir6SLc0k71g=;
	b=iST+fcg6NkkIjMjWaXQjAHn2I5BuiTwo6n10FHM/UwiKuyN+bZmY2w51Vgb1ERcoe/
	b03a6tuq9RMZ9OIxZgnFiZUbdg2kkzbK02OcI0WWDRlEHcTcdJYLlZTSUIe4Fu4hIamD
	ED2GMYlz4mt7TzRzpQ5WdNlD2KbIL7TRHlbnmpj6AlXHqDcQrQZUTLHQchNmQXuNFgev
	fVgHpS3ZOFBqQ2YbSVuhWYaCLp73URWvyAijFUcd+sT4C5tB3aWFxzaUhKR8jbNLiI5t
	gCK8VJP7lar2dgXNYO40mCK2FOJLPMo7e8bPaH33SBwPILgGUFTwzL+Qeta61ekIfHy9
	R8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Pa4VY80RJcBbTxt08U7VlIO1aMzKsf/Gir6SLc0k71g=;
	b=UU56HqeEBtPAFaGxWZ5j7Rz7pEkD9t1ygjbK/DSp/Hszh2FCaUPrtbsk2TRmcb3uAn
	704RxKx769sJSdWGyNUJL1oKnAwk1+BZY4n83trkyk3PTbZWYOQRsqZs5Ba3UmzwgcrA
	mxFPc3eMskgmPF3tU7zIvhjc8O8TpEfOUJ5qk/2i7gq9GgbfTyVoq1QR02bcXjNM3yxt
	1sIYqVQZSjxidEm0iPqfzsZMcHHJSqF2kNE6/7Bg8QnmOknoczPx0WQVcC8PVzf04HJj
	OVKNiO0MIhzEMMOSc4zAZBvHeEzgRx13YROjhaRCMSLKJ9hRuEAFvh6LHe9RpOvNSJYQ
	oy+A==
X-Gm-Message-State: AIkVDXIYiWfwjTGN8Ni5YXdZSkwUS0m9tv4qU5LMcs+50QfD4R6HWjyOGRLHtc6bWW32i63X
X-Received: by 10.36.217.144 with SMTP id p138mr16415586itg.96.1485803404092; 
	Mon, 30 Jan 2017 11:10:04 -0800 (PST)
Received: from pohly-mobl1 (p5DE8CDEB.dip0.t-ipconnect.de. [93.232.205.235])
	by smtp.gmail.com with ESMTPSA id
	x197sm6838547ite.17.2017.01.30.11.10.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Jan 2017 11:10:02 -0800 (PST)
Message-ID: <1485803400.20333.153.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Date: Mon, 30 Jan 2017 20:10:00 +0100
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B6118F884B@ORSMSX112.amr.corp.intel.com>
References: <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>
	,
	<707323fc8105d9a1cf77fe340ebff387862c8e8e.1485530988.git-series.patrick.ohly@intel.com>
	<6E51916E4A1F32428260031F4C7CD2B6118F7EEC@ORSMSX112.amr.corp.intel.com>
	<1485544947.20333.119.camel@intel.com>
	<6E51916E4A1F32428260031F4C7CD2B6118F884B@ORSMSX112.amr.corp.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 09/12] runqemu: also accept -image suffix for	rootfs parameter
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
X-List-Received-Date: Mon, 30 Jan 2017 19:10:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-01-30 at 17:12 +0000, Bystricky, Juro wrote:
> 
> > -----Original Message-----
> > From: Patrick Ohly [mailto:patrick.ohly@intel.com]
> > Sent: Friday, January 27, 2017 11:22 AM
> > To: Bystricky, Juro <juro.bystricky@intel.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH v5 09/12] runqemu: also accept -image suffix
> > for rootfs parameter
> > 
> > On Fri, 2017-01-27 at 16:54 +0000, Bystricky, Juro wrote:
> > > Just curious: is this test for "image" in file name really necessary?
> > > With qemuboot.conf the relevant files are already spelled out.
> > > I don't see a need to force "compulsory" names for images.
> > > If I comment out this test, everything works just fine. Am I missing
> > something?
> > 
> > Some of the usages when checking for paths might have become obsolete,
> > but at least for distinguishing between machine and image base name
> > parameters it is still relevant:
> > 
> >     def check_args(self):
> > ...
> >             elif re.search(r'-image-|-image$', arg):
> >                 # Lazy rootfs
> >                 self.rootfs = arg
> >             elif arg.startswith('ovmf'):
> >                 self.ovmf_bios.append(arg)
> >             else:
> >                 # At last, assume is it the MACHINE
> >                 if (not unknown_arg) or unknown_arg == arg:
> >                     unknown_arg = arg
> >                 else:
> >                     raise Exception("Can't handle two unknown args: %s %
> > s" % (unknown_arg, arg))
> > 
> > When removing the "if re.search(r'-image-|-image$', arg)" clause one
> > gets an error for:
> > 
> > $ runqemu core-image-minimal ext4 qemux86
> > runqemu - ERROR - Can't handle two unknown args: core-image-minimal qemux86
> > runqemu - ERROR - Try 'runqemu help' on how to use it
> > 
> 
> I see, the purpose of this test is determine which argument is which,
> as they can be in any order. IMHO to differentiate between MACHINE and image it would 
> make more sense to search for "qemu" instead of "-image-" or "-image" .

The machine is not guaranteed to contain "qemu". I sent a patch to
meta-intel which enables "runqemu core-image-minimal ext4
intel-corei7-64", and other BSPs might want to do the same.

> (BTW do we need both -image- and -image$?)

Yes, for "core-image-minimal" and "foobar-installer-image" (something
that I am currently working on).

> There is also ANOTHER test for '-image-', in "is_deploy_dir_image". 
> This is the one I considered redundant (or not needed in case we have qemuboot.conf).

That might be true. I was trying to be conservative with this patch and
thus extended all existing checks instead of trying to to figure out
which one had become redundant.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




