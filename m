Received: from mail-la0-f41.google.com ([209.85.215.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1UKpwg-0006yH-5d
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 13:59:14 +0100
Received: by mail-la0-f41.google.com with SMTP id fo12so15581723lab.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2013 05:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=IIV+YgPqWNY4B3eVPzw+BXwr95MKYvZ5ymb9MQOXG2w=;
	b=t4LZjcMMRW1yafXnHptpziSGUmQ/QEwrczhTZknuKs4E1lSfluQJGTM/9+yMVOPdMd
	zlXkctZK3BZFwTS1MVP1gWaeVnnJial3NtTmwAZS1kDLydOCZy5KLRL2ssCRr1hiAbID
	N1p7oM7WBemSuUukcMTvKiLheWcoagd9xShliuZ2nCx6i1FD2Mi1WEbe/4eJ5XTC98Fd
	o+dhtV8S2wl2ck3hKFfBc+j29MVlLmltfE9yHmvNOYwkRJyHfPK7/nceftEB4hvB8mxt
	o6cIlqWL5rTm9yYEElv+ysPhBkwB/AN3lzwC2seozHQBN5M8oUaz9t51+ozqpZ/xS9c4
	ZYZw==
MIME-Version: 1.0
X-Received: by 10.112.42.37 with SMTP id k5mr10126045lbl.49.1364388132462;
	Wed, 27 Mar 2013 05:42:12 -0700 (PDT)
Received: by 10.112.61.3 with HTTP; Wed, 27 Mar 2013 05:42:12 -0700 (PDT)
In-Reply-To: <CAEUf8FusP9QunJeVc-T81o4V_XT8kGkqtactZDC0+wqD04JFGg@mail.gmail.com>
References: <1363785756-35510-1-git-send-email-anders.roxell@gmail.com>
	<CADkTA4MZoRJp5gddPpkhKHkSXphettB=B4Fx=f0NPmtzfnGWGw@mail.gmail.com>
	<CAEUf8FtQUc-pTOMb=yYtcjjUF7F=0ytN=OT-Y2Am71+v_oJGnA@mail.gmail.com>
	<CADkTA4NitxAbPH-Nb=67ZwboTBFPUCMNXTQLMCYzQ2dL_On8hQ@mail.gmail.com>
	<CAEUf8FusP9QunJeVc-T81o4V_XT8kGkqtactZDC0+wqD04JFGg@mail.gmail.com>
Date: Wed, 27 Mar 2013 08:42:12 -0400
Message-ID: <CADkTA4NL6QnfEBNcRd7PnUU07_YOzfFjY6Ua-CfJqM0NNfToMw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Anders Roxell <anders.roxell@gmail.com>
Cc: Anders Roxell <anders.roxell@enea.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-kernel-base: linux/version.h path update for 3.7-rc1
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
X-List-Received-Date: Wed, 27 Mar 2013 12:59:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 27, 2013 at 5:25 AM, Anders Roxell <anders.roxell@gmail.com> wrote:
>
> On Wed, Mar 20, 2013 at 4:30 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>>
>> On Wed, Mar 20, 2013 at 10:55 AM, Anders Roxell <anders.roxell@gmail.com>
>> wrote:
>> >
>> >
>> >
>> > On Wed, Mar 20, 2013 at 2:42 PM, Bruce Ashfield
>> > <bruce.ashfield@gmail.com>
>> > wrote:
>> >>
>> >> On Wed, Mar 20, 2013 at 9:22 AM,  <anders.roxell@gmail.com> wrote:
>> >> > From: Anders Roxell <anders.roxell@enea.com>
>> >> >
>> >> > In mainline kernel 3.7-rc1 (hash:abbf1590de22a6d22)
>> >> > The path include/linux/version.h was updated to
>> >> > include/generated/uapi/linux/version.h
>> >>
>> >> It's true that uapi now holds the generated version.h, but what build
>> >> error were you seeing without this change in place ?
>> >
>> >
>> > We were trying to build linx
>> > (http://linx.sourceforge.net/linxdoc/doc/index.html)
>> > Please let me know if it is better to rewrite linx or include this
>> > patch?
>>
>> My concern is that as a list of alternatives builds up over time, that
>> don't
>> necessarily use the same format of the linux version, you'll end up with
>> applications that are making the wrong decisions if a fallback is used.
>> Having
>> a clear public / exported file, and throwing errors if it doesn't exist
>> would
>> ensure consistent behaviour (granted annoying if you get the error when
>> you
>> think you shouldn't).
>>
>> If you look at the code in get_kernelversion() it shouldn't even work if
>> version.h is used versus utsrelease.h.  I'd be inclined to suggest the
>> removal of the existing version.h fallback, versus adding another.
>>
>> You might not even need to modify the application code to fix this. What
>> are the dependencies of your recipe that would allow for utsrelease.h
>> to not be generated when the build calls get_kernelversion ?
>>
>
> Sorry for the late response!
> I agree with you that its better to use utsrelease.h rather than depending
> on version.h.
>
> We have added a patch for the linx source to solve this.
>
> Thank you very much for the help and support!

I was wondering about how this went a day or so ago .. and now I know.
Glad to hear it worked out!

Cheers,

Bruce

>
> With kind regards,
> Anders
>
>>
>> Cheers,
>>
>> Bruce
>>
>> >
>> > Regards,
>> > Anders
>> >
>> >>
>> >> utsrelease.h is
>> >> still created where it has been for some time, and should be what is
>> >> typically used for any version checks.
>> >>
>> >> Cheers,
>> >>
>> >> Bruce
>> >>
>> >>
>> >>
>> >> >
>> >> > Signed-off-by: Anders Roxell <anders.roxell@enea.com>
>> >> > ---
>> >> >  meta/classes/linux-kernel-base.bbclass |    3 +++
>> >> >  1 files changed, 3 insertions(+), 0 deletions(-)
>> >> >
>> >> > diff --git a/meta/classes/linux-kernel-base.bbclass
>> >> > b/meta/classes/linux-kernel-base.bbclass
>> >> > index 4f2b0a4..b7d0ffa 100644
>> >> > --- a/meta/classes/linux-kernel-base.bbclass
>> >> > +++ b/meta/classes/linux-kernel-base.bbclass
>> >> > @@ -8,6 +8,9 @@ def get_kernelversion(p):
>> >> >          fn = p + '/include/generated/utsrelease.h'
>> >> >      if not os.path.isfile(fn):
>> >> >          fn = p + '/include/linux/version.h'
>> >> > +    if not os.path.isfile(fn):
>> >> > +        # after 3.7-rc1
>> >> > +        fn = p + '/include/generated/uapi/linux/version.h'
>> >> >
>> >> >      import re
>> >> >      try:
>> >> > --
>> >> > 1.7.5.4
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
>> >
>> >
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>
>



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


