Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 89623607AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 12:12:53 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id g24-v6so16391042lfb.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 05:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2kcs63iMn8itbeySYenSfflEVSe1IkLk47uwE2bitNs=;
	b=B7miKguFm+AGz4civ8AR/Z3/osiPdAv5m3eaqBVdBLFcH3+VtdqHf/D9NGF+wp/s7p
	BAFHoS+Wq+m75gjf4q8+E+n4vKqxMMj6CuEHdoVAl692MbKP762927PDuc7ND8SrmMer
	xV1dIYAWRgC+tfptAvV0cBtmGhdznkMAGlLH3qJyXF9LcjBFpWe1n6j0VXTBU8NdgCa/
	7Y589/+/DXxZMMzfz3V+WRJ5Dbfshl5ZUnV1+dbfMIhEehQlJymLxla2ASHR0bW/E8Pw
	Hq+dJVUDtyLepwTeYhHiEVR2kZQiMPmmDKZo57y5AkGsYhwrGA0g2eJccbU2I+VYoNPa
	riJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2kcs63iMn8itbeySYenSfflEVSe1IkLk47uwE2bitNs=;
	b=MnPf1Yti3r+LtXYpXS/DiFBmTA1IkUlU6TM7vmpwFKd+YZ+yEoZ3lGaZDZzh7VqG/8
	VK4S9kxj7dUbBNjgNSrCI7cUgHT4B9BpE+M23szkNhYho8UkTtWJimNg3PVQKi+PnkI9
	egVQfhbNHkdgZgu+qbLyDSwimZirEnLxn2pno6Clc/S+CACWztUnNsNJuL12kJe0ZUiy
	CMKRobI/efw4GBFWLiXaNnvLvxjht78jgbfIXOXXf1cHVVkLDZFqvvRWCcm+Z+4I8ZXl
	RLtPygfDTvEuHvq+MC2VTsrfWytTSLwhZaHRWQKS5IgdB6U4DPBMnltWiqBpuKhfTWBf
	lNXQ==
X-Gm-Message-State: APzg51AfG7MOj7cxXtQ7eswehZ9VKC9GcO0fF4d9HIovddwmB6DR7kqW
	CL5X1kzVBldOLedzwQLLCNFSkqeSZbit5hlReDg=
X-Google-Smtp-Source: ANB0VdY5XSVP2tD226GR7/QJ1t+T8UQtBUbtvHZPJGpH6FvOkzVLKemGbwiwDt6HGmE/csb8hJHf7/s+uGbMb/eMjjo=
X-Received: by 2002:a19:f817:: with SMTP id
	a23-v6mr6322676lff.67.1537791173894; 
	Mon, 24 Sep 2018 05:12:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP; Mon, 24 Sep 2018 05:12:53
	-0700 (PDT)
In-Reply-To: <20180924072539.GE9430@hiutale>
References: <1537530567-8604-1-git-send-email-mikko.rapeli@bmw.de>
	<20180924072539.GE9430@hiutale>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 24 Sep 2018 08:12:53 -0400
Message-ID: <CADkTA4MBwLt_7AHDqVfh79KNB_sG58+gGWLz=4KqMg1Qpk1Ngg@mail.gmail.com>
To: Mikko Rapeli <Mikko.Rapeli@bmw.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: allow exporting files from kernel recipes to sysroot
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
X-List-Received-Date: Mon, 24 Sep 2018 12:12:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 24, 2018 at 3:25 AM,  <Mikko.Rapeli@bmw.de> wrote:
>> On Fri, Sep 21, 2018 at 7:49 AM, Mikko Rapeli <mikko.rapeli at bmw.de> wrote:
>> > This change enables kernel recipes to share files with other
>> > recipes. Firmware, modules and kernel-depmod are still not shared
>> > since according to git history they cause problems with multiarch,
>> > but all others are allowed. Examples of shared files are
>> > kernel version and recipe specific headers and scripts which
>> > are not needed by common linux-libc-headers to bootstrap glibc.
>> >
>> > For example, if a kernel recipe wants to share headers, it can do:
>> >
>> > PACKAGES =+ "${PN}-headers"
>> >
>> > do_install_append() {
>> >     install -d "${D}${includedir}/${PN}"
>> >     oe_runmake INSTALL_HDR_PATH="${D}${includedir}/${PN}" headers_install
>> }
>>
>> This is what I've always done in the past (and in fact, there's an
>> open Yocto bug
>> to track this), but I haven't actually needed to do what you are
>> modifying in the
>> bbclass itself.
>
> Without this patch, users of kernel.bbclass can provide the headers etc packages,
> but other recipes can never see the files in their sysroot even if they depend
> on the kernel recipe because kernel.bbclass has disabled sysroot_stage_all()
> completely.

It doesn't need to be in a class, any kernel recipe can create a task to
do this. The class implementation isn't special in this manner.

>
> The recipes could define their own sysroot_stage_all() but I don't see
> why kernel would be that special and why all of their installed files should
> be excluded from build sysroots by default.

Exactly. It is because of the ability to clobber the libc-headers that is is
special.

>
> The old way to do this was to fork linux-libc-headers for the custom kernel
> but now it has a big fat warning to not do this, but exposing header etc
> files to other recipes to build against was still not resolved.

That was one old way, but not the only. And not for exposing non uapi
headers.

>
> With this patch the kernel recipe can just install the files needed and
> users can see them unless they are filtered.

And as the warning points out, risk the libc-interface, which has caused
many problems in the past .. and problems that are hard to detect and
dig out at runtime.

>
>> If you call the sysroot stage routines directly in that
>> install_append, are you really
>> not seeing the files appear in the recipe's sysroot ?
>
> Of course this can be done but why on earth is kernel so special that
> it's installed files are not visible in sysroots by default?

because they clobber the uapi libc-headers :D

>
> If certain files are problematic, they can be filtered out from the
> sysroot like my patch tries to do.

Or we could catch that the clobbering is happening, and not let it happen.

>
>> Have you confirmed that we get a warning/error from bitbake about
>> conflicting files
>> from multiple recipes if someone doesn't know to use a custom path for their
>> headers ? That has always been the main concern about allowing something like
>> this.
>
> No, but I do rely on this with other recipes as well. At least I know that
> conflicting files warning will fail image and SDK generation.

For something that is being proposed as a general purpose addition to
the core, it would probably be a good idea to test these extra cases.

>
> I would expect that recipe specific sysroots don't allow conflicting files.

Agreed, but definitely worth testing and logging. That way the change
won't be blamed for causing issues later.

Bruce

>
> -Mikko



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

