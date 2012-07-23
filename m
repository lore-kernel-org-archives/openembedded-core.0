Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>)
	id 1StICb-0004JR-Nm; Mon, 23 Jul 2012 14:57:33 +0200
Received: by qcad10 with SMTP id d10so2904064qca.6
	for <multiple recipients>; Mon, 23 Jul 2012 05:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LZslW/5c1SXHnRbrlUXhK2xxhBKH4dyooB2brw9vRoA=;
	b=Rsc0bkTTQkidnzrS8oGOQkSBehflOnFOlhbN7kU5hVSay5E7xtBEOgQdOJvILPjeva
	Y3BpiM57fh7LYPfz5mFXl4DP8JBcn5kZHaQaUCCUWe3T/ImBk2/NhUhHGaphmao5PJkL
	N75MRvZEr3rXi4lUW/8Hu6FjwosCgvHbIVsNgdpnJZ2H1ctEuEimcpFeBhR6f1cdFCHF
	FGGOCscSqoXWuYblxEu7742JOoFqu7aQ7PmyywnCjg/NnFb8VVuPkaYC2Ar9f4eZ5Dj2
	xKPmUMShFowLYonyKkXLk1dQwd4gTiCxNs4zZTxanWfDiJgf5sNOXqucSeFWHL/K2AgL
	qqzg==
MIME-Version: 1.0
Received: by 10.229.136.197 with SMTP id s5mr5248211qct.42.1343047566192; Mon,
	23 Jul 2012 05:46:06 -0700 (PDT)
Received: by 10.229.8.78 with HTTP; Mon, 23 Jul 2012 05:46:06 -0700 (PDT)
In-Reply-To: <20120723084908.GB3271@jama.jama.net>
References: <20120628152441.4D5571032F@opal>
	<20120628213215.GC3961@jama.jama.net>
	<CADkTA4OKVFgLnSJMMVOZLuuMyfDZXMpriZR_q0O7PjzoJMij8Q@mail.gmail.com>
	<20120629060037.GD3961@jama.jama.net>
	<CADkTA4MxhVtYtH0Y==R64A7bnSaMjmrSM6RqekBU5PxuJNK0jA@mail.gmail.com>
	<20120723084908.GB3271@jama.jama.net>
Date: Mon, 23 Jul 2012 08:46:06 -0400
Message-ID: <CADkTA4N=CGskq0oiOxVLa_8rzLyLziyxCyEq-3Zt4t8_TYiABQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Bruce Ashfield : kern-tools: add buildall and robustness fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jul 2012 12:57:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 23, 2012 at 4:49 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Jun 29, 2012 at 09:04:54AM -0400, Bruce Ashfield wrote:
>> On Fri, Jun 29, 2012 at 2:00 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > On Thu, Jun 28, 2012 at 07:31:45PM -0400, Bruce Ashfield wrote:
>> >> On Thu, Jun 28, 2012 at 5:32 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> >> > On Thu, Jun 28, 2012 at 03:24:41PM +0000, git@git.openembedded.org wrote:
>> >> >> Module: openembedded-core.git
>> >> >> Branch: master
>> >> >> Commit: be3cff86d55db6255e036d68e943e527802b4f4c
>> >> >> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=be3cff86d55db6255e036d68e943e527802b4f4c
>> >> >>
>> >> >> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>> >> >> Date:   Fri Jun 15 15:26:44 2012 -0400
>> >> >>
>> >> >> kern-tools: add buildall and robustness fixes
>> >> >>
>> >> >> Updating the kern-tools SRCREV to pickup the following functionality:
>> >> >>
>> >> >>  - buildall: provides the ability to build all kernel branches
>> >> >>              without a build system, only a cross compiler and configme
>> >> >>              are required.
>> >> >>
>> >> >>  - robustness/cleanups: obselete/unused code removal and general robustness
>> >> >>                         fixes from Paul Gortmaker and Bruce Ashfield
>> >> >
>> >> > is this expected with latest kern-tools/linux-yocto and qemux86-64?
>> >> >
>> >> > NOTE: package linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0_3+a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0: task do_kernel_configcheck: Start
>> >> > ed
>> >> > NOTE: validating kernel configuration
>> >> > find: warning: -path /OE/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0_3+a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0/linux/ will not match anything because it ends with /.
>> >> > This BSP sets 1 kernel options that are possibly non-hardware related.
>> >> > The full list can be found in your kernel src dir at:
>> >> > meta/cfg/standard/common-pc-64/specified_non_hdw.cfg
>> >> >
>> >> > There were 1 instances of config fragment errors.
>> >> > The full list can be found in your kernel src dir at:
>> >> > meta/cfg/standard/common-pc-64/fragment_errors.txt
>> >> >
>> >> > NOTE: package linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0_3+a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0: task do_kernel_configcheck: Succeeded
>> >> >
>> >> >
>> >> > OE @ ~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0_3+a1cdb60720c452c3965eaec3ec2c
>> >> > d10f06261cc5-r0/linux $ cat meta/cfg/standard/common-pc-64/specified_non_hdw.cfg
>> >> > CONFIG_BLOCK
>> >> > OE @ ~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0_3+a1cdb60720c452c3965eaec3ec2c
>> >> > d10f06261cc5-r0/linux $ cat meta/cfg/standard/common-pc-64/fragment_errors.txt
>> >> > Warning: Value of CONFIG_NET_CLS_CGROUP is defined multiple times within fragment meta/cfg/kernel-cache/features/net_sched/net_sched.cfg:
>> >> > CONFIG_NET_CLS_CGROUP=y
>> >> > CONFIG_NET_CLS_CGROUP=y
>> >>
>> >> It is, only because I was waiting for my other queued changes to get pulled
>> >> before sending another batch:
>> >>
>> >> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/commit/?id=0329bbc053c97f9b250454ff6a60727f75973706
>> >
>> > Ah OK, from those validation messages it wasn't very clear if it's
>> > info/warning/error/fatal.
>
> First warning/error/.. is still there with latest linux-yocto
> NOTE: package
> linux-yocto-3.4.4+git6+949fddda61053cc15e46c015e8f7db17e7b33360_6+6297e4c1d57e1063bfce297c2e12392348598559-r4.0:
> task do_kernel_configcheck: Started
> NOTE: validating kernel configuration
> find: warning: -path
> /OE/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto-3.4.4+git6+949fddda61053cc15e46c015e8f7db17e7b33360_6+6297e4c1d57e1063bfce297c2e12392348598559-r4.0/linux/
> will not match anything because it ends with /.
> This BSP sets 1 kernel options that are possibly non-hardware related.
> The full list can be found in your kernel src dir at:
> meta/cfg/standard/common-pc-64/specified_non_hdw.cfg
>
> NOTE: package
> linux-yocto-3.4.4+git6+949fddda61053cc15e46c015e8f7db17e7b33360_6+6297e4c1d57e1063bfce297c2e12392348598559-r4.0:
> task do_kernel_configcheck: Succeeded
>
> OE @ ~/openembedded-core $ cat
> /OE/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto-3.4.4+git6+949fddda61053cc15e46c015e8f7db17e7b33360_6+6297e4c1d57e1063bfce297c2e12392348598559-r4.0/linux/meta/cfg/standard/common-pc-64/specified_non_hdw.cfg
> CONFIG_BLOCK
>
> wasn't this supposed to be fixed by those changes?

Not that one, it's being covered by the kernel config updates that are part
of yocto 1.3, which are in the upcoming M3 milestone. The one I mentioned
in that other email was CONFIG_NET_CLS_CGROUP.

Cheers,

Bruce

>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


