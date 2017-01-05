Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id B9A8271A66
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 10:35:32 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id c20so324178558itb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 02:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=GV/hpLKnWtGwlnPsA2w0Bg4KrJCF6AgA4IfmsnkQ1sM=;
	b=B6sQjRx10FVSJnkiKhrYWvRnYrXS85F28aFNn31x5z0181alFABDrcGkqmXiB9gIQv
	ZWiiNL9X9HtS5z+CeNYdQEISwxI6/M/vL7zKynO6rMXtmg2FzWukp4GKx4oPGZibD/gW
	Xza6JePuN5qn9Do0G2K6TYCCTuwnHhGNn1KxhpKAzRqzSOQFHEDCUOEUtEOJZrfJZpj5
	2FjLghcMjIaaywTqAaSDv9gCpioxtd0azCBzi5RqaKaNlp8YuGdK5F0rhbUaZWcBghsG
	TqEjAiR8rj0Cu4FCG6F2e+9ih5Qcx2INDN3DbGdSo21doYgkFVEqw9EFezUO2JV87IDy
	upXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=GV/hpLKnWtGwlnPsA2w0Bg4KrJCF6AgA4IfmsnkQ1sM=;
	b=U86URIcVs6cWpTHa0yJWO86oK2SxwuQpiUjTdmo7OPKviqJJIqs4Ric8ATnIuxENaX
	Hu3mI9/1VVW5e4ptglo+5QnqpDFJW1gUlTz28ngyL7CyvbEuwZtPI8QQL3tOt55In6vs
	5ls25I1LoXJ+iw4k5Ll8jqxaCRXBEB5lZ7U6N8YxusDPyQkvbzDLScCy1wybtcVKVnvu
	qGuvHEAUBL/3e3jtc/dDG9hN3dPKHUyBSuxOCDyUb0Z6G6lAXBpp7T7HQU5FoipSbjhl
	EDJhzQrelnukSg6eXntSLJlA8OOu5Jxp4Ep/Os0IuaKhysW1r56qQ/+fkGpoV6nEFOsp
	AuvA==
X-Gm-Message-State: AIkVDXK1IRPJwF8xiApC7NCCOKpXrQHIa3DHiZQ6Dvr9bilV6bCJ0c9LvXToCOo+1dVzHLGI
X-Received: by 10.36.64.75 with SMTP id n72mr58603738ita.105.1483612532715;
	Thu, 05 Jan 2017 02:35:32 -0800 (PST)
Received: from pohly-mobl1 (p5DE8FAB5.dip0.t-ipconnect.de. [93.232.250.181])
	by smtp.gmail.com with ESMTPSA id
	w18sm3531051iow.19.2017.01.05.02.35.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jan 2017 02:35:31 -0800 (PST)
Message-ID: <1483612528.28169.74.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 05 Jan 2017 11:35:28 +0100
In-Reply-To: <1483606265.4367.75.camel@linuxfoundation.org>
References: <cover.1483570577.git.chris_larson@mentor.com>
	<CAJTo0LYepu3mAAc=Y76RxBW20w1gEVH1+ms7gpfmSTB-ePfrcQ@mail.gmail.com>
	<1483601563.28169.69.camel@intel.com>
	<1483606265.4367.75.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] Add opengl to REQUIRED_DISTRO_FEATURES for some recipes
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
X-List-Received-Date: Thu, 05 Jan 2017 10:35:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-01-05 at 08:51 +0000, Richard Purdie wrote:
> On Thu, 2017-01-05 at 08:32 +0100, Patrick Ohly wrote:
> > On Wed, 2017-01-04 at 23:49 +0000, Burton, Ross wrote:
> > > 
> > > 
> > > On 4 January 2017 at 22:57, Christopher Larson <kergoth@gmail.com>
> > > wrote:
> > >         These aren't buildable without it, and adding it fixes oe-
> > > core
> > >         world builds
> > >         with nodistro (which does not have the opengl feature by
> > >         default).
> > >         
> > > 
> > > Am I still the only person who thinks skipping of recipes should be
> > > recursive, so if say libx11 throws a SkipRecipe then everything
> > > else
> > > that depends on it is also magically skipped?
> > Not at all, I'd also prefer that. If recipe "foo" has some obscure
> > conditions when it can be built, then repeating those conditions in
> > any
> > recipe depending on "foo" is a maintenance headache.
> > 
> > Last time I brought this up, it was mentioned as advantage of the
> > current approach that conditions are explicit and thus less
> > surprising.
> > There's some truth to that, but I don't believe that it outweighs the
> > disadvantages.
> 
> Imagine for example that we accidentally add some condition which
> results in 50% of the recipes being skipped. "bitbake world" would pass
> if this auto-skipping functionality was implemented. I worry that it
> would make it really easy to hide some subset of completely a non-
> buildable recipes which we can't even easily identify other than
> directly trying to build each target. We added something to avoid that
> (the world target).

Shouldn't it be caught by QA when expected functionality suddenly
disappears? But I guess that would only work in a perfect world; in
practice, QA coverage isn't sufficient and some recipes are indeed
merely in a "we know it compiles" state.

> The second problem is the actual implementation of it. I've never come
> up with a sane way to address this problem and give errors where people
> would want them yet hide the cases where people really don't want to be
> bothered, its very hard to make it work well at the bitbake level and
> the code is already complex/fragile enough.

How about a compromise: instead of repeating some (potentially complex)
checks in every recipe affected by this, could we have a "skip recipe
foo if dependencies are unavailable" check?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




