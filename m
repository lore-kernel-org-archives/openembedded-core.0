Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4F25E7EDF1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 20:36:20 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s18so223612wrn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 13:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=y0VulA15eKTj0gCuGywntlNCCLxWu2OfxrCy4AwFLL0=;
	b=KCtfr1jOqWyt7SOoz4Z1rfMISpxZ1iQJhWQyecLvQsbOuNWHZAdYQy6o/A6pmkAmLz
	B48tviRC7Ku5g02Vg4pLdP5GHmkopb9V3ArJNJrcWsVPNKLGeslnBiWC27qHN/fnq2dS
	UVcXknyRzfL+4gYsg4Nbj9JajZz3kn0P7FHSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=y0VulA15eKTj0gCuGywntlNCCLxWu2OfxrCy4AwFLL0=;
	b=MJ9cDBr1DhLP5MyOIuMyakCyQAbtWir/iung3OAM/FEGL5Vvd3xlFS7N9O6OIsFT5n
	4wbXmuVURo94RER8//VSJ2nCGb4PCuxzVE4FfJyuh/lAKcG5oTU8/qUxQAlt3Sy+lRFt
	MWl4z+c0GuxOccHWGSaYtGMF8Ym262XD4f+d8tKTZHOyCy+FmvcjWq6KtgLrAGQiJSS4
	UADo9lNSIDgpeJDfxlDBBP2Z3j5WTGMgxbifUFynMnVpoJ5j3ZU9m5mZ+Bt55S5hHa8F
	0KG8BEIMbVEaisM2qB5d8J5xPBe2Zpe2f3L5He+UinpL9xTnrnX1IayP9R+0cmLNFi8e
	urBQ==
X-Gm-Message-State: APjAAAW39wqiLT7R34/nC3kUmi8WUaSiCP7vLt+/7W+x5oyHKobUvMgf
	Q9RqlFB6Rf7YeTVsWfaCB31RMg==
X-Google-Smtp-Source: APXvYqyLrdyYDrZFDHmr1YQfDizkb1kN8csoJt/Kf/dnF9AGw6AUvz4XC+0I80K1fYpvbP0HFRtCWQ==
X-Received: by 2002:adf:f186:: with SMTP id h6mr48836784wro.274.1567629380879; 
	Wed, 04 Sep 2019 13:36:20 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id n8sm303325wma.7.2019.09.04.13.36.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Sep 2019 13:36:20 -0700 (PDT)
Message-ID: <9bf32b8b6c59b16cb34102e362732afa2146079d.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Mark Hatle <mark.hatle@windriver.com>, Adrian Bunk <bunk@stusta.de>
Date: Wed, 04 Sep 2019 21:36:18 +0100
In-Reply-To: <2f471561-51a0-3682-57cc-4323b771e684@windriver.com>
References: <20190816194405.12751-1-wesley.lindauer@gmail.com>
	<20190816194405.12751-6-wesley.lindauer@gmail.com>
	<CAMKF1sruqPBcwobNNErkdHKAnP7zT8zda81O2FUP88u=5ZnmVg@mail.gmail.com>
	<20190827180449.GA29638@localhost>
	<5fc12556-a817-e312-e1ed-60878a97d78c@windriver.com>
	<CALBQxSsXuM+926J=A=2R=X7xPSz4htuFk3pKrJ3Zpj1uK0AXDw@mail.gmail.com>
	<32b3f42b-2ff1-79c8-2777-b9a788190969@windriver.com>
	<0f8a4a800e70afe1eef8875571dbb50e1dc8f865.camel@linuxfoundation.org>
	<20190904195351.GA21155@localhost>
	<2f471561-51a0-3682-57cc-4323b771e684@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] xz: Remove GPLv3 license checksum
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
X-List-Received-Date: Wed, 04 Sep 2019 20:36:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-09-04 at 16:18 -0400, Mark Hatle wrote:
> On 9/4/19 3:53 PM, Adrian Bunk wrote:
> > I am getting more and more confused about both the patch and the 
> > semantics of LICENSE.
> > 
> > The status quo in the recipe is:
> > 
> > <--  snip  ->
> > 
> > # The source includes bits of PD, GPLv2, GPLv3, LGPLv2.1+, but the
> > only file
> > # which is GPLv3 is an m4 macro which isn't shipped in any of our
> > packages,
> > # and the LGPL bits are under lib/, which appears to be used for
> > libgnu, which
> > # appears to be used for DOS builds. So we're left with GPLv2+ and
> > PD.
> > LICENSE = "GPLv2+ & GPL-3.0-with-autoconf-exception & LGPLv2.1+ &
> > PD"
> > LICENSE_${PN} = "GPLv2+"
> > LICENSE_${PN}-dev = "GPLv2+"
> > LICENSE_${PN}-staticdev = "GPLv2+"
> > LICENSE_${PN}-doc = "GPLv2+"
> > LICENSE_${PN}-dbg = "GPLv2+"
> > LICENSE_${PN}-locale = "GPLv2+"
> > LICENSE_liblzma = "PD"
> > 
> > LIC_FILES_CHKSUM =
> > "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
> >                     file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80
> > fdaf4a4263 \
> >                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e8
> > 0d47fae504 \
> >                     file://COPYING.LGPLv2.1;md5=4fbd65380cdd2559510
> > 79008b364516c \
> >                     file://lib/getopt.c;endline=23;md5=2069b0ee7105
> > 72c03bb3114e4532cd84 \
> >                     "
> > 
> > <--  snip  -->
> > 
> > My confusion about the patch is that it removes COPYING.GPLv3 from 
> > LIC_FILES_CHKSUM but keeps GPL-3.0-with-autoconf-exception in
> > LICENSE.
> > 
> > My confusion about the semantics of LICENSE is that I fail to find
> > a 
> > clear statement in the documentation that the legal meaning of
> > LICENSE 
> > in OE is what Mark claims it would be. Is this just Marks personal 
> > opinion on what should be done, or is this undocumented tribal 
> > knowledge, or is the exact semantics of LICENSE documented
> > somewhere in a language that lawyers understand?
> > 
> > My guess for the latter would be "undocumented tribal knowledge",
> > and clarification is required what is actually correct or incorrect
> > here. And I think this is also what Mark was asking for.
> 
> It -was- documented at one time, but I suspect that documentation was
> revised
> and the language was lost (or it never made it into a final version
> of the docs.)
> 
> This is why I was suggesting the TSC weigh in, and just clarify that:
> 
> LICENSE = is the _source code_ license, and only includes items that
> are or
> could be included in the making of the binaries.  This does NOT
> include
> autoconf, automake, makefiles, etc that are only used during the
> build process,
> but not in the sources used to build the outputs.
> 
> LICENSE_<pkg> = is the binary license for a specific package.  It
> defaults to
> the same as the LICENSE.

Historically, most m4 files don't include their license. This meant
that we haven't accounted for them in LICENSE. Where they are present,
we've tended to turn a blind eye to them as they don't cover the
binaries produced which is the piece of key importance to most people,
this recipe was one of the ones which attempted to clarify the
situation.

I suspect we do need to include such things in LICENSE since for
example these licenses could have an impact on the license of output
from the source archiver for example which might include build scripts.

The result is rather ugly but licensing in general is :(

It also gets tricky as we delete many autoconf files and regenerate
them. You'd hope that was under the same license but...

Cheers,

Richard





