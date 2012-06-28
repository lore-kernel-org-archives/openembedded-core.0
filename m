Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>)
	id 1SkOMD-0001Wh-T2; Fri, 29 Jun 2012 01:42:42 +0200
Received: by obcva7 with SMTP id va7so3799018obc.6
	for <multiple recipients>; Thu, 28 Jun 2012 16:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=sMmu+WuChUblQbDbUW1mAAKWtZlKFX6Pq6TbtjtYUsc=;
	b=cB+y/shO3SUh/Gh2afovax0JYpQJD8DI39m+gSmhh29+iTkK83rRpW38B9i0SIHmRW
	0PsO7kSCfH9sEWXBSTb2C4YQM5NfMKMmKn0ctJexPGsxcsKF5phAHZdZvb73ePbFvlhb
	+uT339NvuEOpgMOPCZUVbYbXN8LO0pbY0ehnUnUwZz+3jzANfiTVCVJaTOUPkq6zgYV0
	+iF+c7Li91WI0BSZklrEBYBPo8tizzHLFpLKoqfatbzMtSuB/TehAgJYl1wjtmLI2/AX
	kzSKE58CBVCkmHZiDCxFRlsnlvfVMb5ON+kNEsZhWPlAegKFeTZcb1Kz0J+wgrqL0yAv
	1Vkw==
MIME-Version: 1.0
Received: by 10.50.94.133 with SMTP id dc5mr76578igb.16.1340926305978; Thu, 28
	Jun 2012 16:31:45 -0700 (PDT)
Received: by 10.231.60.75 with HTTP; Thu, 28 Jun 2012 16:31:45 -0700 (PDT)
In-Reply-To: <20120628213215.GC3961@jama.jama.net>
References: <20120628152441.4D5571032F@opal>
	<20120628213215.GC3961@jama.jama.net>
Date: Thu, 28 Jun 2012 19:31:45 -0400
Message-ID: <CADkTA4OKVFgLnSJMMVOZLuuMyfDZXMpriZR_q0O7PjzoJMij8Q@mail.gmail.com>
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
X-List-Received-Date: Thu, 28 Jun 2012 23:42:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2012 at 5:32 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Jun 28, 2012 at 03:24:41PM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: be3cff86d55db6255e036d68e943e527802b4f4c
>> URL: =A0 =A0http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dc=
ommit;h=3Dbe3cff86d55db6255e036d68e943e527802b4f4c
>>
>> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>> Date: =A0 Fri Jun 15 15:26:44 2012 -0400
>>
>> kern-tools: add buildall and robustness fixes
>>
>> Updating the kern-tools SRCREV to pickup the following functionality:
>>
>> =A0- buildall: provides the ability to build all kernel branches
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0without a build system, only a cross compiler=
 and configme
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0are required.
>>
>> =A0- robustness/cleanups: obselete/unused code removal and general robus=
tness
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fixes from Paul Gortmake=
r and Bruce Ashfield
>
> is this expected with latest kern-tools/linux-yocto and qemux86-64?
>
> NOTE: package linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a53=
3cd0_3+a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0: task do_kernel_configch=
eck: Start
> ed
> NOTE: validating kernel configuration
> find: warning: -path /OE/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/lin=
ux-yocto/linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0_3+=
a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0/linux/ will not match anything =
because it ends with /.
> This BSP sets 1 kernel options that are possibly non-hardware related.
> The full list can be found in your kernel src dir at:
> meta/cfg/standard/common-pc-64/specified_non_hdw.cfg
>
> There were 1 instances of config fragment errors.
> The full list can be found in your kernel src dir at:
> meta/cfg/standard/common-pc-64/fragment_errors.txt
>
> NOTE: package linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a53=
3cd0_3+a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0: task do_kernel_configch=
eck: Succeeded
>
>
> OE @ ~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linux-yoc=
to-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0_3+a1cdb60720c452c396=
5eaec3ec2c
> d10f06261cc5-r0/linux $ cat meta/cfg/standard/common-pc-64/specified_non_=
hdw.cfg
> CONFIG_BLOCK
> OE @ ~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linux-yoc=
to-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0_3+a1cdb60720c452c396=
5eaec3ec2c
> d10f06261cc5-r0/linux $ cat meta/cfg/standard/common-pc-64/fragment_error=
s.txt
> Warning: Value of CONFIG_NET_CLS_CGROUP is defined multiple times within =
fragment meta/cfg/kernel-cache/features/net_sched/net_sched.cfg:
> CONFIG_NET_CLS_CGROUP=3Dy
> CONFIG_NET_CLS_CGROUP=3Dy

It is, only because I was waiting for my other queued changes to get pulled
before sending another batch:

http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/commit/?id=3D0=
329bbc053c97f9b250454ff6a60727f75973706

Cheers,

Bruce

>
> Cheers,
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


