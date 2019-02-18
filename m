Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 458CC7C84E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 18:12:38 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n2so7256311wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 10:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=/NpkNpAdmvZl88b0eK9PN6kJvwodWfLpG4x9k3zdXt0=;
	b=NYsOdCMbQZjq265oxncNDSbCFXs0sd5J/62x4PhEnC/lR4OrMWHdSgibiMb4zuvDz2
	gPwCfWX9IFgJHJnX0Rkp2HuhbbAblVNhtV4tYDb4VTes/JQtwVyPu8IpUXoZVlUmOgNH
	b+xCFMJvBoiznnAWwtasdSz/430o9nk44Sz9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=/NpkNpAdmvZl88b0eK9PN6kJvwodWfLpG4x9k3zdXt0=;
	b=W7JeBov0AWYVdLixDiYkmTsNl3rPRHW1l/Cw/x/+sVX2YqjnS+7878XcbsnR4ICTtL
	2SGbF+eLIAM+U33yP1QdnTU/5aXbi1IP59LYoljX5J7lISkWwTMhYpVr+UUFB/fU54pz
	0epoCMmhbzngOKzr3v+2vfejqbOO2oSXYG+4uaCQ+WDuZy6CtotRv1siuPMn+5SD1Dyp
	D6cI7adq4BpfoEiJzUUEZ2pGefHjoJigcJrkgVTGYl4lM0lqoYxTIEVuznAQDG5QNxIq
	T+W5WvPb2u1CoYvSSJLpQgYIFa1evimZk9kh4mqQ/q+MTplAWwpi/BsGSEbScvkjbrdR
	EGgA==
X-Gm-Message-State: AHQUAub1RzZ2RHxGqnQPfx5fcItZCzG2v7DNDyxfjlYParBS5c7KNPCM
	3+RMTgV3PVyecVTPondqVMsTOg==
X-Google-Smtp-Source: AHgI3IYgkE/TMhJKl7mh7/7ksHA4f7zrVZ15Y+YVPyn+lqKvH6dF4IBdZCcWeLW9gQ2b/R7yLmpT2g==
X-Received: by 2002:adf:dd10:: with SMTP id a16mr16799869wrm.37.1550513559548; 
	Mon, 18 Feb 2019 10:12:39 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y13sm7526940wrw.31.2019.02.18.10.12.38
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 18 Feb 2019 10:12:38 -0800 (PST)
Message-ID: <730c5d1fe48cd4ed6063e0434271e3ab97ccd66e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Feb 2019 18:12:37 +0000
In-Reply-To: <CANNYZj_XPBcXkqEkpkRZNqY6YQZTq0iNOmxa7HJZP77kUUZ_5w@mail.gmail.com>
References: <20190218132948.27668-1-fabio.berton@ossystems.com.br>
	<20190218132948.27668-2-fabio.berton@ossystems.com.br>
	<b44b056e67f02f40a40be9cef5614123b1caf906.camel@linuxfoundation.org>
	<CANNYZj_XPBcXkqEkpkRZNqY6YQZTq0iNOmxa7HJZP77kUUZ_5w@mail.gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] mesa: Replace dri-native with dri for native and nativesdk classes
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
X-List-Received-Date: Mon, 18 Feb 2019 18:12:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-02-18 at 15:58 +0100, Alexander Kanavin wrote:
> On Mon, 18 Feb 2019 at 15:18, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> 
> > I think you need to leave DRIDRIVERS = "swrast" here or the x86
> > appends
> > wouldn't have swrast listed?
> > 
> > Do we really want to limit the native version to swrast only? This
> > seems a fairly major change of behaviour and not what the original
> > code
> > was intending?
> 
> Currently the native version does not build any dri drivers at all.
> This is intentional: mesa-native is used only by virgl, so I made the
> most minimal possible configuration for mesa-native so that a) virgl
> works; and b) build time is as short as possible.
> 
> With the switchover to meson, dri support is enabled only if also at
> least one dri driver is enabled. swrast seemed like the best choice.
> 
> If/when we have more use cases for mesa-native than virgl, we can add
> other bits to the configuration.
> 
> Hope this makes sense.

That does, I think the patch still needs DRIDRIVERS = "swrast" though?
The details here should be in the commit message too.

Cheers,

Richard


