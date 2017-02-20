Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id C5A3971BF9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 14:14:15 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id 203so72875076ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 06:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=JSzl6FmEa5eCn4597on9RREQibYkU4iNVVKD1gyNVVE=;
	b=Nayo7QUHt1L8GyP/CLk/p9pKfkkfKJGmS+ifMV3cl+nBDIYmE+CsdWJheYqriUCjMR
	nTggZCV9wCuoLFLbnbBr3OP2zulh/slxg6iE1g9Vwq+oIhKzeHbYuvGy/EeoEPPxPSq6
	PehZG5fLkbm6IbeM6IajDTVBQQfgnvQAnSu74C4WrSY3bEVt+I96l0f43mh8uoqRrI5U
	ZQ+6SDNBKJFmo8X1fc9w3/mR1YckTcHoSLcti2fbVw9ARz6dB19Tlp6MNQw59gVbjNFA
	yPHQpCJzrlWaaKpehXKuOq4b4JCSd7KhdL67NyQQ/sleoIk2N3wIdDKbLwxQGatvRoIP
	HnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=JSzl6FmEa5eCn4597on9RREQibYkU4iNVVKD1gyNVVE=;
	b=fI7Nu1L7ZnmxEyXvEzghd2EdUg1GNLY9aXW9fTd3OdURSI7QaQruJnmjZ/UQl9t6ZW
	128PTIU74uX+psOKb17Mof2SmOR56K2jBFkl1+79crWL13RUuhoVqkj6TFvkcK5AZJvu
	61tjsRsBycVxkB3nnFlanxB5yLWGg8MrttqVon15MWKlyIwF1bmttw18daFbCn16vXH4
	Q8ZNIQKGoHwlitapMOAJ52rG3Al9JAEg3w0OBkjSzfdaNIIazue4OpxUBBKON3PnjvFG
	y4p+/d6yFApIHsZ+yf6kEIdsWTnjO5DvrPRQ3l3g1f6Bj2t+01axGcAWiEwPNpOROQVs
	N4ew==
X-Gm-Message-State: AMke39kjTEjIs60fMZTDrFAGztCsRl93rYLPIwxZjyvPc+NZsnRugDHMzHdt3YBQ25H7PmxS
X-Received: by 10.36.82.82 with SMTP id d79mr11938804itb.29.1487600055829;
	Mon, 20 Feb 2017 06:14:15 -0800 (PST)
Received: from pohly-mobl1 (ip-64-134-128-59.public.wayport.net.
	[64.134.128.59])
	by smtp.gmail.com with ESMTPSA id k16sm4942728itk.2.2017.02.20.06.14.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 06:14:14 -0800 (PST)
Message-ID: <1487600053.4285.49.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@intel.com>
Date: Mon, 20 Feb 2017 15:14:13 +0100
In-Reply-To: <1487543179.17001.15.camel@intel.com>
References: <CALbNGRSgxbz1F2YLzQ-F2Fn+01hiA4LAoDgQuQ-qLg9KMVTHAw@mail.gmail.com>
	<CALbNGRR1+yVyMC1O1G1mCYp8e87Q2kucGEgs-dL0P3KHxi8WCQ@mail.gmail.com>
	<CA+chaQcHBzDJ4UbW1NCex70T56PL02+agOZBMoK4=Q1WWSm2EA@mail.gmail.com>
	<1486999455.13854.241.camel@intel.com>
	<1487005422.13854.247.camel@intel.com>
	<1487067990.13854.328.camel@intel.com>
	<1487543179.17001.15.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Does recipe specific sysrooot (or whatelse in current oe) break native dependencies?
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
X-List-Received-Date: Mon, 20 Feb 2017 14:14:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2017-02-19 at 14:26 -0800, Richard Purdie wrote:
> On Tue, 2017-02-14 at 11:26 +0100, Patrick Ohly wrote:
> > My testing was flawed: in addition to the RDEPENDS there also was a
> > DEPENDS with the same entry, and despite what was said earlier about
> > build dependencies, that entry did have an effect. So it is a bit
> > more
> > complicated.
> > 
> > The way I'd expect this to work for native tools is this:
> >      1. DEPENDS should be ignored (build dependencies like compiler
> >         which are not needed when using the resulting tool)
> 
> Firstly. this is not true at all. Native recipes have build
> dependencies just the same as target recipes.

Yes, of course. But here I was talking about installing an already built
tool in the RSS, and in that case the build dependencies are not always
necessary anymore.

What I hadn't considered is that there's no packaging and thus also no
analysis of ELF files to detect library dependencies. Without that, one
has no choice and must install all DEPENDS, even those that only provide
build tools that aren't needed anymore.

I'm not suggesting to add such packaging. It's another big change and it
is not clear whether the reduced size of the resulting sysroots really
would outweigh the extra costs and complexity (for example,
boot-strapping the ELF analysis).

> By comparison RDEPENDS of a native recipe are only needed after its
> been compiled and we're about to run it (at least by definition).

Let's focus on RDEPENDS.

> With a little more digging, I realised that base.bbclass does:
> 
> do_prepare_recipe_sysroot[deptask] = "do_populate_sysroot"
> 
> Note that this is "deptask", not "rdeptask".
> 
> The lack of the "r" means it will work off DEPENDS, not RDEPENDS.

So just to be clear, all RDEPENDS* variables are currently ignored when
populating the RSS. I think that's what surprised me. Some sort of
support for it also in the native case would make sense, because it is
cleaner and avoids rebuilding tools when only they runtime dependencies
change.

We just need to agree on something and then make it work. I propose we
use RDEPENDS_$i for i in PACKAGES, because unsetting PACKAGES in
native.bbclass when used via BBCLASSEXTEND is a hack that already fails
in some cases (like the PACKAGES_prepend that I mentioned earlier) and
because it is more consistent with target recipes.

To handle that case that a RDEPENDS_foobar pulls in a dependency that is
irrelevant because the foobar package would have been empty and skipped
if packaging was done, PACKAGES_class-native can be used to set a
smaller list. What about RDEPENDS for native-sdk? Does it matter there?

Can do_prepare_recipe_sysroot be extended to consider both DEPENDS and
RDEPENDS_$i?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




