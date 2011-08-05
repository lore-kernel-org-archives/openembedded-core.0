Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>)
	id 1Qp9lL-0002s4-J3; Fri, 05 Aug 2011 04:03:47 +0200
Received: by fxg11 with SMTP id 11so1500983fxg.6
	for <multiple recipients>; Thu, 04 Aug 2011 18:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=J+i7Vw2o2K3RVs0v8acdFNryL9PE9dwuaOI0JR7UKiA=;
	b=OexpYq9UoznQee5CEyhuIqE7hAhCS1IqvI0YxeFcvs08iY7Tv5x01swwExft/hhN9X
	L9Id1SeiZ0BQ/M6C/8UiuVGrYKbxbOlk7NzqfQy2dtbVuJM+nc3EJlU8VTnhuMzj8TiE
	9/xZhy/vvCrl+/PVDC2BtuNl/Mn8ahWO7lraU=
MIME-Version: 1.0
Received: by 10.223.10.76 with SMTP id o12mr1848178fao.88.1312509563320; Thu,
	04 Aug 2011 18:59:23 -0700 (PDT)
Received: by 10.223.97.78 with HTTP; Thu, 4 Aug 2011 18:59:23 -0700 (PDT)
In-Reply-To: <CAD=GYpbOnTOuEsNXiPuoC+cyuyo6MGFh1TqGKf8BB3o=S-YSmA@mail.gmail.com>
References: <CAG+hza7G2jZDtHQ5iOK3KCwYRGcZ-YPBfUcyMfJuWnKaxJdSKw@mail.gmail.com>
	<A7A15010-967D-49FD-8E50-27D6ED26E025@dominion.thruhere.net>
	<CAD=GYpbOnTOuEsNXiPuoC+cyuyo6MGFh1TqGKf8BB3o=S-YSmA@mail.gmail.com>
Date: Thu, 4 Aug 2011 20:59:23 -0500
Message-ID: <CAD=GYpYWZYYe0d6dqGyHn0+N5p-QM+VAryomfOfo-CtHMFQUdQ@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Enrico Butera <enrico.butera@ise-srl.it>,
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: gstreamer-ti, questions
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
X-List-Received-Date: Fri, 05 Aug 2011 02:03:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 4, 2011 at 8:04 PM, Joel A Fernandes <agnel.joel@gmail.com> wro=
te:
> On Thu, Aug 4, 2011 at 2:44 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>>
>> Op 3 aug. 2011, om 18:28 heeft Enrico Butera het volgende geschreven:
>>
>>> I've started importing bb files from oe classic into
>>> meta-texasinstruments, i still not have a clean build of everything
>>> but here are some "basic" questions:
>>>
>>> - cross compiler binaries:
>>>
>>> in classic oe there were
>>> "sysroots/i686-linux/usr/armv7a/bin/arm-angstrom-linux-gnueabi-[gcc,ld.=
..]"
>>> and "sysroots/i686-linux/usr/armv7a/arm-angstrom-linux-gnueabi/bin/[gcc=
,ld...]",
>>> some ti tools use one, some the other. Now there is only
>>> usr/bin/armv7a..... and this "confuses" some ti tools.
>>>
>>> The question is: what is the proper way to handle this? patch gcc
>>> install to have a similar layout to classic oe? patch ti tools to
>>> "fix" them?
>>
>>
>> Joel was running into similar problems with https://github.com/joelagnel=
/meta-texasinstruments/commits/master can you guys have a look at it togeth=
er?
>>
>
> I think its cleaner to have the toolchain to define symlinks in /bin
>
> I've done this in the gcc-cross recipe in do_install (which is
> hopefully the right place to do it)
>
> http://www.hackerbliss.org/joel/cgit/cgit.cgi/oe-core/commit/?id=3D2878a7=
12aabf839cb4c6e84961b6e8deafacf824
>
> Now ti-codec-engine codecs, extensions and server builds but the
> 'apps' fails to build with a linker error.
>
> Here's the compiler log:
> [..]
> #
> # lnkv5T bin/ti_platforms_evm3530/app_remote.xv5T ...
> /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglib=
c/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/arm-angstrom-li=
nux-gnueabi-gcc
> =A0 -o bin/ti_platforms_evm3530/app_remote.xv5T
> package/cfg/bin/ti_platforms_evm3530/app_remote/main_native.ov5T
> package/cfg/bin/ti_platforms_evm3530/app_remote_xv5T.ov5T
> package/cfg/bin/ti_platforms_evm3530/app_remote/app.ov5T
> package/cfg/bin/ti_platforms_evm3530/app_remote_xv5T.xdl
> -L/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-egl=
ibc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/arm-angstrom-=
linux-gnueabi/lib
> -lpthread


Interestingly the path:
/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/=
sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/arm-angstrom-linu=
x-gnueabi/lib

doesn't exist, which explains the symbol errors.

libgcc contains the symbol `__aeabi_uidivmod'

Does this point to another problem with the toolchain? How would we fix thi=
s?

thanks,
Joel


