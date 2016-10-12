Return-Path: <net147@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 20C4060762
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 12:54:59 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id o141so2985983ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 05:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NV8qaCxhYMk6OF4u0wwtoVem2K3nEep9x1vYaVZMDG0=;
	b=VEO0b8qJToGRSHkalH527TRHm6BlNi7ZB1++AdM0S3u4kN2Y74VB19dJkIj2TNhx1o
	isPfbWLykcwKsi4ZaPH3tFX9eH0vWtwVs1N5ZisIJp2Fe/OiiY3m1ww+gYuKDXUzLWlu
	G39hZEXiCC/8FyfZR/6rVolgNScTbNTHRDhSTPYqRe/jY6PEPkPkXQEKzjoH9Q0+4j3+
	qy3WUy1B3jcBYC3jJiBk7QMD4QJ9tIHAIXJeTnoRhKo0yVLAZk74DB8Er33BsW4yYph9
	EWo56r2F2FtXHqp2pzlRb4zgoYY70zBF4uIYxI+yQfEJEZ0X7LSL+9Yz6a816n4eWuX+
	2tHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NV8qaCxhYMk6OF4u0wwtoVem2K3nEep9x1vYaVZMDG0=;
	b=W+lCGEKW08tXekIITxz+PVa4hO+tOewAsUzGz7qRBRpShggOlQbN4CwwChB4Ta7BLR
	DpgJCv+C/aL6pREIGQ6nlk7tlyWuCX7HXWDRjcaKu7UL91v7VIeHIXR0sJZsEglIW7n4
	5YUCFjgQWXm87G/YTDXoaxx8ULXlRAE9TuJ/wlwWoVcbZDMzeEgSZYF1bG2ToN0LuMOh
	GyJhnzFtfS8cD9T9Ljvs+V3tbxunL7B/lwhIFokKJWtK4OYnUmBg+S2BBID0o581ncED
	DeSZmXbXQCPgZ1HgpSQjlOrYT69Q2Pe1ZDDjWRXIjuXxqPYgMNuy2P1/j0XzgUzQ8IOR
	p1iw==
X-Gm-Message-State: AA6/9RkiXzmQtZSNlPV4W6rV7+FtTMAY3h2aU4lPXocXnuauQ5f0VHyuwLobrxsGH55nKqp7bqf0A8woPA3sPg==
X-Received: by 10.107.10.89 with SMTP id u86mr1509316ioi.84.1476276900983;
	Wed, 12 Oct 2016 05:55:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.60.73 with HTTP; Wed, 12 Oct 2016 05:55:00 -0700 (PDT)
In-Reply-To: <20161012121836.GA2923@jama>
References: <20161006085422.GA2921@jama> <20161012121836.GA2923@jama>
From: Jonathan Liu <net147@gmail.com>
Date: Wed, 12 Oct 2016 23:55:00 +1100
Message-ID: <CANwerB1ZjGMYWryOCXDo+muAbAYHsyLG4nG3Gt7DPQV_OYP5Qg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto and linux-libc-headers are again going backwards
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
X-List-Received-Date: Wed, 12 Oct 2016 12:55:02 -0000
Content-Type: text/plain; charset=UTF-8

On 12 October 2016 at 23:18, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Oct 06, 2016 at 10:54:22AM +0200, Martin Jansa wrote:
>> Either use 4.7.99+4.8-rc4 like most other recipes do or at least "4.8~rc4"
>> which might sort lower than "4.8" (but needs to be verified for all
>> packaging backends first).
>>
>> Ignoring all this completely results with what we can see in oe-core
>> now:
>>
>> ERROR: linux-libc-headers-4.8-r0 do_packagedata: QA Issue: Package
>> version for package linux-libc-headers-dbg went backwards which would
>> break package feeds from (0:4.8-rc4-r0.0 to 0:4.8-r0.0)
>> [version-going-backwards]
>
> I've noticed one more thing related to linux-yocto. Is it expected that
> only qemuarm is using 4.8 by default and (qemu)x86* is still using 4.4?
>
> meta/conf/machine/include/x86-base.inc:PREFERRED_VERSION_linux-yocto ??= "4.4%"
> meta/conf/machine/qemuarm.conf:PREFERRED_VERSION_linux-yocto ??= "4.8%"
>
> I've checked poky repository and it is using 4.8 at least for qemu* and various
> other MACHINEs, so it might make sense to use the same for nodistro for consistency?

Using bitbake and OE-core actually selects linux-yocto 4.8 for me.
Probably because x86-base.inc isn't actually used by the machine
definitions in OE-core.

I am also running into a kernel bug with linux-yocto 4.8 on x86:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10402

>
> OE @ ~/extras/poky $ git grep PREFERRED_VERSION.*linux-yocto
> bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.xml:     PREFERRED_VERSION_linux-yocto = "3.10%"
> documentation/bsp-guide/bsp.xml:     PREFERRED_VERSION_linux-yocto ?= "4.4%"
> documentation/ref-manual/ref-variables.xml:     PREFERRED_VERSION_linux-yocto = "3.19%"
> documentation/ref-manual/ref-variables.xml:     PREFERRED_VERSION_linux-yocto_qemux86 = "3.4%"
> documentation/ref-manual/ref-variables.xml:     PREFERRED_VERSION_linux-yocto_forcevariable = "3.4%"
> meta-poky/conf/distro/poky-lsb.conf:PREFERRED_VERSION_linux-yocto_linuxstdbase ?= "4.1%"
> meta-poky/conf/distro/poky-tiny.conf:PREFERRED_VERSION_linux-yocto-tiny ?= "4.4%"
> meta-poky/conf/distro/poky.conf:PREFERRED_VERSION_linux-yocto ?= "4.8%"
> meta-poky/conf/distro/poky.conf:PREFERRED_VERSION_linux-yocto_qemux86 ?= "4.8%"
> meta-poky/conf/distro/poky.conf:PREFERRED_VERSION_linux-yocto_qemux86-64 ?= "4.8%"
> meta-poky/conf/distro/poky.conf:PREFERRED_VERSION_linux-yocto_qemuarm ?= "4.8%"
> meta-poky/conf/distro/poky.conf:PREFERRED_VERSION_linux-yocto_qemumips ?= "4.8%"
> meta-poky/conf/distro/poky.conf:PREFERRED_VERSION_linux-yocto_qemumips64 ?= "4.8%"
> meta-poky/conf/distro/poky.conf:PREFERRED_VERSION_linux-yocto_qemuppc ?= "4.8%"
> meta-yocto-bsp/conf/machine/beaglebone.conf:PREFERRED_VERSION_linux-yocto ?= "4.8%"
> meta-yocto-bsp/conf/machine/edgerouter.conf:PREFERRED_VERSION_linux-yocto ?= "4.8%"
> meta-yocto-bsp/conf/machine/genericx86-64.conf:PREFERRED_VERSION_linux-yocto_genericx86-64 ?= "4.8%"
> meta-yocto-bsp/conf/machine/genericx86.conf:PREFERRED_VERSION_linux-yocto_genericx86 ?= "4.8%"
> meta-yocto-bsp/conf/machine/include/genericx86-common.inc:PREFERRED_VERSION_linux-yocto ?= "4.4%"
> meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf:PREFERRED_VERSION_linux-yocto ?= "4.8%"
> meta/conf/machine/include/x86-base.inc:PREFERRED_VERSION_linux-yocto ??= "4.4%"
> meta/conf/machine/qemuarm.conf:PREFERRED_VERSION_linux-yocto ??= "4.8%"
> meta/conf/machine/qemuarm.conf:QB_DTB = "${@base_version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
>
> Regards,
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

