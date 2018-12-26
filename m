Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id D83BA606B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 11:09:46 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t6so15368351wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 03:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=/sTmU/DMd+BcxEgbQQivKsV2oGIu0We7N5K/q26FsaU=;
	b=WYahoEjj18oatXEggFbVNuBIOoNjxCraOS0wMhW0IIdxNz1fAtR16ElkUxUY65+80T
	BMUn03nTi1cX6kxBE5QslALulbm4jPCVJ8OGQplsXX4slkHA0gpre6PvWnSMrV146GBj
	gHTr20OTbnd7HeMwfXklXzWcOSOR1hGaLTVBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=/sTmU/DMd+BcxEgbQQivKsV2oGIu0We7N5K/q26FsaU=;
	b=D1ahXHDeqPCIr8OYa9A1mgEpc8n7TboTgFN6V4R/ld4uR4gOni/xNaEcAJBCf5KhLO
	CbZ+5QnNWU4KkKdFCeTGXh+Ym2G2es5LZ48p0j3NdSw+yAQruuSU9c1KX/xRh+D4vJFP
	2umfKEwR/Zje2SUNmmzN3+YMDPcfqzBdt47B30MfUt41/4zajOrgTSBI3p2gsOnZj7tO
	psWd5rOEQ+grTZSvhldjckC4yp2gp1bIAt1kBeng38WYqe7txYCzHFHLrK+Z27oBcwLR
	UQhi56yFt4ZYSXZBlCw/6Hsgtq2rcg0O0p48GqNgfY3C0JCsYT7oG8zqRVHjD+Z3s1XN
	x8BQ==
X-Gm-Message-State: AJcUukc99C/IdYd/Q6iyWjDOjnH+g/jNV0Pzheyw9tKLeMCzjBGP/g6j
	1+3hoePEbGDKtDJFptgNnnu2Pw==
X-Google-Smtp-Source: ALg8bN6IvFQEZdC7s655ZqYY1/wqWUtXqGY8LBAYOlgXYEfofXaVegRjfb61GlKZ+qis3ZBm6TY//g==
X-Received: by 2002:a5d:488f:: with SMTP id g15mr18118658wrq.15.1545822587563; 
	Wed, 26 Dec 2018 03:09:47 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f2sm25113305wre.34.2018.12.26.03.09.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 26 Dec 2018 03:09:46 -0800 (PST)
Message-ID: <31abffa69bca5ee313a7d6c30dd7fc06011a14e5.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andrej Valek <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 26 Dec 2018 11:09:45 +0000
In-Reply-To: <857809ce-49de-16c2-f26d-805acc3601c2@siemens.com>
References: <20181207120605.11344-1-richard.purdie@linuxfoundation.org>
	<20181207120605.11344-2-richard.purdie@linuxfoundation.org>
	<fae0fb29acedc0c26cf9d5860e053d1427316cb8.camel@linuxfoundation.org>
	<857809ce-49de-16c2-f26d-805acc3601c2@siemens.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] nativesdk-*-provides-dummy: Fixes to allow correct operation with opkg
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
X-List-Received-Date: Wed, 26 Dec 2018 11:09:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-12-26 at 09:39 +0100, Andrej Valek wrote:
> Hello Richard
> 
> Did you have some time to take a look on it?
> What about just list all perl's deps and add these packages? Or is
> there something more behind it?

I got this far with it but it then got placed on the "needs more work"
pile and I got distracted by other problems.

I suspect a solution is comparatively close and it would be nice to get
this one fixed...

Did you have a solution to the problem below in mind?

Cheers,

Richard

> Regards,
> Andrej
> 
> On 12/8/18 1:07 AM, Richard Purdie wrote:
> > On Fri, 2018-12-07 at 12:06 +0000, Richard Purdie wrote:
> > > opkg needs the replaces/conflicts/provides in order for this
> > > package
> > > to function as intended. When enabled, this code caused failures
> > > for
> > > core-image-sato -c populate_sdk.
> > > 
> > > The reason is that nativesdk-autoconf has several perl
> > > dependencies.
> > > We
> > > need to list more of the things which this package
> > > provides/conflicts
> > > with in order for it to function correctly. Therefore add the
> > > missing
> > > entries.
> > > 
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> > > >
> > > ---
> > >  meta/recipes-core/meta/dummy-sdk-package.inc  |  4 ++--
> > >  .../meta/nativesdk-sdk-provides-dummy.bb      | 20
> > > +++++++++++++++++++
> > >  .../meta/target-sdk-provides-dummy.bb         |  3 +++
> > >  3 files changed, 25 insertions(+), 2 deletions(-)
> > 
> > Sadly this breaks the SDK on machines without libxml-parser-perl:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/68
> > 
> > so a resolution will need to be found to that before it can merge.
> > 
> > Cheers,
> > 
> > Richard
> > 


