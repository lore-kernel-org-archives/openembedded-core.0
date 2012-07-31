Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>)
	id 1SwBzY-00047i-6l; Tue, 31 Jul 2012 14:56:04 +0200
Received: by qabg1 with SMTP id g1so1972689qab.6
	for <multiple recipients>; Tue, 31 Jul 2012 05:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=BL3t7O8Al84Ng6WhqoGjVfcaY48Q7NL0gcnkCChWFa0=;
	b=GckYNc24TE2FtuyGHlGG9cCRzsb7cv3pTH5ns30ZXkGj2lKLDrwykp/euGx74s1R/I
	S7HzIDn+SP1GNdT0+zWkaxHvf/tOsj0R06gMI5F+ZUFqqb4sl2xP4YAFBolH7IrCA2Lt
	UwaeOadkxscICZrcN4u310e4TEO+1Qy1Q+aQsKt0jup7TZxX1npzHEoauMSiLH/JuNus
	PIsYwYys3vqYLuvz9ZyPM7XPFCaQfZEl6St6UK8W/rpefdSTx1zvKtCsJUQCL14vAOvj
	iustWorloI1ka/ZBW0Kju2AyGN5DXBpwt9w0LCfyUys6ZYOh/rsJu4fE2bSQv/d/bNrq
	7hxA==
MIME-Version: 1.0
Received: by 10.224.216.7 with SMTP id hg7mr29276266qab.3.1343738666480; Tue,
	31 Jul 2012 05:44:26 -0700 (PDT)
Received: by 10.229.247.198 with HTTP; Tue, 31 Jul 2012 05:44:26 -0700 (PDT)
In-Reply-To: <20120731112120.GS3261@jama.jama.net>
References: <20120628152441.4D5571032F@opal>
	<20120628213215.GC3961@jama.jama.net>
	<CADkTA4OKVFgLnSJMMVOZLuuMyfDZXMpriZR_q0O7PjzoJMij8Q@mail.gmail.com>
	<20120629060037.GD3961@jama.jama.net>
	<CADkTA4MxhVtYtH0Y==R64A7bnSaMjmrSM6RqekBU5PxuJNK0jA@mail.gmail.com>
	<20120723084908.GB3271@jama.jama.net>
	<CADkTA4N=CGskq0oiOxVLa_8rzLyLziyxCyEq-3Zt4t8_TYiABQ@mail.gmail.com>
	<20120731112120.GS3261@jama.jama.net>
Date: Tue, 31 Jul 2012 08:44:26 -0400
Message-ID: <CADkTA4OeBTyCyqbQm7GoB8ivdpvm-b=Nrb6Xuwn=TTecybhn9g@mail.gmail.com>
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
X-List-Received-Date: Tue, 31 Jul 2012 12:56:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2012 at 7:21 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Mon, Jul 23, 2012 at 08:46:06AM -0400, Bruce Ashfield wrote:
>> On Mon, Jul 23, 2012 at 4:49 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> > On Fri, Jun 29, 2012 at 09:04:54AM -0400, Bruce Ashfield wrote:
>> >> On Fri, Jun 29, 2012 at 2:00 AM, Martin Jansa <martin.jansa@gmail.com=
> wrote:
>> >> > On Thu, Jun 28, 2012 at 07:31:45PM -0400, Bruce Ashfield wrote:
>> >> >> On Thu, Jun 28, 2012 at 5:32 PM, Martin Jansa <martin.jansa@gmail.=
com> wrote:
>> >> >> > On Thu, Jun 28, 2012 at 03:24:41PM +0000, git@git.openembedded.o=
rg wrote:
>> >> >> >> Module: openembedded-core.git
>> >> >> >> Branch: master
>> >> >> >> Commit: be3cff86d55db6255e036d68e943e527802b4f4c
>> >> >> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&=
a=3Dcommit;h=3Dbe3cff86d55db6255e036d68e943e527802b4f4c
>> >> >> >>
>> >> >> >> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>> >> >> >> Date:   Fri Jun 15 15:26:44 2012 -0400
>> >> >> >>
>> >> >> >> kern-tools: add buildall and robustness fixes
>> >> >> >>
>> >> >> >> Updating the kern-tools SRCREV to pickup the following function=
ality:
>> >> >> >>
>> >> >> >>  - buildall: provides the ability to build all kernel branches
>> >> >> >>              without a build system, only a cross compiler and =
configme
>> >> >> >>              are required.
>> >> >> >>
>> >> >> >>  - robustness/cleanups: obselete/unused code removal and genera=
l robustness
>> >> >> >>                         fixes from Paul Gortmaker and Bruce Ash=
field
>> >> >> >
>> >> >> > is this expected with latest kern-tools/linux-yocto and qemux86-=
64?
>> >> >> >
>> >> >> > NOTE: package linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62=
d0aa84a533cd0_3+a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0: task do_kernel=
_configcheck: Start
>> >> >> > ed
>> >> >> > NOTE: validating kernel configuration
>> >> >> > find: warning: -path /OE/shr-core/tmp-eglibc/work/qemux86_64-oe-=
linux/linux-yocto/linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a=
533cd0_3+a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0/linux/ will not match =
anything because it ends with /.
>> >> >> > This BSP sets 1 kernel options that are possibly non-hardware re=
lated.
>> >> >> > The full list can be found in your kernel src dir at:
>> >> >> > meta/cfg/standard/common-pc-64/specified_non_hdw.cfg
>> >> >> >
>> >> >> > There were 1 instances of config fragment errors.
>> >> >> > The full list can be found in your kernel src dir at:
>> >> >> > meta/cfg/standard/common-pc-64/fragment_errors.txt
>> >> >> >
>> >> >> > NOTE: package linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62=
d0aa84a533cd0_3+a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0: task do_kernel=
_configcheck: Succeeded
>> >> >> >
>> >> >> >
>> >> >> > OE @ ~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/=
linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0_3+a1cdb6072=
0c452c3965eaec3ec2c
>> >> >> > d10f06261cc5-r0/linux $ cat meta/cfg/standard/common-pc-64/speci=
fied_non_hdw.cfg
>> >> >> > CONFIG_BLOCK
>> >> >> > OE @ ~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/=
linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0_3+a1cdb6072=
0c452c3965eaec3ec2c
>> >> >> > d10f06261cc5-r0/linux $ cat meta/cfg/standard/common-pc-64/fragm=
ent_errors.txt
>> >> >> > Warning: Value of CONFIG_NET_CLS_CGROUP is defined multiple time=
s within fragment meta/cfg/kernel-cache/features/net_sched/net_sched.cfg:
>> >> >> > CONFIG_NET_CLS_CGROUP=3Dy
>> >> >> > CONFIG_NET_CLS_CGROUP=3Dy
>> >> >>
>> >> >> It is, only because I was waiting for my other queued changes to g=
et pulled
>> >> >> before sending another batch:
>> >> >>
>> >> >> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/commi=
t/?id=3D0329bbc053c97f9b250454ff6a60727f75973706
>> >> >
>> >> > Ah OK, from those validation messages it wasn't very clear if it's
>> >> > info/warning/error/fatal.
>> >
>> > First warning/error/.. is still there with latest linux-yocto
>> > NOTE: package
>> > linux-yocto-3.4.4+git6+949fddda61053cc15e46c015e8f7db17e7b33360_6+6297=
e4c1d57e1063bfce297c2e12392348598559-r4.0:
>> > task do_kernel_configcheck: Started
>> > NOTE: validating kernel configuration
>> > find: warning: -path
>> > /OE/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto-3.4.4+git=
6+949fddda61053cc15e46c015e8f7db17e7b33360_6+6297e4c1d57e1063bfce297c2e1239=
2348598559-r4.0/linux/
>> > will not match anything because it ends with /.
>> > This BSP sets 1 kernel options that are possibly non-hardware related.
>> > The full list can be found in your kernel src dir at:
>> > meta/cfg/standard/common-pc-64/specified_non_hdw.cfg
>> >
>> > NOTE: package
>> > linux-yocto-3.4.4+git6+949fddda61053cc15e46c015e8f7db17e7b33360_6+6297=
e4c1d57e1063bfce297c2e12392348598559-r4.0:
>> > task do_kernel_configcheck: Succeeded
>> >
>> > OE @ ~/openembedded-core $ cat
>> > /OE/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto-3.4.4+git=
6+949fddda61053cc15e46c015e8f7db17e7b33360_6+6297e4c1d57e1063bfce297c2e1239=
2348598559-r4.0/linux/meta/cfg/standard/common-pc-64/specified_non_hdw.cfg
>> > CONFIG_BLOCK
>> >
>> > wasn't this supposed to be fixed by those changes?
>>
>> Not that one, it's being covered by the kernel config updates that are p=
art
>> of yocto 1.3, which are in the upcoming M3 milestone. The one I mentione=
d
>> in that other email was CONFIG_NET_CLS_CGROUP.
>
> And that warning from find?
> find: warning: -path
> /OE/oe-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto-3.4.6+git1+7f=
f48aa47c50b6455d60ca93bc81260ce8fe1a1b_1+19f7e43b54aef08d58135ed2a897d77b62=
4b320a-r4.0/linux/
> will not match anything because it ends with /.

I hadn't noticed this one, I'll track it down and queue a change.

Cheers,

Bruce

>
> Cheers,
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


