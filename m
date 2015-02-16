Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 41DC860556
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 17:55:15 +0000 (UTC)
Received: by labgq15 with SMTP id gq15so31409609lab.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 09:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0mkUZhVVaw8//BE8auvYRXaN00EdVvPltcQnIAZlHaY=;
	b=V44CIMsB30Kjef7s5OdVqIMex1k6FAotuR89J7kZBO59lSCS6cs+F6s4viJEyj7QeI
	vvJV0hVkMomIFx1MztTQa4JhMvWKliGkE7VkvIvC+/K8GpesnCDO+h/cSRofNOEePpTn
	R4S8cmH4osXWnC8AqEcogveqS1P2E8ZFwXLn+pyFRrbYaAXdcJaCjw0mh9wJ9s3AjDH7
	JaiNg9ZJBsQd2Wy59gqlXBIecfQebdUzPFXXeYXggVTBqf9nq//b9kxDyoPffBdnSFdB
	9On9W65qg3h/ypWPmg/uTIB+HH0aqvrwF8rphECnGbS/cghAoQ/DI4xBjx3qXiEt7H0q
	hCiA==
MIME-Version: 1.0
X-Received: by 10.112.114.230 with SMTP id jj6mr24145694lbb.112.1424109315862; 
	Mon, 16 Feb 2015 09:55:15 -0800 (PST)
Received: by 10.112.40.34 with HTTP; Mon, 16 Feb 2015 09:55:15 -0800 (PST)
In-Reply-To: <1424108217.25541.4.camel@linuxfoundation.org>
References: <1424108217.25541.4.camel@linuxfoundation.org>
Date: Mon, 16 Feb 2015 12:55:15 -0500
Message-ID: <CADkTA4OMMq56CHQKvAWK2e8uibYsJti1ObgqR-vpC2ZPaGitcg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Feature Freeze
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
X-List-Received-Date: Mon, 16 Feb 2015 17:55:17 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 16, 2015 at 12:36 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I have to admit I've lost track of time a bit however the calender says
> Milestone 3 (M3) finishes this week and that marks "feature freeze" for
> the release. Beyond this point we have M4 which which is targeted for
> bug fixing only, no extra features and no package upgrades in general.
>
> I'm therefore looking at the list of things we'd like to get into 1.8
> and trying to figure out what is missing. The things I'm thinking we'd
> prefer to get in, *if* we can are:
>
> Upgrades:
> * Bluez v4/v5 switch (in master-next testing)
> * Upgrade to glibc (assuming it builds and don't regress anything)
> * Pulseaudio 6.0 (related to bluez in particular)
> * Python 2.7.3 -> python 2.7.9 upgrade (long overdue and nearly ready)
>
> Enhancements:
> * kernel-dev: make Kconfig audit output visible (#6943) since this
>   impacts our user experience

To finish up 3.19, I may need to take until the end of the week. I'm
working with the 3.19 kernel meta data to make sure it is clean, before
anything will be (re)made more visible.

> * Extended SDK containing development workflow tools
> * Further integration of build-compare for package feed maintenance
>
> Bruce: Are we at the right kernel versions we want for release for qemu
> for example?

We are at 3.19 + libc-headers @ 3.19 under test now (in the -dev
kernel). I'll send out the versioned kernel recipe by mid week
to meet the freeze (it's a long weekend here, and I shouldn't even be
reading the mailing list right now :)

Cheers,

Bruce

>
> I get the feeling there may be some pieces I've forgotten, please let me
> know if so. Whilst M3 technically closes now, there are probably a few
> more days, as time moves forward its going to become harder to convince
> me to take things though.
>
> Cheers,
>
> Richard
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

