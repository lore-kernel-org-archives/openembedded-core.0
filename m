Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5526E78E88
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 07:10:56 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 143-v6so17604871wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 00:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=CuDhD80Z9iVEv3tzXM1OrUFf1uud+csPOvfsYWWA+9A=;
	b=AahpHUUGk1q299SJW79C/eP9f2Tx42Q3bq23VaR+2+KAPX0AHMISi5/UmXbGaswCDu
	oaG8fR/BKfrM77VwGWeEO8QU9JeBKQQHcgAoPtjRknU1Knq7HtdrAa/CzN7ZXm8HOU5T
	JkrY8vNooC6/g7IdFLO6IwlmYo5EkA/mTRaD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CuDhD80Z9iVEv3tzXM1OrUFf1uud+csPOvfsYWWA+9A=;
	b=CUbyMJBHgk3L+zWOSs/GvHFeisy2RKUoTZJXz5ZkyA8rnHylI8PtarhM6H1x5qcbqi
	Nez0U4pBitjtMfVVY4WtDV98MrgJzCGZ7wQznp8xHFL8UjIKmVyjNKdyu48V7x/YFqxU
	PfF1Zu0uYoPeP3/1CCfEKgG7nXzhnZ1OYf4CbbfhZseX7PZ4fao4UxSFjDRq+HraY91v
	pAbA0W0GANo2fsU+CGfRolgKOapESbJ27E/xwt7rre/oX8as6jzWZJFpY0abVd0Tp4sm
	LotO0jQWsFgU9MsKHjivJ34SN0JyqOpesR7e/H8J8pneFIrNJriHIZ2H9pbApzvKLFof
	4aSw==
X-Gm-Message-State: ABuFfoj0EUb5bjufDDui0k2vBc4GXwirCSlGBvOE/6UKpBrCqsYEYsvM
	9NFno6oRobBeKo1KYZOaODPcHw==
X-Google-Smtp-Source: ACcGV60C5h+3tyiPeJuQgWHF0wkMbhpu3Q1txIbjEUrGbUqbpJC1tvAmIL8OV71QeV0IrqJRO3TwdA==
X-Received: by 2002:a1c:2384:: with SMTP id
	j126-v6mr11943906wmj.124.1539587456421; 
	Mon, 15 Oct 2018 00:10:56 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y4-v6sm14983856wrd.25.2018.10.15.00.10.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Oct 2018 00:10:55 -0700 (PDT)
Message-ID: <aa73bd86641971a244b900e3736900d538732499.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Kang Kai <Kai.Kang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 15 Oct 2018 08:10:54 +0100
In-Reply-To: <9da9fad9-38c1-a465-8154-ab1581b15e73@windriver.com>
References: <cover.1539334497.git.kai.kang@windriver.com>
	<0c4bf43c1f51e38b1845b1b86b4513e95828d729.1539334497.git.kai.kang@windriver.com>
	<0c0def66080f069806c2197263eed086a36c008b.camel@linuxfoundation.org>
	<9da9fad9-38c1-a465-8154-ab1581b15e73@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] image_types_wic: set consistent staging dirs
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
X-List-Received-Date: Mon, 15 Oct 2018 07:10:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-10-15 at 08:54 +0800, Kang Kai wrote:
> On 2018年10月12日 18:43, Richard Purdie wrote:
> > On Fri, 2018-10-12 at 16:57 +0800, kai.kang@windriver.com wrote:
> > > From: Kai Kang <kai.kang@windriver.com>
> > > 
> > > When build wic image with multilib enabled by following config:
> > > 
> > >    MACHINE = "qemux86-64"
> > >    require conf/multilib.conf
> > >    MULTILIBS = "multilib:lib32"
> > >    DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> > > 
> > >    IMAGE_FSTYPES = "wic"
> > > 
> > > it fails to build lib32 image such as lib32-core-image-minimal:
> > > 
> > > > DEBUG: Executing shell function do_image_wic
> > > > INFO: Creating image(s)...
> > > > 
> > > > ERROR: Couldn't find correct bootimg_dir, exiting
> > > 
> > > Dependency syslinux is not expand to lib32-syslinux when multilib
> > > is
> > > enabled. It is populated to ${WORKDIR}/recipe-sysroot, but script
> > > wic
> > > searches syslinux in ${WORKDIR}/lib32-recipe-sysroot and causes
> > > error.
> > > 
> > > Set consistent staging dirs for wic to fix the issue.
> > > 
> > > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > > ---
> > >   meta/classes/image_types_wic.bbclass | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/meta/classes/image_types_wic.bbclass
> > > b/meta/classes/image_types_wic.bbclass
> > > index 5b40a9e919..402920805d 100644
> > > --- a/meta/classes/image_types_wic.bbclass
> > > +++ b/meta/classes/image_types_wic.bbclass
> > > @@ -54,6 +54,11 @@ WKS_FILE_DEPENDS ??=
> > > "${WKS_FILE_DEPENDS_DEFAULT}
> > > ${WKS_FILE_DEPENDS_BOOTLOADERS
> > >   
> > >   DEPENDS += "${@ '${WKS_FILE_DEPENDS}' if d.getVar('USING_WIC')
> > > else
> > > '' }"
> > >   
> > > +# Dependency syslinux is not expanded when multilib is enabled,
> > > consistent staging dirs are needed
> > > +RECIPE_SYSROOT = "${WORKDIR}/recipe-sysroot"
> > > +STAGING_DIR_HOST = "${WORKDIR}/recipe-sysroot"
> > > +STAGING_DIR_TARGET = "${WORKDIR}/recipe-sysroot"
> > > +
> > 
> > Doesn't that change this for *all* image types? Not sure that is a
> > good
> > idea...
> 
> OK. I'll build and test all image types.

That isn't my point, the autobuilder could test that.

I don't like changes which are so wide reaching where we can't easily
evaluate the impact or potential problems in other code.

I think we need to look for a better way to fix this.

Cheers,

Richard


