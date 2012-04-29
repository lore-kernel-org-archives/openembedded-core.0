Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOY0R-00037G-KU
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Apr 2012 19:33:55 +0200
Received: by lbbgo4 with SMTP id go4so1435056lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2012 10:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=OoHCC6tamNOtElHS4Avf/rQqMhly7Vz8INbAkl2JsyI=;
	b=IJ8KsXB4XJ+dAotbfH54pl11XK4SB5yuKqRwMbLgZgRrJa17KE9g9pcjHdmD0A9U/q
	4wG1td6S84zo5JFl7/zzDCQT2l+SMY6IKn5kmwTQJbTJV8ZhiiiANKde2nh0TtnrdQxq
	/buxOcrA3dBO8UtQtES9RSsphQ9nmWFwJ1Qra7a79a9q0lGTAonDOR6DO4Co/gbc/IHW
	Zt9KbMOP7I/rq6/gBPLicLn6QzAszXMg1ceHLalL684MB/wVuFrjX/axBd9ZnBimyt21
	3ghTCcskKeFUAd/2EqlKMb8a/XfTwuS7mswW6cRLABNS6V3hn6Yoh4pDAsAV4FvgR9zo
	Mr7w==
Received: by 10.152.145.228 with SMTP id sx4mr16560895lab.45.1335720254778;
	Sun, 29 Apr 2012 10:24:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sun, 29 Apr 2012 10:23:44 -0700 (PDT)
In-Reply-To: <1335474399.20130.35.camel@ted>
References: <CAMKF1sq94g5aaYPQZ=UZtBT6iBxCMJ7ZrKer=gaCVoEjV=eWKA@mail.gmail.com>
	<1335451639.20130.18.camel@ted> <1335468645.20130.27.camel@ted>
	<1335474399.20130.35.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Apr 2012 10:23:44 -0700
Message-ID: <CAMKF1so6gABH-H9uZ2R4ppr6F-zT9GtPg7j5fThzQQjWXKkG4g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gcc 4.7 + mips64 architecture support
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
X-List-Received-Date: Sun, 29 Apr 2012 17:33:55 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 26, 2012 at 2:06 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2012-04-26 at 20:30 +0100, Richard Purdie wrote:
>> On Thu, 2012-04-26 at 15:47 +0100, Richard Purdie wrote:
>> > On Wed, 2012-04-25 at 16:31 -0700, Khem Raj wrote:
>> > > Hello
>> > >
>> > > Now that release is almost out of door. I would like some eyes on the
>> > > gcc-4.7 work
>> > > and mips64 architecture support that I have done meanwhile
>> > >
>> > > I have made sure that gcc-4.6 still keeps working and I have patches
>> > > for gcc-4.5 too
>> > > for meta-oe too. I have repeatedly built core-image-sato and
>> > > core-image-minimal for uclibc/eglibc
>> > > but more coverage would be nicer.
>> > >
>> > > The patches are posted here
>> > >
>> > > http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/misc
>> > >
>> > > I would appreciate any feedback or testing on this
>> >
>> > I had a look through the patch series. I've posted an altered version of
>> > the class override patch. I've pulled the gcc 4.7 part into master-next,
>> > have get gcc 4.7 as the default and am running it though the
>> > autobuilder. That should see how we stand with our usual regression
>> > tests.
>>
>> The builds shows the following failures (I've kept duplication so you
>> can see the patterns). Not too bad considering:
>>
>> MACHINE=qemux86, failure in:
>> gst-ffmpeg:do_configure
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-world/builds/66/steps/shell_24/logs/stdio
>>
>> MACHINE=qemuarm, failures in:
>> clutter-1.8:do_configure
>> glew:do_compile
>> qt4-x11-free:do_compile
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-arm/builds/402/steps/shell_19/logs/stdio
>>
>> MACHINE=qemuppc, failures in:
>> clutter-1.8:do_configure
>> glew:do_compile
>> qt4-x11-free:do_compile
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/359/steps/shell_19/logs/stdio
>>
>> MACHINE=mpc8315e-rdb, failure in:
>> mesa-dri:do_compile
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/359/steps/shell_35/logs/stdio
>>
>> MACHINE=qemumips, failures in:
>> clutter-1.8:do_configure
>> glew:do_compile
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/371/steps/shell_19/logs/stdio
>>
>> MACHINE=beagleboard, failure in:
>> mesa-dri:do_compile
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-arm/builds/402/steps/shell_35/logs/stdio
>>
>> MACHINE=routerstationpro, failure in:
>> mesa-dri:do_compile
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/371/steps/shell_35/logs/stdio
>>
>>
>> Also, adding meta-qt3 and building lsb targets with DISTRO=poky-lsb adds
>> the failure:
>> qt-x11-free:do_compile
>> <plus repeats of the above>
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/359/steps/shell_76/logs/stdio
>
> FWIW I've posted a mesa fix which should help many of these issue. It
> looks like gcc 4.7 has stricter option parsing.
>
> Why mesa didn't always fail to build is something that needs looking
> into as a separate issue, the logs are full of errors.

Do you some layer slapped on top of OE-Core which might be screwing
things up since I built using OE-Core standalone I do not remember
seeing these issues.


