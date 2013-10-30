Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id C5B236D4B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 23:45:44 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id tp5so3533188ieb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 16:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5gJTc9hWOpzvux/ydyK0hRLyAqNncbfVXM4Rw96VLoI=;
	b=i33Y63MPmi7TVHAiIWzxzziQZRV2AFDRH1p9PJxuHg3dQTOEBa4jJfe9QG6bo8u/J0
	31e9VPBpxqFrE2c3w+74B0gIAbaiF3A4Tb6AJ6RlQSeRY/to65wrjIZenng1Fy2czjYS
	z4mpAHhUg3HBaESRy/IKIJfEuVFJAkBmEy3FWhFQvf1O8H2pSeH/KT4cxBIJWP/Qaacp
	YWODr/5FBJMFAxj1ZfjOmNyQvDsRSgWavOGwmGsZqySxmrlalkUrLsDYqLEUeuPDAvd7
	wTwaTRiR5NiP4Qe9PwmBsy78iKqWnZifKlhsKgrm/Bqy3owr4oe6LMR4pWzE+dPsv7QP
	3i6g==
X-Received: by 10.43.98.202 with SMTP id cp10mr182136icc.28.1383176746512;
	Wed, 30 Oct 2013 16:45:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Wed, 30 Oct 2013 16:45:15 -0700 (PDT)
In-Reply-To: <CAP9ODKrGAG00NrEaZ=yz=HnWXC1jRVY7fQQxQ8J3ejA7_QC2TA@mail.gmail.com>
References: <CAP9ODKrGAG00NrEaZ=yz=HnWXC1jRVY7fQQxQ8J3ejA7_QC2TA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Oct 2013 16:45:15 -0700
Message-ID: <CAMKF1sqO+M93MhsM9m5Qo+zTDAVvNJp6beYKnsR76T_PoeSROw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Non-deterministic build failure
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
X-List-Received-Date: Wed, 30 Oct 2013 23:45:45 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 28, 2013 at 4:12 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello,
>
> I got following:
>
> | /home/otavio/hacking/fsl-community-bsp/build/tmp/sysroots/x86_64-linux/usr/libexec/armv5te-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.8.1/ld:
> cannot find /lib/libc.so.6
> | /home/otavio/hacking/fsl-community-bsp/build/tmp/sysroots/x86_64-linux/usr/libexec/armv5te-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.8.1/ld:
> cannot find /usr/lib/libc_nonshared.a
> | /home/otavio/hacking/fsl-community-bsp/build/tmp/sysroots/x86_64-linux/usr/libexec/armv5te-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.8.1/ld:
> cannot find /lib/ld-linux.so.3
> | collect2: error: ld returned 1 exit status
> | make[1]: *** [../../../bin/moc] Error 1
> | make[1]: Leaving directory
> `/home/otavio/hacking/fsl-community-bsp/build/tmp/work/armv5te-poky-linux-gnueabi/qt4-x11-free/4.8.5-r0/qt-everywhere-opensource-src-4.8.5/src/tools/moc'
> | make: *** [sub-moc-make_default-ordered] Error 2
> | ERROR: oe_runmake failed
> | WARNING: /home/otavio/hacking/fsl-community-bsp/build/tmp/work/armv5te-poky-linux-gnueabi/qt4-x11-free/4.8.5-r0/temp/run.do_compile.25489:1
> exit 1 from
> |   exit 1
> | ERROR: Function failed: do_compile (log file is located at
> /home/otavio/hacking/fsl-community-bsp/build/tmp/work/armv5te-poky-linux-gnueabi/qt4-x11-free/4.8.5-r0/temp/log.do_compile.25489)
> NOTE: recipe qt4-x11-free-4.8.5-r0: task do_compile: Failed
> NOTE: recipe lttng-modules-2.3.2+gitAUTOINC+4f1217f8ce-r0: task
> do_fetch: Started
> ERROR: Task 465
> (/home/otavio/hacking/fsl-community-bsp/sources/poky/meta/recipes-qt/qt4/qt4-x11-free_4.8.5.bb,
> do_compile) failed with exit code '1'
> NOTE: recipe lttng-modules-2.3.2+gitAUTOINC+4f1217f8ce-r0: task
> do_fetch: Succeeded
>
> This only happens when building in my auto-builder; it does not happen
> when building byhand in my laptop.
>
> Can someone give any hint how to debug it?

look at the libtool ( *.la) files most probably there is some package
on your autobuilder
which is creeping in with host dependencies and fooling with libtool

>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

