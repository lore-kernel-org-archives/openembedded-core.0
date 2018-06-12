Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id B80A5789BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 17:49:02 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id l11-v6so15791762uak.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 10:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wksymeEYI/rKkJCCJ66qCSU7qOlqDml3wNxYGDEczxY=;
	b=Hm8ZxGIJ1aw7IHEv3r73JdoPn0D9ekpI8UKM0xIo57qc4WNTMAeL0EdFwe637aBzlu
	CvUkPxFNyKhTnZ64ADY1QjvonW7s+G7aqYru9t9OAmUw/RX1xc1hmmDcQ3YmxbyGnnqF
	H/eFhs5wObCU7n2bUvucY80LnWFRYeG1nzF9Z0dNvOz7/Cew+3YkGgiglrvu+lgZjp0w
	z6SZlAoa0PO6ULOtW/5OyVYbrI7W/dPMCy+MHdO3FSn6vln8tTi5ZG+IYuD8wjRDxbnN
	oa/pdv5v6svQYzHWAkHLCp4kfR5yq7uZHW+OXRHjiNS8zmDKKlytm9hVhhk/WtJX7VBm
	vx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wksymeEYI/rKkJCCJ66qCSU7qOlqDml3wNxYGDEczxY=;
	b=YhhRHMk1Zt9Xz1D/hegUaO5jjEfdsTL3wm51mdO5HGJcTNTBa82Gl7lrra2qjDNdR4
	jHfsxhWSljm5SYuckCmlqf2IQzDmwgEfkYobkxCGOqol8AXzc6BPVqa94dZMpwiBthrc
	wbeNfFAaFINOARrHnpM4gUCTTf24SUaxK7by5nk0rdkwCToJLIcRyN3kNgm267NxXOHq
	yTbNW1tQptVN2/d8rLiMSR8mQMqAHllHO210w2eoiR5xoHiJ1EGZ6jCtwYvLgESVQCzk
	u9ndqA6LhwLIry6R2X4hmJ90c1B4abhtM6wmJyflYvmcV0fYYIgAlf7LjIPxLABS8/Zu
	D0kA==
X-Gm-Message-State: APt69E2nswatJt73u5tpzNRdfcHMJpeM5E50S0lxkP/i6XupurRGgF3z
	bMxkEzuW/FZdWC7prIQmd45fXUOtwlGhAgeoVt4=
X-Google-Smtp-Source: ADUXVKLv47yoYZJBf9/Pon7reEFdiif37QmMq04mGE1hHISgA3qek/D7Hwhau9SC/HS5/U0Lfqr6Dr4OOlsM7IJ/5FI=
X-Received: by 2002:ab0:50ba:: with SMTP id
	c55-v6mr1084035uaa.150.1528825743754; 
	Tue, 12 Jun 2018 10:49:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Tue, 12 Jun 2018 10:49:03 -0700 (PDT)
In-Reply-To: <CALatG=4B7RYeuxm3QovKGDPjig6=J=kXufomJ=c0uczetU3r0w@mail.gmail.com>
References: <1528716867-20270-1-git-send-email-liu.ming50@gmail.com>
	<CAJ86T=X_BFLzGB4PDKSOJR3Boiv+gQvTN-3D+d+tk=Otw7iwew@mail.gmail.com>
	<CALatG=4B7RYeuxm3QovKGDPjig6=J=kXufomJ=c0uczetU3r0w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 12 Jun 2018 10:49:03 -0700
Message-ID: <CAJ86T=XckYkuaAgtMbX-Epkdi8J8tmv3VeyTan10HuvM0DG_yw@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] bitbake.conf: add BB_CURRENT_MC to OVERRIDES
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
X-List-Received-Date: Tue, 12 Jun 2018 17:49:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 12, 2018 at 4:43 AM, Ming Liu <liu.ming50@gmail.com> wrote:
> Hi, Andre:
> The reason for needing this multiconfig to be in OVERRIDES, for me, is the
> scenario that I have one recipe but some variables/tasks in it are different
> for multiconfig, for instance:
>
> do_install-mc-default () {}
>
> do_install-mc-foo() {}
>
> and I do not want split them into several almost same recipes with only one
> task different.

Yes, that's clear. But the question is whether you can make the
over-rides you need self contained within the multiconfig config file?

e.g. to enable an over-ride when you build with multiconfig foo, add:

  OVERRIDES .= ":mc-foo"

to foo.conf

If it works, then it gives you more flexibility - you can pick your
own over-ride naming, define multiple over-rides per multiconfig, etc.

> //Ming Liu
>
> 2018-06-12 1:15 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:
>>
>> On Mon, Jun 11, 2018 at 4:34 AM,  <liu.ming50@gmail.com> wrote:
>> > From: Ming Liu <liu.ming50@gmail.com>
>> >
>> > This is useful when the users want different variables/tasks when using
>> > multiconfig.
>>
>> Isn't the idea of multiconfig to select between configurations which
>> already fully define all necessary over-rides?
>>
>> If a particular multiconfig build needs a custom over-ride then the
>> multiconfig can append to OVERRIDES (or MACHINEOVERRIDES etc, as
>> appropriate) directly.
>>
>> ie to avoid confusion isn't it good if building with a multiconfig
>> enabled is always equivalent to building with the contents of the
>> multiconfig file copied directly in local.conf?
>>
>> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
>> > ---
>> >  meta/conf/bitbake.conf | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> > index 3b2ef9f..0c803d5 100644
>> > --- a/meta/conf/bitbake.conf
>> > +++ b/meta/conf/bitbake.conf
>> > @@ -731,7 +731,7 @@ DISTRO_NAME ??= "OpenEmbedded"
>> >  # And finally '<foo>_forcevariable' overrides any standard variable,
>> > with the highest priority.
>> >  # This works for functions as well, they are really just variables.
>> >  #
>> > -OVERRIDES =
>> > "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
>> > +OVERRIDES =
>> > "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:mc-${BB_CURRENT_MC}:forcevariable"
>> >  LIBCOVERRIDE ?= ""
>> >  CLASSOVERRIDE ?= "class-target"
>> >  DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

