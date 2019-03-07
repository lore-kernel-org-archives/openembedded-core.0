Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 846E07CEC3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 15:48:29 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id 197so2119551lfz.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 07:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OlwAQum7YZY613EjhkFcPoChLCmia6M+R4CjSNUsLhE=;
	b=OJz1oD+GmkcY3fFsofjvP+3fCTITVD+9917eWNeI0KgTKwx6PE0BSBAj8meFiSaXfL
	OWAURsf613184/4m0/59nCNXtj2+DbLjHJ/KAnfgo+Dz7wQO+Kw9/xd4yKPkMM0nE49N
	TiU5L14vbTKHOBlGBmWPPMJr3XOfEH/3dbpkz0vCEi6Hkh8X62dQYsR/LqToeFRlBmvb
	YznSq4JKpnRykDzrmbagkuumAk/XWJs46U7PQZ7uzqXCLRoYev2btXx1jBwazVj1rbmg
	1aNE709vsxARQxuKzIp9PEYtojQA+aPLg77zDb9gJj1St9pfki2MczmG6utLdKM5hRvU
	gsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OlwAQum7YZY613EjhkFcPoChLCmia6M+R4CjSNUsLhE=;
	b=KYeHkQBa829tsSdHqJ5Vd8njzQVN56PrM6jFtgIEmrmuXMF7fhF3M5FoCm9nTjmaa2
	4e4em/4CFCqDdf/Hqstjuge75hrn+ACQa7HgqVls6vb93+flH8XP+lIMoEAgIQqZVSFT
	jKvn9GxbTI9DV6Eny8IlwQL7IrYS4XhTTEyAFdtg67xxfWDLRD5ui0pRHc9WpVChIPH3
	u0ivdtRaDowQmZVAkmQfbFC/O+aeZKZoeGBgb2jhL8+++YdibR/QbWNAjkHZEOkKJhpJ
	dtDiayeTDEh72GpJYoVsJVqe40DPRfyryd5F35lSuM3jxRggC3l1fVI//nsfca3L2Lnw
	EOZA==
X-Gm-Message-State: APjAAAVQiO8ouAoqsNdAK4myWrm1ZsHE5STLg7fOH5KDznkvOp6l0OSg
	yGWoEjwf1s/soW93n4+k7/Em3DY9upPlanoJa/U=
X-Google-Smtp-Source: APXvYqzhd+XhrnAxgFN+LtA0IbwwkBd6sGjYlU07a44RL7rFLaE//Y7PFcccH0ueTiRlAzA6al93MhtCTVq6xx1KiL8=
X-Received: by 2002:a19:d411:: with SMTP id l17mr7373774lfg.112.1551973709936; 
	Thu, 07 Mar 2019 07:48:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1551889557.git.bruce.ashfield@gmail.com>
	<088fa1a03d1ff2ec9eb08d419e2a7c7bc1ee3406.camel@linuxfoundation.org>
	<CADkTA4NdgcGNtD2RdFSURG7=t1dUna8CC7uGU+Dv4BcHYD=yTQ@mail.gmail.com>
	<CADkTA4MowcWPK_k5egUx=GY4SEVcSrOwWsey2h66KgvOHKfLOQ@mail.gmail.com>
	<533d4de952321163dbcc9115992b21229955191d.camel@linuxfoundation.org>
In-Reply-To: <533d4de952321163dbcc9115992b21229955191d.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 7 Mar 2019 10:48:18 -0500
Message-ID: <CADkTA4PV7zvHAu5uJp22X7ski+UXuHeNj+LJw-DVZhu1tJY7Hg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] linux-yocto: consolidated pull request (5.0 kernel intro)
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
X-List-Received-Date: Thu, 07 Mar 2019 15:48:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 7, 2019 at 8:04 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-03-06 at 23:23 -0500, Bruce Ashfield wrote:
> > On Wed, Mar 6, 2019 at 11:21 PM Bruce Ashfield <
> > bruce.ashfield@gmail.com> wrote:
> > > On Wed, Mar 6, 2019 at 6:05 PM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/365/steps/7/logs/step1c
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/365/steps/7/logs/step1c
> > > >    RESULTS - kernelmodule.KernelModuleTest.test_kernel_module -
> > > > Testcase 1541: FAILED
> > >
> > > Fixed, patches out shortly.
> > >
> > > > d) perf do_compile race seen on qemuarm64 (didn't reproduce
> > > > locally):
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/366/steps/7/logs/step1b
> > >
> > > I can't reproduce this one either.
> >
> > I did notice that the AB log seems to show 4.19 being built for this,
> > is that just a red herring ?
> >
> > NOTE: recipe iptables-1.6.2-r0: task do_package_write_rpm: Succeeded
> > NOTE: recipe iptables-1.6.2-r0: task do_package_qa: Succeeded
> > NOTE: recipe ofono-1.25-r0: task do_package_write_rpm: Succeeded
> > NOTE: recipe linux-yocto-4.19.19+gitAUTOINC+41fe45f7c5_11e0e616ed-r0:
> > task do_package_write_deb: Succeeded
> > NOTE: recipe ofono-1.25-r0: task do_package_write_deb: Succeeded
> > NOTE: recipe linux-yocto-4.19.19+gitAUTOINC+41fe45f7c5_11e0e616ed-r0:
> > task do_package_write_rpm: Succeeded
>
> Yes, well spotted, perf is failing to build with the 4.19 kernel.
>
> Thanks for the other fixes, they improve things a lot. This brings us
> down to the above perf issue with 4.19 and:
>
> a) KMACHINE_qemuarm = "qemuarma15" not working?

I mentioned on IRC that the kernel parts are working for me, and
by that, the mapping to the qemuarma15 bsp definition and hence
configs is correct.

I seem to be missing some machine definition parts to get a valid
userspace to work against that new kernel .. is there a series of
patches that I'm missing ?

>
> b) qemuarm64 graphics not working with 5.0

I don't think I've ever had this working, but I'll have a look at it as well.
But more eyes on something like this, will definitely help.

Bruce

>
> Getting there! :)
>
> Cheers,
>
> Richard
>
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

