Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Sd04h-00004t-DS
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 16:22:03 +0200
Received: by dalh21 with SMTP id h21so2275029dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2012 07:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=0eQ0GHNwOIjXJjSSao2dMZZjXZAXqXiM5wD29rFVrQY=;
	b=v947mkrW/YpJbpv5WoKRrPTI+5FkRMzuqVhZWxlfR0DZHSOpBXvxCmh/jCHqiGOuEm
	gJA6luz1mJQLyIyE4sUyVYys7vMs8C68+dafGT5fxT24Gcntshee+p9CJo/NTzXMXpB4
	BWh9Rd+F2Eo3sqRfD8absWQZ4F6WLkn7eilf/dros3D9f+P89r96m/Lg+HE7m1zcTdbY
	SMp8hpWFm2PvCGvsIf8p6yr/LBcydpQfRSVkFMbaD9E7euGpPukzsIceWEqHQmoH3aZ7
	6Ybb5DHJJUkDAqzk+5m+kD89+2HqtlmwniKfhzqTFuNzLfNzr9MecM1/8KjRSBcVuIbO
	0pcQ==
MIME-Version: 1.0
Received: by 10.68.231.40 with SMTP id td8mr20569303pbc.150.1339164692889;
	Fri, 08 Jun 2012 07:11:32 -0700 (PDT)
Received: by 10.68.197.4 with HTTP; Fri, 8 Jun 2012 07:11:32 -0700 (PDT)
In-Reply-To: <1339164325.26324.0.camel@elmorro>
References: <32D32342-6B45-4644-9909-FEB737528DCF@gmail.com>
	<1339164325.26324.0.camel@elmorro>
Date: Fri, 8 Jun 2012 10:11:32 -0400
Message-ID: <CADkTA4P6GnC=Ld8f2A7L7p3Efr8=fO+80cTSe0jQ2PrAycAmZQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 08 Jun 2012 14:22:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 8, 2012 at 10:05 AM, Tom Zanussi <tom.zanussi@intel.com> wrote:
> On Fri, 2012-06-08 at 15:59 +0200, Elvis Dowson wrote:
>> Hi,
>>
>> On Jun 8, 2012, at 12:58 PM, Richard Purdie wrote:
>>
>> > On Thu, 2012-06-07 at 15:59 -0400, Bruce Ashfield wrote:
>> >> Richard/Saul,
>> >>
>> >> Here's a 9 patch series that is a collection of work that's been
>> >> brewing for about three weeks.
>> >>
>> >> Highlights include:
>> >>
>> >> =A0- removal of the 2.6.37 recipe, it's time is now gone
>> >> =A0- addition of the 3.4 kernel recipe
>> >> =A0 =A0 =A0- configuration fixups and audits within that 3.4 kernel
>> >> =A0 =A0 =A0- kernel *only* support for mips64 mti emulation
>> >> =A0- -stable updates for supported kernels 3.2.18, 3.0.32
>> >> =A0- machine fixes/configurations for the 3.2 and 3.0 kernels
>> >> =A0- kern tool updates, streamlining and fixes
>>
>> I just updated my poky installation, and tried to build the meta-toolcha=
in, and I got a bunch of errors. This is related to the recent updates to t=
he linux-yocto_3.2.bb kernel.
>>
>
> I just posted a patch to fix this - it was a SRCREV typo.
>
> Building fine here now with that simple fix...

Yah. Last minute rebase, and some masking to speed up my 3.4 builds hid it
from me.

You beat me by a couple of minutes. Two series to chose from.

I'll go back into hiding now.

Bruce

>
> Tom
>
>> elvis@eos:/tool/yocto/poky/build$ bitbake meta-toolchain
>> Pseudo is not present but is required, building this first before the ma=
in build
>> WARNING: Unable to get checksum for python-numpy SRC_URI entry config.h:=
 file could not be found =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | ETA: =A000:00:43
>> WARNING: Unable to get checksum for python-numpy SRC_URI entry numpyconf=
ig.h: file could not be found
>> ERROR: ExpansionError during parsing /tool/yocto/poky/meta/recipes-kerne=
l/linux/linux-yocto_3.2.bb: Failure expanding variable SRCPV, expression wa=
s ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError: Fetcher=
 failure for URL: 'git://git.yoctoproject.org/linux-yocto-3.2;protocol=3Dgi=
t;bareclone=3D1;branch=3Dstandard/default/base,meta;name=3Dmachine,meta'. T=
he command git ls-remote git://git.yoctoproject.org/linux-yocto-3.2 ee78519=
365bdb25287703bbc31c06b193263c654l gave empty output unexpectedly
>> ERROR: No recipes available for:
>> =A0 /tool/yocto/poky/meta-yocto/recipes-core/uclibc/uclibc_git.bbappend
>> =A0 /tool/yocto/poky/meta-yocto/recipes-kernel/linux/linux-yocto_3.2.bba=
ppend
>> =A0 /tool/yocto/meta-xilinx/recipes-core/util-linux/util-linux_2.21.1.bb=
append
>> =A0 /tool/yocto/poky/meta-yocto/recipes-core/psplash/psplash_git.bbappen=
d
>> =A0 /tool/yocto/poky/meta-yocto/recipes-core/netbase/netbase_4.47.bbappe=
nd
>> =A0 /tool/yocto/meta-openembedded/meta-oe/recipes-multimedia/gstreamer/g=
st-ffmpeg_0.10.13.bbappend
>> =A0 /tool/yocto/meta-openembedded/meta-oe/recipes-core/dropbear/dropbear=
_2012.55.bbappend
>> =A0 /tool/yocto/poky/meta-yocto/recipes-core/tasks/task-core-tools-profi=
le.bbappend
>> =A0 /tool/yocto/meta-xilinx/recipes-core/initscripts/initscripts_1.0.bba=
ppend
>> =A0 /tool/yocto/meta-openembedded/meta-oe/recipes-core/busybox/busybox_1=
.19.4.bbappend
>> ERROR: Command execution failed: Exited with 1
>>
>> Summary: There were 2 WARNING messages shown.
>> Summary: There were 3 ERROR messages shown, returning a non-zero exit co=
de.
>>
>>
>> best regards,
>>
>> Elvis Dowson
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


