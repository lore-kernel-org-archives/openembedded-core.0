Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC7471AD1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 19:21:13 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v123so19018697wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 11:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LUxyJN/gBusKdEgs0NFPBk9MvBU5M+TPvrjolZayIak=;
	b=cFbAtxoLIAt9A5nW6riMM7YKWvgTCgu3xZILh+Rf8Gd12RI0KI2dnHHU3S0P91UqaD
	m/F0C36TykOD2AmpknrnLY8ezbDeX7Y+kxdAV/S+EUZn3qVQRmTKJEOU4AsvAGaOv7G0
	/oHZdccVAejPs+wifbgp8tvLRXZElZG5liYqfp4gxuxBGgcrWeKcaGDg7OSbvwDl38aM
	X0FKCUA+hiGUusadl9fbevFBfB+JX/PlxBypnynLkRut2kk4XFKztdALkfytfNAPsLsM
	shJ4cMb0SkmidxRg0/CP4LvCeMp3cP/eIBa/YHL8f0Ut+dE5I2AFvMaYPvTdh0M9tt9R
	8syQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LUxyJN/gBusKdEgs0NFPBk9MvBU5M+TPvrjolZayIak=;
	b=PvpX6s7U4kBzdy1LRSvBtfj9lOtT3WoPCcEYnJt+p92oG66c7Rod8pxCsn4pGmhe3s
	R3CE6LKE1Gipfo44zTJkDkHCRsFubAWtSxxLwcW3He/GQqpdO63y5F+91tdY/rujG/j4
	GQl0RqunWNqDlopwN7vXHxx9RArt/LiKyu7j37Zq7SipqijOvXtiKu7j/WRyMjPoaSWY
	0mHXzZa6Zq5pLbEas9q7T2/1l3x0RoPT6Fdypgmuv5fhg8qp6pSZVEWCMZzUXRbu1i/O
	CO7Vs7XTZWpkKGYPJwt4xMfFoYp5V6SeD6lJ+Iv0jQ/TsyiYWJH7TbzSj3NcVgDlBi8y
	Nq3g==
X-Gm-Message-State: AKwxytdDbEqUJDXJ/c1s9ArZzgyNFyxG2mL9I6Ham+bdeLWQ8vEg9czB
	Fes7qOSMcP+j/PjxLYmqnWluv+UdSO5WTdOaxPg=
X-Google-Smtp-Source: AH8x227DxiNZPsLMl3nysw3VRyYeSN1B9fbRe/QsqC7HaIw6FuwPV4SbJaEp5GwYOvwIW2kAZsVaRw48QQX3Gor1yz8=
X-Received: by 10.28.247.25 with SMTP id v25mr6592282wmh.10.1516648874206;
	Mon, 22 Jan 2018 11:21:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.144.129 with HTTP; Mon, 22 Jan 2018 11:21:13 -0800 (PST)
In-Reply-To: <1516528949.24502.54.camel@linuxfoundation.org>
References: <20180117092159.19356-1-thomas.perrot@tupi.fr>
	<CAJ86T=Va5HE+zYpKS29jfrB3R=yqTR1vkZuxmk21Uc_qQSzr4g@mail.gmail.com>
	<1516528949.24502.54.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 22 Jan 2018 11:21:13 -0800
Message-ID: <CAJ86T=WdZc_6QpUHFFznsZNYdTNYw7Mz2E7M40V=-JuRg4JJDg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Use KERNEL_IMAGETYPE_FOR_MAKE in do_bundle_initramfs
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
X-List-Received-Date: Mon, 22 Jan 2018 19:21:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 21, 2018 at 2:02 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2018-01-17 at 13:31 -0800, Andre McCurdy wrote:
>> On Wed, Jan 17, 2018 at 1:21 AM, Thomas Perrot <thomas.perrot@tupi.fr
>> > wrote:
>> >
>> > In the case of a fitImage the this step should be done on the
>> > image use to assemble the fitImage.
>> >
>> > Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
>> > ---
>> >  meta/classes/kernel.bbclass | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/classes/kernel.bbclass
>> > b/meta/classes/kernel.bbclass
>> > index c42f85c665..ff09d4c4c7 100644
>> > --- a/meta/classes/kernel.bbclass
>> > +++ b/meta/classes/kernel.bbclass
>> > @@ -231,7 +231,7 @@ do_bundle_initramfs () {
>> >                 copy_initramfs
>> >                 # Backing up kernel image relies on its
>> > type(regular file or symbolic link)
>> >                 tmp_path=""
>> > -               for type in ${KERNEL_IMAGETYPES} ; do
>> > +               for type in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
>> The net result of this change is to no longer backup the non-
>> initramfs
>> vmlinux.gz kernel image before creating the kernel image(s)
>> containing
>> bundled initramfs (plus some other corner cases, depending on whether
>> the legacy KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE variables are
>> used and whether or not KERNEL_IMAGETYPES contains both vmlinux and
>> vmlinux.gz or vmlinux.gz only).
>>
>> Can you explain a little how that's related to building fitImage
>> kernels?
>>
>> This code in do_bundle_initramfs() is extremely fragile and changes
>> may only break less well testing targets such as MIPS, so any changes
>> need to be very carefully reviewed and tested.
>
> Actually, I think it means we need better tests.

Yes. This bug was spotted via code review though (unfortunately too
late to prevent the change being merged to master...).

> I'm seriously considering removing a lot of the stuff in kernel.bbclass
> and then rebuilding things in hopefully a cleaner way. The test for
> anything being needed would be whether our regression tests pass.
>
> I appreciate the idea will fill some with horror but there are a few
> places the code code is turning into an unmaintainable (and
> unreviewable) mess, the kernel classes are getting there :(
>
> Cheers,
>
> Richard

