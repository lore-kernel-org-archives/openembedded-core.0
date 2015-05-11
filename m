Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 08D5F6013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 06:06:16 +0000 (UTC)
Received: by laat2 with SMTP id t2so86025814laa.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 23:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=7llHqsbPYmkTgK7wlptAhZ5G67CA4gkpvkjoJpOsVqM=;
	b=jDEVHLs7fteH2sI/G0QOzmPkjKsauBX2JJBTkABgszFSkQAlTReGg84swnqt4Bk8cV
	g/dWCXJp/clQ3wOx8Z8TGMIylZspVrrzcpUTrvDn4uA/1R9S56ohuNQPR4DzGkbV3LcW
	hqfwM2Ww3pgHLITw7taEy138hVDLZosnHXcbayHMDw7g/EKabBkIQ9TX5UjqdNpZ2UfU
	uYy01v0RCSJQ1SCOAejqs3kH3E2p+fRAKgXa8cDFP75PB/mMGUlKeEo9leqF5rrMTYwS
	Cw/GbLnInX75r4Q/fDFliFcdJPPqXOHPqlrvjWh0tOZZGOZhwaNQnMdQJp4r4uUG0kng
	H5bw==
X-Gm-Message-State: ALoCoQkOg61EV1FKY2/nACoBCa+fV2k+37FkLDj/y0HJCUkeVQnAwALjK/FaAI6E2SIv8hvyOz+z
X-Received: by 10.112.126.136 with SMTP id my8mr6840101lbb.18.1431324377069;
	Sun, 10 May 2015 23:06:17 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by mx.google.com with ESMTPSA id 4sm2819105lai.36.2015.05.10.23.06.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 May 2015 23:06:16 -0700 (PDT)
Date: Mon, 11 May 2015 08:06:14 +0200
From: Anders Darander <anders@chargestorm.se>
To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
Message-ID: <20150511060614.GA13549@ad.chargestorm.se>
Mail-Followup-To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>,
	Andreas Oberritter <obi@opendreambox.org>,
	openembedded-core@lists.openembedded.org
References: <1431016840-26287-1-git-send-email-bruno.bottazzini@intel.com>
	<1431016840-26287-4-git-send-email-bruno.bottazzini@intel.com>
	<554BB5F2.8090004@opendreambox.org>
	<1431038749.29137.15.camel@bottazzini-ThinkPad-T430>
MIME-Version: 1.0
In-Reply-To: <1431038749.29137.15.camel@bottazzini-ThinkPad-T430>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 3/3] systemd: split modules into packages
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
X-List-Received-Date: Mon, 11 May 2015 06:06:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Bottazzini, Bruno <bruno.bottazzini@intel.com> [150508 00:46]:

> On Qui, 2015-05-07 at 20:58 +0200, Andreas Oberritter wrote:
> > On 07.05.2015 18:40, Bruno Bottazzini wrote:
> > > +                   vconsole \
> > > +                   update \
> > > +                   timesyncd \
> > > +                   rfkill \
> > > +                   quota \
> > > +                   fuse \
> > > +                   firstboot \
> > > +                   dbus \
> > > +                   binfmt \
> > > +                   backlight \
> > > +                   ask-password \

> > I think it may be better to sort this quite long list alphabetically.

> > Are these options already enabled today? 

> Yes, it is enabled. 

> This is the default packages enabled in the current recipe.

> > Because of the new
> > packageconfig entries, I would have expected changes to EXTRA_OECONF and
> > DEPENDS, which I don't see in your patch.

> Some packages does not have EXTRA_OECONF.

> You can see what this recipe DEPENDS by looking at ${PN}-services-base.

What Andreas is asking about, is e.g. for the kmod PACKAGECONFIG:

> > > +PACKAGECONFIG[kmod] = "--enable-kmod,--disable-kmod,kmod"

Here, if kmod is enabled in PACKAGECONFIG, kmod (the 3rd parameter),
will be added to DEPENDS. Thus, you should remove kmod from the static
DEPENDS (as now it's dynamically added using PACKAGECONFIGS).

The same is likely true for a number of the other PACKAGECONFIGs that
you're adding (which, by the way is a _good_ thing to add).

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

