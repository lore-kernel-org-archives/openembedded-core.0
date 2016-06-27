Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3538A60797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 07:03:52 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id l188so148908559lfe.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 00:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=G/9qBtIoSqoMzf3KSrwl5YWSYiQuDd+ut2tw3u+jNZs=;
	b=Jb6EXJkq576O3o5qFktoyI5MIQ0Iwsjflk9xpkTtOMT1KCieIJZINjteqG5fwYwXL9
	XPeOu44RttnP/L/+Cq9wEfp5iBNcPVGjrMnrF+qc11bZW2NoFA1z5O4LWuO1/+GJLefv
	5YC4NDll1F+gDOLBq4H+aLNkls6yYLPjCchIOZcOpJQkW22KrDgKUf6d3ahTIzwuOEaO
	S+HgtUF9tN4i7jG9dj4S8DDT6bZpyRnQLFpPEsP8DYMbaMJdzX1zT/W/8uKf/KCrw5ey
	5uBk+9gMmAkFzzDibafq2RiUZcVgZwRsElLwM8rKtjBw50bUKbY4lta+PaNsXNkhrmPa
	9lRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=G/9qBtIoSqoMzf3KSrwl5YWSYiQuDd+ut2tw3u+jNZs=;
	b=N+Y4Nk6gmiwX6nw3PcMWzIGWCIRlHJHb2WbKaq3a6I5exuKaw1Os8B+OzxkRrPmkhn
	3t9ANgkT7Xm36EACQW28PN5yu/Z2KTOoO/bhAlLWOGgIYNjrnBZX41EUHVEJ+EfdOu+U
	7QOtq3Og7DxjvfBRW7t5PK9assnhp9R0IxgvfFk3vyu60sqYDwQa4dQEAeMhbaxzpNl4
	i1SaWN09KJIgAXJ0bIiRZwtCNOknpMD9Ke65ir+O7t9R16pr8X7eqgGGXyRXRuRsaRmG
	gVDiKls6O/dRDep6AvuSpTTEyrpuM+BhBPIYbv1dpLsfIMgWrHH66u/fh9uhVpGsyVt4
	+cEQ==
X-Gm-Message-State: ALyK8tJS9ZpISkInGFqIEpklihDC5JU/QQDJG4mr3IAP4pO6mSdDOVvEhaQY3gEmTte4EQ==
X-Received: by 10.25.1.65 with SMTP id 62mr5247934lfb.54.1467011032076;
	Mon, 27 Jun 2016 00:03:52 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-218-130-no126.business.telia.com.
	[213.64.218.130]) by smtp.gmail.com with ESMTPSA id
	u21sm2830412lja.16.2016.06.27.00.03.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 27 Jun 2016 00:03:51 -0700 (PDT)
Date: Mon, 27 Jun 2016 09:03:49 +0200
From: Anders Darander <anders@chargestorm.se>
To: akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
Message-ID: <20160627070349.GA20550@ad.chargestorm.se>
Mail-Followup-To: akuster808 <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1463979792-7559-1-git-send-email-anders@chargestorm.se>
	<574294A2.9000806@gmail.com>
	<20160607073112.GC3930@ad.chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <20160607073112.GC3930@ad.chargestorm.se>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: [krogoth][PATCH] lib/oe/rootfs: Fix DEBUGFS generation, without openssl
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
X-List-Received-Date: Mon, 27 Jun 2016 07:03:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping.

What's the current status?

 Anders Darander <anders@chargestorm.se> [160607 09:31]:
> * akuster808 <akuster808@gmail.com> [160523 07:29]:
> > On 05/22/2016 10:03 PM, Anders Darander wrote:
> > > In commit 20ea6d274bb0a9a5addb111f32793de49b907865, debugfs generation
> > > for images using opkg, which included openssl was fixed.

> > > However, that broke the generation of the opkg-based images, that lacks
> > > openssl. The error is a python stack trace, showing that shutil.copytree
> > > tries to copy a non-existing directory.

> > > This relates to [YOCTO #9040].

> > > Signed-off-by: Anders Darander <anders@chargestorm.se>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > (cherry picked from commit f6b0b260ce18a30d04edfb0afb7942b9f9a5480b)

> > pulled in.

> What's the status of this? Waiting for autobuilders?

> Martin sent a query for this patch last week.

I'm also eager to get this into the krogoth-branch. I'd like to enable
debugfs, though, I'm also trying my best to not have to fork the krogoth
branch...

Cheers,
Anders
-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

