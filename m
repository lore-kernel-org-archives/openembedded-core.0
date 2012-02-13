Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1Rww08-0006m0-RG
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Feb 2012 14:31:29 +0100
Received: by obhx4 with SMTP id x4so6978560obh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2012 05:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=nRUttST+Xde7yaDnotlndy9tMcHXdG54/i7nCr2+QAc=;
	b=bxhRex2MXJwyChKrLkTQvArbiNK8BA1BM6ScxmVQLVgKKB0aufwSMP+vx0astgNnov
	7bMZNp3q/W5cyjaSJxwpwcmzf02eag3FwBV5FXnYA/5cun03dyJoYHpazDj1gK9s6Hpy
	Wr8uP57ifIPKOi2l0A30AKnADN6ybhMOFCRFE=
MIME-Version: 1.0
Received: by 10.182.1.104 with SMTP id 8mr11698390obl.19.1329139398813; Mon,
	13 Feb 2012 05:23:18 -0800 (PST)
Received: by 10.182.80.10 with HTTP; Mon, 13 Feb 2012 05:23:18 -0800 (PST)
In-Reply-To: <20120213074852.GA3832@jama.jama.net>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<c68f6de298c35c25638ea3a5adeb06c97cd74036.1328510189.git.raj.khem@gmail.com>
	<4F30DC16.1050506@linux.intel.com>
	<CAMKF1sqTc3PA_4xNbp1751tA73pRazsvrFdwhomdELtb-25ZGg@mail.gmail.com>
	<4F314A73.8070406@linux.intel.com>
	<20120207231245.GA13160@sakrah.homelinux.org>
	<4F31BF7B.4040303@linux.intel.com>
	<CAMKF1sqCgiu0TnTj_rgvDgZ5+JE3uX+Y_5KvKmcfd4LDOAoF2Q@mail.gmail.com>
	<CAGDS+nmdBg8QyBPx6iuG0p0aaPfAU3kvE6jJbekvC2ne0XBedw@mail.gmail.com>
	<54DBF0D0-65DA-4444-8EF5-3E14ED8FE44F@dominion.thruhere.net>
	<20120213074852.GA3832@jama.jama.net>
Date: Mon, 13 Feb 2012 05:23:18 -0800
Message-ID: <CAGDS+nne1Xbe6XGPuLXqyMLOC_7uqYKFkbRuW77Ub672kpL7BA@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/20] zlib: Upgrade 1.2.5 -> 1.2.6
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
X-List-Received-Date: Mon, 13 Feb 2012 13:31:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 12, 2012 at 11:48 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Sat, Feb 11, 2012 at 06:09:52AM +0100, Koen Kooi wrote:
>>
>> Op 11 feb. 2012, om 06:05 heeft Steve Sakoman het volgende geschreven:
>>
>> > On Tue, Feb 7, 2012 at 6:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> >> On Tue, Feb 7, 2012 at 4:19 PM, Saul Wold <sgw@linux.intel.com> wrote=
:
>> >>>
>> >>> Can you verify if you have a .la file in you sysroot?
>> >>
>> >>
>> >> No its not there and thats the point we probably should learn to live
>> >> with out it
>> >> actually one of radical ideas I have is to get rid of all .la files i=
n
>> >> OE completely
>> >> right now python modules e.g. =A0have them and thats wrong since they=
 never use it
>> >> and there are other packages like that.
>> >
>> > FWIW, after a pull of oe-core today that included the zlib update I am
>> > getting similar failures on meta/recipes-gnome/gtk+/gtk+_2.24.8.bb:
>> >
>> > | /bin/grep: /media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.l=
a:
>> > No such file or directory
>> > | /bin/sed: can't read
>> > /media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.la: No such
>> > file or directory
>> > | arm-poky-linux-gnueabi-libtool: link:
>> > `/media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.la' is not a
>> > valid libtool archive
>> > | make[4]: *** [libgdk-x11-2.0.la] Error 1
>>
>>
>> It works if you -c cleansstate on a bunch of recipes, pango, cairo, font=
config, gtk+, etc
>
> list for me
>
> evas ecore fsogsmd pidgin elementary fsodeviced fsoaudiod subversion
> python-evas libsoup-2.4 libeflvala efreet fsotdld poppler fsosystemd
> fsousaged fsonetworkd gtk+ python-gst emotion mysql5 libfsotransport
> libfsobasics gd libgsm0710mux gst-plugins-base iksemel fsodatad
> webkit-gtk fsodatad epdf librsvg curl libsexy libfsosystem orbit2
> libfso-glib pango eeze libshr-glib farsight2 id3lib gst-plugins-good
> gst-plugins-ugly libnice libgpewidget matchbox-panel-2 edbus vte ethumb
> glib-networking libgisi libfsoresource edje libfsoframework gconf file
> libglade json-glib ethumb libcroco gnome-keyring libsdl-image neon
> qt4-x11-free python-pygobject msmcomm-specs gnome-keyring libphone-ui
> shr-wizard matchbox-keyboard matchbox-panel-2
>
> And this isn't even on fully built feed :/.

Indeed!  I gave up on trying to determine an exhaustive list and just
blew away tmp and sstate and rebuilt everything -- including package
repositories :-(

We need to find a way to prevent or warn of disruptive changes like
this zlib patch.  For those of us trying to make a living using Yocto,
losing a day of productivity to things like this really stings.

Steve


