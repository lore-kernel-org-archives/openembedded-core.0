Return-Path: <nathan@nathanrossi.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9239979EAD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 13:48:57 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id m5so2779904qka.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Nov 2018 05:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Qppps4ralgWLWtCE2vbGD/nyyRV6x20oiVbdcaPLUnU=;
	b=f9WiNEt37DUl0oaOAJ5t1hJ1xMZq6pwRP3GA6G7fXnD2RHIPXXwPL5p+9iZgszhsTX
	cPGjanl+c0tmInJljbSpseCUYtmNMCJR8X1wzjpabBMWjuoW7P4eMk6AFeSJrKoVjYs7
	ZaL2x/vUq89jhMFxJPzLPxW0olprGewbHyMUSq9SZk+tesWVXgIt6wg82o4dLc4dpg3+
	C+7yeuIQDrYzDnmJ+Fo/NJzGC5KLOZJudOxjfj/ArxfmcHYaHEyj0E1+3NGe/IhcyIgB
	brxowYMallHm0I4uPeLx+MRkron6bTMq5DojAdcjEHIoUag9RhiwlCNi/OkUOwx2tQ58
	A+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Qppps4ralgWLWtCE2vbGD/nyyRV6x20oiVbdcaPLUnU=;
	b=dSDFbygYqHabI7MWDuhpP13z0qMSkEAZofEBib9pTpGkYELVm4EbrqAALbt1xMqcYl
	utYgwka6NNVr1RSgpgHN6OWVA54dcHZVk7hORnNO4CDf21noKbogGB4aEEmM3pv7UTKC
	t/IbIDsKWWLtNwj57Xzny2phV5/NNxwjSMyiz7RArMDiLHLKEkOpAx9KKW5gSFDUi91D
	ifKisTz3sJ6nlQnRpopRiWUgfrK0Gx/Gu0g2bJiMSnlnpUMztiBKwI6lZt7n8O6ENJ9Y
	n4wO8bebiEBHScKPvTMvheAArZmEI+H54MhHWcE5/o7BDGLVxEbqREuidOEC/zuCa36i
	fIbw==
X-Gm-Message-State: AGRZ1gIMqqB0f16C3PJoAfCANN+R/8jz04naRPGXZADU+wwte76/Q4eK
	Y0bnOZEhP84iCH12UBAMY2eDz7zqka4x6GzfAdJJhA==
X-Google-Smtp-Source: AJdET5ftv0a17VrKP3VBvpNvz9MTcG2PTD9ebPRIC8AUA6WW/KnaFv8KmmXZnQYqsMoWvHOQRB7D55hzogB96d4egS4=
X-Received: by 2002:aed:3511:: with SMTP id a17mr4383067qte.153.1541684938381; 
	Thu, 08 Nov 2018 05:48:58 -0800 (PST)
MIME-Version: 1.0
References: <20181108084312.9306-1-nathan@nathanrossi.com>
	<CAMKF1spLq0bORBG-0p32o3mKV4tqOd0hUjueCoMFcq3VkJMtcQ@mail.gmail.com>
	<CAJTo0LafrmE_tQDPiMD2fwUY8=A7M40An-4AHueZp_Y=xY_hLA@mail.gmail.com>
In-Reply-To: <CAJTo0LafrmE_tQDPiMD2fwUY8=A7M40An-4AHueZp_Y=xY_hLA@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Thu, 8 Nov 2018 23:48:47 +1000
Message-ID: <CA+aJhH0QnkOO4cC4WOXAP08OKHh6hP7zFwAjpS5KxbTcEz7Zmw@mail.gmail.com>
To: ross.burton@intel.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] ghostscript: Define COMPATIBLE_HOST with supported platforms
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
X-List-Received-Date: Thu, 08 Nov 2018 13:48:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Nov 2018 at 23:44, Burton, Ross <ross.burton@intel.com> wrote:
>
> On Thu, 8 Nov 2018 at 13:30, Khem Raj <raj.khem@gmail.com> wrote:
> > > --- a/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
> > > +++ b/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
> > > @@ -121,5 +121,4 @@ do_install_class-native () {
> > >
> > >  BBCLASSEXTEND = "native"
> > >
> > > -# ghostscript does not supports "arc"
> > > -COMPATIBLE_HOST = "^(?!arc).*"
> > > +COMPATIBLE_HOST = "(aarch64|arm|i.86|microblaze|mips|nios2|powerpc|x86_64).*"
> >
> > this ignores riscv now. since you wsnt to
> > ignore for just one arch you can use
> >
> > COMPATIBLE_HOST_arc = "(none)"
> >
> > or somesuch mechanism.
>
> How is that different to the original assignment?
>
> The real point here is that all of these variations have flaws.
> Listing the architectures which don't work means the list isn't
> complete, but listing the working architectures means that layers
> which provide a bbappend instead of submitting to oe-core [1] will
> then refuse to build ghostscript unless they also do something clever
> with COMPATIBLE_HOST.

Ross beat me to it. But I was making this change as inverting due to
the desire to remove the warning and disable the package for at least
three architectures (or1k, riscv32 and lm32).

Regards,
Nathan

>
> Ross
>
> [1] meta-riscv, I'm looking at you
> https://github.com/riscv/meta-riscv/tree/master/recipes-extended/ghostscript

