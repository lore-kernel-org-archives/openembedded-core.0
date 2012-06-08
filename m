Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Sd31I-00037B-AR
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 19:30:45 +0200
Received: by dalh21 with SMTP id h21so2473513dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2012 10:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=7qXUWh0YbMEWkp29vMoQGxm/9K4aR8YXmMuf7UxZEl0=;
	b=0CJTvXtsQFd+R1Tq2ZRJ4SKt9+UYcxHMF/R6jjm7mVMXPkBx/7cd09OziMzaZdmdN/
	01ZvwjwpjRy+apKh1kUGCzRtjlsnE7pIXD40aoqrAEbw2sOfRDfHNODkePQEqAH6GVsK
	uzR5Vfypsh3XXBWVzsSp9G6edZa+Wlbj3qWnXy+Se8k7MuMkYOWs+zAYtIsdE5W9b8SR
	iOju2/9dk3+FcUNBzHmNujnb8HDse3ird1gckchXQjDZLXNv8Ik60nzjscBBKwVqFHy3
	9EFP7HrfD4NvzTdRFdCZegy6lB5ev5LYWUOWOuQMgx4OB+LwOjddrh4mzfOlCLWMrAiB
	93Tw==
MIME-Version: 1.0
Received: by 10.68.130.35 with SMTP id ob3mr23153319pbb.40.1339176012622; Fri,
	08 Jun 2012 10:20:12 -0700 (PDT)
Received: by 10.68.197.4 with HTTP; Fri, 8 Jun 2012 10:20:12 -0700 (PDT)
In-Reply-To: <4FD2326D.5050109@intel.com>
References: <4FD2326D.5050109@intel.com>
Date: Fri, 8 Jun 2012 13:20:12 -0400
Message-ID: <CADkTA4PxW5UP3R6Wq7b6h7u2qKoqa4qmgjPu_T9CYF6bZROLYQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: initial setup on my laptop
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
X-List-Received-Date: Fri, 08 Jun 2012 17:30:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 8, 2012 at 1:12 PM, Radu Moisan <radu.moisan@intel.com> wrote:
> I'm trying to setup everything on my laptop and I cannot start any build.=
 I
> must have missed something, the following is the error I get:

See the patches on the list from a few hours ago. I had a bad SRCREV in one
meta branch update, and due to the way the fetcher has to work, it breaks
everyone's build.

Hopefully the fix merges soon ..

Bruce

>
> radu@elitebook> bitbake core-image-minimal
> Pseudo is not present but is required, building this first before the mai=
n
> build
> Loading cache: 100%
> |########################################################################=
##########################################################################|
> ETA:=A0 00:00:00
> Loaded 1146 entries from dependency cache.
> NOTE: Error expanding variable
> do_patch
> | ETA:=A0 --:--:--
> NOTE: Error during finalise of
> /home/radu/Documents/Development/Yocto/poky/meta/recipes-kernel/linux/lin=
ux-yocto_3.2.bb
> ERROR: ExpansionError during parsing
> /home/radu/Documents/Development/Yocto/poky/meta/recipes-kernel/linux/lin=
ux-yocto_3.2.bb:
> Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(=
d)}
> which triggered exception FetchError: Fetcher failure for URL:
> 'git://git.yoctoproject.org/linux-yocto-3.2;protocol=3Dgit;bareclone=3D1;=
branch=3Dstandard/default/common-pc/base,meta;name=3Dmachine,meta'.
> The command git ls-remote git://git.yoctoproject.org/linux-yocto-3.2
> ee78519365bdb25287703bbc31c06b193263c654l gave empty output unexpectedly
> ERROR: No recipes available for:
>
> /home/radu/Documents/Development/Yocto/poky/meta-yocto/recipes-kernel/lin=
ux/linux-yocto_3.2.bbappend
> ERROR: Command execution failed: Exited with 1
>
> Summary: There were 3 ERROR messages shown, returning a non-zero exit cod=
e.
>
>
> Thanks,
> Radu
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


