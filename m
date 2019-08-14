Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1B58D6079F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 03:39:56 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id f9so4938863ljc.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 20:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XddlCk2eOyuJ0wQD/TU5pUw3zQDTA2yYAOy60K5kanU=;
	b=V4d68ceAFeMZ5OLbBz0xJk6qmRc1qs2Cm7lRDIYb7+7soGtbGq+5IlbGxXkkqwmX/9
	tpBlhYvjRDe1vqPwWg3m2NCEA7RWo/zIdlKo3h6PUo8FWMF0J5YfEx3MjJzjzNO8Aga7
	qZhNdBEnKRgOUrEhP9MDISXr+oDHDKbY6dPAq2CoeDVkgqzzzdR7uxWELYRe8klUAjGV
	TpuaxzIovyQ9UkY8ba7385tUpmU1P2Es4xQddN1VHiEh67dDxN+hCt7kY8IinzC2ZcEU
	aO6Kz1Z55E58nx8E+FcSpAKnpvAWBodObd3Et6bUTF7N8IcoEmVCaeJ1l1EAw7YStBYd
	JY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XddlCk2eOyuJ0wQD/TU5pUw3zQDTA2yYAOy60K5kanU=;
	b=SFzKn3y/mPuYGZeny3UqGTp9HE5OfFh8BkZVUVj6Cv+pNruNR1UJbiX9tzeIPaJs4X
	2tRVYNW+EsPaJ7KtwfpM70UfBeGbACa4UnMLnFPnMo9xbGclY/2NYgQHjBFHECwPajrd
	2C9+k/HNWAWKDh6Q7Hk0H67UN0AtkW7Ne3nBPDJESuWYRTGJxo8VehyjEuzzcCx1ybfx
	LWJT/NALkzPgK5a0A6rZHiGhMOJI5fEdhMka9+11U/BOofKo6/4FWLCLkl1Mc+fz8AZg
	4JmP3nZHf479Uq2aIS7CBdR3GUShgrcIcsHXypMg7v9d5cxKw5ga/zC/2v+VimbI3tjx
	CTiA==
X-Gm-Message-State: APjAAAUyKUPcsaPVezmspMnEOegv6YN4mENzDf//PL8BLURI5kpGco8c
	2CrPBDYIXLAb7ujbqg92ZFRUKEG3FVZNsmMATmU=
X-Google-Smtp-Source: APXvYqyZCNOQTijl1lE4H5okol35y/c4SjqCdDEGcdVpWXezTwszKLCH3hgdLKAn+Z7zXqnVq4MZ8phlv9iFOCCzLX4=
X-Received: by 2002:a2e:8449:: with SMTP id u9mr17102009ljh.104.1565753997291; 
	Tue, 13 Aug 2019 20:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <1565674414-112937-1-git-send-email-hongzhi.song@windriver.com>
	<CADkTA4PCeER9wP28NOaUtKEFBLKmqUfda7Cz+M0q2cgp5DiYew@mail.gmail.com>
	<abef39b8-e8b0-db67-70e7-da17666d1056@windriver.com>
	<CADkTA4Nwi1sSu-W2asM0SXUEhHE94jAEQcSWoCsW7f9ThWP4Tw@mail.gmail.com>
	<35a10637-eac6-0142-fc53-2675fb700375@windriver.com>
	<CADkTA4Pma8h6rk6nnRUAGi2gu8gXVCT0GiTYH7vrYT1OQzJoag@mail.gmail.com>
In-Reply-To: <CADkTA4Pma8h6rk6nnRUAGi2gu8gXVCT0GiTYH7vrYT1OQzJoag@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 13 Aug 2019 23:39:46 -0400
Message-ID: <CADkTA4NHx7S6NekA5hz_rpL0Fb5aaoFDop50o+rQjOZ1hvPbYA@mail.gmail.com>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: cp Documentation/ to sdk kernel
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
X-List-Received-Date: Wed, 14 Aug 2019 03:39:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 13, 2019 at 11:04 PM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
>
>
> On Tue, Aug 13, 2019 at 11:01 PM Hongzhi, Song <hongzhi.song@windriver.com> wrote:
>>
>>
>> On 8/14/19 10:53 AM, Bruce Ashfield wrote:
>> >
>> >
>> > On Tue, Aug 13, 2019 at 9:59 PM Hongzhi, Song
>> > <hongzhi.song@windriver.com <mailto:hongzhi.song@windriver.com>> wrote:
>> >
>> >
>> >     On 8/13/19 8:27 PM, Bruce Ashfield wrote:
>> >     >
>> >     >
>> >     > On Tue, Aug 13, 2019 at 1:35 AM Hongzhi.Song
>> >     > <hongzhi.song@windriver.com <mailto:hongzhi.song@windriver.com>
>> >     <mailto:hongzhi.song@windriver.com
>> >     <mailto:hongzhi.song@windriver.com>>> wrote:
>> >     >
>> >     >     A new patch let kernel source Documentation/Kconfig in top
>> >     Kconfig
>> >     >     So kernel-devsrc should include Documentation/ too.
>> >     >     Otherwise "make scripts" will fails.
>> >     >
>> >     >     patch:
>> >     >     commit b1663d7e3a7961fc45262fd68a89253f2803036c
>> >     >     Author: Mauro Carvalho Chehab <mchehab+samsung@kernel.org
>> >     <mailto:mchehab%2Bsamsung@kernel.org>
>> >     >     <mailto:mchehab%2Bsamsung@kernel.org
>> >     <mailto:mchehab%252Bsamsung@kernel.org>>>
>> >     >     Date:   Tue Jun 4 09:26:27 2019 -0300
>> >     >
>> >     >         docs: Kbuild/Makefile: allow check for missing docs at
>> >     build time
>> >     >
>> >     >         While this doesn't make sense for production Kernels, in
>> >     order to
>> >     >         avoid regressions when documents are touched, let's add a
>> >     >         check target at the make file.
>> >     >
>> >     >         Signed-off-by: Mauro Carvalho Chehab
>> >     >     <mchehab+samsung@kernel.org
>> >     <mailto:mchehab%2Bsamsung@kernel.org>
>> >     <mailto:mchehab%2Bsamsung@kernel.org
>> >     <mailto:mchehab%252Bsamsung@kernel.org>>>
>> >     >         Signed-off-by: Jonathan Corbet <corbet@lwn.net
>> >     <mailto:corbet@lwn.net>
>> >     >     <mailto:corbet@lwn.net <mailto:corbet@lwn.net>>>
>> >     >
>> >     >     Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com
>> >     <mailto:hongzhi.song@windriver.com>
>> >     >     <mailto:hongzhi.song@windriver.com
>> >     <mailto:hongzhi.song@windriver.com>>>
>> >     >     ---
>> >     >      meta/recipes-kernel/linux/kernel-devsrc.bb
>> >     <http://kernel-devsrc.bb>
>> >     >     <http://kernel-devsrc.bb> | 2 +-
>> >     >      1 file changed, 1 insertion(+), 1 deletion(-)
>> >     >
>> >     >     diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
>> >     <http://kernel-devsrc.bb>
>> >     >     <http://kernel-devsrc.bb>
>> >     >     b/meta/recipes-kernel/linux/kernel-devsrc.bb
>> >     <http://kernel-devsrc.bb> <http://kernel-devsrc.bb>
>> >     >     index 5ec5929..a874e06 100644
>> >     >     --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
>> >     <http://kernel-devsrc.bb>
>> >     >     <http://kernel-devsrc.bb>
>> >     >     +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
>> >     <http://kernel-devsrc.bb>
>> >     >     <http://kernel-devsrc.bb>
>> >     >     @@ -65,7 +65,7 @@ do_install() {
>> >     >          )
>> >     >
>> >     >          # then drop all but the needed Makefiles/Kconfig files
>> >     >     -    rm -rf $kerneldir/build/Documentation
>> >     >     +    #rm -rf $kerneldir/build/Documentation
>> >     >
>> >     >
>> >     > In the spirit of keeping kernel-devsrc as small as possible (I have
>> >     > another patch pending if you really want the full kernel
>> >     source), this
>> >     > should only keep the Documentation/ files that are required to pass
>> >     > the check, not keep all of Documentation.
>> >
>> >
>> >     If you have a better patch, I am pleasure to accept it.
>> >
>> >
>> > ???
>> >
>> > This is where you'd typically do a v2 of the patch after getting a
>> > review of a change.
>> >
>> > But if you are refusing the feedback, then yes, I'll do a version of
>> > the patch myself rather than just blindly copying in all of the
>> > documentation. I'll submit it myself.
>> >
>> > RP/Ross, whoever is taking in patches, drop this version, and I'll do
>> > my own.
>>
>>
>> I am not very familiar with the kernel-devsrc.bb. I have no objection
>> for your decision.
>
>
> At a minimum, we shouldn't leave the commented out #rm -rf $kerneldir/build/Documentation, so I can do that and tweak the commit message a bit as well.
>
> Leave it with me, and I'll send it to the list (hopefully tomorrow) to be sure it still solves your problem.

Aha. Now I see what is actually happening. On reading the patch, I
thought you were requiring the existence of the *entire* Documentation
directory, not just the Kbuild infrastructure that would be triggered
if the documentation warning is enabled.

I still want to change things just a bit, but I'll leave your
Signed-off-by on the patch, since it won't be a structural change as I
thought.

But can you provide me your test steps ? Do you have a tweaked kernel
config that is enabling WARN_MISSING_DOCUMENTS and COMPILE_TEST ?

Bruce

>
> Bruce
>
>>
>>
>> Thanks,
>>
>> --Hongzhi
>>
>>
>> >
>> > Cheers,
>> >
>> > Bruce
>> >
>> >
>> >     Thanks,
>> >
>> >     --Hongzhi
>> >
>> >
>> >     > Bruce
>> >     >
>> >     >          rm -rf $kerneldir/build/scripts
>> >     >          rm -rf $kerneldir/build/include
>> >     >
>> >     >     --
>> >     >     2.8.1
>> >     >
>> >     >     --
>> >     >     _______________________________________________
>> >     >     Openembedded-core mailing list
>> >     > Openembedded-core@lists.openembedded.org
>> >     <mailto:Openembedded-core@lists.openembedded.org>
>> >     >     <mailto:Openembedded-core@lists.openembedded.org
>> >     <mailto:Openembedded-core@lists.openembedded.org>>
>> >     > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >     >
>> >     >
>> >     >
>> >     > --
>> >     > - Thou shalt not follow the NULL pointer, for chaos and madness
>> >     await
>> >     > thee at its end
>> >     > - "Use the force Harry" - Gandalf, Star Trek II
>> >     >
>> >
>> >
>> >
>> > --
>> > - Thou shalt not follow the NULL pointer, for chaos and madness await
>> > thee at its end
>> > - "Use the force Harry" - Gandalf, Star Trek II
>> >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

