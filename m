Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 658C06FE3B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 13:02:39 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id mc6so882929lab.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 06:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=J23EkNoO5VwYtwPYkugIJEpSvaj19Q682c34jfNWJlQ=;
	b=j9SKfF2XaRiMHyjcyjOpD5CLoKCo/f8QhmYXd0YP6/+yoJmXgMjf3UOfP+sD9oAJrz
	y9h1LbWpCHWLTiPSK8OPHA6pAlWeP60HbvcM02k9DMDUFAe5T9fZeD22duCPcU2ptOCS
	NcHbInHvwhHKY5DctjpWo0V+jOpyeoihRV/VYfK4IXA7hzhM3pJwTmnTg2TtN2pkLF5o
	A+IQ170mRZn/WaicapvGEhoiyTZCO2dZYBE5KzjnGNW/x+M+3thv4xtx7sIfQV0chHbB
	hvi/cbyoW+QrwyyIe4ca3GtrwtChF00DSQ6yqOaMBCq8IP6cIMWC7qrdRpZIp+N6j6Co
	ke6Q==
MIME-Version: 1.0
X-Received: by 10.152.23.6 with SMTP id i6mr8816380laf.39.1410526960220; Fri,
	12 Sep 2014 06:02:40 -0700 (PDT)
Received: by 10.112.202.67 with HTTP; Fri, 12 Sep 2014 06:02:40 -0700 (PDT)
In-Reply-To: <CAJTo0La9+9YnJPPaCNXp_7H+_ejYVuOgKb8QRNkV0q3hdZRnAw@mail.gmail.com>
References: <1410507789-9307-1-git-send-email-kai.kang@windriver.com>
	<CAJTo0La9+9YnJPPaCNXp_7H+_ejYVuOgKb8QRNkV0q3hdZRnAw@mail.gmail.com>
Date: Fri, 12 Sep 2014 09:02:40 -0400
Message-ID: <CADkTA4N5K7XecxZNJrgDqvjVzRvGech7pvM0SEyftt7pzf6tvg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Joe Slater <jslater@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add machine qemuarm64
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
X-List-Received-Date: Fri, 12 Sep 2014 13:02:47 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 12, 2014 at 6:22 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 12 September 2014 08:43, Kai Kang <kai.kang@windriver.com> wrote:
>> There are some packages fail to build with qemuarm64, I will send pathches
>> for them in another series.
>
> I can't build a kernel with MACHINE=qemuarm64:

Even if this did build, I'm not sure what you'd end up with .. no one
has sent me
the linux-yocto machine definition and configuration fragments for qemuarm64
yet.

Bruce

>
> |   LINK    vmlinux
> |   LD      vmlinux.o
> | aarch64-poky-linux-ld.bfd: cannot find libgcc.a: No such file or directory
> | aarch64-poky-linux-ld.bfd: cannot find libgcc.a: No such file or directory
> | make[2]: *** [vmlinux] Error 1
> | make[1]: *** [sub-make] Error 2
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at
> /data/poky-master/tmp/work/qemuarm64-poky-linux/linux-yocto/3.14.17+gitAUTOINC+a94680bfeb_b85edae6fd-r0/temp/log.do_compile.24366)
> ERROR: Task 81 (/home/ross/Yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.14.bb,
> do_compile) failed with exit code '1'
>
> I can email build logs if you'd wish.
>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

