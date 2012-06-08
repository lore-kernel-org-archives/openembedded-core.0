Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Sczwg-0005sp-T5
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 16:13:47 +0200
Received: by pbbrq2 with SMTP id rq2so2438298pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2012 07:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=B39A5m5yT9x65BjKxyqMFlFJ6iALs7UGYUtiKDFdUgw=;
	b=zAZ3ueqLVJ+sBX43GnFj+LeaqGjGMNCaZlWn+A9Qgh3tIw8W5W0pUkOhnw3k4wbd5t
	Xc+SdAgdOVXtJ0eXsK4xxsAVBlOYFyy+UCOAQWvNifaSmJXiA51DrpuZo2GMM9NM9iCb
	iSe4alKctvMIQlYoRcZOVcZutjHOq4GvSEZ8qeiKdQnC5+u/6LstAmXU0H3e4aAs0JPH
	ImIiqfMPlX5xqRkgBQv2FioR18kuZ6z3jI7tj8rPQHy62KCMQfvehfKycAO1funkQqKI
	Xis4EV3gvqe9NNBamLx1FhRWZe9poFDEBWM4Wsbw/+2iFhDay8eO/7qZM1nYf7grGjQJ
	g5VA==
MIME-Version: 1.0
Received: by 10.68.231.40 with SMTP id td8mr20509259pbc.150.1339164195910;
	Fri, 08 Jun 2012 07:03:15 -0700 (PDT)
Received: by 10.68.197.4 with HTTP; Fri, 8 Jun 2012 07:03:15 -0700 (PDT)
In-Reply-To: <32D32342-6B45-4644-9909-FEB737528DCF@gmail.com>
References: <32D32342-6B45-4644-9909-FEB737528DCF@gmail.com>
Date: Fri, 8 Jun 2012 10:03:15 -0400
Message-ID: <CADkTA4N6B+huCVQZq+tqKW-c22_UCX+tjABwj_gpY9yNJRSgyg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: ERROR: ExpansionError during parsing /tool/yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.2.bb: Failure expanding variable SRCPV
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
X-List-Received-Date: Fri, 08 Jun 2012 14:13:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 8, 2012 at 9:59 AM, Elvis Dowson <elvis.dowson@gmail.com> wrote=
:
> Hi,
>
> On Jun 8, 2012, at 12:58 PM, Richard Purdie wrote:
>
>> On Thu, 2012-06-07 at 15:59 -0400, Bruce Ashfield wrote:
>>> Richard/Saul,
>>>
>>> Here's a 9 patch series that is a collection of work that's been
>>> brewing for about three weeks.
>>>
>>> Highlights include:
>>>
>>> =A0- removal of the 2.6.37 recipe, it's time is now gone
>>> =A0- addition of the 3.4 kernel recipe
>>> =A0 =A0 =A0- configuration fixups and audits within that 3.4 kernel
>>> =A0 =A0 =A0- kernel *only* support for mips64 mti emulation
>>> =A0- -stable updates for supported kernels 3.2.18, 3.0.32
>>> =A0- machine fixes/configurations for the 3.2 and 3.0 kernels
>>> =A0- kern tool updates, streamlining and fixes
>
> I just updated my poky installation, and tried to build the meta-toolchai=
n, and I got a bunch of errors. This is related to the recent updates to th=
e linux-yocto_3.2.bb kernel.

I'm already finishing up a patch, since this started blowing up here as wel=
l
this morning.

Bruce

>
> elvis@eos:/tool/yocto/poky/build$ bitbake meta-toolchain
> Pseudo is not present but is required, building this first before the mai=
n build
> WARNING: Unable to get checksum for python-numpy SRC_URI entry config.h: =
file could not be found =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | ETA: =A000:00:43
> WARNING: Unable to get checksum for python-numpy SRC_URI entry numpyconfi=
g.h: file could not be found
> ERROR: ExpansionError during parsing /tool/yocto/poky/meta/recipes-kernel=
/linux/linux-yocto_3.2.bb: Failure expanding variable SRCPV, expression was=
 ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError: Fetcher =
failure for URL: 'git://git.yoctoproject.org/linux-yocto-3.2;protocol=3Dgit=
;bareclone=3D1;branch=3Dstandard/default/base,meta;name=3Dmachine,meta'. Th=
e command git ls-remote git://git.yoctoproject.org/linux-yocto-3.2 ee785193=
65bdb25287703bbc31c06b193263c654l gave empty output unexpectedly
> ERROR: No recipes available for:
> =A0/tool/yocto/poky/meta-yocto/recipes-core/uclibc/uclibc_git.bbappend
> =A0/tool/yocto/poky/meta-yocto/recipes-kernel/linux/linux-yocto_3.2.bbapp=
end
> =A0/tool/yocto/meta-xilinx/recipes-core/util-linux/util-linux_2.21.1.bbap=
pend
> =A0/tool/yocto/poky/meta-yocto/recipes-core/psplash/psplash_git.bbappend
> =A0/tool/yocto/poky/meta-yocto/recipes-core/netbase/netbase_4.47.bbappend
> =A0/tool/yocto/meta-openembedded/meta-oe/recipes-multimedia/gstreamer/gst=
-ffmpeg_0.10.13.bbappend
> =A0/tool/yocto/meta-openembedded/meta-oe/recipes-core/dropbear/dropbear_2=
012.55.bbappend
> =A0/tool/yocto/poky/meta-yocto/recipes-core/tasks/task-core-tools-profile=
.bbappend
> =A0/tool/yocto/meta-xilinx/recipes-core/initscripts/initscripts_1.0.bbapp=
end
> =A0/tool/yocto/meta-openembedded/meta-oe/recipes-core/busybox/busybox_1.1=
9.4.bbappend
> ERROR: Command execution failed: Exited with 1
>
> Summary: There were 2 WARNING messages shown.
> Summary: There were 3 ERROR messages shown, returning a non-zero exit cod=
e.
>
>
> best regards,
>
> Elvis Dowson
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


