Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>)
	id 1Skb39-0006HL-IB; Fri, 29 Jun 2012 15:15:51 +0200
Received: by qabg1 with SMTP id g1so713992qab.6
	for <multiple recipients>; Fri, 29 Jun 2012 06:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=0aHckQN8r+x+ljr933fEcecNcsF7sWOjyNGdG81QxVw=;
	b=wAPIgMCoIww7sqFRLWxGI+lTMy0D4bQ1pupnYuLvMBprxU2Q6oDdf91G6UgHJVUIQ0
	jvdpSbXWqSe7FPb0/XRKkSa4GokngmO4VBHjV1dZcDi80pEMFM5KUDr7ZWCMR/0dZ5eB
	s8wQpprokv1VSDb5h2nHfNrO9X1Niwe88xizBa94kKBMVgZxwv8tWq91Y4+v7b8dLf6t
	Bby4CpO2HfRCqP+qRBg3siz63z0aSRN8lN2f7IEv2y3Xd7ewT3qF5jgu/RxZX6dzntsd
	8y/Ej1tBRjyhrT5nDqiXKFgN4shZo+ZuY2FE/vHS9hOqmL6Y72XIxHCk9d8OEDy2xkbo
	y3pQ==
MIME-Version: 1.0
Received: by 10.224.39.131 with SMTP id g3mr3572780qae.93.1340975095087; Fri,
	29 Jun 2012 06:04:55 -0700 (PDT)
Received: by 10.229.41.5 with HTTP; Fri, 29 Jun 2012 06:04:54 -0700 (PDT)
In-Reply-To: <20120629060037.GD3961@jama.jama.net>
References: <20120628152441.4D5571032F@opal>
	<20120628213215.GC3961@jama.jama.net>
	<CADkTA4OKVFgLnSJMMVOZLuuMyfDZXMpriZR_q0O7PjzoJMij8Q@mail.gmail.com>
	<20120629060037.GD3961@jama.jama.net>
Date: Fri, 29 Jun 2012 09:04:54 -0400
Message-ID: <CADkTA4MxhVtYtH0Y==R64A7bnSaMjmrSM6RqekBU5PxuJNK0jA@mail.gmail.com>
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
X-List-Received-Date: Fri, 29 Jun 2012 13:15:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 29, 2012 at 2:00 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Jun 28, 2012 at 07:31:45PM -0400, Bruce Ashfield wrote:
>> On Thu, Jun 28, 2012 at 5:32 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> > On Thu, Jun 28, 2012 at 03:24:41PM +0000, git@git.openembedded.org wro=
te:
>> >> Module: openembedded-core.git
>> >> Branch: master
>> >> Commit: be3cff86d55db6255e036d68e943e527802b4f4c
>> >> URL: =A0 =A0http://git.openembedded.org/?p=3Dopenembedded-core.git&a=
=3Dcommit;h=3Dbe3cff86d55db6255e036d68e943e527802b4f4c
>> >>
>> >> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>> >> Date: =A0 Fri Jun 15 15:26:44 2012 -0400
>> >>
>> >> kern-tools: add buildall and robustness fixes
>> >>
>> >> Updating the kern-tools SRCREV to pickup the following functionality:
>> >>
>> >> =A0- buildall: provides the ability to build all kernel branches
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0without a build system, only a cross compi=
ler and configme
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0are required.
>> >>
>> >> =A0- robustness/cleanups: obselete/unused code removal and general ro=
bustness
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fixes from Paul Gortm=
aker and Bruce Ashfield
>> >
>> > is this expected with latest kern-tools/linux-yocto and qemux86-64?
>> >
>> > NOTE: package linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84=
a533cd0_3+a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0: task do_kernel_confi=
gcheck: Start
>> > ed
>> > NOTE: validating kernel configuration
>> > find: warning: -path /OE/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/=
linux-yocto/linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0=
_3+a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0/linux/ will not match anythi=
ng because it ends with /.
>> > This BSP sets 1 kernel options that are possibly non-hardware related.
>> > The full list can be found in your kernel src dir at:
>> > meta/cfg/standard/common-pc-64/specified_non_hdw.cfg
>> >
>> > There were 1 instances of config fragment errors.
>> > The full list can be found in your kernel src dir at:
>> > meta/cfg/standard/common-pc-64/fragment_errors.txt
>> >
>> > NOTE: package linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84=
a533cd0_3+a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0: task do_kernel_confi=
gcheck: Succeeded
>> >
>> >
>> > OE @ ~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linux-=
yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0_3+a1cdb60720c452c=
3965eaec3ec2c
>> > d10f06261cc5-r0/linux $ cat meta/cfg/standard/common-pc-64/specified_n=
on_hdw.cfg
>> > CONFIG_BLOCK
>> > OE @ ~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linux-=
yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0_3+a1cdb60720c452c=
3965eaec3ec2c
>> > d10f06261cc5-r0/linux $ cat meta/cfg/standard/common-pc-64/fragment_er=
rors.txt
>> > Warning: Value of CONFIG_NET_CLS_CGROUP is defined multiple times with=
in fragment meta/cfg/kernel-cache/features/net_sched/net_sched.cfg:
>> > CONFIG_NET_CLS_CGROUP=3Dy
>> > CONFIG_NET_CLS_CGROUP=3Dy
>>
>> It is, only because I was waiting for my other queued changes to get pul=
led
>> before sending another batch:
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/commit/?id=
=3D0329bbc053c97f9b250454ff6a60727f75973706
>
> Ah OK, from those validation messages it wasn't very clear if it's
> info/warning/error/fatal.

Agreed :)

>
> BTW: there is typo in this new commit 'dupicate'

It won't be my last! ;)

Bruce

>
> Cheers,
>
>>
>> Cheers,
>>
>> Bruce
>>
>> >
>> > Cheers,
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


