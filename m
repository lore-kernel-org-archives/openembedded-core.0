Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
	[209.85.217.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA337DE17
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2019 18:32:29 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id o10so4197068vsp.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 May 2019 11:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OsdeFila2lrtuTk27JTU2EfibwLS4FJ6KlJ+Y/kcuKE=;
	b=MiNE0d+moVdi+FQUrqT4JeO3XbeV6yLbFjOlbmFpOuK4vQFjIGPfktsWOAgxCpz5zs
	Pf0eiVv/ypg+jdiaW4U5IOuqyTJjGgnBMeQFA+zrBmEmiLfNr1Gdp7UNW0rFf7x/Ttdo
	aw03AKeFzVfwRD/Xq1tw/YYSOnsN29J6dk5TJPp6taokVulqavWzIi7NDJu/JLvUkjAH
	KN9UdGVeorJW7Jl2bPdzJqe4BS4w4Mc8csOq5Hri3IWOXWMpCNUdc1HzYxD3ggdSqqrj
	R1eByCcOHTvPSpJNae0MFI1PpGSiS4pUUegdck6dstsv7evHuH1X4xZlaMmVrUCf4nut
	y9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OsdeFila2lrtuTk27JTU2EfibwLS4FJ6KlJ+Y/kcuKE=;
	b=HqRoP2WTIRIU6W+TBuJuch2+412eVSIjF5sGfa9elXwG1hSyDnx3gPQcsaFzQeLWy5
	3w9TsYQSroszgSNpByHbhM0zMkKEMDvwSF5OqBdT8USNKGdy9OL5qdgxPZIBRcTBIX9a
	l4AbhZVj87pd/Uuh0wssxW6NJsNn5X5m7pYu8oFjNZb34XsE4ecz5x+MNlx8lT4z9BYZ
	AbZY67rCy+dBBUhcZng4/ueCjp9vSEmwCW6P9HqnbPjh5JXbImy694kpTOPNeOClGCTN
	U6S0U7jWiryatLqxP10CjPhiFTfD5Pt/PZu4Uv8YFNXOSD2qdd7LCtw06Bx2PTKJ9Jr3
	3e9w==
X-Gm-Message-State: APjAAAUl6SPVjXLTDjDbkQr1HVxJfkyTr2hCoCSHuvy/UijSWVi0gn5f
	2s0H6/OKz2YgZorpJ3Dx1i8Au0abMNB4C6ygkoU=
X-Google-Smtp-Source: APXvYqzbOgHHyEGsteQieID6vaekrdeOmn6Tn9lB9Wka+OGPgRrPZvu7pVFJ8AkEzNLjd2FepDR6b3np62tNmYUMFwM=
X-Received: by 2002:a67:af10:: with SMTP id v16mr365020vsl.149.1556908350917; 
	Fri, 03 May 2019 11:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190503164734.130778-1-alex.kiernan@gmail.com>
	<CAJTo0La=VGkcFe+EZ49ki9Bb2-z7kVoOGDN7i8wcVcc6iVitMg@mail.gmail.com>
In-Reply-To: <CAJTo0La=VGkcFe+EZ49ki9Bb2-z7kVoOGDN7i8wcVcc6iVitMg@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 3 May 2019 19:32:19 +0100
Message-ID: <CAO5Uq5QRMd8w+apv6vYiOKAdvDdkFSB2oz1bWZfyX8G=hs2Vqw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bmap-tools: Add RDEPENDS on python3-misc
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
X-List-Received-Date: Fri, 03 May 2019 18:32:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 3, 2019 at 6:34 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Fri, 3 May 2019 at 17:48, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> > The newer python3 recipe no longer includes python3-misc in target by
> > default, leading to failures:
> >
> >   Traceback (most recent call last):
> >     File "/usr/bin/bmaptool", line 6, in <module>
> >       from pkg_resources import load_entry_point
> >     File "/usr/lib/python3.7/site-packages/pkg_resources/__init__.py", line 42, in <module>
> >       import ntpath
> >   ModuleNotFoundError: No module named 'ntpath'
>
> Looks like ntpath should be in a different package if pkg_resources
> won't run without it.
>

Sorry, should've looked more closely... I'll take a look at it.

> >  RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptools python3-fcntl python3-six"
> > +RDEPENDS_${PN}_append_class-target = " python3-misc"
>
> Why class-target only?
>

It doesn't exist for native (which was a surprise).

-- 
Alex Kiernan

