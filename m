Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id DFB7A7E3F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 13:55:36 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id b18so4251085wrq.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 06:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=gTEG5fed2w2JAuol/bjH/QV+3Y4ynjoT2M0MWbflaNc=;
	b=M3zShuIV+MrWyJDSn3bdekpd0n1oiMzDJxwKKBaN/CduMXdMhYiBsmSltOzrQWLgwi
	fKBO19Hj2iy86abT7yPX5NHXlkEvbjJ/XtFX+xJ7bZ7CfGtw4KbNTMSc8XXypfVDxrvU
	VKOCTrkszZZcRIv5TvKbz57Zwj6O4l8iM+EEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=gTEG5fed2w2JAuol/bjH/QV+3Y4ynjoT2M0MWbflaNc=;
	b=Sn7kuRbcIzO6zQz14Y6+qJczUBMVwVzAavMC5yCvHSFsq/z4DfD1aZZ7OD+2HaD7+G
	aOeIzu973D7lXTUjkv0HxRvzIeZhkBBRQ8IqO8EZ6Jrlefj7tiGVf/2yEuFAA6iPHdHu
	QQ47p5Ctujc3X84lOzMvdvy8JJBo//EP90CoJKiKbxpFKsuvFsc8WUNtMtaYUBtfYbnD
	/dMGpmv0Rk3/xzA4FwGzO1d4Arsj+khCqtR/Owb5145ubMTxImjLgy8XRn6BLhS855RE
	Tl8aCkfYGKzg+7UlEAIAGSpRYWxkcaWmgS4CT9kLnXWHD8TFbmPJ0TWXROZF+ugW4VfB
	vi/g==
X-Gm-Message-State: APjAAAWRMavKjUUDGesYnoeaPX5598TrYztlS5h7Qpkvj9DAbSfvQSOg
	hBv/EWIYqYXBD3WMHnvVJztUFw==
X-Google-Smtp-Source: APXvYqy13lv3F8Bx5873JAucm6mN7U0+w2p8p8rskgvOoEWQOk2bOO4jiSG4QkDwGbEw97r5D4Q2TQ==
X-Received: by 2002:a5d:440d:: with SMTP id z13mr2691287wrq.263.1559224537565; 
	Thu, 30 May 2019 06:55:37 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s11sm3160474wrb.71.2019.05.30.06.55.36
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 30 May 2019 06:55:36 -0700 (PDT)
Message-ID: <9934d166bdb464e18d20ccb64f88fcebac019a07.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: akuster808 <akuster808@gmail.com>, Adrian Bunk <bunk@stusta.de>, Tom
	Rini <trini@konsulko.com>
Date: Thu, 30 May 2019 14:55:35 +0100
In-Reply-To: <ed68ff2b-e29e-54eb-f477-5026e45795dc@gmail.com>
References: <20190529184328.28470-1-richard.purdie@linuxfoundation.org>
	<20190529184328.28470-2-richard.purdie@linuxfoundation.org>
	<4c62af9f-8bff-726e-db35-6f6ed7ebafc2@gmail.com>
	<8798dc0e5d91991953720388b601c9c5b3174c42.camel@linuxfoundation.org>
	<321f3cb8-a101-49ad-07c4-64fc82d2c7f8@gmail.com>
	<d5b41b11583c78cd16d6393736fafd8e733c48a9.camel@linuxfoundation.org>
	<20190529212556.GO20781@bill-the-cat>
	<4571b3c03fb83ee01492dd1891e410becb72b0e5.camel@linuxfoundation.org>
	<20190529221726.GA16075@localhost>
	<20190529222920.GP20781@bill-the-cat>
	<20190529230203.GB16075@localhost>
	<aba82f4358b0479419ccc3412b83c052dce57bf4.camel@linuxfoundation.org>
	<ed68ff2b-e29e-54eb-f477-5026e45795dc@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] uninative: Switch from bz2 to xz
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
X-List-Received-Date: Thu, 30 May 2019 13:55:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-30 at 06:32 -0700, akuster808 wrote:
> 
> On 5/30/19 1:13 AM, richard.purdie@linuxfoundation.org wrote:
> > On Thu, 2019-05-30 at 02:02 +0300, Adrian Bunk wrote:
> > > On Wed, May 29, 2019 at 06:29:20PM -0400, Tom Rini wrote:
> > > > On Thu, May 30, 2019 at 01:17:26AM +0300, Adrian Bunk wrote:
> > > > > On Wed, May 29, 2019 at 10:29:31PM +0100, 
> > > > > richard.purdie@linuxfoundation.org wrote:
> > > > > > On Wed, 2019-05-29 at 17:25 -0400, Tom Rini wrote:
> > > > > > > On Wed, May 29, 2019 at 09:50:22PM +0100, 
> > > > > > > richard.purdie@linuxfoundation.org wrote:
> > > > > > > > On Wed, 2019-05-29 at 13:39 -0700, akuster808 wrote:
> > > > > > > > > On 5/29/19 12:26 PM, 
> > > > > > > > > richard.purdie@linuxfoundation.org
> > > > > > > > > wrote:
> > > > > > > > > > On Wed, 2019-05-29 at 12:21 -0700, akuster808
> > > > > > > > > > wrote:
> > > > > > > > > > > On 5/29/19 11:43 AM, Richard Purdie wrote:
> > > > > > > > > > > > (From OE-Core rev:
> > > > > > > > > > > > 29fc9210b973be68de474e75068e4c72371afe5a)
> > > > > > > > > > > > 
> > > > > > > > > > > > Signed-off-by: Richard Purdie <
> > > > > > > > > > > > richard.purdie@linuxfoundation.org>
> > > > > > > > > > > With back port to warrior and Thud too?
> > > > > > > > > > Yes, we'll need to do that if we bring fedora 30
> > > > > > > > > > workers online
> > > > > > > > > > on
> > > > > > > > > > the
> > > > > > > > > > autobuilder.
> > > > > > > > > I know the uninative update is required for FC30 but
> > > > > > > > > changing the
> > > > > > > > > compression does not.
> > > > > > > > > 
> > > > > > > > > This question is about the compression extension
> > > > > > > > > question.
> > > > > > > > > 
> > > > > > > > > Does this mean YP will no longer be providing bz2
> > > > > > > > > uninatives?
> > > > > > > > Correct, the patch should be straight forward to
> > > > > > > > include
> > > > > > > > with the
> > > > > > > > upgrade.
> > > > > > > Does that in turn mean we must have host xz-utils?
> > > > > > It will mean you need a tar which supports the -J option.
> > > > > > The
> > > > > > tests
> > > > > > I've see so far suggest all our oldest supported distros
> > > > > > do...
> > > > > For thud tar >= 1.27 is required, -J was added in 1.22.
> > > > > 
> > > > > But Tom is asking about something different:
> > > > > tar calls "xz -d" for decompression, which needs xz-utils
> > > > > installed.
> > > > > 
> > > > > https://www.yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#required-packages-for-the-build-host 
> > > > > documents that xz has to be installed, but looking at 
> > > > > meta/conf/bitbake.conf it might be missing in HOSTTOOLS.
> > uninative runs in a weird early non-worker context and doesn't
> > actually
> > use HOSTTOOLS so luckily we're covered from that angle.
> > 
> > > > I think it's also missing in for example the crops
> > > > containers.  So
> > > > if
> > > > we're going to backport it, I think maybe we should keep it
> > > > bz2?  The
> > > > size difference can't be that much.
> > > The size difference is surprisingly high - a factor of 5 (sic).
> > > But in practice the difference between 5 MB and 26 MB
> > > shouldn't really matter.
> > I'm torn, partly as if we stick with bz2, we effectively do that
> > perpetually and given the size difference, we should switch.
> > 
> > Tim mentions we could fix the crops container and I'm tempted to
> > switch
> > given we're so close with the current patchset...
> > 
> > We can add xz to HOSTTOOLS in master and that makes sense for a
> > number
> > of other reasons but gets tricky as we can't add it to
> > ASSUME_PROVIDED
> > as easily due to the libs it provides. I think we only need to
> > worry
> > about this on master though.
> So.. Can we have a bz and xz version built until thud is in community
> supported and update Warrior to use xz ?

I think thud and warrior will work fine if we backport just the upgrade
and the change to uninative.bbclass?

I really don't want to try and do both.

Cheers,

Richard


