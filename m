Return-Path: <jdmason@kudzu.us>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 532387FDC3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 22:42:44 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id f5so2873788ilq.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 14:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dDZM8aEbKYJs1q25vuGldhFH4OvGWvnioSiOerzaxlY=;
	b=Po6G5xsLqbWc+Mk2AwAV4sPL4lQR6FtRdsFIRyufGmJskWxcawjI2p32tNvkJ8C5EF
	pyhvLIdny6wyPrXWGWhAobXopN7hvWJCzxmzhxUPilnNt7vkt8QKEHfL/gCJKPQpyHHq
	NP/qlscSt2LyM5Bbh+PkCBrw1zEzcsM3JE8rF2M5FtPoQRcomJK8NgMDUnbDVJvzX0dC
	XGFjuLwXNO6mTsy/FNF5gIhCA1zqy11QniwCeRBKsNEEC3vjbK92qqb6QMWyUYjdGMto
	jKgawFB4evfVveMGE7tLCy+G23VSmmr6BmUz50e3IUwfAOQ6YHymS8SfTZPIdnKz5WIx
	W1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dDZM8aEbKYJs1q25vuGldhFH4OvGWvnioSiOerzaxlY=;
	b=WQI9TKQ+88bXlxxoReJ5HqNoyKm9QOljhb7vYrhbqhLDosVVNMrMJMFdK7YotrFzxr
	ahslhSkKiwOtzU79LgX5R5K+LLdZp3mrUcsy01YqaxKfLmJ0JumPG4O9QF1KuQ0eB4y/
	341EF0QjdoaB9JJA05111LCWhqljxu0VpVKSNK+/lkKG9j44j+dEJET0sBibOsxoLMVu
	0lgaY/rhGzBEw+PQ0+bZoFQZiPuPl0/Fq0vP019Kv/KDRLvjNnw5nwkhz3KP9H9MQlrU
	kZFVM1IgwatCeNGilN6tTAuF75L3oF3CL8OCO1uWgYu102FbWquP/+S2+5PlWvTdri9q
	bL3Q==
X-Gm-Message-State: APjAAAW8Jx//AHcUhFwpQSTOhUerBtjyu2NHyc3LbDZuXyOglZyIuRKj
	iINWop9qoEeP+eDCWeEzniffcYpY+7izodSTqR8Aow==
X-Google-Smtp-Source: APXvYqySOEkaNJ6XgcJRhY6xDbJqxPtZkjuLear73RhTl5IrFMjESX1z7orJFv3kj4mTF5wYTq/w73Nn4AjEN26IRuc=
X-Received: by 2002:a92:770a:: with SMTP id s10mr4863951ilc.159.1579905765133; 
	Fri, 24 Jan 2020 14:42:45 -0800 (PST)
MIME-Version: 1.0
References: <1579813185-1950-1-git-send-email-denis@denix.org>
	<CADkTA4OUcmx2wFVf9NAR8D7c_3n+303YFR3gwAWv08KgT_o+ww@mail.gmail.com>
	<6f6a74c1-948e-e6f2-303b-639a08111d64@intel.com>
	<397a7a14e3efb6d3b72ed67b96bfb196b2ff711a.camel@linuxfoundation.org>
In-Reply-To: <397a7a14e3efb6d3b72ed67b96bfb196b2ff711a.camel@linuxfoundation.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 24 Jan 2020 17:42:34 -0500
Message-ID: <CAPoiz9x+TT4MvGwSDMf_mRcwmTeVMQ0osrgDGUm_Vt16Mj6Duw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jon Mason <jdmason@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] arm-trusted-firmware: add upstream version 2.2
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
X-List-Received-Date: Fri, 24 Jan 2020 22:42:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 23, 2020 at 5:50 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-01-23 at 22:17 +0000, Ross Burton wrote:
> > On 23/01/2020 21:43, Bruce Ashfield wrote:
> > > On Thu, Jan 23, 2020 at 4:00 PM Denys Dmytriyenko <denis@denix.org>
> > > wrote:
> > > > From: Denys Dmytriyenko <denys@ti.com>
> > > >
> > > > Many BSPs require ARM Trusted Firmware (also known as Trusted
> > > > Firmware-A).
> > > > To avoid duplicating efforts of adding very similar recipes to
> > > > BSP layers,
> > > > add an upstream reference implementation to openembedded-core,
> > > > which can be
> > > > customized by BSPs, if needed.
> > >
> > > Isn't this one of the things that Jon Mason is trying to
> > > standardize/support in meta-arm ?
> > >
> > > http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm/recipes-bsp/trusted-firmware-a
> > >
> > > What's the delta between the two ?
> >
> > That was precisely my thought too.  meta-arm isn't exactly well known
> > right now, but ideally it should be a central place for common pieces
> > that are specific to ARM hardware (unlike anything that is needed for
> > qemuarm itself).
>
> If its needed by many platforms, I'm not adverse to it being in core so
> I have an open mind on core vs. meta-arm. I'm waiting to see what Jon's
> thoughts are on that.

My thought was that unless it's needed by qemuarm, etc, it would
remain in meta-arm.  We're going to have other desirable recipes
(e.g., edk2) in the near future.  So, this layer would be useful for
all Arm BSPs.

Thanks,
Jon


>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

