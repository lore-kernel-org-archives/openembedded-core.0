Received: from mail-lb0-f181.google.com ([209.85.217.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1UN4rU-0007Iy-QX
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 19:19:08 +0200
Received: by mail-lb0-f181.google.com with SMTP id r11so691976lbv.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2013 10:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=9uzMb5fzezDWlfHXl4SGCQu8OruOvUAZWsVaLwc1sAg=;
	b=AOlQvVrSYI8aUFsDOhCOh6Z3ewrd0Vttj4xpILgRl32a2lsgi15temDR+hHZE9CzOg
	barPHzetlfHUq193W7BlTztvxMMVJwfI4mW+3xEn1l7msPqOXpnEMYggu0GYhIl02eqI
	1QmrmAbdNIon0NSu2Y2SxjxkbufuklO/JKVM/bUcG/nkQ4D7IOdIlJLxScrj8hKtXOPV
	J8k/K/84TlAoeU53GrAtGASURnkOoJa0AQ/KAdmzrfAxlgkbYaMsPBd1B178orXUEaGE
	6LhtpZIcjrW2W3p3hS5mr6tQoVNrBxD0LM9n168egVki/ouLTLq5BtPwPcfDFtKDGCkl
	wfmg==
MIME-Version: 1.0
X-Received: by 10.112.137.162 with SMTP id qj2mr8158714lbb.26.1364922118744;
	Tue, 02 Apr 2013 10:01:58 -0700 (PDT)
Received: by 10.112.61.3 with HTTP; Tue, 2 Apr 2013 10:01:58 -0700 (PDT)
In-Reply-To: <cover.1364551873.git.hongxu.jia@windriver.com>
References: <cover.1364551873.git.hongxu.jia@windriver.com>
Date: Tue, 2 Apr 2013 13:01:58 -0400
Message-ID: <CADkTA4MeGQQajjwdGk0An80zS09BRs7CfOEAXdp85G5TPY8SYg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1][yocto-kernel-cache]meta: update atom-pc-wifi.cfg for audit purposes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2013 17:19:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Apr 1, 2013 at 10:34 PM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> The following changes since commit 0fac9380caa5eaf8038536413366511c48b579b0:
>
>   meta: Remove Cedartrail Machine (2013-02-10 23:54:01 -0500)
>
> are available in the git repository at:
>
>   git://git.pokylinux.org/poky-contrib hongxu/fix-atompc-kernel-warn
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-atompc-kernel-warn

Thanks for the changes, they look good, but we have a couple of process items
to fix!

 - make sure to cc me directly on kernel config or kernel changes,
otherwise I may
   miss them.

 - cc linux-yocto@yoctoproject.org (you need to subscribe) instead of
oe-core, I'll
   update oe-core once the changes are merged

 - modify the linux-yocto-<version> meta branch, not the kernel cache
directly. I'll
   merge changes to the kernel-cache when integrating the change to the release
   kernel.

Cheers,

Bruce

>
> Hongxu Jia (1):
>   meta: update atom-pc-wifi.cfg for audit purposes
>
>  bsp/atom-pc/atom-pc-wifi.cfg |   11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>
> --
> 1.7.10.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


