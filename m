Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1C0887F0CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 21:02:34 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 7so4293768wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 14:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=iIyuIpe10vsk8N1aJfOkk/WN5Zfchp+KpulgJ+YxCyI=;
	b=RHAdIRYLeEJj8t+T/cdrZA2EIdG1bqbPchKzas49rp6pK70Yfh1wEn0tfMf97TMfkg
	7hYOxZIT5JFWVQF11B2EMoXweGvIovFje+F4ht2GnT4LOVeEkb/dJOzRdEU/POW/jZRi
	ZIfXfr0smVJiQyqxizzbHgdlN8hFRls6ytXbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=iIyuIpe10vsk8N1aJfOkk/WN5Zfchp+KpulgJ+YxCyI=;
	b=NaxZzTuOcEZ1Pw8PiCBkieCMsZHWCvuS/VL8lhDRHco5iwty6BqyYUN39z+hBZdTP+
	0pxNQm0ZILQ+v43C+9XwJI57iB6X2HZL1USBewgSPnwWn/wWpjRpvcg60QxyoejeDO6x
	1uJz5vNx+wXRnhRFX6HHc37c9pXKq5Q6e8UmM59SgNVR2fo+/VzpbXKZENK0EImInCVJ
	mVOdFFPL0Hopi/NOH+DWSvC61UWX3c11075WTa+VT2ILRD7H25SJVCuBJCGfoJ1UIG12
	nOpfOMXLZGP1TgdT/Qm42L8oy3aF5L3VnGHVvV7VqlKAsxNZJ66zzoMKMI0lbD5/xLwe
	cF7g==
X-Gm-Message-State: APjAAAVZTV+E/q/+RCxVzuP0Wo95Crb0EnGJsgXHVzvUqiBgGoe4Tzxt
	V/SLJ3dS0cH81IYZSGTbwFn2cqnVhKA=
X-Google-Smtp-Source: APXvYqwDgg9NILLGSlobRn3N1C6TTvkgjLYsdCyELLpmFM/YSRNw0sjhUzzXH9jf2pvqSSK1Sc95aw==
X-Received: by 2002:a1c:3281:: with SMTP id y123mr4263027wmy.34.1569531754812; 
	Thu, 26 Sep 2019 14:02:34 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id f20sm2355564wmb.6.2019.09.26.14.02.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 14:02:33 -0700 (PDT)
Message-ID: <243d7b47bc339bb2d6fa8459dfde09f14910ecd2.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: =?ISO-8859-1?Q?B=F6sz=F6rm=E9nyi_Zolt=E1n?= <zboszor@pr.hu>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2019 22:02:32 +0100
In-Reply-To: <d4bc7322-a5d8-417d-739d-31589034e1dc@pr.hu>
References: <20190926090532.4131-1-zboszor@pr.hu>
	<2d13e0b4b4ca76b8953baef89d5bd7589218928f.camel@linuxfoundation.org>
	<2d191737-5fa3-5e18-4528-c989f86e3805@pr.hu>
	<27e95708-e551-19d9-2274-94354207ad5c@pr.hu>
	<d4bc7322-a5d8-417d-739d-31589034e1dc@pr.hu>
User-Agent: Evolution 3.34.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH] classes/image-live.bbclass: Don't hardcode cpio.gz
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
X-List-Received-Date: Thu, 26 Sep 2019 21:02:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2019-09-26 at 19:09 +0200, Böszörményi Zoltán wrote:
> 2019. 09. 26. 19:02 keltezéssel, Böszörményi Zoltán via Openembedded-
> core írta:
> > 2019. 09. 26. 18:50 keltezéssel, Böszörményi Zoltán via
> > Openembedded-core írta:
> > > 2019. 09. 26. 17:45 keltezéssel, Richard Purdie írta:
> > > > 
> > > > I'm a little worried that INITRAMFS_FSTYPES can contain
> > > > multiple values
> > > > by the sounds of its name...
> > > 
> > >  From the looks of the current value, it's already contains
> > > multiple values
> > > delimited by that dot. "cpio" + "gz".
> > > 
> > > Also, according to meta/conf/documentation.conf, line 228:
> > > 
> > > INITRAMFS_FSTYPES[doc] = "Defines the format for the output image
> > > of an initial RAM disk 
> > > (initramfs), which is used during boot."
> > 
> > Also, image-live.bbclass uses this variable this way:
> > 
> > INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-
> > ${MACHINE}.${INITRAMFS_FSTYPES}"
> > 
> > The initrd/initramfs file name would definitely look strange if
> > this variable could contain multiple space delimited settings.
> 
> Also, openembedded-core/scripts/lib/wic/plugins/source/isoimage-
> isohybrid.py
> has that _build_initramfs_path function from line 143. The usage of
> the same variable in this python function also points back to the
> documentation line, i.e. it's a filename suffix and not multiple
> settings delimited by space.

This does look ok given the above. Thanks for confirming.

Cheers,

Richard



