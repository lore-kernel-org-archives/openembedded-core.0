Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SqoSD-0002j7-P8
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 18:47:26 +0200
Received: by qabg1 with SMTP id g1so1778667qab.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 09:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=fehZzJEGNpFeQNbEf1+/hsx2t+nGSs/5neQwKEpkq/4=;
	b=yUYH56XZMSLzxhjapGCh/yyatCwI12INPPCBwKkKNzPfYPn/VbhglKVgKYqzDo8+Wc
	dJfl0mYEjFVEKWiwaDHT5C578aNX/ui0JWpSXtSxvQe/6C0aQYb0nQCLWxgNjKYnqIIl
	Vqd6dNPH2dMYRiGD1AeSuYUMyRz4cDcDnXOjHQUvjSjLRzJ6w4ilqQ/P0XJci1yz8dJc
	FfQ9dCMvUX6UpdDLVayHoheBwBIKsYuJM/cRZhCN4k4POgClss3XV3Kl2ZRpAwgqg/+t
	TwCrGVFQOh2OOXggRUDT8hRk+5yXJ/tDtGfS11OoXWNkQl50LitQ6LkpJgr7wnu1L+iu
	N/hA==
MIME-Version: 1.0
Received: by 10.224.203.8 with SMTP id fg8mr22478244qab.38.1342456567056; Mon,
	16 Jul 2012 09:36:07 -0700 (PDT)
Received: by 10.229.8.78 with HTTP; Mon, 16 Jul 2012 09:36:07 -0700 (PDT)
In-Reply-To: <20120716162952.GI3729@jama.jama.net>
References: <cover.1342453118.git.sgw@linux.intel.com>
	<d67e47bd457de90b19428245644dc64ecf4ba11a.1342453118.git.sgw@linux.intel.com>
	<CADkTA4PU2FTrOkiKFL=+imfddD+Do-kpD0K9a+BuNyG041LgnA@mail.gmail.com>
	<20120716160454.GH3729@jama.jama.net>
	<CADkTA4PjzUm1dBGECZj7urEK3RmEcjm026EkL_xRmoacJAHk1Q@mail.gmail.com>
	<20120716162952.GI3729@jama.jama.net>
Date: Mon, 16 Jul 2012 12:36:07 -0400
Message-ID: <CADkTA4NKtty4_jt7z2S9GzwHMg+xmcdh3qTfUWUuYRjw92iXHQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 16 Jul 2012 16:47:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 16, 2012 at 12:29 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Jul 16, 2012 at 12:08:10PM -0400, Bruce Ashfield wrote:
>> On Mon, Jul 16, 2012 at 12:04 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > On Mon, Jul 16, 2012 at 11:58:52AM -0400, Bruce Ashfield wrote:
>> >> On Mon, Jul 16, 2012 at 11:47 AM, Saul Wold <sgw@linux.intel.com> wrote:
>> >> > From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>> >> >
>> >> > Tested by building core-image-sato-sdk.
>> >>
>> >> We've never gone to this level of granularity in the past, since
>> >> -stable updates to
>> >> the kernel are not going to change something in the libc-headers exports.
>> >>
>> >> As far as I'm concerned, bumping this for each stable release is too much churn.
>> >
>> > But this time it's quite usefull after
>> > http://git.openembedded.org/openembedded-core/commit/?id=2a4ab6fc2ef10202d13568aba5d7633e88aa71e5
>> > removed some headers from sysroots and some packages (like IIRC udev)
>> > were failing to build until someone rebuilt linux-libc-headers manually
>> > to fixup staged headers in machine sysroot..
>>
>> I'm not following completely .. is that specific to the .3 in 3.4.x ?
>> Doesn't look
>> like it to me.
>
> No it's not specific to any version.. just before referenced patch there
> was e.g. ubi-user.h in sysroot "owned" by linux-libc-headers and
> mtd-utils recipe.
>
> That patch caused mtd-utils to be rebuilt and restaged again, but this
> time without ubi-user.h and IMHO this doesn't track that ubi-user.h
> is also "owned by linux-libc-headers recipe so we end without any
> ubi-user.h in sysroot until someone rebuilds linux-libc-headers to stage
> ubi-user.h again.
>
> Staging the same file from different recipes should imho show some
> warning or keep track of all "owners" so ubi-user.h is not removed
> unless someone cleansstate both mtd-utils and linux-libc-headers.

ok .. this is what I thought you meant. I'm not a packaging expert by any
stretch of the imagination, but I assume that someone bumping the PR or
PE of the libc-headers package but leaving it on 3.4 would have also fixed
this to not require manual intervention ?

Cheers,

Bruce

>
> Cheers,
>
>>
>> I don't recall Greg changing the mtd exports in 3.4.3 .. but that
>> wouldn't be the
>> first time something like that slipped in.
>>
>> Cheers,
>>
>> Bruce
>>
>> >
>> > Cheers,
>> >
>> >>
>> >> Sorry I missed this during the original review/posting.
>> >>
>> >> Cheers,
>> >>
>> >> Bruce
>> >>
>> >> >
>> >> > Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>> >> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> >> > ---
>> >> >  meta/conf/distro/include/tcmode-default.inc        |    2 +-
>> >> >  .../linux-libc-headers/linux-libc-headers_3.4.3.bb |    6 ++++++
>> >> >  .../linux-libc-headers/linux-libc-headers_3.4.bb   |    6 ------
>> >> >  3 files changed, 7 insertions(+), 7 deletions(-)
>> >> >  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
>> >> >  delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
>> >> >
>> >> > diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
>> >> > index f11e687..0a068be 100644
>> >> > --- a/meta/conf/distro/include/tcmode-default.inc
>> >> > +++ b/meta/conf/distro/include/tcmode-default.inc
>> >> > @@ -22,7 +22,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
>> >> >  BINUVERSION ?= "2.22"
>> >> >  EGLIBCVERSION ?= "2.15"
>> >> >  UCLIBCVERSION ?= "0.9.33"
>> >> > -LINUXLIBCVERSION ?= "3.4"
>> >> > +LINUXLIBCVERSION ?= "3.4.3"
>> >> >
>> >> >  PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
>> >> >  PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"
>> >> > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
>> >> > new file mode 100644
>> >> > index 0000000..6f8d9e8
>> >> > --- /dev/null
>> >> > +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
>> >> > @@ -0,0 +1,6 @@
>> >> > +require linux-libc-headers.inc
>> >> > +
>> >> > +PR = "r0"
>> >> > +
>> >> > +SRC_URI[md5sum] = "3aefa02db55715d627ed23a01667057d"
>> >> > +SRC_URI[sha256sum] = "17f1256daa289dde1a0a587c9753556d37a52770f7c4efcf2666fd4796a6eacc"
>> >> > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
>> >> > deleted file mode 100644
>> >> > index 9e8c88f..0000000
>> >> > --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
>> >> > +++ /dev/null
>> >> > @@ -1,6 +0,0 @@
>> >> > -require linux-libc-headers.inc
>> >> > -
>> >> > -PR = "r0"
>> >> > -
>> >> > -SRC_URI[md5sum] = "146af0160fc7a60cf9acf44aec13482b"
>> >> > -SRC_URI[sha256sum] = "a797a15d0b6228381507c14ecf4eec4a6cc5c77cfd521ba3b3e1325e85b5b16d"
>> >> > --
>> >> > 1.7.7.6
>> >> >
>> >> >
>> >> > _______________________________________________
>> >> > Openembedded-core mailing list
>> >> > Openembedded-core@lists.openembedded.org
>> >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >>
>> >>
>> >>
>> >> --
>> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> >> thee at its end"
>> >>
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >
>> > --
>> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >
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


