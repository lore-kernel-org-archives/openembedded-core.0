Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QK7zj-0000Jx-O5
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 13:54:24 +0200
Received: by gxk3 with SMTP id 3so132716gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 04:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=A6mgZHLAPa/cZVVGDzgnrQ5NGZB/ujd00avhMrIb7oY=;
	b=CxLCvMV3y/rhZQrH2X2lKrf9QhmPTVKESyWcv/IRCOyGdfHjxGO7aVwxFbhoOjaJVD
	WbYyazeaZFxS+MJ+XmjAGEsfh3ZPlLoyDIKWZImzeWqPT4mw8xkVM/0307M20/ZXvNYj
	M5NeTcDOmzOYjZJqOGkDlOac3fbq4ZyFjbBAo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ZMGLk8Lj4yw8fMeyfm3ALVIT3xFldpOKXl9Jf9a/4CbyndA3rVdnN4RASBeD03qed1
	qGHeWLW/+mZ3NAx1/aw4V/LsX06K6drD8+HZawxfpRry45jiipqN9OSFUBSDFakU0Lao
	Vp8hJy3g9CpvtwAFlgLbyiF5nH1zXOWGvTJtE=
MIME-Version: 1.0
Received: by 10.91.136.15 with SMTP id o15mr7591597agn.155.1305114695812; Wed,
	11 May 2011 04:51:35 -0700 (PDT)
Received: by 10.90.32.18 with HTTP; Wed, 11 May 2011 04:51:35 -0700 (PDT)
In-Reply-To: <1305055604.30391.291.camel@rex>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<2b5ed98c067c8f517a669ba8b857ebe1c08e1bb3.1305035617.git.richard.purdie@linuxfoundation.org>
	<BANLkTimcGCLPFM0ShJPyaDqm+X8PaX1DXQ@mail.gmail.com>
	<1305055604.30391.291.camel@rex>
Date: Wed, 11 May 2011 13:51:35 +0200
Message-ID: <BANLkTimHy51CKe2f6CPcTJ62kzQpkCrOjQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 5/6] conf/distro/include/default-distrovars.inc: Create set of default 'distro' variable values
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
X-List-Received-Date: Wed, 11 May 2011 11:54:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/5/10 Richard Purdie <richard.purdie@linuxfoundation.org>

> On Tue, 2011-05-10 at 16:26 +0200, Frans Meulenbroeks wrote:
> > Some minor remarks on the default-distrovars.inc contents:
>
> To quote the email prefacing this patch series:
>
> """
> I did dump a load of "default" variables into default-distrovars.inc,
> I'm not calling that file finished, I just had to draw the line
> somewhere and start a discussion about this :)
> """
>
> but we can have this discussion.
>

I saw that note. Idea was indeed to initiate the discussion and make
suggestions for improvements.


>
> > 2011/5/10 Richard Purdie <richard.purdie@linuxfoundation.org>
> > [...]
> >
> > > diff --git a/meta/conf/distro/include/default-distrovars.inc
> > > b/meta/conf/distro/include/default-distrovars.inc
> > > new file mode 100644
> > > index 0000000..ab26a30
> > > --- /dev/null
> > > +++ b/meta/conf/distro/include/default-distrovars.inc
> > > @@ -0,0 +1,43 @@
> > > +QA_LOGFILE = "${TMPDIR}/qa.log"
> > >
> > Should this be here? I would expect the class file that uses this to have
> > this as default and/or have this in local.conf.sample.
> > This does not seem too distro specific
>
> If this is unset, the logfile isn't generated at all with the current
> defaults. I don't claim the current defaults are correct but its a
> separate patch if we do want to change the defaults.
>

It is good to to have the qa file made by default, but I am not sure whether
it is distro specific.
Actually I probably would expect things like QA_LOGFILE to live in the same
spot as where TMPDIR and DOWNLOADDIR etc are defined

>
> > > +
> > > +IMAGE_ROOTFS_SIZE_ext2 ?= "131072"
> > >
> > Hm, again something that is probalby not distro related. And why only for
> > _ext2 and not eg for _ext3 or for _jffs2
> > Personally I always stuff this in my image recipe
>
> Left there pending a review of where various image sizes are set.
>

Ok understood

>
> > > +
> > > +OEINCLUDELOGS ?= "yes"
> > >
> > in local.conf.sample?
>
> If its there, this can be dropped, yes. I think forcing it on by default
> may be a good thing though. I'm not 100% sure that variable even still
> exists tbh.
>

In openembedded/classes and openembedded/site this var does not exist. I do
not have an oe-core/yocto tree handy to check if it is there.
BTW I do have BBINCLUDELOGS in my local.conf.sample. As far as I know this
is a bitbake var and actually being used.

>
> > > +KERNEL_CONSOLE ?= "ttyS0"
> > >
> > I'm inclined to put this into the machine conf. Is this really a distro
> > thing?
>
> No, left for compatibility pending cleanup.
>
> > > +
> > > +require conf/distro/include/preferred-xorg-versions.inc
> > > +
> > > +PCMCIA_MANAGER ?= "pcmciautils"
> > > +
> > > +IMAGE_LINGUAS ?= "en-us en-gb"
> > > +LIMIT_BUILT_LOCALES ?= "POSIX en_US en_GB"
> > > +ENABLE_BINARY_LOCALE_GENERATION ?= "1"
> > > +LOCALE_UTF8_ONLY ?= "0"
> > >
> > Again something I tend to do in image recipes; then again this might be
> > because I do not use feeds, only make images.
>
> These ones are more distro policy and whilst an image can change them a
> default is good in those cases. If there are defaults set elsewhere we
> should review and pick the correct ones.
>
> > > +DISTRO_FEATURES ?= "alsa bluetooth ext2 irda pcmcia usbgadget usbhost
> wifi
> > > nfs zeroconf pci"
> > >
> > Is this the complete range? I would expect all features to be enabled by
> > default (and let MACHINE_FEATURES reduce that set)
>
> Needs further investigation.
>
> > > +
> > > +DISTRO_EXTRA_RDEPENDS += "task-core-boot"
> > > +DISTRO_EXTRA_RRECOMMENDS += "kernel-module-af-packet"
> > > +
> > > +IMAGE_FEATURES ?= ""
> > >
> > Has a var with ?= assignment of an empty string any meaning. Thought an
> > empty string would be the default.
>
> No, its not.
>
> > > +
> > > +# This is a list of packages that are used by the build system to
> build
> > > the distribution, they are not
> > > +# directly part of the distribution.
> > > +HOSTTOOLS_WHITELIST_GPLv3 ?= ""
> > > +WHITELIST_GPLv3 ?= "less"
> > >
> > I'm not sure why less is listed in the line above:
> > the less license is not gpl (at least not less 443)
> >
> >
> > > +LGPLv2_WHITELIST_GPLv3 ?= "libassuan gnutls libtasn1 libidn libgcc
> > > gcc-runtime"
> > > +
> > > +# This is a list of packages that require a commercial license to ship
> > > +# product. If shipped as part of an image these packages may have
> > > +# implications so they are disabled by default
> > > +COMMERCIAL_LICENSE ?= "lame gst-fluendo-mp3 libmad mpeg2dec ffmpeg
> qmmp"
> > > +COMMERCIAL_AUDIO_PLUGINS ?= ""
> > > +# COMMERCIAL_AUDIO_PLUGINS ?= "gst-plugins-ugly-mad
> > > gst-plugins-ugly-mpegaudioparse"
> > > +COMMERCIAL_VIDEO_PLUGINS ?= ""
> > > +# COMMERCIAL_VIDEO_PLUGINS ?= "gst-plugins-ugly-mpeg2dec
> > > gst-plugins-ugly-mpegstream gst-plugins-bad-mpegvideoparse"
> > > +COMMERCIAL_QT ?= ""
> > > +# COMMERCIAL_QT ?= "qmmp"
> > > +# Set of common licenses used for license.bbclass
> > > +COMMON_LICENSE_DIR ??= "${COREBASE}/meta/files/common-licenses"
> > >
> > maybe the above could be in a separate license.inc file or so.embedded
>
> Possibly, setting these to defaults is good though.
>
> > > +
> > > +BB_GENERATE_MIRROR_TARBALLS ??= "0"
> > >
> > local.conf.sample ?
>
> I regard local.conf.sample as things a new user cares about. I don't
> think this fits that category. Its here embeddedpending the creation of a
> more
> "advanced settings" version of local.conf.sample we've talked about
> being created.
>
> I'm unaware of any discussion on an advanced settings version of
local.conf.sample.

Anyway there are two different groups of users for oe/yocto:
Those who want to do a distro with package feeds etc and those (like me) who
are more into creating (lean &lightweight) images for embedded,
non-networked (or non network upgradeable)  devices (like a microwave etc).
For the latter it could be very useful to have a "distro-less" system or a
very simple default distro. Main interest for those people is probably the
cross environment and the image creation capabilities.
If  one wants full control on what is being in the image it helps to have
that in a logical location.

But I am digressing...

Frans.

