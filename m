Received: from mail-lb0-f169.google.com ([209.85.217.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1UQHq4-0005xo-OF
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 15:47:25 +0200
Received: by mail-lb0-f169.google.com with SMTP id p11so1598809lbi.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 06:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=e6rCAJNHVdd4fz8nj++ySHSdAT2oEJFVwE8jRjC+OkE=;
	b=HtwWThMEMvbV+LwalYC2ClhLUR0+FCaZmFbmYTDf769GvbyLCIV+sDAXx6xibY1Ut5
	0voaSSdcwfUkAn2jvrVjeamdpDy6rohNHauBxCpaXCDN1C1rTvIcvpQAgwsn181J7Dxs
	pcpvHK0L8cUVKdrNkH0tKUrl8iBv9NFSVT/N6OiUNwg19FpaqLvy8eNsJci09vJzCAV8
	gRtnDhROFwCBSM6Y5EL5wpX8cdz0QBl7GF7Qn2MKxQdlc1sFjfSXlnMv+VBB/HIATUOL
	AOHwwDpSeOfHqsh0dUrOq8D0e4Ocw5pQZ4P5lOA3OtLjU+m6qArxfIzZ4/MQzR66h5BB
	aUkA==
MIME-Version: 1.0
X-Received: by 10.112.61.6 with SMTP id l6mr1819174lbr.57.1365686973753; Thu,
	11 Apr 2013 06:29:33 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Thu, 11 Apr 2013 06:29:33 -0700 (PDT)
In-Reply-To: <20130411131724.GD28466@denix.org>
References: <1365630434-7008-1-git-send-email-Chase.Maupin@ti.com>
	<1365630434-7008-2-git-send-email-Chase.Maupin@ti.com>
	<CADkTA4P-9V7X_R12n8SDSAgYxGE9M0Mhfadp85hPwFPFFaM7NQ@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED101594DD96F@DLEE11.ent.ti.com>
	<CADkTA4NzHXtDLL=pjunrKsXSOiRHo26uxHKA_YaFcbJwe4F9aQ@mail.gmail.com>
	<20130411131724.GD28466@denix.org>
Date: Thu, 11 Apr 2013 09:29:33 -0400
Message-ID: <CADkTA4Pmqnx6PbfUddWMHTdwSdDFMw9FQ3CBq1gAxwtgSoTDrg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Add KERNEL_LOCALVERSION to control version string
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
X-List-Received-Date: Thu, 11 Apr 2013 13:47:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Apr 11, 2013 at 9:17 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Thu, Apr 11, 2013 at 08:53:57AM -0400, Bruce Ashfield wrote:
>> On Thu, Apr 11, 2013 at 8:44 AM, Maupin, Chase <chase.maupin@ti.com> wrote:
>> >> -----Original Message-----
>> >> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>> >> Sent: Wednesday, April 10, 2013 7:42 PM
>> >> To: Maupin, Chase
>> >> Cc: Patches and discussions about the oe-core layer
>> >> Subject: Re: [OE-core] [PATCH] kernel: Add KERNEL_LOCALVERSION to
>> >> control version string
>> >>
>> >> On Wed, Apr 10, 2013 at 5:47 PM, Chase Maupin
>> >> <Chase.Maupin@ti.com> wrote:
>> >> > * Add a variable called KERNEL_LOCALVERSION which when set will
>> >> >   place a version string in the .scmversion file of the kernel
>> >> >   sources.  This string will be picked up by the kernel
>> >> Makefile
>> >> >   and will be appended to the kernel version.  This is done to
>> >> >   make it easier to identify what revision of the kernel
>> >> sources
>> >> >   are being run.  For example you can use a setting like the
>> >> >   following to add the short commit id to the kernel version
>> >> >   string:
>> >> >
>> >> > KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV',
>> >> True).partition('+')[2][0:7]}"
>> >> >
>> >> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> >> > ---
>> >> >  meta/classes/kernel.bbclass |    6 +++++-
>> >> >  1 files changed, 5 insertions(+), 1 deletions(-)
>> >> >
>> >> > diff --git a/meta/classes/kernel.bbclass
>> >> b/meta/classes/kernel.bbclass
>> >> > index af58887..9757465 100644
>> >> > --- a/meta/classes/kernel.bbclass
>> >> > +++ b/meta/classes/kernel.bbclass
>> >> > @@ -48,6 +48,9 @@ export CMDLINE_CONSOLE =
>> >> "console=${@d.getVar("KERNEL_CONSOLE",1) or "ttyS0"}"
>> >> >
>> >> >  KERNEL_VERSION = "${@get_kernelversion('${B}')}"
>> >> >
>> >> > +# Setting KERNEL_LOCALVERSION will place a string in the
>> >> .scmversion file
>> >> > +# of the kernel tree.  This string will be picked up by the
>> >> build system
>> >> > +# of the kernel and appended to the kernel version.
>> >> >  KERNEL_LOCALVERSION ?= ""
>> >> >
>> >> >  # kernels are generally machine specific
>> >> > @@ -210,7 +213,8 @@ kernel_do_configure() {
>> >> >         # $ scripts/setlocalversion . => +
>> >> >         # $ make kernelversion => 2.6.37
>> >> >         # $ make kernelrelease => 2.6.37+
>> >> > -       touch ${B}/.scmversion ${S}/.scmversion
>> >> > +       echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
>> >> > +       echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
>> >>
>> >> This would clobber trees that already patch, or otherwise have
>> >> the file in place
>> >> in their source directory.  A test to see if it already exists
>> >> and only echo
>> >> the variable if no one has already set it in their tree would be
>> >> safer.
>> >
>> > Good point.  I'll wrap this in a check and submit version 2.  I'll do the
>> > same for the U-Boot version as well.
>>
>> Another option for the kernel is to use a localversion-yocto file. It
>> will serve the same purpose and keep us from running afoul of those
>> that want scm version to provide a format that is similar to the one
>> that the kernel internally generates.
>>
>> Just a thought. I typically use localversion-<foo> now for all my
>> localversions, and will switch the kernel-yocto over to it in master
>> now that all older supported kernels have been pushed off the cliff :)
>
> That would be great once everyone starts using linux-yocto kernels! :)
> Unfortunately that is still not the case...

What!? they aren't!? :)

I know (and everyone knows that I know :P) I was actually more meaning
to convey that kernel.bbclass can do this, and the tools extensions for
yocto can use it just like any other derived recipe.

Cheers,

Bruce

>
> --
> Denys
>
>> >> This will still be overridden by CONFIG_LOCALVERSION, so it is
>> >> safe
>> >> from that angle, but also note that it can be inhibited by
>> >> setting
>> >> # CONFIG_LOCALVERSION_AUTO is not set, in your .config and
>> >> setting LOCALVERSION, but you probably already knew that!
>> >>
>> >> Cheers,
>> >>
>> >> Bruce
>> >>
>> >> >
>> >> >         # Copy defconfig to .config if .config does not exist.
>> >> This allows
>> >> >         # recipes to manage the .config themselves in
>> >> do_configure_prepend().
>> >> > --
>> >> > 1.7.0.4
>> >> >
>> >> >
>> >> > _______________________________________________
>> >> > Openembedded-core mailing list
>> >> > Openembedded-core@lists.openembedded.org
>> >> > http://lists.linuxtogo.org/cgi-
>> >> bin/mailman/listinfo/openembedded-core
>> >>
>> >>
>> >>
>> >> --
>> >> "Thou shalt not follow the NULL pointer, for chaos and madness
>> >> await
>> >> thee at its end"
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


