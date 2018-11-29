Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 80B106C676
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 16:34:19 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q26so2876389wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 08:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=rnxede3BrHaZdTde0DeFzrz5qiOZ2y7yxSx8RVHwgJ8=;
	b=D9/uk969QTFV1sMzMuJo6BglpJRgEMYMAnBEobNhyvOA2hccYGEg7AbbUWLDoxO7ot
	lk2EnxykC8+e7Sw/X48eWiuCS9TLrqNEWFdVImk0ZX7E0qyRKITu/psKhH3vtak74bD+
	9fK81GoU+HhkQf2PhwaaU/12U87xNsN8G7Yyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rnxede3BrHaZdTde0DeFzrz5qiOZ2y7yxSx8RVHwgJ8=;
	b=l0PIcE8q1/lgmdnHuf/GxJOhwKmyaxND9dx4BiFMiF+ZrsreseCXBI3Cnm2oQae28q
	Pd2ZmVmV94k/hoe69u4YZVQNe2Nwz48UbjYHN0131NiBlZkbYDkBzhjMgagc7S4xj4pi
	YSoLTcWozLzhAq4srjSdzRjByk1Y8RiayR5424W2NHFBja6zEofi81TKFEi6M/tIASfr
	ubprGMsdBPJWeDb6pTG/sTisGvIyMS0QW4NwMp9Rkn3d8m0sdbmZjHLcumDDEH9i79VG
	2/QppGFY6gmSUgj+b+Xj4s1GgwKfhmFKGEIyH1gXtrNX5Xe2+qYpknt/WEy1Qf6fp9SE
	w7Bw==
X-Gm-Message-State: AA+aEWZdexWPxHHxeCNps0J++ecAbrjwEarfbI2zRKx8GQp2KproXqGH
	LAnj9X7ppgXiB2IIZqW+oeqXMQ==
X-Google-Smtp-Source: AFSGD/UpAQAD18mplkWDsZRWG9xmMgFRmEN7LW2sdOJ2RaQFyf8t+aKlXXqaKvBxHjslBoldRo4Mdg==
X-Received: by 2002:a1c:410b:: with SMTP id o11mr2389440wma.109.1543509259999; 
	Thu, 29 Nov 2018 08:34:19 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x186sm3464324wmg.41.2018.11.29.08.34.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 29 Nov 2018 08:34:19 -0800 (PST)
Message-ID: <ac6f138244a86d16287b51c26dbc8e2f72dcadc8.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Mikko.Rapeli@bmw.de
Date: Thu, 29 Nov 2018 16:34:18 +0000
In-Reply-To: <20181129141709.GB10799@hiutale>
References: <1543494097-19534-1-git-send-email-mikko.rapeli@bmw.de>
	<1543494097-19534-2-git-send-email-mikko.rapeli@bmw.de>
	<335a4290d941021b84a2b0447e2017774d0e5259.camel@linuxfoundation.org>
	<20181129141709.GB10799@hiutale>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Cc: Michael.Ho@bmw.de, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] RFC image_types.bbclass: add image size limit for tar image type
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
X-List-Received-Date: Thu, 29 Nov 2018 16:34:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-11-29 at 14:17 +0000, Mikko.Rapeli@bmw.de wrote:
> On Thu, Nov 29, 2018 at 02:04:14PM +0000, Richard Purdie wrote:
> > On Thu, 2018-11-29 at 14:21 +0200, Mikko Rapeli wrote:
> > > If IMAGE_ROOTFS_SIZE_LIMIT is defined in image configuration,
> > > then
> > > build will fail if for tar image type the uncompressed tar ball
> > > size
> > > exceeds the value, as reported by 'du -ks'.
> > > 
> > > This check could be extended to other image types as well.
> > > 
> > > There already exists a check with IMAGE_ROOTFS_SIZE variable
> > > but I could not figure out how to actually use it. It does
> > > some quite complex overhead calculations which did not seem
> > > to work for me on sumo.
> > > 
> > > When the image size is exceeded, build fails like this:
> > > 
> > > ERROR: image-1.0-r0 do_image_tar: Image size 170712 of
> > > /home/builder/src/base/build/tmp/work/linux/image/1.0-r0/deploy-
> > > image-complete/image.rootfs.tar reported by 'du -ks' is larger
> > > than
> > > limit IMAGE_ROOTFS_SIZE_LIMIT 170000
> > 
> > What about IMAGE_ROOTFS_MAXSIZE?
> > 
> > I think IMAGE_ROOTFS_SIZE is about adding extra space to the image,
> > not
> > limiting its size...
> 
> Yea, forgot to mention that I tried that too but got inconsisten
> results.
> I know it's bad but it was easier for me to add this new test than to
> figure out what's wrong with current yocto image size checks. Hence
> RFC.

How would we document this new variable? Recommend users to set both
and hope for the best? :)

Seriously, we need one good way of doing this which works. That means
either you debug the IMAGE_ROOTFS_MAXSIZE option or at least file a bug
with as much information as you can about the problems you're seeing...

Cheers,

Richard


