Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2B1236C13D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 14:52:48 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id q1so3145721wrp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 07:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=/E2sC4rhj/lZB80rLfXulW9x9n8WisSqCOtwwhekAgM=;
	b=HhXXZsCQb8b3qTZ0XZ6Fy3pz1+RHC25Oyc/J/YQO+iLU7LbteC5+41qfOsdS67jqV6
	4f9QIYqJtdYythnDVAWPetvioSaX8snM1V+qfuUvh4hvxX82JE6d0qxYPzLuttZfY/MT
	QjZ7etTe2XMnpt4D9PLprUysT0Q2SA0G6uPWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=/E2sC4rhj/lZB80rLfXulW9x9n8WisSqCOtwwhekAgM=;
	b=qqcFDQAr1j0Zgu1WxjL6yTw0mhhfpkNA19y28mShyliXKm6SdCPQBuBqGzZlfWDsTD
	/BvCd9XPvKnq7ximPvNcdv9Nc7Bg+1Q5drShdyBM2G51iEwoIkp5QOsjD1S18gDFkPKQ
	jsq+gFTwan39mpwmkkPd1uBV7qID4b/jeuW7gOIY8Hz9zzJEs5jJ31SIt8cDIr2LV7ua
	GyCuIxAu2PqISDgAL0ZTbHTDt12x3ZC8OCcf/yKpFYe6UmY0HYUnyiIOlMnyeUYG8EgT
	fRqvw9b6FdOBrNBBWUcWiyl+cr95MAnoR3y5f8jFs+6z/dJi3bvKiof+YaxJYhQISmtB
	F9bg==
X-Gm-Message-State: APjAAAVszAcURENdD6Qe/BXP4LszATT1BZCNMbnLiiNC3+gZRf/MXxbf
	9MWLUrBxT4znF5+IWFTt0g3ieA==
X-Google-Smtp-Source: APXvYqxmcyZxZaoz74jw/9Oz+tfxcuODEoNios2WTPsi/bMJ8y0XFwUBkAq3Rs16dqfdDVJoYzTppQ==
X-Received: by 2002:a5d:4d42:: with SMTP id a2mr12794062wru.130.1553093568871; 
	Wed, 20 Mar 2019 07:52:48 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f21sm2948894wmb.37.2019.03.20.07.52.47
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 20 Mar 2019 07:52:47 -0700 (PDT)
Message-ID: <316b77e559762bf3f90d39f98463c3cf84469dd8.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Wed, 20 Mar 2019 14:52:46 +0000
In-Reply-To: <4881796E12491D4BB15146FE0209CE6468224CFD@de02wembxa.internal.synopsys.com>
References: <4881796E12491D4BB15146FE0209CE6468224B73@de02wembxa.internal.synopsys.com>
	<861e1a12b82944f7a363d4f6f10b8f54340df1fb.camel@linuxfoundation.org>
	<4881796E12491D4BB15146FE0209CE6468224CEA@de02wembxa.internal.synopsys.com>
	<bf8d76f02a71a362cbc1dd9faa68014ed68d9569.camel@linuxfoundation.org>
	<4881796E12491D4BB15146FE0209CE6468224CFD@de02wembxa.internal.synopsys.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu: backport patches to fix cves breaks qemu-system-native
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
X-List-Received-Date: Wed, 20 Mar 2019 14:52:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-03-20 at 12:12 +0000, Alexey Brodkin wrote:
> Hi Richard,
> 
> [snip]
> 
> > > > We're not seeing this on the autobuilder, is this gated by some
> > > > non-
> > > > default config option?
> > > 
> > > Maybe.
> > > 
> > > But if you grep by qemu sources you may notice that indeed
> > > VENDOR_ERR_INV_NUM_SGE is not defined anywhere. So regardless of
> > > my
> > > setup
> > > that looks like a valid and expected build failure.
> > > 
> > > At least that was the case after I fetched OE-core changes this
> > > morning.
> > 
> > I don't doubt it, I'm just wondering why our testing didn't
> > highlight
> > it...
> 
> Well that's indeed strange as this is host package and so shouldn't
> have
> anything target arch-specific.
> 
> But do you build "qemu-system-native" by autobuilder?
> Just a guess...

We boot test qemu using it in many places, so yes, very much so. Hence
why I'm wondering what happened...

Cheers,

Richard



