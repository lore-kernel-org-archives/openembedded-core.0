Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id C526265E58
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 20:25:06 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id s7so1169184lbd.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 13:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=J4/cwpH5AOAdPyj7yIkpcflC869HxDcOjzLWx7eDVsU=;
	b=QD0YD1FNlcNQHUwdYgPJqaFUabdssnqzqMvd0GU71SVSgQekg+CCVQahO+ZcGcueqs
	H9mp23hKM6PYltznwz7eVhdFeIPiD/5OaXHIC/x8X9E82waaDdlIYVatuxqrDjk02Xu0
	Un7p6Ycr/NzSXGji4nqX4YkBTZ7vRVjysN1ATrgyyG8fvW/FRT1GW8ym4sUrwVe18BOg
	re7lxl6QoCoyP+VfmAKniWZ3gHEMU5ykUAKeIjkWoAqb+WSeaC4ppaSsjKAhCFR/B64q
	+CZsdvfpZbZT8Cki2/1PugpUxfyuZaOJL3zh2cGDT8MmUnNMX54E/Z19t8I3p46LvXg/
	wL2g==
MIME-Version: 1.0
X-Received: by 10.152.87.164 with SMTP id az4mr2263024lab.74.1403641506874;
	Tue, 24 Jun 2014 13:25:06 -0700 (PDT)
Received: by 10.112.124.137 with HTTP; Tue, 24 Jun 2014 13:25:06 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1406241348150.12872@localhost>
References: <alpine.LFD.2.11.1406241348150.12872@localhost>
Date: Tue, 24 Jun 2014 16:25:06 -0400
Message-ID: <CADkTA4NgU0oLbh0G0zpuDfpZa6iSSQBStQFrCFH7Z=N7OkcLZw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: OE build of qemux86 fails for linux-yocto: undefined reference to `.LASF1122'
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
X-List-Received-Date: Tue, 24 Jun 2014 20:25:08 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 24, 2014 at 1:50 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   doing a test build of core-image-minimal for qemux86 using current
> git pull of openembedded-core, and got:
>
> |   LD      init/built-in.o
> | drivers/built-in.o:(.debug_info+0x106096a): undefined reference to
> `.LASF1122'
> |
> /home/rpjday/oe/builds/oe/qemux86/tmp-eglibc/work/qemux86-oe-linux/linux-yocto/3.14.5+gitAUTOINC+602be954ac_41d5fe27dc-r0/linux/Makefile:827:
> recipe for target 'vmlinux' failed
> | make[2]: *** [vmlinux] Error 1
> | Makefile:133: recipe for target 'sub-make' failed
> | make[1]: *** [sub-make] Error 2
> | Makefile:26: recipe for target 'all' failed
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
>
>   i'm about to try again to make sure it wasn't a transient glitch,
> but has anyone else seen this?

builds here, and on the autobuilders.

hmm.

Bruce

>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

