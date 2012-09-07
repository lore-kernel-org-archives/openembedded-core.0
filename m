Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1T9o8M-0002dN-2E
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 04:17:26 +0200
Received: by lagv3 with SMTP id v3so1522553lag.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 19:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=gegzWPpzfp7xzSiZo4snTaGAQKeDP5B+ZM4y8pcs1/w=;
	b=cAW1rKqlZ6YJG851W+YU66w9pu4r3YAcfn1IL0VJMHKLrbzEm292VbsY7OzhfPWIaN
	Dbb5xM84jJbRYFkZaUIGyngjGa7PxpXg+Qsg/jm0iGLy3KdiKHrskFKSJ0hwcSAhNja9
	qmlocghLE4Z6cI5DhGD1bMKnOzSRvHgtTlk0ZrurLBZsubeTQXwqyRminKcOFKK7Lk8d
	arGmhrEDrLBqC0gtIlitG34718C5GADnEAnk4B7LpC4B+gAOUzJ4ghiCZqtM2UQ80q0I
	zCxX0rfiEIDE6nRD1kDwScD38ctnxWE5CIJbu617mo9rL/6GjHi/k3deVseMgI7gcQTI
	PfbQ==
MIME-Version: 1.0
Received: by 10.152.46.203 with SMTP id x11mr3596595lam.46.1346983500775; Thu,
	06 Sep 2012 19:05:00 -0700 (PDT)
Received: by 10.114.68.20 with HTTP; Thu, 6 Sep 2012 19:05:00 -0700 (PDT)
In-Reply-To: <1346974360.7493.38.camel@ted>
References: <cover.1346956528.git.bruce.ashfield@windriver.com>
	<fb717d4aa26b125680f620254cde9eb97ef0708a.1346956528.git.bruce.ashfield@windriver.com>
	<1346969961.7493.24.camel@ted> <504921BD.4040004@windriver.com>
	<5049253B.4090402@windriver.com> <1346972362.7493.32.camel@ted>
	<50492CAF.3010203@windriver.com> <1346974360.7493.38.camel@ted>
Date: Thu, 6 Sep 2012 22:05:00 -0400
Message-ID: <CADkTA4PTVBYmNoRzwfgsgAhoBeY-nz5U568yKvMtEDsf8_Cnqg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] conf/tune: add tune-ppce300c3
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
X-List-Received-Date: Fri, 07 Sep 2012 02:17:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 6, 2012 at 7:32 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2012-09-06 at 18:07 -0500, Mark Hatle wrote:
>> On 9/6/12 5:59 PM, Richard Purdie wrote:
>> > On Thu, 2012-09-06 at 17:35 -0500, Mark Hatle wrote:
>> >> On 9/6/12 5:20 PM, Bruce Ashfield wrote:
>> >>> On 12-09-06 6:19 PM, Richard Purdie wrote:
>> >>>> On Thu, 2012-09-06 at 14:43 -0400, Bruce Ashfield wrote:
>> >>>>> It has been pointed out several times that the yocto mpc8315e-rdb
>> >>>>> reference was using the wrong tuning (603e), since it is actually
>> >>>>> a e300c3 board.
>> >>>>>
>> >>>>> This commit creates a e300c3 tune file based on the e300c2 variant
>> >>>>> already in oe-core.
>> >>>>>
>> >>>>> This commit also inhibits altivec in flac when this new tuning is
>> >>>>> enabled. It was also noticed that the existing tune based overrides
>> >>>>> in the flac package would not be triggered since DEFAULTTUNE is not
>> >>>>> in the overrides list. To avoid doing per-board disabling of altivec
>> >>>>> DEFAULTTUNE is added to the local package OVERRIDES and then used
>> >>>>> to disable altivec.
>> >>>>>
>> >>>>> [YOCTO #1192]
>> >>>>>
>> >>>>> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
>> >>>>>
>> >>>>> asdfkljds
>> >>>>> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
>> >>>>> ---
>> >>>>>     meta/conf/machine/include/tune-ppce300c3.inc |   11 +++++++++++
>> >>>>>     meta/recipes-multimedia/flac/flac_1.2.1.bb   |    5 +++++
>> >>>>>     2 files changed, 16 insertions(+), 0 deletions(-)
>> >>>>>     create mode 100644 meta/conf/machine/include/tune-ppce300c3.inc
>> >>>>>
>> >>>>> diff --git a/meta/conf/machine/include/tune-ppce300c3.inc b/meta/conf/machine/include/tune-ppce300c3.inc
>> >>>>> new file mode 100644
>> >>>>> index 0000000..3f5ac26
>> >>>>> --- /dev/null
>> >>>>> +++ b/meta/conf/machine/include/tune-ppce300c3.inc
>> >>>>> @@ -0,0 +1,11 @@
>> >>>>> +DEFAULTTUNE ?= "ppce300c3"
>> >>>>> +
>> >>>>> +require conf/machine/include/powerpc/arch-powerpc.inc
>> >>>>> +
>> >>>>> +TUNEVALID[ppce300c3] = "Enable ppce300c3 specific processor optimizations"
>> >>>>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3", "-mcpu=e300c3", "", d)}"
>> >>>>> +
>> >>>>> +AVAILTUNES += "ppce300c3"
>> >>>>> +TUNE_FEATURES_tune-ppce300c3 = "m32 fpu-soft ppce300c3"
>> >>>>> +TUNE_PKGARCH_tune-ppce300c3 = "ppce300c3"
>> >>>>> +PACKAGE_EXTRA_ARCHS_tune-ppce300c3 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppce300c3"
>> >>>>> diff --git a/meta/recipes-multimedia/flac/flac_1.2.1.bb b/meta/recipes-multimedia/flac/flac_1.2.1.bb
>> >>>>> index 3c5b73c..25db1c4 100644
>> >>>>> --- a/meta/recipes-multimedia/flac/flac_1.2.1.bb
>> >>>>> +++ b/meta/recipes-multimedia/flac/flac_1.2.1.bb
>> >>>>> @@ -36,9 +36,14 @@ EXTRA_OECONF = "--disable-oggtest --disable-id3libtest \
>> >>>>>                     --without-xmms-exec-prefix \
>> >>>>>                     --without-libiconv-prefix \
>> >>>>>                     --without-id3lib"
>> >>>>> +
>> >>>>> +FLACOVERRIDE = ":${DEFAULTTUNE}"
>> >>>>> +OVERRIDES .= "${FLACOVERRIDE}"
>> >>>>> +
>> >>>>>     EXTRA_OECONF_prepend_e500mc = "--disable-altivec "
>> >>>>>     EXTRA_OECONF_prepend_e5500 = "--disable-altivec "
>> >>>>>     EXTRA_OECONF_prepend_e5500-64b = "--disable-altivec "
>> >>>>> +EXTRA_OECONF_prepend_ppce300c3 = "--disable-altivec "
>> >>>>>
>> >>>>
>> >>>> This is getting ugly and is kind of unsafe. Perhaps the architecture
>> >>>> should be doing something like:
>> >>>>
>> >>>> MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3", ":noaltivec", "" ,d)}
>> >>>>
>> >>>> or even in this recipe just do:
>> >>>>
>> >>>> EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3", " --disable-altivec", "" ,d)}
>> >>>
>> >>> I definitely considered this route. I can do that for the new arch, and the
>> >>> old ones, but can't test the old ones at the moment.
>> >>
>> >> The problem is actually in the flac.  This recipe sees powerpc as the machine
>> >> type, and immediately enabled altivec.  By default altivec support is disabled
>> >> in OE-Core.
>> >>
>> >> Perhaps one way we could address this is add a tune flag that says if the tune
>> >> has altivec support or not.. then in the flac binary, disable it unless it's
>> >> enabled?
>> >
>> > I think having altivec in the tune_features would be ideal. I'd love to
>> > get this cleaned up too but I lack much knowledge about powerpc...
>>
>> My proposal then would be to accept Bruce's patch, with the understanding that
>> we need to add a tune flag of 'altivec' to the PowerPC tunings (where
>> appropriate) and then make the flac recipe respect that flag.
>>
>> Unfortunately I don't have the time to do that right now or I would.  Would an
>> enhancement bug in the Yocto Project bugzilla be enough to be sure the work is done?
>
> Please send something machine specific. Adding DEFAULTTUNE is a bad idea
> for several reasons, not least it might not be the selected tune.

Works for me, I'll just switch in the rdb and send another update then when the
patch is fixed.

Bruce

>
> I took Matthew's original patch on the understanding this gets fixed and
> it hasn't happened but please do file the request.
>
> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


