Return-Path: <andre.draszik@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id A422E77E58
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 08:24:58 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id u62so1167741lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 01:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Zrxy//XzcevtwFEf00YVs/J2lVfxzTkpg8ZNkLQh++w=;
	b=OxdrvgcPniE8jGzaiv5S6U5pmosdgceQWkU+YN3whpcrfamWvE8DHExGPlWCkf0ZS/
	8lAfqO+uprx53g+I7ZDb8udGtx2TM7aTejh/U5Qqev8VsLLoHFbrzKO7JzvHkT5Q/MFD
	c6xATcBsJhw+2eh6pp0TrWIuaXrKpOklo9XFpJ/0vfZ8OzKyohxb2XsTi79CkiT8Wjm+
	uZteuUe4uXSPXDmP0I9kOymlMZ2xfAnz2B23Z6djshf+eTb8EtaflBI+JZm/8l81VdV5
	gdkyiIiOG7tV+obPGhoaItI/awrHzWI0Vab4eGlWIBRVagihvRGBuIOgj8TndmNsfZIb
	DeVw==
X-Gm-Message-State: AKS2vOw8PdXl+Zw6ZJEjXalcgqMStseFhbWMRcNgF/sFFvK9q7aGE6NQ
	2bFhvDpgO7H5CpAGFjm3Tw==
X-Received: by 10.80.225.8 with SMTP id h8mr1716057edl.21.1498119899536;
	Thu, 22 Jun 2017 01:24:59 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id z31sm602039edd.17.2017.06.22.01.24.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Jun 2017 01:24:57 -0700 (PDT)
Message-ID: <1498119896.25895.13.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jun 2017 09:24:56 +0100
In-Reply-To: <CAMKF1srvQxvQasFKo_Gc9eYO5KmCbnsEnTw34UhkvjnGK+fxqA@mail.gmail.com>
References: <20170619101917.31865-1-git@andred.net>
	<CAHiDW_FCUwov8fBMZMSs+yaDms6oNWMgSfua4LEW8JezntGrqA@mail.gmail.com>
	<CAMKF1srvQxvQasFKo_Gc9eYO5KmCbnsEnTw34UhkvjnGK+fxqA@mail.gmail.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [RFC][PATCH] tclibc-musl: use musl's virtual/gettext implementation
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
X-List-Received-Date: Thu, 22 Jun 2017 08:25:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-06-21 at 12:27 +0000, Khem Raj wrote:
> On Wed, Jun 21, 2017 at 6:27 AM Jussi Kukkonen <jussi.kukkonen@intel.com>
> wrote:
> 
> > $ bitbake -k core-image-minimal core-image-full-cmdline core-image-sato
> > world
> > That seems to fail with musl on the autobuilder with "Nothing RPROVIDES
> > 'gettext-runtime' "
> > 
> > 
> > https://autobuilder.yocto.io/builders/nightly-musl/builds/313/steps/Buil
> > dImages/logs/stdio
> > 
> 
> Andre can you take care of adding it

OK, I'll have a look. core-image-minimal works fine, the other targets
require GPLv3 & X11, which might take me a few days to set up to reproduce.

Cheers,
Andre'


