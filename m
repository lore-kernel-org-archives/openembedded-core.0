Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Sqo1B-0007ww-9c
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 18:19:29 +0200
Received: by qabg1 with SMTP id g1so1749390qab.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 09:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Tp8n7Y0PPU2yr9Hrhitr2/mWWV7FlO/N0AhtHn3hep4=;
	b=gzKeTsZcQ2pjvhppPoz/lKich9N1t8EFHVfi6f0LRym139AE5IMWQBP9ux4bebIA1+
	1ySLgFDDK2i815Sr0VAHCY0cuwaf1+duamMsCKrxM4Zo31mYHG76tW2qMTv7jRRguvsg
	xYXSheWMNlIfICRgHbExlQwnbiLvBSmZznBZiTYu3whRuZUJNqmmsm2/lNmZi4t1Qxj0
	V7q2qYFC7qUVn/9VNef+mvyLzCVcuWsZmXMPj1vk9gRvtglQLfxyKFcpHS+Q31LuLI5N
	+jmrLJXdhYCUafqOkxkmdVoGif2JOOWO0wKett4AezlLg2ZsC+S8MnB/CvmgjTxhlSOK
	fNsg==
MIME-Version: 1.0
Received: by 10.224.59.141 with SMTP id l13mr6449082qah.91.1342454890527; Mon,
	16 Jul 2012 09:08:10 -0700 (PDT)
Received: by 10.229.8.78 with HTTP; Mon, 16 Jul 2012 09:08:10 -0700 (PDT)
In-Reply-To: <20120716160454.GH3729@jama.jama.net>
References: <cover.1342453118.git.sgw@linux.intel.com>
	<d67e47bd457de90b19428245644dc64ecf4ba11a.1342453118.git.sgw@linux.intel.com>
	<CADkTA4PU2FTrOkiKFL=+imfddD+Do-kpD0K9a+BuNyG041LgnA@mail.gmail.com>
	<20120716160454.GH3729@jama.jama.net>
Date: Mon, 16 Jul 2012 12:08:10 -0400
Message-ID: <CADkTA4PjzUm1dBGECZj7urEK3RmEcjm026EkL_xRmoacJAHk1Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 09/30] linux-libc-headers: updated to 3.4.3
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
X-List-Received-Date: Mon, 16 Jul 2012 16:19:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 16, 2012 at 12:04 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Jul 16, 2012 at 11:58:52AM -0400, Bruce Ashfield wrote:
>> On Mon, Jul 16, 2012 at 11:47 AM, Saul Wold <sgw@linux.intel.com> wrote:
>> > From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>> >
>> > Tested by building core-image-sato-sdk.
>>
>> We've never gone to this level of granularity in the past, since
>> -stable updates to
>> the kernel are not going to change something in the libc-headers exports.
>>
>> As far as I'm concerned, bumping this for each stable release is too much churn.
>
> But this time it's quite usefull after
> http://git.openembedded.org/openembedded-core/commit/?id=2a4ab6fc2ef10202d13568aba5d7633e88aa71e5
> removed some headers from sysroots and some packages (like IIRC udev)
> were failing to build until someone rebuilt linux-libc-headers manually
> to fixup staged headers in machine sysroot..

I'm not following completely .. is that specific to the .3 in 3.4.x ?
Doesn't look
like it to me.

I don't recall Greg changing the mtd exports in 3.4.3 .. but that
wouldn't be the
first time something like that slipped in.

Cheers,

Bruce

>
> Cheers,
>
>>
>> Sorry I missed this during the original review/posting.
>>
>> Cheers,
>>
>> Bruce
>>
>> >
>> > Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> > ---
>> >  meta/conf/distro/include/tcmode-default.inc        |    2 +-
>> >  .../linux-libc-headers/linux-libc-headers_3.4.3.bb |    6 ++++++
>> >  .../linux-libc-headers/linux-libc-headers_3.4.bb   |    6 ------
>> >  3 files changed, 7 insertions(+), 7 deletions(-)
>> >  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
>> >  delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
>> >
>> > diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
>> > index f11e687..0a068be 100644
>> > --- a/meta/conf/distro/include/tcmode-default.inc
>> > +++ b/meta/conf/distro/include/tcmode-default.inc
>> > @@ -22,7 +22,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
>> >  BINUVERSION ?= "2.22"
>> >  EGLIBCVERSION ?= "2.15"
>> >  UCLIBCVERSION ?= "0.9.33"
>> > -LINUXLIBCVERSION ?= "3.4"
>> > +LINUXLIBCVERSION ?= "3.4.3"
>> >
>> >  PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
>> >  PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"
>> > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
>> > new file mode 100644
>> > index 0000000..6f8d9e8
>> > --- /dev/null
>> > +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
>> > @@ -0,0 +1,6 @@
>> > +require linux-libc-headers.inc
>> > +
>> > +PR = "r0"
>> > +
>> > +SRC_URI[md5sum] = "3aefa02db55715d627ed23a01667057d"
>> > +SRC_URI[sha256sum] = "17f1256daa289dde1a0a587c9753556d37a52770f7c4efcf2666fd4796a6eacc"
>> > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
>> > deleted file mode 100644
>> > index 9e8c88f..0000000
>> > --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
>> > +++ /dev/null
>> > @@ -1,6 +0,0 @@
>> > -require linux-libc-headers.inc
>> > -
>> > -PR = "r0"
>> > -
>> > -SRC_URI[md5sum] = "146af0160fc7a60cf9acf44aec13482b"
>> > -SRC_URI[sha256sum] = "a797a15d0b6228381507c14ecf4eec4a6cc5c77cfd521ba3b3e1325e85b5b16d"
>> > --
>> > 1.7.7.6
>> >
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
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
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


