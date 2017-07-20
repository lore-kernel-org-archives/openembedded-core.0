Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7D1F778302
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 18:51:56 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p204so4579651wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 11:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=NNa8XFtDnb30YHO37DDOAQoF5Zbk+oAfYiFjVUF+Nu4=;
	b=XYTdL3x6CKMbH1Bx6r+DP+mM9Q8pOiHOV6tdKTjE7ELPfCyNg15sB4JBLvz8YaLgxF
	HgUPtKwqA3In+p9Y117cG6c5aS9zkIPcxN/696NGrGrXz1XdlH8VPuiGnWX7Lh3m2tG9
	ZOq+lmOc+9yF225QBkuIy/UK7wKisGAP4Bs4Vo2mZcnRroS6CQQIjXW0+1ptF0ZuhVPd
	j255O8IiK1+wJYXygx1pnWXRHqGJ7NNXFFyPEf8qJ76wDgjQYcaYZY4K7xuZj/BhThCx
	D2jzXKbojNm/3N0m1o4EI5UdtxDyrzUkXAxNVNrJ9gPD3oEfTvuXR/6eBAXZG0MFVnpQ
	bqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=NNa8XFtDnb30YHO37DDOAQoF5Zbk+oAfYiFjVUF+Nu4=;
	b=BZ8YIG2d2QlZQdpz2XGqtzY8T0oiZg0ZA4l5h8rQifb+QKlzjiC1xKXCTUj/ESr3LE
	IUGr3tPVUu1EiMRKi8fcOvF+pL1s2cK1m5firi/GSk7qYQGi7C1PRN4R5RayBfT9porx
	YtxWqnv+U0DNIE1h55EAQ9mVMg0Nfw9X0PCjOPgBz1fED5yjrvPgXOjmbK5qoRv/4fae
	M+z8AK7IsGnryxPZ6iEPofLqlS8+W6OMPKICm0GH0gA5BGEbQSpz9VI/BYvJwgnXQzE+
	+DJwha7zoLUxlUHTVGQZruSTTnh6U90K70Hqo9E1xv6EAjDq+eUjHniH2uHbeviYLTpO
	pcxw==
X-Gm-Message-State: AIVw113xu+mJO4RYTC4RfB0RKU4zMGIr4bg9CXBZY3OAAJmGXNebQn5c
	y/p9ADQEnh09u0sSB4r7H2pa7ocpmA==
X-Received: by 10.80.176.162 with SMTP id j31mr3838503edd.186.1500576717890;
	Thu, 20 Jul 2017 11:51:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.173 with HTTP; Thu, 20 Jul 2017 11:51:27 -0700 (PDT)
In-Reply-To: <CAKV_0egoE8wJPJGd3qZyePgOS6q0gVzDG-pvPvTpZ5UWQYasYA@mail.gmail.com>
References: <1500417901-4667-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1spivq5cRcMDz-uehbqWRUzXyJf6TQ53sOtmFJu+_i1iqw@mail.gmail.com>
	<CAJ86T=XT9yufogwxMbV-0dW1ooYdvy5DOequ_X4fRQ7=nFWdOQ@mail.gmail.com>
	<CAMKF1soRVeHPLh_LFSxpcGG=1u1OcKvMv3yEifihP_Y7Y-eXUw@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B6119BDF6B@ORSMSX112.amr.corp.intel.com>
	<CAJ86T=XYR9Z=aMO-BAAZYJ2Lh=ZXQy+J5J-LjSuT-n_Hx-1ayA@mail.gmail.com>
	<CAMKF1soYE49jfc-pkYMLgdh5DJVuA0wyLFiA90Z_3OB7i6tUOw@mail.gmail.com>
	<CAKV_0egoE8wJPJGd3qZyePgOS6q0gVzDG-pvPvTpZ5UWQYasYA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jul 2017 14:51:27 -0400
Message-ID: <CAMKF1srdmXi-uxH9eX2wK2VYXpmCpkTLTvfZxY+5_OZo65Q-Sg@mail.gmail.com>
To: Brian Avery <avery.brian@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-7.inc: add new warning "Wnot-cross-compiler"
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
X-List-Received-Date: Thu, 20 Jul 2017 18:51:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2017 at 12:38 PM, Brian Avery <avery.brian@gmail.com> wrote=
:
>
>
> On Wed, Jul 19, 2017 at 6:35 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Wed, Jul 19, 2017 at 7:26 PM, Andre McCurdy <armccurdy@gmail.com>
>> wrote:
>> > On Wed, Jul 19, 2017 at 2:57 PM, Bystricky, Juro
>> > <juro.bystricky@intel.com> wrote:
>> >>> precisely, the problem is that some host compiler may silently ignor=
e
>> >>> unknown warnings and some host may not be using gcc as default syste=
m
>> >>> compiler at all e.g. mageia distro and may be more in future.
>> >>
>> >> Yes, it does not nor it attempts to solve all toolchain issues.
>> >> The expectation is that a compiler will choke on an unrecognized
>> >> option.
>> >> For example, gcc will do the following:
>> >>
>> >> $ gcc -Wnot-cross-compiler hello_world.c
>> >> gcc: error: unrecognized command line option =E2=80=98-Wnot-cross-com=
piler=E2=80=99
>> >>
>> >> As for non-gcc compilers: yes, they may silently ignore unrecognized
>> >> options
>> >> (which IMHO is just wrong). In that case the new options does not wor=
k
>> >> as intended,
>> >> but it does no harm either.
>> >> Anyway, the intended use was to add something like this a .conf file:
>> >>
>> >> TARGET_CC_ARCH_append_class-target =3D " -Wnot-cross-compiler
>> >> -Werror=3Dnot-cross-compiler"
>> >
>> > Personally, I think we already try to pass too much via CC or the
>> > compiler command line (e.g. -fdebug-prefix-map=3DXXX). Has there ever
>> > been any thought of OE providing a toolchain wrapper, which could pass
>> > these kinds of housekeeping options to the underlying toolchain while
>> > keeping build logs clean and without the worry that CC, CFLAGS, etc
>> > get ignored or clobbered by a custom Makefile somewhere?
>>
>> we could do it by providing customized spec file
>> but this will not be good for external toolchains
>> --
>
>
> I understand that it will only addresses the case where your target =3D h=
ost,
> though as Ross points out this can apply to more than x86.
>
> I also get that it will not help if the host compiler just eats the warni=
ng
> rather than erroring.


>
> However, there are actual cases where this is an issue and I only noticed=
 it
> because I happened to be building on an old gcc version that choked on so=
me
> new flags.
>
> I think a customized spec file could be an even better approach, but in t=
he
> meantime, it seems like this would help and could be added to distributio=
ns
> that want it (in an overridable way, so you can turn them off in config i=
f
> you are using an external toolchain).

I would suggest to run it via gcc mailing lists.

>
> Also, it doesn't cause harm unless the distro or recipe decides to turn i=
t
> on. Very Hippocratic compliant!

it does cause harm, by making the behaviour inconsistent and highly depende=
nt
upon build host.

