Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5DE0473243
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Aug 2016 15:04:11 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id r9so38609221ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Aug 2016 08:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=auBeZ1GanaiyF1E2/CB/Zhn7CrxvwK5ICtzksVTjP0I=;
	b=YYB/+N7WMEb8rwTngSVk4uHHTI1NN44u2Culkg1YW+JhPoNdzJ7jDTzW1VXYv+Ptoo
	PXiMfjFOYZILtpzXy52bz2Nu4qPf3A17qFceBQFpVyx+seS1Z3Nj/eubP3NOvEHWvPYL
	dsmjlVOJsEpxua7g4skPK6I/KiXbNsG8awQW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=auBeZ1GanaiyF1E2/CB/Zhn7CrxvwK5ICtzksVTjP0I=;
	b=ZK6Fe4cyt3honstuvNPHhJZnX8tY2LWJZMA6Is43ntuD5W3KpHmnPCRCELdjKTOjX4
	MhBMOV5RySs2iRi3R2KTB7bpBkM5LrV2nONgKRqtEUQ+stxtvI8/FTaf+HW9DJssmg4c
	ywq20aJb/75pjCeVP95JUfxDlA09OpmlaGdd6PotxFxzKp19HbptLUpE36jHuozXtwFG
	yJ1jNmOhPyE7jWrOmv9qCr9TMohPEWNts7W4vtVpk7zN0vpbSxBclmplj/MpIcLtVrmj
	OHuzkHqDSlb/XCISQYu9T+Mn8huV0J4TCsDIbfw94y8cjrinnk+8URxJkFdDT70E2xay
	Rokg==
X-Gm-Message-State: AEkoouukW+7G26l+hzjbv61BSafq9usDyvtplnK61ZLrZvCfS7+OHxGjRm6LJc/kEi5W8w==
X-Received: by 10.129.105.136 with SMTP id e130mr13622130ywc.176.1471791852352;
	Sun, 21 Aug 2016 08:04:12 -0700 (PDT)
Received: from bill-the-cat
	(cpe-2606-A000-1407-C0E8-18FF-E2E3-CAA6-B64C.dyn6.twc.com.
	[2606:a000:1407:c0e8:18ff:e2e3:caa6:b64c])
	by smtp.gmail.com with ESMTPSA id
	z193sm6331851ywg.26.2016.08.21.08.04.11
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Sun, 21 Aug 2016 08:04:11 -0700 (PDT)
Date: Sun, 21 Aug 2016 11:04:52 -0400
From: Tom Rini <trini@konsulko.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20160821150452.GR5342@bill-the-cat>
References: <alpine.LFD.2.20.1608181237130.2886@ca624034.mitel.com>
	<20160819201637.GO5342@bill-the-cat>
	<alpine.LFD.2.20.1608210955340.18845@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1608210955340.18845@localhost.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how can i add u-boot-fw-utils to my build without u-boot being part of the build?
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
X-List-Received-Date: Sun, 21 Aug 2016 15:04:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 21, 2016 at 09:59:22AM -0400, Robert P. J. Day wrote:
> On Fri, 19 Aug 2016, Tom Rini wrote:
> 
> > On Thu, Aug 18, 2016 at 12:41:25PM -0400, Robert P. J. Day wrote:
> > >
> > >   i want to add the u-boot-fw-utils recipe to my current build,
> > > but u-boot is *not* part of the relevant BSP layer -- u-boot is
> > > being configured and built elsewhere, and that's not changing for
> > > the foreseeable future.
> > >
> > >   the good news is that those utilities don't need to have any
> > > info on the default environment for u-boot -- they need only have
> > > access to the environment in flash, and there is a
> > > /etc/fw_env.config file that is all set up and ready to go and
> > > referring to the correct device and offset in flash.
> > >
> > >   so how do i specify that i want to add that recipe to my build,
> > > while saying, "don't worry about the default environment, you
> > > don't need it." can that be done? thanks.
> >
> > The "easy" way out here is to just set a valid (as in, compiles)
> > UBOOT_MACHINE and then not worry about installing U-Boot from the OE
> > build.  You can ASSUME_PROVIDED away u-boot itself, but you still
> > need to have a UBOOT_MACHINE set so that we configure U-Boot before
> > building the tools (And you must configure before building).
> 
>   the problem is that the machine is a custom tweaking of an existing
> platform in u-boot, so that a regular checkout of u-boot won't have a
> defconfig for that machine. the entirety of u-boot for this target
> board is configured and built elsewhere, so i'm just trying to figure
> out what little i need to supply to get a build of those fw-utils in
> my image.
> 
>   i suppose i can just use an existing machine that's compatible --
> beyond that, i assume all i need to supply is a /etc/fw_env.config
> file defining where in flash the environment is to be manipulated.
> 
>   i realize this is a weird scenario, it's just what i have to work
> with for the time being.

This is a fairly common scenario I think.  I'm doing it myself right now
for a customer :)  And what I'm doing is having OE build U-Boot for the
reference platform (and not using that U-Boot) and re-use that config
for building u-boot-fw-utils (which we do need) and providing a good
fw_env.config just like you suggest.

-- 
Tom

